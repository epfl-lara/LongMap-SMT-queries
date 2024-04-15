; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134802 () Bool)

(assert start!134802)

(declare-fun res!1073893 () Bool)

(declare-fun e!876287 () Bool)

(assert (=> start!134802 (=> (not res!1073893) (not e!876287))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134802 (= res!1073893 (validMask!0 mask!889))))

(assert (=> start!134802 e!876287))

(assert (=> start!134802 true))

(declare-datatypes ((array!104877 0))(
  ( (array!104878 (arr!50609 (Array (_ BitVec 32) (_ BitVec 64))) (size!51161 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104877)

(declare-fun array_inv!39545 (array!104877) Bool)

(assert (=> start!134802 (array_inv!39545 _keys!600)))

(declare-fun b!1571592 () Bool)

(declare-fun res!1073894 () Bool)

(assert (=> b!1571592 (=> (not res!1073894) (not e!876287))))

(assert (=> b!1571592 (= res!1073894 (= (size!51161 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571593 () Bool)

(declare-fun res!1073895 () Bool)

(assert (=> b!1571593 (=> (not res!1073895) (not e!876287))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571593 (= res!1073895 (validKeyInArray!0 k0!754))))

(declare-fun b!1571594 () Bool)

(declare-datatypes ((SeekEntryResult!13557 0))(
  ( (MissingZero!13557 (index!56626 (_ BitVec 32))) (Found!13557 (index!56627 (_ BitVec 32))) (Intermediate!13557 (undefined!14369 Bool) (index!56628 (_ BitVec 32)) (x!141388 (_ BitVec 32))) (Undefined!13557) (MissingVacant!13557 (index!56629 (_ BitVec 32))) )
))
(declare-fun lt!673494 () SeekEntryResult!13557)

(get-info :version)

(assert (=> b!1571594 (= e!876287 (and ((_ is Intermediate!13557) lt!673494) (not (undefined!14369 lt!673494)) (not (= (select (arr!50609 _keys!600) (index!56628 lt!673494)) k0!754)) (not (= (select (arr!50609 _keys!600) (index!56628 lt!673494)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50609 _keys!600) (index!56628 lt!673494)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56628 lt!673494) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673494) (bvadd #b00000000000000000000000000000001 mask!889)) (bvsge mask!889 #b00000000000000000000000000000000) (or (bvsgt (x!141388 lt!673494) #b01111111111111111111111111111110) (bvslt (x!141388 lt!673494) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104877 (_ BitVec 32)) SeekEntryResult!13557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571594 (= lt!673494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134802 res!1073893) b!1571592))

(assert (= (and b!1571592 res!1073894) b!1571593))

(assert (= (and b!1571593 res!1073895) b!1571594))

(declare-fun m!1444905 () Bool)

(assert (=> start!134802 m!1444905))

(declare-fun m!1444907 () Bool)

(assert (=> start!134802 m!1444907))

(declare-fun m!1444909 () Bool)

(assert (=> b!1571593 m!1444909))

(declare-fun m!1444911 () Bool)

(assert (=> b!1571594 m!1444911))

(declare-fun m!1444913 () Bool)

(assert (=> b!1571594 m!1444913))

(assert (=> b!1571594 m!1444913))

(declare-fun m!1444915 () Bool)

(assert (=> b!1571594 m!1444915))

(check-sat (not start!134802) (not b!1571593) (not b!1571594))
(check-sat)
(get-model)

(declare-fun d!164419 () Bool)

(assert (=> d!164419 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134802 d!164419))

(declare-fun d!164421 () Bool)

(assert (=> d!164421 (= (array_inv!39545 _keys!600) (bvsge (size!51161 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134802 d!164421))

(declare-fun d!164423 () Bool)

(assert (=> d!164423 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571593 d!164423))

(declare-fun b!1571649 () Bool)

(declare-fun e!876321 () SeekEntryResult!13557)

(declare-fun e!876322 () SeekEntryResult!13557)

(assert (=> b!1571649 (= e!876321 e!876322)))

(declare-fun c!145106 () Bool)

(declare-fun lt!673513 () (_ BitVec 64))

(assert (=> b!1571649 (= c!145106 (or (= lt!673513 k0!754) (= (bvadd lt!673513 lt!673513) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1571651 () Bool)

(declare-fun lt!673514 () SeekEntryResult!13557)

(assert (=> b!1571651 (and (bvsge (index!56628 lt!673514) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673514) (size!51161 _keys!600)))))

(declare-fun res!1073921 () Bool)

(assert (=> b!1571651 (= res!1073921 (= (select (arr!50609 _keys!600) (index!56628 lt!673514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876320 () Bool)

(assert (=> b!1571651 (=> res!1073921 e!876320)))

(declare-fun b!1571652 () Bool)

(assert (=> b!1571652 (and (bvsge (index!56628 lt!673514) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673514) (size!51161 _keys!600)))))

(assert (=> b!1571652 (= e!876320 (= (select (arr!50609 _keys!600) (index!56628 lt!673514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1571653 () Bool)

(declare-fun e!876319 () Bool)

(declare-fun e!876318 () Bool)

(assert (=> b!1571653 (= e!876319 e!876318)))

(declare-fun res!1073920 () Bool)

(assert (=> b!1571653 (= res!1073920 (and ((_ is Intermediate!13557) lt!673514) (not (undefined!14369 lt!673514)) (bvslt (x!141388 lt!673514) #b01111111111111111111111111111110) (bvsge (x!141388 lt!673514) #b00000000000000000000000000000000) (bvsge (x!141388 lt!673514) #b00000000000000000000000000000000)))))

(assert (=> b!1571653 (=> (not res!1073920) (not e!876318))))

(declare-fun b!1571654 () Bool)

(assert (=> b!1571654 (= e!876321 (Intermediate!13557 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571655 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571655 (= e!876322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1571650 () Bool)

(assert (=> b!1571650 (= e!876319 (bvsge (x!141388 lt!673514) #b01111111111111111111111111111110))))

(declare-fun d!164425 () Bool)

(assert (=> d!164425 e!876319))

(declare-fun c!145107 () Bool)

(assert (=> d!164425 (= c!145107 (and ((_ is Intermediate!13557) lt!673514) (undefined!14369 lt!673514)))))

(assert (=> d!164425 (= lt!673514 e!876321)))

(declare-fun c!145105 () Bool)

(assert (=> d!164425 (= c!145105 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164425 (= lt!673513 (select (arr!50609 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164425 (validMask!0 mask!889)))

(assert (=> d!164425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673514)))

(declare-fun b!1571656 () Bool)

(assert (=> b!1571656 (and (bvsge (index!56628 lt!673514) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673514) (size!51161 _keys!600)))))

(declare-fun res!1073922 () Bool)

(assert (=> b!1571656 (= res!1073922 (= (select (arr!50609 _keys!600) (index!56628 lt!673514)) k0!754))))

(assert (=> b!1571656 (=> res!1073922 e!876320)))

(assert (=> b!1571656 (= e!876318 e!876320)))

(declare-fun b!1571657 () Bool)

(assert (=> b!1571657 (= e!876322 (Intermediate!13557 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164425 c!145105) b!1571654))

(assert (= (and d!164425 (not c!145105)) b!1571649))

(assert (= (and b!1571649 c!145106) b!1571657))

(assert (= (and b!1571649 (not c!145106)) b!1571655))

(assert (= (and d!164425 c!145107) b!1571650))

(assert (= (and d!164425 (not c!145107)) b!1571653))

(assert (= (and b!1571653 res!1073920) b!1571656))

(assert (= (and b!1571656 (not res!1073922)) b!1571651))

(assert (= (and b!1571651 (not res!1073921)) b!1571652))

(assert (=> b!1571655 m!1444913))

(declare-fun m!1444941 () Bool)

(assert (=> b!1571655 m!1444941))

(assert (=> b!1571655 m!1444941))

(declare-fun m!1444943 () Bool)

(assert (=> b!1571655 m!1444943))

(assert (=> d!164425 m!1444913))

(declare-fun m!1444945 () Bool)

(assert (=> d!164425 m!1444945))

(assert (=> d!164425 m!1444905))

(declare-fun m!1444947 () Bool)

(assert (=> b!1571652 m!1444947))

(assert (=> b!1571656 m!1444947))

(assert (=> b!1571651 m!1444947))

(assert (=> b!1571594 d!164425))

(declare-fun d!164431 () Bool)

(declare-fun lt!673524 () (_ BitVec 32))

(declare-fun lt!673523 () (_ BitVec 32))

(assert (=> d!164431 (= lt!673524 (bvmul (bvxor lt!673523 (bvlshr lt!673523 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164431 (= lt!673523 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164431 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1073935 (let ((h!38252 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141394 (bvmul (bvxor h!38252 (bvlshr h!38252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141394 (bvlshr x!141394 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1073935 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1073935 #b00000000000000000000000000000000))))))

(assert (=> d!164431 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673524 (bvlshr lt!673524 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571594 d!164431))

(check-sat (not b!1571655) (not d!164425))
(check-sat)
