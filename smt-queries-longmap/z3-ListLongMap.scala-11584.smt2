; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134998 () Bool)

(assert start!134998)

(declare-fun res!1074366 () Bool)

(declare-fun e!876787 () Bool)

(assert (=> start!134998 (=> (not res!1074366) (not e!876787))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134998 (= res!1074366 (validMask!0 mask!889))))

(assert (=> start!134998 e!876787))

(assert (=> start!134998 true))

(declare-datatypes ((array!105014 0))(
  ( (array!105015 (arr!50672 (Array (_ BitVec 32) (_ BitVec 64))) (size!51222 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105014)

(declare-fun array_inv!39399 (array!105014) Bool)

(assert (=> start!134998 (array_inv!39399 _keys!600)))

(declare-fun b!1572400 () Bool)

(declare-fun res!1074365 () Bool)

(assert (=> b!1572400 (=> (not res!1074365) (not e!876787))))

(assert (=> b!1572400 (= res!1074365 (= (size!51222 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572401 () Bool)

(declare-fun res!1074364 () Bool)

(assert (=> b!1572401 (=> (not res!1074364) (not e!876787))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572401 (= res!1074364 (validKeyInArray!0 k0!754))))

(declare-fun b!1572402 () Bool)

(declare-datatypes ((SeekEntryResult!13585 0))(
  ( (MissingZero!13585 (index!56738 (_ BitVec 32))) (Found!13585 (index!56739 (_ BitVec 32))) (Intermediate!13585 (undefined!14397 Bool) (index!56740 (_ BitVec 32)) (x!141511 (_ BitVec 32))) (Undefined!13585) (MissingVacant!13585 (index!56741 (_ BitVec 32))) )
))
(declare-fun lt!673972 () SeekEntryResult!13585)

(get-info :version)

(assert (=> b!1572402 (= e!876787 (and ((_ is Intermediate!13585) lt!673972) (not (undefined!14397 lt!673972)) (or (bvslt (index!56740 lt!673972) #b00000000000000000000000000000000) (bvsge (index!56740 lt!673972) (size!51222 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105014 (_ BitVec 32)) SeekEntryResult!13585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572402 (= lt!673972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134998 res!1074366) b!1572400))

(assert (= (and b!1572400 res!1074365) b!1572401))

(assert (= (and b!1572401 res!1074364) b!1572402))

(declare-fun m!1446167 () Bool)

(assert (=> start!134998 m!1446167))

(declare-fun m!1446169 () Bool)

(assert (=> start!134998 m!1446169))

(declare-fun m!1446171 () Bool)

(assert (=> b!1572401 m!1446171))

(declare-fun m!1446173 () Bool)

(assert (=> b!1572402 m!1446173))

(assert (=> b!1572402 m!1446173))

(declare-fun m!1446175 () Bool)

(assert (=> b!1572402 m!1446175))

(check-sat (not b!1572401) (not b!1572402) (not start!134998))
(check-sat)
(get-model)

(declare-fun d!164781 () Bool)

(assert (=> d!164781 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572401 d!164781))

(declare-fun b!1572456 () Bool)

(declare-fun e!876821 () SeekEntryResult!13585)

(assert (=> b!1572456 (= e!876821 (Intermediate!13585 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572457 () Bool)

(declare-fun e!876820 () Bool)

(declare-fun e!876822 () Bool)

(assert (=> b!1572457 (= e!876820 e!876822)))

(declare-fun res!1074389 () Bool)

(declare-fun lt!673989 () SeekEntryResult!13585)

(assert (=> b!1572457 (= res!1074389 (and ((_ is Intermediate!13585) lt!673989) (not (undefined!14397 lt!673989)) (bvslt (x!141511 lt!673989) #b01111111111111111111111111111110) (bvsge (x!141511 lt!673989) #b00000000000000000000000000000000) (bvsge (x!141511 lt!673989) #b00000000000000000000000000000000)))))

(assert (=> b!1572457 (=> (not res!1074389) (not e!876822))))

(declare-fun b!1572458 () Bool)

(assert (=> b!1572458 (and (bvsge (index!56740 lt!673989) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673989) (size!51222 _keys!600)))))

(declare-fun res!1074388 () Bool)

(assert (=> b!1572458 (= res!1074388 (= (select (arr!50672 _keys!600) (index!56740 lt!673989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876823 () Bool)

(assert (=> b!1572458 (=> res!1074388 e!876823)))

(declare-fun b!1572460 () Bool)

(assert (=> b!1572460 (and (bvsge (index!56740 lt!673989) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673989) (size!51222 _keys!600)))))

(declare-fun res!1074390 () Bool)

(assert (=> b!1572460 (= res!1074390 (= (select (arr!50672 _keys!600) (index!56740 lt!673989)) k0!754))))

(assert (=> b!1572460 (=> res!1074390 e!876823)))

(assert (=> b!1572460 (= e!876822 e!876823)))

(declare-fun b!1572461 () Bool)

(declare-fun e!876819 () SeekEntryResult!13585)

(assert (=> b!1572461 (= e!876819 (Intermediate!13585 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572462 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572462 (= e!876819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572459 () Bool)

(assert (=> b!1572459 (= e!876821 e!876819)))

(declare-fun c!145278 () Bool)

(declare-fun lt!673988 () (_ BitVec 64))

(assert (=> b!1572459 (= c!145278 (or (= lt!673988 k0!754) (= (bvadd lt!673988 lt!673988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164783 () Bool)

(assert (=> d!164783 e!876820))

(declare-fun c!145279 () Bool)

(assert (=> d!164783 (= c!145279 (and ((_ is Intermediate!13585) lt!673989) (undefined!14397 lt!673989)))))

(assert (=> d!164783 (= lt!673989 e!876821)))

(declare-fun c!145277 () Bool)

(assert (=> d!164783 (= c!145277 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164783 (= lt!673988 (select (arr!50672 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164783 (validMask!0 mask!889)))

(assert (=> d!164783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673989)))

(declare-fun b!1572463 () Bool)

(assert (=> b!1572463 (and (bvsge (index!56740 lt!673989) #b00000000000000000000000000000000) (bvslt (index!56740 lt!673989) (size!51222 _keys!600)))))

(assert (=> b!1572463 (= e!876823 (= (select (arr!50672 _keys!600) (index!56740 lt!673989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572464 () Bool)

(assert (=> b!1572464 (= e!876820 (bvsge (x!141511 lt!673989) #b01111111111111111111111111111110))))

(assert (= (and d!164783 c!145277) b!1572456))

(assert (= (and d!164783 (not c!145277)) b!1572459))

(assert (= (and b!1572459 c!145278) b!1572461))

(assert (= (and b!1572459 (not c!145278)) b!1572462))

(assert (= (and d!164783 c!145279) b!1572464))

(assert (= (and d!164783 (not c!145279)) b!1572457))

(assert (= (and b!1572457 res!1074389) b!1572460))

(assert (= (and b!1572460 (not res!1074390)) b!1572458))

(assert (= (and b!1572458 (not res!1074388)) b!1572463))

(declare-fun m!1446187 () Bool)

(assert (=> b!1572463 m!1446187))

(assert (=> b!1572458 m!1446187))

(assert (=> d!164783 m!1446173))

(declare-fun m!1446189 () Bool)

(assert (=> d!164783 m!1446189))

(assert (=> d!164783 m!1446167))

(assert (=> b!1572460 m!1446187))

(assert (=> b!1572462 m!1446173))

(declare-fun m!1446191 () Bool)

(assert (=> b!1572462 m!1446191))

(assert (=> b!1572462 m!1446191))

(declare-fun m!1446193 () Bool)

(assert (=> b!1572462 m!1446193))

(assert (=> b!1572402 d!164783))

(declare-fun d!164793 () Bool)

(declare-fun lt!673999 () (_ BitVec 32))

(declare-fun lt!673998 () (_ BitVec 32))

(assert (=> d!164793 (= lt!673999 (bvmul (bvxor lt!673998 (bvlshr lt!673998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164793 (= lt!673998 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164793 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074397 (let ((h!38219 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141516 (bvmul (bvxor h!38219 (bvlshr h!38219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141516 (bvlshr x!141516 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074397 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074397 #b00000000000000000000000000000000))))))

(assert (=> d!164793 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673999 (bvlshr lt!673999 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572402 d!164793))

(declare-fun d!164797 () Bool)

(assert (=> d!164797 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134998 d!164797))

(declare-fun d!164805 () Bool)

(assert (=> d!164805 (= (array_inv!39399 _keys!600) (bvsge (size!51222 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134998 d!164805))

(check-sat (not b!1572462) (not d!164783))
(check-sat)
