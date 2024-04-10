; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135152 () Bool)

(assert start!135152)

(declare-fun res!1074773 () Bool)

(declare-fun e!877145 () Bool)

(assert (=> start!135152 (=> (not res!1074773) (not e!877145))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135152 (= res!1074773 (validMask!0 mask!889))))

(assert (=> start!135152 e!877145))

(assert (=> start!135152 true))

(declare-datatypes ((array!105087 0))(
  ( (array!105088 (arr!50704 (Array (_ BitVec 32) (_ BitVec 64))) (size!51254 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105087)

(declare-fun array_inv!39431 (array!105087) Bool)

(assert (=> start!135152 (array_inv!39431 _keys!600)))

(declare-fun b!1572961 () Bool)

(declare-fun res!1074772 () Bool)

(assert (=> b!1572961 (=> (not res!1074772) (not e!877145))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572961 (= res!1074772 (validKeyInArray!0 k!754))))

(declare-fun b!1572960 () Bool)

(declare-fun res!1074774 () Bool)

(assert (=> b!1572960 (=> (not res!1074774) (not e!877145))))

(assert (=> b!1572960 (= res!1074774 (= (size!51254 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572963 () Bool)

(declare-fun e!877143 () Bool)

(declare-datatypes ((SeekEntryResult!13617 0))(
  ( (MissingZero!13617 (index!56866 (_ BitVec 32))) (Found!13617 (index!56867 (_ BitVec 32))) (Intermediate!13617 (undefined!14429 Bool) (index!56868 (_ BitVec 32)) (x!141649 (_ BitVec 32))) (Undefined!13617) (MissingVacant!13617 (index!56869 (_ BitVec 32))) )
))
(declare-fun lt!674205 () SeekEntryResult!13617)

(assert (=> b!1572963 (= e!877143 (and (not (is-MissingVacant!13617 lt!674205)) (is-Found!13617 lt!674205) (or (bvslt (index!56867 lt!674205) #b00000000000000000000000000000000) (bvsge (index!56867 lt!674205) (size!51254 _keys!600)))))))

(declare-fun lt!674206 () SeekEntryResult!13617)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105087 (_ BitVec 32)) SeekEntryResult!13617)

(assert (=> b!1572963 (= lt!674205 (seekKeyOrZeroReturnVacant!0 (x!141649 lt!674206) (index!56868 lt!674206) (index!56868 lt!674206) k!754 _keys!600 mask!889))))

(declare-fun b!1572962 () Bool)

(assert (=> b!1572962 (= e!877145 e!877143)))

(declare-fun res!1074771 () Bool)

(assert (=> b!1572962 (=> (not res!1074771) (not e!877143))))

(assert (=> b!1572962 (= res!1074771 (and (not (undefined!14429 lt!674206)) (is-Intermediate!13617 lt!674206) (not (= (select (arr!50704 _keys!600) (index!56868 lt!674206)) k!754)) (not (= (select (arr!50704 _keys!600) (index!56868 lt!674206)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50704 _keys!600) (index!56868 lt!674206)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56868 lt!674206) #b00000000000000000000000000000000) (bvslt (index!56868 lt!674206) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105087 (_ BitVec 32)) SeekEntryResult!13617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572962 (= lt!674206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135152 res!1074773) b!1572960))

(assert (= (and b!1572960 res!1074774) b!1572961))

(assert (= (and b!1572961 res!1074772) b!1572962))

(assert (= (and b!1572962 res!1074771) b!1572963))

(declare-fun m!1446607 () Bool)

(assert (=> start!135152 m!1446607))

(declare-fun m!1446609 () Bool)

(assert (=> start!135152 m!1446609))

(declare-fun m!1446611 () Bool)

(assert (=> b!1572961 m!1446611))

(declare-fun m!1446613 () Bool)

(assert (=> b!1572963 m!1446613))

(declare-fun m!1446615 () Bool)

(assert (=> b!1572962 m!1446615))

(declare-fun m!1446617 () Bool)

(assert (=> b!1572962 m!1446617))

(assert (=> b!1572962 m!1446617))

(declare-fun m!1446619 () Bool)

(assert (=> b!1572962 m!1446619))

(push 1)

(assert (not b!1572961))

(assert (not start!135152))

(assert (not b!1572962))

(assert (not b!1572963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164895 () Bool)

(assert (=> d!164895 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572961 d!164895))

(declare-fun d!164897 () Bool)

(assert (=> d!164897 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135152 d!164897))

(declare-fun d!164907 () Bool)

(assert (=> d!164907 (= (array_inv!39431 _keys!600) (bvsge (size!51254 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135152 d!164907))

(declare-fun b!1573052 () Bool)

(declare-fun e!877199 () SeekEntryResult!13617)

(assert (=> b!1573052 (= e!877199 (Intermediate!13617 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573053 () Bool)

(declare-fun e!877198 () SeekEntryResult!13617)

(assert (=> b!1573053 (= e!877198 e!877199)))

(declare-fun c!145368 () Bool)

(declare-fun lt!674241 () (_ BitVec 64))

(assert (=> b!1573053 (= c!145368 (or (= lt!674241 k!754) (= (bvadd lt!674241 lt!674241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573054 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573054 (= e!877199 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573055 () Bool)

(declare-fun lt!674242 () SeekEntryResult!13617)

(assert (=> b!1573055 (and (bvsge (index!56868 lt!674242) #b00000000000000000000000000000000) (bvslt (index!56868 lt!674242) (size!51254 _keys!600)))))

(declare-fun res!1074816 () Bool)

(assert (=> b!1573055 (= res!1074816 (= (select (arr!50704 _keys!600) (index!56868 lt!674242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877202 () Bool)

(assert (=> b!1573055 (=> res!1074816 e!877202)))

(declare-fun b!1573056 () Bool)

(declare-fun e!877200 () Bool)

(declare-fun e!877201 () Bool)

(assert (=> b!1573056 (= e!877200 e!877201)))

(declare-fun res!1074815 () Bool)

(assert (=> b!1573056 (= res!1074815 (and (is-Intermediate!13617 lt!674242) (not (undefined!14429 lt!674242)) (bvslt (x!141649 lt!674242) #b01111111111111111111111111111110) (bvsge (x!141649 lt!674242) #b00000000000000000000000000000000) (bvsge (x!141649 lt!674242) #b00000000000000000000000000000000)))))

(assert (=> b!1573056 (=> (not res!1074815) (not e!877201))))

(declare-fun b!1573057 () Bool)

(assert (=> b!1573057 (and (bvsge (index!56868 lt!674242) #b00000000000000000000000000000000) (bvslt (index!56868 lt!674242) (size!51254 _keys!600)))))

(assert (=> b!1573057 (= e!877202 (= (select (arr!50704 _keys!600) (index!56868 lt!674242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573058 () Bool)

(assert (=> b!1573058 (and (bvsge (index!56868 lt!674242) #b00000000000000000000000000000000) (bvslt (index!56868 lt!674242) (size!51254 _keys!600)))))

(declare-fun res!1074817 () Bool)

(assert (=> b!1573058 (= res!1074817 (= (select (arr!50704 _keys!600) (index!56868 lt!674242)) k!754))))

(assert (=> b!1573058 (=> res!1074817 e!877202)))

(assert (=> b!1573058 (= e!877201 e!877202)))

(declare-fun b!1573059 () Bool)

(assert (=> b!1573059 (= e!877200 (bvsge (x!141649 lt!674242) #b01111111111111111111111111111110))))

(declare-fun d!164909 () Bool)

(assert (=> d!164909 e!877200))

(declare-fun c!145367 () Bool)

(assert (=> d!164909 (= c!145367 (and (is-Intermediate!13617 lt!674242) (undefined!14429 lt!674242)))))

(assert (=> d!164909 (= lt!674242 e!877198)))

(declare-fun c!145366 () Bool)

(assert (=> d!164909 (= c!145366 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164909 (= lt!674241 (select (arr!50704 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164909 (validMask!0 mask!889)))

(assert (=> d!164909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674242)))

(declare-fun b!1573051 () Bool)

(assert (=> b!1573051 (= e!877198 (Intermediate!13617 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164909 c!145366) b!1573051))

(assert (= (and d!164909 (not c!145366)) b!1573053))

(assert (= (and b!1573053 c!145368) b!1573052))

(assert (= (and b!1573053 (not c!145368)) b!1573054))

(assert (= (and d!164909 c!145367) b!1573059))

(assert (= (and d!164909 (not c!145367)) b!1573056))

(assert (= (and b!1573056 res!1074815) b!1573058))

(assert (= (and b!1573058 (not res!1074817)) b!1573055))

(assert (= (and b!1573055 (not res!1074816)) b!1573057))

(declare-fun m!1446665 () Bool)

(assert (=> b!1573055 m!1446665))

(assert (=> b!1573057 m!1446665))

(assert (=> b!1573054 m!1446617))

(declare-fun m!1446667 () Bool)

(assert (=> b!1573054 m!1446667))

(assert (=> b!1573054 m!1446667))

(declare-fun m!1446669 () Bool)

(assert (=> b!1573054 m!1446669))

(assert (=> b!1573058 m!1446665))

(assert (=> d!164909 m!1446617))

(declare-fun m!1446671 () Bool)

(assert (=> d!164909 m!1446671))

(assert (=> d!164909 m!1446607))

(assert (=> b!1572962 d!164909))

(declare-fun d!164923 () Bool)

(declare-fun lt!674252 () (_ BitVec 32))

(declare-fun lt!674251 () (_ BitVec 32))

(assert (=> d!164923 (= lt!674252 (bvmul (bvxor lt!674251 (bvlshr lt!674251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164923 (= lt!674251 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164923 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074818 (let ((h!38229 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141656 (bvmul (bvxor h!38229 (bvlshr h!38229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141656 (bvlshr x!141656 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074818 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074818 #b00000000000000000000000000000000))))))

(assert (=> d!164923 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674252 (bvlshr lt!674252 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572962 d!164923))

(declare-fun b!1573117 () Bool)

(declare-fun e!877233 () SeekEntryResult!13617)

(assert (=> b!1573117 (= e!877233 (Found!13617 (index!56868 lt!674206)))))

(declare-fun b!1573119 () Bool)

(declare-fun e!877234 () SeekEntryResult!13617)

(assert (=> b!1573119 (= e!877234 e!877233)))

(declare-fun c!145393 () Bool)

(declare-fun lt!674271 () (_ BitVec 64))

(assert (=> b!1573119 (= c!145393 (= lt!674271 k!754))))

(declare-fun e!877235 () SeekEntryResult!13617)

(declare-fun b!1573120 () Bool)

(assert (=> b!1573120 (= e!877235 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141649 lt!674206) #b00000000000000000000000000000001) (nextIndex!0 (index!56868 lt!674206) (x!141649 lt!674206) mask!889) (index!56868 lt!674206) k!754 _keys!600 mask!889))))

(declare-fun b!1573121 () Bool)

(assert (=> b!1573121 (= e!877235 (MissingVacant!13617 (index!56868 lt!674206)))))

(declare-fun b!1573122 () Bool)

(declare-fun c!145395 () Bool)

(assert (=> b!1573122 (= c!145395 (= lt!674271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573122 (= e!877233 e!877235)))

(declare-fun lt!674272 () SeekEntryResult!13617)

(declare-fun d!164925 () Bool)

(assert (=> d!164925 (and (or (is-Undefined!13617 lt!674272) (not (is-Found!13617 lt!674272)) (and (bvsge (index!56867 lt!674272) #b00000000000000000000000000000000) (bvslt (index!56867 lt!674272) (size!51254 _keys!600)))) (or (is-Undefined!13617 lt!674272) (is-Found!13617 lt!674272) (not (is-MissingVacant!13617 lt!674272)) (not (= (index!56869 lt!674272) (index!56868 lt!674206))) (and (bvsge (index!56869 lt!674272) #b00000000000000000000000000000000) (bvslt (index!56869 lt!674272) (size!51254 _keys!600)))) (or (is-Undefined!13617 lt!674272) (ite (is-Found!13617 lt!674272) (= (select (arr!50704 _keys!600) (index!56867 lt!674272)) k!754) (and (is-MissingVacant!13617 lt!674272) (= (index!56869 lt!674272) (index!56868 lt!674206)) (= (select (arr!50704 _keys!600) (index!56869 lt!674272)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164925 (= lt!674272 e!877234)))

(declare-fun c!145394 () Bool)

(assert (=> d!164925 (= c!145394 (bvsge (x!141649 lt!674206) #b01111111111111111111111111111110))))

(assert (=> d!164925 (= lt!674271 (select (arr!50704 _keys!600) (index!56868 lt!674206)))))

(assert (=> d!164925 (validMask!0 mask!889)))

(assert (=> d!164925 (= (seekKeyOrZeroReturnVacant!0 (x!141649 lt!674206) (index!56868 lt!674206) (index!56868 lt!674206) k!754 _keys!600 mask!889) lt!674272)))

(declare-fun b!1573118 () Bool)

(assert (=> b!1573118 (= e!877234 Undefined!13617)))

(assert (= (and d!164925 c!145394) b!1573118))

(assert (= (and d!164925 (not c!145394)) b!1573119))

(assert (= (and b!1573119 c!145393) b!1573117))

(assert (= (and b!1573119 (not c!145393)) b!1573122))

(assert (= (and b!1573122 c!145395) b!1573121))

(assert (= (and b!1573122 (not c!145395)) b!1573120))

(declare-fun m!1446689 () Bool)

(assert (=> b!1573120 m!1446689))

(assert (=> b!1573120 m!1446689))

(declare-fun m!1446691 () Bool)

(assert (=> b!1573120 m!1446691))

(declare-fun m!1446693 () Bool)

(assert (=> d!164925 m!1446693))

(declare-fun m!1446695 () Bool)

(assert (=> d!164925 m!1446695))

(assert (=> d!164925 m!1446615))

(assert (=> d!164925 m!1446607))

(assert (=> b!1572963 d!164925))

(push 1)

(assert (not b!1573054))

(assert (not d!164925))

(assert (not d!164909))

(assert (not b!1573120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

