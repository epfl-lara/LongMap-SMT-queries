; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48888 () Bool)

(assert start!48888)

(declare-fun b!538798 () Bool)

(declare-fun res!334003 () Bool)

(declare-fun e!312416 () Bool)

(assert (=> b!538798 (=> (not res!334003) (not e!312416))))

(declare-datatypes ((array!34100 0))(
  ( (array!34101 (arr!16389 (Array (_ BitVec 32) (_ BitVec 64))) (size!16753 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34100)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34100 (_ BitVec 32)) Bool)

(assert (=> b!538798 (= res!334003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538799 () Bool)

(declare-fun res!334015 () Bool)

(declare-fun e!312418 () Bool)

(assert (=> b!538799 (=> (not res!334015) (not e!312418))))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538799 (= res!334015 (and (= (size!16753 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16753 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16753 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538800 () Bool)

(declare-fun res!334011 () Bool)

(assert (=> b!538800 (=> (not res!334011) (not e!312418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538800 (= res!334011 (validKeyInArray!0 (select (arr!16389 a!3154) j!147)))))

(declare-fun b!538801 () Bool)

(assert (=> b!538801 (= e!312418 e!312416)))

(declare-fun res!334014 () Bool)

(assert (=> b!538801 (=> (not res!334014) (not e!312416))))

(declare-datatypes ((SeekEntryResult!4847 0))(
  ( (MissingZero!4847 (index!21612 (_ BitVec 32))) (Found!4847 (index!21613 (_ BitVec 32))) (Intermediate!4847 (undefined!5659 Bool) (index!21614 (_ BitVec 32)) (x!50534 (_ BitVec 32))) (Undefined!4847) (MissingVacant!4847 (index!21615 (_ BitVec 32))) )
))
(declare-fun lt!246961 () SeekEntryResult!4847)

(assert (=> b!538801 (= res!334014 (or (= lt!246961 (MissingZero!4847 i!1153)) (= lt!246961 (MissingVacant!4847 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34100 (_ BitVec 32)) SeekEntryResult!4847)

(assert (=> b!538801 (= lt!246961 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538802 () Bool)

(declare-fun e!312419 () Bool)

(assert (=> b!538802 (= e!312419 (validKeyInArray!0 (select (store (arr!16389 a!3154) i!1153 k!1998) j!147)))))

(declare-fun b!538803 () Bool)

(declare-fun res!334006 () Bool)

(assert (=> b!538803 (=> (not res!334006) (not e!312418))))

(assert (=> b!538803 (= res!334006 (validKeyInArray!0 k!1998))))

(declare-fun b!538804 () Bool)

(declare-fun e!312422 () Bool)

(assert (=> b!538804 (= e!312416 e!312422)))

(declare-fun res!334004 () Bool)

(assert (=> b!538804 (=> (not res!334004) (not e!312422))))

(declare-fun lt!246967 () SeekEntryResult!4847)

(declare-fun lt!246964 () SeekEntryResult!4847)

(assert (=> b!538804 (= res!334004 (= lt!246967 lt!246964))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538804 (= lt!246964 (Intermediate!4847 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34100 (_ BitVec 32)) SeekEntryResult!4847)

(assert (=> b!538804 (= lt!246967 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16389 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538805 () Bool)

(declare-fun e!312417 () Bool)

(declare-fun e!312423 () Bool)

(assert (=> b!538805 (= e!312417 e!312423)))

(declare-fun res!334009 () Bool)

(assert (=> b!538805 (=> (not res!334009) (not e!312423))))

(declare-fun lt!246962 () SeekEntryResult!4847)

(declare-fun lt!246963 () SeekEntryResult!4847)

(assert (=> b!538805 (= res!334009 (and (= lt!246962 lt!246964) (= lt!246963 lt!246962)))))

(declare-fun lt!246965 () (_ BitVec 32))

(assert (=> b!538805 (= lt!246962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246965 (select (arr!16389 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!334010 () Bool)

(assert (=> start!48888 (=> (not res!334010) (not e!312418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48888 (= res!334010 (validMask!0 mask!3216))))

(assert (=> start!48888 e!312418))

(assert (=> start!48888 true))

(declare-fun array_inv!12185 (array!34100) Bool)

(assert (=> start!48888 (array_inv!12185 a!3154)))

(declare-fun b!538806 () Bool)

(declare-fun res!334012 () Bool)

(assert (=> b!538806 (=> (not res!334012) (not e!312416))))

(assert (=> b!538806 (= res!334012 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16753 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16753 a!3154)) (= (select (arr!16389 a!3154) resIndex!32) (select (arr!16389 a!3154) j!147))))))

(declare-fun b!538807 () Bool)

(declare-fun res!334008 () Bool)

(assert (=> b!538807 (=> (not res!334008) (not e!312416))))

(declare-datatypes ((List!10508 0))(
  ( (Nil!10505) (Cons!10504 (h!11447 (_ BitVec 64)) (t!16736 List!10508)) )
))
(declare-fun arrayNoDuplicates!0 (array!34100 (_ BitVec 32) List!10508) Bool)

(assert (=> b!538807 (= res!334008 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10505))))

(declare-fun b!538808 () Bool)

(declare-fun e!312421 () Bool)

(assert (=> b!538808 (= e!312422 e!312421)))

(declare-fun res!334013 () Bool)

(assert (=> b!538808 (=> (not res!334013) (not e!312421))))

(assert (=> b!538808 (= res!334013 (and (= lt!246963 lt!246967) (not (= (select (arr!16389 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16389 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16389 a!3154) index!1177) (select (arr!16389 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538808 (= lt!246963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16389 a!3154) j!147) mask!3216) (select (arr!16389 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538809 () Bool)

(declare-fun res!334007 () Bool)

(assert (=> b!538809 (=> (not res!334007) (not e!312418))))

(declare-fun arrayContainsKey!0 (array!34100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538809 (= res!334007 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538810 () Bool)

(assert (=> b!538810 (= e!312421 e!312417)))

(declare-fun res!334005 () Bool)

(assert (=> b!538810 (=> (not res!334005) (not e!312417))))

(assert (=> b!538810 (= res!334005 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246965 #b00000000000000000000000000000000) (bvslt lt!246965 (size!16753 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538810 (= lt!246965 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538811 () Bool)

(assert (=> b!538811 (= e!312423 (not e!312419))))

(declare-fun res!334016 () Bool)

(assert (=> b!538811 (=> res!334016 e!312419)))

(assert (=> b!538811 (= res!334016 (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (=> b!538811 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246965 (select (store (arr!16389 a!3154) i!1153 k!1998) j!147) (array!34101 (store (arr!16389 a!3154) i!1153 k!1998) (size!16753 a!3154)) mask!3216) lt!246964)))

(declare-datatypes ((Unit!16878 0))(
  ( (Unit!16879) )
))
(declare-fun lt!246966 () Unit!16878)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34100 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16878)

(assert (=> b!538811 (= lt!246966 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246965 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (= (and start!48888 res!334010) b!538799))

(assert (= (and b!538799 res!334015) b!538800))

(assert (= (and b!538800 res!334011) b!538803))

(assert (= (and b!538803 res!334006) b!538809))

(assert (= (and b!538809 res!334007) b!538801))

(assert (= (and b!538801 res!334014) b!538798))

(assert (= (and b!538798 res!334003) b!538807))

(assert (= (and b!538807 res!334008) b!538806))

(assert (= (and b!538806 res!334012) b!538804))

(assert (= (and b!538804 res!334004) b!538808))

(assert (= (and b!538808 res!334013) b!538810))

(assert (= (and b!538810 res!334005) b!538805))

(assert (= (and b!538805 res!334009) b!538811))

(assert (= (and b!538811 (not res!334016)) b!538802))

(declare-fun m!517905 () Bool)

(assert (=> start!48888 m!517905))

(declare-fun m!517907 () Bool)

(assert (=> start!48888 m!517907))

(declare-fun m!517909 () Bool)

(assert (=> b!538798 m!517909))

(declare-fun m!517911 () Bool)

(assert (=> b!538810 m!517911))

(declare-fun m!517913 () Bool)

(assert (=> b!538808 m!517913))

(declare-fun m!517915 () Bool)

(assert (=> b!538808 m!517915))

(assert (=> b!538808 m!517915))

(declare-fun m!517917 () Bool)

(assert (=> b!538808 m!517917))

(assert (=> b!538808 m!517917))

(assert (=> b!538808 m!517915))

(declare-fun m!517919 () Bool)

(assert (=> b!538808 m!517919))

(assert (=> b!538804 m!517915))

(assert (=> b!538804 m!517915))

(declare-fun m!517921 () Bool)

(assert (=> b!538804 m!517921))

(assert (=> b!538800 m!517915))

(assert (=> b!538800 m!517915))

(declare-fun m!517923 () Bool)

(assert (=> b!538800 m!517923))

(declare-fun m!517925 () Bool)

(assert (=> b!538802 m!517925))

(declare-fun m!517927 () Bool)

(assert (=> b!538802 m!517927))

(assert (=> b!538802 m!517927))

(declare-fun m!517929 () Bool)

(assert (=> b!538802 m!517929))

(declare-fun m!517931 () Bool)

(assert (=> b!538803 m!517931))

(assert (=> b!538805 m!517915))

(assert (=> b!538805 m!517915))

(declare-fun m!517933 () Bool)

(assert (=> b!538805 m!517933))

(declare-fun m!517935 () Bool)

(assert (=> b!538801 m!517935))

(declare-fun m!517937 () Bool)

(assert (=> b!538806 m!517937))

(assert (=> b!538806 m!517915))

(assert (=> b!538811 m!517925))

(assert (=> b!538811 m!517927))

(assert (=> b!538811 m!517927))

(declare-fun m!517939 () Bool)

(assert (=> b!538811 m!517939))

(declare-fun m!517941 () Bool)

(assert (=> b!538811 m!517941))

(declare-fun m!517943 () Bool)

(assert (=> b!538807 m!517943))

(declare-fun m!517945 () Bool)

(assert (=> b!538809 m!517945))

(push 1)

