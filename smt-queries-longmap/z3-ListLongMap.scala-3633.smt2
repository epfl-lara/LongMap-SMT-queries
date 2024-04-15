; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50114 () Bool)

(assert start!50114)

(declare-fun b!548712 () Bool)

(declare-fun res!342087 () Bool)

(declare-fun e!316939 () Bool)

(assert (=> b!548712 (=> (not res!342087) (not e!316939))))

(declare-datatypes ((array!34621 0))(
  ( (array!34622 (arr!16628 (Array (_ BitVec 32) (_ BitVec 64))) (size!16993 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34621)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34621 (_ BitVec 32)) Bool)

(assert (=> b!548712 (= res!342087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548713 () Bool)

(declare-fun res!342090 () Bool)

(declare-fun e!316941 () Bool)

(assert (=> b!548713 (=> (not res!342090) (not e!316941))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548713 (= res!342090 (validKeyInArray!0 k0!1914))))

(declare-fun b!548714 () Bool)

(declare-fun res!342092 () Bool)

(assert (=> b!548714 (=> (not res!342092) (not e!316941))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548714 (= res!342092 (validKeyInArray!0 (select (arr!16628 a!3118) j!142)))))

(declare-fun res!342089 () Bool)

(assert (=> start!50114 (=> (not res!342089) (not e!316941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50114 (= res!342089 (validMask!0 mask!3119))))

(assert (=> start!50114 e!316941))

(assert (=> start!50114 true))

(declare-fun array_inv!12511 (array!34621) Bool)

(assert (=> start!50114 (array_inv!12511 a!3118)))

(declare-fun b!548715 () Bool)

(declare-fun res!342091 () Bool)

(assert (=> b!548715 (=> (not res!342091) (not e!316941))))

(declare-fun arrayContainsKey!0 (array!34621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548715 (= res!342091 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548716 () Bool)

(assert (=> b!548716 (= e!316939 false)))

(declare-fun lt!249742 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548716 (= lt!249742 (toIndex!0 (select (store (arr!16628 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!548717 () Bool)

(declare-fun res!342086 () Bool)

(assert (=> b!548717 (=> (not res!342086) (not e!316939))))

(declare-datatypes ((List!10747 0))(
  ( (Nil!10744) (Cons!10743 (h!11713 (_ BitVec 64)) (t!16966 List!10747)) )
))
(declare-fun arrayNoDuplicates!0 (array!34621 (_ BitVec 32) List!10747) Bool)

(assert (=> b!548717 (= res!342086 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10744))))

(declare-fun b!548718 () Bool)

(assert (=> b!548718 (= e!316941 e!316939)))

(declare-fun res!342088 () Bool)

(assert (=> b!548718 (=> (not res!342088) (not e!316939))))

(declare-datatypes ((SeekEntryResult!5074 0))(
  ( (MissingZero!5074 (index!22523 (_ BitVec 32))) (Found!5074 (index!22524 (_ BitVec 32))) (Intermediate!5074 (undefined!5886 Bool) (index!22525 (_ BitVec 32)) (x!51468 (_ BitVec 32))) (Undefined!5074) (MissingVacant!5074 (index!22526 (_ BitVec 32))) )
))
(declare-fun lt!249741 () SeekEntryResult!5074)

(assert (=> b!548718 (= res!342088 (or (= lt!249741 (MissingZero!5074 i!1132)) (= lt!249741 (MissingVacant!5074 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34621 (_ BitVec 32)) SeekEntryResult!5074)

(assert (=> b!548718 (= lt!249741 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548719 () Bool)

(declare-fun res!342085 () Bool)

(assert (=> b!548719 (=> (not res!342085) (not e!316941))))

(assert (=> b!548719 (= res!342085 (and (= (size!16993 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16993 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16993 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50114 res!342089) b!548719))

(assert (= (and b!548719 res!342085) b!548714))

(assert (= (and b!548714 res!342092) b!548713))

(assert (= (and b!548713 res!342090) b!548715))

(assert (= (and b!548715 res!342091) b!548718))

(assert (= (and b!548718 res!342088) b!548712))

(assert (= (and b!548712 res!342087) b!548717))

(assert (= (and b!548717 res!342086) b!548716))

(declare-fun m!525119 () Bool)

(assert (=> start!50114 m!525119))

(declare-fun m!525121 () Bool)

(assert (=> start!50114 m!525121))

(declare-fun m!525123 () Bool)

(assert (=> b!548715 m!525123))

(declare-fun m!525125 () Bool)

(assert (=> b!548717 m!525125))

(declare-fun m!525127 () Bool)

(assert (=> b!548714 m!525127))

(assert (=> b!548714 m!525127))

(declare-fun m!525129 () Bool)

(assert (=> b!548714 m!525129))

(declare-fun m!525131 () Bool)

(assert (=> b!548716 m!525131))

(declare-fun m!525133 () Bool)

(assert (=> b!548716 m!525133))

(assert (=> b!548716 m!525133))

(declare-fun m!525135 () Bool)

(assert (=> b!548716 m!525135))

(declare-fun m!525137 () Bool)

(assert (=> b!548712 m!525137))

(declare-fun m!525139 () Bool)

(assert (=> b!548718 m!525139))

(declare-fun m!525141 () Bool)

(assert (=> b!548713 m!525141))

(check-sat (not b!548717) (not b!548718) (not b!548716) (not b!548713) (not b!548715) (not start!50114) (not b!548714) (not b!548712))
(check-sat)
