; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48916 () Bool)

(assert start!48916)

(declare-fun b!538645 () Bool)

(declare-fun res!333745 () Bool)

(declare-fun e!312355 () Bool)

(assert (=> b!538645 (=> (not res!333745) (not e!312355))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538645 (= res!333745 (validKeyInArray!0 k0!1998))))

(declare-fun b!538646 () Bool)

(declare-fun e!312356 () Bool)

(declare-fun e!312357 () Bool)

(assert (=> b!538646 (= e!312356 e!312357)))

(declare-fun res!333747 () Bool)

(assert (=> b!538646 (=> (not res!333747) (not e!312357))))

(declare-datatypes ((SeekEntryResult!4789 0))(
  ( (MissingZero!4789 (index!21380 (_ BitVec 32))) (Found!4789 (index!21381 (_ BitVec 32))) (Intermediate!4789 (undefined!5601 Bool) (index!21382 (_ BitVec 32)) (x!50455 (_ BitVec 32))) (Undefined!4789) (MissingVacant!4789 (index!21383 (_ BitVec 32))) )
))
(declare-fun lt!246882 () SeekEntryResult!4789)

(declare-fun lt!246880 () SeekEntryResult!4789)

(assert (=> b!538646 (= res!333747 (= lt!246882 lt!246880))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538646 (= lt!246880 (Intermediate!4789 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34076 0))(
  ( (array!34077 (arr!16375 (Array (_ BitVec 32) (_ BitVec 64))) (size!16739 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34076 (_ BitVec 32)) SeekEntryResult!4789)

(assert (=> b!538646 (= lt!246882 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538647 () Bool)

(declare-fun e!312360 () Bool)

(declare-fun e!312358 () Bool)

(assert (=> b!538647 (= e!312360 e!312358)))

(declare-fun res!333749 () Bool)

(assert (=> b!538647 (=> (not res!333749) (not e!312358))))

(declare-fun lt!246884 () SeekEntryResult!4789)

(declare-fun lt!246886 () SeekEntryResult!4789)

(assert (=> b!538647 (= res!333749 (and (= lt!246886 lt!246880) (= lt!246884 lt!246886)))))

(declare-fun lt!246881 () (_ BitVec 32))

(assert (=> b!538647 (= lt!246886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246881 (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538649 () Bool)

(declare-fun res!333750 () Bool)

(assert (=> b!538649 (=> (not res!333750) (not e!312356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34076 (_ BitVec 32)) Bool)

(assert (=> b!538649 (= res!333750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538650 () Bool)

(declare-fun res!333746 () Bool)

(assert (=> b!538650 (=> (not res!333746) (not e!312355))))

(declare-fun arrayContainsKey!0 (array!34076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538650 (= res!333746 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538651 () Bool)

(declare-fun res!333753 () Bool)

(assert (=> b!538651 (=> (not res!333753) (not e!312356))))

(declare-datatypes ((List!10401 0))(
  ( (Nil!10398) (Cons!10397 (h!11343 (_ BitVec 64)) (t!16621 List!10401)) )
))
(declare-fun arrayNoDuplicates!0 (array!34076 (_ BitVec 32) List!10401) Bool)

(assert (=> b!538651 (= res!333753 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10398))))

(declare-fun b!538652 () Bool)

(declare-fun res!333748 () Bool)

(assert (=> b!538652 (=> (not res!333748) (not e!312355))))

(assert (=> b!538652 (= res!333748 (validKeyInArray!0 (select (arr!16375 a!3154) j!147)))))

(declare-fun b!538653 () Bool)

(assert (=> b!538653 (= e!312355 e!312356)))

(declare-fun res!333756 () Bool)

(assert (=> b!538653 (=> (not res!333756) (not e!312356))))

(declare-fun lt!246883 () SeekEntryResult!4789)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538653 (= res!333756 (or (= lt!246883 (MissingZero!4789 i!1153)) (= lt!246883 (MissingVacant!4789 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34076 (_ BitVec 32)) SeekEntryResult!4789)

(assert (=> b!538653 (= lt!246883 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538654 () Bool)

(declare-fun e!312359 () Bool)

(assert (=> b!538654 (= e!312357 e!312359)))

(declare-fun res!333752 () Bool)

(assert (=> b!538654 (=> (not res!333752) (not e!312359))))

(assert (=> b!538654 (= res!333752 (and (= lt!246884 lt!246882) (not (= (select (arr!16375 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16375 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16375 a!3154) index!1177) (select (arr!16375 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538654 (= lt!246884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16375 a!3154) j!147) mask!3216) (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538648 () Bool)

(assert (=> b!538648 (= e!312359 e!312360)))

(declare-fun res!333755 () Bool)

(assert (=> b!538648 (=> (not res!333755) (not e!312360))))

(assert (=> b!538648 (= res!333755 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246881 #b00000000000000000000000000000000) (bvslt lt!246881 (size!16739 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538648 (= lt!246881 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun res!333757 () Bool)

(assert (=> start!48916 (=> (not res!333757) (not e!312355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48916 (= res!333757 (validMask!0 mask!3216))))

(assert (=> start!48916 e!312355))

(assert (=> start!48916 true))

(declare-fun array_inv!12234 (array!34076) Bool)

(assert (=> start!48916 (array_inv!12234 a!3154)))

(declare-fun b!538655 () Bool)

(declare-fun res!333751 () Bool)

(assert (=> b!538655 (=> (not res!333751) (not e!312355))))

(assert (=> b!538655 (= res!333751 (and (= (size!16739 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16739 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16739 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538656 () Bool)

(assert (=> b!538656 (= e!312358 (not true))))

(assert (=> b!538656 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246881 (select (store (arr!16375 a!3154) i!1153 k0!1998) j!147) (array!34077 (store (arr!16375 a!3154) i!1153 k0!1998) (size!16739 a!3154)) mask!3216) lt!246880)))

(declare-datatypes ((Unit!16835 0))(
  ( (Unit!16836) )
))
(declare-fun lt!246885 () Unit!16835)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34076 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16835)

(assert (=> b!538656 (= lt!246885 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246881 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538657 () Bool)

(declare-fun res!333754 () Bool)

(assert (=> b!538657 (=> (not res!333754) (not e!312356))))

(assert (=> b!538657 (= res!333754 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16739 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16739 a!3154)) (= (select (arr!16375 a!3154) resIndex!32) (select (arr!16375 a!3154) j!147))))))

(assert (= (and start!48916 res!333757) b!538655))

(assert (= (and b!538655 res!333751) b!538652))

(assert (= (and b!538652 res!333748) b!538645))

(assert (= (and b!538645 res!333745) b!538650))

(assert (= (and b!538650 res!333746) b!538653))

(assert (= (and b!538653 res!333756) b!538649))

(assert (= (and b!538649 res!333750) b!538651))

(assert (= (and b!538651 res!333753) b!538657))

(assert (= (and b!538657 res!333754) b!538646))

(assert (= (and b!538646 res!333747) b!538654))

(assert (= (and b!538654 res!333752) b!538648))

(assert (= (and b!538648 res!333755) b!538647))

(assert (= (and b!538647 res!333749) b!538656))

(declare-fun m!517867 () Bool)

(assert (=> b!538654 m!517867))

(declare-fun m!517869 () Bool)

(assert (=> b!538654 m!517869))

(assert (=> b!538654 m!517869))

(declare-fun m!517871 () Bool)

(assert (=> b!538654 m!517871))

(assert (=> b!538654 m!517871))

(assert (=> b!538654 m!517869))

(declare-fun m!517873 () Bool)

(assert (=> b!538654 m!517873))

(assert (=> b!538647 m!517869))

(assert (=> b!538647 m!517869))

(declare-fun m!517875 () Bool)

(assert (=> b!538647 m!517875))

(declare-fun m!517877 () Bool)

(assert (=> b!538656 m!517877))

(declare-fun m!517879 () Bool)

(assert (=> b!538656 m!517879))

(assert (=> b!538656 m!517879))

(declare-fun m!517881 () Bool)

(assert (=> b!538656 m!517881))

(declare-fun m!517883 () Bool)

(assert (=> b!538656 m!517883))

(declare-fun m!517885 () Bool)

(assert (=> b!538649 m!517885))

(declare-fun m!517887 () Bool)

(assert (=> b!538653 m!517887))

(declare-fun m!517889 () Bool)

(assert (=> b!538650 m!517889))

(declare-fun m!517891 () Bool)

(assert (=> b!538657 m!517891))

(assert (=> b!538657 m!517869))

(declare-fun m!517893 () Bool)

(assert (=> b!538645 m!517893))

(assert (=> b!538652 m!517869))

(assert (=> b!538652 m!517869))

(declare-fun m!517895 () Bool)

(assert (=> b!538652 m!517895))

(declare-fun m!517897 () Bool)

(assert (=> b!538651 m!517897))

(declare-fun m!517899 () Bool)

(assert (=> b!538648 m!517899))

(assert (=> b!538646 m!517869))

(assert (=> b!538646 m!517869))

(declare-fun m!517901 () Bool)

(assert (=> b!538646 m!517901))

(declare-fun m!517903 () Bool)

(assert (=> start!48916 m!517903))

(declare-fun m!517905 () Bool)

(assert (=> start!48916 m!517905))

(check-sat (not b!538654) (not b!538651) (not b!538653) (not b!538650) (not b!538647) (not b!538645) (not b!538649) (not b!538646) (not b!538648) (not b!538652) (not b!538656) (not start!48916))
(check-sat)
