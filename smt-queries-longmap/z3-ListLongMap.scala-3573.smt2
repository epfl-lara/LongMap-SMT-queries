; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49104 () Bool)

(assert start!49104)

(declare-fun b!540806 () Bool)

(declare-fun res!335841 () Bool)

(declare-fun e!313181 () Bool)

(assert (=> b!540806 (=> (not res!335841) (not e!313181))))

(declare-datatypes ((array!34224 0))(
  ( (array!34225 (arr!16448 (Array (_ BitVec 32) (_ BitVec 64))) (size!16813 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34224)

(declare-datatypes ((List!10606 0))(
  ( (Nil!10603) (Cons!10602 (h!11551 (_ BitVec 64)) (t!16825 List!10606)) )
))
(declare-fun arrayNoDuplicates!0 (array!34224 (_ BitVec 32) List!10606) Bool)

(assert (=> b!540806 (= res!335841 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10603))))

(declare-fun b!540807 () Bool)

(assert (=> b!540807 (= e!313181 false)))

(declare-datatypes ((SeekEntryResult!4903 0))(
  ( (MissingZero!4903 (index!21836 (_ BitVec 32))) (Found!4903 (index!21837 (_ BitVec 32))) (Intermediate!4903 (undefined!5715 Bool) (index!21838 (_ BitVec 32)) (x!50757 (_ BitVec 32))) (Undefined!4903) (MissingVacant!4903 (index!21839 (_ BitVec 32))) )
))
(declare-fun lt!247315 () SeekEntryResult!4903)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34224 (_ BitVec 32)) SeekEntryResult!4903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540807 (= lt!247315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16448 a!3154) j!147) mask!3216) (select (arr!16448 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540808 () Bool)

(declare-fun res!335840 () Bool)

(assert (=> b!540808 (=> (not res!335840) (not e!313181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34224 (_ BitVec 32)) Bool)

(assert (=> b!540808 (= res!335840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540809 () Bool)

(declare-fun res!335835 () Bool)

(assert (=> b!540809 (=> (not res!335835) (not e!313181))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540809 (= res!335835 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16448 a!3154) j!147) a!3154 mask!3216) (Intermediate!4903 false resIndex!32 resX!32)))))

(declare-fun b!540810 () Bool)

(declare-fun res!335843 () Bool)

(declare-fun e!313182 () Bool)

(assert (=> b!540810 (=> (not res!335843) (not e!313182))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540810 (= res!335843 (and (= (size!16813 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16813 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16813 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540811 () Bool)

(declare-fun res!335836 () Bool)

(assert (=> b!540811 (=> (not res!335836) (not e!313182))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540811 (= res!335836 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540812 () Bool)

(assert (=> b!540812 (= e!313182 e!313181)))

(declare-fun res!335838 () Bool)

(assert (=> b!540812 (=> (not res!335838) (not e!313181))))

(declare-fun lt!247314 () SeekEntryResult!4903)

(assert (=> b!540812 (= res!335838 (or (= lt!247314 (MissingZero!4903 i!1153)) (= lt!247314 (MissingVacant!4903 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34224 (_ BitVec 32)) SeekEntryResult!4903)

(assert (=> b!540812 (= lt!247314 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540813 () Bool)

(declare-fun res!335834 () Bool)

(assert (=> b!540813 (=> (not res!335834) (not e!313182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540813 (= res!335834 (validKeyInArray!0 (select (arr!16448 a!3154) j!147)))))

(declare-fun b!540814 () Bool)

(declare-fun res!335837 () Bool)

(assert (=> b!540814 (=> (not res!335837) (not e!313182))))

(assert (=> b!540814 (= res!335837 (validKeyInArray!0 k0!1998))))

(declare-fun res!335839 () Bool)

(assert (=> start!49104 (=> (not res!335839) (not e!313182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49104 (= res!335839 (validMask!0 mask!3216))))

(assert (=> start!49104 e!313182))

(assert (=> start!49104 true))

(declare-fun array_inv!12331 (array!34224) Bool)

(assert (=> start!49104 (array_inv!12331 a!3154)))

(declare-fun b!540805 () Bool)

(declare-fun res!335842 () Bool)

(assert (=> b!540805 (=> (not res!335842) (not e!313181))))

(assert (=> b!540805 (= res!335842 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16813 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16813 a!3154)) (= (select (arr!16448 a!3154) resIndex!32) (select (arr!16448 a!3154) j!147))))))

(assert (= (and start!49104 res!335839) b!540810))

(assert (= (and b!540810 res!335843) b!540813))

(assert (= (and b!540813 res!335834) b!540814))

(assert (= (and b!540814 res!335837) b!540811))

(assert (= (and b!540811 res!335836) b!540812))

(assert (= (and b!540812 res!335838) b!540808))

(assert (= (and b!540808 res!335840) b!540806))

(assert (= (and b!540806 res!335841) b!540805))

(assert (= (and b!540805 res!335842) b!540809))

(assert (= (and b!540809 res!335835) b!540807))

(declare-fun m!518947 () Bool)

(assert (=> b!540808 m!518947))

(declare-fun m!518949 () Bool)

(assert (=> b!540812 m!518949))

(declare-fun m!518951 () Bool)

(assert (=> b!540806 m!518951))

(declare-fun m!518953 () Bool)

(assert (=> b!540807 m!518953))

(assert (=> b!540807 m!518953))

(declare-fun m!518955 () Bool)

(assert (=> b!540807 m!518955))

(assert (=> b!540807 m!518955))

(assert (=> b!540807 m!518953))

(declare-fun m!518957 () Bool)

(assert (=> b!540807 m!518957))

(declare-fun m!518959 () Bool)

(assert (=> b!540805 m!518959))

(assert (=> b!540805 m!518953))

(declare-fun m!518961 () Bool)

(assert (=> start!49104 m!518961))

(declare-fun m!518963 () Bool)

(assert (=> start!49104 m!518963))

(assert (=> b!540809 m!518953))

(assert (=> b!540809 m!518953))

(declare-fun m!518965 () Bool)

(assert (=> b!540809 m!518965))

(assert (=> b!540813 m!518953))

(assert (=> b!540813 m!518953))

(declare-fun m!518967 () Bool)

(assert (=> b!540813 m!518967))

(declare-fun m!518969 () Bool)

(assert (=> b!540811 m!518969))

(declare-fun m!518971 () Bool)

(assert (=> b!540814 m!518971))

(check-sat (not b!540807) (not b!540811) (not b!540812) (not b!540808) (not b!540814) (not b!540809) (not b!540806) (not start!49104) (not b!540813))
(check-sat)
