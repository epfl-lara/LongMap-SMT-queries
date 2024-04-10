; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48886 () Bool)

(assert start!48886)

(declare-fun b!538757 () Bool)

(declare-fun res!333963 () Bool)

(declare-fun e!312397 () Bool)

(assert (=> b!538757 (=> (not res!333963) (not e!312397))))

(declare-datatypes ((array!34098 0))(
  ( (array!34099 (arr!16388 (Array (_ BitVec 32) (_ BitVec 64))) (size!16752 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34098)

(declare-datatypes ((List!10507 0))(
  ( (Nil!10504) (Cons!10503 (h!11446 (_ BitVec 64)) (t!16735 List!10507)) )
))
(declare-fun arrayNoDuplicates!0 (array!34098 (_ BitVec 32) List!10507) Bool)

(assert (=> b!538757 (= res!333963 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10504))))

(declare-fun b!538758 () Bool)

(declare-fun res!333965 () Bool)

(declare-fun e!312396 () Bool)

(assert (=> b!538758 (=> (not res!333965) (not e!312396))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538758 (= res!333965 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538759 () Bool)

(declare-fun res!333966 () Bool)

(assert (=> b!538759 (=> (not res!333966) (not e!312397))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34098 (_ BitVec 32)) Bool)

(assert (=> b!538759 (= res!333966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538760 () Bool)

(declare-fun res!333964 () Bool)

(assert (=> b!538760 (=> (not res!333964) (not e!312396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538760 (= res!333964 (validKeyInArray!0 k!1998))))

(declare-fun b!538761 () Bool)

(declare-fun res!333972 () Bool)

(assert (=> b!538761 (=> (not res!333972) (not e!312397))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538761 (= res!333972 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16752 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16752 a!3154)) (= (select (arr!16388 a!3154) resIndex!32) (select (arr!16388 a!3154) j!147))))))

(declare-fun b!538762 () Bool)

(declare-fun e!312393 () Bool)

(assert (=> b!538762 (= e!312393 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110))))))

(declare-fun lt!246940 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4846 0))(
  ( (MissingZero!4846 (index!21608 (_ BitVec 32))) (Found!4846 (index!21609 (_ BitVec 32))) (Intermediate!4846 (undefined!5658 Bool) (index!21610 (_ BitVec 32)) (x!50525 (_ BitVec 32))) (Undefined!4846) (MissingVacant!4846 (index!21611 (_ BitVec 32))) )
))
(declare-fun lt!246946 () SeekEntryResult!4846)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34098 (_ BitVec 32)) SeekEntryResult!4846)

(assert (=> b!538762 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246940 (select (store (arr!16388 a!3154) i!1153 k!1998) j!147) (array!34099 (store (arr!16388 a!3154) i!1153 k!1998) (size!16752 a!3154)) mask!3216) lt!246946)))

(declare-datatypes ((Unit!16876 0))(
  ( (Unit!16877) )
))
(declare-fun lt!246945 () Unit!16876)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16876)

(assert (=> b!538762 (= lt!246945 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246940 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538763 () Bool)

(declare-fun e!312395 () Bool)

(declare-fun e!312398 () Bool)

(assert (=> b!538763 (= e!312395 e!312398)))

(declare-fun res!333968 () Bool)

(assert (=> b!538763 (=> (not res!333968) (not e!312398))))

(declare-fun lt!246943 () SeekEntryResult!4846)

(declare-fun lt!246941 () SeekEntryResult!4846)

(assert (=> b!538763 (= res!333968 (and (= lt!246943 lt!246941) (not (= (select (arr!16388 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16388 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16388 a!3154) index!1177) (select (arr!16388 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538763 (= lt!246943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16388 a!3154) j!147) mask!3216) (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538764 () Bool)

(declare-fun res!333967 () Bool)

(assert (=> b!538764 (=> (not res!333967) (not e!312396))))

(assert (=> b!538764 (= res!333967 (and (= (size!16752 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16752 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16752 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538765 () Bool)

(declare-fun e!312394 () Bool)

(assert (=> b!538765 (= e!312394 e!312393)))

(declare-fun res!333970 () Bool)

(assert (=> b!538765 (=> (not res!333970) (not e!312393))))

(declare-fun lt!246944 () SeekEntryResult!4846)

(assert (=> b!538765 (= res!333970 (and (= lt!246944 lt!246946) (= lt!246943 lt!246944)))))

(assert (=> b!538765 (= lt!246944 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246940 (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538766 () Bool)

(assert (=> b!538766 (= e!312396 e!312397)))

(declare-fun res!333973 () Bool)

(assert (=> b!538766 (=> (not res!333973) (not e!312397))))

(declare-fun lt!246942 () SeekEntryResult!4846)

(assert (=> b!538766 (= res!333973 (or (= lt!246942 (MissingZero!4846 i!1153)) (= lt!246942 (MissingVacant!4846 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34098 (_ BitVec 32)) SeekEntryResult!4846)

(assert (=> b!538766 (= lt!246942 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538767 () Bool)

(declare-fun res!333974 () Bool)

(assert (=> b!538767 (=> (not res!333974) (not e!312396))))

(assert (=> b!538767 (= res!333974 (validKeyInArray!0 (select (arr!16388 a!3154) j!147)))))

(declare-fun b!538768 () Bool)

(assert (=> b!538768 (= e!312398 e!312394)))

(declare-fun res!333962 () Bool)

(assert (=> b!538768 (=> (not res!333962) (not e!312394))))

(assert (=> b!538768 (= res!333962 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246940 #b00000000000000000000000000000000) (bvslt lt!246940 (size!16752 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538768 (= lt!246940 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!333971 () Bool)

(assert (=> start!48886 (=> (not res!333971) (not e!312396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48886 (= res!333971 (validMask!0 mask!3216))))

(assert (=> start!48886 e!312396))

(assert (=> start!48886 true))

(declare-fun array_inv!12184 (array!34098) Bool)

(assert (=> start!48886 (array_inv!12184 a!3154)))

(declare-fun b!538769 () Bool)

(assert (=> b!538769 (= e!312397 e!312395)))

(declare-fun res!333969 () Bool)

(assert (=> b!538769 (=> (not res!333969) (not e!312395))))

(assert (=> b!538769 (= res!333969 (= lt!246941 lt!246946))))

(assert (=> b!538769 (= lt!246946 (Intermediate!4846 false resIndex!32 resX!32))))

(assert (=> b!538769 (= lt!246941 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48886 res!333971) b!538764))

(assert (= (and b!538764 res!333967) b!538767))

(assert (= (and b!538767 res!333974) b!538760))

(assert (= (and b!538760 res!333964) b!538758))

(assert (= (and b!538758 res!333965) b!538766))

(assert (= (and b!538766 res!333973) b!538759))

(assert (= (and b!538759 res!333966) b!538757))

(assert (= (and b!538757 res!333963) b!538761))

(assert (= (and b!538761 res!333972) b!538769))

(assert (= (and b!538769 res!333969) b!538763))

(assert (= (and b!538763 res!333968) b!538768))

(assert (= (and b!538768 res!333962) b!538765))

(assert (= (and b!538765 res!333970) b!538762))

(declare-fun m!517865 () Bool)

(assert (=> b!538766 m!517865))

(declare-fun m!517867 () Bool)

(assert (=> b!538761 m!517867))

(declare-fun m!517869 () Bool)

(assert (=> b!538761 m!517869))

(declare-fun m!517871 () Bool)

(assert (=> b!538759 m!517871))

(declare-fun m!517873 () Bool)

(assert (=> b!538768 m!517873))

(declare-fun m!517875 () Bool)

(assert (=> b!538763 m!517875))

(assert (=> b!538763 m!517869))

(assert (=> b!538763 m!517869))

(declare-fun m!517877 () Bool)

(assert (=> b!538763 m!517877))

(assert (=> b!538763 m!517877))

(assert (=> b!538763 m!517869))

(declare-fun m!517879 () Bool)

(assert (=> b!538763 m!517879))

(assert (=> b!538765 m!517869))

(assert (=> b!538765 m!517869))

(declare-fun m!517881 () Bool)

(assert (=> b!538765 m!517881))

(declare-fun m!517883 () Bool)

(assert (=> b!538758 m!517883))

(declare-fun m!517885 () Bool)

(assert (=> b!538757 m!517885))

(declare-fun m!517887 () Bool)

(assert (=> start!48886 m!517887))

(declare-fun m!517889 () Bool)

(assert (=> start!48886 m!517889))

(assert (=> b!538769 m!517869))

(assert (=> b!538769 m!517869))

(declare-fun m!517891 () Bool)

(assert (=> b!538769 m!517891))

(declare-fun m!517893 () Bool)

(assert (=> b!538762 m!517893))

(declare-fun m!517895 () Bool)

(assert (=> b!538762 m!517895))

(assert (=> b!538762 m!517895))

(declare-fun m!517897 () Bool)

(assert (=> b!538762 m!517897))

(declare-fun m!517899 () Bool)

(assert (=> b!538762 m!517899))

(assert (=> b!538767 m!517869))

(assert (=> b!538767 m!517869))

(declare-fun m!517901 () Bool)

(assert (=> b!538767 m!517901))

(declare-fun m!517903 () Bool)

(assert (=> b!538760 m!517903))

(push 1)

(assert (not b!538767))

(assert (not b!538757))

(assert (not b!538763))

(assert (not b!538765))

