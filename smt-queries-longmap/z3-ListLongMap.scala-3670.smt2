; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50624 () Bool)

(assert start!50624)

(declare-fun b!553192 () Bool)

(declare-fun res!345747 () Bool)

(declare-fun e!319090 () Bool)

(assert (=> b!553192 (=> (not res!345747) (not e!319090))))

(declare-datatypes ((array!34858 0))(
  ( (array!34859 (arr!16739 (Array (_ BitVec 32) (_ BitVec 64))) (size!17104 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34858)

(declare-datatypes ((List!10858 0))(
  ( (Nil!10855) (Cons!10854 (h!11839 (_ BitVec 64)) (t!17077 List!10858)) )
))
(declare-fun arrayNoDuplicates!0 (array!34858 (_ BitVec 32) List!10858) Bool)

(assert (=> b!553192 (= res!345747 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10855))))

(declare-fun b!553193 () Bool)

(assert (=> b!553193 (= e!319090 (not true))))

(declare-fun e!319092 () Bool)

(assert (=> b!553193 e!319092))

(declare-fun res!345753 () Bool)

(assert (=> b!553193 (=> (not res!345753) (not e!319092))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34858 (_ BitVec 32)) Bool)

(assert (=> b!553193 (= res!345753 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17130 0))(
  ( (Unit!17131) )
))
(declare-fun lt!251257 () Unit!17130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17130)

(assert (=> b!553193 (= lt!251257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553194 () Bool)

(declare-fun res!345748 () Bool)

(assert (=> b!553194 (=> (not res!345748) (not e!319090))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5185 0))(
  ( (MissingZero!5185 (index!22967 (_ BitVec 32))) (Found!5185 (index!22968 (_ BitVec 32))) (Intermediate!5185 (undefined!5997 Bool) (index!22969 (_ BitVec 32)) (x!51902 (_ BitVec 32))) (Undefined!5185) (MissingVacant!5185 (index!22970 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34858 (_ BitVec 32)) SeekEntryResult!5185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553194 (= res!345748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16739 a!3118) j!142) mask!3119) (select (arr!16739 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16739 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16739 a!3118) i!1132 k0!1914) j!142) (array!34859 (store (arr!16739 a!3118) i!1132 k0!1914) (size!17104 a!3118)) mask!3119)))))

(declare-fun b!553195 () Bool)

(declare-fun res!345755 () Bool)

(declare-fun e!319091 () Bool)

(assert (=> b!553195 (=> (not res!345755) (not e!319091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553195 (= res!345755 (validKeyInArray!0 (select (arr!16739 a!3118) j!142)))))

(declare-fun b!553197 () Bool)

(declare-fun res!345754 () Bool)

(assert (=> b!553197 (=> (not res!345754) (not e!319090))))

(assert (=> b!553197 (= res!345754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553198 () Bool)

(declare-fun res!345751 () Bool)

(assert (=> b!553198 (=> (not res!345751) (not e!319091))))

(declare-fun arrayContainsKey!0 (array!34858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553198 (= res!345751 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553199 () Bool)

(assert (=> b!553199 (= e!319091 e!319090)))

(declare-fun res!345749 () Bool)

(assert (=> b!553199 (=> (not res!345749) (not e!319090))))

(declare-fun lt!251256 () SeekEntryResult!5185)

(assert (=> b!553199 (= res!345749 (or (= lt!251256 (MissingZero!5185 i!1132)) (= lt!251256 (MissingVacant!5185 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34858 (_ BitVec 32)) SeekEntryResult!5185)

(assert (=> b!553199 (= lt!251256 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553200 () Bool)

(assert (=> b!553200 (= e!319092 (= (seekEntryOrOpen!0 (select (arr!16739 a!3118) j!142) a!3118 mask!3119) (Found!5185 j!142)))))

(declare-fun b!553201 () Bool)

(declare-fun res!345752 () Bool)

(assert (=> b!553201 (=> (not res!345752) (not e!319091))))

(assert (=> b!553201 (= res!345752 (and (= (size!17104 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17104 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17104 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553196 () Bool)

(declare-fun res!345750 () Bool)

(assert (=> b!553196 (=> (not res!345750) (not e!319091))))

(assert (=> b!553196 (= res!345750 (validKeyInArray!0 k0!1914))))

(declare-fun res!345746 () Bool)

(assert (=> start!50624 (=> (not res!345746) (not e!319091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50624 (= res!345746 (validMask!0 mask!3119))))

(assert (=> start!50624 e!319091))

(assert (=> start!50624 true))

(declare-fun array_inv!12622 (array!34858) Bool)

(assert (=> start!50624 (array_inv!12622 a!3118)))

(assert (= (and start!50624 res!345746) b!553201))

(assert (= (and b!553201 res!345752) b!553195))

(assert (= (and b!553195 res!345755) b!553196))

(assert (= (and b!553196 res!345750) b!553198))

(assert (= (and b!553198 res!345751) b!553199))

(assert (= (and b!553199 res!345749) b!553197))

(assert (= (and b!553197 res!345754) b!553192))

(assert (= (and b!553192 res!345747) b!553194))

(assert (= (and b!553194 res!345748) b!553193))

(assert (= (and b!553193 res!345753) b!553200))

(declare-fun m!529775 () Bool)

(assert (=> b!553193 m!529775))

(declare-fun m!529777 () Bool)

(assert (=> b!553193 m!529777))

(declare-fun m!529779 () Bool)

(assert (=> b!553200 m!529779))

(assert (=> b!553200 m!529779))

(declare-fun m!529781 () Bool)

(assert (=> b!553200 m!529781))

(assert (=> b!553194 m!529779))

(declare-fun m!529783 () Bool)

(assert (=> b!553194 m!529783))

(assert (=> b!553194 m!529779))

(declare-fun m!529785 () Bool)

(assert (=> b!553194 m!529785))

(declare-fun m!529787 () Bool)

(assert (=> b!553194 m!529787))

(assert (=> b!553194 m!529785))

(declare-fun m!529789 () Bool)

(assert (=> b!553194 m!529789))

(assert (=> b!553194 m!529783))

(assert (=> b!553194 m!529779))

(declare-fun m!529791 () Bool)

(assert (=> b!553194 m!529791))

(declare-fun m!529793 () Bool)

(assert (=> b!553194 m!529793))

(assert (=> b!553194 m!529785))

(assert (=> b!553194 m!529787))

(declare-fun m!529795 () Bool)

(assert (=> b!553199 m!529795))

(declare-fun m!529797 () Bool)

(assert (=> start!50624 m!529797))

(declare-fun m!529799 () Bool)

(assert (=> start!50624 m!529799))

(declare-fun m!529801 () Bool)

(assert (=> b!553197 m!529801))

(declare-fun m!529803 () Bool)

(assert (=> b!553192 m!529803))

(declare-fun m!529805 () Bool)

(assert (=> b!553198 m!529805))

(assert (=> b!553195 m!529779))

(assert (=> b!553195 m!529779))

(declare-fun m!529807 () Bool)

(assert (=> b!553195 m!529807))

(declare-fun m!529809 () Bool)

(assert (=> b!553196 m!529809))

(check-sat (not b!553198) (not b!553200) (not b!553197) (not b!553194) (not b!553192) (not b!553195) (not b!553193) (not b!553196) (not b!553199) (not start!50624))
(check-sat)
