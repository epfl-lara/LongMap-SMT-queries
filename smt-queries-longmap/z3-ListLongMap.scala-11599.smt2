; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135726 () Bool)

(assert start!135726)

(declare-fun b!1576019 () Bool)

(declare-fun e!879012 () Bool)

(declare-fun e!879014 () Bool)

(assert (=> b!1576019 (= e!879012 e!879014)))

(declare-fun res!1075889 () Bool)

(assert (=> b!1576019 (=> (not res!1075889) (not e!879014))))

(declare-fun lt!675386 () Bool)

(declare-datatypes ((SeekEntryResult!13577 0))(
  ( (MissingZero!13577 (index!56706 (_ BitVec 32))) (Found!13577 (index!56707 (_ BitVec 32))) (Intermediate!13577 (undefined!14389 Bool) (index!56708 (_ BitVec 32)) (x!141725 (_ BitVec 32))) (Undefined!13577) (MissingVacant!13577 (index!56709 (_ BitVec 32))) )
))
(declare-fun lt!675385 () SeekEntryResult!13577)

(assert (=> b!1576019 (= res!1075889 (and (or lt!675386 (not (undefined!14389 lt!675385))) (or lt!675386 (undefined!14389 lt!675385))))))

(get-info :version)

(assert (=> b!1576019 (= lt!675386 (not ((_ is Intermediate!13577) lt!675385)))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105245 0))(
  ( (array!105246 (arr!50770 (Array (_ BitVec 32) (_ BitVec 64))) (size!51321 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105245 (_ BitVec 32)) SeekEntryResult!13577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576019 (= lt!675385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1576017 () Bool)

(declare-fun res!1075886 () Bool)

(assert (=> b!1576017 (=> (not res!1075886) (not e!879012))))

(assert (=> b!1576017 (= res!1075886 (= (size!51321 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1075888 () Bool)

(assert (=> start!135726 (=> (not res!1075888) (not e!879012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135726 (= res!1075888 (validMask!0 mask!889))))

(assert (=> start!135726 e!879012))

(assert (=> start!135726 true))

(declare-fun array_inv!39725 (array!105245) Bool)

(assert (=> start!135726 (array_inv!39725 _keys!600)))

(declare-fun b!1576018 () Bool)

(declare-fun res!1075887 () Bool)

(assert (=> b!1576018 (=> (not res!1075887) (not e!879012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576018 (= res!1075887 (validKeyInArray!0 k0!754))))

(declare-fun b!1576020 () Bool)

(declare-fun lt!675387 () SeekEntryResult!13577)

(assert (=> b!1576020 (= e!879014 (and (not ((_ is MissingVacant!13577) lt!675387)) ((_ is Found!13577) lt!675387) (or (bvslt (index!56707 lt!675387) #b00000000000000000000000000000000) (bvsge (index!56707 lt!675387) (size!51321 _keys!600)))))))

(declare-fun err!138 () SeekEntryResult!13577)

(assert (=> b!1576020 (= lt!675387 err!138)))

(assert (=> b!1576020 true))

(assert (= (and start!135726 res!1075888) b!1576017))

(assert (= (and b!1576017 res!1075886) b!1576018))

(assert (= (and b!1576018 res!1075887) b!1576019))

(assert (= (and b!1576019 res!1075889) b!1576020))

(declare-fun m!1449195 () Bool)

(assert (=> b!1576019 m!1449195))

(assert (=> b!1576019 m!1449195))

(declare-fun m!1449197 () Bool)

(assert (=> b!1576019 m!1449197))

(declare-fun m!1449199 () Bool)

(assert (=> start!135726 m!1449199))

(declare-fun m!1449201 () Bool)

(assert (=> start!135726 m!1449201))

(declare-fun m!1449203 () Bool)

(assert (=> b!1576018 m!1449203))

(check-sat (not b!1576019) (not start!135726) (not b!1576018))
(check-sat)
(get-model)

(declare-fun b!1576063 () Bool)

(declare-fun e!879047 () SeekEntryResult!13577)

(declare-fun e!879043 () SeekEntryResult!13577)

(assert (=> b!1576063 (= e!879047 e!879043)))

(declare-fun c!146338 () Bool)

(declare-fun lt!675411 () (_ BitVec 64))

(assert (=> b!1576063 (= c!146338 (or (= lt!675411 k0!754) (= (bvadd lt!675411 lt!675411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576064 () Bool)

(declare-fun lt!675410 () SeekEntryResult!13577)

(assert (=> b!1576064 (and (bvsge (index!56708 lt!675410) #b00000000000000000000000000000000) (bvslt (index!56708 lt!675410) (size!51321 _keys!600)))))

(declare-fun e!879044 () Bool)

(assert (=> b!1576064 (= e!879044 (= (select (arr!50770 _keys!600) (index!56708 lt!675410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576065 () Bool)

(assert (=> b!1576065 (= e!879043 (Intermediate!13577 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165741 () Bool)

(declare-fun e!879045 () Bool)

(assert (=> d!165741 e!879045))

(declare-fun c!146339 () Bool)

(assert (=> d!165741 (= c!146339 (and ((_ is Intermediate!13577) lt!675410) (undefined!14389 lt!675410)))))

(assert (=> d!165741 (= lt!675410 e!879047)))

(declare-fun c!146337 () Bool)

(assert (=> d!165741 (= c!146337 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165741 (= lt!675411 (select (arr!50770 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165741 (validMask!0 mask!889)))

(assert (=> d!165741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!675410)))

(declare-fun b!1576066 () Bool)

(assert (=> b!1576066 (= e!879045 (bvsge (x!141725 lt!675410) #b01111111111111111111111111111110))))

(declare-fun b!1576067 () Bool)

(declare-fun e!879046 () Bool)

(assert (=> b!1576067 (= e!879045 e!879046)))

(declare-fun res!1075921 () Bool)

(assert (=> b!1576067 (= res!1075921 (and ((_ is Intermediate!13577) lt!675410) (not (undefined!14389 lt!675410)) (bvslt (x!141725 lt!675410) #b01111111111111111111111111111110) (bvsge (x!141725 lt!675410) #b00000000000000000000000000000000) (bvsge (x!141725 lt!675410) #b00000000000000000000000000000000)))))

(assert (=> b!1576067 (=> (not res!1075921) (not e!879046))))

(declare-fun b!1576068 () Bool)

(assert (=> b!1576068 (= e!879047 (Intermediate!13577 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1576069 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576069 (= e!879043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1576070 () Bool)

(assert (=> b!1576070 (and (bvsge (index!56708 lt!675410) #b00000000000000000000000000000000) (bvslt (index!56708 lt!675410) (size!51321 _keys!600)))))

(declare-fun res!1075920 () Bool)

(assert (=> b!1576070 (= res!1075920 (= (select (arr!50770 _keys!600) (index!56708 lt!675410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576070 (=> res!1075920 e!879044)))

(declare-fun b!1576071 () Bool)

(assert (=> b!1576071 (and (bvsge (index!56708 lt!675410) #b00000000000000000000000000000000) (bvslt (index!56708 lt!675410) (size!51321 _keys!600)))))

(declare-fun res!1075922 () Bool)

(assert (=> b!1576071 (= res!1075922 (= (select (arr!50770 _keys!600) (index!56708 lt!675410)) k0!754))))

(assert (=> b!1576071 (=> res!1075922 e!879044)))

(assert (=> b!1576071 (= e!879046 e!879044)))

(assert (= (and d!165741 c!146337) b!1576068))

(assert (= (and d!165741 (not c!146337)) b!1576063))

(assert (= (and b!1576063 c!146338) b!1576065))

(assert (= (and b!1576063 (not c!146338)) b!1576069))

(assert (= (and d!165741 c!146339) b!1576066))

(assert (= (and d!165741 (not c!146339)) b!1576067))

(assert (= (and b!1576067 res!1075921) b!1576071))

(assert (= (and b!1576071 (not res!1075922)) b!1576070))

(assert (= (and b!1576070 (not res!1075920)) b!1576064))

(assert (=> b!1576069 m!1449195))

(declare-fun m!1449225 () Bool)

(assert (=> b!1576069 m!1449225))

(assert (=> b!1576069 m!1449225))

(declare-fun m!1449227 () Bool)

(assert (=> b!1576069 m!1449227))

(declare-fun m!1449229 () Bool)

(assert (=> b!1576064 m!1449229))

(assert (=> b!1576070 m!1449229))

(assert (=> d!165741 m!1449195))

(declare-fun m!1449231 () Bool)

(assert (=> d!165741 m!1449231))

(assert (=> d!165741 m!1449199))

(assert (=> b!1576071 m!1449229))

(assert (=> b!1576019 d!165741))

(declare-fun d!165753 () Bool)

(declare-fun lt!675417 () (_ BitVec 32))

(declare-fun lt!675416 () (_ BitVec 32))

(assert (=> d!165753 (= lt!675417 (bvmul (bvxor lt!675416 (bvlshr lt!675416 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165753 (= lt!675416 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165753 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075923 (let ((h!38290 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141729 (bvmul (bvxor h!38290 (bvlshr h!38290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141729 (bvlshr x!141729 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075923 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075923 #b00000000000000000000000000000000))))))

(assert (=> d!165753 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!675417 (bvlshr lt!675417 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1576019 d!165753))

(declare-fun d!165755 () Bool)

(assert (=> d!165755 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135726 d!165755))

(declare-fun d!165757 () Bool)

(assert (=> d!165757 (= (array_inv!39725 _keys!600) (bvsge (size!51321 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135726 d!165757))

(declare-fun d!165759 () Bool)

(assert (=> d!165759 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576018 d!165759))

(check-sat (not d!165741) (not b!1576069))
(check-sat)
