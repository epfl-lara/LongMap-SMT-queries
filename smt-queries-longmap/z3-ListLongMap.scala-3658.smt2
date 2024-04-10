; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50506 () Bool)

(assert start!50506)

(declare-fun b!552104 () Bool)

(declare-fun res!344701 () Bool)

(declare-fun e!318594 () Bool)

(assert (=> b!552104 (=> (not res!344701) (not e!318594))))

(declare-datatypes ((array!34788 0))(
  ( (array!34789 (arr!16705 (Array (_ BitVec 32) (_ BitVec 64))) (size!17069 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34788)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552104 (= res!344701 (validKeyInArray!0 (select (arr!16705 a!3118) j!142)))))

(declare-fun b!552105 () Bool)

(declare-fun res!344700 () Bool)

(declare-fun e!318597 () Bool)

(assert (=> b!552105 (=> (not res!344700) (not e!318597))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34788 (_ BitVec 32)) Bool)

(assert (=> b!552105 (= res!344700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552106 () Bool)

(declare-fun res!344704 () Bool)

(assert (=> b!552106 (=> (not res!344704) (not e!318597))))

(declare-datatypes ((List!10785 0))(
  ( (Nil!10782) (Cons!10781 (h!11763 (_ BitVec 64)) (t!17013 List!10785)) )
))
(declare-fun arrayNoDuplicates!0 (array!34788 (_ BitVec 32) List!10785) Bool)

(assert (=> b!552106 (= res!344704 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10782))))

(declare-fun b!552107 () Bool)

(declare-fun res!344708 () Bool)

(assert (=> b!552107 (=> (not res!344708) (not e!318597))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5154 0))(
  ( (MissingZero!5154 (index!22843 (_ BitVec 32))) (Found!5154 (index!22844 (_ BitVec 32))) (Intermediate!5154 (undefined!5966 Bool) (index!22845 (_ BitVec 32)) (x!51774 (_ BitVec 32))) (Undefined!5154) (MissingVacant!5154 (index!22846 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34788 (_ BitVec 32)) SeekEntryResult!5154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552107 (= res!344708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16705 a!3118) j!142) mask!3119) (select (arr!16705 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16705 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16705 a!3118) i!1132 k0!1914) j!142) (array!34789 (store (arr!16705 a!3118) i!1132 k0!1914) (size!17069 a!3118)) mask!3119)))))

(declare-fun b!552108 () Bool)

(declare-fun res!344705 () Bool)

(assert (=> b!552108 (=> (not res!344705) (not e!318594))))

(assert (=> b!552108 (= res!344705 (and (= (size!17069 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17069 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17069 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552109 () Bool)

(assert (=> b!552109 (= e!318594 e!318597)))

(declare-fun res!344707 () Bool)

(assert (=> b!552109 (=> (not res!344707) (not e!318597))))

(declare-fun lt!251035 () SeekEntryResult!5154)

(assert (=> b!552109 (= res!344707 (or (= lt!251035 (MissingZero!5154 i!1132)) (= lt!251035 (MissingVacant!5154 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34788 (_ BitVec 32)) SeekEntryResult!5154)

(assert (=> b!552109 (= lt!251035 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552110 () Bool)

(declare-fun e!318596 () Bool)

(assert (=> b!552110 (= e!318596 (= (seekEntryOrOpen!0 (select (arr!16705 a!3118) j!142) a!3118 mask!3119) (Found!5154 j!142)))))

(declare-fun b!552111 () Bool)

(assert (=> b!552111 (= e!318597 (not true))))

(assert (=> b!552111 e!318596))

(declare-fun res!344706 () Bool)

(assert (=> b!552111 (=> (not res!344706) (not e!318596))))

(assert (=> b!552111 (= res!344706 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17082 0))(
  ( (Unit!17083) )
))
(declare-fun lt!251034 () Unit!17082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17082)

(assert (=> b!552111 (= lt!251034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!344703 () Bool)

(assert (=> start!50506 (=> (not res!344703) (not e!318594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50506 (= res!344703 (validMask!0 mask!3119))))

(assert (=> start!50506 e!318594))

(assert (=> start!50506 true))

(declare-fun array_inv!12501 (array!34788) Bool)

(assert (=> start!50506 (array_inv!12501 a!3118)))

(declare-fun b!552112 () Bool)

(declare-fun res!344699 () Bool)

(assert (=> b!552112 (=> (not res!344699) (not e!318594))))

(assert (=> b!552112 (= res!344699 (validKeyInArray!0 k0!1914))))

(declare-fun b!552113 () Bool)

(declare-fun res!344702 () Bool)

(assert (=> b!552113 (=> (not res!344702) (not e!318594))))

(declare-fun arrayContainsKey!0 (array!34788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552113 (= res!344702 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50506 res!344703) b!552108))

(assert (= (and b!552108 res!344705) b!552104))

(assert (= (and b!552104 res!344701) b!552112))

(assert (= (and b!552112 res!344699) b!552113))

(assert (= (and b!552113 res!344702) b!552109))

(assert (= (and b!552109 res!344707) b!552105))

(assert (= (and b!552105 res!344700) b!552106))

(assert (= (and b!552106 res!344704) b!552107))

(assert (= (and b!552107 res!344708) b!552111))

(assert (= (and b!552111 res!344706) b!552110))

(declare-fun m!529071 () Bool)

(assert (=> b!552106 m!529071))

(declare-fun m!529073 () Bool)

(assert (=> b!552113 m!529073))

(declare-fun m!529075 () Bool)

(assert (=> b!552105 m!529075))

(declare-fun m!529077 () Bool)

(assert (=> b!552104 m!529077))

(assert (=> b!552104 m!529077))

(declare-fun m!529079 () Bool)

(assert (=> b!552104 m!529079))

(declare-fun m!529081 () Bool)

(assert (=> b!552112 m!529081))

(assert (=> b!552110 m!529077))

(assert (=> b!552110 m!529077))

(declare-fun m!529083 () Bool)

(assert (=> b!552110 m!529083))

(assert (=> b!552107 m!529077))

(declare-fun m!529085 () Bool)

(assert (=> b!552107 m!529085))

(assert (=> b!552107 m!529077))

(declare-fun m!529087 () Bool)

(assert (=> b!552107 m!529087))

(declare-fun m!529089 () Bool)

(assert (=> b!552107 m!529089))

(assert (=> b!552107 m!529087))

(declare-fun m!529091 () Bool)

(assert (=> b!552107 m!529091))

(assert (=> b!552107 m!529085))

(assert (=> b!552107 m!529077))

(declare-fun m!529093 () Bool)

(assert (=> b!552107 m!529093))

(declare-fun m!529095 () Bool)

(assert (=> b!552107 m!529095))

(assert (=> b!552107 m!529087))

(assert (=> b!552107 m!529089))

(declare-fun m!529097 () Bool)

(assert (=> b!552111 m!529097))

(declare-fun m!529099 () Bool)

(assert (=> b!552111 m!529099))

(declare-fun m!529101 () Bool)

(assert (=> b!552109 m!529101))

(declare-fun m!529103 () Bool)

(assert (=> start!50506 m!529103))

(declare-fun m!529105 () Bool)

(assert (=> start!50506 m!529105))

(check-sat (not b!552106) (not b!552105) (not b!552112) (not start!50506) (not b!552107) (not b!552110) (not b!552111) (not b!552109) (not b!552104) (not b!552113))
(check-sat)
