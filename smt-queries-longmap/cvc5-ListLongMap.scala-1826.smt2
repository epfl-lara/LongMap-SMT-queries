; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33000 () Bool)

(assert start!33000)

(declare-fun b!328760 () Bool)

(declare-fun res!181141 () Bool)

(declare-fun e!202041 () Bool)

(assert (=> b!328760 (=> (not res!181141) (not e!202041))))

(declare-datatypes ((array!16819 0))(
  ( (array!16820 (arr!7956 (Array (_ BitVec 32) (_ BitVec 64))) (size!8308 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16819)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3052 0))(
  ( (MissingZero!3052 (index!14384 (_ BitVec 32))) (Found!3052 (index!14385 (_ BitVec 32))) (Intermediate!3052 (undefined!3864 Bool) (index!14386 (_ BitVec 32)) (x!32752 (_ BitVec 32))) (Undefined!3052) (MissingVacant!3052 (index!14387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16819 (_ BitVec 32)) SeekEntryResult!3052)

(assert (=> b!328760 (= res!181141 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3052 i!1250)))))

(declare-fun b!328761 () Bool)

(declare-fun res!181137 () Bool)

(assert (=> b!328761 (=> (not res!181137) (not e!202041))))

(assert (=> b!328761 (= res!181137 (and (= (size!8308 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8308 a!3305))))))

(declare-fun b!328762 () Bool)

(declare-fun res!181143 () Bool)

(assert (=> b!328762 (=> (not res!181143) (not e!202041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328762 (= res!181143 (validKeyInArray!0 k!2497))))

(declare-fun b!328763 () Bool)

(declare-fun res!181136 () Bool)

(assert (=> b!328763 (=> (not res!181136) (not e!202041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16819 (_ BitVec 32)) Bool)

(assert (=> b!328763 (= res!181136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!181138 () Bool)

(assert (=> start!33000 (=> (not res!181138) (not e!202041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33000 (= res!181138 (validMask!0 mask!3777))))

(assert (=> start!33000 e!202041))

(declare-fun array_inv!5906 (array!16819) Bool)

(assert (=> start!33000 (array_inv!5906 a!3305)))

(assert (=> start!33000 true))

(declare-fun b!328764 () Bool)

(assert (=> b!328764 (= e!202041 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!158046 () SeekEntryResult!3052)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16819 (_ BitVec 32)) SeekEntryResult!3052)

(assert (=> b!328764 (= lt!158046 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328765 () Bool)

(declare-fun res!181139 () Bool)

(assert (=> b!328765 (=> (not res!181139) (not e!202041))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328765 (= res!181139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3052 false resIndex!58 resX!58)))))

(declare-fun b!328766 () Bool)

(declare-fun res!181140 () Bool)

(assert (=> b!328766 (=> (not res!181140) (not e!202041))))

(declare-fun arrayContainsKey!0 (array!16819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328766 (= res!181140 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328767 () Bool)

(declare-fun res!181142 () Bool)

(assert (=> b!328767 (=> (not res!181142) (not e!202041))))

(assert (=> b!328767 (= res!181142 (and (= (select (arr!7956 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8308 a!3305))))))

(assert (= (and start!33000 res!181138) b!328761))

(assert (= (and b!328761 res!181137) b!328762))

(assert (= (and b!328762 res!181143) b!328766))

(assert (= (and b!328766 res!181140) b!328760))

(assert (= (and b!328760 res!181141) b!328763))

(assert (= (and b!328763 res!181136) b!328765))

(assert (= (and b!328765 res!181139) b!328767))

(assert (= (and b!328767 res!181142) b!328764))

(declare-fun m!334865 () Bool)

(assert (=> start!33000 m!334865))

(declare-fun m!334867 () Bool)

(assert (=> start!33000 m!334867))

(declare-fun m!334869 () Bool)

(assert (=> b!328765 m!334869))

(assert (=> b!328765 m!334869))

(declare-fun m!334871 () Bool)

(assert (=> b!328765 m!334871))

(declare-fun m!334873 () Bool)

(assert (=> b!328764 m!334873))

(declare-fun m!334875 () Bool)

(assert (=> b!328762 m!334875))

(declare-fun m!334877 () Bool)

(assert (=> b!328760 m!334877))

(declare-fun m!334879 () Bool)

(assert (=> b!328767 m!334879))

(declare-fun m!334881 () Bool)

(assert (=> b!328766 m!334881))

(declare-fun m!334883 () Bool)

(assert (=> b!328763 m!334883))

(push 1)

(assert (not b!328765))

(assert (not b!328763))

(assert (not start!33000))

(assert (not b!328766))

(assert (not b!328762))

(assert (not b!328760))

(assert (not b!328764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

