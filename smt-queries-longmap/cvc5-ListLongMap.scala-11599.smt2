; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135312 () Bool)

(assert start!135312)

(declare-fun b!1573583 () Bool)

(declare-fun e!877504 () Bool)

(declare-fun e!877505 () Bool)

(assert (=> b!1573583 (= e!877504 e!877505)))

(declare-fun res!1075027 () Bool)

(assert (=> b!1573583 (=> (not res!1075027) (not e!877505))))

(declare-fun lt!674478 () Bool)

(declare-datatypes ((SeekEntryResult!13629 0))(
  ( (MissingZero!13629 (index!56914 (_ BitVec 32))) (Found!13629 (index!56915 (_ BitVec 32))) (Intermediate!13629 (undefined!14441 Bool) (index!56916 (_ BitVec 32)) (x!141726 (_ BitVec 32))) (Undefined!13629) (MissingVacant!13629 (index!56917 (_ BitVec 32))) )
))
(declare-fun lt!674477 () SeekEntryResult!13629)

(assert (=> b!1573583 (= res!1075027 (and (or lt!674478 (not (undefined!14441 lt!674477))) (or lt!674478 (undefined!14441 lt!674477))))))

(assert (=> b!1573583 (= lt!674478 (not (is-Intermediate!13629 lt!674477)))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105123 0))(
  ( (array!105124 (arr!50716 (Array (_ BitVec 32) (_ BitVec 64))) (size!51266 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105123)

(declare-fun k!754 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105123 (_ BitVec 32)) SeekEntryResult!13629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573583 (= lt!674477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573582 () Bool)

(declare-fun res!1075029 () Bool)

(assert (=> b!1573582 (=> (not res!1075029) (not e!877504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573582 (= res!1075029 (validKeyInArray!0 k!754))))

(declare-fun b!1573581 () Bool)

(declare-fun res!1075026 () Bool)

(assert (=> b!1573581 (=> (not res!1075026) (not e!877504))))

(assert (=> b!1573581 (= res!1075026 (= (size!51266 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1075028 () Bool)

(assert (=> start!135312 (=> (not res!1075028) (not e!877504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135312 (= res!1075028 (validMask!0 mask!889))))

(assert (=> start!135312 e!877504))

(assert (=> start!135312 true))

(declare-fun array_inv!39443 (array!105123) Bool)

(assert (=> start!135312 (array_inv!39443 _keys!600)))

(declare-fun b!1573584 () Bool)

(declare-fun lt!674479 () SeekEntryResult!13629)

(assert (=> b!1573584 (= e!877505 (and (not (is-MissingVacant!13629 lt!674479)) (is-Found!13629 lt!674479) (or (bvslt (index!56915 lt!674479) #b00000000000000000000000000000000) (bvsge (index!56915 lt!674479) (size!51266 _keys!600)))))))

(declare-fun err!138 () SeekEntryResult!13629)

(assert (=> b!1573584 (= lt!674479 err!138)))

(assert (=> b!1573584 true))

(assert (= (and start!135312 res!1075028) b!1573581))

(assert (= (and b!1573581 res!1075026) b!1573582))

(assert (= (and b!1573582 res!1075029) b!1573583))

(assert (= (and b!1573583 res!1075027) b!1573584))

(declare-fun m!1446937 () Bool)

(assert (=> b!1573583 m!1446937))

(assert (=> b!1573583 m!1446937))

(declare-fun m!1446939 () Bool)

(assert (=> b!1573583 m!1446939))

(declare-fun m!1446941 () Bool)

(assert (=> b!1573582 m!1446941))

(declare-fun m!1446943 () Bool)

(assert (=> start!135312 m!1446943))

(declare-fun m!1446945 () Bool)

(assert (=> start!135312 m!1446945))

(push 1)

(assert (not b!1573583))

(assert (not start!135312))

(assert (not b!1573582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573645 () Bool)

(declare-fun e!877544 () Bool)

(declare-fun e!877545 () Bool)

(assert (=> b!1573645 (= e!877544 e!877545)))

(declare-fun res!1075067 () Bool)

(declare-fun lt!674507 () SeekEntryResult!13629)

(assert (=> b!1573645 (= res!1075067 (and (is-Intermediate!13629 lt!674507) (not (undefined!14441 lt!674507)) (bvslt (x!141726 lt!674507) #b01111111111111111111111111111110) (bvsge (x!141726 lt!674507) #b00000000000000000000000000000000) (bvsge (x!141726 lt!674507) #b00000000000000000000000000000000)))))

(assert (=> b!1573645 (=> (not res!1075067) (not e!877545))))

(declare-fun b!1573646 () Bool)

(declare-fun e!877547 () SeekEntryResult!13629)

(declare-fun e!877546 () SeekEntryResult!13629)

(assert (=> b!1573646 (= e!877547 e!877546)))

(declare-fun c!145544 () Bool)

(declare-fun lt!674506 () (_ BitVec 64))

(assert (=> b!1573646 (= c!145544 (or (= lt!674506 k!754) (= (bvadd lt!674506 lt!674506) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573648 () Bool)

(assert (=> b!1573648 (= e!877544 (bvsge (x!141726 lt!674507) #b01111111111111111111111111111110))))

(declare-fun b!1573649 () Bool)

(assert (=> b!1573649 (and (bvsge (index!56916 lt!674507) #b00000000000000000000000000000000) (bvslt (index!56916 lt!674507) (size!51266 _keys!600)))))

(declare-fun res!1075068 () Bool)

(assert (=> b!1573649 (= res!1075068 (= (select (arr!50716 _keys!600) (index!56916 lt!674507)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877548 () Bool)

(assert (=> b!1573649 (=> res!1075068 e!877548)))

(declare-fun b!1573650 () Bool)

(assert (=> b!1573650 (= e!877547 (Intermediate!13629 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573651 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573651 (= e!877546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573652 () Bool)

(assert (=> b!1573652 (and (bvsge (index!56916 lt!674507) #b00000000000000000000000000000000) (bvslt (index!56916 lt!674507) (size!51266 _keys!600)))))

(declare-fun res!1075066 () Bool)

(assert (=> b!1573652 (= res!1075066 (= (select (arr!50716 _keys!600) (index!56916 lt!674507)) k!754))))

(assert (=> b!1573652 (=> res!1075066 e!877548)))

(assert (=> b!1573652 (= e!877545 e!877548)))

(declare-fun b!1573653 () Bool)

(assert (=> b!1573653 (= e!877546 (Intermediate!13629 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165039 () Bool)

(assert (=> d!165039 e!877544))

(declare-fun c!145545 () Bool)

(assert (=> d!165039 (= c!145545 (and (is-Intermediate!13629 lt!674507) (undefined!14441 lt!674507)))))

(assert (=> d!165039 (= lt!674507 e!877547)))

(declare-fun c!145543 () Bool)

(assert (=> d!165039 (= c!145543 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165039 (= lt!674506 (select (arr!50716 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165039 (validMask!0 mask!889)))

(assert (=> d!165039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674507)))

(declare-fun b!1573647 () Bool)

(assert (=> b!1573647 (and (bvsge (index!56916 lt!674507) #b00000000000000000000000000000000) (bvslt (index!56916 lt!674507) (size!51266 _keys!600)))))

(assert (=> b!1573647 (= e!877548 (= (select (arr!50716 _keys!600) (index!56916 lt!674507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165039 c!145543) b!1573650))

(assert (= (and d!165039 (not c!145543)) b!1573646))

(assert (= (and b!1573646 c!145544) b!1573653))

(assert (= (and b!1573646 (not c!145544)) b!1573651))

(assert (= (and d!165039 c!145545) b!1573648))

(assert (= (and d!165039 (not c!145545)) b!1573645))

(assert (= (and b!1573645 res!1075067) b!1573652))

(assert (= (and b!1573652 (not res!1075066)) b!1573649))

(assert (= (and b!1573649 (not res!1075068)) b!1573647))

(assert (=> b!1573651 m!1446937))

(declare-fun m!1446967 () Bool)

(assert (=> b!1573651 m!1446967))

(assert (=> b!1573651 m!1446967))

(declare-fun m!1446969 () Bool)

(assert (=> b!1573651 m!1446969))

(assert (=> d!165039 m!1446937))

(declare-fun m!1446971 () Bool)

(assert (=> d!165039 m!1446971))

(assert (=> d!165039 m!1446943))

(declare-fun m!1446973 () Bool)

(assert (=> b!1573652 m!1446973))

(assert (=> b!1573647 m!1446973))

(assert (=> b!1573649 m!1446973))

(assert (=> b!1573583 d!165039))

(declare-fun d!165043 () Bool)

(declare-fun lt!674515 () (_ BitVec 32))

(declare-fun lt!674514 () (_ BitVec 32))

(assert (=> d!165043 (= lt!674515 (bvmul (bvxor lt!674514 (bvlshr lt!674514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165043 (= lt!674514 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165043 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075069 (let ((h!38240 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141731 (bvmul (bvxor h!38240 (bvlshr h!38240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141731 (bvlshr x!141731 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075069 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075069 #b00000000000000000000000000000000))))))

(assert (=> d!165043 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674515 (bvlshr lt!674515 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573583 d!165043))

(declare-fun d!165045 () Bool)

(assert (=> d!165045 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135312 d!165045))

(declare-fun d!165053 () Bool)

(assert (=> d!165053 (= (array_inv!39443 _keys!600) (bvsge (size!51266 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135312 d!165053))

(declare-fun d!165055 () Bool)

(assert (=> d!165055 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573582 d!165055))

(push 1)

(assert (not d!165039))

(assert (not b!1573651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

