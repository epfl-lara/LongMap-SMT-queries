; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50834 () Bool)

(assert start!50834)

(declare-fun b!556198 () Bool)

(declare-fun res!348753 () Bool)

(declare-fun e!320413 () Bool)

(assert (=> b!556198 (=> (not res!348753) (not e!320413))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35068 0))(
  ( (array!35069 (arr!16844 (Array (_ BitVec 32) (_ BitVec 64))) (size!17209 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35068)

(declare-datatypes ((SeekEntryResult!5290 0))(
  ( (MissingZero!5290 (index!23387 (_ BitVec 32))) (Found!5290 (index!23388 (_ BitVec 32))) (Intermediate!5290 (undefined!6102 Bool) (index!23389 (_ BitVec 32)) (x!52287 (_ BitVec 32))) (Undefined!5290) (MissingVacant!5290 (index!23390 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35068 (_ BitVec 32)) SeekEntryResult!5290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556198 (= res!348753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16844 a!3118) j!142) mask!3119) (select (arr!16844 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16844 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16844 a!3118) i!1132 k0!1914) j!142) (array!35069 (store (arr!16844 a!3118) i!1132 k0!1914) (size!17209 a!3118)) mask!3119)))))

(declare-fun b!556199 () Bool)

(declare-fun e!320412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35068 (_ BitVec 32)) SeekEntryResult!5290)

(assert (=> b!556199 (= e!320412 (= (seekEntryOrOpen!0 (select (arr!16844 a!3118) j!142) a!3118 mask!3119) (Found!5290 j!142)))))

(declare-fun b!556200 () Bool)

(declare-fun e!320414 () Bool)

(assert (=> b!556200 (= e!320414 e!320413)))

(declare-fun res!348758 () Bool)

(assert (=> b!556200 (=> (not res!348758) (not e!320413))))

(declare-fun lt!252660 () SeekEntryResult!5290)

(assert (=> b!556200 (= res!348758 (or (= lt!252660 (MissingZero!5290 i!1132)) (= lt!252660 (MissingVacant!5290 i!1132))))))

(assert (=> b!556200 (= lt!252660 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556201 () Bool)

(declare-fun res!348760 () Bool)

(assert (=> b!556201 (=> (not res!348760) (not e!320413))))

(declare-datatypes ((List!10963 0))(
  ( (Nil!10960) (Cons!10959 (h!11944 (_ BitVec 64)) (t!17182 List!10963)) )
))
(declare-fun arrayNoDuplicates!0 (array!35068 (_ BitVec 32) List!10963) Bool)

(assert (=> b!556201 (= res!348760 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10960))))

(declare-fun b!556202 () Bool)

(declare-fun res!348756 () Bool)

(assert (=> b!556202 (=> (not res!348756) (not e!320413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35068 (_ BitVec 32)) Bool)

(assert (=> b!556202 (= res!348756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556203 () Bool)

(declare-fun res!348759 () Bool)

(assert (=> b!556203 (=> (not res!348759) (not e!320414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556203 (= res!348759 (validKeyInArray!0 (select (arr!16844 a!3118) j!142)))))

(declare-fun b!556204 () Bool)

(declare-fun res!348752 () Bool)

(assert (=> b!556204 (=> (not res!348752) (not e!320414))))

(assert (=> b!556204 (= res!348752 (validKeyInArray!0 k0!1914))))

(declare-fun b!556205 () Bool)

(assert (=> b!556205 (= e!320413 (not true))))

(assert (=> b!556205 e!320412))

(declare-fun res!348755 () Bool)

(assert (=> b!556205 (=> (not res!348755) (not e!320412))))

(assert (=> b!556205 (= res!348755 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17340 0))(
  ( (Unit!17341) )
))
(declare-fun lt!252661 () Unit!17340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17340)

(assert (=> b!556205 (= lt!252661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556206 () Bool)

(declare-fun res!348761 () Bool)

(assert (=> b!556206 (=> (not res!348761) (not e!320414))))

(declare-fun arrayContainsKey!0 (array!35068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556206 (= res!348761 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556207 () Bool)

(declare-fun res!348757 () Bool)

(assert (=> b!556207 (=> (not res!348757) (not e!320414))))

(assert (=> b!556207 (= res!348757 (and (= (size!17209 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17209 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17209 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348754 () Bool)

(assert (=> start!50834 (=> (not res!348754) (not e!320414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50834 (= res!348754 (validMask!0 mask!3119))))

(assert (=> start!50834 e!320414))

(assert (=> start!50834 true))

(declare-fun array_inv!12727 (array!35068) Bool)

(assert (=> start!50834 (array_inv!12727 a!3118)))

(assert (= (and start!50834 res!348754) b!556207))

(assert (= (and b!556207 res!348757) b!556203))

(assert (= (and b!556203 res!348759) b!556204))

(assert (= (and b!556204 res!348752) b!556206))

(assert (= (and b!556206 res!348761) b!556200))

(assert (= (and b!556200 res!348758) b!556202))

(assert (= (and b!556202 res!348756) b!556201))

(assert (= (and b!556201 res!348760) b!556198))

(assert (= (and b!556198 res!348753) b!556205))

(assert (= (and b!556205 res!348755) b!556199))

(declare-fun m!533699 () Bool)

(assert (=> b!556206 m!533699))

(declare-fun m!533701 () Bool)

(assert (=> b!556198 m!533701))

(declare-fun m!533703 () Bool)

(assert (=> b!556198 m!533703))

(assert (=> b!556198 m!533701))

(declare-fun m!533705 () Bool)

(assert (=> b!556198 m!533705))

(declare-fun m!533707 () Bool)

(assert (=> b!556198 m!533707))

(assert (=> b!556198 m!533705))

(declare-fun m!533709 () Bool)

(assert (=> b!556198 m!533709))

(assert (=> b!556198 m!533703))

(assert (=> b!556198 m!533701))

(declare-fun m!533711 () Bool)

(assert (=> b!556198 m!533711))

(declare-fun m!533713 () Bool)

(assert (=> b!556198 m!533713))

(assert (=> b!556198 m!533705))

(assert (=> b!556198 m!533707))

(assert (=> b!556199 m!533701))

(assert (=> b!556199 m!533701))

(declare-fun m!533715 () Bool)

(assert (=> b!556199 m!533715))

(declare-fun m!533717 () Bool)

(assert (=> start!50834 m!533717))

(declare-fun m!533719 () Bool)

(assert (=> start!50834 m!533719))

(declare-fun m!533721 () Bool)

(assert (=> b!556204 m!533721))

(declare-fun m!533723 () Bool)

(assert (=> b!556205 m!533723))

(declare-fun m!533725 () Bool)

(assert (=> b!556205 m!533725))

(declare-fun m!533727 () Bool)

(assert (=> b!556201 m!533727))

(declare-fun m!533729 () Bool)

(assert (=> b!556202 m!533729))

(declare-fun m!533731 () Bool)

(assert (=> b!556200 m!533731))

(assert (=> b!556203 m!533701))

(assert (=> b!556203 m!533701))

(declare-fun m!533733 () Bool)

(assert (=> b!556203 m!533733))

(check-sat (not b!556198) (not b!556201) (not b!556206) (not b!556205) (not b!556204) (not b!556203) (not b!556202) (not b!556199) (not start!50834) (not b!556200))
(check-sat)
