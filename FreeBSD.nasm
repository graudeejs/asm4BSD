; "THE BEER-WARE LICENSE":
; <aldis@bsdroot.lv> wrote this file. As long as you retain this notice you
; can do whatever you want with this stuff. If we meet some day, and you think
; this stuff is worth it, you can buy me a beer in return. Aldis Berjoza

; For info howto call syscalls on FreeBSD read:
; http://www.int80h.org/bsdasm/

;================= SYSCALLS ============================
; based on /usr/src/sys/kern/syscalls.master (FreeBSD-8.1-RELEASE)
; Using macros _COMPAT_ _COMPATn_ where n is number _NOSTD_
;=======================================================
	;SYS_NOSYS			= 0	; int nosys(void)
	SYS_EXIT			= 1   ; void sys_exit(int rval)
	SYS_FORK			= 2   ; int fork(void)
	SYS_READ			= 3   ; ssize_t read(int fd, void *buf, size_t nbyte)
	SYS_WRITE			= 4   ; ssize_t write(int fd, const void *buf, size_t nbyte)
	SYS_OPEN			= 5   ; int open(char *path, int flags, int mode)
	SYS_CLOSE			= 6   ; int close(int fd)
	SYS_WAIT4			= 7   ; int wait4(int pid, int *status, int options, struct rusage *rusage)
%ifdef _COMPAT_
	SYS_CREAT			= 8   ; int creat(char *path, int mode)
%endif
	SYS_LINK			= 9   ; int link(char *path, char *link)
	SYS_UNLINK			= 10  ; int unlink(char *path)
	;SYS_EXECV			= 11  ; OBSOLETE
	SYS_CHDIR			= 12  ; int chdir(char *path)
	SYS_FCHDIR			= 13  ; int fchdir(int fd)
	SYS_MKNOD			= 14  ; int mknod(char *path, int mode, int dev)
	SYS_CHMOD			= 15  ; int chmod(char *path, int mode)
	SYS_CHOWN			= 16  ; int chown(char *path, int uid, int gid)
	SYS_OBREAK			= 17  ; int obreak(char *nsize)
%ifdef _COMPAT_4
	SYS_GETFSSTAT			= 18  ; int getfsstat(struct ostatfs *buf, long bufsize, int flags)
%endif
%ifdef _COMPAT_
	SYS_LSEEK			= 19  ; long lseek(int fd, long offset, int whence)
%endif
	SYS_GETPID			= 20  ; pid_t getpid(void)
	SYS_MOUNT			= 21  ; int mount(char *type, char *path, int flags, caddr_t data)
	SYS_UNMOUNT			= 22  ; int unmount(char *path, int flags)
	SYS_SETUID			= 23  ; int setuid(uid_t uid)
	SYS_GETUID			= 24  ; uid_t getuid(void)
	SYS_GETEUID			= 25  ; uid_t geteuid(void)
	SYS_PTRACE			= 26  ; int ptrace(int req, pid_t pid, caddr_t addr, int data)
	SYS_RECVMSG			= 27  ; int recvmsg(int s, struct msghdr *msg, int flags)
	SYS_SENDMSG			= 28  ; int sendmsg(int s, struct msghdr *msg, int flags)
	SYS_RECVFROM			= 29  ; int recvfrom(int s, caddr_t buf, size_t len, int flags, struct sockaddr * __restrict from, __socklen_t * __restrict fromlenaddr)
	SYS_ACCEPT			= 30  ; int accept(int s, struct sockaddr * __restrict name, __socklen_t * __restrict anamelen)
	SYS_GETPEERNAME			= 31  ; int getpeername(int fdes, struct sockaddr * __restrict asa, __socklen_t * __restrict alen)
	SYS_GETSOCKNAME			= 32  ; int getsockname(int fdes, struct sockaddr * __restrict asa, __socklen_t * __restrict alen)
	SYS_ACCESS			= 33  ; int access(char *path, int flags)
	SYS_CHFLAGS			= 34  ; int chflags(char *path, int flags)
	SYS_FCHFLAGS			= 35  ; int fchflags(int fd, int flags)
	SYS_SYNC			= 36  ; int sync(void)
	SYS_KILL			= 37  ; int kill(int pid, int signum)
%ifdef _COMPAT_
	SYS_STAT			= 38  ; int stat(char *path, struct ostat *ub)
%endif
	SYS_GETPPID			= 39  ; pid_t getppid(void)
%ifdef _COMPAT_
	SYS_LSTAT			= 40  ; int lstat(char *path, struct ostat *ub)
%endif
	SYS_DUP				= 41  ; int dup(u_int fd)
	SYS_PIPE			= 42  ; int pipe(void)
	SYS_GETEGID			= 43  ; gid_t getegid(void)
	SYS_PROFIL			= 44  ; int profil(caddr_t samples, size_t size, size_t offset, u_int scale)
	SYS_KTRACE			= 45  ; int ktrace(const char *fname, int ops, int facs, int pid)
%ifdef _COMPAT_
	SYS_SIGACTION			= 46  ; int sigaction(int signum, struct osigaction *nsa, struct osigaction *osa)
%endif
	SYS_GETGID			= 47  ; gid_t getgid(void)
%ifdef _COMPAT_
	SYS_SIGPROCMASK			= 48  ; int sigprocmask(int how, osigset_t mask)
%endif
	SYS_GETLOGIN			= 49  ; int getlogin(char *namebuf, u_int namelen)
	SYS_SETLOGIN			= 50  ; int setlogin(char *namebuf)
	SYS_ACCT			= 51  ; int acct(char *path)
%ifdef _COMPAT_
	SYS_SIGPENDING			= 52  ; int sigpending(void)
%endif
	SYS_SIGALTSTACK			= 53  ; int sigaltstack(stack_t *ss, stack_t *oss)
	SYS_IOCTL			= 54  ; int ioctl(int fd, u_long com, caddr_t data)
	SYS_REBOOT			= 55  ; int reboot(int opt)
	SYS_REVOKE			= 56  ; int revoke(char *path)
	SYS_SYMLINK			= 57  ; int symlink(char *path, char *link)
	SYS_READLINK			= 58  ; ssize_t readlink(char *path, char *buf, size_t count)
	SYS_EXECVE			= 59  ; int execve(char *fname, char **argv, char **envv)
	SYS_UMASK			= 60  ; int umask(int newmask)
	SYS_CHROOT			= 61  ; int chroot(char *path)
%ifdef _COMPAT_
	SYS_FSTAT			= 62  ; int fstat(int fd, struct ostat *sb)
	SYS_GETKERNINFO			= 63  ; int getkerninfo(int op, char *where, size_t *size, int arg)
	SYS_GETPAGESIZE			= 64  ; int getpagesize(void)
%endif
	SYS_MSYNC			= 65  ; int msync(void *addr, size_t len, int flags)
	SYS_VFORK			= 66  ; int vfork(void)
	;SYS_VREAD			= 67  ; OBSOLETE
	;SYS_VWRITE			= 68  ; OBSOLETE
	SYS_SBRK			= 69  ; int sbrk(int incr)
	SYS_SSTK			= 70  ; int sstk(int incr)
%ifdef _COMPAT_
	SYS_MMAP			= 71  ; int mmap(void *addr, int len, int prot, int flags, int fd, long pos)
%endif
	SYS_OVADVISE			= 72  ; int ovadvise(int anom)
	SYS_MUNMAP			= 73  ; int munmap(void *addr, size_t len)
	SYS_MPROTECT			= 74  ; int mprotect(const void *addr, size_t len, int prot)
	SYS_MADVISE			= 75  ; int madvise(void *addr, size_t len, int behav)
	;SYS_VHANGUP			= 76  ; OBSOLETE
	;SYS_VLIMIT			= 77  ; OBSOLETE
	SYS_MINCORE			= 78  ; int mincore(const void *addr, size_t len, char *vec)
	SYS_GETGROUPS			= 79  ; int getgroups(u_int gidsetsize, gid_t *gidset)
	SYS_SETGROUPS			= 80  ; int setgroups(u_int gidsetsize, gid_t *gidset)
	SYS_GETPGRP			= 81  ; int getpgrp(void)
	SYS_SETPGID			= 82  ; int setpgid(int pid, int pgid)
	SYS_SETITIMER			= 83  ; int setitimer(u_int which, struct itimerval *itv, struct itimerval *oitv)
%ifdef _COMPAT_
	SYS_WAIT			= 84  ; int wait(void)
%endif
	SYS_SWAPON			= 85  ; int swapon(char *name)
	SYS_GETITIMER			= 86  ; int getitimer(u_int which, struct itimerval *itv)
%ifdef _COMPAT_
	SYS_GETHOSTNAME			= 87  ; int gethostname(char *hostname, u_int len)
	SYS_SETHOSTNAME			= 88  ; int sethostname(char *hostname, u_int len)
%endif
	SYS_GETDTABLESIZE		= 89  ; int getdtablesize(void)
	SYS_DUP2			= 90  ; int dup2(u_int from, u_int to)
	;SYS_GETDOPT			= 91  ; UNIMPLEMENTED
	SYS_FCNTL			= 92  ; int fcntl(int fd, int cmd, long arg)
	SYS_SELECT			= 93  ; int select(int nd, fd_set *in, fd_set *ou, fd_set *ex, struct timeval *tv)
	;SYS_SETDOPT			= 94  ; UNIMPLEMENTED
	SYS_FSYNC			= 95  ; int fsync(int fd)
	SYS_SETPRIORITY			= 96  ; int setpriority(int which, int who, int prio)
	SYS_SOCKET			= 97  ; int socket(int domain, int type, int protocol)
	SYS_CONNECT			= 98  ; int connect(int s, caddr_t name, int namelen)
%ifdef _COMPAT_
	SYS_ACCEPT			= 99  ; int accept(int s, caddr_t name, int *anamelen)
%endif
	SYS_GETPRIORITY			= 100 ; int getpriority(int which, int who)
%ifdef _COMPAT_
	SYS_SEND			= 101 ; int send(int s, caddr_t buf, int len, int flags)
	SYS_RECV			= 102 ; int recv(int s, caddr_t buf, int len, int flags)
	SYS_SIGRETURN			= 103 ; int sigreturn( struct osigcontext *sigcntxp)
%endif
	SYS_BIND			= 104 ; int bind(int s, caddr_t name, int namelen)
	SYS_SETSOCKOPT			= 105 ; int setsockopt(int s, int level, int name, caddr_t val, int valsize)
	SYS_LISTEN			= 106 ; int listen(int s, int backlog)
	;SYS_VTIMES			= 107 ; OBSOLETE
%ifdef _COMPAT_
	SYS_SIGVEC			= 108 ; int sigvec(int signum, struct sigvec *nsv, struct sigvec *osv)
	SYS_SIGBLOCK			= 109 ; int sigblock(int mask)
	SYS_SIGSETMASK			= 110 ; int sigsetmask(int mask)
	SYS_SIGSUSPEND			= 111 ; int sigsuspend(osigset_t mask)
	SYS_SIGSTACK			= 112 ; int sigstack(struct sigstack *nss, struct sigstack *oss)
	SYS_RECVMSG			= 113 ; int recvmsg(int s, struct omsghdr *msg, int flags)
	SYS_SENDMSG			= 114 ; int sendmsg(int s, caddr_t msg, int flags)
%endif
	;SYS_VTRACE			= 115 ; OBSOLETE
	SYS_GETTIMEOFDAY		= 116 ; int gettimeofday(struct timeval *tp, struct timezone *tzp)
	SYS_GETRUSAGE			= 117 ; int getrusage(int who, struct rusage *rusage)
	SYS_GETSOCKOPT			= 118 ; int getsockopt(int s, int level, int name, caddr_t val, int *avalsize)
	;SYS_RESUBA			= 119 ; UNIMPLEMENTED
	SYS_READV			= 120 ; int readv(int fd, struct iovec *iovp, u_int iovcnt)
	SYS_WRITEV			= 121 ; int writev(int fd, struct iovec *iovp, u_int iovcnt)
	SYS_SETTIMEOFDAY		= 122 ; int settimeofday(struct timeval *tv, struct timezone *tzp)
	SYS_FCHOWN			= 123 ; int fchown(int fd, int uid, int gid)
	SYS_FCHMOD			= 124 ; int fchmod(int fd, int mode)
%ifdef _COMPAT_
	SYS_RECVFROM			= 125 ; int recvfrom(int s, caddr_t buf, size_t len, int flags, caddr_t from, int *fromlenaddr)
%endif
	SYS_SETREUID			= 126 ; int setreuid(int ruid, int euid)
	SYS_SETREGID			= 127 ; int setregid(int rgid, int egid)
	SYS_RENAME			= 128 ; int rename(char *from, char *to)
%ifdef _COMPAT_
	SYS_TRUNCATE			= 129 ; int truncate(char *path, long length)
	SYS_FTRUNCATE			= 130 ; int ftruncate(int fd, long lengt);						OLD. use new one 201
%endif
	SYS_FLOCK			= 131 ; int flock(int fd, int how)
	SYS_MKFIFO			= 132 ; int mkfifo(char *path, int mode)
	SYS_SENDTO			= 133 ; int sendto(int s, caddr_t buf, size_t len, int flags, caddr_t to, int tolen)
	SYS_SHUTDOWN			= 134 ; int shutdown(int s, int how)
	SYS_SOCKETPAIR			= 135 ; int socketpair(int domain, int type, int protocol, int *rsv)
	SYS_MKDIR			= 136 ; int mkdir(char *path, int mode)
	SYS_RMDIR			= 137 ; int rmdir(char *path)
	SYS_UTIMES			= 138 ; int utimes(char *path, struct timeval *tptr)
	;SYS_SIGRETURN			= 139 ; OBSOLETE
	SYS_ADJTIME			= 140 ; int adjtime(struct timeval *delta, struct timeval *olddelta)
%ifdef _COMPAT_
	SYS_GETPEERNAME			= 141 ; int getpeername(int fdes, caddr_t asa, int *alen)
	SYS_GETHOSTID			= 142 ; long gethostid(void)
	SYS_SETHOSTID			= 143 ; int sethostid(long hostid)
	SYS_GETRLIMIT			= 144 ; int getrlimit(u_int which, struct orlimit *rlp)
	SYS_SETRLIMIT			= 145 ; int setrlimit(u_int which, struct orlimit *rlp)
	SYS_KILLPG			= 146 ; int killpg(int pgid, int signum)
%endif
	SYS_SETSID			= 147 ; int setsid(void)
	SYS_QUOTACTL			= 148 ; int quotactl(char *path, int cmd, int uid, caddr_t arg)
%ifdef _COMPAT_
	SYS_QUOTA			= 149 ; int quota(void)
	SYS_GETSOCKNAME			= 150 ; int getsockname(int fdec, caddr_t asa, int *alen)
%endif
	;SYS_SEM_LOCK			= 151 ; UNIMPLEMENTED
	;SYS_SEM_WAKEUP			= 152 ; UNIMPLEMENTED
	;SYS_ASYNCDAEMON		= 153 ; UNIMPLEMENTED
%ifdef _NOSTD_
	SYS_NLM_SYSCALL			= 154 ; int nlm_syscall(int debug_level, int grace_period, int addr_count, char **addrs)
	SYS_NFSSVC			= 155 ; int nfssvc(int flag, caddr_t argp)
%endif
%ifdef _COMPAT_
	SYS_GETDIRENTRIES		= 156 ; int getdirentries(int fd, char *buf, u_int count, long *basep)
%endif
%ifdef _COMPAT4_
	SYS_STATFS			= 157 ; int statfs(char *path, struct ostatfs *buf)
	SYS_FSTATFS			= 158 ; int fstatfs(int fd, struct ostatfs *buf)
%endif
	;SYS_NOSYS			= 159 ; UNIMPLEMENTED
	SYS_LGETFH			= 160 ; int lgetfh(char *fname, struct fhandle *fhp)
	SYS_GETFH			= 161 ; int getfh(char *fname, struct fhandle *fhp)
%ifdef _COMPAT4_
	SYS_GETDOMAINNAME		= 162 ; int getdomainname(char *domainname, int len)
	SYS_SETDOMAINNAME		= 163 ; int setdomainname(char *domainname, int len)
	SYS_UNAME			= 164 ; int uname(struct utsname *name)
%endif
	SYS_SYSARCH			= 165 ; int sysarch(int op, char *parms)
	SYS_RTPRIO			= 166 ; int rtprio(int function, pid_t pid, struct rtprio *rtp)
	;SYS_NOSYS			= 167 ; UNIMPLEMENTED
	;SYS_NOSYS			= 168 ; UNIMPLEMENTED
%ifdef _NOSTD_
	SYS_SEMSYS			= 169 ; int semsys(int which, int a2, int a3, int a4, int a5)
	SYS_MSGSYS			= 170 ; int msgsys(int which, int a2, int a3, int a4, int a5, int a6)
	SYS_SHMSYS			= 171 ; int shmsys(int which, int a2, int a3, int a4)
%endif
	;SYS_NOSYS			= 172 ; UNIMPLEMENTED
	SYS_FREEBSD6_PREAD		= 173 ; ssize_t freebsd6_pread(int fd, void *buf, size_t nbyte, int pad, off_t offset)
	SYS_FREEBSD6_PWRITE		= 174 ; ssize_t freebsd6_pwrite(int fd, const void *buf, size_t nbyte, int pad, off_t offset)
	SYS_SETFIB			= 175 ; int setfib(int fibnum)
	SYS_NTP_ADJTIME			= 176 ; int ntp_adjtime(struct timex *tp)
	;SYS_SFORK			= 177 ; UNIMPLEMENTED
	;SYS_GETDESCRIPTOR		= 178 ; UNIMPLEMENTED
	;SYS_SETDESCRIPTOR		= 179 ; UNIMPLEMENTED
	;SYS_NOSYS			= 180 ; UNIMPLEMENTED
	SYS_SETGID			= 181 ; int setgid(gid_t gid)
	SYS_SETEGID			= 182 ; int setegid(gid_t egid)
	SYS_SETEUID			= 183 ; int seteuid(uid_t euid)
	;SYS_LFS_BMAPV			= 184 ; UNIMPLEMENTED
	;SYS_LFS_MARKV			= 185 ; UNIMPLEMENTED
	;SYS_LFS_SEGCLEAN		= 186 ; UNIMPLEMENTED
	;SYS_LFS_SEGWAIT		= 187 ; UNIMPLEMENTED
	SYS_STAT			= 188 ; int stat(char *path, struct stat *ub)
	SYS_FSTAT			= 189 ; int fstat(int fd, struct stat *sb)
	SYS_LSTAT			= 190 ; int lstat(char *path, struct stat *ub)
	SYS_PATHCONF			= 191 ; int pathconf(char *path, int name)
	SYS_FPATHCONF			= 192 ; int fpathconf(int fd, int name)
	;SYS_NOSYS			= 193 ; UNIMPLEMENTED
	SYS_GETRLIMIT			= 194 ; int getrlimit(u_int which, struct rlimit *rlp)
	SYS_SETRLIMIT			= 195 ; int setrlimit(u_int which, struct rlimit *rlp)
	SYS_GETDIRENTRIES		= 196 ; int getdirentries(int fd, char *buf, u_int count, long *basep)
	SYS_FREEBSD6_MMAP		= 197 ; caddr_t freebsd6_mmap(caddr_t addr, size_t len, int prot, int flags, int fd, int pad, off_t pos)
	;SYS_NOSYS			= 198 ; int nosys(void) ??????
	SYS_FREEBSD6_LSEEK		= 199 ; off_t freebsd6_lseek(int fd, int pad, off_t offset, int whence)
	SYS_FREEBSD6_TRUNCATE		= 200 ; int freebsd6_truncate(char *path, int pad, off_t length)
	SYS_FREEBSD6_FTRUNCATE		= 201 ; int freebsd6_ftruncate(int fd, int pad, off_t length)
	SYS___SYSCTL			= 202 ; int __sysctl(int *name, u_int namelen, void *old, size_t *oldlenp, void *new, size_t newlen)
	SYS_MLOCK			= 203 ; int mlock(const void *addr, size_t len)
	SYS_MUNLOCK			= 204 ; int munlock(const void *addr, size_t len)
	SYS_UNDELETE			= 205 ; int undelete(char *path)
	SYS_FUTIMES			= 206 ; int futimes(int fd, struct timeval *tptr)
	SYS_GETPGID			= 207 ; int getpgid(pid_t pid)
	;SYS_NEWREBOOT			= 208 ; UNIMPLEMENTED
	SYS_POLL			= 209 ; int poll(struct pollfd *fds, u_int nfds, 
	;SYS_?				= 210 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 211 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 212 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 213 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 214 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 215 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 216 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 217 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 218 ; NODEF	lkmnosys lkmnosys nosys_args int
	;SYS_?				= 219 ; NODEF	lkmnosys lkmnosys nosys_args int
%ifdef _COMPAT7_
	SYS___SEMCTL			= 220 ; int __semctl(int semid, int semnum, int cmd, union semun_old *arg)
%elifdef _NOSTD_
	SYS___SEMCTL			= 220 ; int __semctl(int semid, int semnum, int cmd, union semun_old *arg)
%endif
%ifdef _NOSTD_
	SYS_SEMGET			= 221 ; int semget(key_t key, int nsems, int semflg)
	SYS_SEMOP			= 222 ; int semop(int semid, struct sembuf *sops, size_t nsops)
%endif
	;SYS_SEMCONFIG			= 223 ; UNIMPLEMENTED
%ifdef _COMPAT7_
	SYS_MSGCTL			= 224 ; int msgctl(int msqid, int cmd, struct msqid_ds_old *buf)
%elifdef _NOSTD_
	SYS_MSGCTL			= 224 ; int msgctl(int msqid, int cmd, struct msqid_ds_old *buf)
%endif
%ifdef NOSTD
	SYS_MSGGET			= 225 ; int msgget(key_t key, int msgflg)
	SYS_MSGSND			= 226 ; int msgsnd(int msqid, const void *msgp, size_t msgsz, int msgflg)
	SYS_MSGRCV			= 227 ; int msgrcv(int msqid, void *msgp, size_t msgsz, long msgtyp, int msgflg)
	SYS_SHMAT			= 228 ; int shmat(int shmid, const void *shmaddr, int shmflg)
%endif
%ifdef _COMPAT7_
	SYS_SHMCTL			= 229 ; int shmctl(int shmid, int cmd, struct shmid_ds_old *buf)
%elifdef _NOSTD_
	SYS_SHMCTL			= 229 ; int shmctl(int shmid, int cmd, struct shmid_ds_old *buf)
%endif
%ifdef _NOSTD_
	SYS_SHMDT			= 230 ; int shmdt(const void *shmaddr)
	SYS_SHMGET			= 231 ; int shmget(key_t key, size_t size, int shmflg)
%endif
	SYS_CLOCK_GETTIME		= 232 ; int clock_gettime(clockid_t clock_id, struct timespec *tp)
	SYS_CLOCK_SETTIME		= 233 ; int clock_settime( clockid_t clock_id, const struct timespec *tp)
	SYS_CLOCK_GETRES		= 234 ; int clock_getres(clockid_t clock_id, struct timespec *tp)
	SYS_KTIMER_CREATE		= 235 ; int ktimer_create(clockid_t clock_id, struct sigevent *evp, int *timerid)
	SYS_KTIMER_DELETE		= 236 ; int ktimer_delete(int timerid)
	SYS_KTIMER_SETTIME		= 237 ; int ktimer_settime(int timerid, int flags, const struct itimerspec *value, struct itimerspec *ovalue)
	SYS_KTIMER_GETTIME		= 238 ; int ktimer_gettime(int timerid, struct itimerspec *value)
	SYS_KTIMER_GETOVERRUN		= 239 ; int ktimer_getoverrun(int timerid)
	SYS_NANOSLEEP			= 240 ; int nanosleep(const struct timespec *rqtp, struct timespec *rmtp)
	;SYS_NOSYS			= 241 ; UNIMPLEMENTED
	;SYS_NOSYS			= 242 ; UNIMPLEMENTED
	;SYS_NOSYS			= 243 ; UNIMPLEMENTED
	;SYS_NOSYS			= 244 ; UNIMPLEMENTED
	;SYS_NOSYS			= 245 ; UNIMPLEMENTED
	;SYS_NOSYS			= 246 ; UNIMPLEMENTED
	;SYS_NOSYS			= 247 ; UNIMPLEMENTED
	SYS_NTP_GETTIME			= 248 ; int ntp_gettime(struct ntptimeval *ntvp)
	;SYS_NOSYS			= 249 ; UNIMPLEMENTED
	SYS_MINHERIT			= 250 ; int minherit(void *addr, size_t len, int inherit)
	SYS_RFORK			= 251 ; int rfork(int flags)
	SYS_OPENBSD_POLL		= 252 ; int openbsd_poll(struct pollfd *fds, u_int nfds, int timeout)
	SYS_ISSETUGID			= 253 ; int issetugid(void)
	SYS_LCHOWN			= 254 ; int lchown(char *path, int uid, int gid)
%ifdef _NOSTD_
	SYS_AIO_READ			= 255 ; int aio_read(struct aiocb *aiocbp)
	SYS_AIO_WRITE			= 256 ; int aio_write(struct aiocb *aiocbp)
	SYS_LIO_LISTIO			= 257 ; int lio_listio(int mode, struct aiocb * const *acb_list, int nent, struct sigevent *sig)
%endif
	;SYS_NOSYS			= 258 ; UNIMPLEMENTED
	;SYS_NOSYS			= 259 ; UNIMPLEMENTED
	;SYS_NOSYS			= 260 ; UNIMPLEMENTED
	;SYS_NOSYS			= 261 ; UNIMPLEMENTED
	;SYS_NOSYS			= 262 ; UNIMPLEMENTED
	;SYS_NOSYS			= 263 ; UNIMPLEMENTED
	;SYS_NOSYS			= 264 ; UNIMPLEMENTED
	;SYS_NOSYS			= 265 ; UNIMPLEMENTED
	;SYS_NOSYS			= 266 ; UNIMPLEMENTED
	;SYS_NOSYS			= 267 ; UNIMPLEMENTED
	;SYS_NOSYS			= 268 ; UNIMPLEMENTED
	;SYS_NOSYS			= 269 ; UNIMPLEMENTED
	;SYS_NOSYS			= 270 ; UNIMPLEMENTED
	;SYS_NOSYS			= 271 ; UNIMPLEMENTED
	SYS_GETDENTS			= 272 ; int getdents(int fd, char *buf, size_t count)
	;SYS_NOSYS			= 273 ; UNIMPLEMENTED
	SYS_LCHMOD			= 274 ; int lchmod(char *path, mode_t mode)
	;SYS_LCHOWN			= 275 ; int lchown(char *path, uid_t uid, gid_t gid) ; NOPROTO
	SYS_LUTIMES			= 276 ; int lutimes(char *path, struct timeval *tptr)
	;SYS_MSYNC			= 277 ; int msync(void *addr, size_t len, int flags) ; NOPROTO
	SYS_NSTAT			= 278 ; int nstat(char *path, struct nstat *ub)
	SYS_NFSTAT			= 279 ; int nfstat(int fd, struct nstat *sb)
	SYS_NLSTAT			= 280 ; int nlstat(char *path, struct nstat *ub)
	;SYS_NOSYS			= 281 ; UNIMPLEMENTED
	;SYS_NOSYS			= 282 ; UNIMPLEMENTED
	;SYS_NOSYS			= 283 ; UNIMPLEMENTED
	;SYS_NOSYS			= 284 ; UNIMPLEMENTED
	;SYS_NOSYS			= 285 ; UNIMPLEMENTED
	;SYS_NOSYS			= 286 ; UNIMPLEMENTED
	;SYS_NOSYS			= 287 ; UNIMPLEMENTED
	;SYS_NOSYS			= 288 ; UNIMPLEMENTED
	SYS_PREADV			= 289 ; ssize_t preadv(int fd, struct iovec *iovp, u_int iovcnt, off_t offset)
	SYS_PWRITEV			= 290 ; ssize_t pwritev(int fd, struct iovec *iovp, u_int iovcnt, off_t offset)
	;SYS_NOSYS			= 291 ; UNIMPLEMENTED
	;SYS_NOSYS			= 292 ; UNIMPLEMENTED
	;SYS_NOSYS			= 293 ; UNIMPLEMENTED
	;SYS_NOSYS			= 294 ; UNIMPLEMENTED
	;SYS_NOSYS			= 295 ; UNIMPLEMENTED
	;SYS_NOSYS			= 296 ; UNIMPLEMENTED
%ifdef _COMPAT4_
	SYS_FHSTATFS			= 297 ; int fhstatfs( const struct fhandle *u_fhp, struct ostatfs *buf)
%endif
	SYS_FHOPEN			= 298 ; int fhopen(const struct fhandle *u_fhp, int flags)
	SYS_FHSTAT			= 299 ; int fhstat(const struct fhandle *u_fhp, struct stat *sb)
	SYS_MODNEXT			= 300 ; int modnext(int modid)
	SYS_MODSTAT			= 301 ; int modstat(int modid, struct module_stat *stat)
	SYS_MODFNEXT			= 302 ; int modfnext(int modid)
	SYS_MODFIND			= 303 ; int modfind(const char *name)
	SYS_KLDLOAD			= 304 ; int kldload(const char *file)
	SYS_KLDUNLOAD			= 305 ; int kldunload(int fileid)
	SYS_KLDFIND			= 306 ; int kldfind(const char *file)
	SYS_KLDNEXT			= 307 ; int kldnext(int fileid)
	SYS_KLDSTAT			= 308 ; int kldstat(int fileid, struct kld_file_stat* stat)
	SYS_KLDFIRSTMOD			= 309 ; int kldfirstmod(int fileid)
	SYS_GETSID			= 310 ; int getsid(pid_t pid)
	SYS_SETRESUID			= 311 ; int setresuid(uid_t ruid, uid_t euid, uid_t suid)
	SYS_SETRESGID			= 312 ; int setresgid(gid_t rgid, gid_t egid, gid_t sgid)
	;SYS_SIGNANOSLEEP		= 313 ; OBSOLETE
	SYS_AIO_RETURN			= 314 ; int aio_return(struct aiocb *aiocbp)
	SYS_AIO_SUSPEND			= 315 ; int aio_suspend( struct aiocb * const * aiocbp, int nent, const struct timespec *timeout)
	SYS_AIO_CANCEL			= 316 ; int aio_cancel(int fd, struct aiocb *aiocbp)
	SYS_AIO_ERROR			= 317 ; int aio_error(struct aiocb *aiocbp)
	SYS_OAIO_READ			= 318 ; int oaio_read(struct oaiocb *aiocbp)
	SYS_OAIO_WRITE			= 319 ; int oaio_write(struct oaiocb *aiocbp)
	SYS_OLIO_LISTIO			= 320 ; int olio_listio(int mode, struct oaiocb * const *acb_list, int nent, struct osigevent *sig)
	SYS_YIELD			= 321 ; int yield(void)
	;SYS_THR_SLEEP			= 322 ; OBSOLETE
	;SYS_THR_WAKEUP			= 323 ; OBSOLETE
	SYS_MLOCKALL			= 324 ; int mlockall(int how)
	SYS_MUNLOCKALL			= 325 ; int munlockall(void)
	SYS___GETCWD			= 326 ; int __getcwd(u_char *buf, u_int buflen)
	SYS_SCHED_SETPARAM		= 327 ; int sched_setparam (pid_t pid, const struct sched_param *param)
	SYS_SCHED_GETPARAM		= 328 ; int sched_getparam (pid_t pid, struct sched_param *param)
	SYS_SCHED_SETSCHEDULER		= 329 ; int sched_setscheduler (pid_t pid, int policy, const struct sched_param *param)
	SYS_SCHED_GETSCHEDULER		= 330 ; int sched_getscheduler (pid_t pid)
	SYS_SCHED_YIELD			= 331 ; int sched_yield (void)
	SYS_SCHED_GET_PRIORITY_MAX	= 332 ; int sched_get_priority_max (int policy)
	SYS_SCHED_GET_PRIORITY_MIN	= 333 ; int sched_get_priority_min (int policy)
	SYS_SCHED_RR_GET_INTERVAL	= 334 ; int sched_rr_get_interval (pid_t pid, struct timespec *interval)
	SYS_UTRACE			= 335 ; int utrace(const void *addr, size_t len)
%ifdef _COMPAT4_
	SYS_SENDFILE			= 336 ; int sendfile(int fd, int s, off_t offset, size_t nbytes, struct sf_hdtr *hdtr, off_t *sbytes, int flags)
%endif
	SYS_KLDSYM			= 337 ; int kldsym(int fileid, int cmd, void *data)
	SYS_JAIL			= 338 ; int jail(struct jail *jail)
	;SYS_PIOCTL			= 339 ; UNIMPLEMENTED
	SYS_SIGPROCMASK			= 340 ; int sigprocmask(int how, const sigset_t *set, sigset_t *oset)
	SYS_SIGSUSPEND			= 341 ; int sigsuspend(const sigset_t *sigmask)
%ifdef _COMPAT4_
	SYS_SIGACTION			= 342 ; int sigaction(int sig, const struct sigaction *act, struct sigaction *oact)
%endif
	SYS_SIGPENDING			= 343 ; int sigpending(sigset_t *set)
%ifdef _COMPAT4_
	SYS_SIGRETURN			= 344 ; int sigreturn( const struct ucontext4 *sigcntxp)
%endif
	SYS_SIGTIMEDWAIT		= 345 ; int sigtimedwait(const sigset_t *set, siginfo_t *info, const struct timespec *timeout)
	SYS_SIGWAITINFO			= 346 ; int sigwaitinfo(const sigset_t *set, siginfo_t *info)
	SYS___ACL_GET_FILE		= 347 ; int __acl_get_file(const char *path, acl_type_t type, struct acl *aclp)
	SYS___ACL_SET_FILE		= 348 ; int __acl_set_file(const char *path, acl_type_t type, struct acl *aclp)
	SYS___ACL_GET_FD		= 349 ; int __acl_get_fd(int filedes, acl_type_t type, struct acl *aclp)
	SYS___ACL_SET_FD		= 350 ; int __acl_set_fd(int filedes, acl_type_t type, struct acl *aclp)
	SYS___ACL_DELETE_FILE		= 351 ; int __acl_delete_file(const char *path, acl_type_t type)
	SYS___ACL_DELETE_FD		= 352 ; int __acl_delete_fd(int filedes, acl_type_t type)
	SYS___ACL_ACLCHECK_FILE		= 353 ; int __acl_aclcheck_file(const char *path, acl_type_t type, struct acl *aclp)
	SYS___ACL_ACLCHECK_FD		= 354 ; int __acl_aclcheck_fd(int filedes, acl_type_t type, struct acl *aclp)
	SYS_EXTATTRCTL			= 355 ; int extattrctl(const char *path, int cmd, const char *filename, int attrnamespace, const char *attrname)
	SYS_EXTATTR_SET_FILE		= 356 ; int extattr_set_file( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_GET_FILE		= 357 ; ssize_t extattr_get_file( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_DELETE_FILE		= 358 ; int extattr_delete_file(const char *path, int attrnamespace, const char *attrname)
%ifdef _NOSTD_
	SYS_AIO_WAITCOMPLETE		= 359 ; int aio_waitcomplete( struct aiocb **aiocbp, struct timespec *timeout)
%endif
	SYS_GETRESUID			= 360 ; int getresuid(uid_t *ruid, uid_t *euid, uid_t *suid)
	SYS_GETRESGID			= 361 ; int getresgid(gid_t *rgid, gid_t *egid, gid_t *sgid)
	SYS_KQUEUE			= 362 ; int kqueue(void)
	SYS_KEVENT			= 363 ; int kevent(int fd, struct kevent *changelist, int nchanges, struct kevent *eventlist, int nevents, const struct timespec *timeout)
	;SYS___CAP_GET_PROC		= 364 ; UNIMPLEMENTED
	;SYS___CAP_SET_PROC		= 365 ; UNIMPLEMENTED
	;SYS___CAP_GET_FD		= 366 ; UNIMPLEMENTED
	;SYS___CAP_GET_FILE		= 367 ; UNIMPLEMENTED
	;SYS___CAP_SET_FD		= 368 ; UNIMPLEMENTED
	;SYS___CAP_SET_FILE		= 369 ; UNIMPLEMENTED
	;SYS_NOSYS			= 370 ; UNIMPLEMENTED
	SYS_EXTATTR_SET_FD		= 371 ; int extattr_set_fd(int fd, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_GET_FD		= 372 ; ssize_t extattr_get_fd(int fd, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_DELETE_FD		= 373 ; int extattr_delete_fd(int fd, int attrnamespace, const char *attrname)
	SYS___SETUGID			= 374 ; int __setugid(int flag)
	;SYS_NFSCLNT			= 375 ; UNIMPLEMENTED
	SYS_EACCESS			= 376 ; int eaccess(char *path, int flags)
	;SYS_AFS_SYSCALL		= 377 ; UNIMPLEMENTED
	SYS_NMOUNT			= 378 ; int nmount(struct iovec *iovp, unsigned int iovcnt, int flags)
	;SYS_KSE_EXIT			= 379 ; UNIMPLEMENTED
	;SYS_KSE_WAKEUP			= 380 ; UNIMPLEMENTED
	;SYS_KSE_CREATE			= 381 ; UNIMPLEMENTED
	;SYS_KSE_THR_INTERRUPT		= 382 ; UNIMPLEMENTED
	;SYS_KSE_RELEASE		= 383 ; UNIMPLEMENTED
	SYS___MAC_GET_PROC		= 384 ; int __mac_get_proc(struct mac *mac_p)
	SYS___MAC_SET_PROC		= 385 ; int __mac_set_proc(struct mac *mac_p)
	SYS___MAC_GET_FD		= 386 ; int __mac_get_fd(int fd, struct mac *mac_p)
	SYS___MAC_GET_FILE		= 387 ; int __mac_get_file(const char *path_p, struct mac *mac_p)
	SYS___MAC_SET_FD		= 388 ; int __mac_set_fd(int fd, struct mac *mac_p)
	SYS___MAC_SET_FILE		= 389 ; int __mac_set_file(const char *path_p, struct mac *mac_p)
	SYS_KENV			= 390 ; int kenv(int what, const char *name, char *value, int len)
	SYS_LCHFLAGS			= 391 ; int lchflags(const char *path, int flags)
	SYS_UUIDGEN			= 392 ; int uuidgen(struct uuid *store, int count)
	SYS_SENDFILE			= 393 ; int sendfile(int fd, int s, off_t offset, size_t nbytes, struct sf_hdtr *hdtr, off_t *sbytes, int flags)
	SYS_MAC_SYSCALL			= 394 ; int mac_syscall(const char *policy, int call, void *arg)
	SYS_GETFSSTAT			= 395 ; int getfsstat(struct statfs *buf, long bufsize, int flags)
	SYS_STATFS			= 396 ; int statfs(char *path, struct statfs *buf)
	SYS_FSTATFS			= 397 ; int fstatfs(int fd, struct statfs *buf)
	SYS_FHSTATFS			= 398 ; int fhstatfs(const struct fhandle *u_fhp, struct statfs *buf)
	;SYS_NOSYS			= 399 ; UNIMPLEMENTED
%ifdef _NOSTD_
	SYS_KSEM_CLOSE			= 400 ; int ksem_close(semid_t id)
	SYS_KSEM_POST			= 401 ; int ksem_post(semid_t id)
	SYS_KSEM_WAIT			= 402 ; int ksem_wait(semid_t id)
	SYS_KSEM_TRYWAIT		= 403 ; int ksem_trywait(semid_t id)
	SYS_KSEM_INIT			= 404 ; int ksem_init(semid_t *idp, unsigned int value)
	SYS_KSEM_OPEN			= 405 ; int ksem_open(semid_t *idp, const char *name, int oflag, mode_t mode, unsigned int value)
	SYS_KSEM_UNLINK			= 406 ; int ksem_unlink(const char *name)
	SYS_KSEM_GETVALUE		= 407 ; int ksem_getvalue(semid_t id, int *val)
	SYS_KSEM_DESTROY		= 408 ; int ksem_destroy(semid_t id)
%endif
	SYS___MAC_GET_PID		= 409 ; int __mac_get_pid(pid_t pid, struct mac *mac_p)
	SYS___MAC_GET_LINK		= 410 ; int __mac_get_link(const char *path_p, struct mac *mac_p)
	SYS___MAC_SET_LINK		= 411 ; int __mac_set_link(const char *path_p, struct mac *mac_p)
	SYS_EXTATTR_SET_LINK		= 412 ; int extattr_set_link( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_GET_LINK		= 413 ; ssize_t extattr_get_link( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
	SYS_EXTATTR_DELETE_LINK		= 414 ; int extattr_delete_link( const char *path, int attrnamespace, const char *attrname)
	SYS___MAC_EXECVE		= 415 ; int __mac_execve(char *fname, char **argv, char **envv, struct mac *mac_p)
	SYS_SIGACTION			= 416 ; int sigaction(int sig, const struct sigaction *act, struct sigaction *oact)
	SYS_SIGRETURN			= 417 ; int sigreturn( const struct __ucontext *sigcntxp)
	;SYS___XSTAT			= 418 ; UNIMPLEMENTED
	;SYS___XFSTAT			= 419 ; UNIMPLEMENTED
	;SYS___XLSTAT			= 420 ; UNIMPLEMENTED
	SYS_GETCONTEXT			= 421 ; int getcontext(struct __ucontext *ucp)
	SYS_SETCONTEXT			= 422 ; int setcontext( const struct __ucontext *ucp)
	SYS_SWAPCONTEXT			= 423 ; int swapcontext(struct __ucontext *oucp, const struct __ucontext *ucp)
	SYS_SWAPOFF			= 424 ; int swapoff(const char *name)
	SYS___ACL_GET_LINK		= 425 ; int __acl_get_link(const char *path, acl_type_t type, struct acl *aclp)
	SYS___ACL_SET_LINK		= 426 ; int __acl_set_link(const char *path, acl_type_t type, struct acl *aclp)
	SYS___ACL_DELETE_LINK		= 427 ; int __acl_delete_link(const char *path, acl_type_t type)
	SYS___ACL_ACLCHECK_LINK		= 428 ; int __acl_aclcheck_link(const char *path, acl_type_t type, struct acl *aclp)
	SYS_SIGWAIT			= 429 ; int sigwait(const sigset_t *set, int *sig)
	SYS_THR_CREATE			= 430 ; int thr_create(ucontext_t *ctx, long *id, int flags)
	SYS_THR_EXIT			= 431 ; void thr_exit(long *state)
	SYS_THR_SELF			= 432 ; int thr_self(long *id)
	SYS_THR_KILL			= 433 ; int thr_kill(long id, int sig)
	SYS__UMTX_LOCK			= 434 ; int _umtx_lock(struct umtx *umtx)
	SYS__UMTX_UNLOCK		= 435 ; int _umtx_unlock(struct umtx *umtx)
	SYS_JAIL_ATTACH			= 436 ; int jail_attach(int jid)
	SYS_EXTATTR_LIST_FD		= 437 ; ssize_t extattr_list_fd(int fd, int attrnamespace, void *data, size_t nbytes)
	SYS_EXTATTR_LIST_FILE		= 438 ; ssize_t extattr_list_file( const char *path, int attrnamespace, void *data, size_t nbytes)
	SYS_EXTATTR_LIST_LINK		= 439 ; ssize_t extattr_list_link( const char *path, int attrnamespace, void *data, size_t nbytes)
	;SYS_KSE_SWITCHIN		= 440 ; UNIMPLEMENTED
	SYS_KSEM_TIMEDWAIT		= 441 ; int ksem_timedwait(semid_t id, const struct timespec *abstime)
	SYS_THR_SUSPEND			= 442 ; int thr_suspend( const struct timespec *timeout)
	SYS_THR_WAKE			= 443 ; int thr_wake(long id)
	SYS_KLDUNLOADF			= 444 ; int kldunloadf(int fileid, int flags)
	SYS_AUDIT			= 445 ; int audit(const void *record, u_int length)
	SYS_AUDITON			= 446 ; int auditon(int cmd, void *data, u_int length)
	SYS_GETAUID			= 447 ; int getauid(uid_t *auid)
	SYS_SETAUID			= 448 ; int setauid(uid_t *auid)
	SYS_GETAUDIT			= 449 ; int getaudit(struct auditinfo *auditinfo)
	SYS_SETAUDIT			= 450 ; int setaudit(struct auditinfo *auditinfo)
	SYS_GETAUDIT_ADDR		= 451 ; int getaudit_addr( struct auditinfo_addr *auditinfo_addr, u_int length)
	SYS_SETAUDIT_ADDR		= 452 ; int setaudit_addr( struct auditinfo_addr *auditinfo_addr, u_int length)
	SYS_AUDITCTL			= 453 ; int auditctl(char *path)
	SYS__UMTX_OP			= 454 ; int _umtx_op(void *obj, int op, u_long val, void *uaddr1, void *uaddr2)
	SYS_THR_NEW			= 455 ; int thr_new(struct thr_param *param, int param_size)
	SYS_SIGQUEUE			= 456 ; int sigqueue(pid_t pid, int signum, void *value)
%ifdef _NOSTD_
	SYS_KMQ_OPEN			= 457 ; int kmq_open(const char *path, int flags, mode_t mode, const struct mq_attr *attr)
	SYS_KMQ_SETATTR			= 458 ; int kmq_setattr(int mqd, const struct mq_attr *attr, struct mq_attr *oattr)
	SYS_KMQ_TIMEDRECEIVE		= 459 ; int kmq_timedreceive(int mqd, char *msg_ptr, size_t msg_len, unsigned *msg_prio, const struct timespec *abs_timeout)
	SYS_KMQ_TIMEDSEND		= 460 ; int kmq_timedsend(int mqd, const char *msg_ptr, size_t msg_len, unsigned msg_prio, const struct timespec *abs_timeout);}
	SYS_KMQ_NOTIFY			= 461 ; int kmq_notify(int mqd, const struct sigevent *sigev)
	SYS_KMQ_UNLINK			= 462 ; int kmq_unlink(const char *path)
%endif
	SYS_ABORT2			= 463 ; int abort2(const char *why, int nargs, void **args)
	SYS_THR_SET_NAME		= 464 ; int thr_set_name(long id, const char *name)
%ifdef _NOSTD_
	SYS_AIO_FSYNC			= 465 ; int aio_fsync(int op, struct aiocb *aiocbp)
%endif
	SYS_RTPRIO_THREAD		= 466 ; int rtprio_thread(int function, lwpid_t lwpid, struct rtprio *rtp)
	;SYS_NOSYS			= 467 ; UNIMPLEMENTED
	;SYS_NOSYS			= 468 ; UNIMPLEMENTED
	;SYS___GETPATH_FROMFD		= 469 ; UNIMPLEMENTED
	;SYS___GETPATH_FROMADDR		= 470 ; UNIMPLEMENTED
	SYS_SCTP_PEELOFF		= 471 ; int sctp_peeloff(int sd, uint32_t name)
	SYS_SCTP_GENERIC_SENDMSG	= 472 ; int sctp_generic_sendmsg(int sd, caddr_t msg, int mlen, caddr_t to, __socklen_t tolen, struct sctp_sndrcvinfo *sinfo, int flags)
	SYS_SCTP_GENERIC_SENDMSG_IOV	= 473 ; int sctp_generic_sendmsg_iov(int sd, struct iovec *iov, int iovlen, caddr_t to, __socklen_t tolen, struct sctp_sndrcvinfo *sinfo, int flags)
	SYS_SCTP_GENERIC_RECVMSG	= 474 ; int sctp_generic_recvmsg(int sd, struct iovec *iov, int iovlen, struct sockaddr * from, __socklen_t *fromlenaddr, struct sctp_sndrcvinfo *sinfo, int *msg_flags)
	SYS_PREAD			= 475 ; ssize_t pread(int fd, void *buf, size_t nbyte, off_t offset)
	SYS_PWRITE			= 476 ; ssize_t pwrite(int fd, const void *buf, size_t nbyte, off_t offset)
	SYS_MMAP			= 477 ; caddr_t mmap(caddr_t addr, size_t len, int prot, int flags, int fd, off_t pos)
	SYS_LSEEK			= 478 ; off_t lseek(int fd, off_t offset, int whence)
	SYS_TRUNCATE			= 479 ; int truncate(char *path, off_t length)
	SYS_FTRUNCATE			= 480 ; int ftruncate(int fd, off_t length)
	SYS_THR_KILL2			= 481 ; int thr_kill2(pid_t pid, long id, int sig)
	SYS_SHM_OPEN			= 482 ; int shm_open(const char *path, int flags, mode_t mode)
	SYS_SHM_UNLINK			= 483 ; int shm_unlink(const char *path)
	SYS_CPUSET			= 484 ; int cpuset(cpusetid_t *setid)
	SYS_CPUSET_SETID		= 485 ; int cpuset_setid(cpuwhich_t which, id_t id, cpusetid_t setid)
	SYS_CPUSET_GETID		= 486 ; int cpuset_getid(cpulevel_t level, cpuwhich_t which, id_t id, cpusetid_t *setid)
	SYS_CPUSET_GETAFFINITY		= 487 ; int cpuset_getaffinity(cpulevel_t level, cpuwhich_t which, id_t id, size_t cpusetsize, cpuset_t *mask)
	SYS_CPUSET_SETAFFINITY		= 488 ; int cpuset_setaffinity(cpulevel_t level, cpuwhich_t which, id_t id, size_t cpusetsize, const cpuset_t *mask)
	SYS_FACCESSAT			= 489 ; int faccessat(int fd, char *path, int mode, int flag)
	SYS_FCHMODAT			= 490 ; int fchmodat(int fd, char *path, mode_t mode, int flag)
	SYS_FCHOWNAT			= 491 ; int fchownat(int fd, char *path, uid_t uid, gid_t gid, int flag)
	SYS_FEXECVE			= 492 ; int fexecve(int fd, char **argv, char **envv)
	SYS_FSTATAT			= 493 ; int fstatat(int fd, char *path, struct stat *buf, int flag)
	SYS_FUTIMESAT			= 494 ; int futimesat(int fd, char *path, struct timeval *times)
	SYS_LINKAT			= 495 ; int linkat(int fd1, char *path1, int fd2, char *path2, int flag)
	SYS_MKDIRAT			= 496 ; int mkdirat(int fd, char *path, mode_t mode)
	SYS_MKFIFOAT			= 497 ; int mkfifoat(int fd, char *path, mode_t mode)
	SYS_MKNODAT			= 498 ; int mknodat(int fd, char *path, mode_t mode, dev_t dev)
	SYS_OPENAT			= 499 ; int openat(int fd, char *path, int flag, mode_t mode)
	SYS_READLINKAT			= 500 ; int readlinkat(int fd, char *path, char *buf, size_t bufsize)
	SYS_RENAMEAT			= 501 ; int renameat(int oldfd, char *old, int newfd, char *new)
	SYS_SYMLINKAT			= 502 ; int symlinkat(char *path1, int fd, char *path2)
	SYS_UNLINKAT			= 503 ; int unlinkat(int fd, char *path, int flag)
	SYS_POSIX_OPENPT		= 504 ; int posix_openpt(int flags)
%ifdef _NOSTD_
	SYS_GSSD_SYSCALL		= 505 ; int gssd_syscall(char *path)
%endif
	SYS_JAIL_GET			= 506 ; int jail_get(struct iovec *iovp, unsigned int iovcnt, int flags)
	SYS_JAIL_SET			= 507 ; int jail_set(struct iovec *iovp, unsigned int iovcnt, int flags)
	SYS_JAIL_REMOVE			= 508 ; int jail_remove(int jid)
	SYS_CLOSEFROM			= 509 ; int closefrom(int lowfd)
%ifdef _NOSTD_
	SYS___SEMCTL			= 510 ; int __semctl(int semid, int semnum, int cmd, union semun *arg)
	SYS_MSGCTL			= 511 ; int msgctl(int msqid, int cmd, struct msqid_ds *buf)
	SYS_SHMCTL			= 512 ; int shmctl(int shmid, int cmd, struct shmid_ds *buf)
%endif
	SYS_LPATHCONF			= 513 ; int lpathconf(char *path, int name)
	;SYS_CAP_NEW			= 514 ; UNIMPLEMENTED
	;SYS_CAP_GETRIGHTS		= 515 ; UNIMPLEMENTED
	;SYS_CAP_ENTER			= 516 ; UNIMPLEMENTED
	;SYS_CAP_GETMODE		= 517 ; UNIMPLEMENTED
	;SYS_PDFORK			= 518 ; UNIMPLEMENTED
	;SYS_PDKILL			= 519 ; UNIMPLEMENTED
	;SYS_PDGETPID			= 520 ; UNIMPLEMENTED
	;SYS_PDWAIT			= 521 ; UNIMPLEMENTED
	SYS_PSELECT			= 522 ; int pselect(int nd, fd_set *in, fd_set *ou, fd_set *ex, const struct timespec *ts, const sigset_t *sm)

;==================== ERRNO =======================
; based on /usr/include/errno.h
;==================================================
	EPERM			= 1		; Operation not permitted 
	ENOENT			= 2		; No such file or directory 
	ESRCH			= 3		; No such process 
	EINTR			= 4		; Interrupted system call 
	EIO			= 5		; Input/output error 
	ENXIO			= 6		; Device not configured 
	E2BIG			= 7		; Argument list too long 
	ENOEXEC			= 8		; Exec format error 
	EBADF			= 9		; Bad file descriptor 
	ECHILD			= 10		; No child processes 
	EDEADLK			= 11		; Resource deadlock avoided 
	ENOMEM			= 12		; Cannot allocate memory 
	EACCES			= 13		; Permission denied 
	EFAULT			= 14		; Bad address 
	ENOTBLK			= 15		; Block device required 
	EBUSY			= 16		; Device busy 
	EEXIST			= 17		; File exists 
	EXDEV			= 18		; Cross-device link 
	ENODEV			= 19		; Operation not supported by device 
	ENOTDIR			= 20		; Not a directory 
	EISDIR			= 21		; Is a directory 
	EINVAL			= 22		; Invalid argument 
	ENFILE			= 23		; Too many open files in system 
	EMFILE			= 24		; Too many open files 
	ENOTTY			= 25		; Inappropriate ioctl for device 
	ETXTBSY			= 26		; Text file busy 
	EFBIG			= 27		; File too large 
	ENOSPC			= 28		; No space left on device 
	ESPIPE			= 29		; Illegal seek 
	EROFS			= 30		; Read-only filesystem 
	EMLINK			= 31		; Too many links 
	EPIPE			= 32		; Broken pipe 
	EDOM			= 33		; Numerical argument out of domain 
	ERANGE			= 34		; Result too large 
	EAGAIN			= 35		; Resource temporarily unavailable 
	EWOULDBLOCK		= EAGAIN	; Operation would block 
	EINPROGRESS		= 36		; Operation now in progress 
	EALREADY		= 37		; Operation already in progress 
	ENOTSOCK		= 38		; Socket operation on non-socket 
	EDESTADDRREQ		= 39		; Destination address required 
	EMSGSIZE		= 40		; Message too long 
	EPROTOTYPE		= 41		; Protocol wrong type for socket 
	ENOPROTOOPT		= 42		; Protocol not available 
	EPROTONOSUPPORT		= 43		; Protocol not supported 
	ESOCKTNOSUPPORT		= 44		; Socket type not supported 
	EOPNOTSUPP		= 45		; Operation not supported 
	ENOTSUP			= EOPNOTSUPP	; Operation not supported 
	EPFNOSUPPORT		= 46		; Protocol family not supported 
	EAFNOSUPPORT		= 47		; Address family not supported by protocol family 
	EADDRINUSE		= 48		; Address already in use 
	EADDRNOTAVAIL		= 49		; Can't assign requested address 
	ENETDOWN		= 50		; Network is down 
	ENETUNREACH		= 51		; Network is unreachable 
	ENETRESET		= 52		; Network dropped connection on reset 
	ECONNABORTED		= 53		; Software caused connection abort 
	ECONNRESET		= 54		; Connection reset by peer 
	ENOBUFS			= 55		; No buffer space available 
	EISCONN			= 56		; Socket is already connected 
	ENOTCONN		= 57		; Socket is not connected 
	ESHUTDOWN		= 58		; Can't send after socket shutdown 
	ETOOMANYREFS		= 59		; Too many references: can't splice 
	ETIMEDOUT		= 60		; Operation timed out 
	ECONNREFUSED		= 61		; Connection refused 
	ELOOP			= 62		; Too many levels of symbolic links 
	ENAMETOOLONG		= 63		; File name too long 
	EHOSTDOWN		= 64		; Host is down 
	EHOSTUNREACH		= 65		; No route to host 
	ENOTEMPTY		= 66		; Directory not empty 
	EPROCLIM		= 67		; Too many processes 
	EUSERS			= 68		; Too many users 
	EDQUOT			= 69		; Disc quota exceeded 
	ESTALE			= 70		; Stale NFS file handle 
	EREMOTE			= 71		; Too many levels of remote in path 
	EBADRPC			= 72		; RPC struct is bad 
	ERPCMISMATCH		= 73		; RPC version wrong 
	EPROGUNAVAIL		= 74		; RPC prog. not avail 
	EPROGMISMATCH		= 75		; Program version wrong 
	EPROCUNAVAIL		= 76		; Bad procedure for program 
	ENOLCK			= 77		; No locks available 
	ENOSYS			= 78		; Function not implemented 
	EFTYPE			= 79		; Inappropriate file type or format 
	EAUTH			= 80		; Authentication error 
	ENEEDAUTH		= 81		; Need authenticator 
	EIDRM			= 82		; Identifier removed 
	ENOMSG			= 83		; No message of desired type 
	EOVERFLOW		= 84		; Value too large to be stored in data type 
	ECANCELED		= 85		; Operation canceled 
	EILSEQ			= 86		; Illegal byte sequence 
	ENOATTR			= 87		; Attribute not found 
	EDOOFUS			= 88		; Programming error 
	EBADMSG			= 89		; Bad message 
	EMULTIHOP		= 90		; Multihop attempted 
	ENOLINK			= 91		; Link has been severed 
	EPROTO			= 92		; Protocol error 
	ENOTCAPABLE		= 93		; Capabilities insufficient 
	ELAST			= 93		; Must be equal largest errno 
	; pseudo-errors returned inside kernel to modify return to process 
	ERESTART		= -1		; restart syscall 
	EJUSTRETURN		= -2		; don't modify regs, just return 
	ENOIOCTL		= -3		; ioctl not handled by this layer 
	EDIRIOCTL		= -4		; do direct ioctl in GEOM 

;===========================================
; Exit codes
;
	EXIT_FAILURE	= 1
	EXIT_SUCCESS	= 0

;===========================================
	STDIN	= 0	; standard input file descriptor
	STDOUT	= 1	; standard output file descriptor
	STDERR	= 2	; standard error file descriptor

;===========================================
	SEEK_SET	= 0	; set file offset to offset
	SEEK_CUR	= 1	; set file offset to current plus offset
	SEEK_END	= 2	; set file offset to EOF plus offset

;===========================================
; Kernel encoding of open mode; separate read and write bits that are
; independently testable: 1 greater than the above.
	O_RDONLY	= 0x0000	; open for reading only
	O_WRONLY	= 0x0001	; open for writing only
	O_RDRW		= 0x0002	; open for reading and writing
	O_ACCMODE	= 0x0003	; mask for above modes
	O_NONBLOCK	= 0x0004	; no delay
	O_APPEND	= 0x0008	; set append mode
	O_SHLOCK	= 0x0010	; open with shared file lock
	O_EXLOCK	= 0x0020	; open with exclusive file lock
	O_ASYNC		= 0x0040	; signal pgrp when data ready
	O_FSYNC		= 0x0080	; synchronous writes
	O_SYNC		= 0x0080	; POSIX synonym for O_FSYNC
	O_NOFOLLOW	= 0x0100	; don't follow symlinks
	O_CREAT		= 0x0200	; create if nonexistent
	O_TRUNC		= 0x0400	; truncate to zero length
	O_EXCL		= 0x0800	; error if already exists
	O_NOCTTY	= 0x8000	; don't assign controlling terminal
	O_DIRECT	= 0x00010000	; Attempt to bypass buffer cache
	O_DIRECTORY	= 0x00020000	; Fail if not directory
	O_EXEC		= 0x00040000	; Open for execute only
	O_TTY_INIT	= 0x00080000	; Restore default termios attributes

;=========================================
; flags for *at() syscalls
	AT_FDCWD		= -100  ; Magic value that specify the use of the current working directory to determine the target of relative file paths in the openat() and similar syscalls
	AT_EACCESS		= 0x100 ; Check access using effective user and group ID
	AT_SYMLINK_NOFOLLOW	= 0x200 ; Do not follow symbolic links
	AT_SYMLINK_FOLLOW	= 0x400 ; Follow symbolic link
	AT_REMOVEDIR		= 0x800 ; Remove directory instead of file

;=========================================
; constants used by fcntl
	F_DUPFD		= 0  ; duplicate file descriptor
	F_GETFD		= 1  ; get file descriptor flags
	F_SETFD		= 2  ; set file descriptor flags
	F_GETFL		= 3  ; get file status flags
	F_SETFL		= 4  ; set file status flags
	F_GETOW		= 5  ; get SIGIO/SIGURG proc/pgrp
	F_SETOW		= 6  ; set SIGIO/SIGURG proc/pgrp
	F_OGETL		= 7  ; get record locking information
	F_OSETL		= 8  ; set record locking information
	F_OSETLK	= 9  ; F_SETLK; wait if blocked
	F_DUP2F		= 10 ; duplicate file descriptor to arg
	F_GETL		= 11 ; get record locking information
	F_SETL		= 12 ; set record locking information
	F_SETLK		= 13 ; F_SETLK; wait if blocked
	F_SETLK_REMOT	= 14 ; debugging support for remote locks
	F_READAHEA	= 15 ; read ahead
	F_RDAHEA	= 16 ; Darwin compatible read ahead

;============================================
; file descriptor flags (F_GETFD, F_SETFD)
	FD_CLOEXEC	= 1 ; close-on-exec flag

;===========================================
; record locking flags (F_GETLK, F_SETLK, F_SETLKW)
	F_RDLCK		= 1 ; shared or read lock
	F_UNLCK		= 2 ; unlock
	F_WRLCK		= 3 ; exclusive or write lock
	F_UNLCKSYS	= 4 ; purge locks for a given system ID
	F_CANCEL	= 5 ; cancel an async lock request

;==========================================
; lock operations for flock(2)
	LOCK_SH		= 0x1	; shared file lock
	LOCK_EX		= 0x2	; exclusive file lock
	LOCK_NB		= 0x4	; don't block when locking
	LOCK_UN		= 0x8	; unlock file

;==========================================
; mmap(2) from sys/mman.h
	PROT_NONE	= 0x00 ; no permissions
	PROT_READ	= 0x01 ; pages can be read
	PROT_WRITE	= 0x02 ; pages can be written
	PROT_EXEC	= 0x04 ; pages can be executed

; Flags contain sharing type and options.
; Sharing types; choose one.
	MAP_SHARED		= 0x0001	; share changes
	MAP_PRIVATE		= 0x0002	; changes are private
	;MAP_COPY		= MAP_PRIVATE	; OBSOLETE
	; Other flags
	MAP_FIXED		= 0x0010	; map addr must be exactly as requested
	MAP_RENAME		= 0x0020	; Sun: rename private pages to file
	MAP_NORESERVE		= 0x0040	; Sun: don't reserve needed swap area
	MAP_RESERVED0080	= 0x0080	; previously misimplemented MAP_INHERIT
	MAP_RESERVED0100	= 0x0100	; previously unimplemented MAP_NOEXTEND
	MAP_HASSEMAPHORE	= 0x0200	; region may contain semaphores
	MAP_STACK		= 0x0400	; region grows down, like a stack
	MAP_NOSYNC		= 0x0800	; page to but do not sync underlying file
	; Mapping type
	MAP_FILE		= 0x0000	; map from file (default)
	MAP_ANON		= 0x1000	; allocated from memory, swap space
	; Extended flags
	MAP_NOCORE		= 0x00020000  ; dont include these pages in a coredump

;===============================================
; sys/time.h
	DST_NONE	= 0 ; not on dst
	DST_USA		= 1 ; USA style dst
	DST_AUST	= 2 ; Australian style dst
	DST_WET		= 3 ; Western European dst
	DST_MET		= 4 ; Middle European dst
	DST_EET		= 5 ; Eastern European dst
	DST_CAN		= 6 ; Canada

; vim: set ts=8 sw=4 sts=4 nowrap syn=nasm:
