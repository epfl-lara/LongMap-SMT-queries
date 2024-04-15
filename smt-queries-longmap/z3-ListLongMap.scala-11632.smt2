; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135694 () Bool)

(assert start!135694)

(declare-fun res!1076012 () Bool)

(declare-fun e!878186 () Bool)

(assert (=> start!135694 (=> (not res!1076012) (not e!878186))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135694 (= res!1076012 (validMask!0 mask!898))))

(assert (=> start!135694 e!878186))

(assert (=> start!135694 true))

(declare-datatypes ((array!105275 0))(
  ( (array!105276 (arr!50780 (Array (_ BitVec 32) (_ BitVec 64))) (size!51332 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105275)

(declare-fun array_inv!39716 (array!105275) Bool)

(assert (=> start!135694 (array_inv!39716 _keys!605)))

(declare-fun b!1574634 () Bool)

(declare-fun res!1076011 () Bool)

(assert (=> b!1574634 (=> (not res!1076011) (not e!878186))))

(assert (=> b!1574634 (= res!1076011 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51332 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574635 () Bool)

(declare-fun res!1076013 () Bool)

(assert (=> b!1574635 (=> (not res!1076013) (not e!878186))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574635 (= res!1076013 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13680 0))(
  ( (MissingZero!13680 (index!57118 (_ BitVec 32))) (Found!13680 (index!57119 (_ BitVec 32))) (Intermediate!13680 (undefined!14492 Bool) (index!57120 (_ BitVec 32)) (x!142069 (_ BitVec 32))) (Undefined!13680) (MissingVacant!13680 (index!57121 (_ BitVec 32))) )
))
(declare-fun lt!674718 () SeekEntryResult!13680)

(declare-fun b!1574636 () Bool)

(get-info :version)

(assert (=> b!1574636 (= e!878186 (and ((_ is Intermediate!13680) lt!674718) (not (undefined!14492 lt!674718)) (not (= (select (arr!50780 _keys!605) (index!57120 lt!674718)) k0!761)) (not (= (select (arr!50780 _keys!605) (index!57120 lt!674718)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50780 _keys!605) (index!57120 lt!674718)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57120 lt!674718) #b00000000000000000000000000000000) (bvsge (index!57120 lt!674718) (bvadd #b00000000000000000000000000000001 mask!898)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105275 (_ BitVec 32)) SeekEntryResult!13680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574636 (= lt!674718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135694 res!1076012) b!1574634))

(assert (= (and b!1574634 res!1076011) b!1574635))

(assert (= (and b!1574635 res!1076013) b!1574636))

(declare-fun m!1447203 () Bool)

(assert (=> start!135694 m!1447203))

(declare-fun m!1447205 () Bool)

(assert (=> start!135694 m!1447205))

(declare-fun m!1447207 () Bool)

(assert (=> b!1574635 m!1447207))

(declare-fun m!1447209 () Bool)

(assert (=> b!1574636 m!1447209))

(declare-fun m!1447211 () Bool)

(assert (=> b!1574636 m!1447211))

(assert (=> b!1574636 m!1447211))

(declare-fun m!1447213 () Bool)

(assert (=> b!1574636 m!1447213))

(check-sat (not b!1574635) (not b!1574636) (not start!135694))
(check-sat)
(get-model)

(declare-fun d!165083 () Bool)

(assert (=> d!165083 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574635 d!165083))

(declare-fun d!165085 () Bool)

(declare-fun e!878228 () Bool)

(assert (=> d!165085 e!878228))

(declare-fun c!145592 () Bool)

(declare-fun lt!674735 () SeekEntryResult!13680)

(assert (=> d!165085 (= c!145592 (and ((_ is Intermediate!13680) lt!674735) (undefined!14492 lt!674735)))))

(declare-fun e!878224 () SeekEntryResult!13680)

(assert (=> d!165085 (= lt!674735 e!878224)))

(declare-fun c!145594 () Bool)

(assert (=> d!165085 (= c!145594 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674736 () (_ BitVec 64))

(assert (=> d!165085 (= lt!674736 (select (arr!50780 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165085 (validMask!0 mask!898)))

(assert (=> d!165085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!674735)))

(declare-fun b!1574700 () Bool)

(assert (=> b!1574700 (and (bvsge (index!57120 lt!674735) #b00000000000000000000000000000000) (bvslt (index!57120 lt!674735) (size!51332 _keys!605)))))

(declare-fun res!1076048 () Bool)

(assert (=> b!1574700 (= res!1076048 (= (select (arr!50780 _keys!605) (index!57120 lt!674735)) k0!761))))

(declare-fun e!878227 () Bool)

(assert (=> b!1574700 (=> res!1076048 e!878227)))

(declare-fun e!878225 () Bool)

(assert (=> b!1574700 (= e!878225 e!878227)))

(declare-fun b!1574701 () Bool)

(assert (=> b!1574701 (= e!878224 (Intermediate!13680 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574702 () Bool)

(declare-fun e!878226 () SeekEntryResult!13680)

(assert (=> b!1574702 (= e!878226 (Intermediate!13680 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574703 () Bool)

(assert (=> b!1574703 (and (bvsge (index!57120 lt!674735) #b00000000000000000000000000000000) (bvslt (index!57120 lt!674735) (size!51332 _keys!605)))))

(assert (=> b!1574703 (= e!878227 (= (select (arr!50780 _keys!605) (index!57120 lt!674735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574704 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574704 (= e!878226 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1574705 () Bool)

(assert (=> b!1574705 (= e!878228 (bvsge (x!142069 lt!674735) #b01111111111111111111111111111110))))

(declare-fun b!1574706 () Bool)

(assert (=> b!1574706 (= e!878228 e!878225)))

(declare-fun res!1076050 () Bool)

(assert (=> b!1574706 (= res!1076050 (and ((_ is Intermediate!13680) lt!674735) (not (undefined!14492 lt!674735)) (bvslt (x!142069 lt!674735) #b01111111111111111111111111111110) (bvsge (x!142069 lt!674735) #b00000000000000000000000000000000) (bvsge (x!142069 lt!674735) #b00000000000000000000000000000000)))))

(assert (=> b!1574706 (=> (not res!1076050) (not e!878225))))

(declare-fun b!1574707 () Bool)

(assert (=> b!1574707 (= e!878224 e!878226)))

(declare-fun c!145593 () Bool)

(assert (=> b!1574707 (= c!145593 (or (= lt!674736 k0!761) (= (bvadd lt!674736 lt!674736) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574708 () Bool)

(assert (=> b!1574708 (and (bvsge (index!57120 lt!674735) #b00000000000000000000000000000000) (bvslt (index!57120 lt!674735) (size!51332 _keys!605)))))

(declare-fun res!1076049 () Bool)

(assert (=> b!1574708 (= res!1076049 (= (select (arr!50780 _keys!605) (index!57120 lt!674735)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574708 (=> res!1076049 e!878227)))

(assert (= (and d!165085 c!145594) b!1574701))

(assert (= (and d!165085 (not c!145594)) b!1574707))

(assert (= (and b!1574707 c!145593) b!1574702))

(assert (= (and b!1574707 (not c!145593)) b!1574704))

(assert (= (and d!165085 c!145592) b!1574705))

(assert (= (and d!165085 (not c!145592)) b!1574706))

(assert (= (and b!1574706 res!1076050) b!1574700))

(assert (= (and b!1574700 (not res!1076048)) b!1574708))

(assert (= (and b!1574708 (not res!1076049)) b!1574703))

(declare-fun m!1447247 () Bool)

(assert (=> b!1574708 m!1447247))

(assert (=> d!165085 m!1447211))

(declare-fun m!1447249 () Bool)

(assert (=> d!165085 m!1447249))

(assert (=> d!165085 m!1447203))

(assert (=> b!1574700 m!1447247))

(assert (=> b!1574704 m!1447211))

(declare-fun m!1447251 () Bool)

(assert (=> b!1574704 m!1447251))

(assert (=> b!1574704 m!1447251))

(declare-fun m!1447253 () Bool)

(assert (=> b!1574704 m!1447253))

(assert (=> b!1574703 m!1447247))

(assert (=> b!1574636 d!165085))

(declare-fun d!165095 () Bool)

(declare-fun lt!674752 () (_ BitVec 32))

(declare-fun lt!674751 () (_ BitVec 32))

(assert (=> d!165095 (= lt!674752 (bvmul (bvxor lt!674751 (bvlshr lt!674751 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165095 (= lt!674751 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165095 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076051 (let ((h!38301 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142075 (bvmul (bvxor h!38301 (bvlshr h!38301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142075 (bvlshr x!142075 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076051 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076051 #b00000000000000000000000000000000))))))

(assert (=> d!165095 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!674752 (bvlshr lt!674752 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574636 d!165095))

(declare-fun d!165099 () Bool)

(assert (=> d!165099 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135694 d!165099))

(declare-fun d!165107 () Bool)

(assert (=> d!165107 (= (array_inv!39716 _keys!605) (bvsge (size!51332 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135694 d!165107))

(check-sat (not b!1574704) (not d!165085))
(check-sat)
