; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47076 () Bool)

(assert start!47076)

(declare-fun b!518800 () Bool)

(declare-fun e!302715 () Bool)

(assert (=> b!518800 (= e!302715 false)))

(declare-fun b!518801 () Bool)

(declare-fun res!317593 () Bool)

(declare-fun e!302713 () Bool)

(assert (=> b!518801 (=> (not res!317593) (not e!302713))))

(declare-datatypes ((array!33154 0))(
  ( (array!33155 (arr!15939 (Array (_ BitVec 32) (_ BitVec 64))) (size!16303 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33154)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518801 (= res!317593 (validKeyInArray!0 (select (arr!15939 a!3235) j!176)))))

(declare-fun b!518802 () Bool)

(declare-fun e!302710 () Bool)

(declare-datatypes ((SeekEntryResult!4406 0))(
  ( (MissingZero!4406 (index!19815 (_ BitVec 32))) (Found!4406 (index!19816 (_ BitVec 32))) (Intermediate!4406 (undefined!5218 Bool) (index!19817 (_ BitVec 32)) (x!48788 (_ BitVec 32))) (Undefined!4406) (MissingVacant!4406 (index!19818 (_ BitVec 32))) )
))
(declare-fun lt!237535 () SeekEntryResult!4406)

(assert (=> b!518802 (= e!302710 (or (= (select (arr!15939 a!3235) (index!19817 lt!237535)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19817 lt!237535) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237535) (size!16303 a!3235)))))))

(declare-datatypes ((Unit!16076 0))(
  ( (Unit!16077) )
))
(declare-fun lt!237528 () Unit!16076)

(declare-fun e!302712 () Unit!16076)

(assert (=> b!518802 (= lt!237528 e!302712)))

(declare-fun c!60899 () Bool)

(assert (=> b!518802 (= c!60899 (= (select (arr!15939 a!3235) (index!19817 lt!237535)) (select (arr!15939 a!3235) j!176)))))

(assert (=> b!518802 (and (bvslt (x!48788 lt!237535) #b01111111111111111111111111111110) (or (= (select (arr!15939 a!3235) (index!19817 lt!237535)) (select (arr!15939 a!3235) j!176)) (= (select (arr!15939 a!3235) (index!19817 lt!237535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15939 a!3235) (index!19817 lt!237535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518803 () Bool)

(declare-fun res!317603 () Bool)

(assert (=> b!518803 (=> (not res!317603) (not e!302713))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!518803 (= res!317603 (validKeyInArray!0 k!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!302711 () Bool)

(declare-fun b!518804 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33154 (_ BitVec 32)) SeekEntryResult!4406)

(assert (=> b!518804 (= e!302711 (= (seekEntryOrOpen!0 (select (arr!15939 a!3235) j!176) a!3235 mask!3524) (Found!4406 j!176)))))

(declare-fun b!518805 () Bool)

(declare-fun Unit!16078 () Unit!16076)

(assert (=> b!518805 (= e!302712 Unit!16078)))

(declare-fun lt!237533 () Unit!16076)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237527 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33154 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16076)

(assert (=> b!518805 (= lt!237533 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237527 #b00000000000000000000000000000000 (index!19817 lt!237535) (x!48788 lt!237535) mask!3524))))

(declare-fun res!317599 () Bool)

(declare-fun lt!237534 () (_ BitVec 64))

(declare-fun lt!237530 () array!33154)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33154 (_ BitVec 32)) SeekEntryResult!4406)

(assert (=> b!518805 (= res!317599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237527 lt!237534 lt!237530 mask!3524) (Intermediate!4406 false (index!19817 lt!237535) (x!48788 lt!237535))))))

(assert (=> b!518805 (=> (not res!317599) (not e!302715))))

(assert (=> b!518805 e!302715))

(declare-fun b!518806 () Bool)

(declare-fun res!317601 () Bool)

(assert (=> b!518806 (=> (not res!317601) (not e!302713))))

(declare-fun arrayContainsKey!0 (array!33154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518806 (= res!317601 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518808 () Bool)

(declare-fun res!317594 () Bool)

(declare-fun e!302709 () Bool)

(assert (=> b!518808 (=> (not res!317594) (not e!302709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33154 (_ BitVec 32)) Bool)

(assert (=> b!518808 (= res!317594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518809 () Bool)

(declare-fun res!317595 () Bool)

(assert (=> b!518809 (=> (not res!317595) (not e!302709))))

(declare-datatypes ((List!10097 0))(
  ( (Nil!10094) (Cons!10093 (h!11003 (_ BitVec 64)) (t!16325 List!10097)) )
))
(declare-fun arrayNoDuplicates!0 (array!33154 (_ BitVec 32) List!10097) Bool)

(assert (=> b!518809 (= res!317595 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10094))))

(declare-fun b!518810 () Bool)

(declare-fun res!317602 () Bool)

(assert (=> b!518810 (=> (not res!317602) (not e!302713))))

(assert (=> b!518810 (= res!317602 (and (= (size!16303 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16303 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16303 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518811 () Bool)

(declare-fun Unit!16079 () Unit!16076)

(assert (=> b!518811 (= e!302712 Unit!16079)))

(declare-fun b!518812 () Bool)

(assert (=> b!518812 (= e!302709 (not e!302710))))

(declare-fun res!317598 () Bool)

(assert (=> b!518812 (=> res!317598 e!302710)))

(declare-fun lt!237529 () (_ BitVec 32))

(assert (=> b!518812 (= res!317598 (= lt!237535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237529 lt!237534 lt!237530 mask!3524)))))

(assert (=> b!518812 (= lt!237535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237527 (select (arr!15939 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518812 (= lt!237529 (toIndex!0 lt!237534 mask!3524))))

(assert (=> b!518812 (= lt!237534 (select (store (arr!15939 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518812 (= lt!237527 (toIndex!0 (select (arr!15939 a!3235) j!176) mask!3524))))

(assert (=> b!518812 (= lt!237530 (array!33155 (store (arr!15939 a!3235) i!1204 k!2280) (size!16303 a!3235)))))

(assert (=> b!518812 e!302711))

(declare-fun res!317596 () Bool)

(assert (=> b!518812 (=> (not res!317596) (not e!302711))))

(assert (=> b!518812 (= res!317596 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237531 () Unit!16076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16076)

(assert (=> b!518812 (= lt!237531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518813 () Bool)

(assert (=> b!518813 (= e!302713 e!302709)))

(declare-fun res!317592 () Bool)

(assert (=> b!518813 (=> (not res!317592) (not e!302709))))

(declare-fun lt!237532 () SeekEntryResult!4406)

(assert (=> b!518813 (= res!317592 (or (= lt!237532 (MissingZero!4406 i!1204)) (= lt!237532 (MissingVacant!4406 i!1204))))))

(assert (=> b!518813 (= lt!237532 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518807 () Bool)

(declare-fun res!317597 () Bool)

(assert (=> b!518807 (=> res!317597 e!302710)))

(assert (=> b!518807 (= res!317597 (or (undefined!5218 lt!237535) (not (is-Intermediate!4406 lt!237535))))))

(declare-fun res!317600 () Bool)

(assert (=> start!47076 (=> (not res!317600) (not e!302713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47076 (= res!317600 (validMask!0 mask!3524))))

(assert (=> start!47076 e!302713))

(assert (=> start!47076 true))

(declare-fun array_inv!11735 (array!33154) Bool)

(assert (=> start!47076 (array_inv!11735 a!3235)))

(assert (= (and start!47076 res!317600) b!518810))

(assert (= (and b!518810 res!317602) b!518801))

(assert (= (and b!518801 res!317593) b!518803))

(assert (= (and b!518803 res!317603) b!518806))

(assert (= (and b!518806 res!317601) b!518813))

(assert (= (and b!518813 res!317592) b!518808))

(assert (= (and b!518808 res!317594) b!518809))

(assert (= (and b!518809 res!317595) b!518812))

(assert (= (and b!518812 res!317596) b!518804))

(assert (= (and b!518812 (not res!317598)) b!518807))

(assert (= (and b!518807 (not res!317597)) b!518802))

(assert (= (and b!518802 c!60899) b!518805))

(assert (= (and b!518802 (not c!60899)) b!518811))

(assert (= (and b!518805 res!317599) b!518800))

(declare-fun m!500085 () Bool)

(assert (=> b!518808 m!500085))

(declare-fun m!500087 () Bool)

(assert (=> b!518805 m!500087))

(declare-fun m!500089 () Bool)

(assert (=> b!518805 m!500089))

(declare-fun m!500091 () Bool)

(assert (=> b!518812 m!500091))

(declare-fun m!500093 () Bool)

(assert (=> b!518812 m!500093))

(declare-fun m!500095 () Bool)

(assert (=> b!518812 m!500095))

(declare-fun m!500097 () Bool)

(assert (=> b!518812 m!500097))

(assert (=> b!518812 m!500095))

(declare-fun m!500099 () Bool)

(assert (=> b!518812 m!500099))

(declare-fun m!500101 () Bool)

(assert (=> b!518812 m!500101))

(assert (=> b!518812 m!500095))

(declare-fun m!500103 () Bool)

(assert (=> b!518812 m!500103))

(declare-fun m!500105 () Bool)

(assert (=> b!518812 m!500105))

(declare-fun m!500107 () Bool)

(assert (=> b!518812 m!500107))

(declare-fun m!500109 () Bool)

(assert (=> start!47076 m!500109))

(declare-fun m!500111 () Bool)

(assert (=> start!47076 m!500111))

(assert (=> b!518801 m!500095))

(assert (=> b!518801 m!500095))

(declare-fun m!500113 () Bool)

(assert (=> b!518801 m!500113))

(declare-fun m!500115 () Bool)

(assert (=> b!518806 m!500115))

(declare-fun m!500117 () Bool)

(assert (=> b!518802 m!500117))

(assert (=> b!518802 m!500095))

(declare-fun m!500119 () Bool)

(assert (=> b!518813 m!500119))

(declare-fun m!500121 () Bool)

(assert (=> b!518809 m!500121))

(declare-fun m!500123 () Bool)

(assert (=> b!518803 m!500123))

(assert (=> b!518804 m!500095))

(assert (=> b!518804 m!500095))

(declare-fun m!500125 () Bool)

(assert (=> b!518804 m!500125))

(push 1)

(assert (not b!518805))

(assert (not b!518809))

(assert (not b!518806))

(assert (not b!518813))

(assert (not b!518812))

(assert (not start!47076))

(assert (not b!518803))

(assert (not b!518801))

(assert (not b!518804))

(assert (not b!518808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79979 () Bool)

(assert (=> d!79979 (= (validKeyInArray!0 (select (arr!15939 a!3235) j!176)) (and (not (= (select (arr!15939 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15939 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518801 d!79979))

(declare-fun b!518988 () Bool)

(declare-fun e!302815 () SeekEntryResult!4406)

(declare-fun e!302814 () SeekEntryResult!4406)

(assert (=> b!518988 (= e!302815 e!302814)))

(declare-fun c!60938 () Bool)

(declare-fun lt!237626 () (_ BitVec 64))

(assert (=> b!518988 (= c!60938 (or (= lt!237626 lt!237534) (= (bvadd lt!237626 lt!237626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518989 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518989 (= e!302814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237529 #b00000000000000000000000000000000 mask!3524) lt!237534 lt!237530 mask!3524))))

(declare-fun b!518990 () Bool)

(declare-fun lt!237627 () SeekEntryResult!4406)

(assert (=> b!518990 (and (bvsge (index!19817 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237627) (size!16303 lt!237530)))))

(declare-fun e!302813 () Bool)

(assert (=> b!518990 (= e!302813 (= (select (arr!15939 lt!237530) (index!19817 lt!237627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518991 () Bool)

(assert (=> b!518991 (and (bvsge (index!19817 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237627) (size!16303 lt!237530)))))

(declare-fun res!317709 () Bool)

(assert (=> b!518991 (= res!317709 (= (select (arr!15939 lt!237530) (index!19817 lt!237627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518991 (=> res!317709 e!302813)))

(declare-fun b!518992 () Bool)

(assert (=> b!518992 (= e!302815 (Intermediate!4406 true lt!237529 #b00000000000000000000000000000000))))

(declare-fun b!518993 () Bool)

(assert (=> b!518993 (and (bvsge (index!19817 lt!237627) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237627) (size!16303 lt!237530)))))

(declare-fun res!317707 () Bool)

(assert (=> b!518993 (= res!317707 (= (select (arr!15939 lt!237530) (index!19817 lt!237627)) lt!237534))))

(assert (=> b!518993 (=> res!317707 e!302813)))

(declare-fun e!302816 () Bool)

(assert (=> b!518993 (= e!302816 e!302813)))

(declare-fun b!518994 () Bool)

(declare-fun e!302817 () Bool)

(assert (=> b!518994 (= e!302817 e!302816)))

(declare-fun res!317708 () Bool)

(assert (=> b!518994 (= res!317708 (and (is-Intermediate!4406 lt!237627) (not (undefined!5218 lt!237627)) (bvslt (x!48788 lt!237627) #b01111111111111111111111111111110) (bvsge (x!48788 lt!237627) #b00000000000000000000000000000000) (bvsge (x!48788 lt!237627) #b00000000000000000000000000000000)))))

(assert (=> b!518994 (=> (not res!317708) (not e!302816))))

(declare-fun d!79981 () Bool)

(assert (=> d!79981 e!302817))

(declare-fun c!60936 () Bool)

(assert (=> d!79981 (= c!60936 (and (is-Intermediate!4406 lt!237627) (undefined!5218 lt!237627)))))

(assert (=> d!79981 (= lt!237627 e!302815)))

(declare-fun c!60937 () Bool)

(assert (=> d!79981 (= c!60937 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79981 (= lt!237626 (select (arr!15939 lt!237530) lt!237529))))

(assert (=> d!79981 (validMask!0 mask!3524)))

(assert (=> d!79981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237529 lt!237534 lt!237530 mask!3524) lt!237627)))

(declare-fun b!518995 () Bool)

(assert (=> b!518995 (= e!302817 (bvsge (x!48788 lt!237627) #b01111111111111111111111111111110))))

(declare-fun b!518996 () Bool)

(assert (=> b!518996 (= e!302814 (Intermediate!4406 false lt!237529 #b00000000000000000000000000000000))))

(assert (= (and d!79981 c!60937) b!518992))

(assert (= (and d!79981 (not c!60937)) b!518988))

(assert (= (and b!518988 c!60938) b!518996))

(assert (= (and b!518988 (not c!60938)) b!518989))

(assert (= (and d!79981 c!60936) b!518995))

(assert (= (and d!79981 (not c!60936)) b!518994))

(assert (= (and b!518994 res!317708) b!518993))

(assert (= (and b!518993 (not res!317707)) b!518991))

(assert (= (and b!518991 (not res!317709)) b!518990))

(declare-fun m!500247 () Bool)

(assert (=> b!518989 m!500247))

(assert (=> b!518989 m!500247))

(declare-fun m!500249 () Bool)

(assert (=> b!518989 m!500249))

(declare-fun m!500251 () Bool)

(assert (=> d!79981 m!500251))

(assert (=> d!79981 m!500109))

(declare-fun m!500253 () Bool)

(assert (=> b!518991 m!500253))

(assert (=> b!518990 m!500253))

(assert (=> b!518993 m!500253))

(assert (=> b!518812 d!79981))

(declare-fun d!79995 () Bool)

(declare-fun lt!237644 () (_ BitVec 32))

(declare-fun lt!237643 () (_ BitVec 32))

(assert (=> d!79995 (= lt!237644 (bvmul (bvxor lt!237643 (bvlshr lt!237643 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79995 (= lt!237643 ((_ extract 31 0) (bvand (bvxor lt!237534 (bvlshr lt!237534 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79995 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317713 (let ((h!11007 ((_ extract 31 0) (bvand (bvxor lt!237534 (bvlshr lt!237534 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48794 (bvmul (bvxor h!11007 (bvlshr h!11007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48794 (bvlshr x!48794 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317713 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317713 #b00000000000000000000000000000000))))))

(assert (=> d!79995 (= (toIndex!0 lt!237534 mask!3524) (bvand (bvxor lt!237644 (bvlshr lt!237644 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518812 d!79995))

(declare-fun d!80003 () Bool)

(declare-fun lt!237646 () (_ BitVec 32))

(declare-fun lt!237645 () (_ BitVec 32))

(assert (=> d!80003 (= lt!237646 (bvmul (bvxor lt!237645 (bvlshr lt!237645 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80003 (= lt!237645 ((_ extract 31 0) (bvand (bvxor (select (arr!15939 a!3235) j!176) (bvlshr (select (arr!15939 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80003 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317713 (let ((h!11007 ((_ extract 31 0) (bvand (bvxor (select (arr!15939 a!3235) j!176) (bvlshr (select (arr!15939 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48794 (bvmul (bvxor h!11007 (bvlshr h!11007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48794 (bvlshr x!48794 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317713 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317713 #b00000000000000000000000000000000))))))

(assert (=> d!80003 (= (toIndex!0 (select (arr!15939 a!3235) j!176) mask!3524) (bvand (bvxor lt!237646 (bvlshr lt!237646 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518812 d!80003))

(declare-fun call!31737 () Bool)

(declare-fun bm!31734 () Bool)

(assert (=> bm!31734 (= call!31737 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519077 () Bool)

(declare-fun e!302874 () Bool)

(declare-fun e!302875 () Bool)

(assert (=> b!519077 (= e!302874 e!302875)))

(declare-fun c!60963 () Bool)

(assert (=> b!519077 (= c!60963 (validKeyInArray!0 (select (arr!15939 a!3235) j!176)))))

(declare-fun b!519078 () Bool)

(declare-fun e!302873 () Bool)

(assert (=> b!519078 (= e!302875 e!302873)))

(declare-fun lt!237667 () (_ BitVec 64))

(assert (=> b!519078 (= lt!237667 (select (arr!15939 a!3235) j!176))))

(declare-fun lt!237669 () Unit!16076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33154 (_ BitVec 64) (_ BitVec 32)) Unit!16076)

(assert (=> b!519078 (= lt!237669 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237667 j!176))))

(assert (=> b!519078 (arrayContainsKey!0 a!3235 lt!237667 #b00000000000000000000000000000000)))

(declare-fun lt!237668 () Unit!16076)

(assert (=> b!519078 (= lt!237668 lt!237669)))

(declare-fun res!317743 () Bool)

(assert (=> b!519078 (= res!317743 (= (seekEntryOrOpen!0 (select (arr!15939 a!3235) j!176) a!3235 mask!3524) (Found!4406 j!176)))))

(assert (=> b!519078 (=> (not res!317743) (not e!302873))))

(declare-fun b!519079 () Bool)

(assert (=> b!519079 (= e!302875 call!31737)))

(declare-fun b!519080 () Bool)

(assert (=> b!519080 (= e!302873 call!31737)))

(declare-fun d!80005 () Bool)

(declare-fun res!317744 () Bool)

(assert (=> d!80005 (=> res!317744 e!302874)))

(assert (=> d!80005 (= res!317744 (bvsge j!176 (size!16303 a!3235)))))

(assert (=> d!80005 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302874)))

(assert (= (and d!80005 (not res!317744)) b!519077))

(assert (= (and b!519077 c!60963) b!519078))

(assert (= (and b!519077 (not c!60963)) b!519079))

(assert (= (and b!519078 res!317743) b!519080))

(assert (= (or b!519080 b!519079) bm!31734))

(declare-fun m!500323 () Bool)

(assert (=> bm!31734 m!500323))

(assert (=> b!519077 m!500095))

(assert (=> b!519077 m!500095))

(assert (=> b!519077 m!500113))

(assert (=> b!519078 m!500095))

(declare-fun m!500325 () Bool)

(assert (=> b!519078 m!500325))

(declare-fun m!500327 () Bool)

(assert (=> b!519078 m!500327))

(assert (=> b!519078 m!500095))

(assert (=> b!519078 m!500125))

(assert (=> b!518812 d!80005))

(declare-fun b!519081 () Bool)

(declare-fun e!302878 () SeekEntryResult!4406)

(declare-fun e!302877 () SeekEntryResult!4406)

(assert (=> b!519081 (= e!302878 e!302877)))

(declare-fun lt!237670 () (_ BitVec 64))

(declare-fun c!60966 () Bool)

(assert (=> b!519081 (= c!60966 (or (= lt!237670 (select (arr!15939 a!3235) j!176)) (= (bvadd lt!237670 lt!237670) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519082 () Bool)

(assert (=> b!519082 (= e!302877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237527 #b00000000000000000000000000000000 mask!3524) (select (arr!15939 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519083 () Bool)

(declare-fun lt!237671 () SeekEntryResult!4406)

(assert (=> b!519083 (and (bvsge (index!19817 lt!237671) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237671) (size!16303 a!3235)))))

(declare-fun e!302876 () Bool)

(assert (=> b!519083 (= e!302876 (= (select (arr!15939 a!3235) (index!19817 lt!237671)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519084 () Bool)

(assert (=> b!519084 (and (bvsge (index!19817 lt!237671) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237671) (size!16303 a!3235)))))

(declare-fun res!317747 () Bool)

(assert (=> b!519084 (= res!317747 (= (select (arr!15939 a!3235) (index!19817 lt!237671)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519084 (=> res!317747 e!302876)))

(declare-fun b!519085 () Bool)

(assert (=> b!519085 (= e!302878 (Intermediate!4406 true lt!237527 #b00000000000000000000000000000000))))

(declare-fun b!519086 () Bool)

(assert (=> b!519086 (and (bvsge (index!19817 lt!237671) #b00000000000000000000000000000000) (bvslt (index!19817 lt!237671) (size!16303 a!3235)))))

(declare-fun res!317745 () Bool)

(assert (=> b!519086 (= res!317745 (= (select (arr!15939 a!3235) (index!19817 lt!237671)) (select (arr!15939 a!3235) j!176)))))

(assert (=> b!519086 (=> res!317745 e!302876)))

(declare-fun e!302879 () Bool)

(assert (=> b!519086 (= e!302879 e!302876)))

(declare-fun b!519087 () Bool)

(declare-fun e!302880 () Bool)

(assert (=> b!519087 (= e!302880 e!302879)))

(declare-fun res!317746 () Bool)

(assert (=> b!519087 (= res!317746 (and (is-Intermediate!4406 lt!237671) (not (undefined!5218 lt!237671)) (bvslt (x!48788 lt!237671) #b01111111111111111111111111111110) (bvsge (x!48788 lt!237671) #b00000000000000000000000000000000) (bvsge (x!48788 lt!237671) #b00000000000000000000000000000000)))))

(assert (=> b!519087 (=> (not res!317746) (not e!302879))))

(declare-fun d!80019 () Bool)

(assert (=> d!80019 e!302880))

(declare-fun c!60964 () Bool)

(assert (=> d!80019 (= c!60964 (and (is-Intermediate!4406 lt!237671) (undefined!5218 lt!237671)))))

(assert (=> d!80019 (= lt!237671 e!302878)))

(declare-fun c!60965 () Bool)

(assert (=> d!80019 (= c!60965 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80019 (= lt!237670 (select (arr!15939 a!3235) lt!237527))))

(assert (=> d!80019 (validMask!0 mask!3524)))

(assert (=> d!80019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237527 (select (arr!15939 a!3235) j!176) a!3235 mask!3524) lt!237671)))

(declare-fun b!519088 () Bool)

(assert (=> b!519088 (= e!302880 (bvsge (x!48788 lt!237671) #b01111111111111111111111111111110))))

(declare-fun b!519089 () Bool)

(assert (=> b!519089 (= e!302877 (Intermediate!4406 false lt!237527 #b00000000000000000000000000000000))))

(assert (= (and d!80019 c!60965) b!519085))

(assert (= (and d!80019 (not c!60965)) b!519081))

(assert (= (and b!519081 c!60966) b!519089))

(assert (= (and b!519081 (not c!60966)) b!519082))

(assert (= (and d!80019 c!60964) b!519088))

(assert (= (and d!80019 (not c!60964)) b!519087))

(assert (= (and b!519087 res!317746) b!519086))

(assert (= (and b!519086 (not res!317745)) b!519084))

(assert (= (and b!519084 (not res!317747)) b!519083))

(declare-fun m!500333 () Bool)

(assert (=> b!519082 m!500333))

(assert (=> b!519082 m!500333))

(assert (=> b!519082 m!500095))

(declare-fun m!500335 () Bool)

(assert (=> b!519082 m!500335))

(declare-fun m!500337 () Bool)

(assert (=> d!80019 m!500337))

(assert (=> d!80019 m!500109))

(declare-fun m!500341 () Bool)

(assert (=> b!519084 m!500341))

(assert (=> b!519083 m!500341))

(assert (=> b!519086 m!500341))

(assert (=> b!518812 d!80019))

(declare-fun d!80023 () Bool)

(assert (=> d!80023 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237683 () Unit!16076)

(declare-fun choose!38 (array!33154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16076)

(assert (=> d!80023 (= lt!237683 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80023 (validMask!0 mask!3524)))

(assert (=> d!80023 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237683)))

(declare-fun bs!16367 () Bool)

(assert (= bs!16367 d!80023))

(assert (=> bs!16367 m!500099))

(declare-fun m!500347 () Bool)

(assert (=> bs!16367 m!500347))

(assert (=> bs!16367 m!500109))

(assert (=> b!518812 d!80023))

(declare-fun d!80025 () Bool)

(assert (=> d!80025 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47076 d!80025))

(declare-fun d!80029 () Bool)

(assert (=> d!80029 (= (array_inv!11735 a!3235) (bvsge (size!16303 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47076 d!80029))

(declare-fun d!80031 () Bool)

(assert (=> d!80031 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518803 d!80031))

(declare-fun d!80033 () Bool)

(declare-fun lt!237700 () SeekEntryResult!4406)

(assert (=> d!80033 (and (or (is-Undefined!4406 lt!237700) (not (is-Found!4406 lt!237700)) (and (bvsge (index!19816 lt!237700) #b00000000000000000000000000000000) (bvslt (index!19816 lt!237700) (size!16303 a!3235)))) (or (is-Undefined!4406 lt!237700) (is-Found!4406 lt!237700) (not (is-MissingZero!4406 lt!237700)) (and (bvsge (index!19815 lt!237700) #b00000000000000000000000000000000) (bvslt (index!19815 lt!237700) (size!16303 a!3235)))) (or (is-Undefined!4406 lt!237700) (is-Found!4406 lt!237700) (is-MissingZero!4406 lt!237700) (not (is-MissingVacant!4406 lt!237700)) (and (bvsge (index!19818 lt!237700) #b00000000000000000000000000000000) (bvslt (index!19818 lt!237700) (size!16303 a!3235)))) (or (is-Undefined!4406 lt!237700) (ite (is-Found!4406 lt!237700) (= (select (arr!15939 a!3235) (index!19816 lt!237700)) k!2280) (ite (is-MissingZero!4406 lt!237700) (= (select (arr!15939 a!3235) (index!19815 lt!237700)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4406 lt!237700) (= (select (arr!15939 a!3235) (index!19818 lt!237700)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302915 () SeekEntryResult!4406)

(assert (=> d!80033 (= lt!237700 e!302915)))

(declare-fun c!60985 () Bool)

(declare-fun lt!237701 () SeekEntryResult!4406)

(assert (=> d!80033 (= c!60985 (and (is-Intermediate!4406 lt!237701) (undefined!5218 lt!237701)))))

(assert (=> d!80033 (= lt!237701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80033 (validMask!0 mask!3524)))

(assert (=> d!80033 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237700)))

(declare-fun b!519145 () Bool)

(declare-fun e!302916 () SeekEntryResult!4406)

(assert (=> b!519145 (= e!302916 (Found!4406 (index!19817 lt!237701)))))

(declare-fun b!519146 () Bool)

(assert (=> b!519146 (= e!302915 Undefined!4406)))

(declare-fun b!519147 () Bool)

(declare-fun e!302917 () SeekEntryResult!4406)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33154 (_ BitVec 32)) SeekEntryResult!4406)

(assert (=> b!519147 (= e!302917 (seekKeyOrZeroReturnVacant!0 (x!48788 lt!237701) (index!19817 lt!237701) (index!19817 lt!237701) k!2280 a!3235 mask!3524))))

(declare-fun b!519148 () Bool)

(assert (=> b!519148 (= e!302917 (MissingZero!4406 (index!19817 lt!237701)))))

(declare-fun b!519149 () Bool)

(declare-fun c!60987 () Bool)

(declare-fun lt!237702 () (_ BitVec 64))

(assert (=> b!519149 (= c!60987 (= lt!237702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519149 (= e!302916 e!302917)))

(declare-fun b!519150 () Bool)

(assert (=> b!519150 (= e!302915 e!302916)))

(assert (=> b!519150 (= lt!237702 (select (arr!15939 a!3235) (index!19817 lt!237701)))))

(declare-fun c!60986 () Bool)

(assert (=> b!519150 (= c!60986 (= lt!237702 k!2280))))

(assert (= (and d!80033 c!60985) b!519146))

(assert (= (and d!80033 (not c!60985)) b!519150))

(assert (= (and b!519150 c!60986) b!519145))

(assert (= (and b!519150 (not c!60986)) b!519149))

(assert (= (and b!519149 c!60987) b!519148))

(assert (= (and b!519149 (not c!60987)) b!519147))

(declare-fun m!500361 () Bool)

(assert (=> d!80033 m!500361))

(declare-fun m!500363 () Bool)

(assert (=> d!80033 m!500363))

(declare-fun m!500365 () Bool)

(assert (=> d!80033 m!500365))

(declare-fun m!500367 () Bool)

(assert (=> d!80033 m!500367))

(assert (=> d!80033 m!500363))

(assert (=> d!80033 m!500109))

(declare-fun m!500369 () Bool)

(assert (=> d!80033 m!500369))

(declare-fun m!500371 () Bool)

(assert (=> b!519147 m!500371))

(declare-fun m!500373 () Bool)

(assert (=> b!519150 m!500373))

(assert (=> b!518813 d!80033))

(declare-fun bm!31738 () Bool)

(declare-fun call!31741 () Bool)

(assert (=> bm!31738 (= call!31741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519151 () Bool)

(declare-fun e!302919 () Bool)

(declare-fun e!302920 () Bool)

(assert (=> b!519151 (= e!302919 e!302920)))

(declare-fun c!60988 () Bool)

(assert (=> b!519151 (= c!60988 (validKeyInArray!0 (select (arr!15939 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519152 () Bool)

(declare-fun e!302918 () Bool)

(assert (=> b!519152 (= e!302920 e!302918)))

(declare-fun lt!237703 () (_ BitVec 64))

(assert (=> b!519152 (= lt!237703 (select (arr!15939 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237705 () Unit!16076)

(assert (=> b!519152 (= lt!237705 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237703 #b00000000000000000000000000000000))))

(assert (=> b!519152 (arrayContainsKey!0 a!3235 lt!237703 #b00000000000000000000000000000000)))

(declare-fun lt!237704 () Unit!16076)

(assert (=> b!519152 (= lt!237704 lt!237705)))

(declare-fun res!317767 () Bool)

(assert (=> b!519152 (= res!317767 (= (seekEntryOrOpen!0 (select (arr!15939 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4406 #b00000000000000000000000000000000)))))

(assert (=> b!519152 (=> (not res!317767) (not e!302918))))

(declare-fun b!519153 () Bool)

(assert (=> b!519153 (= e!302920 call!31741)))

(declare-fun b!519154 () Bool)

(assert (=> b!519154 (= e!302918 call!31741)))

(declare-fun d!80037 () Bool)

(declare-fun res!317768 () Bool)

(assert (=> d!80037 (=> res!317768 e!302919)))

(assert (=> d!80037 (= res!317768 (bvsge #b00000000000000000000000000000000 (size!16303 a!3235)))))

(assert (=> d!80037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302919)))

(assert (= (and d!80037 (not res!317768)) b!519151))

(assert (= (and b!519151 c!60988) b!519152))

(assert (= (and b!519151 (not c!60988)) b!519153))

(assert (= (and b!519152 res!317767) b!519154))

(assert (= (or b!519154 b!519153) bm!31738))

(declare-fun m!500375 () Bool)

(assert (=> bm!31738 m!500375))

(declare-fun m!500377 () Bool)

(assert (=> b!519151 m!500377))

(assert (=> b!519151 m!500377))

(declare-fun m!500379 () Bool)

(assert (=> b!519151 m!500379))

(assert (=> b!519152 m!500377))

(declare-fun m!500381 () Bool)

(assert (=> b!519152 m!500381))

(declare-fun m!500383 () Bool)

(assert (=> b!519152 m!500383))

(assert (=> b!519152 m!500377))

(declare-fun m!500385 () Bool)

(assert (=> b!519152 m!500385))

(assert (=> b!518808 d!80037))

(declare-fun b!519174 () Bool)

(declare-fun e!302936 () Bool)

(declare-fun e!302937 () Bool)

(assert (=> b!519174 (= e!302936 e!302937)))

(declare-fun c!60994 () Bool)

(assert (=> b!519174 (= c!60994 (validKeyInArray!0 (select (arr!15939 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31741 () Bool)

(declare-fun call!31744 () Bool)

(assert (=> bm!31741 (= call!31744 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60994 (Cons!10093 (select (arr!15939 a!3235) #b00000000000000000000000000000000) Nil!10094) Nil!10094)))))

(declare-fun b!519175 () Bool)

(assert (=> b!519175 (= e!302937 call!31744)))

(declare-fun b!519176 () Bool)

(assert (=> b!519176 (= e!302937 call!31744)))

(declare-fun b!519177 () Bool)

(declare-fun e!302934 () Bool)

(assert (=> b!519177 (= e!302934 e!302936)))

(declare-fun res!317780 () Bool)

(assert (=> b!519177 (=> (not res!317780) (not e!302936))))

(declare-fun e!302935 () Bool)

(assert (=> b!519177 (= res!317780 (not e!302935))))

(declare-fun res!317778 () Bool)

(assert (=> b!519177 (=> (not res!317778) (not e!302935))))

(assert (=> b!519177 (= res!317778 (validKeyInArray!0 (select (arr!15939 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80039 () Bool)

(declare-fun res!317779 () Bool)

(assert (=> d!80039 (=> res!317779 e!302934)))

(assert (=> d!80039 (= res!317779 (bvsge #b00000000000000000000000000000000 (size!16303 a!3235)))))

(assert (=> d!80039 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10094) e!302934)))

(declare-fun b!519178 () Bool)

(declare-fun contains!2754 (List!10097 (_ BitVec 64)) Bool)

(assert (=> b!519178 (= e!302935 (contains!2754 Nil!10094 (select (arr!15939 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80039 (not res!317779)) b!519177))

(assert (= (and b!519177 res!317778) b!519178))

(assert (= (and b!519177 res!317780) b!519174))

(assert (= (and b!519174 c!60994) b!519175))

(assert (= (and b!519174 (not c!60994)) b!519176))

(assert (= (or b!519175 b!519176) bm!31741))

(assert (=> b!519174 m!500377))

(assert (=> b!519174 m!500377))

(assert (=> b!519174 m!500379))

(assert (=> bm!31741 m!500377))

(declare-fun m!500395 () Bool)

(assert (=> bm!31741 m!500395))

(assert (=> b!519177 m!500377))

(assert (=> b!519177 m!500377))

(assert (=> b!519177 m!500379))

(assert (=> b!519178 m!500377))

(assert (=> b!519178 m!500377))

(declare-fun m!500397 () Bool)

(assert (=> b!519178 m!500397))

(assert (=> b!518809 d!80039))

(declare-fun d!80043 () Bool)

(declare-fun lt!237708 () SeekEntryResult!4406)

