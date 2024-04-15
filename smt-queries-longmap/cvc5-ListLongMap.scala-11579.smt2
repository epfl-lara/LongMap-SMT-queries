; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134860 () Bool)

(assert start!134860)

(declare-fun res!1074051 () Bool)

(declare-fun e!876415 () Bool)

(assert (=> start!134860 (=> (not res!1074051) (not e!876415))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134860 (= res!1074051 (validMask!0 mask!889))))

(assert (=> start!134860 e!876415))

(assert (=> start!134860 true))

(declare-datatypes ((array!104908 0))(
  ( (array!104909 (arr!50623 (Array (_ BitVec 32) (_ BitVec 64))) (size!51175 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104908)

(declare-fun array_inv!39559 (array!104908) Bool)

(assert (=> start!134860 (array_inv!39559 _keys!600)))

(declare-fun b!1571799 () Bool)

(declare-fun res!1074050 () Bool)

(assert (=> b!1571799 (=> (not res!1074050) (not e!876415))))

(assert (=> b!1571799 (= res!1074050 (= (size!51175 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571800 () Bool)

(declare-fun res!1074049 () Bool)

(assert (=> b!1571800 (=> (not res!1074049) (not e!876415))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571800 (= res!1074049 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13571 0))(
  ( (MissingZero!13571 (index!56682 (_ BitVec 32))) (Found!13571 (index!56683 (_ BitVec 32))) (Intermediate!13571 (undefined!14383 Bool) (index!56684 (_ BitVec 32)) (x!141440 (_ BitVec 32))) (Undefined!13571) (MissingVacant!13571 (index!56685 (_ BitVec 32))) )
))
(declare-fun lt!673572 () SeekEntryResult!13571)

(declare-fun b!1571801 () Bool)

(assert (=> b!1571801 (= e!876415 (and (is-Intermediate!13571 lt!673572) (not (undefined!14383 lt!673572)) (not (= (select (arr!50623 _keys!600) (index!56684 lt!673572)) k!754)) (not (= (select (arr!50623 _keys!600) (index!56684 lt!673572)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50623 _keys!600) (index!56684 lt!673572)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104908 (_ BitVec 32)) SeekEntryResult!13571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571801 (= lt!673572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134860 res!1074051) b!1571799))

(assert (= (and b!1571799 res!1074050) b!1571800))

(assert (= (and b!1571800 res!1074049) b!1571801))

(declare-fun m!1445079 () Bool)

(assert (=> start!134860 m!1445079))

(declare-fun m!1445081 () Bool)

(assert (=> start!134860 m!1445081))

(declare-fun m!1445083 () Bool)

(assert (=> b!1571800 m!1445083))

(declare-fun m!1445085 () Bool)

(assert (=> b!1571801 m!1445085))

(declare-fun m!1445087 () Bool)

(assert (=> b!1571801 m!1445087))

(assert (=> b!1571801 m!1445087))

(declare-fun m!1445089 () Bool)

(assert (=> b!1571801 m!1445089))

(push 1)

(assert (not start!134860))

(assert (not b!1571800))

(assert (not b!1571801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164459 () Bool)

(assert (=> d!164459 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134860 d!164459))

(declare-fun d!164465 () Bool)

(assert (=> d!164465 (= (array_inv!39559 _keys!600) (bvsge (size!51175 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134860 d!164465))

(declare-fun d!164467 () Bool)

(assert (=> d!164467 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571800 d!164467))

(declare-fun b!1571820 () Bool)

(declare-fun e!876429 () SeekEntryResult!13571)

(declare-fun e!876428 () SeekEntryResult!13571)

(assert (=> b!1571820 (= e!876429 e!876428)))

(declare-fun c!145124 () Bool)

(declare-fun lt!673578 () (_ BitVec 64))

(assert (=> b!1571820 (= c!145124 (or (= lt!673578 k!754) (= (bvadd lt!673578 lt!673578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1571821 () Bool)

(declare-fun lt!673577 () SeekEntryResult!13571)

(assert (=> b!1571821 (and (bvsge (index!56684 lt!673577) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673577) (size!51175 _keys!600)))))

(declare-fun e!876431 () Bool)

(assert (=> b!1571821 (= e!876431 (= (select (arr!50623 _keys!600) (index!56684 lt!673577)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1571822 () Bool)

(assert (=> b!1571822 (and (bvsge (index!56684 lt!673577) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673577) (size!51175 _keys!600)))))

(declare-fun res!1074058 () Bool)

(assert (=> b!1571822 (= res!1074058 (= (select (arr!50623 _keys!600) (index!56684 lt!673577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571822 (=> res!1074058 e!876431)))

(declare-fun b!1571823 () Bool)

(assert (=> b!1571823 (= e!876429 (Intermediate!13571 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571824 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571824 (= e!876428 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1571825 () Bool)

(declare-fun e!876427 () Bool)

(assert (=> b!1571825 (= e!876427 (bvsge (x!141440 lt!673577) #b01111111111111111111111111111110))))

(declare-fun d!164471 () Bool)

(assert (=> d!164471 e!876427))

(declare-fun c!145126 () Bool)

(assert (=> d!164471 (= c!145126 (and (is-Intermediate!13571 lt!673577) (undefined!14383 lt!673577)))))

(assert (=> d!164471 (= lt!673577 e!876429)))

(declare-fun c!145125 () Bool)

(assert (=> d!164471 (= c!145125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164471 (= lt!673578 (select (arr!50623 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164471 (validMask!0 mask!889)))

(assert (=> d!164471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673577)))

(declare-fun b!1571826 () Bool)

(assert (=> b!1571826 (= e!876428 (Intermediate!13571 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571827 () Bool)

(declare-fun e!876430 () Bool)

(assert (=> b!1571827 (= e!876427 e!876430)))

(declare-fun res!1074059 () Bool)

(assert (=> b!1571827 (= res!1074059 (and (is-Intermediate!13571 lt!673577) (not (undefined!14383 lt!673577)) (bvslt (x!141440 lt!673577) #b01111111111111111111111111111110) (bvsge (x!141440 lt!673577) #b00000000000000000000000000000000) (bvsge (x!141440 lt!673577) #b00000000000000000000000000000000)))))

(assert (=> b!1571827 (=> (not res!1074059) (not e!876430))))

(declare-fun b!1571828 () Bool)

(assert (=> b!1571828 (and (bvsge (index!56684 lt!673577) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673577) (size!51175 _keys!600)))))

(declare-fun res!1074060 () Bool)

(assert (=> b!1571828 (= res!1074060 (= (select (arr!50623 _keys!600) (index!56684 lt!673577)) k!754))))

(assert (=> b!1571828 (=> res!1074060 e!876431)))

(assert (=> b!1571828 (= e!876430 e!876431)))

(assert (= (and d!164471 c!145125) b!1571823))

(assert (= (and d!164471 (not c!145125)) b!1571820))

(assert (= (and b!1571820 c!145124) b!1571826))

(assert (= (and b!1571820 (not c!145124)) b!1571824))

(assert (= (and d!164471 c!145126) b!1571825))

(assert (= (and d!164471 (not c!145126)) b!1571827))

(assert (= (and b!1571827 res!1074059) b!1571828))

(assert (= (and b!1571828 (not res!1074060)) b!1571822))

(assert (= (and b!1571822 (not res!1074058)) b!1571821))

(assert (=> d!164471 m!1445087))

(declare-fun m!1445091 () Bool)

(assert (=> d!164471 m!1445091))

(assert (=> d!164471 m!1445079))

(assert (=> b!1571824 m!1445087))

(declare-fun m!1445093 () Bool)

(assert (=> b!1571824 m!1445093))

(assert (=> b!1571824 m!1445093))

(declare-fun m!1445095 () Bool)

(assert (=> b!1571824 m!1445095))

(declare-fun m!1445097 () Bool)

(assert (=> b!1571821 m!1445097))

(assert (=> b!1571822 m!1445097))

(assert (=> b!1571828 m!1445097))

(assert (=> b!1571801 d!164471))

(declare-fun d!164477 () Bool)

(declare-fun lt!673588 () (_ BitVec 32))

(declare-fun lt!673587 () (_ BitVec 32))

(assert (=> d!164477 (= lt!673588 (bvmul (bvxor lt!673587 (bvlshr lt!673587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164477 (= lt!673587 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164477 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074061 (let ((h!38255 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141442 (bvmul (bvxor h!38255 (bvlshr h!38255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141442 (bvlshr x!141442 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074061 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074061 #b00000000000000000000000000000000))))))

(assert (=> d!164477 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673588 (bvlshr lt!673588 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571801 d!164477))

(push 1)

(assert (not b!1571824))

(assert (not d!164471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

