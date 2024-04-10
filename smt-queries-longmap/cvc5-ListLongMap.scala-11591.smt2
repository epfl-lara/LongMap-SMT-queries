; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135098 () Bool)

(assert start!135098)

(declare-fun res!1074605 () Bool)

(declare-fun e!876998 () Bool)

(assert (=> start!135098 (=> (not res!1074605) (not e!876998))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135098 (= res!1074605 (validMask!0 mask!889))))

(assert (=> start!135098 e!876998))

(assert (=> start!135098 true))

(declare-datatypes ((array!105060 0))(
  ( (array!105061 (arr!50692 (Array (_ BitVec 32) (_ BitVec 64))) (size!51242 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105060)

(declare-fun array_inv!39419 (array!105060) Bool)

(assert (=> start!135098 (array_inv!39419 _keys!600)))

(declare-fun b!1572742 () Bool)

(declare-fun res!1074606 () Bool)

(assert (=> b!1572742 (=> (not res!1074606) (not e!876998))))

(assert (=> b!1572742 (= res!1074606 (= (size!51242 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572743 () Bool)

(declare-fun res!1074604 () Bool)

(assert (=> b!1572743 (=> (not res!1074604) (not e!876998))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572743 (= res!1074604 (validKeyInArray!0 k!754))))

(declare-fun b!1572744 () Bool)

(declare-datatypes ((SeekEntryResult!13605 0))(
  ( (MissingZero!13605 (index!56818 (_ BitVec 32))) (Found!13605 (index!56819 (_ BitVec 32))) (Intermediate!13605 (undefined!14417 Bool) (index!56820 (_ BitVec 32)) (x!141599 (_ BitVec 32))) (Undefined!13605) (MissingVacant!13605 (index!56821 (_ BitVec 32))) )
))
(declare-fun lt!674104 () SeekEntryResult!13605)

(assert (=> b!1572744 (= e!876998 (and (is-Intermediate!13605 lt!674104) (not (undefined!14417 lt!674104)) (not (= (select (arr!50692 _keys!600) (index!56820 lt!674104)) k!754)) (not (= (select (arr!50692 _keys!600) (index!56820 lt!674104)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!56820 lt!674104) #b00000000000000000000000000000000) (bvsge (index!56820 lt!674104) (size!51242 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105060 (_ BitVec 32)) SeekEntryResult!13605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572744 (= lt!674104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135098 res!1074605) b!1572742))

(assert (= (and b!1572742 res!1074606) b!1572743))

(assert (= (and b!1572743 res!1074604) b!1572744))

(declare-fun m!1446421 () Bool)

(assert (=> start!135098 m!1446421))

(declare-fun m!1446423 () Bool)

(assert (=> start!135098 m!1446423))

(declare-fun m!1446425 () Bool)

(assert (=> b!1572743 m!1446425))

(declare-fun m!1446427 () Bool)

(assert (=> b!1572744 m!1446427))

(declare-fun m!1446429 () Bool)

(assert (=> b!1572744 m!1446429))

(assert (=> b!1572744 m!1446429))

(declare-fun m!1446431 () Bool)

(assert (=> b!1572744 m!1446431))

(push 1)

(assert (not b!1572743))

(assert (not b!1572744))

(assert (not start!135098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164857 () Bool)

(assert (=> d!164857 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572743 d!164857))

(declare-fun b!1572799 () Bool)

(declare-fun e!877035 () SeekEntryResult!13605)

(declare-fun e!877032 () SeekEntryResult!13605)

(assert (=> b!1572799 (= e!877035 e!877032)))

(declare-fun c!145329 () Bool)

(declare-fun lt!674119 () (_ BitVec 64))

(assert (=> b!1572799 (= c!145329 (or (= lt!674119 k!754) (= (bvadd lt!674119 lt!674119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572800 () Bool)

(assert (=> b!1572800 (= e!877035 (Intermediate!13605 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572801 () Bool)

(declare-fun e!877034 () Bool)

(declare-fun e!877033 () Bool)

(assert (=> b!1572801 (= e!877034 e!877033)))

(declare-fun res!1074637 () Bool)

(declare-fun lt!674120 () SeekEntryResult!13605)

(assert (=> b!1572801 (= res!1074637 (and (is-Intermediate!13605 lt!674120) (not (undefined!14417 lt!674120)) (bvslt (x!141599 lt!674120) #b01111111111111111111111111111110) (bvsge (x!141599 lt!674120) #b00000000000000000000000000000000) (bvsge (x!141599 lt!674120) #b00000000000000000000000000000000)))))

(assert (=> b!1572801 (=> (not res!1074637) (not e!877033))))

(declare-fun b!1572802 () Bool)

(assert (=> b!1572802 (= e!877034 (bvsge (x!141599 lt!674120) #b01111111111111111111111111111110))))

(declare-fun b!1572803 () Bool)

(assert (=> b!1572803 (and (bvsge (index!56820 lt!674120) #b00000000000000000000000000000000) (bvslt (index!56820 lt!674120) (size!51242 _keys!600)))))

(declare-fun res!1074639 () Bool)

(assert (=> b!1572803 (= res!1074639 (= (select (arr!50692 _keys!600) (index!56820 lt!674120)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877031 () Bool)

(assert (=> b!1572803 (=> res!1074639 e!877031)))

(declare-fun b!1572804 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572804 (= e!877032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572805 () Bool)

(assert (=> b!1572805 (= e!877032 (Intermediate!13605 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164859 () Bool)

(assert (=> d!164859 e!877034))

(declare-fun c!145328 () Bool)

(assert (=> d!164859 (= c!145328 (and (is-Intermediate!13605 lt!674120) (undefined!14417 lt!674120)))))

(assert (=> d!164859 (= lt!674120 e!877035)))

(declare-fun c!145327 () Bool)

(assert (=> d!164859 (= c!145327 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164859 (= lt!674119 (select (arr!50692 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164859 (validMask!0 mask!889)))

(assert (=> d!164859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674120)))

(declare-fun b!1572806 () Bool)

(assert (=> b!1572806 (and (bvsge (index!56820 lt!674120) #b00000000000000000000000000000000) (bvslt (index!56820 lt!674120) (size!51242 _keys!600)))))

(declare-fun res!1074638 () Bool)

(assert (=> b!1572806 (= res!1074638 (= (select (arr!50692 _keys!600) (index!56820 lt!674120)) k!754))))

(assert (=> b!1572806 (=> res!1074638 e!877031)))

(assert (=> b!1572806 (= e!877033 e!877031)))

(declare-fun b!1572807 () Bool)

(assert (=> b!1572807 (and (bvsge (index!56820 lt!674120) #b00000000000000000000000000000000) (bvslt (index!56820 lt!674120) (size!51242 _keys!600)))))

(assert (=> b!1572807 (= e!877031 (= (select (arr!50692 _keys!600) (index!56820 lt!674120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164859 c!145327) b!1572800))

(assert (= (and d!164859 (not c!145327)) b!1572799))

(assert (= (and b!1572799 c!145329) b!1572805))

(assert (= (and b!1572799 (not c!145329)) b!1572804))

(assert (= (and d!164859 c!145328) b!1572802))

(assert (= (and d!164859 (not c!145328)) b!1572801))

(assert (= (and b!1572801 res!1074637) b!1572806))

(assert (= (and b!1572806 (not res!1074638)) b!1572803))

(assert (= (and b!1572803 (not res!1074639)) b!1572807))

(declare-fun m!1446457 () Bool)

(assert (=> b!1572806 m!1446457))

(assert (=> d!164859 m!1446429))

(declare-fun m!1446459 () Bool)

(assert (=> d!164859 m!1446459))

(assert (=> d!164859 m!1446421))

(assert (=> b!1572807 m!1446457))

(assert (=> b!1572804 m!1446429))

(declare-fun m!1446461 () Bool)

(assert (=> b!1572804 m!1446461))

(assert (=> b!1572804 m!1446461))

(declare-fun m!1446463 () Bool)

(assert (=> b!1572804 m!1446463))

(assert (=> b!1572803 m!1446457))

(assert (=> b!1572744 d!164859))

(declare-fun d!164871 () Bool)

(declare-fun lt!674134 () (_ BitVec 32))

(declare-fun lt!674133 () (_ BitVec 32))

(assert (=> d!164871 (= lt!674134 (bvmul (bvxor lt!674133 (bvlshr lt!674133 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164871 (= lt!674133 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164871 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074640 (let ((h!38225 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141605 (bvmul (bvxor h!38225 (bvlshr h!38225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141605 (bvlshr x!141605 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074640 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074640 #b00000000000000000000000000000000))))))

(assert (=> d!164871 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674134 (bvlshr lt!674134 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572744 d!164871))

(declare-fun d!164875 () Bool)

(assert (=> d!164875 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135098 d!164875))

(declare-fun d!164883 () Bool)

(assert (=> d!164883 (= (array_inv!39419 _keys!600) (bvsge (size!51242 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135098 d!164883))

(push 1)

(assert (not b!1572804))

(assert (not d!164859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

