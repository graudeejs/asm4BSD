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
;SYS_NOSYS			equ 0	; int nosys(void)
SYS_EXIT			equ 1   ; void sys_exit(int rval)
SYS_FORK			equ 2   ; int fork(void)
SYS_READ			equ 3   ; ssize_t read(int fd, void *buf, size_t nbyte)
SYS_WRITE			equ 4   ; ssize_t write(int fd, const void *buf, size_t nbyte)
SYS_OPEN			equ 5   ; int open(char *path, int flags, int mode)
SYS_CLOSE			equ 6   ; int close(int fd)
SYS_WAIT4			equ 7   ; int wait4(int pid, int *status, int options, struct rusage *rusage)
%ifdef _COMPAT_
SYS_CREAT			equ 8   ; int creat(char *path, int mode)
%endif
SYS_LINK			equ 9   ; int link(char *path, char *link)
SYS_UNLINK			equ 10  ; int unlink(char *path)
;SYS_EXECV			equ 11  ; OBSOLETE
SYS_CHDIR			equ 12  ; int chdir(char *path)
SYS_FCHDIR			equ 13  ; int fchdir(int fd)
SYS_MKNOD			equ 14  ; int mknod(char *path, int mode, int dev)
SYS_CHMOD			equ 15  ; int chmod(char *path, int mode)
SYS_CHOWN			equ 16  ; int chown(char *path, int uid, int gid)
SYS_OBREAK			equ 17  ; int obreak(char *nsize)
%ifdef _COMPAT_4
SYS_GETFSSTAT			equ 18  ; int getfsstat(struct ostatfs *buf, long bufsize, int flags)
%endif
%ifdef _COMPAT_
SYS_LSEEK			equ 19  ; long lseek(int fd, long offset, int whence)
%endif
SYS_GETPID			equ 20  ; pid_t getpid(void)
SYS_MOUNT			equ 21  ; int mount(char *type, char *path, int flags, caddr_t data)
SYS_UNMOUNT			equ 22  ; int unmount(char *path, int flags)
SYS_SETUID			equ 23  ; int setuid(uid_t uid)
SYS_GETUID			equ 24  ; uid_t getuid(void)
SYS_GETEUID			equ 25  ; uid_t geteuid(void)
SYS_PTRACE			equ 26  ; int ptrace(int req, pid_t pid, caddr_t addr, int data)
SYS_RECVMSG			equ 27  ; int recvmsg(int s, struct msghdr *msg, int flags)
SYS_SENDMSG			equ 28  ; int sendmsg(int s, struct msghdr *msg, int flags)
SYS_RECVFROM			equ 29  ; int recvfrom(int s, caddr_t buf, size_t len, int flags, struct sockaddr * __restrict from, __socklen_t * __restrict fromlenaddr)
SYS_ACCEPT			equ 30  ; int accept(int s, struct sockaddr * __restrict name, __socklen_t * __restrict anamelen)
SYS_GETPEERNAME			equ 31  ; int getpeername(int fdes, struct sockaddr * __restrict asa, __socklen_t * __restrict alen)
SYS_GETSOCKNAME			equ 32  ; int getsockname(int fdes, struct sockaddr * __restrict asa, __socklen_t * __restrict alen)
SYS_ACCESS			equ 33  ; int access(char *path, int flags)
SYS_CHFLAGS			equ 34  ; int chflags(char *path, int flags)
SYS_FCHFLAGS			equ 35  ; int fchflags(int fd, int flags)
SYS_SYNC			equ 36  ; int sync(void)
SYS_KILL			equ 37  ; int kill(int pid, int signum)
%ifdef _COMPAT_
SYS_STAT			equ 38  ; int stat(char *path, struct ostat *ub)
%endif
SYS_GETPPID			equ 39  ; pid_t getppid(void)
%ifdef _COMPAT_
SYS_LSTAT			equ 40  ; int lstat(char *path, struct ostat *ub)
%endif
SYS_DUP				equ 41  ; int dup(u_int fd)
SYS_PIPE			equ 42  ; int pipe(void)
SYS_GETEGID			equ 43  ; gid_t getegid(void)
SYS_PROFIL			equ 44  ; int profil(caddr_t samples, size_t size, size_t offset, u_int scale)
SYS_KTRACE			equ 45  ; int ktrace(const char *fname, int ops, int facs, int pid)
%ifdef _COMPAT_
SYS_SIGACTION			equ 46  ; int sigaction(int signum, struct osigaction *nsa, struct osigaction *osa)
%endif
SYS_GETGID			equ 47  ; gid_t getgid(void)
%ifdef _COMPAT_
SYS_SIGPROCMASK			equ 48  ; int sigprocmask(int how, osigset_t mask)
%endif
SYS_GETLOGIN			equ 49  ; int getlogin(char *namebuf, u_int namelen)
SYS_SETLOGIN			equ 50  ; int setlogin(char *namebuf)
SYS_ACCT			equ 51  ; int acct(char *path)
%ifdef _COMPAT_
SYS_SIGPENDING			equ 52  ; int sigpending(void)
%endif
SYS_SIGALTSTACK			equ 53  ; int sigaltstack(stack_t *ss, stack_t *oss)
SYS_IOCTL			equ 54  ; int ioctl(int fd, u_long com, caddr_t data)
SYS_REBOOT			equ 55  ; int reboot(int opt)
SYS_REVOKE			equ 56  ; int revoke(char *path)
SYS_SYMLINK			equ 57  ; int symlink(char *path, char *link)
SYS_READLINK			equ 58  ; ssize_t readlink(char *path, char *buf, size_t count)
SYS_EXECVE			equ 59  ; int execve(char *fname, char **argv, char **envv)
SYS_UMASK			equ 60  ; int umask(int newmask)
SYS_CHROOT			equ 61  ; int chroot(char *path)
%ifdef _COMPAT_
SYS_FSTAT			equ 62  ; int fstat(int fd, struct ostat *sb)
SYS_GETKERNINFO			equ 63  ; int getkerninfo(int op, char *where, size_t *size, int arg)
SYS_GETPAGESIZE			equ 64  ; int getpagesize(void)
%endif
SYS_MSYNC			equ 65  ; int msync(void *addr, size_t len, int flags)
SYS_VFORK			equ 66  ; int vfork(void)
;SYS_VREAD			equ 67  ; OBSOLETE
;SYS_VWRITE			equ 68  ; OBSOLETE
SYS_SBRK			equ 69  ; int sbrk(int incr)
SYS_SSTK			equ 70  ; int sstk(int incr)
%ifdef _COMPAT_
SYS_MMAP			equ 71  ; int mmap(void *addr, int len, int prot, int flags, int fd, long pos)
%endif
SYS_OVADVISE			equ 72  ; int ovadvise(int anom)
SYS_MUNMAP			equ 73  ; int munmap(void *addr, size_t len)
SYS_MPROTECT			equ 74  ; int mprotect(const void *addr, size_t len, int prot)
SYS_MADVISE			equ 75  ; int madvise(void *addr, size_t len, int behav)
;SYS_VHANGUP			equ 76  ; OBSOLETE
;SYS_VLIMIT			equ 77  ; OBSOLETE
SYS_MINCORE			equ 78  ; int mincore(const void *addr, size_t len, char *vec)
SYS_GETGROUPS			equ 79  ; int getgroups(u_int gidsetsize, gid_t *gidset)
SYS_SETGROUPS			equ 80  ; int setgroups(u_int gidsetsize, gid_t *gidset)
SYS_GETPGRP			equ 81  ; int getpgrp(void)
SYS_SETPGID			equ 82  ; int setpgid(int pid, int pgid)
SYS_SETITIMER			equ 83  ; int setitimer(u_int which, struct itimerval *itv, struct itimerval *oitv)
%ifdef _COMPAT_
SYS_WAIT			equ 84  ; int wait(void)
%endif
SYS_SWAPON			equ 85  ; int swapon(char *name)
SYS_GETITIMER			equ 86  ; int getitimer(u_int which, struct itimerval *itv)
%ifdef _COMPAT_
SYS_GETHOSTNAME			equ 87  ; int gethostname(char *hostname, u_int len)
SYS_SETHOSTNAME			equ 88  ; int sethostname(char *hostname, u_int len)
%endif
SYS_GETDTABLESIZE		equ 89  ; int getdtablesize(void)
SYS_DUP2			equ 90  ; int dup2(u_int from, u_int to)
;SYS_GETDOPT			equ 91  ; UNIMPLEMENTED
SYS_FCNTL			equ 92  ; int fcntl(int fd, int cmd, long arg)
SYS_SELECT			equ 93  ; int select(int nd, fd_set *in, fd_set *ou, fd_set *ex, struct timeval *tv)
;SYS_SETDOPT			equ 94  ; UNIMPLEMENTED
SYS_FSYNC			equ 95  ; int fsync(int fd)
SYS_SETPRIORITY			equ 96  ; int setpriority(int which, int who, int prio)
SYS_SOCKET			equ 97  ; int socket(int domain, int type, int protocol)
SYS_CONNECT			equ 98  ; int connect(int s, caddr_t name, int namelen)
%ifdef _COMPAT_
SYS_ACCEPT			equ 99  ; int accept(int s, caddr_t name, int *anamelen)
%endif
SYS_GETPRIORITY			equ 100 ; int getpriority(int which, int who)
%ifdef _COMPAT_
SYS_SEND			equ 101 ; int send(int s, caddr_t buf, int len, int flags)
SYS_RECV			equ 102 ; int recv(int s, caddr_t buf, int len, int flags)
SYS_SIGRETURN			equ 103 ; int sigreturn( struct osigcontext *sigcntxp)
%endif
SYS_BIND			equ 104 ; int bind(int s, caddr_t name, int namelen)
SYS_SETSOCKOPT			equ 105 ; int setsockopt(int s, int level, int name, caddr_t val, int valsize)
SYS_LISTEN			equ 106 ; int listen(int s, int backlog)
;SYS_VTIMES			equ 107 ; OBSOLETE
%ifdef _COMPAT_
SYS_SIGVEC			equ 108 ; int sigvec(int signum, struct sigvec *nsv, struct sigvec *osv)
SYS_SIGBLOCK			equ 109 ; int sigblock(int mask)
SYS_SIGSETMASK			equ 110 ; int sigsetmask(int mask)
SYS_SIGSUSPEND			equ 111 ; int sigsuspend(osigset_t mask)
SYS_SIGSTACK			equ 112 ; int sigstack(struct sigstack *nss, struct sigstack *oss)
SYS_RECVMSG			equ 113 ; int recvmsg(int s, struct omsghdr *msg, int flags)
SYS_SENDMSG			equ 114 ; int sendmsg(int s, caddr_t msg, int flags)
%endif
;SYS_VTRACE			equ 115 ; OBSOLETE
SYS_GETTIMEOFDAY		equ 116 ; int gettimeofday(struct timeval *tp, struct timezone *tzp)
SYS_GETRUSAGE			equ 117 ; int getrusage(int who, struct rusage *rusage)
SYS_GETSOCKOPT			equ 118 ; int getsockopt(int s, int level, int name, caddr_t val, int *avalsize)
;SYS_RESUBA			equ 119 ; UNIMPLEMENTED
SYS_READV			equ 120 ; int readv(int fd, struct iovec *iovp, u_int iovcnt)
SYS_WRITEV			equ 121 ; int writev(int fd, struct iovec *iovp, u_int iovcnt)
SYS_SETTIMEOFDAY		equ 122 ; int settimeofday(struct timeval *tv, struct timezone *tzp)
SYS_FCHOWN			equ 123 ; int fchown(int fd, int uid, int gid)
SYS_FCHMOD			equ 124 ; int fchmod(int fd, int mode)
%ifdef _COMPAT_
SYS_RECVFROM			equ 125 ; int recvfrom(int s, caddr_t buf, size_t len, int flags, caddr_t from, int *fromlenaddr)
%endif
SYS_SETREUID			equ 126 ; int setreuid(int ruid, int euid)
SYS_SETREGID			equ 127 ; int setregid(int rgid, int egid)
SYS_RENAME			equ 128 ; int rename(char *from, char *to)
%ifdef _COMPAT_
SYS_TRUNCATE			equ 129 ; int truncate(char *path, long length)
SYS_FTRUNCATE			equ 130 ; int ftruncate(int fd, long lengt);						OLD. use new one 201
%endif
SYS_FLOCK			equ 131 ; int flock(int fd, int how)
SYS_MKFIFO			equ 132 ; int mkfifo(char *path, int mode)
SYS_SENDTO			equ 133 ; int sendto(int s, caddr_t buf, size_t len, int flags, caddr_t to, int tolen)
SYS_SHUTDOWN			equ 134 ; int shutdown(int s, int how)
SYS_SOCKETPAIR			equ 135 ; int socketpair(int domain, int type, int protocol, int *rsv)
SYS_MKDIR			equ 136 ; int mkdir(char *path, int mode)
SYS_RMDIR			equ 137 ; int rmdir(char *path)
SYS_UTIMES			equ 138 ; int utimes(char *path, struct timeval *tptr)
;SYS_SIGRETURN			equ 139 ; OBSOLETE
SYS_ADJTIME			equ 140 ; int adjtime(struct timeval *delta, struct timeval *olddelta)
%ifdef _COMPAT_
SYS_GETPEERNAME			equ 141 ; int getpeername(int fdes, caddr_t asa, int *alen)
SYS_GETHOSTID			equ 142 ; long gethostid(void)
SYS_SETHOSTID			equ 143 ; int sethostid(long hostid)
SYS_GETRLIMIT			equ 144 ; int getrlimit(u_int which, struct orlimit *rlp)
SYS_SETRLIMIT			equ 145 ; int setrlimit(u_int which, struct orlimit *rlp)
SYS_KILLPG			equ 146 ; int killpg(int pgid, int signum)
%endif
SYS_SETSID			equ 147 ; int setsid(void)
SYS_QUOTACTL			equ 148 ; int quotactl(char *path, int cmd, int uid, caddr_t arg)
%ifdef _COMPAT_
SYS_QUOTA			equ 149 ; int quota(void)
SYS_GETSOCKNAME			equ 150 ; int getsockname(int fdec, caddr_t asa, int *alen)
%endif
;SYS_SEM_LOCK			equ 151 ; UNIMPLEMENTED
;SYS_SEM_WAKEUP			equ 152 ; UNIMPLEMENTED
;SYS_ASYNCDAEMON		equ 153 ; UNIMPLEMENTED
%ifdef _NOSTD_
SYS_NLM_SYSCALL			equ 154 ; int nlm_syscall(int debug_level, int grace_period, int addr_count, char **addrs)
SYS_NFSSVC			equ 155 ; int nfssvc(int flag, caddr_t argp)
%endif
%ifdef _COMPAT_
SYS_GETDIRENTRIES		equ 156 ; int getdirentries(int fd, char *buf, u_int count, long *basep)
%endif
%ifdef _COMPAT4_
SYS_STATFS			equ 157 ; int statfs(char *path, struct ostatfs *buf)
SYS_FSTATFS			equ 158 ; int fstatfs(int fd, struct ostatfs *buf)
%endif
;SYS_NOSYS			equ 159 ; UNIMPLEMENTED
SYS_LGETFH			equ 160 ; int lgetfh(char *fname, struct fhandle *fhp)
SYS_GETFH			equ 161 ; int getfh(char *fname, struct fhandle *fhp)
%ifdef _COMPAT4_
SYS_GETDOMAINNAME		equ 162 ; int getdomainname(char *domainname, int len)
SYS_SETDOMAINNAME		equ 163 ; int setdomainname(char *domainname, int len)
SYS_UNAME			equ 164 ; int uname(struct utsname *name)
%endif
SYS_SYSARCH			equ 165 ; int sysarch(int op, char *parms)
SYS_RTPRIO			equ 166 ; int rtprio(int function, pid_t pid, struct rtprio *rtp)
;SYS_NOSYS			equ 167 ; UNIMPLEMENTED
;SYS_NOSYS			equ 168 ; UNIMPLEMENTED
%ifdef _NOSTD_
SYS_SEMSYS			equ 169 ; int semsys(int which, int a2, int a3, int a4, int a5)
SYS_MSGSYS			equ 170 ; int msgsys(int which, int a2, int a3, int a4, int a5, int a6)
SYS_SHMSYS			equ 171 ; int shmsys(int which, int a2, int a3, int a4)
%endif
;SYS_NOSYS			equ 172 ; UNIMPLEMENTED
SYS_FREEBSD6_PREAD		equ 173 ; ssize_t freebsd6_pread(int fd, void *buf, size_t nbyte, int pad, off_t offset)
SYS_FREEBSD6_PWRITE		equ 174 ; ssize_t freebsd6_pwrite(int fd, const void *buf, size_t nbyte, int pad, off_t offset)
SYS_SETFIB			equ 175 ; int setfib(int fibnum)
SYS_NTP_ADJTIME			equ 176 ; int ntp_adjtime(struct timex *tp)
;SYS_SFORK			equ 177 ; UNIMPLEMENTED
;SYS_GETDESCRIPTOR		equ 178 ; UNIMPLEMENTED
;SYS_SETDESCRIPTOR		equ 179 ; UNIMPLEMENTED
;SYS_NOSYS			equ 180 ; UNIMPLEMENTED
SYS_SETGID			equ 181 ; int setgid(gid_t gid)
SYS_SETEGID			equ 182 ; int setegid(gid_t egid)
SYS_SETEUID			equ 183 ; int seteuid(uid_t euid)
;SYS_LFS_BMAPV			equ 184 ; UNIMPLEMENTED
;SYS_LFS_MARKV			equ 185 ; UNIMPLEMENTED
;SYS_LFS_SEGCLEAN		equ 186 ; UNIMPLEMENTED
;SYS_LFS_SEGWAIT		equ 187 ; UNIMPLEMENTED
SYS_STAT			equ 188 ; int stat(char *path, struct stat *ub)
SYS_FSTAT			equ 189 ; int fstat(int fd, struct stat *sb)
SYS_LSTAT			equ 190 ; int lstat(char *path, struct stat *ub)
SYS_PATHCONF			equ 191 ; int pathconf(char *path, int name)
SYS_FPATHCONF			equ 192 ; int fpathconf(int fd, int name)
;SYS_NOSYS			equ 193 ; UNIMPLEMENTED
SYS_GETRLIMIT			equ 194 ; int getrlimit(u_int which, struct rlimit *rlp)
SYS_SETRLIMIT			equ 195 ; int setrlimit(u_int which, struct rlimit *rlp)
SYS_GETDIRENTRIES		equ 196 ; int getdirentries(int fd, char *buf, u_int count, long *basep)
SYS_FREEBSD6_MMAP		equ 197 ; caddr_t freebsd6_mmap(caddr_t addr, size_t len, int prot, int flags, int fd, int pad, off_t pos)
;SYS_NOSYS			equ 198 ; int nosys(void) ??????
SYS_FREEBSD6_LSEEK		equ 199 ; off_t freebsd6_lseek(int fd, int pad, off_t offset, int whence)
SYS_FREEBSD6_TRUNCATE		equ 200 ; int freebsd6_truncate(char *path, int pad, off_t length)
SYS_FREEBSD6_FTRUNCATE		equ 201 ; int freebsd6_ftruncate(int fd, int pad, off_t length)
SYS___SYSCTL			equ 202 ; int __sysctl(int *name, u_int namelen, void *old, size_t *oldlenp, void *new, size_t newlen)
SYS_MLOCK			equ 203 ; int mlock(const void *addr, size_t len)
SYS_MUNLOCK			equ 204 ; int munlock(const void *addr, size_t len)
SYS_UNDELETE			equ 205 ; int undelete(char *path)
SYS_FUTIMES			equ 206 ; int futimes(int fd, struct timeval *tptr)
SYS_GETPGID			equ 207 ; int getpgid(pid_t pid)
;SYS_NEWREBOOT			equ 208 ; UNIMPLEMENTED
SYS_POLL			equ 209 ; int poll(struct pollfd *fds, u_int nfds, 
;SYS_?				equ 210 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 211 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 212 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 213 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 214 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 215 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 216 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 217 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 218 ; NODEF	lkmnosys lkmnosys nosys_args int
;SYS_?				equ 219 ; NODEF	lkmnosys lkmnosys nosys_args int
%ifdef _COMPAT7_
SYS___SEMCTL			equ 220 ; int __semctl(int semid, int semnum, int cmd, union semun_old *arg)
%elifdef _NOSTD_
SYS___SEMCTL			equ 220 ; int __semctl(int semid, int semnum, int cmd, union semun_old *arg)
%endif
%ifdef _NOSTD_
SYS_SEMGET			equ 221 ; int semget(key_t key, int nsems, int semflg)
SYS_SEMOP			equ 222 ; int semop(int semid, struct sembuf *sops, size_t nsops)
%endif
;SYS_SEMCONFIG			equ 223 ; UNIMPLEMENTED
%ifdef _COMPAT7_
SYS_MSGCTL			equ 224 ; int msgctl(int msqid, int cmd, struct msqid_ds_old *buf)
%elifdef _NOSTD_
SYS_MSGCTL			equ 224 ; int msgctl(int msqid, int cmd, struct msqid_ds_old *buf)
%endif
%ifdef NOSTD
SYS_MSGGET			equ 225 ; int msgget(key_t key, int msgflg)
SYS_MSGSND			equ 226 ; int msgsnd(int msqid, const void *msgp, size_t msgsz, int msgflg)
SYS_MSGRCV			equ 227 ; int msgrcv(int msqid, void *msgp, size_t msgsz, long msgtyp, int msgflg)
SYS_SHMAT			equ 228 ; int shmat(int shmid, const void *shmaddr, int shmflg)
%endif
%ifdef _COMPAT7_
SYS_SHMCTL			equ 229 ; int shmctl(int shmid, int cmd, struct shmid_ds_old *buf)
%elifdef _NOSTD_
SYS_SHMCTL			equ 229 ; int shmctl(int shmid, int cmd, struct shmid_ds_old *buf)
%endif
%ifdef _NOSTD_
SYS_SHMDT			equ 230 ; int shmdt(const void *shmaddr)
SYS_SHMGET			equ 231 ; int shmget(key_t key, size_t size, int shmflg)
%endif
SYS_CLOCK_GETTIME		equ 232 ; int clock_gettime(clockid_t clock_id, struct timespec *tp)
SYS_CLOCK_SETTIME		equ 233 ; int clock_settime( clockid_t clock_id, const struct timespec *tp)
SYS_CLOCK_GETRES		equ 234 ; int clock_getres(clockid_t clock_id, struct timespec *tp)
SYS_KTIMER_CREATE		equ 235 ; int ktimer_create(clockid_t clock_id, struct sigevent *evp, int *timerid)
SYS_KTIMER_DELETE		equ 236 ; int ktimer_delete(int timerid)
SYS_KTIMER_SETTIME		equ 237 ; int ktimer_settime(int timerid, int flags, const struct itimerspec *value, struct itimerspec *ovalue)
SYS_KTIMER_GETTIME		equ 238 ; int ktimer_gettime(int timerid, struct itimerspec *value)
SYS_KTIMER_GETOVERRUN		equ 239 ; int ktimer_getoverrun(int timerid)
SYS_NANOSLEEP			equ 240 ; int nanosleep(const struct timespec *rqtp, struct timespec *rmtp)
;SYS_NOSYS			equ 241 ; UNIMPLEMENTED
;SYS_NOSYS			equ 242 ; UNIMPLEMENTED
;SYS_NOSYS			equ 243 ; UNIMPLEMENTED
;SYS_NOSYS			equ 244 ; UNIMPLEMENTED
;SYS_NOSYS			equ 245 ; UNIMPLEMENTED
;SYS_NOSYS			equ 246 ; UNIMPLEMENTED
;SYS_NOSYS			equ 247 ; UNIMPLEMENTED
SYS_NTP_GETTIME			equ 248 ; int ntp_gettime(struct ntptimeval *ntvp)
;SYS_NOSYS			equ 249 ; UNIMPLEMENTED
SYS_MINHERIT			equ 250 ; int minherit(void *addr, size_t len, int inherit)
SYS_RFORK			equ 251 ; int rfork(int flags)
SYS_OPENBSD_POLL		equ 252 ; int openbsd_poll(struct pollfd *fds, u_int nfds, int timeout)
SYS_ISSETUGID			equ 253 ; int issetugid(void)
SYS_LCHOWN			equ 254 ; int lchown(char *path, int uid, int gid)
%ifdef _NOSTD_
SYS_AIO_READ			equ 255 ; int aio_read(struct aiocb *aiocbp)
SYS_AIO_WRITE			equ 256 ; int aio_write(struct aiocb *aiocbp)
SYS_LIO_LISTIO			equ 257 ; int lio_listio(int mode, struct aiocb * const *acb_list, int nent, struct sigevent *sig)
%endif
;SYS_NOSYS			equ 258 ; UNIMPLEMENTED
;SYS_NOSYS			equ 259 ; UNIMPLEMENTED
;SYS_NOSYS			equ 260 ; UNIMPLEMENTED
;SYS_NOSYS			equ 261 ; UNIMPLEMENTED
;SYS_NOSYS			equ 262 ; UNIMPLEMENTED
;SYS_NOSYS			equ 263 ; UNIMPLEMENTED
;SYS_NOSYS			equ 264 ; UNIMPLEMENTED
;SYS_NOSYS			equ 265 ; UNIMPLEMENTED
;SYS_NOSYS			equ 266 ; UNIMPLEMENTED
;SYS_NOSYS			equ 267 ; UNIMPLEMENTED
;SYS_NOSYS			equ 268 ; UNIMPLEMENTED
;SYS_NOSYS			equ 269 ; UNIMPLEMENTED
;SYS_NOSYS			equ 270 ; UNIMPLEMENTED
;SYS_NOSYS			equ 271 ; UNIMPLEMENTED
SYS_GETDENTS			equ 272 ; int getdents(int fd, char *buf, size_t count)
;SYS_NOSYS			equ 273 ; UNIMPLEMENTED
SYS_LCHMOD			equ 274 ; int lchmod(char *path, mode_t mode)
;SYS_LCHOWN			equ 275 ; int lchown(char *path, uid_t uid, gid_t gid) ; NOPROTO
SYS_LUTIMES			equ 276 ; int lutimes(char *path, struct timeval *tptr)
;SYS_MSYNC			equ 277 ; int msync(void *addr, size_t len, int flags) ; NOPROTO
SYS_NSTAT			equ 278 ; int nstat(char *path, struct nstat *ub)
SYS_NFSTAT			equ 279 ; int nfstat(int fd, struct nstat *sb)
SYS_NLSTAT			equ 280 ; int nlstat(char *path, struct nstat *ub)
;SYS_NOSYS			equ 281 ; UNIMPLEMENTED
;SYS_NOSYS			equ 282 ; UNIMPLEMENTED
;SYS_NOSYS			equ 283 ; UNIMPLEMENTED
;SYS_NOSYS			equ 284 ; UNIMPLEMENTED
;SYS_NOSYS			equ 285 ; UNIMPLEMENTED
;SYS_NOSYS			equ 286 ; UNIMPLEMENTED
;SYS_NOSYS			equ 287 ; UNIMPLEMENTED
;SYS_NOSYS			equ 288 ; UNIMPLEMENTED
SYS_PREADV			equ 289 ; ssize_t preadv(int fd, struct iovec *iovp, u_int iovcnt, off_t offset)
SYS_PWRITEV			equ 290 ; ssize_t pwritev(int fd, struct iovec *iovp, u_int iovcnt, off_t offset)
;SYS_NOSYS			equ 291 ; UNIMPLEMENTED
;SYS_NOSYS			equ 292 ; UNIMPLEMENTED
;SYS_NOSYS			equ 293 ; UNIMPLEMENTED
;SYS_NOSYS			equ 294 ; UNIMPLEMENTED
;SYS_NOSYS			equ 295 ; UNIMPLEMENTED
;SYS_NOSYS			equ 296 ; UNIMPLEMENTED
%ifdef _COMPAT4_
SYS_FHSTATFS			equ 297 ; int fhstatfs( const struct fhandle *u_fhp, struct ostatfs *buf)
%endif
SYS_FHOPEN			equ 298 ; int fhopen(const struct fhandle *u_fhp, int flags)
SYS_FHSTAT			equ 299 ; int fhstat(const struct fhandle *u_fhp, struct stat *sb)
SYS_MODNEXT			equ 300 ; int modnext(int modid)
SYS_MODSTAT			equ 301 ; int modstat(int modid, struct module_stat *stat)
SYS_MODFNEXT			equ 302 ; int modfnext(int modid)
SYS_MODFIND			equ 303 ; int modfind(const char *name)
SYS_KLDLOAD			equ 304 ; int kldload(const char *file)
SYS_KLDUNLOAD			equ 305 ; int kldunload(int fileid)
SYS_KLDFIND			equ 306 ; int kldfind(const char *file)
SYS_KLDNEXT			equ 307 ; int kldnext(int fileid)
SYS_KLDSTAT			equ 308 ; int kldstat(int fileid, struct kld_file_stat* stat)
SYS_KLDFIRSTMOD			equ 309 ; int kldfirstmod(int fileid)
SYS_GETSID			equ 310 ; int getsid(pid_t pid)
SYS_SETRESUID			equ 311 ; int setresuid(uid_t ruid, uid_t euid, uid_t suid)
SYS_SETRESGID			equ 312 ; int setresgid(gid_t rgid, gid_t egid, gid_t sgid)
;SYS_SIGNANOSLEEP		equ 313 ; OBSOLETE
SYS_AIO_RETURN			equ 314 ; int aio_return(struct aiocb *aiocbp)
SYS_AIO_SUSPEND			equ 315 ; int aio_suspend( struct aiocb * const * aiocbp, int nent, const struct timespec *timeout)
SYS_AIO_CANCEL			equ 316 ; int aio_cancel(int fd, struct aiocb *aiocbp)
SYS_AIO_ERROR			equ 317 ; int aio_error(struct aiocb *aiocbp)
SYS_OAIO_READ			equ 318 ; int oaio_read(struct oaiocb *aiocbp)
SYS_OAIO_WRITE			equ 319 ; int oaio_write(struct oaiocb *aiocbp)
SYS_OLIO_LISTIO			equ 320 ; int olio_listio(int mode, struct oaiocb * const *acb_list, int nent, struct osigevent *sig)
SYS_YIELD			equ 321 ; int yield(void)
;SYS_THR_SLEEP			equ 322 ; OBSOLETE
;SYS_THR_WAKEUP			equ 323 ; OBSOLETE
SYS_MLOCKALL			equ 324 ; int mlockall(int how)
SYS_MUNLOCKALL			equ 325 ; int munlockall(void)
SYS___GETCWD			equ 326 ; int __getcwd(u_char *buf, u_int buflen)
SYS_SCHED_SETPARAM		equ 327 ; int sched_setparam (pid_t pid, const struct sched_param *param)
SYS_SCHED_GETPARAM		equ 328 ; int sched_getparam (pid_t pid, struct sched_param *param)
SYS_SCHED_SETSCHEDULER		equ 329 ; int sched_setscheduler (pid_t pid, int policy, const struct sched_param *param)
SYS_SCHED_GETSCHEDULER		equ 330 ; int sched_getscheduler (pid_t pid)
SYS_SCHED_YIELD			equ 331 ; int sched_yield (void)
SYS_SCHED_GET_PRIORITY_MAX	equ 332 ; int sched_get_priority_max (int policy)
SYS_SCHED_GET_PRIORITY_MIN	equ 333 ; int sched_get_priority_min (int policy)
SYS_SCHED_RR_GET_INTERVAL	equ 334 ; int sched_rr_get_interval (pid_t pid, struct timespec *interval)
SYS_UTRACE			equ 335 ; int utrace(const void *addr, size_t len)
%ifdef _COMPAT4_
SYS_SENDFILE			equ 336 ; int sendfile(int fd, int s, off_t offset, size_t nbytes, struct sf_hdtr *hdtr, off_t *sbytes, int flags)
%endif
SYS_KLDSYM			equ 337 ; int kldsym(int fileid, int cmd, void *data)
SYS_JAIL			equ 338 ; int jail(struct jail *jail)
;SYS_PIOCTL			equ 339 ; UNIMPLEMENTED
SYS_SIGPROCMASK			equ 340 ; int sigprocmask(int how, const sigset_t *set, sigset_t *oset)
SYS_SIGSUSPEND			equ 341 ; int sigsuspend(const sigset_t *sigmask)
%ifdef _COMPAT4_
SYS_SIGACTION			equ 342 ; int sigaction(int sig, const struct sigaction *act, struct sigaction *oact)
%endif
SYS_SIGPENDING			equ 343 ; int sigpending(sigset_t *set)
%ifdef _COMPAT4_
SYS_SIGRETURN			equ 344 ; int sigreturn( const struct ucontext4 *sigcntxp)
%endif
SYS_SIGTIMEDWAIT		equ 345 ; int sigtimedwait(const sigset_t *set, siginfo_t *info, const struct timespec *timeout)
SYS_SIGWAITINFO			equ 346 ; int sigwaitinfo(const sigset_t *set, siginfo_t *info)
SYS___ACL_GET_FILE		equ 347 ; int __acl_get_file(const char *path, acl_type_t type, struct acl *aclp)
SYS___ACL_SET_FILE		equ 348 ; int __acl_set_file(const char *path, acl_type_t type, struct acl *aclp)
SYS___ACL_GET_FD		equ 349 ; int __acl_get_fd(int filedes, acl_type_t type, struct acl *aclp)
SYS___ACL_SET_FD		equ 350 ; int __acl_set_fd(int filedes, acl_type_t type, struct acl *aclp)
SYS___ACL_DELETE_FILE		equ 351 ; int __acl_delete_file(const char *path, acl_type_t type)
SYS___ACL_DELETE_FD		equ 352 ; int __acl_delete_fd(int filedes, acl_type_t type)
SYS___ACL_ACLCHECK_FILE		equ 353 ; int __acl_aclcheck_file(const char *path, acl_type_t type, struct acl *aclp)
SYS___ACL_ACLCHECK_FD		equ 354 ; int __acl_aclcheck_fd(int filedes, acl_type_t type, struct acl *aclp)
SYS_EXTATTRCTL			equ 355 ; int extattrctl(const char *path, int cmd, const char *filename, int attrnamespace, const char *attrname)
SYS_EXTATTR_SET_FILE		equ 356 ; int extattr_set_file( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_GET_FILE		equ 357 ; ssize_t extattr_get_file( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_DELETE_FILE		equ 358 ; int extattr_delete_file(const char *path, int attrnamespace, const char *attrname)
%ifdef _NOSTD_
SYS_AIO_WAITCOMPLETE		equ 359 ; int aio_waitcomplete( struct aiocb **aiocbp, struct timespec *timeout)
%endif
SYS_GETRESUID			equ 360 ; int getresuid(uid_t *ruid, uid_t *euid, uid_t *suid)
SYS_GETRESGID			equ 361 ; int getresgid(gid_t *rgid, gid_t *egid, gid_t *sgid)
SYS_KQUEUE			equ 362 ; int kqueue(void)
SYS_KEVENT			equ 363 ; int kevent(int fd, struct kevent *changelist, int nchanges, struct kevent *eventlist, int nevents, const struct timespec *timeout)
;SYS___CAP_GET_PROC		equ 364 ; UNIMPLEMENTED
;SYS___CAP_SET_PROC		equ 365 ; UNIMPLEMENTED
;SYS___CAP_GET_FD		equ 366 ; UNIMPLEMENTED
;SYS___CAP_GET_FILE		equ 367 ; UNIMPLEMENTED
;SYS___CAP_SET_FD		equ 368 ; UNIMPLEMENTED
;SYS___CAP_SET_FILE		equ 369 ; UNIMPLEMENTED
;SYS_NOSYS			equ 370 ; UNIMPLEMENTED
SYS_EXTATTR_SET_FD		equ 371 ; int extattr_set_fd(int fd, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_GET_FD		equ 372 ; ssize_t extattr_get_fd(int fd, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_DELETE_FD		equ 373 ; int extattr_delete_fd(int fd, int attrnamespace, const char *attrname)
SYS___SETUGID			equ 374 ; int __setugid(int flag)
;SYS_NFSCLNT			equ 375 ; UNIMPLEMENTED
SYS_EACCESS			equ 376 ; int eaccess(char *path, int flags)
;SYS_AFS_SYSCALL		equ 377 ; UNIMPLEMENTED
SYS_NMOUNT			equ 378 ; int nmount(struct iovec *iovp, unsigned int iovcnt, int flags)
;SYS_KSE_EXIT			equ 379 ; UNIMPLEMENTED
;SYS_KSE_WAKEUP			equ 380 ; UNIMPLEMENTED
;SYS_KSE_CREATE			equ 381 ; UNIMPLEMENTED
;SYS_KSE_THR_INTERRUPT		equ 382 ; UNIMPLEMENTED
;SYS_KSE_RELEASE		equ 383 ; UNIMPLEMENTED
SYS___MAC_GET_PROC		equ 384 ; int __mac_get_proc(struct mac *mac_p)
SYS___MAC_SET_PROC		equ 385 ; int __mac_set_proc(struct mac *mac_p)
SYS___MAC_GET_FD		equ 386 ; int __mac_get_fd(int fd, struct mac *mac_p)
SYS___MAC_GET_FILE		equ 387 ; int __mac_get_file(const char *path_p, struct mac *mac_p)
SYS___MAC_SET_FD		equ 388 ; int __mac_set_fd(int fd, struct mac *mac_p)
SYS___MAC_SET_FILE		equ 389 ; int __mac_set_file(const char *path_p, struct mac *mac_p)
SYS_KENV			equ 390 ; int kenv(int what, const char *name, char *value, int len)
SYS_LCHFLAGS			equ 391 ; int lchflags(const char *path, int flags)
SYS_UUIDGEN			equ 392 ; int uuidgen(struct uuid *store, int count)
SYS_SENDFILE			equ 393 ; int sendfile(int fd, int s, off_t offset, size_t nbytes, struct sf_hdtr *hdtr, off_t *sbytes, int flags)
SYS_MAC_SYSCALL			equ 394 ; int mac_syscall(const char *policy, int call, void *arg)
SYS_GETFSSTAT			equ 395 ; int getfsstat(struct statfs *buf, long bufsize, int flags)
SYS_STATFS			equ 396 ; int statfs(char *path, struct statfs *buf)
SYS_FSTATFS			equ 397 ; int fstatfs(int fd, struct statfs *buf)
SYS_FHSTATFS			equ 398 ; int fhstatfs(const struct fhandle *u_fhp, struct statfs *buf)
;SYS_NOSYS			equ 399 ; UNIMPLEMENTED
%ifdef _NOSTD_
SYS_KSEM_CLOSE			equ 400 ; int ksem_close(semid_t id)
SYS_KSEM_POST			equ 401 ; int ksem_post(semid_t id)
SYS_KSEM_WAIT			equ 402 ; int ksem_wait(semid_t id)
SYS_KSEM_TRYWAIT		equ 403 ; int ksem_trywait(semid_t id)
SYS_KSEM_INIT			equ 404 ; int ksem_init(semid_t *idp, unsigned int value)
SYS_KSEM_OPEN			equ 405 ; int ksem_open(semid_t *idp, const char *name, int oflag, mode_t mode, unsigned int value)
SYS_KSEM_UNLINK			equ 406 ; int ksem_unlink(const char *name)
SYS_KSEM_GETVALUE		equ 407 ; int ksem_getvalue(semid_t id, int *val)
SYS_KSEM_DESTROY		equ 408 ; int ksem_destroy(semid_t id)
%endif
SYS___MAC_GET_PID		equ 409 ; int __mac_get_pid(pid_t pid, struct mac *mac_p)
SYS___MAC_GET_LINK		equ 410 ; int __mac_get_link(const char *path_p, struct mac *mac_p)
SYS___MAC_SET_LINK		equ 411 ; int __mac_set_link(const char *path_p, struct mac *mac_p)
SYS_EXTATTR_SET_LINK		equ 412 ; int extattr_set_link( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_GET_LINK		equ 413 ; ssize_t extattr_get_link( const char *path, int attrnamespace, const char *attrname, void *data, size_t nbytes)
SYS_EXTATTR_DELETE_LINK		equ 414 ; int extattr_delete_link( const char *path, int attrnamespace, const char *attrname)
SYS___MAC_EXECVE		equ 415 ; int __mac_execve(char *fname, char **argv, char **envv, struct mac *mac_p)
SYS_SIGACTION			equ 416 ; int sigaction(int sig, const struct sigaction *act, struct sigaction *oact)
SYS_SIGRETURN			equ 417 ; int sigreturn( const struct __ucontext *sigcntxp)
;SYS___XSTAT			equ 418 ; UNIMPLEMENTED
;SYS___XFSTAT			equ 419 ; UNIMPLEMENTED
;SYS___XLSTAT			equ 420 ; UNIMPLEMENTED
SYS_GETCONTEXT			equ 421 ; int getcontext(struct __ucontext *ucp)
SYS_SETCONTEXT			equ 422 ; int setcontext( const struct __ucontext *ucp)
SYS_SWAPCONTEXT			equ 423 ; int swapcontext(struct __ucontext *oucp, const struct __ucontext *ucp)
SYS_SWAPOFF			equ 424 ; int swapoff(const char *name)
SYS___ACL_GET_LINK		equ 425 ; int __acl_get_link(const char *path, acl_type_t type, struct acl *aclp)
SYS___ACL_SET_LINK		equ 426 ; int __acl_set_link(const char *path, acl_type_t type, struct acl *aclp)
SYS___ACL_DELETE_LINK		equ 427 ; int __acl_delete_link(const char *path, acl_type_t type)
SYS___ACL_ACLCHECK_LINK		equ 428 ; int __acl_aclcheck_link(const char *path, acl_type_t type, struct acl *aclp)
SYS_SIGWAIT			equ 429 ; int sigwait(const sigset_t *set, int *sig)
SYS_THR_CREATE			equ 430 ; int thr_create(ucontext_t *ctx, long *id, int flags)
SYS_THR_EXIT			equ 431 ; void thr_exit(long *state)
SYS_THR_SELF			equ 432 ; int thr_self(long *id)
SYS_THR_KILL			equ 433 ; int thr_kill(long id, int sig)
SYS__UMTX_LOCK			equ 434 ; int _umtx_lock(struct umtx *umtx)
SYS__UMTX_UNLOCK		equ 435 ; int _umtx_unlock(struct umtx *umtx)
SYS_JAIL_ATTACH			equ 436 ; int jail_attach(int jid)
SYS_EXTATTR_LIST_FD		equ 437 ; ssize_t extattr_list_fd(int fd, int attrnamespace, void *data, size_t nbytes)
SYS_EXTATTR_LIST_FILE		equ 438 ; ssize_t extattr_list_file( const char *path, int attrnamespace, void *data, size_t nbytes)
SYS_EXTATTR_LIST_LINK		equ 439 ; ssize_t extattr_list_link( const char *path, int attrnamespace, void *data, size_t nbytes)
;SYS_KSE_SWITCHIN		equ 440 ; UNIMPLEMENTED
SYS_KSEM_TIMEDWAIT		equ 441 ; int ksem_timedwait(semid_t id, const struct timespec *abstime)
SYS_THR_SUSPEND			equ 442 ; int thr_suspend( const struct timespec *timeout)
SYS_THR_WAKE			equ 443 ; int thr_wake(long id)
SYS_KLDUNLOADF			equ 444 ; int kldunloadf(int fileid, int flags)
SYS_AUDIT			equ 445 ; int audit(const void *record, u_int length)
SYS_AUDITON			equ 446 ; int auditon(int cmd, void *data, u_int length)
SYS_GETAUID			equ 447 ; int getauid(uid_t *auid)
SYS_SETAUID			equ 448 ; int setauid(uid_t *auid)
SYS_GETAUDIT			equ 449 ; int getaudit(struct auditinfo *auditinfo)
SYS_SETAUDIT			equ 450 ; int setaudit(struct auditinfo *auditinfo)
SYS_GETAUDIT_ADDR		equ 451 ; int getaudit_addr( struct auditinfo_addr *auditinfo_addr, u_int length)
SYS_SETAUDIT_ADDR		equ 452 ; int setaudit_addr( struct auditinfo_addr *auditinfo_addr, u_int length)
SYS_AUDITCTL			equ 453 ; int auditctl(char *path)
SYS__UMTX_OP			equ 454 ; int _umtx_op(void *obj, int op, u_long val, void *uaddr1, void *uaddr2)
SYS_THR_NEW			equ 455 ; int thr_new(struct thr_param *param, int param_size)
SYS_SIGQUEUE			equ 456 ; int sigqueue(pid_t pid, int signum, void *value)
%ifdef _NOSTD_
SYS_KMQ_OPEN			equ 457 ; int kmq_open(const char *path, int flags, mode_t mode, const struct mq_attr *attr)
SYS_KMQ_SETATTR			equ 458 ; int kmq_setattr(int mqd, const struct mq_attr *attr, struct mq_attr *oattr)
SYS_KMQ_TIMEDRECEIVE		equ 459 ; int kmq_timedreceive(int mqd, char *msg_ptr, size_t msg_len, unsigned *msg_prio, const struct timespec *abs_timeout)
SYS_KMQ_TIMEDSEND		equ 460 ; int kmq_timedsend(int mqd, const char *msg_ptr, size_t msg_len, unsigned msg_prio, const struct timespec *abs_timeout);}
SYS_KMQ_NOTIFY			equ 461 ; int kmq_notify(int mqd, const struct sigevent *sigev)
SYS_KMQ_UNLINK			equ 462 ; int kmq_unlink(const char *path)
%endif
SYS_ABORT2			equ 463 ; int abort2(const char *why, int nargs, void **args)
SYS_THR_SET_NAME		equ 464 ; int thr_set_name(long id, const char *name)
%ifdef _NOSTD_
SYS_AIO_FSYNC			equ 465 ; int aio_fsync(int op, struct aiocb *aiocbp)
%endif
SYS_RTPRIO_THREAD		equ 466 ; int rtprio_thread(int function, lwpid_t lwpid, struct rtprio *rtp)
;SYS_NOSYS			equ 467 ; UNIMPLEMENTED
;SYS_NOSYS			equ 468 ; UNIMPLEMENTED
;SYS___GETPATH_FROMFD		equ 469 ; UNIMPLEMENTED
;SYS___GETPATH_FROMADDR		equ 470 ; UNIMPLEMENTED
SYS_SCTP_PEELOFF		equ 471 ; int sctp_peeloff(int sd, uint32_t name)
SYS_SCTP_GENERIC_SENDMSG	equ 472 ; int sctp_generic_sendmsg(int sd, caddr_t msg, int mlen, caddr_t to, __socklen_t tolen, struct sctp_sndrcvinfo *sinfo, int flags)
SYS_SCTP_GENERIC_SENDMSG_IOV	equ 473 ; int sctp_generic_sendmsg_iov(int sd, struct iovec *iov, int iovlen, caddr_t to, __socklen_t tolen, struct sctp_sndrcvinfo *sinfo, int flags)
SYS_SCTP_GENERIC_RECVMSG	equ 474 ; int sctp_generic_recvmsg(int sd, struct iovec *iov, int iovlen, struct sockaddr * from, __socklen_t *fromlenaddr, struct sctp_sndrcvinfo *sinfo, int *msg_flags)
SYS_PREAD			equ 475 ; ssize_t pread(int fd, void *buf, size_t nbyte, off_t offset)
SYS_PWRITE			equ 476 ; ssize_t pwrite(int fd, const void *buf, size_t nbyte, off_t offset)
SYS_MMAP			equ 477 ; caddr_t mmap(caddr_t addr, size_t len, int prot, int flags, int fd, off_t pos)
SYS_LSEEK			equ 478 ; off_t lseek(int fd, off_t offset, int whence)
SYS_TRUNCATE			equ 479 ; int truncate(char *path, off_t length)
SYS_FTRUNCATE			equ 480 ; int ftruncate(int fd, off_t length)
SYS_THR_KILL2			equ 481 ; int thr_kill2(pid_t pid, long id, int sig)
SYS_SHM_OPEN			equ 482 ; int shm_open(const char *path, int flags, mode_t mode)
SYS_SHM_UNLINK			equ 483 ; int shm_unlink(const char *path)
SYS_CPUSET			equ 484 ; int cpuset(cpusetid_t *setid)
SYS_CPUSET_SETID		equ 485 ; int cpuset_setid(cpuwhich_t which, id_t id, cpusetid_t setid)
SYS_CPUSET_GETID		equ 486 ; int cpuset_getid(cpulevel_t level, cpuwhich_t which, id_t id, cpusetid_t *setid)
SYS_CPUSET_GETAFFINITY		equ 487 ; int cpuset_getaffinity(cpulevel_t level, cpuwhich_t which, id_t id, size_t cpusetsize, cpuset_t *mask)
SYS_CPUSET_SETAFFINITY		equ 488 ; int cpuset_setaffinity(cpulevel_t level, cpuwhich_t which, id_t id, size_t cpusetsize, const cpuset_t *mask)
SYS_FACCESSAT			equ 489 ; int faccessat(int fd, char *path, int mode, int flag)
SYS_FCHMODAT			equ 490 ; int fchmodat(int fd, char *path, mode_t mode, int flag)
SYS_FCHOWNAT			equ 491 ; int fchownat(int fd, char *path, uid_t uid, gid_t gid, int flag)
SYS_FEXECVE			equ 492 ; int fexecve(int fd, char **argv, char **envv)
SYS_FSTATAT			equ 493 ; int fstatat(int fd, char *path, struct stat *buf, int flag)
SYS_FUTIMESAT			equ 494 ; int futimesat(int fd, char *path, struct timeval *times)
SYS_LINKAT			equ 495 ; int linkat(int fd1, char *path1, int fd2, char *path2, int flag)
SYS_MKDIRAT			equ 496 ; int mkdirat(int fd, char *path, mode_t mode)
SYS_MKFIFOAT			equ 497 ; int mkfifoat(int fd, char *path, mode_t mode)
SYS_MKNODAT			equ 498 ; int mknodat(int fd, char *path, mode_t mode, dev_t dev)
SYS_OPENAT			equ 499 ; int openat(int fd, char *path, int flag, mode_t mode)
SYS_READLINKAT			equ 500 ; int readlinkat(int fd, char *path, char *buf, size_t bufsize)
SYS_RENAMEAT			equ 501 ; int renameat(int oldfd, char *old, int newfd, char *new)
SYS_SYMLINKAT			equ 502 ; int symlinkat(char *path1, int fd, char *path2)
SYS_UNLINKAT			equ 503 ; int unlinkat(int fd, char *path, int flag)
SYS_POSIX_OPENPT		equ 504 ; int posix_openpt(int flags)
%ifdef _NOSTD_
SYS_GSSD_SYSCALL		equ 505 ; int gssd_syscall(char *path)
%endif
SYS_JAIL_GET			equ 506 ; int jail_get(struct iovec *iovp, unsigned int iovcnt, int flags)
SYS_JAIL_SET			equ 507 ; int jail_set(struct iovec *iovp, unsigned int iovcnt, int flags)
SYS_JAIL_REMOVE			equ 508 ; int jail_remove(int jid)
SYS_CLOSEFROM			equ 509 ; int closefrom(int lowfd)
%ifdef _NOSTD_
SYS___SEMCTL			equ 510 ; int __semctl(int semid, int semnum, int cmd, union semun *arg)
SYS_MSGCTL			equ 511 ; int msgctl(int msqid, int cmd, struct msqid_ds *buf)
SYS_SHMCTL			equ 512 ; int shmctl(int shmid, int cmd, struct shmid_ds *buf)
%endif
SYS_LPATHCONF			equ 513 ; int lpathconf(char *path, int name)
;SYS_CAP_NEW			equ 514 ; UNIMPLEMENTED
;SYS_CAP_GETRIGHTS		equ 515 ; UNIMPLEMENTED
;SYS_CAP_ENTER			equ 516 ; UNIMPLEMENTED
;SYS_CAP_GETMODE		equ 517 ; UNIMPLEMENTED
;SYS_PDFORK			equ 518 ; UNIMPLEMENTED
;SYS_PDKILL			equ 519 ; UNIMPLEMENTED
;SYS_PDGETPID			equ 520 ; UNIMPLEMENTED
;SYS_PDWAIT			equ 521 ; UNIMPLEMENTED
SYS_PSELECT			equ 522 ; int pselect(int nd, fd_set *in, fd_set *ou, fd_set *ex, const struct timespec *ts, const sigset_t *sm)

;==================== ERRNO =======================
; based on /usr/include/errno.h
;==================================================
EPERM			equ 1		; Operation not permitted 
ENOENT			equ 2		; No such file or directory 
ESRCH			equ 3		; No such process 
EINTR			equ 4		; Interrupted system call 
EIO			equ 5		; Input/output error 
ENXIO			equ 6		; Device not configured 
E2BIG			equ 7		; Argument list too long 
ENOEXEC			equ 8		; Exec format error 
EBADF			equ 9		; Bad file descriptor 
ECHILD			equ 10		; No child processes 
EDEADLK			equ 11		; Resource deadlock avoided 
ENOMEM			equ 12		; Cannot allocate memory 
EACCES			equ 13		; Permission denied 
EFAULT			equ 14		; Bad address 
ENOTBLK			equ 15		; Block device required 
EBUSY			equ 16		; Device busy 
EEXIST			equ 17		; File exists 
EXDEV			equ 18		; Cross-device link 
ENODEV			equ 19		; Operation not supported by device 
ENOTDIR			equ 20		; Not a directory 
EISDIR			equ 21		; Is a directory 
EINVAL			equ 22		; Invalid argument 
ENFILE			equ 23		; Too many open files in system 
EMFILE			equ 24		; Too many open files 
ENOTTY			equ 25		; Inappropriate ioctl for device 
ETXTBSY			equ 26		; Text file busy 
EFBIG			equ 27		; File too large 
ENOSPC			equ 28		; No space left on device 
ESPIPE			equ 29		; Illegal seek 
EROFS			equ 30		; Read-only filesystem 
EMLINK			equ 31		; Too many links 
EPIPE			equ 32		; Broken pipe 
EDOM			equ 33		; Numerical argument out of domain 
ERANGE			equ 34		; Result too large 
EAGAIN			equ 35		; Resource temporarily unavailable 
EWOULDBLOCK		equ EAGAIN	; Operation would block 
EINPROGRESS		equ 36		; Operation now in progress 
EALREADY		equ 37		; Operation already in progress 
ENOTSOCK		equ 38		; Socket operation on non-socket 
EDESTADDRREQ		equ 39		; Destination address required 
EMSGSIZE		equ 40		; Message too long 
EPROTOTYPE		equ 41		; Protocol wrong type for socket 
ENOPROTOOPT		equ 42		; Protocol not available 
EPROTONOSUPPORT		equ 43		; Protocol not supported 
ESOCKTNOSUPPORT		equ 44		; Socket type not supported 
EOPNOTSUPP		equ 45		; Operation not supported 
ENOTSUP			equ EOPNOTSUPP	; Operation not supported 
EPFNOSUPPORT		equ 46		; Protocol family not supported 
EAFNOSUPPORT		equ 47		; Address family not supported by protocol family 
EADDRINUSE		equ 48		; Address already in use 
EADDRNOTAVAIL		equ 49		; Can't assign requested address 
ENETDOWN		equ 50		; Network is down 
ENETUNREACH		equ 51		; Network is unreachable 
ENETRESET		equ 52		; Network dropped connection on reset 
ECONNABORTED		equ 53		; Software caused connection abort 
ECONNRESET		equ 54		; Connection reset by peer 
ENOBUFS			equ 55		; No buffer space available 
EISCONN			equ 56		; Socket is already connected 
ENOTCONN		equ 57		; Socket is not connected 
ESHUTDOWN		equ 58		; Can't send after socket shutdown 
ETOOMANYREFS		equ 59		; Too many references: can't splice 
ETIMEDOUT		equ 60		; Operation timed out 
ECONNREFUSED		equ 61		; Connection refused 
ELOOP			equ 62		; Too many levels of symbolic links 
ENAMETOOLONG		equ 63		; File name too long 
EHOSTDOWN		equ 64		; Host is down 
EHOSTUNREACH		equ 65		; No route to host 
ENOTEMPTY		equ 66		; Directory not empty 
EPROCLIM		equ 67		; Too many processes 
EUSERS			equ 68		; Too many users 
EDQUOT			equ 69		; Disc quota exceeded 
ESTALE			equ 70		; Stale NFS file handle 
EREMOTE			equ 71		; Too many levels of remote in path 
EBADRPC			equ 72		; RPC struct is bad 
ERPCMISMATCH		equ 73		; RPC version wrong 
EPROGUNAVAIL		equ 74		; RPC prog. not avail 
EPROGMISMATCH		equ 75		; Program version wrong 
EPROCUNAVAIL		equ 76		; Bad procedure for program 
ENOLCK			equ 77		; No locks available 
ENOSYS			equ 78		; Function not implemented 
EFTYPE			equ 79		; Inappropriate file type or format 
EAUTH			equ 80		; Authentication error 
ENEEDAUTH		equ 81		; Need authenticator 
EIDRM			equ 82		; Identifier removed 
ENOMSG			equ 83		; No message of desired type 
EOVERFLOW		equ 84		; Value too large to be stored in data type 
ECANCELED		equ 85		; Operation canceled 
EILSEQ			equ 86		; Illegal byte sequence 
ENOATTR			equ 87		; Attribute not found 
EDOOFUS			equ 88		; Programming error 
EBADMSG			equ 89		; Bad message 
EMULTIHOP		equ 90		; Multihop attempted 
ENOLINK			equ 91		; Link has been severed 
EPROTO			equ 92		; Protocol error 
ENOTCAPABLE		equ 93		; Capabilities insufficient 
ELAST			equ 93		; Must be equal largest errno 
; pseudo-errors returned inside kernel to modify return to process 
ERESTART		equ -1		; restart syscall 
EJUSTRETURN		equ -2		; don't modify regs, just return 
ENOIOCTL		equ -3		; ioctl not handled by this layer 
EDIRIOCTL		equ -4		; do direct ioctl in GEOM 

;===========================================
; Exit codes
;
EXIT_FAILURE	equ 1
EXIT_SUCCESS	equ 0

;===========================================
STDIN	equ 0	; standard input file descriptor
STDOUT	equ 1	; standard output file descriptor
STDERR	equ 2	; standard error file descriptor

;===========================================
SEEK_SET	equ 0	; set file offset to offset
SEEK_CUR	equ 1	; set file offset to current plus offset
SEEK_END	equ 2	; set file offset to EOF plus offset

;===========================================
; Kernel encoding of open mode; separate read and write bits that are
; independently testable: 1 greater than the above.
O_RDONLY	equ 0x0000	; open for reading only
O_WRONLY	equ 0x0001	; open for writing only
O_RDRW		equ 0x0002	; open for reading and writing
O_ACCMODE	equ 0x0003	; mask for above modes
O_NONBLOCK	equ 0x0004	; no delay
O_APPEND	equ 0x0008	; set append mode
O_SHLOCK	equ 0x0010	; open with shared file lock
O_EXLOCK	equ 0x0020	; open with exclusive file lock
O_ASYNC		equ 0x0040	; signal pgrp when data ready
O_FSYNC		equ 0x0080	; synchronous writes
O_SYNC		equ 0x0080	; POSIX synonym for O_FSYNC
O_NOFOLLOW	equ 0x0100	; don't follow symlinks
O_CREAT		equ 0x0200	; create if nonexistent
O_TRUNC		equ 0x0400	; truncate to zero length
O_EXCL		equ 0x0800	; error if already exists
O_NOCTTY	equ 0x8000	; don't assign controlling terminal
O_DIRECT	equ 0x00010000	; Attempt to bypass buffer cache
O_DIRECTORY	equ 0x00020000	; Fail if not directory
O_EXEC		equ 0x00040000	; Open for execute only
O_TTY_INIT	equ 0x00080000	; Restore default termios attributes

;=========================================
; flags for *at() syscalls
AT_FDCWD		equ -100	; Magic value that specify the use of the current working directory to determine the target of relative file paths in the openat() and similar syscalls
AT_EACCESS		equ 0x100	; Check access using effective user and group ID
AT_SYMLINK_NOFOLLOW	equ 0x200	; Do not follow symbolic links
AT_SYMLINK_FOLLOW	equ 0x400	; Follow symbolic link
AT_REMOVEDIR		equ 0x800	; Remove directory instead of file

;=========================================
; constants used by fcntl
F_DUPFD		equ 0  ; duplicate file descriptor
F_GETFD		equ 1  ; get file descriptor flags
F_SETFD		equ 2  ; set file descriptor flags
F_GETFL		equ 3  ; get file status flags
F_SETFL		equ 4  ; set file status flags
F_GETOW		equ 5  ; get SIGIO/SIGURG proc/pgrp
F_SETOW		equ 6  ; set SIGIO/SIGURG proc/pgrp
F_OGETL		equ 7  ; get record locking information
F_OSETL		equ 8  ; set record locking information
F_OSETLK	equ 9  ; F_SETLK; wait if blocked
F_DUP2F		equ 10 ; duplicate file descriptor to arg
F_GETL		equ 11 ; get record locking information
F_SETL		equ 12 ; set record locking information
F_SETLK		equ 13 ; F_SETLK; wait if blocked
F_SETLK_REMOT	equ 14 ; debugging support for remote locks
F_READAHEA	equ 15 ; read ahead
F_RDAHEA	equ 16 ; Darwin compatible read ahead

;============================================
; file descriptor flags (F_GETFD, F_SETFD)
FD_CLOEXEC	equ 1	; close-on-exec flag

;===========================================
; record locking flags (F_GETLK, F_SETLK, F_SETLKW)
F_RDLCK		equ 1 ; shared or read lock
F_UNLCK		equ 2 ; unlock
F_WRLCK		equ 3 ; exclusive or write lock
F_UNLCKSYS	equ 4 ; purge locks for a given system ID
F_CANCEL	equ 5 ; cancel an async lock request

;==========================================
; lock operations for flock(2)
LOCK_SH		equ 0x1	; shared file lock
LOCK_EX		equ 0x2	; exclusive file lock
LOCK_NB		equ 0x4	; don't block when locking
LOCK_UN		equ 0x8	; unlock file

;==========================================
; mmap(2) from sys/mman.h
PROT_NONE	equ 0x00 ; no permissions
PROT_READ	equ 0x01 ; pages can be read
PROT_WRITE	equ 0x02 ; pages can be written
PROT_EXEC	equ 0x04 ; pages can be executed

; Flags contain sharing type and options.
; Sharing types; choose one.
MAP_SHARED		equ 0x0001	; share changes
MAP_PRIVATE		equ 0x0002	; changes are private
;MAP_COPY		equ MAP_PRIVATE	; OBSOLETE
; Other flags
MAP_FIXED		equ 0x0010	; map addr must be exactly as requested
MAP_RENAME		equ 0x0020	; Sun: rename private pages to file
MAP_NORESERVE		equ 0x0040	; Sun: don't reserve needed swap area
MAP_RESERVED0080	equ 0x0080	; previously misimplemented MAP_INHERIT
MAP_RESERVED0100	equ 0x0100	; previously unimplemented MAP_NOEXTEND
MAP_HASSEMAPHORE	equ 0x0200	; region may contain semaphores
MAP_STACK		equ 0x0400	; region grows down, like a stack
MAP_NOSYNC		equ 0x0800	; page to but do not sync underlying file
; Mapping type
MAP_FILE		equ 0x0000	; map from file (default)
MAP_ANON		equ 0x1000	; allocated from memory, swap space
; Extended flags
MAP_NOCORE		equ 0x00020000  ; dont include these pages in a coredump

; vim: set ts=8 sw=8 nowrap syntax=nasm: