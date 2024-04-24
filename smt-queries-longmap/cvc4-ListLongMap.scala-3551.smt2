; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48924 () Bool)

(assert start!48924)

(declare-fun b!538801 () Bool)

(declare-fun e!312439 () Bool)

(declare-fun e!312441 () Bool)

(assert (=> b!538801 (= e!312439 e!312441)))

(declare-fun res!333901 () Bool)

(assert (=> b!538801 (=> (not res!333901) (not e!312441))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246966 () (_ BitVec 32))

(declare-datatypes ((array!34084 0))(
  ( (array!34085 (arr!16379 (Array (_ BitVec 32) (_ BitVec 64))) (size!16743 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34084)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538801 (= res!333901 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246966 #b00000000000000000000000000000000) (bvslt lt!246966 (size!16743 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538801 (= lt!246966 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538802 () Bool)

(declare-fun e!312442 () Bool)

(declare-fun e!312444 () Bool)

(assert (=> b!538802 (= e!312442 e!312444)))

(declare-fun res!333905 () Bool)

(assert (=> b!538802 (=> (not res!333905) (not e!312444))))

(declare-datatypes ((SeekEntryResult!4793 0))(
  ( (MissingZero!4793 (index!21396 (_ BitVec 32))) (Found!4793 (index!21397 (_ BitVec 32))) (Intermediate!4793 (undefined!5605 Bool) (index!21398 (_ BitVec 32)) (x!50467 (_ BitVec 32))) (Undefined!4793) (MissingVacant!4793 (index!21399 (_ BitVec 32))) )
))
(declare-fun lt!246970 () SeekEntryResult!4793)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538802 (= res!333905 (or (= lt!246970 (MissingZero!4793 i!1153)) (= lt!246970 (MissingVacant!4793 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34084 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!538802 (= lt!246970 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538803 () Bool)

(declare-fun e!312438 () Bool)

(assert (=> b!538803 (= e!312438 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun lt!246964 () SeekEntryResult!4793)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34084 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!538803 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246966 (select (store (arr!16379 a!3154) i!1153 k!1998) j!147) (array!34085 (store (arr!16379 a!3154) i!1153 k!1998) (size!16743 a!3154)) mask!3216) lt!246964)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16843 0))(
  ( (Unit!16844) )
))
(declare-fun lt!246969 () Unit!16843)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34084 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16843)

(assert (=> b!538803 (= lt!246969 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246966 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538804 () Bool)

(declare-fun res!333909 () Bool)

(assert (=> b!538804 (=> (not res!333909) (not e!312442))))

(assert (=> b!538804 (= res!333909 (and (= (size!16743 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16743 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16743 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538805 () Bool)

(declare-fun res!333903 () Bool)

(assert (=> b!538805 (=> (not res!333903) (not e!312442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538805 (= res!333903 (validKeyInArray!0 (select (arr!16379 a!3154) j!147)))))

(declare-fun b!538806 () Bool)

(declare-fun res!333906 () Bool)

(assert (=> b!538806 (=> (not res!333906) (not e!312444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34084 (_ BitVec 32)) Bool)

(assert (=> b!538806 (= res!333906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538807 () Bool)

(declare-fun res!333908 () Bool)

(assert (=> b!538807 (=> (not res!333908) (not e!312442))))

(assert (=> b!538807 (= res!333908 (validKeyInArray!0 k!1998))))

(declare-fun b!538808 () Bool)

(declare-fun res!333902 () Bool)

(assert (=> b!538808 (=> (not res!333902) (not e!312442))))

(declare-fun arrayContainsKey!0 (array!34084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538808 (= res!333902 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538809 () Bool)

(declare-fun res!333910 () Bool)

(assert (=> b!538809 (=> (not res!333910) (not e!312444))))

(assert (=> b!538809 (= res!333910 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16743 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16743 a!3154)) (= (select (arr!16379 a!3154) resIndex!32) (select (arr!16379 a!3154) j!147))))))

(declare-fun res!333913 () Bool)

(assert (=> start!48924 (=> (not res!333913) (not e!312442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48924 (= res!333913 (validMask!0 mask!3216))))

(assert (=> start!48924 e!312442))

(assert (=> start!48924 true))

(declare-fun array_inv!12238 (array!34084) Bool)

(assert (=> start!48924 (array_inv!12238 a!3154)))

(declare-fun b!538810 () Bool)

(declare-fun res!333907 () Bool)

(assert (=> b!538810 (=> (not res!333907) (not e!312444))))

(declare-datatypes ((List!10405 0))(
  ( (Nil!10402) (Cons!10401 (h!11347 (_ BitVec 64)) (t!16625 List!10405)) )
))
(declare-fun arrayNoDuplicates!0 (array!34084 (_ BitVec 32) List!10405) Bool)

(assert (=> b!538810 (= res!333907 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10402))))

(declare-fun b!538811 () Bool)

(declare-fun e!312440 () Bool)

(assert (=> b!538811 (= e!312444 e!312440)))

(declare-fun res!333911 () Bool)

(assert (=> b!538811 (=> (not res!333911) (not e!312440))))

(declare-fun lt!246965 () SeekEntryResult!4793)

(assert (=> b!538811 (= res!333911 (= lt!246965 lt!246964))))

(assert (=> b!538811 (= lt!246964 (Intermediate!4793 false resIndex!32 resX!32))))

(assert (=> b!538811 (= lt!246965 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538812 () Bool)

(assert (=> b!538812 (= e!312441 e!312438)))

(declare-fun res!333912 () Bool)

(assert (=> b!538812 (=> (not res!333912) (not e!312438))))

(declare-fun lt!246967 () SeekEntryResult!4793)

(declare-fun lt!246968 () SeekEntryResult!4793)

(assert (=> b!538812 (= res!333912 (and (= lt!246967 lt!246964) (= lt!246968 lt!246967)))))

(assert (=> b!538812 (= lt!246967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246966 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538813 () Bool)

(assert (=> b!538813 (= e!312440 e!312439)))

(declare-fun res!333904 () Bool)

(assert (=> b!538813 (=> (not res!333904) (not e!312439))))

(assert (=> b!538813 (= res!333904 (and (= lt!246968 lt!246965) (not (= (select (arr!16379 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) (select (arr!16379 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538813 (= lt!246968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16379 a!3154) j!147) mask!3216) (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48924 res!333913) b!538804))

(assert (= (and b!538804 res!333909) b!538805))

(assert (= (and b!538805 res!333903) b!538807))

(assert (= (and b!538807 res!333908) b!538808))

(assert (= (and b!538808 res!333902) b!538802))

(assert (= (and b!538802 res!333905) b!538806))

(assert (= (and b!538806 res!333906) b!538810))

(assert (= (and b!538810 res!333907) b!538809))

(assert (= (and b!538809 res!333910) b!538811))

(assert (= (and b!538811 res!333911) b!538813))

(assert (= (and b!538813 res!333904) b!538801))

(assert (= (and b!538801 res!333901) b!538812))

(assert (= (and b!538812 res!333912) b!538803))

(declare-fun m!518027 () Bool)

(assert (=> b!538801 m!518027))

(declare-fun m!518029 () Bool)

(assert (=> b!538809 m!518029))

(declare-fun m!518031 () Bool)

(assert (=> b!538809 m!518031))

(declare-fun m!518033 () Bool)

(assert (=> b!538810 m!518033))

(declare-fun m!518035 () Bool)

(assert (=> b!538803 m!518035))

(declare-fun m!518037 () Bool)

(assert (=> b!538803 m!518037))

(assert (=> b!538803 m!518037))

(declare-fun m!518039 () Bool)

(assert (=> b!538803 m!518039))

(declare-fun m!518041 () Bool)

(assert (=> b!538803 m!518041))

(declare-fun m!518043 () Bool)

(assert (=> b!538802 m!518043))

(assert (=> b!538811 m!518031))

(assert (=> b!538811 m!518031))

(declare-fun m!518045 () Bool)

(assert (=> b!538811 m!518045))

(assert (=> b!538805 m!518031))

(assert (=> b!538805 m!518031))

(declare-fun m!518047 () Bool)

(assert (=> b!538805 m!518047))

(declare-fun m!518049 () Bool)

(assert (=> b!538813 m!518049))

(assert (=> b!538813 m!518031))

(assert (=> b!538813 m!518031))

(declare-fun m!518051 () Bool)

(assert (=> b!538813 m!518051))

(assert (=> b!538813 m!518051))

(assert (=> b!538813 m!518031))

(declare-fun m!518053 () Bool)

(assert (=> b!538813 m!518053))

(declare-fun m!518055 () Bool)

(assert (=> b!538808 m!518055))

(declare-fun m!518057 () Bool)

(assert (=> b!538806 m!518057))

(assert (=> b!538812 m!518031))

(assert (=> b!538812 m!518031))

(declare-fun m!518059 () Bool)

(assert (=> b!538812 m!518059))

(declare-fun m!518061 () Bool)

(assert (=> b!538807 m!518061))

(declare-fun m!518063 () Bool)

(assert (=> start!48924 m!518063))

(declare-fun m!518065 () Bool)

(assert (=> start!48924 m!518065))

(push 1)

(assert (not b!538805))

(assert (not b!538808))

(assert (not b!538810))

(assert (not b!538802))

(assert (not start!48924))

(assert (not b!538811))

(assert (not b!538813))

(assert (not b!538806))

(assert (not b!538801))

(assert (not b!538803))

(assert (not b!538807))

(assert (not b!538812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

