; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135276 () Bool)

(assert start!135276)

(declare-fun res!1074969 () Bool)

(declare-fun e!877439 () Bool)

(assert (=> start!135276 (=> (not res!1074969) (not e!877439))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135276 (= res!1074969 (validMask!0 mask!889))))

(assert (=> start!135276 e!877439))

(assert (=> start!135276 true))

(declare-datatypes ((array!105114 0))(
  ( (array!105115 (arr!50713 (Array (_ BitVec 32) (_ BitVec 64))) (size!51263 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105114)

(declare-fun array_inv!39440 (array!105114) Bool)

(assert (=> start!135276 (array_inv!39440 _keys!600)))

(declare-fun b!1573471 () Bool)

(declare-fun res!1074967 () Bool)

(assert (=> b!1573471 (=> (not res!1074967) (not e!877439))))

(assert (=> b!1573471 (= res!1074967 (= (size!51263 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573472 () Bool)

(declare-fun res!1074968 () Bool)

(assert (=> b!1573472 (=> (not res!1074968) (not e!877439))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573472 (= res!1074968 (validKeyInArray!0 k!754))))

(declare-fun b!1573473 () Bool)

(declare-fun lt!674422 () Bool)

(declare-datatypes ((SeekEntryResult!13626 0))(
  ( (MissingZero!13626 (index!56902 (_ BitVec 32))) (Found!13626 (index!56903 (_ BitVec 32))) (Intermediate!13626 (undefined!14438 Bool) (index!56904 (_ BitVec 32)) (x!141709 (_ BitVec 32))) (Undefined!13626) (MissingVacant!13626 (index!56905 (_ BitVec 32))) )
))
(declare-fun lt!674421 () SeekEntryResult!13626)

(assert (=> b!1573473 (= e!877439 (and (or lt!674422 (not (undefined!14438 lt!674421))) (or lt!674422 (undefined!14438 lt!674421))))))

(assert (=> b!1573473 (= lt!674422 (not (is-Intermediate!13626 lt!674421)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105114 (_ BitVec 32)) SeekEntryResult!13626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573473 (= lt!674421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135276 res!1074969) b!1573471))

(assert (= (and b!1573471 res!1074967) b!1573472))

(assert (= (and b!1573472 res!1074968) b!1573473))

(declare-fun m!1446883 () Bool)

(assert (=> start!135276 m!1446883))

(declare-fun m!1446885 () Bool)

(assert (=> start!135276 m!1446885))

(declare-fun m!1446887 () Bool)

(assert (=> b!1573472 m!1446887))

(declare-fun m!1446889 () Bool)

(assert (=> b!1573473 m!1446889))

(assert (=> b!1573473 m!1446889))

(declare-fun m!1446891 () Bool)

(assert (=> b!1573473 m!1446891))

(push 1)

(assert (not b!1573473))

(assert (not b!1573472))

(assert (not start!135276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573518 () Bool)

(declare-fun e!877466 () SeekEntryResult!13626)

(assert (=> b!1573518 (= e!877466 (Intermediate!13626 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573519 () Bool)

(declare-fun e!877470 () Bool)

(declare-fun e!877467 () Bool)

(assert (=> b!1573519 (= e!877470 e!877467)))

(declare-fun res!1074994 () Bool)

(declare-fun lt!674443 () SeekEntryResult!13626)

(assert (=> b!1573519 (= res!1074994 (and (is-Intermediate!13626 lt!674443) (not (undefined!14438 lt!674443)) (bvslt (x!141709 lt!674443) #b01111111111111111111111111111110) (bvsge (x!141709 lt!674443) #b00000000000000000000000000000000) (bvsge (x!141709 lt!674443) #b00000000000000000000000000000000)))))

(assert (=> b!1573519 (=> (not res!1074994) (not e!877467))))

(declare-fun b!1573520 () Bool)

(declare-fun e!877468 () SeekEntryResult!13626)

(assert (=> b!1573520 (= e!877466 e!877468)))

(declare-fun c!145515 () Bool)

(declare-fun lt!674444 () (_ BitVec 64))

(assert (=> b!1573520 (= c!145515 (or (= lt!674444 k!754) (= (bvadd lt!674444 lt!674444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165007 () Bool)

(assert (=> d!165007 e!877470))

(declare-fun c!145514 () Bool)

(assert (=> d!165007 (= c!145514 (and (is-Intermediate!13626 lt!674443) (undefined!14438 lt!674443)))))

(assert (=> d!165007 (= lt!674443 e!877466)))

(declare-fun c!145516 () Bool)

(assert (=> d!165007 (= c!145516 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165007 (= lt!674444 (select (arr!50713 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165007 (validMask!0 mask!889)))

(assert (=> d!165007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674443)))

(declare-fun b!1573521 () Bool)

(assert (=> b!1573521 (= e!877470 (bvsge (x!141709 lt!674443) #b01111111111111111111111111111110))))

(declare-fun b!1573522 () Bool)

(assert (=> b!1573522 (and (bvsge (index!56904 lt!674443) #b00000000000000000000000000000000) (bvslt (index!56904 lt!674443) (size!51263 _keys!600)))))

(declare-fun e!877469 () Bool)

(assert (=> b!1573522 (= e!877469 (= (select (arr!50713 _keys!600) (index!56904 lt!674443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573523 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573523 (= e!877468 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573524 () Bool)

(assert (=> b!1573524 (= e!877468 (Intermediate!13626 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573525 () Bool)

(assert (=> b!1573525 (and (bvsge (index!56904 lt!674443) #b00000000000000000000000000000000) (bvslt (index!56904 lt!674443) (size!51263 _keys!600)))))

(declare-fun res!1074995 () Bool)

(assert (=> b!1573525 (= res!1074995 (= (select (arr!50713 _keys!600) (index!56904 lt!674443)) k!754))))

(assert (=> b!1573525 (=> res!1074995 e!877469)))

(assert (=> b!1573525 (= e!877467 e!877469)))

(declare-fun b!1573526 () Bool)

(assert (=> b!1573526 (and (bvsge (index!56904 lt!674443) #b00000000000000000000000000000000) (bvslt (index!56904 lt!674443) (size!51263 _keys!600)))))

(declare-fun res!1074996 () Bool)

(assert (=> b!1573526 (= res!1074996 (= (select (arr!50713 _keys!600) (index!56904 lt!674443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573526 (=> res!1074996 e!877469)))

(assert (= (and d!165007 c!145516) b!1573518))

(assert (= (and d!165007 (not c!145516)) b!1573520))

(assert (= (and b!1573520 c!145515) b!1573524))

(assert (= (and b!1573520 (not c!145515)) b!1573523))

(assert (= (and d!165007 c!145514) b!1573521))

(assert (= (and d!165007 (not c!145514)) b!1573519))

(assert (= (and b!1573519 res!1074994) b!1573525))

(assert (= (and b!1573525 (not res!1074995)) b!1573526))

(assert (= (and b!1573526 (not res!1074996)) b!1573522))

(assert (=> b!1573523 m!1446889))

(declare-fun m!1446913 () Bool)

(assert (=> b!1573523 m!1446913))

(assert (=> b!1573523 m!1446913))

(declare-fun m!1446915 () Bool)

(assert (=> b!1573523 m!1446915))

(declare-fun m!1446917 () Bool)

(assert (=> b!1573522 m!1446917))

(assert (=> b!1573525 m!1446917))

(assert (=> b!1573526 m!1446917))

(assert (=> d!165007 m!1446889))

(declare-fun m!1446919 () Bool)

(assert (=> d!165007 m!1446919))

(assert (=> d!165007 m!1446883))

(assert (=> b!1573473 d!165007))

(declare-fun d!165011 () Bool)

(declare-fun lt!674458 () (_ BitVec 32))

(declare-fun lt!674457 () (_ BitVec 32))

(assert (=> d!165011 (= lt!674458 (bvmul (bvxor lt!674457 (bvlshr lt!674457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165011 (= lt!674457 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165011 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075001 (let ((h!38237 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141714 (bvmul (bvxor h!38237 (bvlshr h!38237 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141714 (bvlshr x!141714 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075001 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075001 #b00000000000000000000000000000000))))))

(assert (=> d!165011 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674458 (bvlshr lt!674458 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573473 d!165011))

(declare-fun d!165017 () Bool)

(assert (=> d!165017 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573472 d!165017))

(declare-fun d!165019 () Bool)

(assert (=> d!165019 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135276 d!165019))

(declare-fun d!165029 () Bool)

(assert (=> d!165029 (= (array_inv!39440 _keys!600) (bvsge (size!51263 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135276 d!165029))

(push 1)

(assert (not d!165007))

(assert (not b!1573523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

