; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28102 () Bool)

(assert start!28102)

(declare-fun b!288084 () Bool)

(declare-fun e!182404 () Bool)

(declare-fun e!182403 () Bool)

(assert (=> b!288084 (= e!182404 e!182403)))

(declare-fun res!149824 () Bool)

(assert (=> b!288084 (=> (not res!149824) (not e!182403))))

(declare-fun lt!141905 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1976 0))(
  ( (MissingZero!1976 (index!10074 (_ BitVec 32))) (Found!1976 (index!10075 (_ BitVec 32))) (Intermediate!1976 (undefined!2788 Bool) (index!10076 (_ BitVec 32)) (x!28399 (_ BitVec 32))) (Undefined!1976) (MissingVacant!1976 (index!10077 (_ BitVec 32))) )
))
(declare-fun lt!141907 () SeekEntryResult!1976)

(assert (=> b!288084 (= res!149824 (or lt!141905 (= lt!141907 (MissingVacant!1976 i!1256))))))

(assert (=> b!288084 (= lt!141905 (= lt!141907 (MissingZero!1976 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14466 0))(
  ( (array!14467 (arr!6862 (Array (_ BitVec 32) (_ BitVec 64))) (size!7214 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14466)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14466 (_ BitVec 32)) SeekEntryResult!1976)

(assert (=> b!288084 (= lt!141907 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288085 () Bool)

(declare-fun e!182402 () Bool)

(assert (=> b!288085 (= e!182402 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(declare-fun lt!141904 () SeekEntryResult!1976)

(assert (=> b!288085 (and (= (select (arr!6862 a!3312) (index!10076 lt!141904)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10076 lt!141904) i!1256))))

(declare-fun b!288086 () Bool)

(declare-fun res!149826 () Bool)

(assert (=> b!288086 (=> (not res!149826) (not e!182404))))

(declare-fun arrayContainsKey!0 (array!14466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288086 (= res!149826 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288087 () Bool)

(declare-fun e!182405 () Bool)

(assert (=> b!288087 (= e!182403 e!182405)))

(declare-fun res!149823 () Bool)

(assert (=> b!288087 (=> (not res!149823) (not e!182405))))

(assert (=> b!288087 (= res!149823 lt!141905)))

(declare-fun lt!141909 () (_ BitVec 32))

(declare-fun lt!141906 () SeekEntryResult!1976)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14466 (_ BitVec 32)) SeekEntryResult!1976)

(assert (=> b!288087 (= lt!141906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141909 k0!2524 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)) mask!3809))))

(assert (=> b!288087 (= lt!141904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141909 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288087 (= lt!141909 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!149827 () Bool)

(assert (=> start!28102 (=> (not res!149827) (not e!182404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28102 (= res!149827 (validMask!0 mask!3809))))

(assert (=> start!28102 e!182404))

(assert (=> start!28102 true))

(declare-fun array_inv!4812 (array!14466) Bool)

(assert (=> start!28102 (array_inv!4812 a!3312)))

(declare-fun b!288088 () Bool)

(assert (=> b!288088 (= e!182405 e!182402)))

(declare-fun res!149822 () Bool)

(assert (=> b!288088 (=> (not res!149822) (not e!182402))))

(declare-fun lt!141908 () Bool)

(assert (=> b!288088 (= res!149822 (and (or lt!141908 (not (undefined!2788 lt!141904))) (or lt!141908 (not (= (select (arr!6862 a!3312) (index!10076 lt!141904)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141908 (not (= (select (arr!6862 a!3312) (index!10076 lt!141904)) k0!2524))) (not lt!141908)))))

(get-info :version)

(assert (=> b!288088 (= lt!141908 (not ((_ is Intermediate!1976) lt!141904)))))

(declare-fun b!288089 () Bool)

(declare-fun res!149828 () Bool)

(assert (=> b!288089 (=> (not res!149828) (not e!182404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288089 (= res!149828 (validKeyInArray!0 k0!2524))))

(declare-fun b!288090 () Bool)

(declare-fun res!149825 () Bool)

(assert (=> b!288090 (=> (not res!149825) (not e!182404))))

(assert (=> b!288090 (= res!149825 (and (= (size!7214 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7214 a!3312))))))

(declare-fun b!288091 () Bool)

(declare-fun res!149829 () Bool)

(assert (=> b!288091 (=> (not res!149829) (not e!182403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14466 (_ BitVec 32)) Bool)

(assert (=> b!288091 (= res!149829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28102 res!149827) b!288090))

(assert (= (and b!288090 res!149825) b!288089))

(assert (= (and b!288089 res!149828) b!288086))

(assert (= (and b!288086 res!149826) b!288084))

(assert (= (and b!288084 res!149824) b!288091))

(assert (= (and b!288091 res!149829) b!288087))

(assert (= (and b!288087 res!149823) b!288088))

(assert (= (and b!288088 res!149822) b!288085))

(declare-fun m!302585 () Bool)

(assert (=> b!288086 m!302585))

(declare-fun m!302587 () Bool)

(assert (=> b!288089 m!302587))

(declare-fun m!302589 () Bool)

(assert (=> b!288091 m!302589))

(declare-fun m!302591 () Bool)

(assert (=> b!288088 m!302591))

(declare-fun m!302593 () Bool)

(assert (=> start!28102 m!302593))

(declare-fun m!302595 () Bool)

(assert (=> start!28102 m!302595))

(declare-fun m!302597 () Bool)

(assert (=> b!288084 m!302597))

(declare-fun m!302599 () Bool)

(assert (=> b!288087 m!302599))

(declare-fun m!302601 () Bool)

(assert (=> b!288087 m!302601))

(declare-fun m!302603 () Bool)

(assert (=> b!288087 m!302603))

(declare-fun m!302605 () Bool)

(assert (=> b!288087 m!302605))

(assert (=> b!288085 m!302591))

(check-sat (not b!288089) (not b!288091) (not b!288084) (not b!288087) (not start!28102) (not b!288086))
(check-sat)
(get-model)

(declare-fun d!66231 () Bool)

(assert (=> d!66231 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!288089 d!66231))

(declare-fun b!288158 () Bool)

(declare-fun e!182449 () SeekEntryResult!1976)

(assert (=> b!288158 (= e!182449 Undefined!1976)))

(declare-fun e!182448 () SeekEntryResult!1976)

(declare-fun lt!141953 () SeekEntryResult!1976)

(declare-fun b!288159 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14466 (_ BitVec 32)) SeekEntryResult!1976)

(assert (=> b!288159 (= e!182448 (seekKeyOrZeroReturnVacant!0 (x!28399 lt!141953) (index!10076 lt!141953) (index!10076 lt!141953) k0!2524 a!3312 mask!3809))))

(declare-fun b!288160 () Bool)

(declare-fun c!46698 () Bool)

(declare-fun lt!141952 () (_ BitVec 64))

(assert (=> b!288160 (= c!46698 (= lt!141952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182450 () SeekEntryResult!1976)

(assert (=> b!288160 (= e!182450 e!182448)))

(declare-fun d!66233 () Bool)

(declare-fun lt!141954 () SeekEntryResult!1976)

(assert (=> d!66233 (and (or ((_ is Undefined!1976) lt!141954) (not ((_ is Found!1976) lt!141954)) (and (bvsge (index!10075 lt!141954) #b00000000000000000000000000000000) (bvslt (index!10075 lt!141954) (size!7214 a!3312)))) (or ((_ is Undefined!1976) lt!141954) ((_ is Found!1976) lt!141954) (not ((_ is MissingZero!1976) lt!141954)) (and (bvsge (index!10074 lt!141954) #b00000000000000000000000000000000) (bvslt (index!10074 lt!141954) (size!7214 a!3312)))) (or ((_ is Undefined!1976) lt!141954) ((_ is Found!1976) lt!141954) ((_ is MissingZero!1976) lt!141954) (not ((_ is MissingVacant!1976) lt!141954)) (and (bvsge (index!10077 lt!141954) #b00000000000000000000000000000000) (bvslt (index!10077 lt!141954) (size!7214 a!3312)))) (or ((_ is Undefined!1976) lt!141954) (ite ((_ is Found!1976) lt!141954) (= (select (arr!6862 a!3312) (index!10075 lt!141954)) k0!2524) (ite ((_ is MissingZero!1976) lt!141954) (= (select (arr!6862 a!3312) (index!10074 lt!141954)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1976) lt!141954) (= (select (arr!6862 a!3312) (index!10077 lt!141954)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66233 (= lt!141954 e!182449)))

(declare-fun c!46699 () Bool)

(assert (=> d!66233 (= c!46699 (and ((_ is Intermediate!1976) lt!141953) (undefined!2788 lt!141953)))))

(assert (=> d!66233 (= lt!141953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66233 (validMask!0 mask!3809)))

(assert (=> d!66233 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141954)))

(declare-fun b!288161 () Bool)

(assert (=> b!288161 (= e!182450 (Found!1976 (index!10076 lt!141953)))))

(declare-fun b!288162 () Bool)

(assert (=> b!288162 (= e!182448 (MissingZero!1976 (index!10076 lt!141953)))))

(declare-fun b!288163 () Bool)

(assert (=> b!288163 (= e!182449 e!182450)))

(assert (=> b!288163 (= lt!141952 (select (arr!6862 a!3312) (index!10076 lt!141953)))))

(declare-fun c!46697 () Bool)

(assert (=> b!288163 (= c!46697 (= lt!141952 k0!2524))))

(assert (= (and d!66233 c!46699) b!288158))

(assert (= (and d!66233 (not c!46699)) b!288163))

(assert (= (and b!288163 c!46697) b!288161))

(assert (= (and b!288163 (not c!46697)) b!288160))

(assert (= (and b!288160 c!46698) b!288162))

(assert (= (and b!288160 (not c!46698)) b!288159))

(declare-fun m!302655 () Bool)

(assert (=> b!288159 m!302655))

(assert (=> d!66233 m!302593))

(declare-fun m!302657 () Bool)

(assert (=> d!66233 m!302657))

(assert (=> d!66233 m!302605))

(assert (=> d!66233 m!302605))

(declare-fun m!302659 () Bool)

(assert (=> d!66233 m!302659))

(declare-fun m!302661 () Bool)

(assert (=> d!66233 m!302661))

(declare-fun m!302663 () Bool)

(assert (=> d!66233 m!302663))

(declare-fun m!302665 () Bool)

(assert (=> b!288163 m!302665))

(assert (=> b!288084 d!66233))

(declare-fun d!66241 () Bool)

(declare-fun res!149888 () Bool)

(declare-fun e!182455 () Bool)

(assert (=> d!66241 (=> res!149888 e!182455)))

(assert (=> d!66241 (= res!149888 (= (select (arr!6862 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66241 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!182455)))

(declare-fun b!288168 () Bool)

(declare-fun e!182456 () Bool)

(assert (=> b!288168 (= e!182455 e!182456)))

(declare-fun res!149889 () Bool)

(assert (=> b!288168 (=> (not res!149889) (not e!182456))))

(assert (=> b!288168 (= res!149889 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7214 a!3312)))))

(declare-fun b!288169 () Bool)

(assert (=> b!288169 (= e!182456 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66241 (not res!149888)) b!288168))

(assert (= (and b!288168 res!149889) b!288169))

(declare-fun m!302667 () Bool)

(assert (=> d!66241 m!302667))

(declare-fun m!302669 () Bool)

(assert (=> b!288169 m!302669))

(assert (=> b!288086 d!66241))

(declare-fun b!288206 () Bool)

(declare-fun e!182478 () SeekEntryResult!1976)

(assert (=> b!288206 (= e!182478 (Intermediate!1976 false lt!141909 #b00000000000000000000000000000000))))

(declare-fun b!288207 () Bool)

(declare-fun lt!141963 () SeekEntryResult!1976)

(assert (=> b!288207 (and (bvsge (index!10076 lt!141963) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141963) (size!7214 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)))))))

(declare-fun res!149902 () Bool)

(assert (=> b!288207 (= res!149902 (= (select (arr!6862 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312))) (index!10076 lt!141963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182479 () Bool)

(assert (=> b!288207 (=> res!149902 e!182479)))

(declare-fun b!288208 () Bool)

(assert (=> b!288208 (and (bvsge (index!10076 lt!141963) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141963) (size!7214 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)))))))

(assert (=> b!288208 (= e!182479 (= (select (arr!6862 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312))) (index!10076 lt!141963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288209 () Bool)

(declare-fun e!182481 () SeekEntryResult!1976)

(assert (=> b!288209 (= e!182481 e!182478)))

(declare-fun c!46713 () Bool)

(declare-fun lt!141964 () (_ BitVec 64))

(assert (=> b!288209 (= c!46713 (or (= lt!141964 k0!2524) (= (bvadd lt!141964 lt!141964) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288210 () Bool)

(assert (=> b!288210 (= e!182481 (Intermediate!1976 true lt!141909 #b00000000000000000000000000000000))))

(declare-fun b!288211 () Bool)

(declare-fun e!182480 () Bool)

(declare-fun e!182477 () Bool)

(assert (=> b!288211 (= e!182480 e!182477)))

(declare-fun res!149903 () Bool)

(assert (=> b!288211 (= res!149903 (and ((_ is Intermediate!1976) lt!141963) (not (undefined!2788 lt!141963)) (bvslt (x!28399 lt!141963) #b01111111111111111111111111111110) (bvsge (x!28399 lt!141963) #b00000000000000000000000000000000) (bvsge (x!28399 lt!141963) #b00000000000000000000000000000000)))))

(assert (=> b!288211 (=> (not res!149903) (not e!182477))))

(declare-fun d!66243 () Bool)

(assert (=> d!66243 e!182480))

(declare-fun c!46712 () Bool)

(assert (=> d!66243 (= c!46712 (and ((_ is Intermediate!1976) lt!141963) (undefined!2788 lt!141963)))))

(assert (=> d!66243 (= lt!141963 e!182481)))

(declare-fun c!46714 () Bool)

(assert (=> d!66243 (= c!46714 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66243 (= lt!141964 (select (arr!6862 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312))) lt!141909))))

(assert (=> d!66243 (validMask!0 mask!3809)))

(assert (=> d!66243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141909 k0!2524 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)) mask!3809) lt!141963)))

(declare-fun b!288212 () Bool)

(assert (=> b!288212 (= e!182480 (bvsge (x!28399 lt!141963) #b01111111111111111111111111111110))))

(declare-fun b!288213 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288213 (= e!182478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)) mask!3809))))

(declare-fun b!288214 () Bool)

(assert (=> b!288214 (and (bvsge (index!10076 lt!141963) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141963) (size!7214 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312)))))))

(declare-fun res!149904 () Bool)

(assert (=> b!288214 (= res!149904 (= (select (arr!6862 (array!14467 (store (arr!6862 a!3312) i!1256 k0!2524) (size!7214 a!3312))) (index!10076 lt!141963)) k0!2524))))

(assert (=> b!288214 (=> res!149904 e!182479)))

(assert (=> b!288214 (= e!182477 e!182479)))

(assert (= (and d!66243 c!46714) b!288210))

(assert (= (and d!66243 (not c!46714)) b!288209))

(assert (= (and b!288209 c!46713) b!288206))

(assert (= (and b!288209 (not c!46713)) b!288213))

(assert (= (and d!66243 c!46712) b!288212))

(assert (= (and d!66243 (not c!46712)) b!288211))

(assert (= (and b!288211 res!149903) b!288214))

(assert (= (and b!288214 (not res!149904)) b!288207))

(assert (= (and b!288207 (not res!149902)) b!288208))

(declare-fun m!302671 () Bool)

(assert (=> b!288208 m!302671))

(assert (=> b!288207 m!302671))

(declare-fun m!302673 () Bool)

(assert (=> d!66243 m!302673))

(assert (=> d!66243 m!302593))

(declare-fun m!302675 () Bool)

(assert (=> b!288213 m!302675))

(assert (=> b!288213 m!302675))

(declare-fun m!302677 () Bool)

(assert (=> b!288213 m!302677))

(assert (=> b!288214 m!302671))

(assert (=> b!288087 d!66243))

(declare-fun b!288215 () Bool)

(declare-fun e!182483 () SeekEntryResult!1976)

(assert (=> b!288215 (= e!182483 (Intermediate!1976 false lt!141909 #b00000000000000000000000000000000))))

(declare-fun b!288216 () Bool)

(declare-fun lt!141965 () SeekEntryResult!1976)

(assert (=> b!288216 (and (bvsge (index!10076 lt!141965) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141965) (size!7214 a!3312)))))

(declare-fun res!149905 () Bool)

(assert (=> b!288216 (= res!149905 (= (select (arr!6862 a!3312) (index!10076 lt!141965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182484 () Bool)

(assert (=> b!288216 (=> res!149905 e!182484)))

(declare-fun b!288217 () Bool)

(assert (=> b!288217 (and (bvsge (index!10076 lt!141965) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141965) (size!7214 a!3312)))))

(assert (=> b!288217 (= e!182484 (= (select (arr!6862 a!3312) (index!10076 lt!141965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288218 () Bool)

(declare-fun e!182486 () SeekEntryResult!1976)

(assert (=> b!288218 (= e!182486 e!182483)))

(declare-fun c!46716 () Bool)

(declare-fun lt!141966 () (_ BitVec 64))

(assert (=> b!288218 (= c!46716 (or (= lt!141966 k0!2524) (= (bvadd lt!141966 lt!141966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288219 () Bool)

(assert (=> b!288219 (= e!182486 (Intermediate!1976 true lt!141909 #b00000000000000000000000000000000))))

(declare-fun b!288220 () Bool)

(declare-fun e!182485 () Bool)

(declare-fun e!182482 () Bool)

(assert (=> b!288220 (= e!182485 e!182482)))

(declare-fun res!149906 () Bool)

(assert (=> b!288220 (= res!149906 (and ((_ is Intermediate!1976) lt!141965) (not (undefined!2788 lt!141965)) (bvslt (x!28399 lt!141965) #b01111111111111111111111111111110) (bvsge (x!28399 lt!141965) #b00000000000000000000000000000000) (bvsge (x!28399 lt!141965) #b00000000000000000000000000000000)))))

(assert (=> b!288220 (=> (not res!149906) (not e!182482))))

(declare-fun d!66251 () Bool)

(assert (=> d!66251 e!182485))

(declare-fun c!46715 () Bool)

(assert (=> d!66251 (= c!46715 (and ((_ is Intermediate!1976) lt!141965) (undefined!2788 lt!141965)))))

(assert (=> d!66251 (= lt!141965 e!182486)))

(declare-fun c!46717 () Bool)

(assert (=> d!66251 (= c!46717 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66251 (= lt!141966 (select (arr!6862 a!3312) lt!141909))))

(assert (=> d!66251 (validMask!0 mask!3809)))

(assert (=> d!66251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141909 k0!2524 a!3312 mask!3809) lt!141965)))

(declare-fun b!288221 () Bool)

(assert (=> b!288221 (= e!182485 (bvsge (x!28399 lt!141965) #b01111111111111111111111111111110))))

(declare-fun b!288222 () Bool)

(assert (=> b!288222 (= e!182483 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!288223 () Bool)

(assert (=> b!288223 (and (bvsge (index!10076 lt!141965) #b00000000000000000000000000000000) (bvslt (index!10076 lt!141965) (size!7214 a!3312)))))

(declare-fun res!149907 () Bool)

(assert (=> b!288223 (= res!149907 (= (select (arr!6862 a!3312) (index!10076 lt!141965)) k0!2524))))

(assert (=> b!288223 (=> res!149907 e!182484)))

(assert (=> b!288223 (= e!182482 e!182484)))

(assert (= (and d!66251 c!46717) b!288219))

(assert (= (and d!66251 (not c!46717)) b!288218))

(assert (= (and b!288218 c!46716) b!288215))

(assert (= (and b!288218 (not c!46716)) b!288222))

(assert (= (and d!66251 c!46715) b!288221))

(assert (= (and d!66251 (not c!46715)) b!288220))

(assert (= (and b!288220 res!149906) b!288223))

(assert (= (and b!288223 (not res!149907)) b!288216))

(assert (= (and b!288216 (not res!149905)) b!288217))

(declare-fun m!302679 () Bool)

(assert (=> b!288217 m!302679))

(assert (=> b!288216 m!302679))

(declare-fun m!302681 () Bool)

(assert (=> d!66251 m!302681))

(assert (=> d!66251 m!302593))

(assert (=> b!288222 m!302675))

(assert (=> b!288222 m!302675))

(declare-fun m!302683 () Bool)

(assert (=> b!288222 m!302683))

(assert (=> b!288223 m!302679))

(assert (=> b!288087 d!66251))

(declare-fun d!66253 () Bool)

(declare-fun lt!141976 () (_ BitVec 32))

(declare-fun lt!141975 () (_ BitVec 32))

(assert (=> d!66253 (= lt!141976 (bvmul (bvxor lt!141975 (bvlshr lt!141975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66253 (= lt!141975 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66253 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149911 (let ((h!5168 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28404 (bvmul (bvxor h!5168 (bvlshr h!5168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28404 (bvlshr x!28404 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149911 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149911 #b00000000000000000000000000000000))))))

(assert (=> d!66253 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141976 (bvlshr lt!141976 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!288087 d!66253))

(declare-fun d!66263 () Bool)

(assert (=> d!66263 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28102 d!66263))

(declare-fun d!66267 () Bool)

(assert (=> d!66267 (= (array_inv!4812 a!3312) (bvsge (size!7214 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28102 d!66267))

(declare-fun b!288274 () Bool)

(declare-fun e!182516 () Bool)

(declare-fun e!182517 () Bool)

(assert (=> b!288274 (= e!182516 e!182517)))

(declare-fun c!46738 () Bool)

(assert (=> b!288274 (= c!46738 (validKeyInArray!0 (select (arr!6862 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!288275 () Bool)

(declare-fun call!25615 () Bool)

(assert (=> b!288275 (= e!182517 call!25615)))

(declare-fun bm!25612 () Bool)

(assert (=> bm!25612 (= call!25615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!288276 () Bool)

(declare-fun e!182515 () Bool)

(assert (=> b!288276 (= e!182517 e!182515)))

(declare-fun lt!142003 () (_ BitVec 64))

(assert (=> b!288276 (= lt!142003 (select (arr!6862 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9044 0))(
  ( (Unit!9045) )
))
(declare-fun lt!142001 () Unit!9044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14466 (_ BitVec 64) (_ BitVec 32)) Unit!9044)

(assert (=> b!288276 (= lt!142001 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!142003 #b00000000000000000000000000000000))))

(assert (=> b!288276 (arrayContainsKey!0 a!3312 lt!142003 #b00000000000000000000000000000000)))

(declare-fun lt!142002 () Unit!9044)

(assert (=> b!288276 (= lt!142002 lt!142001)))

(declare-fun res!149920 () Bool)

(assert (=> b!288276 (= res!149920 (= (seekEntryOrOpen!0 (select (arr!6862 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1976 #b00000000000000000000000000000000)))))

(assert (=> b!288276 (=> (not res!149920) (not e!182515))))

(declare-fun b!288277 () Bool)

(assert (=> b!288277 (= e!182515 call!25615)))

(declare-fun d!66269 () Bool)

(declare-fun res!149921 () Bool)

(assert (=> d!66269 (=> res!149921 e!182516)))

(assert (=> d!66269 (= res!149921 (bvsge #b00000000000000000000000000000000 (size!7214 a!3312)))))

(assert (=> d!66269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182516)))

(assert (= (and d!66269 (not res!149921)) b!288274))

(assert (= (and b!288274 c!46738) b!288276))

(assert (= (and b!288274 (not c!46738)) b!288275))

(assert (= (and b!288276 res!149920) b!288277))

(assert (= (or b!288277 b!288275) bm!25612))

(assert (=> b!288274 m!302667))

(assert (=> b!288274 m!302667))

(declare-fun m!302699 () Bool)

(assert (=> b!288274 m!302699))

(declare-fun m!302701 () Bool)

(assert (=> bm!25612 m!302701))

(assert (=> b!288276 m!302667))

(declare-fun m!302703 () Bool)

(assert (=> b!288276 m!302703))

(declare-fun m!302705 () Bool)

(assert (=> b!288276 m!302705))

(assert (=> b!288276 m!302667))

(declare-fun m!302707 () Bool)

(assert (=> b!288276 m!302707))

(assert (=> b!288091 d!66269))

(check-sat (not b!288274) (not d!66233) (not b!288159) (not b!288276) (not d!66251) (not b!288222) (not b!288169) (not b!288213) (not bm!25612) (not d!66243))
(check-sat)
