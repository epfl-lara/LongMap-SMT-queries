; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48882 () Bool)

(assert start!48882)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun e!312352 () Bool)

(declare-fun b!538679 () Bool)

(assert (=> b!538679 (= e!312352 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110))))))

(declare-fun lt!246898 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34094 0))(
  ( (array!34095 (arr!16386 (Array (_ BitVec 32) (_ BitVec 64))) (size!16750 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34094)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4844 0))(
  ( (MissingZero!4844 (index!21600 (_ BitVec 32))) (Found!4844 (index!21601 (_ BitVec 32))) (Intermediate!4844 (undefined!5656 Bool) (index!21602 (_ BitVec 32)) (x!50523 (_ BitVec 32))) (Undefined!4844) (MissingVacant!4844 (index!21603 (_ BitVec 32))) )
))
(declare-fun lt!246900 () SeekEntryResult!4844)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34094 (_ BitVec 32)) SeekEntryResult!4844)

(assert (=> b!538679 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246898 (select (store (arr!16386 a!3154) i!1153 k!1998) j!147) (array!34095 (store (arr!16386 a!3154) i!1153 k!1998) (size!16750 a!3154)) mask!3216) lt!246900)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16872 0))(
  ( (Unit!16873) )
))
(declare-fun lt!246902 () Unit!16872)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16872)

(assert (=> b!538679 (= lt!246902 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246898 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538680 () Bool)

(declare-fun e!312353 () Bool)

(assert (=> b!538680 (= e!312353 e!312352)))

(declare-fun res!333887 () Bool)

(assert (=> b!538680 (=> (not res!333887) (not e!312352))))

(declare-fun lt!246904 () SeekEntryResult!4844)

(declare-fun lt!246899 () SeekEntryResult!4844)

(assert (=> b!538680 (= res!333887 (and (= lt!246899 lt!246900) (= lt!246904 lt!246899)))))

(assert (=> b!538680 (= lt!246899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246898 (select (arr!16386 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538681 () Bool)

(declare-fun res!333896 () Bool)

(declare-fun e!312354 () Bool)

(assert (=> b!538681 (=> (not res!333896) (not e!312354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538681 (= res!333896 (validKeyInArray!0 k!1998))))

(declare-fun res!333884 () Bool)

(assert (=> start!48882 (=> (not res!333884) (not e!312354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48882 (= res!333884 (validMask!0 mask!3216))))

(assert (=> start!48882 e!312354))

(assert (=> start!48882 true))

(declare-fun array_inv!12182 (array!34094) Bool)

(assert (=> start!48882 (array_inv!12182 a!3154)))

(declare-fun b!538682 () Bool)

(declare-fun res!333891 () Bool)

(declare-fun e!312355 () Bool)

(assert (=> b!538682 (=> (not res!333891) (not e!312355))))

(assert (=> b!538682 (= res!333891 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16750 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16750 a!3154)) (= (select (arr!16386 a!3154) resIndex!32) (select (arr!16386 a!3154) j!147))))))

(declare-fun b!538683 () Bool)

(declare-fun res!333888 () Bool)

(assert (=> b!538683 (=> (not res!333888) (not e!312355))))

(declare-datatypes ((List!10505 0))(
  ( (Nil!10502) (Cons!10501 (h!11444 (_ BitVec 64)) (t!16733 List!10505)) )
))
(declare-fun arrayNoDuplicates!0 (array!34094 (_ BitVec 32) List!10505) Bool)

(assert (=> b!538683 (= res!333888 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10502))))

(declare-fun b!538684 () Bool)

(assert (=> b!538684 (= e!312354 e!312355)))

(declare-fun res!333889 () Bool)

(assert (=> b!538684 (=> (not res!333889) (not e!312355))))

(declare-fun lt!246901 () SeekEntryResult!4844)

(assert (=> b!538684 (= res!333889 (or (= lt!246901 (MissingZero!4844 i!1153)) (= lt!246901 (MissingVacant!4844 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34094 (_ BitVec 32)) SeekEntryResult!4844)

(assert (=> b!538684 (= lt!246901 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538685 () Bool)

(declare-fun res!333895 () Bool)

(assert (=> b!538685 (=> (not res!333895) (not e!312354))))

(assert (=> b!538685 (= res!333895 (validKeyInArray!0 (select (arr!16386 a!3154) j!147)))))

(declare-fun b!538686 () Bool)

(declare-fun e!312351 () Bool)

(assert (=> b!538686 (= e!312355 e!312351)))

(declare-fun res!333886 () Bool)

(assert (=> b!538686 (=> (not res!333886) (not e!312351))))

(declare-fun lt!246903 () SeekEntryResult!4844)

(assert (=> b!538686 (= res!333886 (= lt!246903 lt!246900))))

(assert (=> b!538686 (= lt!246900 (Intermediate!4844 false resIndex!32 resX!32))))

(assert (=> b!538686 (= lt!246903 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16386 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538687 () Bool)

(declare-fun e!312357 () Bool)

(assert (=> b!538687 (= e!312351 e!312357)))

(declare-fun res!333890 () Bool)

(assert (=> b!538687 (=> (not res!333890) (not e!312357))))

(assert (=> b!538687 (= res!333890 (and (= lt!246904 lt!246903) (not (= (select (arr!16386 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16386 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16386 a!3154) index!1177) (select (arr!16386 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538687 (= lt!246904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16386 a!3154) j!147) mask!3216) (select (arr!16386 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538688 () Bool)

(assert (=> b!538688 (= e!312357 e!312353)))

(declare-fun res!333885 () Bool)

(assert (=> b!538688 (=> (not res!333885) (not e!312353))))

(assert (=> b!538688 (= res!333885 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246898 #b00000000000000000000000000000000) (bvslt lt!246898 (size!16750 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538688 (= lt!246898 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538689 () Bool)

(declare-fun res!333892 () Bool)

(assert (=> b!538689 (=> (not res!333892) (not e!312355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34094 (_ BitVec 32)) Bool)

(assert (=> b!538689 (= res!333892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538690 () Bool)

(declare-fun res!333894 () Bool)

(assert (=> b!538690 (=> (not res!333894) (not e!312354))))

(declare-fun arrayContainsKey!0 (array!34094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538690 (= res!333894 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538691 () Bool)

(declare-fun res!333893 () Bool)

(assert (=> b!538691 (=> (not res!333893) (not e!312354))))

(assert (=> b!538691 (= res!333893 (and (= (size!16750 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16750 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16750 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48882 res!333884) b!538691))

(assert (= (and b!538691 res!333893) b!538685))

(assert (= (and b!538685 res!333895) b!538681))

(assert (= (and b!538681 res!333896) b!538690))

(assert (= (and b!538690 res!333894) b!538684))

(assert (= (and b!538684 res!333889) b!538689))

(assert (= (and b!538689 res!333892) b!538683))

(assert (= (and b!538683 res!333888) b!538682))

(assert (= (and b!538682 res!333891) b!538686))

(assert (= (and b!538686 res!333886) b!538687))

(assert (= (and b!538687 res!333890) b!538688))

(assert (= (and b!538688 res!333885) b!538680))

(assert (= (and b!538680 res!333887) b!538679))

(declare-fun m!517785 () Bool)

(assert (=> b!538679 m!517785))

(declare-fun m!517787 () Bool)

(assert (=> b!538679 m!517787))

(assert (=> b!538679 m!517787))

(declare-fun m!517789 () Bool)

(assert (=> b!538679 m!517789))

(declare-fun m!517791 () Bool)

(assert (=> b!538679 m!517791))

(declare-fun m!517793 () Bool)

(assert (=> start!48882 m!517793))

(declare-fun m!517795 () Bool)

(assert (=> start!48882 m!517795))

(declare-fun m!517797 () Bool)

(assert (=> b!538688 m!517797))

(declare-fun m!517799 () Bool)

(assert (=> b!538683 m!517799))

(declare-fun m!517801 () Bool)

(assert (=> b!538685 m!517801))

(assert (=> b!538685 m!517801))

(declare-fun m!517803 () Bool)

(assert (=> b!538685 m!517803))

(declare-fun m!517805 () Bool)

(assert (=> b!538684 m!517805))

(declare-fun m!517807 () Bool)

(assert (=> b!538687 m!517807))

(assert (=> b!538687 m!517801))

(assert (=> b!538687 m!517801))

(declare-fun m!517809 () Bool)

(assert (=> b!538687 m!517809))

(assert (=> b!538687 m!517809))

(assert (=> b!538687 m!517801))

(declare-fun m!517811 () Bool)

(assert (=> b!538687 m!517811))

(assert (=> b!538680 m!517801))

(assert (=> b!538680 m!517801))

(declare-fun m!517813 () Bool)

(assert (=> b!538680 m!517813))

(declare-fun m!517815 () Bool)

(assert (=> b!538690 m!517815))

(assert (=> b!538686 m!517801))

(assert (=> b!538686 m!517801))

(declare-fun m!517817 () Bool)

(assert (=> b!538686 m!517817))

(declare-fun m!517819 () Bool)

(assert (=> b!538682 m!517819))

(assert (=> b!538682 m!517801))

(declare-fun m!517821 () Bool)

(assert (=> b!538681 m!517821))

(declare-fun m!517823 () Bool)

(assert (=> b!538689 m!517823))

(push 1)

