; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135102 () Bool)

(assert start!135102)

(declare-fun res!1074623 () Bool)

(declare-fun e!877010 () Bool)

(assert (=> start!135102 (=> (not res!1074623) (not e!877010))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135102 (= res!1074623 (validMask!0 mask!889))))

(assert (=> start!135102 e!877010))

(assert (=> start!135102 true))

(declare-datatypes ((array!105064 0))(
  ( (array!105065 (arr!50694 (Array (_ BitVec 32) (_ BitVec 64))) (size!51244 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105064)

(declare-fun array_inv!39421 (array!105064) Bool)

(assert (=> start!135102 (array_inv!39421 _keys!600)))

(declare-fun b!1572760 () Bool)

(declare-fun res!1074622 () Bool)

(assert (=> b!1572760 (=> (not res!1074622) (not e!877010))))

(assert (=> b!1572760 (= res!1074622 (= (size!51244 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572761 () Bool)

(declare-fun res!1074624 () Bool)

(assert (=> b!1572761 (=> (not res!1074624) (not e!877010))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572761 (= res!1074624 (validKeyInArray!0 k!754))))

(declare-fun b!1572762 () Bool)

(declare-datatypes ((SeekEntryResult!13607 0))(
  ( (MissingZero!13607 (index!56826 (_ BitVec 32))) (Found!13607 (index!56827 (_ BitVec 32))) (Intermediate!13607 (undefined!14419 Bool) (index!56828 (_ BitVec 32)) (x!141601 (_ BitVec 32))) (Undefined!13607) (MissingVacant!13607 (index!56829 (_ BitVec 32))) )
))
(declare-fun lt!674110 () SeekEntryResult!13607)

(assert (=> b!1572762 (= e!877010 (and (is-Intermediate!13607 lt!674110) (not (undefined!14419 lt!674110)) (not (= (select (arr!50694 _keys!600) (index!56828 lt!674110)) k!754)) (not (= (select (arr!50694 _keys!600) (index!56828 lt!674110)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!56828 lt!674110) #b00000000000000000000000000000000) (bvsge (index!56828 lt!674110) (size!51244 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105064 (_ BitVec 32)) SeekEntryResult!13607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572762 (= lt!674110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135102 res!1074623) b!1572760))

(assert (= (and b!1572760 res!1074622) b!1572761))

(assert (= (and b!1572761 res!1074624) b!1572762))

(declare-fun m!1446445 () Bool)

(assert (=> start!135102 m!1446445))

(declare-fun m!1446447 () Bool)

(assert (=> start!135102 m!1446447))

(declare-fun m!1446449 () Bool)

(assert (=> b!1572761 m!1446449))

(declare-fun m!1446451 () Bool)

(assert (=> b!1572762 m!1446451))

(declare-fun m!1446453 () Bool)

(assert (=> b!1572762 m!1446453))

(assert (=> b!1572762 m!1446453))

(declare-fun m!1446455 () Bool)

(assert (=> b!1572762 m!1446455))

(push 1)

(assert (not b!1572761))

(assert (not b!1572762))

(assert (not start!135102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164861 () Bool)

(assert (=> d!164861 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572761 d!164861))

(declare-fun e!877050 () SeekEntryResult!13607)

(declare-fun b!1572826 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572826 (= e!877050 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572827 () Bool)

(declare-fun lt!674125 () SeekEntryResult!13607)

(assert (=> b!1572827 (and (bvsge (index!56828 lt!674125) #b00000000000000000000000000000000) (bvslt (index!56828 lt!674125) (size!51244 _keys!600)))))

(declare-fun res!1074649 () Bool)

(assert (=> b!1572827 (= res!1074649 (= (select (arr!50694 _keys!600) (index!56828 lt!674125)) k!754))))

(declare-fun e!877049 () Bool)

(assert (=> b!1572827 (=> res!1074649 e!877049)))

(declare-fun e!877047 () Bool)

(assert (=> b!1572827 (= e!877047 e!877049)))

(declare-fun b!1572828 () Bool)

(declare-fun e!877046 () SeekEntryResult!13607)

(assert (=> b!1572828 (= e!877046 (Intermediate!13607 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572829 () Bool)

(declare-fun e!877048 () Bool)

(assert (=> b!1572829 (= e!877048 (bvsge (x!141601 lt!674125) #b01111111111111111111111111111110))))

(declare-fun b!1572831 () Bool)

(assert (=> b!1572831 (and (bvsge (index!56828 lt!674125) #b00000000000000000000000000000000) (bvslt (index!56828 lt!674125) (size!51244 _keys!600)))))

(declare-fun res!1074648 () Bool)

(assert (=> b!1572831 (= res!1074648 (= (select (arr!50694 _keys!600) (index!56828 lt!674125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572831 (=> res!1074648 e!877049)))

(declare-fun b!1572832 () Bool)

(assert (=> b!1572832 (and (bvsge (index!56828 lt!674125) #b00000000000000000000000000000000) (bvslt (index!56828 lt!674125) (size!51244 _keys!600)))))

(assert (=> b!1572832 (= e!877049 (= (select (arr!50694 _keys!600) (index!56828 lt!674125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572833 () Bool)

(assert (=> b!1572833 (= e!877050 (Intermediate!13607 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572834 () Bool)

(assert (=> b!1572834 (= e!877046 e!877050)))

(declare-fun c!145338 () Bool)

(declare-fun lt!674126 () (_ BitVec 64))

(assert (=> b!1572834 (= c!145338 (or (= lt!674126 k!754) (= (bvadd lt!674126 lt!674126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164863 () Bool)

(assert (=> d!164863 e!877048))

(declare-fun c!145337 () Bool)

(assert (=> d!164863 (= c!145337 (and (is-Intermediate!13607 lt!674125) (undefined!14419 lt!674125)))))

(assert (=> d!164863 (= lt!674125 e!877046)))

(declare-fun c!145336 () Bool)

(assert (=> d!164863 (= c!145336 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164863 (= lt!674126 (select (arr!50694 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164863 (validMask!0 mask!889)))

(assert (=> d!164863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674125)))

(declare-fun b!1572830 () Bool)

(assert (=> b!1572830 (= e!877048 e!877047)))

(declare-fun res!1074647 () Bool)

(assert (=> b!1572830 (= res!1074647 (and (is-Intermediate!13607 lt!674125) (not (undefined!14419 lt!674125)) (bvslt (x!141601 lt!674125) #b01111111111111111111111111111110) (bvsge (x!141601 lt!674125) #b00000000000000000000000000000000) (bvsge (x!141601 lt!674125) #b00000000000000000000000000000000)))))

(assert (=> b!1572830 (=> (not res!1074647) (not e!877047))))

(assert (= (and d!164863 c!145336) b!1572828))

(assert (= (and d!164863 (not c!145336)) b!1572834))

(assert (= (and b!1572834 c!145338) b!1572833))

(assert (= (and b!1572834 (not c!145338)) b!1572826))

(assert (= (and d!164863 c!145337) b!1572829))

(assert (= (and d!164863 (not c!145337)) b!1572830))

(assert (= (and b!1572830 res!1074647) b!1572827))

(assert (= (and b!1572827 (not res!1074649)) b!1572831))

(assert (= (and b!1572831 (not res!1074648)) b!1572832))

(declare-fun m!1446465 () Bool)

(assert (=> b!1572832 m!1446465))

(assert (=> b!1572826 m!1446453))

(declare-fun m!1446467 () Bool)

(assert (=> b!1572826 m!1446467))

(assert (=> b!1572826 m!1446467))

(declare-fun m!1446469 () Bool)

(assert (=> b!1572826 m!1446469))

(assert (=> b!1572827 m!1446465))

(assert (=> b!1572831 m!1446465))

(assert (=> d!164863 m!1446453))

(declare-fun m!1446471 () Bool)

(assert (=> d!164863 m!1446471))

(assert (=> d!164863 m!1446445))

(assert (=> b!1572762 d!164863))

(declare-fun d!164873 () Bool)

(declare-fun lt!674140 () (_ BitVec 32))

(declare-fun lt!674139 () (_ BitVec 32))

(assert (=> d!164873 (= lt!674140 (bvmul (bvxor lt!674139 (bvlshr lt!674139 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164873 (= lt!674139 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164873 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074650 (let ((h!38226 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141606 (bvmul (bvxor h!38226 (bvlshr h!38226 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141606 (bvlshr x!141606 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074650 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074650 #b00000000000000000000000000000000))))))

(assert (=> d!164873 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674140 (bvlshr lt!674140 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572762 d!164873))

(declare-fun d!164879 () Bool)

(assert (=> d!164879 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135102 d!164879))

(declare-fun d!164881 () Bool)

(assert (=> d!164881 (= (array_inv!39421 _keys!600) (bvsge (size!51244 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135102 d!164881))

(push 1)

(assert (not b!1572826))

(assert (not d!164863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

