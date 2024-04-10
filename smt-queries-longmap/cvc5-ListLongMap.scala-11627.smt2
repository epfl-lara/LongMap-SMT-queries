; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135642 () Bool)

(assert start!135642)

(declare-fun res!1075946 () Bool)

(declare-fun e!878203 () Bool)

(assert (=> start!135642 (=> (not res!1075946) (not e!878203))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135642 (= res!1075946 (validMask!0 mask!898))))

(assert (=> start!135642 e!878203))

(assert (=> start!135642 true))

(declare-datatypes ((array!105309 0))(
  ( (array!105310 (arr!50800 (Array (_ BitVec 32) (_ BitVec 64))) (size!51350 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105309)

(declare-fun array_inv!39527 (array!105309) Bool)

(assert (=> start!135642 (array_inv!39527 _keys!605)))

(declare-fun b!1574650 () Bool)

(declare-fun res!1075945 () Bool)

(assert (=> b!1574650 (=> (not res!1075945) (not e!878203))))

(assert (=> b!1574650 (= res!1075945 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51350 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574651 () Bool)

(declare-fun res!1075947 () Bool)

(assert (=> b!1574651 (=> (not res!1075947) (not e!878203))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574651 (= res!1075947 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13665 0))(
  ( (MissingZero!13665 (index!57058 (_ BitVec 32))) (Found!13665 (index!57059 (_ BitVec 32))) (Intermediate!13665 (undefined!14477 Bool) (index!57060 (_ BitVec 32)) (x!142007 (_ BitVec 32))) (Undefined!13665) (MissingVacant!13665 (index!57061 (_ BitVec 32))) )
))
(declare-fun lt!674887 () SeekEntryResult!13665)

(declare-fun b!1574652 () Bool)

(assert (=> b!1574652 (= e!878203 (and (is-Intermediate!13665 lt!674887) (not (undefined!14477 lt!674887)) (not (= (select (arr!50800 _keys!605) (index!57060 lt!674887)) k!761)) (not (= (select (arr!50800 _keys!605) (index!57060 lt!674887)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50800 _keys!605) (index!57060 lt!674887)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57060 lt!674887) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674887) (bvadd #b00000000000000000000000000000001 mask!898)) (or (bvsgt (x!142007 lt!674887) #b01111111111111111111111111111110) (bvslt (x!142007 lt!674887) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105309 (_ BitVec 32)) SeekEntryResult!13665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574652 (= lt!674887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135642 res!1075946) b!1574650))

(assert (= (and b!1574650 res!1075945) b!1574651))

(assert (= (and b!1574651 res!1075947) b!1574652))

(declare-fun m!1447885 () Bool)

(assert (=> start!135642 m!1447885))

(declare-fun m!1447887 () Bool)

(assert (=> start!135642 m!1447887))

(declare-fun m!1447889 () Bool)

(assert (=> b!1574651 m!1447889))

(declare-fun m!1447891 () Bool)

(assert (=> b!1574652 m!1447891))

(declare-fun m!1447893 () Bool)

(assert (=> b!1574652 m!1447893))

(assert (=> b!1574652 m!1447893))

(declare-fun m!1447895 () Bool)

(assert (=> b!1574652 m!1447895))

(push 1)

(assert (not b!1574651))

(assert (not b!1574652))

(assert (not start!135642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165255 () Bool)

(assert (=> d!165255 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574651 d!165255))

(declare-fun b!1574689 () Bool)

(declare-fun e!878227 () Bool)

(declare-fun e!878229 () Bool)

(assert (=> b!1574689 (= e!878227 e!878229)))

(declare-fun res!1075974 () Bool)

(declare-fun lt!674898 () SeekEntryResult!13665)

(assert (=> b!1574689 (= res!1075974 (and (is-Intermediate!13665 lt!674898) (not (undefined!14477 lt!674898)) (bvslt (x!142007 lt!674898) #b01111111111111111111111111111110) (bvsge (x!142007 lt!674898) #b00000000000000000000000000000000) (bvsge (x!142007 lt!674898) #b00000000000000000000000000000000)))))

(assert (=> b!1574689 (=> (not res!1075974) (not e!878229))))

(declare-fun b!1574690 () Bool)

(assert (=> b!1574690 (and (bvsge (index!57060 lt!674898) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674898) (size!51350 _keys!605)))))

(declare-fun e!878231 () Bool)

(assert (=> b!1574690 (= e!878231 (= (select (arr!50800 _keys!605) (index!57060 lt!674898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574691 () Bool)

(assert (=> b!1574691 (and (bvsge (index!57060 lt!674898) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674898) (size!51350 _keys!605)))))

(declare-fun res!1075972 () Bool)

(assert (=> b!1574691 (= res!1075972 (= (select (arr!50800 _keys!605) (index!57060 lt!674898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574691 (=> res!1075972 e!878231)))

(declare-fun b!1574692 () Bool)

(declare-fun e!878228 () SeekEntryResult!13665)

(declare-fun e!878230 () SeekEntryResult!13665)

(assert (=> b!1574692 (= e!878228 e!878230)))

(declare-fun c!145620 () Bool)

(declare-fun lt!674899 () (_ BitVec 64))

(assert (=> b!1574692 (= c!145620 (or (= lt!674899 k!761) (= (bvadd lt!674899 lt!674899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574693 () Bool)

(assert (=> b!1574693 (and (bvsge (index!57060 lt!674898) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674898) (size!51350 _keys!605)))))

(declare-fun res!1075973 () Bool)

(assert (=> b!1574693 (= res!1075973 (= (select (arr!50800 _keys!605) (index!57060 lt!674898)) k!761))))

(assert (=> b!1574693 (=> res!1075973 e!878231)))

(assert (=> b!1574693 (= e!878229 e!878231)))

(declare-fun d!165257 () Bool)

(assert (=> d!165257 e!878227))

(declare-fun c!145618 () Bool)

(assert (=> d!165257 (= c!145618 (and (is-Intermediate!13665 lt!674898) (undefined!14477 lt!674898)))))

(assert (=> d!165257 (= lt!674898 e!878228)))

(declare-fun c!145619 () Bool)

(assert (=> d!165257 (= c!145619 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165257 (= lt!674899 (select (arr!50800 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165257 (validMask!0 mask!898)))

(assert (=> d!165257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674898)))

(declare-fun b!1574694 () Bool)

(assert (=> b!1574694 (= e!878228 (Intermediate!13665 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574695 () Bool)

(assert (=> b!1574695 (= e!878230 (Intermediate!13665 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574696 () Bool)

(assert (=> b!1574696 (= e!878227 (bvsge (x!142007 lt!674898) #b01111111111111111111111111111110))))

(declare-fun b!1574697 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574697 (= e!878230 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165257 c!145619) b!1574694))

(assert (= (and d!165257 (not c!145619)) b!1574692))

(assert (= (and b!1574692 c!145620) b!1574695))

(assert (= (and b!1574692 (not c!145620)) b!1574697))

(assert (= (and d!165257 c!145618) b!1574696))

(assert (= (and d!165257 (not c!145618)) b!1574689))

(assert (= (and b!1574689 res!1075974) b!1574693))

(assert (= (and b!1574693 (not res!1075973)) b!1574691))

(assert (= (and b!1574691 (not res!1075972)) b!1574690))

(assert (=> d!165257 m!1447893))

(declare-fun m!1447921 () Bool)

(assert (=> d!165257 m!1447921))

(assert (=> d!165257 m!1447885))

(declare-fun m!1447923 () Bool)

(assert (=> b!1574690 m!1447923))

(assert (=> b!1574691 m!1447923))

(assert (=> b!1574697 m!1447893))

(declare-fun m!1447925 () Bool)

(assert (=> b!1574697 m!1447925))

(assert (=> b!1574697 m!1447925))

(declare-fun m!1447927 () Bool)

(assert (=> b!1574697 m!1447927))

(assert (=> b!1574693 m!1447923))

(assert (=> b!1574652 d!165257))

(declare-fun d!165265 () Bool)

(declare-fun lt!674909 () (_ BitVec 32))

(declare-fun lt!674908 () (_ BitVec 32))

(assert (=> d!165265 (= lt!674909 (bvmul (bvxor lt!674908 (bvlshr lt!674908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165265 (= lt!674908 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165265 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1075975 (let ((h!38252 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142011 (bvmul (bvxor h!38252 (bvlshr h!38252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142011 (bvlshr x!142011 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1075975 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1075975 #b00000000000000000000000000000000))))))

(assert (=> d!165265 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674909 (bvlshr lt!674909 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574652 d!165265))

(declare-fun d!165267 () Bool)

(assert (=> d!165267 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135642 d!165267))

(declare-fun d!165275 () Bool)

(assert (=> d!165275 (= (array_inv!39527 _keys!605) (bvsge (size!51350 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135642 d!165275))

(push 1)

(assert (not d!165257))

(assert (not b!1574697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

