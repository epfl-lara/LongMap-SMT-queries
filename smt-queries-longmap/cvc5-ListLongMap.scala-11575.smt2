; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134852 () Bool)

(assert start!134852)

(declare-fun res!1074024 () Bool)

(declare-fun e!876485 () Bool)

(assert (=> start!134852 (=> (not res!1074024) (not e!876485))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134852 (= res!1074024 (validMask!0 mask!889))))

(assert (=> start!134852 e!876485))

(assert (=> start!134852 true))

(declare-datatypes ((array!104949 0))(
  ( (array!104950 (arr!50644 (Array (_ BitVec 32) (_ BitVec 64))) (size!51194 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104949)

(declare-fun array_inv!39371 (array!104949) Bool)

(assert (=> start!134852 (array_inv!39371 _keys!600)))

(declare-fun b!1571905 () Bool)

(declare-fun res!1074023 () Bool)

(assert (=> b!1571905 (=> (not res!1074023) (not e!876485))))

(assert (=> b!1571905 (= res!1074023 (= (size!51194 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571906 () Bool)

(declare-fun res!1074022 () Bool)

(assert (=> b!1571906 (=> (not res!1074022) (not e!876485))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571906 (= res!1074022 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13557 0))(
  ( (MissingZero!13557 (index!56626 (_ BitVec 32))) (Found!13557 (index!56627 (_ BitVec 32))) (Intermediate!13557 (undefined!14369 Bool) (index!56628 (_ BitVec 32)) (x!141393 (_ BitVec 32))) (Undefined!13557) (MissingVacant!13557 (index!56629 (_ BitVec 32))) )
))
(declare-fun lt!673780 () SeekEntryResult!13557)

(declare-fun b!1571907 () Bool)

(assert (=> b!1571907 (= e!876485 (and (is-Intermediate!13557 lt!673780) (not (undefined!14369 lt!673780)) (not (= (select (arr!50644 _keys!600) (index!56628 lt!673780)) k!754)) (not (= (select (arr!50644 _keys!600) (index!56628 lt!673780)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50644 _keys!600) (index!56628 lt!673780)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56628 lt!673780) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673780) (bvadd #b00000000000000000000000000000001 mask!889)) (bvsge mask!889 #b00000000000000000000000000000000) (or (bvsgt (x!141393 lt!673780) #b01111111111111111111111111111110) (bvslt (x!141393 lt!673780) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104949 (_ BitVec 32)) SeekEntryResult!13557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571907 (= lt!673780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134852 res!1074024) b!1571905))

(assert (= (and b!1571905 res!1074023) b!1571906))

(assert (= (and b!1571906 res!1074022) b!1571907))

(declare-fun m!1445797 () Bool)

(assert (=> start!134852 m!1445797))

(declare-fun m!1445799 () Bool)

(assert (=> start!134852 m!1445799))

(declare-fun m!1445801 () Bool)

(assert (=> b!1571906 m!1445801))

(declare-fun m!1445803 () Bool)

(assert (=> b!1571907 m!1445803))

(declare-fun m!1445805 () Bool)

(assert (=> b!1571907 m!1445805))

(assert (=> b!1571907 m!1445805))

(declare-fun m!1445807 () Bool)

(assert (=> b!1571907 m!1445807))

(push 1)

(assert (not b!1571906))

(assert (not b!1571907))

(assert (not start!134852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164677 () Bool)

(assert (=> d!164677 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571906 d!164677))

(declare-fun b!1571971 () Bool)

(declare-fun lt!673804 () SeekEntryResult!13557)

(assert (=> b!1571971 (and (bvsge (index!56628 lt!673804) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673804) (size!51194 _keys!600)))))

(declare-fun res!1074061 () Bool)

(assert (=> b!1571971 (= res!1074061 (= (select (arr!50644 _keys!600) (index!56628 lt!673804)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876526 () Bool)

(assert (=> b!1571971 (=> res!1074061 e!876526)))

(declare-fun b!1571972 () Bool)

(assert (=> b!1571972 (and (bvsge (index!56628 lt!673804) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673804) (size!51194 _keys!600)))))

(declare-fun res!1074060 () Bool)

(assert (=> b!1571972 (= res!1074060 (= (select (arr!50644 _keys!600) (index!56628 lt!673804)) k!754))))

(assert (=> b!1571972 (=> res!1074060 e!876526)))

(declare-fun e!876524 () Bool)

(assert (=> b!1571972 (= e!876524 e!876526)))

(declare-fun d!164679 () Bool)

(declare-fun e!876525 () Bool)

(assert (=> d!164679 e!876525))

(declare-fun c!145197 () Bool)

(assert (=> d!164679 (= c!145197 (and (is-Intermediate!13557 lt!673804) (undefined!14369 lt!673804)))))

(declare-fun e!876527 () SeekEntryResult!13557)

(assert (=> d!164679 (= lt!673804 e!876527)))

(declare-fun c!145195 () Bool)

(assert (=> d!164679 (= c!145195 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673803 () (_ BitVec 64))

(assert (=> d!164679 (= lt!673803 (select (arr!50644 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164679 (validMask!0 mask!889)))

(assert (=> d!164679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673804)))

(declare-fun b!1571973 () Bool)

(declare-fun e!876523 () SeekEntryResult!13557)

(assert (=> b!1571973 (= e!876527 e!876523)))

(declare-fun c!145196 () Bool)

(assert (=> b!1571973 (= c!145196 (or (= lt!673803 k!754) (= (bvadd lt!673803 lt!673803) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1571974 () Bool)

(assert (=> b!1571974 (= e!876523 (Intermediate!13557 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571975 () Bool)

(assert (=> b!1571975 (= e!876525 e!876524)))

(declare-fun res!1074059 () Bool)

(assert (=> b!1571975 (= res!1074059 (and (is-Intermediate!13557 lt!673804) (not (undefined!14369 lt!673804)) (bvslt (x!141393 lt!673804) #b01111111111111111111111111111110) (bvsge (x!141393 lt!673804) #b00000000000000000000000000000000) (bvsge (x!141393 lt!673804) #b00000000000000000000000000000000)))))

(assert (=> b!1571975 (=> (not res!1074059) (not e!876524))))

(declare-fun b!1571976 () Bool)

(assert (=> b!1571976 (and (bvsge (index!56628 lt!673804) #b00000000000000000000000000000000) (bvslt (index!56628 lt!673804) (size!51194 _keys!600)))))

(assert (=> b!1571976 (= e!876526 (= (select (arr!50644 _keys!600) (index!56628 lt!673804)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1571977 () Bool)

(assert (=> b!1571977 (= e!876525 (bvsge (x!141393 lt!673804) #b01111111111111111111111111111110))))

(declare-fun b!1571978 () Bool)

(assert (=> b!1571978 (= e!876527 (Intermediate!13557 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1571979 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571979 (= e!876523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and d!164679 c!145195) b!1571978))

(assert (= (and d!164679 (not c!145195)) b!1571973))

(assert (= (and b!1571973 c!145196) b!1571974))

(assert (= (and b!1571973 (not c!145196)) b!1571979))

(assert (= (and d!164679 c!145197) b!1571977))

(assert (= (and d!164679 (not c!145197)) b!1571975))

(assert (= (and b!1571975 res!1074059) b!1571972))

(assert (= (and b!1571972 (not res!1074060)) b!1571971))

(assert (= (and b!1571971 (not res!1074061)) b!1571976))

(declare-fun m!1445841 () Bool)

(assert (=> b!1571971 m!1445841))

(assert (=> d!164679 m!1445805))

(declare-fun m!1445843 () Bool)

(assert (=> d!164679 m!1445843))

(assert (=> d!164679 m!1445797))

(assert (=> b!1571972 m!1445841))

(assert (=> b!1571979 m!1445805))

(declare-fun m!1445845 () Bool)

(assert (=> b!1571979 m!1445845))

(assert (=> b!1571979 m!1445845))

(declare-fun m!1445847 () Bool)

(assert (=> b!1571979 m!1445847))

(assert (=> b!1571976 m!1445841))

(assert (=> b!1571907 d!164679))

(declare-fun d!164689 () Bool)

(declare-fun lt!673814 () (_ BitVec 32))

(declare-fun lt!673813 () (_ BitVec 32))

(assert (=> d!164689 (= lt!673814 (bvmul (bvxor lt!673813 (bvlshr lt!673813 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164689 (= lt!673813 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164689 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074062 (let ((h!38211 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141399 (bvmul (bvxor h!38211 (bvlshr h!38211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141399 (bvlshr x!141399 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074062 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074062 #b00000000000000000000000000000000))))))

(assert (=> d!164689 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!673814 (bvlshr lt!673814 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1571907 d!164689))

(declare-fun d!164691 () Bool)

(assert (=> d!164691 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134852 d!164691))

(declare-fun d!164699 () Bool)

(assert (=> d!164699 (= (array_inv!39371 _keys!600) (bvsge (size!51194 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134852 d!164699))

(push 1)

