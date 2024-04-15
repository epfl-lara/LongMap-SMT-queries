; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136414 () Bool)

(assert start!136414)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun e!879707 () Bool)

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((array!105545 0))(
  ( (array!105546 (arr!50891 (Array (_ BitVec 32) (_ BitVec 64))) (size!51443 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105545)

(declare-datatypes ((SeekEntryResult!13755 0))(
  ( (MissingZero!13755 (index!57418 (_ BitVec 32))) (Found!13755 (index!57419 (_ BitVec 32))) (Intermediate!13755 (undefined!14567 Bool) (index!57420 (_ BitVec 32)) (x!142545 (_ BitVec 32))) (Undefined!13755) (MissingVacant!13755 (index!57421 (_ BitVec 32))) )
))
(declare-fun lt!675735 () SeekEntryResult!13755)

(declare-fun b!1577213 () Bool)

(get-info :version)

(assert (=> b!1577213 (= e!879707 (and ((_ is Intermediate!13755) lt!675735) (not (undefined!14567 lt!675735)) (bvslt (x!142545 lt!675735) #b01111111111111111111111111111110) (bvsge (x!142545 lt!675735) #b00000000000000000000000000000000) (bvsge (x!142545 lt!675735) x!458) (not (= (select (arr!50891 _keys!610) (index!57420 lt!675735)) k0!768)) (or (bvslt (index!57420 lt!675735) #b00000000000000000000000000000000) (bvsge (index!57420 lt!675735) (size!51443 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105545 (_ BitVec 32)) SeekEntryResult!13755)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577213 (= lt!675735 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577212 () Bool)

(declare-fun res!1077605 () Bool)

(assert (=> b!1577212 (=> (not res!1077605) (not e!879707))))

(assert (=> b!1577212 (= res!1077605 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50891 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50891 _keys!610) ee!12) (select (arr!50891 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577210 () Bool)

(declare-fun res!1077603 () Bool)

(assert (=> b!1577210 (=> (not res!1077603) (not e!879707))))

(assert (=> b!1577210 (= res!1077603 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51443 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577211 () Bool)

(declare-fun res!1077606 () Bool)

(assert (=> b!1577211 (=> (not res!1077606) (not e!879707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577211 (= res!1077606 (validKeyInArray!0 k0!768))))

(declare-fun res!1077604 () Bool)

(assert (=> start!136414 (=> (not res!1077604) (not e!879707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136414 (= res!1077604 (validMask!0 mask!910))))

(assert (=> start!136414 e!879707))

(assert (=> start!136414 true))

(declare-fun array_inv!39827 (array!105545) Bool)

(assert (=> start!136414 (array_inv!39827 _keys!610)))

(assert (= (and start!136414 res!1077604) b!1577210))

(assert (= (and b!1577210 res!1077603) b!1577211))

(assert (= (and b!1577211 res!1077606) b!1577212))

(assert (= (and b!1577212 res!1077605) b!1577213))

(declare-fun m!1448859 () Bool)

(assert (=> b!1577213 m!1448859))

(declare-fun m!1448861 () Bool)

(assert (=> b!1577213 m!1448861))

(assert (=> b!1577213 m!1448861))

(declare-fun m!1448863 () Bool)

(assert (=> b!1577213 m!1448863))

(declare-fun m!1448865 () Bool)

(assert (=> b!1577212 m!1448865))

(declare-fun m!1448867 () Bool)

(assert (=> b!1577211 m!1448867))

(declare-fun m!1448869 () Bool)

(assert (=> start!136414 m!1448869))

(declare-fun m!1448871 () Bool)

(assert (=> start!136414 m!1448871))

(check-sat (not b!1577211) (not start!136414) (not b!1577213))
(check-sat)
(get-model)

(declare-fun d!165655 () Bool)

(assert (=> d!165655 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577211 d!165655))

(declare-fun d!165657 () Bool)

(assert (=> d!165657 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136414 d!165657))

(declare-fun d!165661 () Bool)

(assert (=> d!165661 (= (array_inv!39827 _keys!610) (bvsge (size!51443 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136414 d!165661))

(declare-fun b!1577292 () Bool)

(declare-fun lt!675755 () SeekEntryResult!13755)

(assert (=> b!1577292 (and (bvsge (index!57420 lt!675755) #b00000000000000000000000000000000) (bvslt (index!57420 lt!675755) (size!51443 _keys!610)))))

(declare-fun res!1077649 () Bool)

(assert (=> b!1577292 (= res!1077649 (= (select (arr!50891 _keys!610) (index!57420 lt!675755)) k0!768))))

(declare-fun e!879753 () Bool)

(assert (=> b!1577292 (=> res!1077649 e!879753)))

(declare-fun e!879751 () Bool)

(assert (=> b!1577292 (= e!879751 e!879753)))

(declare-fun b!1577294 () Bool)

(declare-fun e!879752 () Bool)

(assert (=> b!1577294 (= e!879752 e!879751)))

(declare-fun res!1077650 () Bool)

(assert (=> b!1577294 (= res!1077650 (and ((_ is Intermediate!13755) lt!675755) (not (undefined!14567 lt!675755)) (bvslt (x!142545 lt!675755) #b01111111111111111111111111111110) (bvsge (x!142545 lt!675755) #b00000000000000000000000000000000) (bvsge (x!142545 lt!675755) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577294 (=> (not res!1077650) (not e!879751))))

(declare-fun b!1577296 () Bool)

(declare-fun e!879754 () SeekEntryResult!13755)

(assert (=> b!1577296 (= e!879754 (Intermediate!13755 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577298 () Bool)

(assert (=> b!1577298 (= e!879754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun d!165663 () Bool)

(assert (=> d!165663 e!879752))

(declare-fun c!146110 () Bool)

(assert (=> d!165663 (= c!146110 (and ((_ is Intermediate!13755) lt!675755) (undefined!14567 lt!675755)))))

(declare-fun e!879750 () SeekEntryResult!13755)

(assert (=> d!165663 (= lt!675755 e!879750)))

(declare-fun c!146113 () Bool)

(assert (=> d!165663 (= c!146113 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!675757 () (_ BitVec 64))

(assert (=> d!165663 (= lt!675757 (select (arr!50891 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165663 (validMask!0 mask!910)))

(assert (=> d!165663 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!675755)))

(declare-fun b!1577300 () Bool)

(assert (=> b!1577300 (= e!879750 e!879754)))

(declare-fun c!146112 () Bool)

(assert (=> b!1577300 (= c!146112 (or (= lt!675757 k0!768) (= (bvadd lt!675757 lt!675757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577302 () Bool)

(assert (=> b!1577302 (and (bvsge (index!57420 lt!675755) #b00000000000000000000000000000000) (bvslt (index!57420 lt!675755) (size!51443 _keys!610)))))

(assert (=> b!1577302 (= e!879753 (= (select (arr!50891 _keys!610) (index!57420 lt!675755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577304 () Bool)

(assert (=> b!1577304 (= e!879750 (Intermediate!13755 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577306 () Bool)

(assert (=> b!1577306 (and (bvsge (index!57420 lt!675755) #b00000000000000000000000000000000) (bvslt (index!57420 lt!675755) (size!51443 _keys!610)))))

(declare-fun res!1077653 () Bool)

(assert (=> b!1577306 (= res!1077653 (= (select (arr!50891 _keys!610) (index!57420 lt!675755)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577306 (=> res!1077653 e!879753)))

(declare-fun b!1577308 () Bool)

(assert (=> b!1577308 (= e!879752 (bvsge (x!142545 lt!675755) #b01111111111111111111111111111110))))

(assert (= (and d!165663 c!146113) b!1577304))

(assert (= (and d!165663 (not c!146113)) b!1577300))

(assert (= (and b!1577300 c!146112) b!1577296))

(assert (= (and b!1577300 (not c!146112)) b!1577298))

(assert (= (and d!165663 c!146110) b!1577308))

(assert (= (and d!165663 (not c!146110)) b!1577294))

(assert (= (and b!1577294 res!1077650) b!1577292))

(assert (= (and b!1577292 (not res!1077649)) b!1577306))

(assert (= (and b!1577306 (not res!1077653)) b!1577302))

(assert (=> b!1577298 m!1448861))

(declare-fun m!1448905 () Bool)

(assert (=> b!1577298 m!1448905))

(assert (=> b!1577298 m!1448905))

(declare-fun m!1448909 () Bool)

(assert (=> b!1577298 m!1448909))

(declare-fun m!1448913 () Bool)

(assert (=> b!1577306 m!1448913))

(assert (=> b!1577292 m!1448913))

(assert (=> b!1577302 m!1448913))

(assert (=> d!165663 m!1448861))

(declare-fun m!1448915 () Bool)

(assert (=> d!165663 m!1448915))

(assert (=> d!165663 m!1448869))

(assert (=> b!1577213 d!165663))

(declare-fun d!165673 () Bool)

(declare-fun lt!675765 () (_ BitVec 32))

(assert (=> d!165673 (and (bvsge lt!675765 #b00000000000000000000000000000000) (bvslt lt!675765 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165673 (= lt!675765 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165673 (validMask!0 mask!910)))

(assert (=> d!165673 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675765)))

(declare-fun bs!45544 () Bool)

(assert (= bs!45544 d!165673))

(declare-fun m!1448927 () Bool)

(assert (=> bs!45544 m!1448927))

(assert (=> bs!45544 m!1448869))

(assert (=> b!1577213 d!165673))

(check-sat (not d!165663) (not d!165673) (not b!1577298))
(check-sat)
