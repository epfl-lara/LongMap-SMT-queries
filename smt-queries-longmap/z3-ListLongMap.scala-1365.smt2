; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26750 () Bool)

(assert start!26750)

(declare-fun b!277751 () Bool)

(declare-fun res!141611 () Bool)

(declare-fun e!177155 () Bool)

(assert (=> b!277751 (=> (not res!141611) (not e!177155))))

(declare-datatypes ((array!13836 0))(
  ( (array!13837 (arr!6567 (Array (_ BitVec 32) (_ BitVec 64))) (size!6920 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13836)

(declare-datatypes ((List!4348 0))(
  ( (Nil!4345) (Cons!4344 (h!5011 (_ BitVec 64)) (t!9421 List!4348)) )
))
(declare-fun arrayNoDuplicates!0 (array!13836 (_ BitVec 32) List!4348) Bool)

(assert (=> b!277751 (= res!141611 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4345))))

(declare-fun b!277752 () Bool)

(declare-fun e!177153 () Bool)

(declare-fun e!177152 () Bool)

(assert (=> b!277752 (= e!177153 e!177152)))

(declare-fun res!141609 () Bool)

(assert (=> b!277752 (=> (not res!141609) (not e!177152))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277752 (= res!141609 (= startIndex!26 i!1267))))

(declare-fun lt!137935 () array!13836)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!277752 (= lt!137935 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))

(declare-fun res!141612 () Bool)

(assert (=> start!26750 (=> (not res!141612) (not e!177155))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26750 (= res!141612 (validMask!0 mask!3868))))

(assert (=> start!26750 e!177155))

(declare-fun array_inv!4539 (array!13836) Bool)

(assert (=> start!26750 (array_inv!4539 a!3325)))

(assert (=> start!26750 true))

(declare-fun b!277753 () Bool)

(declare-fun res!141614 () Bool)

(assert (=> b!277753 (=> (not res!141614) (not e!177155))))

(assert (=> b!277753 (= res!141614 (and (= (size!6920 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6920 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6920 a!3325))))))

(declare-fun b!277754 () Bool)

(declare-datatypes ((Unit!8745 0))(
  ( (Unit!8746) )
))
(declare-fun e!177156 () Unit!8745)

(declare-fun lt!137934 () Unit!8745)

(assert (=> b!277754 (= e!177156 lt!137934)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8745)

(assert (=> b!277754 (= lt!137934 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13836 (_ BitVec 32)) Bool)

(assert (=> b!277754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137935 mask!3868)))

(declare-fun b!277755 () Bool)

(declare-fun res!141610 () Bool)

(assert (=> b!277755 (=> (not res!141610) (not e!177155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277755 (= res!141610 (validKeyInArray!0 k0!2581))))

(declare-fun b!277756 () Bool)

(declare-fun Unit!8747 () Unit!8745)

(assert (=> b!277756 (= e!177156 Unit!8747)))

(declare-fun b!277757 () Bool)

(assert (=> b!277757 (= e!177155 e!177153)))

(declare-fun res!141613 () Bool)

(assert (=> b!277757 (=> (not res!141613) (not e!177153))))

(declare-datatypes ((SeekEntryResult!1724 0))(
  ( (MissingZero!1724 (index!9066 (_ BitVec 32))) (Found!1724 (index!9067 (_ BitVec 32))) (Intermediate!1724 (undefined!2536 Bool) (index!9068 (_ BitVec 32)) (x!27328 (_ BitVec 32))) (Undefined!1724) (MissingVacant!1724 (index!9069 (_ BitVec 32))) )
))
(declare-fun lt!137936 () SeekEntryResult!1724)

(assert (=> b!277757 (= res!141613 (or (= lt!137936 (MissingZero!1724 i!1267)) (= lt!137936 (MissingVacant!1724 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13836 (_ BitVec 32)) SeekEntryResult!1724)

(assert (=> b!277757 (= lt!137936 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277758 () Bool)

(declare-fun res!141615 () Bool)

(assert (=> b!277758 (=> (not res!141615) (not e!177153))))

(assert (=> b!277758 (= res!141615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277759 () Bool)

(declare-fun res!141616 () Bool)

(assert (=> b!277759 (=> (not res!141616) (not e!177155))))

(declare-fun arrayContainsKey!0 (array!13836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277759 (= res!141616 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277760 () Bool)

(assert (=> b!277760 (= e!177152 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!137935 mask!3868)))))

(assert (=> b!277760 (= (seekEntryOrOpen!0 k0!2581 lt!137935 mask!3868) (Found!1724 i!1267))))

(declare-fun lt!137933 () Unit!8745)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8745)

(assert (=> b!277760 (= lt!137933 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!137937 () Unit!8745)

(assert (=> b!277760 (= lt!137937 e!177156)))

(declare-fun c!45622 () Bool)

(assert (=> b!277760 (= c!45622 (bvslt startIndex!26 (bvsub (size!6920 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26750 res!141612) b!277753))

(assert (= (and b!277753 res!141614) b!277755))

(assert (= (and b!277755 res!141610) b!277751))

(assert (= (and b!277751 res!141611) b!277759))

(assert (= (and b!277759 res!141616) b!277757))

(assert (= (and b!277757 res!141613) b!277758))

(assert (= (and b!277758 res!141615) b!277752))

(assert (= (and b!277752 res!141609) b!277760))

(assert (= (and b!277760 c!45622) b!277754))

(assert (= (and b!277760 (not c!45622)) b!277756))

(declare-fun m!292223 () Bool)

(assert (=> b!277759 m!292223))

(declare-fun m!292225 () Bool)

(assert (=> start!26750 m!292225))

(declare-fun m!292227 () Bool)

(assert (=> start!26750 m!292227))

(declare-fun m!292229 () Bool)

(assert (=> b!277752 m!292229))

(declare-fun m!292231 () Bool)

(assert (=> b!277760 m!292231))

(declare-fun m!292233 () Bool)

(assert (=> b!277760 m!292233))

(declare-fun m!292235 () Bool)

(assert (=> b!277760 m!292235))

(declare-fun m!292237 () Bool)

(assert (=> b!277757 m!292237))

(declare-fun m!292239 () Bool)

(assert (=> b!277751 m!292239))

(declare-fun m!292241 () Bool)

(assert (=> b!277754 m!292241))

(declare-fun m!292243 () Bool)

(assert (=> b!277754 m!292243))

(declare-fun m!292245 () Bool)

(assert (=> b!277755 m!292245))

(declare-fun m!292247 () Bool)

(assert (=> b!277758 m!292247))

(check-sat (not b!277751) (not b!277759) (not b!277758) (not b!277760) (not b!277757) (not start!26750) (not b!277754) (not b!277755))
(check-sat)
(get-model)

(declare-fun b!277831 () Bool)

(declare-fun e!177197 () Bool)

(declare-fun e!177198 () Bool)

(assert (=> b!277831 (= e!177197 e!177198)))

(declare-fun c!45631 () Bool)

(assert (=> b!277831 (= c!45631 (validKeyInArray!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64541 () Bool)

(declare-fun res!141672 () Bool)

(declare-fun e!177195 () Bool)

(assert (=> d!64541 (=> res!141672 e!177195)))

(assert (=> d!64541 (= res!141672 (bvsge #b00000000000000000000000000000000 (size!6920 a!3325)))))

(assert (=> d!64541 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4345) e!177195)))

(declare-fun b!277832 () Bool)

(assert (=> b!277832 (= e!177195 e!177197)))

(declare-fun res!141673 () Bool)

(assert (=> b!277832 (=> (not res!141673) (not e!177197))))

(declare-fun e!177196 () Bool)

(assert (=> b!277832 (= res!141673 (not e!177196))))

(declare-fun res!141671 () Bool)

(assert (=> b!277832 (=> (not res!141671) (not e!177196))))

(assert (=> b!277832 (= res!141671 (validKeyInArray!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!277833 () Bool)

(declare-fun call!25327 () Bool)

(assert (=> b!277833 (= e!177198 call!25327)))

(declare-fun bm!25324 () Bool)

(assert (=> bm!25324 (= call!25327 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45631 (Cons!4344 (select (arr!6567 a!3325) #b00000000000000000000000000000000) Nil!4345) Nil!4345)))))

(declare-fun b!277834 () Bool)

(assert (=> b!277834 (= e!177198 call!25327)))

(declare-fun b!277835 () Bool)

(declare-fun contains!1937 (List!4348 (_ BitVec 64)) Bool)

(assert (=> b!277835 (= e!177196 (contains!1937 Nil!4345 (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64541 (not res!141672)) b!277832))

(assert (= (and b!277832 res!141671) b!277835))

(assert (= (and b!277832 res!141673) b!277831))

(assert (= (and b!277831 c!45631) b!277834))

(assert (= (and b!277831 (not c!45631)) b!277833))

(assert (= (or b!277834 b!277833) bm!25324))

(declare-fun m!292301 () Bool)

(assert (=> b!277831 m!292301))

(assert (=> b!277831 m!292301))

(declare-fun m!292303 () Bool)

(assert (=> b!277831 m!292303))

(assert (=> b!277832 m!292301))

(assert (=> b!277832 m!292301))

(assert (=> b!277832 m!292303))

(assert (=> bm!25324 m!292301))

(declare-fun m!292305 () Bool)

(assert (=> bm!25324 m!292305))

(assert (=> b!277835 m!292301))

(assert (=> b!277835 m!292301))

(declare-fun m!292307 () Bool)

(assert (=> b!277835 m!292307))

(assert (=> b!277751 d!64541))

(declare-fun b!277856 () Bool)

(declare-fun e!177212 () SeekEntryResult!1724)

(declare-fun e!177211 () SeekEntryResult!1724)

(assert (=> b!277856 (= e!177212 e!177211)))

(declare-fun lt!137982 () (_ BitVec 64))

(declare-fun lt!137980 () SeekEntryResult!1724)

(assert (=> b!277856 (= lt!137982 (select (arr!6567 a!3325) (index!9068 lt!137980)))))

(declare-fun c!45642 () Bool)

(assert (=> b!277856 (= c!45642 (= lt!137982 k0!2581))))

(declare-fun b!277857 () Bool)

(assert (=> b!277857 (= e!177212 Undefined!1724)))

(declare-fun b!277858 () Bool)

(declare-fun e!177213 () SeekEntryResult!1724)

(assert (=> b!277858 (= e!177213 (MissingZero!1724 (index!9068 lt!137980)))))

(declare-fun b!277859 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13836 (_ BitVec 32)) SeekEntryResult!1724)

(assert (=> b!277859 (= e!177213 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!137980) (index!9068 lt!137980) (index!9068 lt!137980) k0!2581 a!3325 mask!3868))))

(declare-fun d!64543 () Bool)

(declare-fun lt!137981 () SeekEntryResult!1724)

(get-info :version)

(assert (=> d!64543 (and (or ((_ is Undefined!1724) lt!137981) (not ((_ is Found!1724) lt!137981)) (and (bvsge (index!9067 lt!137981) #b00000000000000000000000000000000) (bvslt (index!9067 lt!137981) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!137981) ((_ is Found!1724) lt!137981) (not ((_ is MissingZero!1724) lt!137981)) (and (bvsge (index!9066 lt!137981) #b00000000000000000000000000000000) (bvslt (index!9066 lt!137981) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!137981) ((_ is Found!1724) lt!137981) ((_ is MissingZero!1724) lt!137981) (not ((_ is MissingVacant!1724) lt!137981)) (and (bvsge (index!9069 lt!137981) #b00000000000000000000000000000000) (bvslt (index!9069 lt!137981) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!137981) (ite ((_ is Found!1724) lt!137981) (= (select (arr!6567 a!3325) (index!9067 lt!137981)) k0!2581) (ite ((_ is MissingZero!1724) lt!137981) (= (select (arr!6567 a!3325) (index!9066 lt!137981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!137981) (= (select (arr!6567 a!3325) (index!9069 lt!137981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64543 (= lt!137981 e!177212)))

(declare-fun c!45641 () Bool)

(assert (=> d!64543 (= c!45641 (and ((_ is Intermediate!1724) lt!137980) (undefined!2536 lt!137980)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13836 (_ BitVec 32)) SeekEntryResult!1724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64543 (= lt!137980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64543 (validMask!0 mask!3868)))

(assert (=> d!64543 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!137981)))

(declare-fun b!277860 () Bool)

(assert (=> b!277860 (= e!177211 (Found!1724 (index!9068 lt!137980)))))

(declare-fun b!277861 () Bool)

(declare-fun c!45640 () Bool)

(assert (=> b!277861 (= c!45640 (= lt!137982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!277861 (= e!177211 e!177213)))

(assert (= (and d!64543 c!45641) b!277857))

(assert (= (and d!64543 (not c!45641)) b!277856))

(assert (= (and b!277856 c!45642) b!277860))

(assert (= (and b!277856 (not c!45642)) b!277861))

(assert (= (and b!277861 c!45640) b!277858))

(assert (= (and b!277861 (not c!45640)) b!277859))

(declare-fun m!292309 () Bool)

(assert (=> b!277856 m!292309))

(declare-fun m!292311 () Bool)

(assert (=> b!277859 m!292311))

(declare-fun m!292313 () Bool)

(assert (=> d!64543 m!292313))

(declare-fun m!292315 () Bool)

(assert (=> d!64543 m!292315))

(declare-fun m!292317 () Bool)

(assert (=> d!64543 m!292317))

(assert (=> d!64543 m!292225))

(declare-fun m!292319 () Bool)

(assert (=> d!64543 m!292319))

(assert (=> d!64543 m!292313))

(declare-fun m!292321 () Bool)

(assert (=> d!64543 m!292321))

(assert (=> b!277757 d!64543))

(declare-fun b!277886 () Bool)

(declare-fun e!177229 () Bool)

(declare-fun call!25333 () Bool)

(assert (=> b!277886 (= e!177229 call!25333)))

(declare-fun b!277887 () Bool)

(declare-fun e!177230 () Bool)

(assert (=> b!277887 (= e!177230 call!25333)))

(declare-fun b!277888 () Bool)

(assert (=> b!277888 (= e!177230 e!177229)))

(declare-fun lt!138000 () (_ BitVec 64))

(assert (=> b!277888 (= lt!138000 (select (arr!6567 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!137998 () Unit!8745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13836 (_ BitVec 64) (_ BitVec 32)) Unit!8745)

(assert (=> b!277888 (= lt!137998 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138000 #b00000000000000000000000000000000))))

(assert (=> b!277888 (arrayContainsKey!0 a!3325 lt!138000 #b00000000000000000000000000000000)))

(declare-fun lt!137999 () Unit!8745)

(assert (=> b!277888 (= lt!137999 lt!137998)))

(declare-fun res!141684 () Bool)

(assert (=> b!277888 (= res!141684 (= (seekEntryOrOpen!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1724 #b00000000000000000000000000000000)))))

(assert (=> b!277888 (=> (not res!141684) (not e!177229))))

(declare-fun bm!25330 () Bool)

(assert (=> bm!25330 (= call!25333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!64549 () Bool)

(declare-fun res!141685 () Bool)

(declare-fun e!177231 () Bool)

(assert (=> d!64549 (=> res!141685 e!177231)))

(assert (=> d!64549 (= res!141685 (bvsge #b00000000000000000000000000000000 (size!6920 a!3325)))))

(assert (=> d!64549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177231)))

(declare-fun b!277889 () Bool)

(assert (=> b!277889 (= e!177231 e!177230)))

(declare-fun c!45652 () Bool)

(assert (=> b!277889 (= c!45652 (validKeyInArray!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64549 (not res!141685)) b!277889))

(assert (= (and b!277889 c!45652) b!277888))

(assert (= (and b!277889 (not c!45652)) b!277887))

(assert (= (and b!277888 res!141684) b!277886))

(assert (= (or b!277886 b!277887) bm!25330))

(assert (=> b!277888 m!292301))

(declare-fun m!292335 () Bool)

(assert (=> b!277888 m!292335))

(declare-fun m!292337 () Bool)

(assert (=> b!277888 m!292337))

(assert (=> b!277888 m!292301))

(declare-fun m!292339 () Bool)

(assert (=> b!277888 m!292339))

(declare-fun m!292341 () Bool)

(assert (=> bm!25330 m!292341))

(assert (=> b!277889 m!292301))

(assert (=> b!277889 m!292301))

(assert (=> b!277889 m!292303))

(assert (=> b!277758 d!64549))

(declare-fun d!64553 () Bool)

(assert (=> d!64553 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26750 d!64553))

(declare-fun d!64559 () Bool)

(assert (=> d!64559 (= (array_inv!4539 a!3325) (bvsge (size!6920 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26750 d!64559))

(declare-fun d!64561 () Bool)

(declare-fun res!141705 () Bool)

(declare-fun e!177266 () Bool)

(assert (=> d!64561 (=> res!141705 e!177266)))

(assert (=> d!64561 (= res!141705 (= (select (arr!6567 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64561 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177266)))

(declare-fun b!277939 () Bool)

(declare-fun e!177267 () Bool)

(assert (=> b!277939 (= e!177266 e!177267)))

(declare-fun res!141706 () Bool)

(assert (=> b!277939 (=> (not res!141706) (not e!177267))))

(assert (=> b!277939 (= res!141706 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 a!3325)))))

(declare-fun b!277940 () Bool)

(assert (=> b!277940 (= e!177267 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64561 (not res!141705)) b!277939))

(assert (= (and b!277939 res!141706) b!277940))

(assert (=> d!64561 m!292301))

(declare-fun m!292381 () Bool)

(assert (=> b!277940 m!292381))

(assert (=> b!277759 d!64561))

(declare-fun d!64567 () Bool)

(declare-fun e!177287 () Bool)

(assert (=> d!64567 e!177287))

(declare-fun res!141724 () Bool)

(assert (=> d!64567 (=> (not res!141724) (not e!177287))))

(assert (=> d!64567 (= res!141724 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6920 a!3325))))))

(declare-fun lt!138018 () Unit!8745)

(declare-fun choose!98 (array!13836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8745)

(assert (=> d!64567 (= lt!138018 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!64567 (validMask!0 mask!3868)))

(assert (=> d!64567 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!138018)))

(declare-fun b!277962 () Bool)

(assert (=> b!277962 (= e!177287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868))))

(assert (= (and d!64567 res!141724) b!277962))

(declare-fun m!292389 () Bool)

(assert (=> d!64567 m!292389))

(assert (=> d!64567 m!292225))

(assert (=> b!277962 m!292229))

(declare-fun m!292391 () Bool)

(assert (=> b!277962 m!292391))

(assert (=> b!277754 d!64567))

(declare-fun b!277963 () Bool)

(declare-fun e!177288 () Bool)

(declare-fun call!25339 () Bool)

(assert (=> b!277963 (= e!177288 call!25339)))

(declare-fun b!277964 () Bool)

(declare-fun e!177289 () Bool)

(assert (=> b!277964 (= e!177289 call!25339)))

(declare-fun b!277965 () Bool)

(assert (=> b!277965 (= e!177289 e!177288)))

(declare-fun lt!138021 () (_ BitVec 64))

(assert (=> b!277965 (= lt!138021 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138019 () Unit!8745)

(assert (=> b!277965 (= lt!138019 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138021 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!277965 (arrayContainsKey!0 lt!137935 lt!138021 #b00000000000000000000000000000000)))

(declare-fun lt!138020 () Unit!8745)

(assert (=> b!277965 (= lt!138020 lt!138019)))

(declare-fun res!141725 () Bool)

(assert (=> b!277965 (= res!141725 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!137935 mask!3868) (Found!1724 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!277965 (=> (not res!141725) (not e!177288))))

(declare-fun bm!25336 () Bool)

(assert (=> bm!25336 (= call!25339 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!137935 mask!3868))))

(declare-fun d!64573 () Bool)

(declare-fun res!141726 () Bool)

(declare-fun e!177290 () Bool)

(assert (=> d!64573 (=> res!141726 e!177290)))

(assert (=> d!64573 (= res!141726 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6920 lt!137935)))))

(assert (=> d!64573 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137935 mask!3868) e!177290)))

(declare-fun b!277966 () Bool)

(assert (=> b!277966 (= e!177290 e!177289)))

(declare-fun c!45670 () Bool)

(assert (=> b!277966 (= c!45670 (validKeyInArray!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (= (and d!64573 (not res!141726)) b!277966))

(assert (= (and b!277966 c!45670) b!277965))

(assert (= (and b!277966 (not c!45670)) b!277964))

(assert (= (and b!277965 res!141725) b!277963))

(assert (= (or b!277963 b!277964) bm!25336))

(declare-fun m!292393 () Bool)

(assert (=> b!277965 m!292393))

(declare-fun m!292395 () Bool)

(assert (=> b!277965 m!292395))

(declare-fun m!292397 () Bool)

(assert (=> b!277965 m!292397))

(assert (=> b!277965 m!292393))

(declare-fun m!292399 () Bool)

(assert (=> b!277965 m!292399))

(declare-fun m!292401 () Bool)

(assert (=> bm!25336 m!292401))

(assert (=> b!277966 m!292393))

(assert (=> b!277966 m!292393))

(declare-fun m!292403 () Bool)

(assert (=> b!277966 m!292403))

(assert (=> b!277754 d!64573))

(declare-fun b!277967 () Bool)

(declare-fun e!177291 () Bool)

(declare-fun call!25340 () Bool)

(assert (=> b!277967 (= e!177291 call!25340)))

(declare-fun b!277968 () Bool)

(declare-fun e!177292 () Bool)

(assert (=> b!277968 (= e!177292 call!25340)))

(declare-fun b!277969 () Bool)

(assert (=> b!277969 (= e!177292 e!177291)))

(declare-fun lt!138024 () (_ BitVec 64))

(assert (=> b!277969 (= lt!138024 (select (arr!6567 lt!137935) startIndex!26))))

(declare-fun lt!138022 () Unit!8745)

(assert (=> b!277969 (= lt!138022 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138024 startIndex!26))))

(assert (=> b!277969 (arrayContainsKey!0 lt!137935 lt!138024 #b00000000000000000000000000000000)))

(declare-fun lt!138023 () Unit!8745)

(assert (=> b!277969 (= lt!138023 lt!138022)))

(declare-fun res!141727 () Bool)

(assert (=> b!277969 (= res!141727 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) startIndex!26) lt!137935 mask!3868) (Found!1724 startIndex!26)))))

(assert (=> b!277969 (=> (not res!141727) (not e!177291))))

(declare-fun bm!25337 () Bool)

(assert (=> bm!25337 (= call!25340 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!137935 mask!3868))))

(declare-fun d!64575 () Bool)

(declare-fun res!141728 () Bool)

(declare-fun e!177293 () Bool)

(assert (=> d!64575 (=> res!141728 e!177293)))

(assert (=> d!64575 (= res!141728 (bvsge startIndex!26 (size!6920 lt!137935)))))

(assert (=> d!64575 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!137935 mask!3868) e!177293)))

(declare-fun b!277970 () Bool)

(assert (=> b!277970 (= e!177293 e!177292)))

(declare-fun c!45671 () Bool)

(assert (=> b!277970 (= c!45671 (validKeyInArray!0 (select (arr!6567 lt!137935) startIndex!26)))))

(assert (= (and d!64575 (not res!141728)) b!277970))

(assert (= (and b!277970 c!45671) b!277969))

(assert (= (and b!277970 (not c!45671)) b!277968))

(assert (= (and b!277969 res!141727) b!277967))

(assert (= (or b!277967 b!277968) bm!25337))

(declare-fun m!292405 () Bool)

(assert (=> b!277969 m!292405))

(declare-fun m!292407 () Bool)

(assert (=> b!277969 m!292407))

(declare-fun m!292409 () Bool)

(assert (=> b!277969 m!292409))

(assert (=> b!277969 m!292405))

(declare-fun m!292411 () Bool)

(assert (=> b!277969 m!292411))

(declare-fun m!292413 () Bool)

(assert (=> bm!25337 m!292413))

(assert (=> b!277970 m!292405))

(assert (=> b!277970 m!292405))

(declare-fun m!292415 () Bool)

(assert (=> b!277970 m!292415))

(assert (=> b!277760 d!64575))

(declare-fun b!277976 () Bool)

(declare-fun e!177299 () SeekEntryResult!1724)

(declare-fun e!177298 () SeekEntryResult!1724)

(assert (=> b!277976 (= e!177299 e!177298)))

(declare-fun lt!138027 () (_ BitVec 64))

(declare-fun lt!138025 () SeekEntryResult!1724)

(assert (=> b!277976 (= lt!138027 (select (arr!6567 lt!137935) (index!9068 lt!138025)))))

(declare-fun c!45675 () Bool)

(assert (=> b!277976 (= c!45675 (= lt!138027 k0!2581))))

(declare-fun b!277977 () Bool)

(assert (=> b!277977 (= e!177299 Undefined!1724)))

(declare-fun b!277978 () Bool)

(declare-fun e!177300 () SeekEntryResult!1724)

(assert (=> b!277978 (= e!177300 (MissingZero!1724 (index!9068 lt!138025)))))

(declare-fun b!277979 () Bool)

(assert (=> b!277979 (= e!177300 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138025) (index!9068 lt!138025) (index!9068 lt!138025) k0!2581 lt!137935 mask!3868))))

(declare-fun d!64577 () Bool)

(declare-fun lt!138026 () SeekEntryResult!1724)

(assert (=> d!64577 (and (or ((_ is Undefined!1724) lt!138026) (not ((_ is Found!1724) lt!138026)) (and (bvsge (index!9067 lt!138026) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138026) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138026) ((_ is Found!1724) lt!138026) (not ((_ is MissingZero!1724) lt!138026)) (and (bvsge (index!9066 lt!138026) #b00000000000000000000000000000000) (bvslt (index!9066 lt!138026) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138026) ((_ is Found!1724) lt!138026) ((_ is MissingZero!1724) lt!138026) (not ((_ is MissingVacant!1724) lt!138026)) (and (bvsge (index!9069 lt!138026) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138026) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138026) (ite ((_ is Found!1724) lt!138026) (= (select (arr!6567 lt!137935) (index!9067 lt!138026)) k0!2581) (ite ((_ is MissingZero!1724) lt!138026) (= (select (arr!6567 lt!137935) (index!9066 lt!138026)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!138026) (= (select (arr!6567 lt!137935) (index!9069 lt!138026)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64577 (= lt!138026 e!177299)))

(declare-fun c!45674 () Bool)

(assert (=> d!64577 (= c!45674 (and ((_ is Intermediate!1724) lt!138025) (undefined!2536 lt!138025)))))

(assert (=> d!64577 (= lt!138025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!137935 mask!3868))))

(assert (=> d!64577 (validMask!0 mask!3868)))

(assert (=> d!64577 (= (seekEntryOrOpen!0 k0!2581 lt!137935 mask!3868) lt!138026)))

(declare-fun b!277980 () Bool)

(assert (=> b!277980 (= e!177298 (Found!1724 (index!9068 lt!138025)))))

(declare-fun b!277981 () Bool)

(declare-fun c!45673 () Bool)

(assert (=> b!277981 (= c!45673 (= lt!138027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!277981 (= e!177298 e!177300)))

(assert (= (and d!64577 c!45674) b!277977))

(assert (= (and d!64577 (not c!45674)) b!277976))

(assert (= (and b!277976 c!45675) b!277980))

(assert (= (and b!277976 (not c!45675)) b!277981))

(assert (= (and b!277981 c!45673) b!277978))

(assert (= (and b!277981 (not c!45673)) b!277979))

(declare-fun m!292421 () Bool)

(assert (=> b!277976 m!292421))

(declare-fun m!292423 () Bool)

(assert (=> b!277979 m!292423))

(assert (=> d!64577 m!292313))

(declare-fun m!292425 () Bool)

(assert (=> d!64577 m!292425))

(declare-fun m!292427 () Bool)

(assert (=> d!64577 m!292427))

(assert (=> d!64577 m!292225))

(declare-fun m!292429 () Bool)

(assert (=> d!64577 m!292429))

(assert (=> d!64577 m!292313))

(declare-fun m!292431 () Bool)

(assert (=> d!64577 m!292431))

(assert (=> b!277760 d!64577))

(declare-fun d!64581 () Bool)

(declare-fun e!177314 () Bool)

(assert (=> d!64581 e!177314))

(declare-fun res!141742 () Bool)

(assert (=> d!64581 (=> (not res!141742) (not e!177314))))

(assert (=> d!64581 (= res!141742 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6920 a!3325))))))

(declare-fun lt!138041 () Unit!8745)

(declare-fun choose!8 (array!13836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8745)

(assert (=> d!64581 (= lt!138041 (choose!8 a!3325 i!1267 k0!2581 mask!3868))))

(assert (=> d!64581 (validMask!0 mask!3868)))

(assert (=> d!64581 (= (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868) lt!138041)))

(declare-fun b!277998 () Bool)

(assert (=> b!277998 (= e!177314 (= (seekEntryOrOpen!0 k0!2581 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868) (Found!1724 i!1267)))))

(assert (= (and d!64581 res!141742) b!277998))

(declare-fun m!292445 () Bool)

(assert (=> d!64581 m!292445))

(assert (=> d!64581 m!292225))

(assert (=> b!277998 m!292229))

(declare-fun m!292449 () Bool)

(assert (=> b!277998 m!292449))

(assert (=> b!277760 d!64581))

(declare-fun d!64585 () Bool)

(assert (=> d!64585 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277755 d!64585))

(check-sat (not b!277962) (not b!277940) (not bm!25324) (not b!277859) (not b!277889) (not b!277888) (not b!277965) (not b!277998) (not d!64567) (not d!64577) (not b!277832) (not bm!25337) (not b!277835) (not bm!25330) (not bm!25336) (not d!64581) (not b!277970) (not b!277831) (not b!277979) (not b!277969) (not b!277966) (not d!64543))
(check-sat)
(get-model)

(declare-fun b!278079 () Bool)

(declare-fun e!177368 () Bool)

(declare-fun call!25351 () Bool)

(assert (=> b!278079 (= e!177368 call!25351)))

(declare-fun b!278080 () Bool)

(declare-fun e!177369 () Bool)

(assert (=> b!278080 (= e!177369 call!25351)))

(declare-fun b!278081 () Bool)

(assert (=> b!278081 (= e!177369 e!177368)))

(declare-fun lt!138087 () (_ BitVec 64))

(assert (=> b!278081 (= lt!138087 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!138085 () Unit!8745)

(assert (=> b!278081 (= lt!138085 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!278081 (arrayContainsKey!0 a!3325 lt!138087 #b00000000000000000000000000000000)))

(declare-fun lt!138086 () Unit!8745)

(assert (=> b!278081 (= lt!138086 lt!138085)))

(declare-fun res!141776 () Bool)

(assert (=> b!278081 (= res!141776 (= (seekEntryOrOpen!0 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!278081 (=> (not res!141776) (not e!177368))))

(declare-fun bm!25348 () Bool)

(assert (=> bm!25348 (= call!25351 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!64635 () Bool)

(declare-fun res!141777 () Bool)

(declare-fun e!177370 () Bool)

(assert (=> d!64635 (=> res!141777 e!177370)))

(assert (=> d!64635 (= res!141777 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 a!3325)))))

(assert (=> d!64635 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!177370)))

(declare-fun b!278082 () Bool)

(assert (=> b!278082 (= e!177370 e!177369)))

(declare-fun c!45703 () Bool)

(assert (=> b!278082 (= c!45703 (validKeyInArray!0 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!64635 (not res!141777)) b!278082))

(assert (= (and b!278082 c!45703) b!278081))

(assert (= (and b!278082 (not c!45703)) b!278080))

(assert (= (and b!278081 res!141776) b!278079))

(assert (= (or b!278079 b!278080) bm!25348))

(declare-fun m!292581 () Bool)

(assert (=> b!278081 m!292581))

(declare-fun m!292583 () Bool)

(assert (=> b!278081 m!292583))

(declare-fun m!292585 () Bool)

(assert (=> b!278081 m!292585))

(assert (=> b!278081 m!292581))

(declare-fun m!292587 () Bool)

(assert (=> b!278081 m!292587))

(declare-fun m!292589 () Bool)

(assert (=> bm!25348 m!292589))

(assert (=> b!278082 m!292581))

(assert (=> b!278082 m!292581))

(declare-fun m!292591 () Bool)

(assert (=> b!278082 m!292591))

(assert (=> bm!25330 d!64635))

(declare-fun d!64637 () Bool)

(assert (=> d!64637 (arrayContainsKey!0 a!3325 lt!138000 #b00000000000000000000000000000000)))

(declare-fun lt!138090 () Unit!8745)

(declare-fun choose!13 (array!13836 (_ BitVec 64) (_ BitVec 32)) Unit!8745)

(assert (=> d!64637 (= lt!138090 (choose!13 a!3325 lt!138000 #b00000000000000000000000000000000))))

(assert (=> d!64637 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64637 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138000 #b00000000000000000000000000000000) lt!138090)))

(declare-fun bs!9889 () Bool)

(assert (= bs!9889 d!64637))

(assert (=> bs!9889 m!292337))

(declare-fun m!292593 () Bool)

(assert (=> bs!9889 m!292593))

(assert (=> b!277888 d!64637))

(declare-fun d!64639 () Bool)

(declare-fun res!141778 () Bool)

(declare-fun e!177371 () Bool)

(assert (=> d!64639 (=> res!141778 e!177371)))

(assert (=> d!64639 (= res!141778 (= (select (arr!6567 a!3325) #b00000000000000000000000000000000) lt!138000))))

(assert (=> d!64639 (= (arrayContainsKey!0 a!3325 lt!138000 #b00000000000000000000000000000000) e!177371)))

(declare-fun b!278083 () Bool)

(declare-fun e!177372 () Bool)

(assert (=> b!278083 (= e!177371 e!177372)))

(declare-fun res!141779 () Bool)

(assert (=> b!278083 (=> (not res!141779) (not e!177372))))

(assert (=> b!278083 (= res!141779 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 a!3325)))))

(declare-fun b!278084 () Bool)

(assert (=> b!278084 (= e!177372 (arrayContainsKey!0 a!3325 lt!138000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64639 (not res!141778)) b!278083))

(assert (= (and b!278083 res!141779) b!278084))

(assert (=> d!64639 m!292301))

(declare-fun m!292595 () Bool)

(assert (=> b!278084 m!292595))

(assert (=> b!277888 d!64639))

(declare-fun b!278085 () Bool)

(declare-fun e!177374 () SeekEntryResult!1724)

(declare-fun e!177373 () SeekEntryResult!1724)

(assert (=> b!278085 (= e!177374 e!177373)))

(declare-fun lt!138097 () (_ BitVec 64))

(declare-fun lt!138095 () SeekEntryResult!1724)

(assert (=> b!278085 (= lt!138097 (select (arr!6567 a!3325) (index!9068 lt!138095)))))

(declare-fun c!45706 () Bool)

(assert (=> b!278085 (= c!45706 (= lt!138097 (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278086 () Bool)

(assert (=> b!278086 (= e!177374 Undefined!1724)))

(declare-fun b!278087 () Bool)

(declare-fun e!177375 () SeekEntryResult!1724)

(assert (=> b!278087 (= e!177375 (MissingZero!1724 (index!9068 lt!138095)))))

(declare-fun b!278088 () Bool)

(assert (=> b!278088 (= e!177375 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138095) (index!9068 lt!138095) (index!9068 lt!138095) (select (arr!6567 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun d!64641 () Bool)

(declare-fun lt!138096 () SeekEntryResult!1724)

(assert (=> d!64641 (and (or ((_ is Undefined!1724) lt!138096) (not ((_ is Found!1724) lt!138096)) (and (bvsge (index!9067 lt!138096) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138096) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!138096) ((_ is Found!1724) lt!138096) (not ((_ is MissingZero!1724) lt!138096)) (and (bvsge (index!9066 lt!138096) #b00000000000000000000000000000000) (bvslt (index!9066 lt!138096) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!138096) ((_ is Found!1724) lt!138096) ((_ is MissingZero!1724) lt!138096) (not ((_ is MissingVacant!1724) lt!138096)) (and (bvsge (index!9069 lt!138096) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138096) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!138096) (ite ((_ is Found!1724) lt!138096) (= (select (arr!6567 a!3325) (index!9067 lt!138096)) (select (arr!6567 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1724) lt!138096) (= (select (arr!6567 a!3325) (index!9066 lt!138096)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!138096) (= (select (arr!6567 a!3325) (index!9069 lt!138096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64641 (= lt!138096 e!177374)))

(declare-fun c!45705 () Bool)

(assert (=> d!64641 (= c!45705 (and ((_ is Intermediate!1724) lt!138095) (undefined!2536 lt!138095)))))

(assert (=> d!64641 (= lt!138095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6567 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!64641 (validMask!0 mask!3868)))

(assert (=> d!64641 (= (seekEntryOrOpen!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!138096)))

(declare-fun b!278089 () Bool)

(assert (=> b!278089 (= e!177373 (Found!1724 (index!9068 lt!138095)))))

(declare-fun b!278090 () Bool)

(declare-fun c!45704 () Bool)

(assert (=> b!278090 (= c!45704 (= lt!138097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278090 (= e!177373 e!177375)))

(assert (= (and d!64641 c!45705) b!278086))

(assert (= (and d!64641 (not c!45705)) b!278085))

(assert (= (and b!278085 c!45706) b!278089))

(assert (= (and b!278085 (not c!45706)) b!278090))

(assert (= (and b!278090 c!45704) b!278087))

(assert (= (and b!278090 (not c!45704)) b!278088))

(declare-fun m!292597 () Bool)

(assert (=> b!278085 m!292597))

(assert (=> b!278088 m!292301))

(declare-fun m!292599 () Bool)

(assert (=> b!278088 m!292599))

(declare-fun m!292601 () Bool)

(assert (=> d!64641 m!292601))

(assert (=> d!64641 m!292301))

(declare-fun m!292603 () Bool)

(assert (=> d!64641 m!292603))

(declare-fun m!292605 () Bool)

(assert (=> d!64641 m!292605))

(assert (=> d!64641 m!292225))

(declare-fun m!292609 () Bool)

(assert (=> d!64641 m!292609))

(assert (=> d!64641 m!292301))

(assert (=> d!64641 m!292601))

(declare-fun m!292611 () Bool)

(assert (=> d!64641 m!292611))

(assert (=> b!277888 d!64641))

(declare-fun d!64647 () Bool)

(declare-fun lt!138108 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!184 (List!4348) (InoxSet (_ BitVec 64)))

(assert (=> d!64647 (= lt!138108 (select (content!184 Nil!4345) (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!177390 () Bool)

(assert (=> d!64647 (= lt!138108 e!177390)))

(declare-fun res!141789 () Bool)

(assert (=> d!64647 (=> (not res!141789) (not e!177390))))

(assert (=> d!64647 (= res!141789 ((_ is Cons!4344) Nil!4345))))

(assert (=> d!64647 (= (contains!1937 Nil!4345 (select (arr!6567 a!3325) #b00000000000000000000000000000000)) lt!138108)))

(declare-fun b!278112 () Bool)

(declare-fun e!177391 () Bool)

(assert (=> b!278112 (= e!177390 e!177391)))

(declare-fun res!141790 () Bool)

(assert (=> b!278112 (=> res!141790 e!177391)))

(assert (=> b!278112 (= res!141790 (= (h!5011 Nil!4345) (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278113 () Bool)

(assert (=> b!278113 (= e!177391 (contains!1937 (t!9421 Nil!4345) (select (arr!6567 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64647 res!141789) b!278112))

(assert (= (and b!278112 (not res!141790)) b!278113))

(declare-fun m!292637 () Bool)

(assert (=> d!64647 m!292637))

(assert (=> d!64647 m!292301))

(declare-fun m!292639 () Bool)

(assert (=> d!64647 m!292639))

(assert (=> b!278113 m!292301))

(declare-fun m!292641 () Bool)

(assert (=> b!278113 m!292641))

(assert (=> b!277835 d!64647))

(declare-fun d!64655 () Bool)

(assert (=> d!64655 (arrayContainsKey!0 lt!137935 lt!138024 #b00000000000000000000000000000000)))

(declare-fun lt!138109 () Unit!8745)

(assert (=> d!64655 (= lt!138109 (choose!13 lt!137935 lt!138024 startIndex!26))))

(assert (=> d!64655 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!64655 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138024 startIndex!26) lt!138109)))

(declare-fun bs!9891 () Bool)

(assert (= bs!9891 d!64655))

(assert (=> bs!9891 m!292409))

(declare-fun m!292643 () Bool)

(assert (=> bs!9891 m!292643))

(assert (=> b!277969 d!64655))

(declare-fun d!64657 () Bool)

(declare-fun res!141791 () Bool)

(declare-fun e!177392 () Bool)

(assert (=> d!64657 (=> res!141791 e!177392)))

(assert (=> d!64657 (= res!141791 (= (select (arr!6567 lt!137935) #b00000000000000000000000000000000) lt!138024))))

(assert (=> d!64657 (= (arrayContainsKey!0 lt!137935 lt!138024 #b00000000000000000000000000000000) e!177392)))

(declare-fun b!278114 () Bool)

(declare-fun e!177393 () Bool)

(assert (=> b!278114 (= e!177392 e!177393)))

(declare-fun res!141792 () Bool)

(assert (=> b!278114 (=> (not res!141792) (not e!177393))))

(assert (=> b!278114 (= res!141792 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 lt!137935)))))

(declare-fun b!278115 () Bool)

(assert (=> b!278115 (= e!177393 (arrayContainsKey!0 lt!137935 lt!138024 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64657 (not res!141791)) b!278114))

(assert (= (and b!278114 res!141792) b!278115))

(declare-fun m!292645 () Bool)

(assert (=> d!64657 m!292645))

(declare-fun m!292647 () Bool)

(assert (=> b!278115 m!292647))

(assert (=> b!277969 d!64657))

(declare-fun b!278116 () Bool)

(declare-fun e!177395 () SeekEntryResult!1724)

(declare-fun e!177394 () SeekEntryResult!1724)

(assert (=> b!278116 (= e!177395 e!177394)))

(declare-fun lt!138112 () (_ BitVec 64))

(declare-fun lt!138110 () SeekEntryResult!1724)

(assert (=> b!278116 (= lt!138112 (select (arr!6567 lt!137935) (index!9068 lt!138110)))))

(declare-fun c!45715 () Bool)

(assert (=> b!278116 (= c!45715 (= lt!138112 (select (arr!6567 lt!137935) startIndex!26)))))

(declare-fun b!278117 () Bool)

(assert (=> b!278117 (= e!177395 Undefined!1724)))

(declare-fun b!278118 () Bool)

(declare-fun e!177396 () SeekEntryResult!1724)

(assert (=> b!278118 (= e!177396 (MissingZero!1724 (index!9068 lt!138110)))))

(declare-fun b!278119 () Bool)

(assert (=> b!278119 (= e!177396 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138110) (index!9068 lt!138110) (index!9068 lt!138110) (select (arr!6567 lt!137935) startIndex!26) lt!137935 mask!3868))))

(declare-fun d!64659 () Bool)

(declare-fun lt!138111 () SeekEntryResult!1724)

(assert (=> d!64659 (and (or ((_ is Undefined!1724) lt!138111) (not ((_ is Found!1724) lt!138111)) (and (bvsge (index!9067 lt!138111) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138111) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138111) ((_ is Found!1724) lt!138111) (not ((_ is MissingZero!1724) lt!138111)) (and (bvsge (index!9066 lt!138111) #b00000000000000000000000000000000) (bvslt (index!9066 lt!138111) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138111) ((_ is Found!1724) lt!138111) ((_ is MissingZero!1724) lt!138111) (not ((_ is MissingVacant!1724) lt!138111)) (and (bvsge (index!9069 lt!138111) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138111) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138111) (ite ((_ is Found!1724) lt!138111) (= (select (arr!6567 lt!137935) (index!9067 lt!138111)) (select (arr!6567 lt!137935) startIndex!26)) (ite ((_ is MissingZero!1724) lt!138111) (= (select (arr!6567 lt!137935) (index!9066 lt!138111)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!138111) (= (select (arr!6567 lt!137935) (index!9069 lt!138111)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64659 (= lt!138111 e!177395)))

(declare-fun c!45714 () Bool)

(assert (=> d!64659 (= c!45714 (and ((_ is Intermediate!1724) lt!138110) (undefined!2536 lt!138110)))))

(assert (=> d!64659 (= lt!138110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6567 lt!137935) startIndex!26) mask!3868) (select (arr!6567 lt!137935) startIndex!26) lt!137935 mask!3868))))

(assert (=> d!64659 (validMask!0 mask!3868)))

(assert (=> d!64659 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) startIndex!26) lt!137935 mask!3868) lt!138111)))

(declare-fun b!278120 () Bool)

(assert (=> b!278120 (= e!177394 (Found!1724 (index!9068 lt!138110)))))

(declare-fun b!278121 () Bool)

(declare-fun c!45713 () Bool)

(assert (=> b!278121 (= c!45713 (= lt!138112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278121 (= e!177394 e!177396)))

(assert (= (and d!64659 c!45714) b!278117))

(assert (= (and d!64659 (not c!45714)) b!278116))

(assert (= (and b!278116 c!45715) b!278120))

(assert (= (and b!278116 (not c!45715)) b!278121))

(assert (= (and b!278121 c!45713) b!278118))

(assert (= (and b!278121 (not c!45713)) b!278119))

(declare-fun m!292649 () Bool)

(assert (=> b!278116 m!292649))

(assert (=> b!278119 m!292405))

(declare-fun m!292651 () Bool)

(assert (=> b!278119 m!292651))

(declare-fun m!292653 () Bool)

(assert (=> d!64659 m!292653))

(assert (=> d!64659 m!292405))

(declare-fun m!292655 () Bool)

(assert (=> d!64659 m!292655))

(declare-fun m!292657 () Bool)

(assert (=> d!64659 m!292657))

(assert (=> d!64659 m!292225))

(declare-fun m!292659 () Bool)

(assert (=> d!64659 m!292659))

(assert (=> d!64659 m!292405))

(assert (=> d!64659 m!292653))

(declare-fun m!292661 () Bool)

(assert (=> d!64659 m!292661))

(assert (=> b!277969 d!64659))

(declare-fun b!278164 () Bool)

(declare-fun e!177426 () SeekEntryResult!1724)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!278164 (= e!177426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 lt!137935 mask!3868))))

(declare-fun b!278165 () Bool)

(declare-fun lt!138126 () SeekEntryResult!1724)

(assert (=> b!278165 (and (bvsge (index!9068 lt!138126) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138126) (size!6920 lt!137935)))))

(declare-fun res!141805 () Bool)

(assert (=> b!278165 (= res!141805 (= (select (arr!6567 lt!137935) (index!9068 lt!138126)) k0!2581))))

(declare-fun e!177423 () Bool)

(assert (=> b!278165 (=> res!141805 e!177423)))

(declare-fun e!177424 () Bool)

(assert (=> b!278165 (= e!177424 e!177423)))

(declare-fun b!278166 () Bool)

(assert (=> b!278166 (= e!177426 (Intermediate!1724 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278167 () Bool)

(declare-fun e!177422 () SeekEntryResult!1724)

(assert (=> b!278167 (= e!177422 e!177426)))

(declare-fun c!45731 () Bool)

(declare-fun lt!138127 () (_ BitVec 64))

(assert (=> b!278167 (= c!45731 (or (= lt!138127 k0!2581) (= (bvadd lt!138127 lt!138127) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278168 () Bool)

(assert (=> b!278168 (and (bvsge (index!9068 lt!138126) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138126) (size!6920 lt!137935)))))

(declare-fun res!141806 () Bool)

(assert (=> b!278168 (= res!141806 (= (select (arr!6567 lt!137935) (index!9068 lt!138126)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278168 (=> res!141806 e!177423)))

(declare-fun b!278170 () Bool)

(declare-fun e!177425 () Bool)

(assert (=> b!278170 (= e!177425 (bvsge (x!27328 lt!138126) #b01111111111111111111111111111110))))

(declare-fun b!278171 () Bool)

(assert (=> b!278171 (and (bvsge (index!9068 lt!138126) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138126) (size!6920 lt!137935)))))

(assert (=> b!278171 (= e!177423 (= (select (arr!6567 lt!137935) (index!9068 lt!138126)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!278172 () Bool)

(assert (=> b!278172 (= e!177422 (Intermediate!1724 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!64661 () Bool)

(assert (=> d!64661 e!177425))

(declare-fun c!45732 () Bool)

(assert (=> d!64661 (= c!45732 (and ((_ is Intermediate!1724) lt!138126) (undefined!2536 lt!138126)))))

(assert (=> d!64661 (= lt!138126 e!177422)))

(declare-fun c!45733 () Bool)

(assert (=> d!64661 (= c!45733 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!64661 (= lt!138127 (select (arr!6567 lt!137935) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64661 (validMask!0 mask!3868)))

(assert (=> d!64661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!137935 mask!3868) lt!138126)))

(declare-fun b!278169 () Bool)

(assert (=> b!278169 (= e!177425 e!177424)))

(declare-fun res!141807 () Bool)

(assert (=> b!278169 (= res!141807 (and ((_ is Intermediate!1724) lt!138126) (not (undefined!2536 lt!138126)) (bvslt (x!27328 lt!138126) #b01111111111111111111111111111110) (bvsge (x!27328 lt!138126) #b00000000000000000000000000000000) (bvsge (x!27328 lt!138126) #b00000000000000000000000000000000)))))

(assert (=> b!278169 (=> (not res!141807) (not e!177424))))

(assert (= (and d!64661 c!45733) b!278172))

(assert (= (and d!64661 (not c!45733)) b!278167))

(assert (= (and b!278167 c!45731) b!278166))

(assert (= (and b!278167 (not c!45731)) b!278164))

(assert (= (and d!64661 c!45732) b!278170))

(assert (= (and d!64661 (not c!45732)) b!278169))

(assert (= (and b!278169 res!141807) b!278165))

(assert (= (and b!278165 (not res!141805)) b!278168))

(assert (= (and b!278168 (not res!141806)) b!278171))

(assert (=> b!278164 m!292313))

(declare-fun m!292677 () Bool)

(assert (=> b!278164 m!292677))

(assert (=> b!278164 m!292677))

(declare-fun m!292679 () Bool)

(assert (=> b!278164 m!292679))

(declare-fun m!292681 () Bool)

(assert (=> b!278171 m!292681))

(assert (=> b!278168 m!292681))

(assert (=> d!64661 m!292313))

(declare-fun m!292683 () Bool)

(assert (=> d!64661 m!292683))

(assert (=> d!64661 m!292225))

(assert (=> b!278165 m!292681))

(assert (=> d!64577 d!64661))

(declare-fun d!64671 () Bool)

(declare-fun lt!138145 () (_ BitVec 32))

(declare-fun lt!138144 () (_ BitVec 32))

(assert (=> d!64671 (= lt!138145 (bvmul (bvxor lt!138144 (bvlshr lt!138144 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!64671 (= lt!138144 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!64671 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!141808 (let ((h!5015 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27335 (bvmul (bvxor h!5015 (bvlshr h!5015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27335 (bvlshr x!27335 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!141808 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!141808 #b00000000000000000000000000000000))))))

(assert (=> d!64671 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!138145 (bvlshr lt!138145 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!64577 d!64671))

(assert (=> d!64577 d!64553))

(declare-fun d!64685 () Bool)

(assert (=> d!64685 (= (validKeyInArray!0 (select (arr!6567 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6567 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6567 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277889 d!64685))

(declare-fun b!278206 () Bool)

(declare-fun e!177449 () SeekEntryResult!1724)

(declare-fun e!177448 () SeekEntryResult!1724)

(assert (=> b!278206 (= e!177449 e!177448)))

(declare-fun lt!138151 () (_ BitVec 64))

(declare-fun lt!138149 () SeekEntryResult!1724)

(assert (=> b!278206 (= lt!138151 (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (index!9068 lt!138149)))))

(declare-fun c!45748 () Bool)

(assert (=> b!278206 (= c!45748 (= lt!138151 k0!2581))))

(declare-fun b!278207 () Bool)

(assert (=> b!278207 (= e!177449 Undefined!1724)))

(declare-fun b!278208 () Bool)

(declare-fun e!177450 () SeekEntryResult!1724)

(assert (=> b!278208 (= e!177450 (MissingZero!1724 (index!9068 lt!138149)))))

(declare-fun b!278209 () Bool)

(assert (=> b!278209 (= e!177450 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138149) (index!9068 lt!138149) (index!9068 lt!138149) k0!2581 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868))))

(declare-fun lt!138150 () SeekEntryResult!1724)

(declare-fun d!64689 () Bool)

(assert (=> d!64689 (and (or ((_ is Undefined!1724) lt!138150) (not ((_ is Found!1724) lt!138150)) (and (bvsge (index!9067 lt!138150) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138150) (size!6920 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))) (or ((_ is Undefined!1724) lt!138150) ((_ is Found!1724) lt!138150) (not ((_ is MissingZero!1724) lt!138150)) (and (bvsge (index!9066 lt!138150) #b00000000000000000000000000000000) (bvslt (index!9066 lt!138150) (size!6920 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))) (or ((_ is Undefined!1724) lt!138150) ((_ is Found!1724) lt!138150) ((_ is MissingZero!1724) lt!138150) (not ((_ is MissingVacant!1724) lt!138150)) (and (bvsge (index!9069 lt!138150) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138150) (size!6920 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))) (or ((_ is Undefined!1724) lt!138150) (ite ((_ is Found!1724) lt!138150) (= (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (index!9067 lt!138150)) k0!2581) (ite ((_ is MissingZero!1724) lt!138150) (= (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (index!9066 lt!138150)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!138150) (= (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (index!9069 lt!138150)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64689 (= lt!138150 e!177449)))

(declare-fun c!45747 () Bool)

(assert (=> d!64689 (= c!45747 (and ((_ is Intermediate!1724) lt!138149) (undefined!2536 lt!138149)))))

(assert (=> d!64689 (= lt!138149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868))))

(assert (=> d!64689 (validMask!0 mask!3868)))

(assert (=> d!64689 (= (seekEntryOrOpen!0 k0!2581 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868) lt!138150)))

(declare-fun b!278210 () Bool)

(assert (=> b!278210 (= e!177448 (Found!1724 (index!9068 lt!138149)))))

(declare-fun b!278211 () Bool)

(declare-fun c!45746 () Bool)

(assert (=> b!278211 (= c!45746 (= lt!138151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278211 (= e!177448 e!177450)))

(assert (= (and d!64689 c!45747) b!278207))

(assert (= (and d!64689 (not c!45747)) b!278206))

(assert (= (and b!278206 c!45748) b!278210))

(assert (= (and b!278206 (not c!45748)) b!278211))

(assert (= (and b!278211 c!45746) b!278208))

(assert (= (and b!278211 (not c!45746)) b!278209))

(declare-fun m!292751 () Bool)

(assert (=> b!278206 m!292751))

(declare-fun m!292753 () Bool)

(assert (=> b!278209 m!292753))

(assert (=> d!64689 m!292313))

(declare-fun m!292755 () Bool)

(assert (=> d!64689 m!292755))

(declare-fun m!292757 () Bool)

(assert (=> d!64689 m!292757))

(assert (=> d!64689 m!292225))

(declare-fun m!292759 () Bool)

(assert (=> d!64689 m!292759))

(assert (=> d!64689 m!292313))

(declare-fun m!292761 () Bool)

(assert (=> d!64689 m!292761))

(assert (=> b!277998 d!64689))

(declare-fun d!64691 () Bool)

(assert (=> d!64691 (arrayContainsKey!0 lt!137935 lt!138021 #b00000000000000000000000000000000)))

(declare-fun lt!138152 () Unit!8745)

(assert (=> d!64691 (= lt!138152 (choose!13 lt!137935 lt!138021 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> d!64691 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))

(assert (=> d!64691 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138021 (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138152)))

(declare-fun bs!9894 () Bool)

(assert (= bs!9894 d!64691))

(assert (=> bs!9894 m!292397))

(declare-fun m!292763 () Bool)

(assert (=> bs!9894 m!292763))

(assert (=> b!277965 d!64691))

(declare-fun d!64693 () Bool)

(declare-fun res!141818 () Bool)

(declare-fun e!177451 () Bool)

(assert (=> d!64693 (=> res!141818 e!177451)))

(assert (=> d!64693 (= res!141818 (= (select (arr!6567 lt!137935) #b00000000000000000000000000000000) lt!138021))))

(assert (=> d!64693 (= (arrayContainsKey!0 lt!137935 lt!138021 #b00000000000000000000000000000000) e!177451)))

(declare-fun b!278212 () Bool)

(declare-fun e!177452 () Bool)

(assert (=> b!278212 (= e!177451 e!177452)))

(declare-fun res!141819 () Bool)

(assert (=> b!278212 (=> (not res!141819) (not e!177452))))

(assert (=> b!278212 (= res!141819 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 lt!137935)))))

(declare-fun b!278213 () Bool)

(assert (=> b!278213 (= e!177452 (arrayContainsKey!0 lt!137935 lt!138021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64693 (not res!141818)) b!278212))

(assert (= (and b!278212 res!141819) b!278213))

(assert (=> d!64693 m!292645))

(declare-fun m!292765 () Bool)

(assert (=> b!278213 m!292765))

(assert (=> b!277965 d!64693))

(declare-fun b!278214 () Bool)

(declare-fun e!177454 () SeekEntryResult!1724)

(declare-fun e!177453 () SeekEntryResult!1724)

(assert (=> b!278214 (= e!177454 e!177453)))

(declare-fun lt!138155 () (_ BitVec 64))

(declare-fun lt!138153 () SeekEntryResult!1724)

(assert (=> b!278214 (= lt!138155 (select (arr!6567 lt!137935) (index!9068 lt!138153)))))

(declare-fun c!45751 () Bool)

(assert (=> b!278214 (= c!45751 (= lt!138155 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!278215 () Bool)

(assert (=> b!278215 (= e!177454 Undefined!1724)))

(declare-fun b!278216 () Bool)

(declare-fun e!177455 () SeekEntryResult!1724)

(assert (=> b!278216 (= e!177455 (MissingZero!1724 (index!9068 lt!138153)))))

(declare-fun b!278217 () Bool)

(assert (=> b!278217 (= e!177455 (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138153) (index!9068 lt!138153) (index!9068 lt!138153) (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!137935 mask!3868))))

(declare-fun d!64695 () Bool)

(declare-fun lt!138154 () SeekEntryResult!1724)

(assert (=> d!64695 (and (or ((_ is Undefined!1724) lt!138154) (not ((_ is Found!1724) lt!138154)) (and (bvsge (index!9067 lt!138154) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138154) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138154) ((_ is Found!1724) lt!138154) (not ((_ is MissingZero!1724) lt!138154)) (and (bvsge (index!9066 lt!138154) #b00000000000000000000000000000000) (bvslt (index!9066 lt!138154) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138154) ((_ is Found!1724) lt!138154) ((_ is MissingZero!1724) lt!138154) (not ((_ is MissingVacant!1724) lt!138154)) (and (bvsge (index!9069 lt!138154) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138154) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138154) (ite ((_ is Found!1724) lt!138154) (= (select (arr!6567 lt!137935) (index!9067 lt!138154)) (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26))) (ite ((_ is MissingZero!1724) lt!138154) (= (select (arr!6567 lt!137935) (index!9066 lt!138154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1724) lt!138154) (= (select (arr!6567 lt!137935) (index!9069 lt!138154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64695 (= lt!138154 e!177454)))

(declare-fun c!45750 () Bool)

(assert (=> d!64695 (= c!45750 (and ((_ is Intermediate!1724) lt!138153) (undefined!2536 lt!138153)))))

(assert (=> d!64695 (= lt!138153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) mask!3868) (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!137935 mask!3868))))

(assert (=> d!64695 (validMask!0 mask!3868)))

(assert (=> d!64695 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!137935 mask!3868) lt!138154)))

(declare-fun b!278218 () Bool)

(assert (=> b!278218 (= e!177453 (Found!1724 (index!9068 lt!138153)))))

(declare-fun b!278219 () Bool)

(declare-fun c!45749 () Bool)

(assert (=> b!278219 (= c!45749 (= lt!138155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278219 (= e!177453 e!177455)))

(assert (= (and d!64695 c!45750) b!278215))

(assert (= (and d!64695 (not c!45750)) b!278214))

(assert (= (and b!278214 c!45751) b!278218))

(assert (= (and b!278214 (not c!45751)) b!278219))

(assert (= (and b!278219 c!45749) b!278216))

(assert (= (and b!278219 (not c!45749)) b!278217))

(declare-fun m!292767 () Bool)

(assert (=> b!278214 m!292767))

(assert (=> b!278217 m!292393))

(declare-fun m!292769 () Bool)

(assert (=> b!278217 m!292769))

(declare-fun m!292771 () Bool)

(assert (=> d!64695 m!292771))

(assert (=> d!64695 m!292393))

(declare-fun m!292773 () Bool)

(assert (=> d!64695 m!292773))

(declare-fun m!292775 () Bool)

(assert (=> d!64695 m!292775))

(assert (=> d!64695 m!292225))

(declare-fun m!292777 () Bool)

(assert (=> d!64695 m!292777))

(assert (=> d!64695 m!292393))

(assert (=> d!64695 m!292771))

(declare-fun m!292779 () Bool)

(assert (=> d!64695 m!292779))

(assert (=> b!277965 d!64695))

(declare-fun b!278220 () Bool)

(declare-fun e!177458 () Bool)

(declare-fun e!177459 () Bool)

(assert (=> b!278220 (= e!177458 e!177459)))

(declare-fun c!45752 () Bool)

(assert (=> b!278220 (= c!45752 (validKeyInArray!0 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64697 () Bool)

(declare-fun res!141821 () Bool)

(declare-fun e!177456 () Bool)

(assert (=> d!64697 (=> res!141821 e!177456)))

(assert (=> d!64697 (= res!141821 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6920 a!3325)))))

(assert (=> d!64697 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45631 (Cons!4344 (select (arr!6567 a!3325) #b00000000000000000000000000000000) Nil!4345) Nil!4345)) e!177456)))

(declare-fun b!278221 () Bool)

(assert (=> b!278221 (= e!177456 e!177458)))

(declare-fun res!141822 () Bool)

(assert (=> b!278221 (=> (not res!141822) (not e!177458))))

(declare-fun e!177457 () Bool)

(assert (=> b!278221 (= res!141822 (not e!177457))))

(declare-fun res!141820 () Bool)

(assert (=> b!278221 (=> (not res!141820) (not e!177457))))

(assert (=> b!278221 (= res!141820 (validKeyInArray!0 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278222 () Bool)

(declare-fun call!25355 () Bool)

(assert (=> b!278222 (= e!177459 call!25355)))

(declare-fun bm!25352 () Bool)

(assert (=> bm!25352 (= call!25355 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45752 (Cons!4344 (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45631 (Cons!4344 (select (arr!6567 a!3325) #b00000000000000000000000000000000) Nil!4345) Nil!4345)) (ite c!45631 (Cons!4344 (select (arr!6567 a!3325) #b00000000000000000000000000000000) Nil!4345) Nil!4345))))))

(declare-fun b!278223 () Bool)

(assert (=> b!278223 (= e!177459 call!25355)))

(declare-fun b!278224 () Bool)

(assert (=> b!278224 (= e!177457 (contains!1937 (ite c!45631 (Cons!4344 (select (arr!6567 a!3325) #b00000000000000000000000000000000) Nil!4345) Nil!4345) (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!64697 (not res!141821)) b!278221))

(assert (= (and b!278221 res!141820) b!278224))

(assert (= (and b!278221 res!141822) b!278220))

(assert (= (and b!278220 c!45752) b!278223))

(assert (= (and b!278220 (not c!45752)) b!278222))

(assert (= (or b!278223 b!278222) bm!25352))

(assert (=> b!278220 m!292581))

(assert (=> b!278220 m!292581))

(assert (=> b!278220 m!292591))

(assert (=> b!278221 m!292581))

(assert (=> b!278221 m!292581))

(assert (=> b!278221 m!292591))

(assert (=> bm!25352 m!292581))

(declare-fun m!292781 () Bool)

(assert (=> bm!25352 m!292781))

(assert (=> b!278224 m!292581))

(assert (=> b!278224 m!292581))

(declare-fun m!292783 () Bool)

(assert (=> b!278224 m!292783))

(assert (=> bm!25324 d!64697))

(declare-fun d!64699 () Bool)

(assert (=> d!64699 (= (validKeyInArray!0 (select (arr!6567 lt!137935) startIndex!26)) (and (not (= (select (arr!6567 lt!137935) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6567 lt!137935) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277970 d!64699))

(declare-fun d!64701 () Bool)

(assert (=> d!64701 (= (seekEntryOrOpen!0 k0!2581 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868) (Found!1724 i!1267))))

(assert (=> d!64701 true))

(declare-fun _$54!20 () Unit!8745)

(assert (=> d!64701 (= (choose!8 a!3325 i!1267 k0!2581 mask!3868) _$54!20)))

(declare-fun bs!9895 () Bool)

(assert (= bs!9895 d!64701))

(assert (=> bs!9895 m!292229))

(assert (=> bs!9895 m!292449))

(assert (=> d!64581 d!64701))

(assert (=> d!64581 d!64553))

(declare-fun d!64703 () Bool)

(declare-fun res!141823 () Bool)

(declare-fun e!177460 () Bool)

(assert (=> d!64703 (=> res!141823 e!177460)))

(assert (=> d!64703 (= res!141823 (= (select (arr!6567 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!64703 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!177460)))

(declare-fun b!278225 () Bool)

(declare-fun e!177461 () Bool)

(assert (=> b!278225 (= e!177460 e!177461)))

(declare-fun res!141824 () Bool)

(assert (=> b!278225 (=> (not res!141824) (not e!177461))))

(assert (=> b!278225 (= res!141824 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6920 a!3325)))))

(declare-fun b!278226 () Bool)

(assert (=> b!278226 (= e!177461 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64703 (not res!141823)) b!278225))

(assert (= (and b!278225 res!141824) b!278226))

(assert (=> d!64703 m!292581))

(declare-fun m!292785 () Bool)

(assert (=> b!278226 m!292785))

(assert (=> b!277940 d!64703))

(declare-fun b!278227 () Bool)

(declare-fun e!177466 () SeekEntryResult!1724)

(assert (=> b!278227 (= e!177466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!278228 () Bool)

(declare-fun lt!138156 () SeekEntryResult!1724)

(assert (=> b!278228 (and (bvsge (index!9068 lt!138156) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138156) (size!6920 a!3325)))))

(declare-fun res!141825 () Bool)

(assert (=> b!278228 (= res!141825 (= (select (arr!6567 a!3325) (index!9068 lt!138156)) k0!2581))))

(declare-fun e!177463 () Bool)

(assert (=> b!278228 (=> res!141825 e!177463)))

(declare-fun e!177464 () Bool)

(assert (=> b!278228 (= e!177464 e!177463)))

(declare-fun b!278229 () Bool)

(assert (=> b!278229 (= e!177466 (Intermediate!1724 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278230 () Bool)

(declare-fun e!177462 () SeekEntryResult!1724)

(assert (=> b!278230 (= e!177462 e!177466)))

(declare-fun c!45753 () Bool)

(declare-fun lt!138157 () (_ BitVec 64))

(assert (=> b!278230 (= c!45753 (or (= lt!138157 k0!2581) (= (bvadd lt!138157 lt!138157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278231 () Bool)

(assert (=> b!278231 (and (bvsge (index!9068 lt!138156) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138156) (size!6920 a!3325)))))

(declare-fun res!141826 () Bool)

(assert (=> b!278231 (= res!141826 (= (select (arr!6567 a!3325) (index!9068 lt!138156)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278231 (=> res!141826 e!177463)))

(declare-fun b!278233 () Bool)

(declare-fun e!177465 () Bool)

(assert (=> b!278233 (= e!177465 (bvsge (x!27328 lt!138156) #b01111111111111111111111111111110))))

(declare-fun b!278234 () Bool)

(assert (=> b!278234 (and (bvsge (index!9068 lt!138156) #b00000000000000000000000000000000) (bvslt (index!9068 lt!138156) (size!6920 a!3325)))))

(assert (=> b!278234 (= e!177463 (= (select (arr!6567 a!3325) (index!9068 lt!138156)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!278235 () Bool)

(assert (=> b!278235 (= e!177462 (Intermediate!1724 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!64705 () Bool)

(assert (=> d!64705 e!177465))

(declare-fun c!45754 () Bool)

(assert (=> d!64705 (= c!45754 (and ((_ is Intermediate!1724) lt!138156) (undefined!2536 lt!138156)))))

(assert (=> d!64705 (= lt!138156 e!177462)))

(declare-fun c!45755 () Bool)

(assert (=> d!64705 (= c!45755 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!64705 (= lt!138157 (select (arr!6567 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64705 (validMask!0 mask!3868)))

(assert (=> d!64705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!138156)))

(declare-fun b!278232 () Bool)

(assert (=> b!278232 (= e!177465 e!177464)))

(declare-fun res!141827 () Bool)

(assert (=> b!278232 (= res!141827 (and ((_ is Intermediate!1724) lt!138156) (not (undefined!2536 lt!138156)) (bvslt (x!27328 lt!138156) #b01111111111111111111111111111110) (bvsge (x!27328 lt!138156) #b00000000000000000000000000000000) (bvsge (x!27328 lt!138156) #b00000000000000000000000000000000)))))

(assert (=> b!278232 (=> (not res!141827) (not e!177464))))

(assert (= (and d!64705 c!45755) b!278235))

(assert (= (and d!64705 (not c!45755)) b!278230))

(assert (= (and b!278230 c!45753) b!278229))

(assert (= (and b!278230 (not c!45753)) b!278227))

(assert (= (and d!64705 c!45754) b!278233))

(assert (= (and d!64705 (not c!45754)) b!278232))

(assert (= (and b!278232 res!141827) b!278228))

(assert (= (and b!278228 (not res!141825)) b!278231))

(assert (= (and b!278231 (not res!141826)) b!278234))

(assert (=> b!278227 m!292313))

(assert (=> b!278227 m!292677))

(assert (=> b!278227 m!292677))

(declare-fun m!292787 () Bool)

(assert (=> b!278227 m!292787))

(declare-fun m!292789 () Bool)

(assert (=> b!278234 m!292789))

(assert (=> b!278231 m!292789))

(assert (=> d!64705 m!292313))

(declare-fun m!292791 () Bool)

(assert (=> d!64705 m!292791))

(assert (=> d!64705 m!292225))

(assert (=> b!278228 m!292789))

(assert (=> d!64543 d!64705))

(assert (=> d!64543 d!64671))

(assert (=> d!64543 d!64553))

(declare-fun b!278248 () Bool)

(declare-fun c!45762 () Bool)

(declare-fun lt!138163 () (_ BitVec 64))

(assert (=> b!278248 (= c!45762 (= lt!138163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177475 () SeekEntryResult!1724)

(declare-fun e!177474 () SeekEntryResult!1724)

(assert (=> b!278248 (= e!177475 e!177474)))

(declare-fun b!278249 () Bool)

(assert (=> b!278249 (= e!177475 (Found!1724 (index!9068 lt!138025)))))

(declare-fun b!278250 () Bool)

(assert (=> b!278250 (= e!177474 (MissingVacant!1724 (index!9068 lt!138025)))))

(declare-fun b!278251 () Bool)

(declare-fun e!177473 () SeekEntryResult!1724)

(assert (=> b!278251 (= e!177473 e!177475)))

(declare-fun c!45763 () Bool)

(assert (=> b!278251 (= c!45763 (= lt!138163 k0!2581))))

(declare-fun lt!138162 () SeekEntryResult!1724)

(declare-fun d!64707 () Bool)

(assert (=> d!64707 (and (or ((_ is Undefined!1724) lt!138162) (not ((_ is Found!1724) lt!138162)) (and (bvsge (index!9067 lt!138162) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138162) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138162) ((_ is Found!1724) lt!138162) (not ((_ is MissingVacant!1724) lt!138162)) (not (= (index!9069 lt!138162) (index!9068 lt!138025))) (and (bvsge (index!9069 lt!138162) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138162) (size!6920 lt!137935)))) (or ((_ is Undefined!1724) lt!138162) (ite ((_ is Found!1724) lt!138162) (= (select (arr!6567 lt!137935) (index!9067 lt!138162)) k0!2581) (and ((_ is MissingVacant!1724) lt!138162) (= (index!9069 lt!138162) (index!9068 lt!138025)) (= (select (arr!6567 lt!137935) (index!9069 lt!138162)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64707 (= lt!138162 e!177473)))

(declare-fun c!45764 () Bool)

(assert (=> d!64707 (= c!45764 (bvsge (x!27328 lt!138025) #b01111111111111111111111111111110))))

(assert (=> d!64707 (= lt!138163 (select (arr!6567 lt!137935) (index!9068 lt!138025)))))

(assert (=> d!64707 (validMask!0 mask!3868)))

(assert (=> d!64707 (= (seekKeyOrZeroReturnVacant!0 (x!27328 lt!138025) (index!9068 lt!138025) (index!9068 lt!138025) k0!2581 lt!137935 mask!3868) lt!138162)))

(declare-fun b!278252 () Bool)

(assert (=> b!278252 (= e!177473 Undefined!1724)))

(declare-fun b!278253 () Bool)

(assert (=> b!278253 (= e!177474 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27328 lt!138025) #b00000000000000000000000000000001) (nextIndex!0 (index!9068 lt!138025) (x!27328 lt!138025) mask!3868) (index!9068 lt!138025) k0!2581 lt!137935 mask!3868))))

(assert (= (and d!64707 c!45764) b!278252))

(assert (= (and d!64707 (not c!45764)) b!278251))

(assert (= (and b!278251 c!45763) b!278249))

(assert (= (and b!278251 (not c!45763)) b!278248))

(assert (= (and b!278248 c!45762) b!278250))

(assert (= (and b!278248 (not c!45762)) b!278253))

(declare-fun m!292793 () Bool)

(assert (=> d!64707 m!292793))

(declare-fun m!292795 () Bool)

(assert (=> d!64707 m!292795))

(assert (=> d!64707 m!292421))

(assert (=> d!64707 m!292225))

(declare-fun m!292797 () Bool)

(assert (=> b!278253 m!292797))

(assert (=> b!278253 m!292797))

(declare-fun m!292799 () Bool)

(assert (=> b!278253 m!292799))

(assert (=> b!277979 d!64707))

(declare-fun b!278254 () Bool)

(declare-fun e!177476 () Bool)

(declare-fun call!25356 () Bool)

(assert (=> b!278254 (= e!177476 call!25356)))

(declare-fun b!278255 () Bool)

(declare-fun e!177477 () Bool)

(assert (=> b!278255 (= e!177477 call!25356)))

(declare-fun b!278256 () Bool)

(assert (=> b!278256 (= e!177477 e!177476)))

(declare-fun lt!138166 () (_ BitVec 64))

(assert (=> b!278256 (= lt!138166 (select (arr!6567 lt!137935) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138164 () Unit!8745)

(assert (=> b!278256 (= lt!138164 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138166 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278256 (arrayContainsKey!0 lt!137935 lt!138166 #b00000000000000000000000000000000)))

(declare-fun lt!138165 () Unit!8745)

(assert (=> b!278256 (= lt!138165 lt!138164)))

(declare-fun res!141828 () Bool)

(assert (=> b!278256 (= res!141828 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!137935 mask!3868) (Found!1724 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278256 (=> (not res!141828) (not e!177476))))

(declare-fun bm!25353 () Bool)

(assert (=> bm!25353 (= call!25356 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!137935 mask!3868))))

(declare-fun d!64709 () Bool)

(declare-fun res!141829 () Bool)

(declare-fun e!177478 () Bool)

(assert (=> d!64709 (=> res!141829 e!177478)))

(assert (=> d!64709 (= res!141829 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!6920 lt!137935)))))

(assert (=> d!64709 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!137935 mask!3868) e!177478)))

(declare-fun b!278257 () Bool)

(assert (=> b!278257 (= e!177478 e!177477)))

(declare-fun c!45765 () Bool)

(assert (=> b!278257 (= c!45765 (validKeyInArray!0 (select (arr!6567 lt!137935) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (= (and d!64709 (not res!141829)) b!278257))

(assert (= (and b!278257 c!45765) b!278256))

(assert (= (and b!278257 (not c!45765)) b!278255))

(assert (= (and b!278256 res!141828) b!278254))

(assert (= (or b!278254 b!278255) bm!25353))

(declare-fun m!292801 () Bool)

(assert (=> b!278256 m!292801))

(declare-fun m!292803 () Bool)

(assert (=> b!278256 m!292803))

(declare-fun m!292805 () Bool)

(assert (=> b!278256 m!292805))

(assert (=> b!278256 m!292801))

(declare-fun m!292807 () Bool)

(assert (=> b!278256 m!292807))

(declare-fun m!292809 () Bool)

(assert (=> bm!25353 m!292809))

(assert (=> b!278257 m!292801))

(assert (=> b!278257 m!292801))

(declare-fun m!292811 () Bool)

(assert (=> b!278257 m!292811))

(assert (=> bm!25337 d!64709))

(declare-fun d!64711 () Bool)

(assert (=> d!64711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868)))

(assert (=> d!64711 true))

(declare-fun _$55!36 () Unit!8745)

(assert (=> d!64711 (= (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) _$55!36)))

(declare-fun bs!9896 () Bool)

(assert (= bs!9896 d!64711))

(assert (=> bs!9896 m!292229))

(assert (=> bs!9896 m!292391))

(assert (=> d!64567 d!64711))

(assert (=> d!64567 d!64553))

(assert (=> b!277831 d!64685))

(declare-fun b!278258 () Bool)

(declare-fun e!177479 () Bool)

(declare-fun call!25357 () Bool)

(assert (=> b!278258 (= e!177479 call!25357)))

(declare-fun b!278259 () Bool)

(declare-fun e!177480 () Bool)

(assert (=> b!278259 (= e!177480 call!25357)))

(declare-fun b!278260 () Bool)

(assert (=> b!278260 (= e!177480 e!177479)))

(declare-fun lt!138169 () (_ BitVec 64))

(assert (=> b!278260 (= lt!138169 (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138167 () Unit!8745)

(assert (=> b!278260 (= lt!138167 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) lt!138169 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278260 (arrayContainsKey!0 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) lt!138169 #b00000000000000000000000000000000)))

(declare-fun lt!138168 () Unit!8745)

(assert (=> b!278260 (= lt!138168 lt!138167)))

(declare-fun res!141830 () Bool)

(assert (=> b!278260 (= res!141830 (= (seekEntryOrOpen!0 (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)) (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868) (Found!1724 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278260 (=> (not res!141830) (not e!177479))))

(declare-fun bm!25354 () Bool)

(assert (=> bm!25354 (= call!25357 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868))))

(declare-fun d!64713 () Bool)

(declare-fun res!141831 () Bool)

(declare-fun e!177481 () Bool)

(assert (=> d!64713 (=> res!141831 e!177481)))

(assert (=> d!64713 (= res!141831 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6920 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)))))))

(assert (=> d!64713 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325)) mask!3868) e!177481)))

(declare-fun b!278261 () Bool)

(assert (=> b!278261 (= e!177481 e!177480)))

(declare-fun c!45766 () Bool)

(assert (=> b!278261 (= c!45766 (validKeyInArray!0 (select (arr!6567 (array!13837 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6920 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (= (and d!64713 (not res!141831)) b!278261))

(assert (= (and b!278261 c!45766) b!278260))

(assert (= (and b!278261 (not c!45766)) b!278259))

(assert (= (and b!278260 res!141830) b!278258))

(assert (= (or b!278258 b!278259) bm!25354))

(declare-fun m!292813 () Bool)

(assert (=> b!278260 m!292813))

(declare-fun m!292815 () Bool)

(assert (=> b!278260 m!292815))

(declare-fun m!292817 () Bool)

(assert (=> b!278260 m!292817))

(assert (=> b!278260 m!292813))

(declare-fun m!292819 () Bool)

(assert (=> b!278260 m!292819))

(declare-fun m!292821 () Bool)

(assert (=> bm!25354 m!292821))

(assert (=> b!278261 m!292813))

(assert (=> b!278261 m!292813))

(declare-fun m!292823 () Bool)

(assert (=> b!278261 m!292823))

(assert (=> b!277962 d!64713))

(declare-fun d!64715 () Bool)

(assert (=> d!64715 (= (validKeyInArray!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26))) (and (not (= (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277966 d!64715))

(assert (=> b!277832 d!64685))

(declare-fun b!278262 () Bool)

(declare-fun c!45767 () Bool)

(declare-fun lt!138171 () (_ BitVec 64))

(assert (=> b!278262 (= c!45767 (= lt!138171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177484 () SeekEntryResult!1724)

(declare-fun e!177483 () SeekEntryResult!1724)

(assert (=> b!278262 (= e!177484 e!177483)))

(declare-fun b!278263 () Bool)

(assert (=> b!278263 (= e!177484 (Found!1724 (index!9068 lt!137980)))))

(declare-fun b!278264 () Bool)

(assert (=> b!278264 (= e!177483 (MissingVacant!1724 (index!9068 lt!137980)))))

(declare-fun b!278265 () Bool)

(declare-fun e!177482 () SeekEntryResult!1724)

(assert (=> b!278265 (= e!177482 e!177484)))

(declare-fun c!45768 () Bool)

(assert (=> b!278265 (= c!45768 (= lt!138171 k0!2581))))

(declare-fun lt!138170 () SeekEntryResult!1724)

(declare-fun d!64717 () Bool)

(assert (=> d!64717 (and (or ((_ is Undefined!1724) lt!138170) (not ((_ is Found!1724) lt!138170)) (and (bvsge (index!9067 lt!138170) #b00000000000000000000000000000000) (bvslt (index!9067 lt!138170) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!138170) ((_ is Found!1724) lt!138170) (not ((_ is MissingVacant!1724) lt!138170)) (not (= (index!9069 lt!138170) (index!9068 lt!137980))) (and (bvsge (index!9069 lt!138170) #b00000000000000000000000000000000) (bvslt (index!9069 lt!138170) (size!6920 a!3325)))) (or ((_ is Undefined!1724) lt!138170) (ite ((_ is Found!1724) lt!138170) (= (select (arr!6567 a!3325) (index!9067 lt!138170)) k0!2581) (and ((_ is MissingVacant!1724) lt!138170) (= (index!9069 lt!138170) (index!9068 lt!137980)) (= (select (arr!6567 a!3325) (index!9069 lt!138170)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64717 (= lt!138170 e!177482)))

(declare-fun c!45769 () Bool)

(assert (=> d!64717 (= c!45769 (bvsge (x!27328 lt!137980) #b01111111111111111111111111111110))))

(assert (=> d!64717 (= lt!138171 (select (arr!6567 a!3325) (index!9068 lt!137980)))))

(assert (=> d!64717 (validMask!0 mask!3868)))

(assert (=> d!64717 (= (seekKeyOrZeroReturnVacant!0 (x!27328 lt!137980) (index!9068 lt!137980) (index!9068 lt!137980) k0!2581 a!3325 mask!3868) lt!138170)))

(declare-fun b!278266 () Bool)

(assert (=> b!278266 (= e!177482 Undefined!1724)))

(declare-fun b!278267 () Bool)

(assert (=> b!278267 (= e!177483 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27328 lt!137980) #b00000000000000000000000000000001) (nextIndex!0 (index!9068 lt!137980) (x!27328 lt!137980) mask!3868) (index!9068 lt!137980) k0!2581 a!3325 mask!3868))))

(assert (= (and d!64717 c!45769) b!278266))

(assert (= (and d!64717 (not c!45769)) b!278265))

(assert (= (and b!278265 c!45768) b!278263))

(assert (= (and b!278265 (not c!45768)) b!278262))

(assert (= (and b!278262 c!45767) b!278264))

(assert (= (and b!278262 (not c!45767)) b!278267))

(declare-fun m!292825 () Bool)

(assert (=> d!64717 m!292825))

(declare-fun m!292827 () Bool)

(assert (=> d!64717 m!292827))

(assert (=> d!64717 m!292309))

(assert (=> d!64717 m!292225))

(declare-fun m!292829 () Bool)

(assert (=> b!278267 m!292829))

(assert (=> b!278267 m!292829))

(declare-fun m!292831 () Bool)

(assert (=> b!278267 m!292831))

(assert (=> b!277859 d!64717))

(declare-fun b!278268 () Bool)

(declare-fun e!177485 () Bool)

(declare-fun call!25358 () Bool)

(assert (=> b!278268 (= e!177485 call!25358)))

(declare-fun b!278269 () Bool)

(declare-fun e!177486 () Bool)

(assert (=> b!278269 (= e!177486 call!25358)))

(declare-fun b!278270 () Bool)

(assert (=> b!278270 (= e!177486 e!177485)))

(declare-fun lt!138174 () (_ BitVec 64))

(assert (=> b!278270 (= lt!138174 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138172 () Unit!8745)

(assert (=> b!278270 (= lt!138172 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!137935 lt!138174 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278270 (arrayContainsKey!0 lt!137935 lt!138174 #b00000000000000000000000000000000)))

(declare-fun lt!138173 () Unit!8745)

(assert (=> b!278270 (= lt!138173 lt!138172)))

(declare-fun res!141832 () Bool)

(assert (=> b!278270 (= res!141832 (= (seekEntryOrOpen!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)) lt!137935 mask!3868) (Found!1724 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278270 (=> (not res!141832) (not e!177485))))

(declare-fun bm!25355 () Bool)

(assert (=> bm!25355 (= call!25358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!137935 mask!3868))))

(declare-fun d!64719 () Bool)

(declare-fun res!141833 () Bool)

(declare-fun e!177487 () Bool)

(assert (=> d!64719 (=> res!141833 e!177487)))

(assert (=> d!64719 (= res!141833 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (size!6920 lt!137935)))))

(assert (=> d!64719 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!137935 mask!3868) e!177487)))

(declare-fun b!278271 () Bool)

(assert (=> b!278271 (= e!177487 e!177486)))

(declare-fun c!45770 () Bool)

(assert (=> b!278271 (= c!45770 (validKeyInArray!0 (select (arr!6567 lt!137935) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (= (and d!64719 (not res!141833)) b!278271))

(assert (= (and b!278271 c!45770) b!278270))

(assert (= (and b!278271 (not c!45770)) b!278269))

(assert (= (and b!278270 res!141832) b!278268))

(assert (= (or b!278268 b!278269) bm!25355))

(declare-fun m!292833 () Bool)

(assert (=> b!278270 m!292833))

(declare-fun m!292835 () Bool)

(assert (=> b!278270 m!292835))

(declare-fun m!292837 () Bool)

(assert (=> b!278270 m!292837))

(assert (=> b!278270 m!292833))

(declare-fun m!292839 () Bool)

(assert (=> b!278270 m!292839))

(declare-fun m!292841 () Bool)

(assert (=> bm!25355 m!292841))

(assert (=> b!278271 m!292833))

(assert (=> b!278271 m!292833))

(declare-fun m!292843 () Bool)

(assert (=> b!278271 m!292843))

(assert (=> bm!25336 d!64719))

(check-sat (not d!64695) (not b!278227) (not bm!25354) (not d!64661) (not b!278081) (not b!278226) (not b!278213) (not d!64637) (not d!64707) (not bm!25353) (not d!64705) (not b!278270) (not b!278221) (not b!278119) (not b!278209) (not bm!25355) (not bm!25352) (not d!64689) (not b!278256) (not d!64641) (not b!278113) (not b!278084) (not b!278224) (not d!64659) (not d!64701) (not b!278082) (not d!64711) (not bm!25348) (not b!278253) (not b!278217) (not b!278260) (not b!278115) (not d!64655) (not d!64647) (not b!278267) (not b!278271) (not b!278088) (not b!278164) (not d!64691) (not b!278257) (not b!278261) (not d!64717) (not b!278220))
(check-sat)
