; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135802 () Bool)

(assert start!135802)

(declare-fun b!1576275 () Bool)

(declare-fun res!1076043 () Bool)

(declare-fun e!879174 () Bool)

(assert (=> b!1576275 (=> (not res!1076043) (not e!879174))))

(declare-datatypes ((array!105267 0))(
  ( (array!105268 (arr!50778 (Array (_ BitVec 32) (_ BitVec 64))) (size!51329 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105267)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1576275 (= res!1076043 (= (size!51329 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1576278 () Bool)

(declare-fun k!754 () (_ BitVec 64))

(declare-fun e!879175 () Bool)

(declare-datatypes ((SeekEntryResult!13585 0))(
  ( (MissingZero!13585 (index!56738 (_ BitVec 32))) (Found!13585 (index!56739 (_ BitVec 32))) (Intermediate!13585 (undefined!14397 Bool) (index!56740 (_ BitVec 32)) (x!141761 (_ BitVec 32))) (Undefined!13585) (MissingVacant!13585 (index!56741 (_ BitVec 32))) )
))
(declare-fun lt!675531 () SeekEntryResult!13585)

(assert (=> b!1576278 (= e!879175 (or (is-MissingVacant!13585 lt!675531) (and (is-Found!13585 lt!675531) (not (= (select (arr!50778 _keys!600) (index!56739 lt!675531)) k!754)))))))

(declare-fun err!170 () SeekEntryResult!13585)

(assert (=> b!1576278 (= lt!675531 err!170)))

(assert (=> b!1576278 true))

(declare-fun b!1576276 () Bool)

(declare-fun res!1076044 () Bool)

(assert (=> b!1576276 (=> (not res!1076044) (not e!879174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576276 (= res!1076044 (validKeyInArray!0 k!754))))

(declare-fun b!1576277 () Bool)

(assert (=> b!1576277 (= e!879174 e!879175)))

(declare-fun res!1076045 () Bool)

(assert (=> b!1576277 (=> (not res!1076045) (not e!879175))))

(declare-fun lt!675530 () Bool)

(declare-fun lt!675529 () SeekEntryResult!13585)

(assert (=> b!1576277 (= res!1076045 (and (or lt!675530 (not (undefined!14397 lt!675529))) (or lt!675530 (undefined!14397 lt!675529))))))

(assert (=> b!1576277 (= lt!675530 (not (is-Intermediate!13585 lt!675529)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105267 (_ BitVec 32)) SeekEntryResult!13585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576277 (= lt!675529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun res!1076042 () Bool)

(assert (=> start!135802 (=> (not res!1076042) (not e!879174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135802 (= res!1076042 (validMask!0 mask!889))))

(assert (=> start!135802 e!879174))

(assert (=> start!135802 true))

(declare-fun array_inv!39733 (array!105267) Bool)

(assert (=> start!135802 (array_inv!39733 _keys!600)))

(assert (= (and start!135802 res!1076042) b!1576275))

(assert (= (and b!1576275 res!1076043) b!1576276))

(assert (= (and b!1576276 res!1076044) b!1576277))

(assert (= (and b!1576277 res!1076045) b!1576278))

(declare-fun m!1449327 () Bool)

(assert (=> b!1576278 m!1449327))

(declare-fun m!1449329 () Bool)

(assert (=> b!1576276 m!1449329))

(declare-fun m!1449331 () Bool)

(assert (=> b!1576277 m!1449331))

(assert (=> b!1576277 m!1449331))

(declare-fun m!1449333 () Bool)

(assert (=> b!1576277 m!1449333))

(declare-fun m!1449335 () Bool)

(assert (=> start!135802 m!1449335))

(declare-fun m!1449337 () Bool)

(assert (=> start!135802 m!1449337))

(push 1)

(assert (not start!135802))

(assert (not b!1576276))

(assert (not b!1576277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165807 () Bool)

(assert (=> d!165807 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135802 d!165807))

(declare-fun d!165815 () Bool)

(assert (=> d!165815 (= (array_inv!39733 _keys!600) (bvsge (size!51329 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135802 d!165815))

(declare-fun d!165819 () Bool)

(assert (=> d!165819 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576276 d!165819))

(declare-fun b!1576334 () Bool)

(declare-fun lt!675547 () SeekEntryResult!13585)

(assert (=> b!1576334 (and (bvsge (index!56740 lt!675547) #b00000000000000000000000000000000) (bvslt (index!56740 lt!675547) (size!51329 _keys!600)))))

(declare-fun res!1076062 () Bool)

(assert (=> b!1576334 (= res!1076062 (= (select (arr!50778 _keys!600) (index!56740 lt!675547)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879207 () Bool)

(assert (=> b!1576334 (=> res!1076062 e!879207)))

(declare-fun b!1576335 () Bool)

(assert (=> b!1576335 (and (bvsge (index!56740 lt!675547) #b00000000000000000000000000000000) (bvslt (index!56740 lt!675547) (size!51329 _keys!600)))))

(assert (=> b!1576335 (= e!879207 (= (select (arr!50778 _keys!600) (index!56740 lt!675547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576336 () Bool)

(declare-fun e!879209 () SeekEntryResult!13585)

(declare-fun e!879206 () SeekEntryResult!13585)

(assert (=> b!1576336 (= e!879209 e!879206)))

(declare-fun c!146406 () Bool)

(declare-fun lt!675546 () (_ BitVec 64))

(assert (=> b!1576336 (= c!146406 (or (= lt!675546 k!754) (= (bvadd lt!675546 lt!675546) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576337 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576337 (= e!879206 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1576338 () Bool)

(declare-fun e!879210 () Bool)

(assert (=> b!1576338 (= e!879210 (bvsge (x!141761 lt!675547) #b01111111111111111111111111111110))))

(declare-fun d!165821 () Bool)

(assert (=> d!165821 e!879210))

(declare-fun c!146404 () Bool)

(assert (=> d!165821 (= c!146404 (and (is-Intermediate!13585 lt!675547) (undefined!14397 lt!675547)))))

(assert (=> d!165821 (= lt!675547 e!879209)))

(declare-fun c!146405 () Bool)

(assert (=> d!165821 (= c!146405 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165821 (= lt!675546 (select (arr!50778 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165821 (validMask!0 mask!889)))

(assert (=> d!165821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!675547)))

(declare-fun b!1576339 () Bool)

(assert (=> b!1576339 (= e!879206 (Intermediate!13585 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1576340 () Bool)

(declare-fun e!879208 () Bool)

(assert (=> b!1576340 (= e!879210 e!879208)))

(declare-fun res!1076061 () Bool)

(assert (=> b!1576340 (= res!1076061 (and (is-Intermediate!13585 lt!675547) (not (undefined!14397 lt!675547)) (bvslt (x!141761 lt!675547) #b01111111111111111111111111111110) (bvsge (x!141761 lt!675547) #b00000000000000000000000000000000) (bvsge (x!141761 lt!675547) #b00000000000000000000000000000000)))))

(assert (=> b!1576340 (=> (not res!1076061) (not e!879208))))

(declare-fun b!1576341 () Bool)

(assert (=> b!1576341 (= e!879209 (Intermediate!13585 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1576342 () Bool)

(assert (=> b!1576342 (and (bvsge (index!56740 lt!675547) #b00000000000000000000000000000000) (bvslt (index!56740 lt!675547) (size!51329 _keys!600)))))

(declare-fun res!1076063 () Bool)

(assert (=> b!1576342 (= res!1076063 (= (select (arr!50778 _keys!600) (index!56740 lt!675547)) k!754))))

(assert (=> b!1576342 (=> res!1076063 e!879207)))

(assert (=> b!1576342 (= e!879208 e!879207)))

(assert (= (and d!165821 c!146405) b!1576341))

(assert (= (and d!165821 (not c!146405)) b!1576336))

(assert (= (and b!1576336 c!146406) b!1576339))

(assert (= (and b!1576336 (not c!146406)) b!1576337))

(assert (= (and d!165821 c!146404) b!1576338))

(assert (= (and d!165821 (not c!146404)) b!1576340))

(assert (= (and b!1576340 res!1076061) b!1576342))

(assert (= (and b!1576342 (not res!1076063)) b!1576334))

(assert (= (and b!1576334 (not res!1076062)) b!1576335))

(declare-fun m!1449347 () Bool)

(assert (=> b!1576334 m!1449347))

(assert (=> b!1576335 m!1449347))

(assert (=> b!1576342 m!1449347))

(assert (=> b!1576337 m!1449331))

(declare-fun m!1449349 () Bool)

(assert (=> b!1576337 m!1449349))

(assert (=> b!1576337 m!1449349))

(declare-fun m!1449351 () Bool)

(assert (=> b!1576337 m!1449351))

(assert (=> d!165821 m!1449331))

(declare-fun m!1449353 () Bool)

(assert (=> d!165821 m!1449353))

(assert (=> d!165821 m!1449335))

(assert (=> b!1576277 d!165821))

(declare-fun d!165831 () Bool)

(declare-fun lt!675561 () (_ BitVec 32))

(declare-fun lt!675560 () (_ BitVec 32))

(assert (=> d!165831 (= lt!675561 (bvmul (bvxor lt!675560 (bvlshr lt!675560 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165831 (= lt!675560 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165831 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1076071 (let ((h!38297 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141766 (bvmul (bvxor h!38297 (bvlshr h!38297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141766 (bvlshr x!141766 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1076071 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1076071 #b00000000000000000000000000000000))))))

(assert (=> d!165831 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!675561 (bvlshr lt!675561 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1576277 d!165831))

(push 1)

(assert (not b!1576337))

(assert (not d!165821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

