; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135384 () Bool)

(assert start!135384)

(declare-fun b!1573817 () Bool)

(declare-fun e!877647 () Bool)

(declare-fun e!877649 () Bool)

(assert (=> b!1573817 (= e!877647 e!877649)))

(declare-fun res!1075160 () Bool)

(assert (=> b!1573817 (=> (not res!1075160) (not e!877649))))

(declare-fun lt!674603 () Bool)

(declare-datatypes ((SeekEntryResult!13635 0))(
  ( (MissingZero!13635 (index!56938 (_ BitVec 32))) (Found!13635 (index!56939 (_ BitVec 32))) (Intermediate!13635 (undefined!14447 Bool) (index!56940 (_ BitVec 32)) (x!141760 (_ BitVec 32))) (Undefined!13635) (MissingVacant!13635 (index!56941 (_ BitVec 32))) )
))
(declare-fun lt!674604 () SeekEntryResult!13635)

(assert (=> b!1573817 (= res!1075160 (and (or lt!674603 (not (undefined!14447 lt!674604))) (or lt!674603 (undefined!14447 lt!674604))))))

(assert (=> b!1573817 (= lt!674603 (not (is-Intermediate!13635 lt!674604)))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105141 0))(
  ( (array!105142 (arr!50722 (Array (_ BitVec 32) (_ BitVec 64))) (size!51272 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105141 (_ BitVec 32)) SeekEntryResult!13635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573817 (= lt!674604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573816 () Bool)

(declare-fun res!1075158 () Bool)

(assert (=> b!1573816 (=> (not res!1075158) (not e!877647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573816 (= res!1075158 (validKeyInArray!0 k!754))))

(declare-fun res!1075159 () Bool)

(assert (=> start!135384 (=> (not res!1075159) (not e!877647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135384 (= res!1075159 (validMask!0 mask!889))))

(assert (=> start!135384 e!877647))

(assert (=> start!135384 true))

(declare-fun array_inv!39449 (array!105141) Bool)

(assert (=> start!135384 (array_inv!39449 _keys!600)))

(declare-fun b!1573818 () Bool)

(declare-fun lt!674605 () SeekEntryResult!13635)

(assert (=> b!1573818 (= e!877649 (or (is-MissingVacant!13635 lt!674605) (and (is-Found!13635 lt!674605) (not (= (select (arr!50722 _keys!600) (index!56939 lt!674605)) k!754)))))))

(declare-fun err!162 () SeekEntryResult!13635)

(assert (=> b!1573818 (= lt!674605 err!162)))

(assert (=> b!1573818 true))

(declare-fun b!1573815 () Bool)

(declare-fun res!1075161 () Bool)

(assert (=> b!1573815 (=> (not res!1075161) (not e!877647))))

(assert (=> b!1573815 (= res!1075161 (= (size!51272 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135384 res!1075159) b!1573815))

(assert (= (and b!1573815 res!1075161) b!1573816))

(assert (= (and b!1573816 res!1075158) b!1573817))

(assert (= (and b!1573817 res!1075160) b!1573818))

(declare-fun m!1447045 () Bool)

(assert (=> b!1573817 m!1447045))

(assert (=> b!1573817 m!1447045))

(declare-fun m!1447047 () Bool)

(assert (=> b!1573817 m!1447047))

(declare-fun m!1447049 () Bool)

(assert (=> b!1573816 m!1447049))

(declare-fun m!1447051 () Bool)

(assert (=> start!135384 m!1447051))

(declare-fun m!1447053 () Bool)

(assert (=> start!135384 m!1447053))

(declare-fun m!1447055 () Bool)

(assert (=> b!1573818 m!1447055))

(push 1)

(assert (not b!1573816))

(assert (not b!1573817))

(assert (not start!135384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165103 () Bool)

(assert (=> d!165103 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573816 d!165103))

(declare-fun b!1573879 () Bool)

(declare-fun lt!674633 () SeekEntryResult!13635)

(assert (=> b!1573879 (and (bvsge (index!56940 lt!674633) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674633) (size!51272 _keys!600)))))

(declare-fun e!877689 () Bool)

(assert (=> b!1573879 (= e!877689 (= (select (arr!50722 _keys!600) (index!56940 lt!674633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573880 () Bool)

(declare-fun e!877691 () Bool)

(declare-fun e!877692 () Bool)

(assert (=> b!1573880 (= e!877691 e!877692)))

(declare-fun res!1075200 () Bool)

(assert (=> b!1573880 (= res!1075200 (and (is-Intermediate!13635 lt!674633) (not (undefined!14447 lt!674633)) (bvslt (x!141760 lt!674633) #b01111111111111111111111111111110) (bvsge (x!141760 lt!674633) #b00000000000000000000000000000000) (bvsge (x!141760 lt!674633) #b00000000000000000000000000000000)))))

(assert (=> b!1573880 (=> (not res!1075200) (not e!877692))))

(declare-fun b!1573881 () Bool)

(declare-fun e!877690 () SeekEntryResult!13635)

(declare-fun e!877688 () SeekEntryResult!13635)

(assert (=> b!1573881 (= e!877690 e!877688)))

(declare-fun c!145598 () Bool)

(declare-fun lt!674632 () (_ BitVec 64))

(assert (=> b!1573881 (= c!145598 (or (= lt!674632 k!754) (= (bvadd lt!674632 lt!674632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165105 () Bool)

(assert (=> d!165105 e!877691))

(declare-fun c!145599 () Bool)

(assert (=> d!165105 (= c!145599 (and (is-Intermediate!13635 lt!674633) (undefined!14447 lt!674633)))))

(assert (=> d!165105 (= lt!674633 e!877690)))

(declare-fun c!145597 () Bool)

(assert (=> d!165105 (= c!145597 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165105 (= lt!674632 (select (arr!50722 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165105 (validMask!0 mask!889)))

(assert (=> d!165105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674633)))

(declare-fun b!1573882 () Bool)

(assert (=> b!1573882 (= e!877688 (Intermediate!13635 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573883 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573883 (= e!877688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573884 () Bool)

(assert (=> b!1573884 (= e!877690 (Intermediate!13635 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573885 () Bool)

(assert (=> b!1573885 (and (bvsge (index!56940 lt!674633) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674633) (size!51272 _keys!600)))))

(declare-fun res!1075199 () Bool)

(assert (=> b!1573885 (= res!1075199 (= (select (arr!50722 _keys!600) (index!56940 lt!674633)) k!754))))

(assert (=> b!1573885 (=> res!1075199 e!877689)))

(assert (=> b!1573885 (= e!877692 e!877689)))

(declare-fun b!1573886 () Bool)

(assert (=> b!1573886 (= e!877691 (bvsge (x!141760 lt!674633) #b01111111111111111111111111111110))))

(declare-fun b!1573887 () Bool)

(assert (=> b!1573887 (and (bvsge (index!56940 lt!674633) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674633) (size!51272 _keys!600)))))

(declare-fun res!1075198 () Bool)

(assert (=> b!1573887 (= res!1075198 (= (select (arr!50722 _keys!600) (index!56940 lt!674633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573887 (=> res!1075198 e!877689)))

(assert (= (and d!165105 c!145597) b!1573884))

(assert (= (and d!165105 (not c!145597)) b!1573881))

(assert (= (and b!1573881 c!145598) b!1573882))

(assert (= (and b!1573881 (not c!145598)) b!1573883))

(assert (= (and d!165105 c!145599) b!1573886))

(assert (= (and d!165105 (not c!145599)) b!1573880))

(assert (= (and b!1573880 res!1075200) b!1573885))

(assert (= (and b!1573885 (not res!1075199)) b!1573887))

(assert (= (and b!1573887 (not res!1075198)) b!1573879))

(declare-fun m!1447081 () Bool)

(assert (=> b!1573887 m!1447081))

(assert (=> b!1573883 m!1447045))

(declare-fun m!1447083 () Bool)

(assert (=> b!1573883 m!1447083))

(assert (=> b!1573883 m!1447083))

(declare-fun m!1447085 () Bool)

(assert (=> b!1573883 m!1447085))

(assert (=> b!1573885 m!1447081))

(assert (=> d!165105 m!1447045))

(declare-fun m!1447087 () Bool)

(assert (=> d!165105 m!1447087))

(assert (=> d!165105 m!1447051))

(assert (=> b!1573879 m!1447081))

(assert (=> b!1573817 d!165105))

(declare-fun d!165111 () Bool)

(declare-fun lt!674641 () (_ BitVec 32))

(declare-fun lt!674640 () (_ BitVec 32))

(assert (=> d!165111 (= lt!674641 (bvmul (bvxor lt!674640 (bvlshr lt!674640 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165111 (= lt!674640 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165111 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075201 (let ((h!38246 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141765 (bvmul (bvxor h!38246 (bvlshr h!38246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141765 (bvlshr x!141765 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075201 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075201 #b00000000000000000000000000000000))))))

(assert (=> d!165111 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674641 (bvlshr lt!674641 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573817 d!165111))

(declare-fun d!165113 () Bool)

(assert (=> d!165113 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135384 d!165113))

(declare-fun d!165119 () Bool)

(assert (=> d!165119 (= (array_inv!39449 _keys!600) (bvsge (size!51272 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135384 d!165119))

(push 1)

(assert (not d!165105))

(assert (not b!1573883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

