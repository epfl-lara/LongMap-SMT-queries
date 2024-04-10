; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135032 () Bool)

(assert start!135032)

(declare-fun res!1074412 () Bool)

(declare-fun e!876844 () Bool)

(assert (=> start!135032 (=> (not res!1074412) (not e!876844))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135032 (= res!1074412 (validMask!0 mask!889))))

(assert (=> start!135032 e!876844))

(assert (=> start!135032 true))

(declare-datatypes ((array!105021 0))(
  ( (array!105022 (arr!50674 (Array (_ BitVec 32) (_ BitVec 64))) (size!51224 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105021)

(declare-fun array_inv!39401 (array!105021) Bool)

(assert (=> start!135032 (array_inv!39401 _keys!600)))

(declare-fun b!1572499 () Bool)

(declare-fun res!1074414 () Bool)

(assert (=> b!1572499 (=> (not res!1074414) (not e!876844))))

(assert (=> b!1572499 (= res!1074414 (= (size!51224 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572500 () Bool)

(declare-fun res!1074413 () Bool)

(assert (=> b!1572500 (=> (not res!1074413) (not e!876844))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572500 (= res!1074413 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13587 0))(
  ( (MissingZero!13587 (index!56746 (_ BitVec 32))) (Found!13587 (index!56747 (_ BitVec 32))) (Intermediate!13587 (undefined!14399 Bool) (index!56748 (_ BitVec 32)) (x!141527 (_ BitVec 32))) (Undefined!13587) (MissingVacant!13587 (index!56749 (_ BitVec 32))) )
))
(declare-fun lt!674014 () SeekEntryResult!13587)

(declare-fun b!1572501 () Bool)

(assert (=> b!1572501 (= e!876844 (and (is-Intermediate!13587 lt!674014) (not (undefined!14399 lt!674014)) (= (select (arr!50674 _keys!600) (index!56748 lt!674014)) k!754) (or (bvslt (index!56748 lt!674014) #b00000000000000000000000000000000) (bvsge (index!56748 lt!674014) (size!51224 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105021 (_ BitVec 32)) SeekEntryResult!13587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572501 (= lt!674014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135032 res!1074412) b!1572499))

(assert (= (and b!1572499 res!1074414) b!1572500))

(assert (= (and b!1572500 res!1074413) b!1572501))

(declare-fun m!1446211 () Bool)

(assert (=> start!135032 m!1446211))

(declare-fun m!1446213 () Bool)

(assert (=> start!135032 m!1446213))

(declare-fun m!1446215 () Bool)

(assert (=> b!1572500 m!1446215))

(declare-fun m!1446217 () Bool)

(assert (=> b!1572501 m!1446217))

(declare-fun m!1446219 () Bool)

(assert (=> b!1572501 m!1446219))

(assert (=> b!1572501 m!1446219))

(declare-fun m!1446221 () Bool)

(assert (=> b!1572501 m!1446221))

(push 1)

(assert (not b!1572500))

(assert (not b!1572501))

(assert (not start!135032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164817 () Bool)

(assert (=> d!164817 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572500 d!164817))

(declare-fun b!1572579 () Bool)

(declare-fun lt!674036 () SeekEntryResult!13587)

(assert (=> b!1572579 (and (bvsge (index!56748 lt!674036) #b00000000000000000000000000000000) (bvslt (index!56748 lt!674036) (size!51224 _keys!600)))))

(declare-fun res!1074453 () Bool)

(assert (=> b!1572579 (= res!1074453 (= (select (arr!50674 _keys!600) (index!56748 lt!674036)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876894 () Bool)

(assert (=> b!1572579 (=> res!1074453 e!876894)))

(declare-fun e!876895 () SeekEntryResult!13587)

(declare-fun b!1572580 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572580 (= e!876895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572581 () Bool)

(declare-fun e!876897 () Bool)

(declare-fun e!876896 () Bool)

(assert (=> b!1572581 (= e!876897 e!876896)))

(declare-fun res!1074454 () Bool)

(assert (=> b!1572581 (= res!1074454 (and (is-Intermediate!13587 lt!674036) (not (undefined!14399 lt!674036)) (bvslt (x!141527 lt!674036) #b01111111111111111111111111111110) (bvsge (x!141527 lt!674036) #b00000000000000000000000000000000) (bvsge (x!141527 lt!674036) #b00000000000000000000000000000000)))))

(assert (=> b!1572581 (=> (not res!1074454) (not e!876896))))

(declare-fun d!164819 () Bool)

(assert (=> d!164819 e!876897))

(declare-fun c!145310 () Bool)

(assert (=> d!164819 (= c!145310 (and (is-Intermediate!13587 lt!674036) (undefined!14399 lt!674036)))))

(declare-fun e!876893 () SeekEntryResult!13587)

(assert (=> d!164819 (= lt!674036 e!876893)))

(declare-fun c!145311 () Bool)

(assert (=> d!164819 (= c!145311 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674035 () (_ BitVec 64))

(assert (=> d!164819 (= lt!674035 (select (arr!50674 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164819 (validMask!0 mask!889)))

(assert (=> d!164819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674036)))

(declare-fun b!1572582 () Bool)

(assert (=> b!1572582 (= e!876893 e!876895)))

(declare-fun c!145309 () Bool)

(assert (=> b!1572582 (= c!145309 (or (= lt!674035 k!754) (= (bvadd lt!674035 lt!674035) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572583 () Bool)

(assert (=> b!1572583 (= e!876897 (bvsge (x!141527 lt!674036) #b01111111111111111111111111111110))))

(declare-fun b!1572584 () Bool)

(assert (=> b!1572584 (and (bvsge (index!56748 lt!674036) #b00000000000000000000000000000000) (bvslt (index!56748 lt!674036) (size!51224 _keys!600)))))

(declare-fun res!1074455 () Bool)

(assert (=> b!1572584 (= res!1074455 (= (select (arr!50674 _keys!600) (index!56748 lt!674036)) k!754))))

(assert (=> b!1572584 (=> res!1074455 e!876894)))

(assert (=> b!1572584 (= e!876896 e!876894)))

(declare-fun b!1572585 () Bool)

(assert (=> b!1572585 (and (bvsge (index!56748 lt!674036) #b00000000000000000000000000000000) (bvslt (index!56748 lt!674036) (size!51224 _keys!600)))))

(assert (=> b!1572585 (= e!876894 (= (select (arr!50674 _keys!600) (index!56748 lt!674036)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572586 () Bool)

(assert (=> b!1572586 (= e!876893 (Intermediate!13587 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572587 () Bool)

(assert (=> b!1572587 (= e!876895 (Intermediate!13587 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164819 c!145311) b!1572586))

(assert (= (and d!164819 (not c!145311)) b!1572582))

(assert (= (and b!1572582 c!145309) b!1572587))

(assert (= (and b!1572582 (not c!145309)) b!1572580))

(assert (= (and d!164819 c!145310) b!1572583))

(assert (= (and d!164819 (not c!145310)) b!1572581))

(assert (= (and b!1572581 res!1074454) b!1572584))

(assert (= (and b!1572584 (not res!1074455)) b!1572579))

(assert (= (and b!1572579 (not res!1074453)) b!1572585))

(assert (=> b!1572580 m!1446219))

(declare-fun m!1446255 () Bool)

(assert (=> b!1572580 m!1446255))

(assert (=> b!1572580 m!1446255))

(declare-fun m!1446257 () Bool)

(assert (=> b!1572580 m!1446257))

(declare-fun m!1446259 () Bool)

(assert (=> b!1572584 m!1446259))

(assert (=> b!1572579 m!1446259))

(assert (=> d!164819 m!1446219))

(declare-fun m!1446261 () Bool)

(assert (=> d!164819 m!1446261))

(assert (=> d!164819 m!1446211))

(assert (=> b!1572585 m!1446259))

(assert (=> b!1572501 d!164819))

(declare-fun d!164825 () Bool)

(declare-fun lt!674050 () (_ BitVec 32))

(declare-fun lt!674049 () (_ BitVec 32))

(assert (=> d!164825 (= lt!674050 (bvmul (bvxor lt!674049 (bvlshr lt!674049 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164825 (= lt!674049 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164825 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074458 (let ((h!38223 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141534 (bvmul (bvxor h!38223 (bvlshr h!38223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141534 (bvlshr x!141534 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074458 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074458 #b00000000000000000000000000000000))))))

(assert (=> d!164825 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674050 (bvlshr lt!674050 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572501 d!164825))

(declare-fun d!164831 () Bool)

(assert (=> d!164831 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135032 d!164831))

(declare-fun d!164837 () Bool)

(assert (=> d!164837 (= (array_inv!39401 _keys!600) (bvsge (size!51224 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135032 d!164837))

(push 1)

(assert (not d!164819))

(assert (not b!1572580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

