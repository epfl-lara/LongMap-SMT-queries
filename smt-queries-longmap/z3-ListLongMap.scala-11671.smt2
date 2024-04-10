; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136524 () Bool)

(assert start!136524)

(declare-fun b!1577769 () Bool)

(declare-fun res!1077870 () Bool)

(declare-fun e!880037 () Bool)

(assert (=> b!1577769 (=> (not res!1077870) (not e!880037))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105634 0))(
  ( (array!105635 (arr!50933 (Array (_ BitVec 32) (_ BitVec 64))) (size!51483 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105634)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577769 (= res!1077870 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51483 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077871 () Bool)

(assert (=> start!136524 (=> (not res!1077871) (not e!880037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136524 (= res!1077871 (validMask!0 mask!910))))

(assert (=> start!136524 e!880037))

(assert (=> start!136524 true))

(declare-fun array_inv!39660 (array!105634) Bool)

(assert (=> start!136524 (array_inv!39660 _keys!610)))

(declare-datatypes ((SeekEntryResult!13762 0))(
  ( (MissingZero!13762 (index!57446 (_ BitVec 32))) (Found!13762 (index!57447 (_ BitVec 32))) (Intermediate!13762 (undefined!14574 Bool) (index!57448 (_ BitVec 32)) (x!142585 (_ BitVec 32))) (Undefined!13762) (MissingVacant!13762 (index!57449 (_ BitVec 32))) )
))
(declare-fun lt!676096 () SeekEntryResult!13762)

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun b!1577772 () Bool)

(get-info :version)

(assert (=> b!1577772 (= e!880037 (ite (and ((_ is Intermediate!13762) lt!676096) (undefined!14574 lt!676096)) (bvslt (x!142585 lt!676096) #b01111111111111111111111111111110) (or (not ((_ is Intermediate!13762) lt!676096)) (undefined!14574 lt!676096) (bvsge (x!142585 lt!676096) #b01111111111111111111111111111110) (bvslt (x!142585 lt!676096) #b00000000000000000000000000000000) (bvslt (x!142585 lt!676096) x!458) (and (not (= (select (arr!50933 _keys!610) (index!57448 lt!676096)) k0!768)) (not (= (select (arr!50933 _keys!610) (index!57448 lt!676096)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50933 _keys!610) (index!57448 lt!676096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105634 (_ BitVec 32)) SeekEntryResult!13762)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577772 (= lt!676096 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577770 () Bool)

(declare-fun res!1077872 () Bool)

(assert (=> b!1577770 (=> (not res!1077872) (not e!880037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577770 (= res!1077872 (validKeyInArray!0 k0!768))))

(declare-fun b!1577771 () Bool)

(declare-fun res!1077873 () Bool)

(assert (=> b!1577771 (=> (not res!1077873) (not e!880037))))

(assert (=> b!1577771 (= res!1077873 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50933 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50933 _keys!610) ee!12) (select (arr!50933 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136524 res!1077871) b!1577769))

(assert (= (and b!1577769 res!1077870) b!1577770))

(assert (= (and b!1577770 res!1077872) b!1577771))

(assert (= (and b!1577771 res!1077873) b!1577772))

(declare-fun m!1449909 () Bool)

(assert (=> start!136524 m!1449909))

(declare-fun m!1449911 () Bool)

(assert (=> start!136524 m!1449911))

(declare-fun m!1449913 () Bool)

(assert (=> b!1577772 m!1449913))

(declare-fun m!1449915 () Bool)

(assert (=> b!1577772 m!1449915))

(assert (=> b!1577772 m!1449915))

(declare-fun m!1449917 () Bool)

(assert (=> b!1577772 m!1449917))

(declare-fun m!1449919 () Bool)

(assert (=> b!1577770 m!1449919))

(declare-fun m!1449921 () Bool)

(assert (=> b!1577771 m!1449921))

(check-sat (not b!1577770) (not start!136524) (not b!1577772))
(check-sat)
(get-model)

(declare-fun d!165959 () Bool)

(assert (=> d!165959 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577770 d!165959))

(declare-fun d!165961 () Bool)

(assert (=> d!165961 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136524 d!165961))

(declare-fun d!165965 () Bool)

(assert (=> d!165965 (= (array_inv!39660 _keys!610) (bvsge (size!51483 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136524 d!165965))

(declare-fun b!1577830 () Bool)

(declare-fun lt!676113 () SeekEntryResult!13762)

(assert (=> b!1577830 (and (bvsge (index!57448 lt!676113) #b00000000000000000000000000000000) (bvslt (index!57448 lt!676113) (size!51483 _keys!610)))))

(declare-fun res!1077902 () Bool)

(assert (=> b!1577830 (= res!1077902 (= (select (arr!50933 _keys!610) (index!57448 lt!676113)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880070 () Bool)

(assert (=> b!1577830 (=> res!1077902 e!880070)))

(declare-fun b!1577831 () Bool)

(declare-fun e!880073 () SeekEntryResult!13762)

(assert (=> b!1577831 (= e!880073 (Intermediate!13762 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577832 () Bool)

(declare-fun e!880072 () SeekEntryResult!13762)

(assert (=> b!1577832 (= e!880072 (Intermediate!13762 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577833 () Bool)

(assert (=> b!1577833 (and (bvsge (index!57448 lt!676113) #b00000000000000000000000000000000) (bvslt (index!57448 lt!676113) (size!51483 _keys!610)))))

(declare-fun res!1077903 () Bool)

(assert (=> b!1577833 (= res!1077903 (= (select (arr!50933 _keys!610) (index!57448 lt!676113)) k0!768))))

(assert (=> b!1577833 (=> res!1077903 e!880070)))

(declare-fun e!880071 () Bool)

(assert (=> b!1577833 (= e!880071 e!880070)))

(declare-fun b!1577834 () Bool)

(declare-fun e!880069 () Bool)

(assert (=> b!1577834 (= e!880069 e!880071)))

(declare-fun res!1077901 () Bool)

(assert (=> b!1577834 (= res!1077901 (and ((_ is Intermediate!13762) lt!676113) (not (undefined!14574 lt!676113)) (bvslt (x!142585 lt!676113) #b01111111111111111111111111111110) (bvsge (x!142585 lt!676113) #b00000000000000000000000000000000) (bvsge (x!142585 lt!676113) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577834 (=> (not res!1077901) (not e!880071))))

(declare-fun b!1577835 () Bool)

(assert (=> b!1577835 (and (bvsge (index!57448 lt!676113) #b00000000000000000000000000000000) (bvslt (index!57448 lt!676113) (size!51483 _keys!610)))))

(assert (=> b!1577835 (= e!880070 (= (select (arr!50933 _keys!610) (index!57448 lt!676113)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577836 () Bool)

(assert (=> b!1577836 (= e!880073 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun d!165967 () Bool)

(assert (=> d!165967 e!880069))

(declare-fun c!146249 () Bool)

(assert (=> d!165967 (= c!146249 (and ((_ is Intermediate!13762) lt!676113) (undefined!14574 lt!676113)))))

(assert (=> d!165967 (= lt!676113 e!880072)))

(declare-fun c!146250 () Bool)

(assert (=> d!165967 (= c!146250 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676114 () (_ BitVec 64))

(assert (=> d!165967 (= lt!676114 (select (arr!50933 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165967 (validMask!0 mask!910)))

(assert (=> d!165967 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!676113)))

(declare-fun b!1577837 () Bool)

(assert (=> b!1577837 (= e!880069 (bvsge (x!142585 lt!676113) #b01111111111111111111111111111110))))

(declare-fun b!1577838 () Bool)

(assert (=> b!1577838 (= e!880072 e!880073)))

(declare-fun c!146248 () Bool)

(assert (=> b!1577838 (= c!146248 (or (= lt!676114 k0!768) (= (bvadd lt!676114 lt!676114) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165967 c!146250) b!1577832))

(assert (= (and d!165967 (not c!146250)) b!1577838))

(assert (= (and b!1577838 c!146248) b!1577831))

(assert (= (and b!1577838 (not c!146248)) b!1577836))

(assert (= (and d!165967 c!146249) b!1577837))

(assert (= (and d!165967 (not c!146249)) b!1577834))

(assert (= (and b!1577834 res!1077901) b!1577833))

(assert (= (and b!1577833 (not res!1077903)) b!1577830))

(assert (= (and b!1577830 (not res!1077902)) b!1577835))

(assert (=> d!165967 m!1449915))

(declare-fun m!1449947 () Bool)

(assert (=> d!165967 m!1449947))

(assert (=> d!165967 m!1449909))

(declare-fun m!1449949 () Bool)

(assert (=> b!1577835 m!1449949))

(assert (=> b!1577836 m!1449915))

(declare-fun m!1449951 () Bool)

(assert (=> b!1577836 m!1449951))

(assert (=> b!1577836 m!1449951))

(declare-fun m!1449953 () Bool)

(assert (=> b!1577836 m!1449953))

(assert (=> b!1577833 m!1449949))

(assert (=> b!1577830 m!1449949))

(assert (=> b!1577772 d!165967))

(declare-fun d!165983 () Bool)

(declare-fun lt!676117 () (_ BitVec 32))

(assert (=> d!165983 (and (bvsge lt!676117 #b00000000000000000000000000000000) (bvslt lt!676117 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165983 (= lt!676117 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165983 (validMask!0 mask!910)))

(assert (=> d!165983 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676117)))

(declare-fun bs!45602 () Bool)

(assert (= bs!45602 d!165983))

(declare-fun m!1449955 () Bool)

(assert (=> bs!45602 m!1449955))

(assert (=> bs!45602 m!1449909))

(assert (=> b!1577772 d!165983))

(check-sat (not d!165967) (not b!1577836) (not d!165983))
(check-sat)
