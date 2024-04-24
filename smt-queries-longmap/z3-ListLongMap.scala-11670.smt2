; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136882 () Bool)

(assert start!136882)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun e!881432 () Bool)

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((array!105746 0))(
  ( (array!105747 (arr!50983 (Array (_ BitVec 32) (_ BitVec 64))) (size!51534 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105746)

(declare-fun b!1579989 () Bool)

(declare-datatypes ((SeekEntryResult!13703 0))(
  ( (MissingZero!13703 (index!57210 (_ BitVec 32))) (Found!13703 (index!57211 (_ BitVec 32))) (Intermediate!13703 (undefined!14515 Bool) (index!57212 (_ BitVec 32)) (x!142557 (_ BitVec 32))) (Undefined!13703) (MissingVacant!13703 (index!57213 (_ BitVec 32))) )
))
(declare-fun lt!676929 () SeekEntryResult!13703)

(get-info :version)

(assert (=> b!1579989 (= e!881432 (and ((_ is Intermediate!13703) lt!676929) (not (undefined!14515 lt!676929)) (bvslt (x!142557 lt!676929) #b01111111111111111111111111111110) (bvsge (x!142557 lt!676929) #b00000000000000000000000000000000) (bvsge (x!142557 lt!676929) x!458) (not (= (select (arr!50983 _keys!610) (index!57212 lt!676929)) k0!768)) (or (bvslt (index!57212 lt!676929) #b00000000000000000000000000000000) (bvsge (index!57212 lt!676929) (size!51534 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105746 (_ BitVec 32)) SeekEntryResult!13703)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579989 (= lt!676929 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1579987 () Bool)

(declare-fun res!1078622 () Bool)

(assert (=> b!1579987 (=> (not res!1078622) (not e!881432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579987 (= res!1078622 (validKeyInArray!0 k0!768))))

(declare-fun res!1078619 () Bool)

(assert (=> start!136882 (=> (not res!1078619) (not e!881432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136882 (= res!1078619 (validMask!0 mask!910))))

(assert (=> start!136882 e!881432))

(assert (=> start!136882 true))

(declare-fun array_inv!39938 (array!105746) Bool)

(assert (=> start!136882 (array_inv!39938 _keys!610)))

(declare-fun b!1579986 () Bool)

(declare-fun res!1078620 () Bool)

(assert (=> b!1579986 (=> (not res!1078620) (not e!881432))))

(assert (=> b!1579986 (= res!1078620 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51534 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579988 () Bool)

(declare-fun res!1078621 () Bool)

(assert (=> b!1579988 (=> (not res!1078621) (not e!881432))))

(assert (=> b!1579988 (= res!1078621 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50983 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50983 _keys!610) ee!12) (select (arr!50983 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136882 res!1078619) b!1579986))

(assert (= (and b!1579986 res!1078620) b!1579987))

(assert (= (and b!1579987 res!1078622) b!1579988))

(assert (= (and b!1579988 res!1078621) b!1579989))

(declare-fun m!1452033 () Bool)

(assert (=> b!1579989 m!1452033))

(declare-fun m!1452035 () Bool)

(assert (=> b!1579989 m!1452035))

(assert (=> b!1579989 m!1452035))

(declare-fun m!1452037 () Bool)

(assert (=> b!1579989 m!1452037))

(declare-fun m!1452039 () Bool)

(assert (=> b!1579987 m!1452039))

(declare-fun m!1452041 () Bool)

(assert (=> start!136882 m!1452041))

(declare-fun m!1452043 () Bool)

(assert (=> start!136882 m!1452043))

(declare-fun m!1452045 () Bool)

(assert (=> b!1579988 m!1452045))

(check-sat (not start!136882) (not b!1579989) (not b!1579987))
(check-sat)
(get-model)

(declare-fun d!166613 () Bool)

(assert (=> d!166613 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136882 d!166613))

(declare-fun d!166617 () Bool)

(assert (=> d!166617 (= (array_inv!39938 _keys!610) (bvsge (size!51534 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136882 d!166617))

(declare-fun b!1580032 () Bool)

(declare-fun e!881455 () SeekEntryResult!13703)

(assert (=> b!1580032 (= e!881455 (Intermediate!13703 false (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1580033 () Bool)

(declare-fun lt!676940 () SeekEntryResult!13703)

(assert (=> b!1580033 (and (bvsge (index!57212 lt!676940) #b00000000000000000000000000000000) (bvslt (index!57212 lt!676940) (size!51534 _keys!610)))))

(declare-fun e!881458 () Bool)

(assert (=> b!1580033 (= e!881458 (= (select (arr!50983 _keys!610) (index!57212 lt!676940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!166619 () Bool)

(declare-fun e!881456 () Bool)

(assert (=> d!166619 e!881456))

(declare-fun c!146985 () Bool)

(assert (=> d!166619 (= c!146985 (and ((_ is Intermediate!13703) lt!676940) (undefined!14515 lt!676940)))))

(declare-fun e!881459 () SeekEntryResult!13703)

(assert (=> d!166619 (= lt!676940 e!881459)))

(declare-fun c!146987 () Bool)

(assert (=> d!166619 (= c!146987 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676941 () (_ BitVec 64))

(assert (=> d!166619 (= lt!676941 (select (arr!50983 _keys!610) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910)))))

(assert (=> d!166619 (validMask!0 mask!910)))

(assert (=> d!166619 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910) lt!676940)))

(declare-fun b!1580034 () Bool)

(assert (=> b!1580034 (and (bvsge (index!57212 lt!676940) #b00000000000000000000000000000000) (bvslt (index!57212 lt!676940) (size!51534 _keys!610)))))

(declare-fun res!1078653 () Bool)

(assert (=> b!1580034 (= res!1078653 (= (select (arr!50983 _keys!610) (index!57212 lt!676940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1580034 (=> res!1078653 e!881458)))

(declare-fun b!1580035 () Bool)

(declare-fun e!881457 () Bool)

(assert (=> b!1580035 (= e!881456 e!881457)))

(declare-fun res!1078655 () Bool)

(assert (=> b!1580035 (= res!1078655 (and ((_ is Intermediate!13703) lt!676940) (not (undefined!14515 lt!676940)) (bvslt (x!142557 lt!676940) #b01111111111111111111111111111110) (bvsge (x!142557 lt!676940) #b00000000000000000000000000000000) (bvsge (x!142557 lt!676940) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1580035 (=> (not res!1078655) (not e!881457))))

(declare-fun b!1580036 () Bool)

(assert (=> b!1580036 (= e!881459 e!881455)))

(declare-fun c!146986 () Bool)

(assert (=> b!1580036 (= c!146986 (or (= lt!676941 k0!768) (= (bvadd lt!676941 lt!676941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580037 () Bool)

(assert (=> b!1580037 (= e!881456 (bvsge (x!142557 lt!676940) #b01111111111111111111111111111110))))

(declare-fun b!1580038 () Bool)

(assert (=> b!1580038 (= e!881455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1580039 () Bool)

(assert (=> b!1580039 (= e!881459 (Intermediate!13703 true (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1580040 () Bool)

(assert (=> b!1580040 (and (bvsge (index!57212 lt!676940) #b00000000000000000000000000000000) (bvslt (index!57212 lt!676940) (size!51534 _keys!610)))))

(declare-fun res!1078654 () Bool)

(assert (=> b!1580040 (= res!1078654 (= (select (arr!50983 _keys!610) (index!57212 lt!676940)) k0!768))))

(assert (=> b!1580040 (=> res!1078654 e!881458)))

(assert (=> b!1580040 (= e!881457 e!881458)))

(assert (= (and d!166619 c!146987) b!1580039))

(assert (= (and d!166619 (not c!146987)) b!1580036))

(assert (= (and b!1580036 c!146986) b!1580032))

(assert (= (and b!1580036 (not c!146986)) b!1580038))

(assert (= (and d!166619 c!146985) b!1580037))

(assert (= (and d!166619 (not c!146985)) b!1580035))

(assert (= (and b!1580035 res!1078655) b!1580040))

(assert (= (and b!1580040 (not res!1078654)) b!1580034))

(assert (= (and b!1580034 (not res!1078653)) b!1580033))

(assert (=> b!1580038 m!1452035))

(declare-fun m!1452075 () Bool)

(assert (=> b!1580038 m!1452075))

(assert (=> b!1580038 m!1452075))

(declare-fun m!1452077 () Bool)

(assert (=> b!1580038 m!1452077))

(assert (=> d!166619 m!1452035))

(declare-fun m!1452079 () Bool)

(assert (=> d!166619 m!1452079))

(assert (=> d!166619 m!1452041))

(declare-fun m!1452081 () Bool)

(assert (=> b!1580034 m!1452081))

(assert (=> b!1580040 m!1452081))

(assert (=> b!1580033 m!1452081))

(assert (=> b!1579989 d!166619))

(declare-fun d!166633 () Bool)

(declare-fun lt!676944 () (_ BitVec 32))

(assert (=> d!166633 (and (bvsge lt!676944 #b00000000000000000000000000000000) (bvslt lt!676944 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166633 (= lt!676944 (choose!52 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(assert (=> d!166633 (validMask!0 mask!910)))

(assert (=> d!166633 (= (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) lt!676944)))

(declare-fun bs!45610 () Bool)

(assert (= bs!45610 d!166633))

(declare-fun m!1452083 () Bool)

(assert (=> bs!45610 m!1452083))

(assert (=> bs!45610 m!1452041))

(assert (=> b!1579989 d!166633))

(declare-fun d!166637 () Bool)

(assert (=> d!166637 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579987 d!166637))

(check-sat (not b!1580038) (not d!166633) (not d!166619))
(check-sat)
