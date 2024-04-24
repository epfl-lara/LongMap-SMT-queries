; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135444 () Bool)

(assert start!135444)

(declare-fun res!1075272 () Bool)

(declare-fun e!878353 () Bool)

(assert (=> start!135444 (=> (not res!1075272) (not e!878353))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135444 (= res!1075272 (validMask!0 mask!889))))

(assert (=> start!135444 e!878353))

(assert (=> start!135444 true))

(declare-datatypes ((array!105143 0))(
  ( (array!105144 (arr!50728 (Array (_ BitVec 32) (_ BitVec 64))) (size!51279 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105143)

(declare-fun array_inv!39683 (array!105143) Bool)

(assert (=> start!135444 (array_inv!39683 _keys!600)))

(declare-fun b!1574935 () Bool)

(declare-fun res!1075274 () Bool)

(assert (=> b!1574935 (=> (not res!1075274) (not e!878353))))

(assert (=> b!1574935 (= res!1075274 (= (size!51279 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574936 () Bool)

(declare-fun res!1075273 () Bool)

(assert (=> b!1574936 (=> (not res!1075273) (not e!878353))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574936 (= res!1075273 (validKeyInArray!0 k0!754))))

(declare-fun b!1574937 () Bool)

(declare-datatypes ((SeekEntryResult!13535 0))(
  ( (MissingZero!13535 (index!56538 (_ BitVec 32))) (Found!13535 (index!56539 (_ BitVec 32))) (Intermediate!13535 (undefined!14347 Bool) (index!56540 (_ BitVec 32)) (x!141526 (_ BitVec 32))) (Undefined!13535) (MissingVacant!13535 (index!56541 (_ BitVec 32))) )
))
(declare-fun lt!674922 () SeekEntryResult!13535)

(get-info :version)

(assert (=> b!1574937 (= e!878353 (and ((_ is Intermediate!13535) lt!674922) (not (undefined!14347 lt!674922)) (= (select (arr!50728 _keys!600) (index!56540 lt!674922)) k0!754) (or (bvslt (index!56540 lt!674922) #b00000000000000000000000000000000) (bvsge (index!56540 lt!674922) (size!51279 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105143 (_ BitVec 32)) SeekEntryResult!13535)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574937 (= lt!674922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135444 res!1075272) b!1574935))

(assert (= (and b!1574935 res!1075274) b!1574936))

(assert (= (and b!1574936 res!1075273) b!1574937))

(declare-fun m!1448469 () Bool)

(assert (=> start!135444 m!1448469))

(declare-fun m!1448471 () Bool)

(assert (=> start!135444 m!1448471))

(declare-fun m!1448473 () Bool)

(assert (=> b!1574936 m!1448473))

(declare-fun m!1448475 () Bool)

(assert (=> b!1574937 m!1448475))

(declare-fun m!1448477 () Bool)

(assert (=> b!1574937 m!1448477))

(assert (=> b!1574937 m!1448477))

(declare-fun m!1448479 () Bool)

(assert (=> b!1574937 m!1448479))

(check-sat (not start!135444) (not b!1574937) (not b!1574936))
(check-sat)
(get-model)

(declare-fun d!165515 () Bool)

(assert (=> d!165515 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135444 d!165515))

(declare-fun d!165523 () Bool)

(assert (=> d!165523 (= (array_inv!39683 _keys!600) (bvsge (size!51279 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135444 d!165523))

(declare-fun b!1574992 () Bool)

(declare-fun e!878390 () SeekEntryResult!13535)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574992 (= e!878390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1574993 () Bool)

(assert (=> b!1574993 (= e!878390 (Intermediate!13535 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574994 () Bool)

(declare-fun e!878391 () SeekEntryResult!13535)

(assert (=> b!1574994 (= e!878391 (Intermediate!13535 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165525 () Bool)

(declare-fun e!878388 () Bool)

(assert (=> d!165525 e!878388))

(declare-fun c!146101 () Bool)

(declare-fun lt!674938 () SeekEntryResult!13535)

(assert (=> d!165525 (= c!146101 (and ((_ is Intermediate!13535) lt!674938) (undefined!14347 lt!674938)))))

(assert (=> d!165525 (= lt!674938 e!878391)))

(declare-fun c!146100 () Bool)

(assert (=> d!165525 (= c!146100 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674937 () (_ BitVec 64))

(assert (=> d!165525 (= lt!674937 (select (arr!50728 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165525 (validMask!0 mask!889)))

(assert (=> d!165525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674938)))

(declare-fun b!1574995 () Bool)

(assert (=> b!1574995 (= e!878388 (bvsge (x!141526 lt!674938) #b01111111111111111111111111111110))))

(declare-fun b!1574996 () Bool)

(assert (=> b!1574996 (and (bvsge (index!56540 lt!674938) #b00000000000000000000000000000000) (bvslt (index!56540 lt!674938) (size!51279 _keys!600)))))

(declare-fun e!878389 () Bool)

(assert (=> b!1574996 (= e!878389 (= (select (arr!50728 _keys!600) (index!56540 lt!674938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574997 () Bool)

(assert (=> b!1574997 (and (bvsge (index!56540 lt!674938) #b00000000000000000000000000000000) (bvslt (index!56540 lt!674938) (size!51279 _keys!600)))))

(declare-fun res!1075307 () Bool)

(assert (=> b!1574997 (= res!1075307 (= (select (arr!50728 _keys!600) (index!56540 lt!674938)) k0!754))))

(assert (=> b!1574997 (=> res!1075307 e!878389)))

(declare-fun e!878387 () Bool)

(assert (=> b!1574997 (= e!878387 e!878389)))

(declare-fun b!1574998 () Bool)

(assert (=> b!1574998 (= e!878391 e!878390)))

(declare-fun c!146102 () Bool)

(assert (=> b!1574998 (= c!146102 (or (= lt!674937 k0!754) (= (bvadd lt!674937 lt!674937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574999 () Bool)

(assert (=> b!1574999 (= e!878388 e!878387)))

(declare-fun res!1075305 () Bool)

(assert (=> b!1574999 (= res!1075305 (and ((_ is Intermediate!13535) lt!674938) (not (undefined!14347 lt!674938)) (bvslt (x!141526 lt!674938) #b01111111111111111111111111111110) (bvsge (x!141526 lt!674938) #b00000000000000000000000000000000) (bvsge (x!141526 lt!674938) #b00000000000000000000000000000000)))))

(assert (=> b!1574999 (=> (not res!1075305) (not e!878387))))

(declare-fun b!1575000 () Bool)

(assert (=> b!1575000 (and (bvsge (index!56540 lt!674938) #b00000000000000000000000000000000) (bvslt (index!56540 lt!674938) (size!51279 _keys!600)))))

(declare-fun res!1075306 () Bool)

(assert (=> b!1575000 (= res!1075306 (= (select (arr!50728 _keys!600) (index!56540 lt!674938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575000 (=> res!1075306 e!878389)))

(assert (= (and d!165525 c!146100) b!1574994))

(assert (= (and d!165525 (not c!146100)) b!1574998))

(assert (= (and b!1574998 c!146102) b!1574993))

(assert (= (and b!1574998 (not c!146102)) b!1574992))

(assert (= (and d!165525 c!146101) b!1574995))

(assert (= (and d!165525 (not c!146101)) b!1574999))

(assert (= (and b!1574999 res!1075305) b!1574997))

(assert (= (and b!1574997 (not res!1075307)) b!1575000))

(assert (= (and b!1575000 (not res!1075306)) b!1574996))

(declare-fun m!1448505 () Bool)

(assert (=> b!1574996 m!1448505))

(assert (=> b!1574992 m!1448477))

(declare-fun m!1448507 () Bool)

(assert (=> b!1574992 m!1448507))

(assert (=> b!1574992 m!1448507))

(declare-fun m!1448509 () Bool)

(assert (=> b!1574992 m!1448509))

(assert (=> d!165525 m!1448477))

(declare-fun m!1448511 () Bool)

(assert (=> d!165525 m!1448511))

(assert (=> d!165525 m!1448469))

(assert (=> b!1575000 m!1448505))

(assert (=> b!1574997 m!1448505))

(assert (=> b!1574937 d!165525))

(declare-fun d!165535 () Bool)

(declare-fun lt!674950 () (_ BitVec 32))

(declare-fun lt!674949 () (_ BitVec 32))

(assert (=> d!165535 (= lt!674950 (bvmul (bvxor lt!674949 (bvlshr lt!674949 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165535 (= lt!674949 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165535 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075308 (let ((h!38272 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141531 (bvmul (bvxor h!38272 (bvlshr h!38272 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141531 (bvlshr x!141531 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075308 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075308 #b00000000000000000000000000000000))))))

(assert (=> d!165535 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674950 (bvlshr lt!674950 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1574937 d!165535))

(declare-fun d!165539 () Bool)

(assert (=> d!165539 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574936 d!165539))

(check-sat (not b!1574992) (not d!165525))
(check-sat)
