; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50116 () Bool)

(assert start!50116)

(declare-fun b!548863 () Bool)

(declare-fun res!342094 () Bool)

(declare-fun e!317070 () Bool)

(assert (=> b!548863 (=> (not res!342094) (not e!317070))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548863 (= res!342094 (validKeyInArray!0 k0!1914))))

(declare-fun b!548864 () Bool)

(declare-fun e!317069 () Bool)

(assert (=> b!548864 (= e!317069 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!249945 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34614 0))(
  ( (array!34615 (arr!16624 (Array (_ BitVec 32) (_ BitVec 64))) (size!16988 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548864 (= lt!249945 (toIndex!0 (select (store (arr!16624 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!548865 () Bool)

(declare-fun res!342099 () Bool)

(assert (=> b!548865 (=> (not res!342099) (not e!317070))))

(declare-fun arrayContainsKey!0 (array!34614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548865 (= res!342099 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!342096 () Bool)

(assert (=> start!50116 (=> (not res!342096) (not e!317070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50116 (= res!342096 (validMask!0 mask!3119))))

(assert (=> start!50116 e!317070))

(assert (=> start!50116 true))

(declare-fun array_inv!12420 (array!34614) Bool)

(assert (=> start!50116 (array_inv!12420 a!3118)))

(declare-fun b!548866 () Bool)

(declare-fun res!342097 () Bool)

(assert (=> b!548866 (=> (not res!342097) (not e!317069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34614 (_ BitVec 32)) Bool)

(assert (=> b!548866 (= res!342097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548867 () Bool)

(declare-fun res!342100 () Bool)

(assert (=> b!548867 (=> (not res!342100) (not e!317070))))

(assert (=> b!548867 (= res!342100 (validKeyInArray!0 (select (arr!16624 a!3118) j!142)))))

(declare-fun b!548868 () Bool)

(declare-fun res!342101 () Bool)

(assert (=> b!548868 (=> (not res!342101) (not e!317069))))

(declare-datatypes ((List!10704 0))(
  ( (Nil!10701) (Cons!10700 (h!11670 (_ BitVec 64)) (t!16932 List!10704)) )
))
(declare-fun arrayNoDuplicates!0 (array!34614 (_ BitVec 32) List!10704) Bool)

(assert (=> b!548868 (= res!342101 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10701))))

(declare-fun b!548869 () Bool)

(declare-fun res!342095 () Bool)

(assert (=> b!548869 (=> (not res!342095) (not e!317070))))

(assert (=> b!548869 (= res!342095 (and (= (size!16988 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16988 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16988 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548870 () Bool)

(assert (=> b!548870 (= e!317070 e!317069)))

(declare-fun res!342098 () Bool)

(assert (=> b!548870 (=> (not res!342098) (not e!317069))))

(declare-datatypes ((SeekEntryResult!5073 0))(
  ( (MissingZero!5073 (index!22519 (_ BitVec 32))) (Found!5073 (index!22520 (_ BitVec 32))) (Intermediate!5073 (undefined!5885 Bool) (index!22521 (_ BitVec 32)) (x!51456 (_ BitVec 32))) (Undefined!5073) (MissingVacant!5073 (index!22522 (_ BitVec 32))) )
))
(declare-fun lt!249946 () SeekEntryResult!5073)

(assert (=> b!548870 (= res!342098 (or (= lt!249946 (MissingZero!5073 i!1132)) (= lt!249946 (MissingVacant!5073 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34614 (_ BitVec 32)) SeekEntryResult!5073)

(assert (=> b!548870 (= lt!249946 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50116 res!342096) b!548869))

(assert (= (and b!548869 res!342095) b!548867))

(assert (= (and b!548867 res!342100) b!548863))

(assert (= (and b!548863 res!342094) b!548865))

(assert (= (and b!548865 res!342099) b!548870))

(assert (= (and b!548870 res!342098) b!548866))

(assert (= (and b!548866 res!342097) b!548868))

(assert (= (and b!548868 res!342101) b!548864))

(declare-fun m!525771 () Bool)

(assert (=> b!548865 m!525771))

(declare-fun m!525773 () Bool)

(assert (=> b!548866 m!525773))

(declare-fun m!525775 () Bool)

(assert (=> b!548864 m!525775))

(declare-fun m!525777 () Bool)

(assert (=> b!548864 m!525777))

(assert (=> b!548864 m!525777))

(declare-fun m!525779 () Bool)

(assert (=> b!548864 m!525779))

(declare-fun m!525781 () Bool)

(assert (=> b!548870 m!525781))

(declare-fun m!525783 () Bool)

(assert (=> b!548868 m!525783))

(declare-fun m!525785 () Bool)

(assert (=> b!548867 m!525785))

(assert (=> b!548867 m!525785))

(declare-fun m!525787 () Bool)

(assert (=> b!548867 m!525787))

(declare-fun m!525789 () Bool)

(assert (=> start!50116 m!525789))

(declare-fun m!525791 () Bool)

(assert (=> start!50116 m!525791))

(declare-fun m!525793 () Bool)

(assert (=> b!548863 m!525793))

(check-sat (not b!548867) (not start!50116) (not b!548868) (not b!548870) (not b!548863) (not b!548865) (not b!548864) (not b!548866))
(check-sat)
