; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135512 () Bool)

(assert start!135512)

(declare-fun res!1075474 () Bool)

(declare-fun e!878512 () Bool)

(assert (=> start!135512 (=> (not res!1075474) (not e!878512))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135512 (= res!1075474 (validMask!0 mask!889))))

(assert (=> start!135512 e!878512))

(assert (=> start!135512 true))

(declare-datatypes ((array!105184 0))(
  ( (array!105185 (arr!50747 (Array (_ BitVec 32) (_ BitVec 64))) (size!51298 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105184)

(declare-fun array_inv!39702 (array!105184) Bool)

(assert (=> start!135512 (array_inv!39702 _keys!600)))

(declare-fun b!1575187 () Bool)

(declare-fun res!1075475 () Bool)

(assert (=> b!1575187 (=> (not res!1075475) (not e!878512))))

(assert (=> b!1575187 (= res!1075475 (= (size!51298 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575188 () Bool)

(declare-fun res!1075473 () Bool)

(assert (=> b!1575188 (=> (not res!1075473) (not e!878512))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575188 (= res!1075473 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13554 0))(
  ( (MissingZero!13554 (index!56614 (_ BitVec 32))) (Found!13554 (index!56615 (_ BitVec 32))) (Intermediate!13554 (undefined!14366 Bool) (index!56616 (_ BitVec 32)) (x!141599 (_ BitVec 32))) (Undefined!13554) (MissingVacant!13554 (index!56617 (_ BitVec 32))) )
))
(declare-fun lt!675015 () SeekEntryResult!13554)

(declare-fun b!1575189 () Bool)

(assert (=> b!1575189 (= e!878512 (and (is-Intermediate!13554 lt!675015) (not (undefined!14366 lt!675015)) (not (= (select (arr!50747 _keys!600) (index!56616 lt!675015)) k!754)) (not (= (select (arr!50747 _keys!600) (index!56616 lt!675015)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!56616 lt!675015) #b00000000000000000000000000000000) (bvsge (index!56616 lt!675015) (size!51298 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105184 (_ BitVec 32)) SeekEntryResult!13554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575189 (= lt!675015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135512 res!1075474) b!1575187))

(assert (= (and b!1575187 res!1075475) b!1575188))

(assert (= (and b!1575188 res!1075473) b!1575189))

(declare-fun m!1448691 () Bool)

(assert (=> start!135512 m!1448691))

(declare-fun m!1448693 () Bool)

(assert (=> start!135512 m!1448693))

(declare-fun m!1448695 () Bool)

(assert (=> b!1575188 m!1448695))

(declare-fun m!1448697 () Bool)

(assert (=> b!1575189 m!1448697))

(declare-fun m!1448699 () Bool)

(assert (=> b!1575189 m!1448699))

(assert (=> b!1575189 m!1448699))

(declare-fun m!1448701 () Bool)

(assert (=> b!1575189 m!1448701))

(push 1)

(assert (not b!1575188))

(assert (not start!135512))

(assert (not b!1575189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165565 () Bool)

(assert (=> d!165565 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575188 d!165565))

(declare-fun d!165567 () Bool)

(assert (=> d!165567 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135512 d!165567))

(declare-fun d!165577 () Bool)

(assert (=> d!165577 (= (array_inv!39702 _keys!600) (bvsge (size!51298 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135512 d!165577))

(declare-fun b!1575271 () Bool)

(declare-fun e!878561 () SeekEntryResult!13554)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575271 (= e!878561 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1575272 () Bool)

(declare-fun e!878563 () SeekEntryResult!13554)

(assert (=> b!1575272 (= e!878563 e!878561)))

(declare-fun c!146139 () Bool)

(declare-fun lt!675042 () (_ BitVec 64))

(assert (=> b!1575272 (= c!146139 (or (= lt!675042 k!754) (= (bvadd lt!675042 lt!675042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575273 () Bool)

(assert (=> b!1575273 (= e!878563 (Intermediate!13554 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165579 () Bool)

(declare-fun e!878560 () Bool)

(assert (=> d!165579 e!878560))

(declare-fun c!146140 () Bool)

(declare-fun lt!675041 () SeekEntryResult!13554)

(assert (=> d!165579 (= c!146140 (and (is-Intermediate!13554 lt!675041) (undefined!14366 lt!675041)))))

(assert (=> d!165579 (= lt!675041 e!878563)))

(declare-fun c!146141 () Bool)

(assert (=> d!165579 (= c!146141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165579 (= lt!675042 (select (arr!50747 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165579 (validMask!0 mask!889)))

(assert (=> d!165579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!675041)))

(declare-fun b!1575274 () Bool)

(assert (=> b!1575274 (= e!878560 (bvsge (x!141599 lt!675041) #b01111111111111111111111111111110))))

(declare-fun b!1575275 () Bool)

(assert (=> b!1575275 (and (bvsge (index!56616 lt!675041) #b00000000000000000000000000000000) (bvslt (index!56616 lt!675041) (size!51298 _keys!600)))))

(declare-fun e!878562 () Bool)

(assert (=> b!1575275 (= e!878562 (= (select (arr!50747 _keys!600) (index!56616 lt!675041)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575276 () Bool)

(assert (=> b!1575276 (and (bvsge (index!56616 lt!675041) #b00000000000000000000000000000000) (bvslt (index!56616 lt!675041) (size!51298 _keys!600)))))

(declare-fun res!1075513 () Bool)

(assert (=> b!1575276 (= res!1075513 (= (select (arr!50747 _keys!600) (index!56616 lt!675041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575276 (=> res!1075513 e!878562)))

(declare-fun b!1575277 () Bool)

(assert (=> b!1575277 (and (bvsge (index!56616 lt!675041) #b00000000000000000000000000000000) (bvslt (index!56616 lt!675041) (size!51298 _keys!600)))))

(declare-fun res!1075512 () Bool)

(assert (=> b!1575277 (= res!1075512 (= (select (arr!50747 _keys!600) (index!56616 lt!675041)) k!754))))

(assert (=> b!1575277 (=> res!1075512 e!878562)))

(declare-fun e!878564 () Bool)

(assert (=> b!1575277 (= e!878564 e!878562)))

(declare-fun b!1575278 () Bool)

(assert (=> b!1575278 (= e!878561 (Intermediate!13554 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1575279 () Bool)

(assert (=> b!1575279 (= e!878560 e!878564)))

(declare-fun res!1075511 () Bool)

(assert (=> b!1575279 (= res!1075511 (and (is-Intermediate!13554 lt!675041) (not (undefined!14366 lt!675041)) (bvslt (x!141599 lt!675041) #b01111111111111111111111111111110) (bvsge (x!141599 lt!675041) #b00000000000000000000000000000000) (bvsge (x!141599 lt!675041) #b00000000000000000000000000000000)))))

(assert (=> b!1575279 (=> (not res!1075511) (not e!878564))))

(assert (= (and d!165579 c!146141) b!1575273))

(assert (= (and d!165579 (not c!146141)) b!1575272))

(assert (= (and b!1575272 c!146139) b!1575278))

(assert (= (and b!1575272 (not c!146139)) b!1575271))

(assert (= (and d!165579 c!146140) b!1575274))

(assert (= (and d!165579 (not c!146140)) b!1575279))

(assert (= (and b!1575279 res!1075511) b!1575277))

(assert (= (and b!1575277 (not res!1075512)) b!1575276))

(assert (= (and b!1575276 (not res!1075513)) b!1575275))

(declare-fun m!1448731 () Bool)

(assert (=> b!1575275 m!1448731))

(assert (=> b!1575271 m!1448699))

(declare-fun m!1448733 () Bool)

(assert (=> b!1575271 m!1448733))

(assert (=> b!1575271 m!1448733))

(declare-fun m!1448735 () Bool)

(assert (=> b!1575271 m!1448735))

(assert (=> d!165579 m!1448699))

(declare-fun m!1448737 () Bool)

(assert (=> d!165579 m!1448737))

(assert (=> d!165579 m!1448691))

(assert (=> b!1575276 m!1448731))

(assert (=> b!1575277 m!1448731))

(assert (=> b!1575189 d!165579))

(declare-fun d!165585 () Bool)

(declare-fun lt!675054 () (_ BitVec 32))

(declare-fun lt!675053 () (_ BitVec 32))

(assert (=> d!165585 (= lt!675054 (bvmul (bvxor lt!675053 (bvlshr lt!675053 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165585 (= lt!675053 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165585 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075514 (let ((h!38277 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141606 (bvmul (bvxor h!38277 (bvlshr h!38277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141606 (bvlshr x!141606 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075514 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075514 #b00000000000000000000000000000000))))))

(assert (=> d!165585 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!675054 (bvlshr lt!675054 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1575189 d!165585))

(push 1)

(assert (not d!165579))

(assert (not b!1575271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

