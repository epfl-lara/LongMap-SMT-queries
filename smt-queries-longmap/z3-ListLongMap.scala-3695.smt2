; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50832 () Bool)

(assert start!50832)

(declare-fun b!555803 () Bool)

(declare-fun res!348112 () Bool)

(declare-fun e!320337 () Bool)

(assert (=> b!555803 (=> (not res!348112) (not e!320337))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555803 (= res!348112 (validKeyInArray!0 k0!1914))))

(declare-fun b!555804 () Bool)

(declare-fun res!348115 () Bool)

(assert (=> b!555804 (=> (not res!348115) (not e!320337))))

(declare-datatypes ((array!35004 0))(
  ( (array!35005 (arr!16810 (Array (_ BitVec 32) (_ BitVec 64))) (size!17174 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35004)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555804 (= res!348115 (validKeyInArray!0 (select (arr!16810 a!3118) j!142)))))

(declare-fun b!555805 () Bool)

(declare-fun res!348111 () Bool)

(assert (=> b!555805 (=> (not res!348111) (not e!320337))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555805 (= res!348111 (and (= (size!17174 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17174 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17174 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555806 () Bool)

(declare-fun res!348110 () Bool)

(declare-fun e!320338 () Bool)

(assert (=> b!555806 (=> (not res!348110) (not e!320338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35004 (_ BitVec 32)) Bool)

(assert (=> b!555806 (= res!348110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555807 () Bool)

(assert (=> b!555807 (= e!320337 e!320338)))

(declare-fun res!348113 () Bool)

(assert (=> b!555807 (=> (not res!348113) (not e!320338))))

(declare-datatypes ((SeekEntryResult!5215 0))(
  ( (MissingZero!5215 (index!23087 (_ BitVec 32))) (Found!5215 (index!23088 (_ BitVec 32))) (Intermediate!5215 (undefined!6027 Bool) (index!23089 (_ BitVec 32)) (x!52140 (_ BitVec 32))) (Undefined!5215) (MissingVacant!5215 (index!23090 (_ BitVec 32))) )
))
(declare-fun lt!252635 () SeekEntryResult!5215)

(assert (=> b!555807 (= res!348113 (or (= lt!252635 (MissingZero!5215 i!1132)) (= lt!252635 (MissingVacant!5215 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35004 (_ BitVec 32)) SeekEntryResult!5215)

(assert (=> b!555807 (= lt!252635 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!348118 () Bool)

(assert (=> start!50832 (=> (not res!348118) (not e!320337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50832 (= res!348118 (validMask!0 mask!3119))))

(assert (=> start!50832 e!320337))

(assert (=> start!50832 true))

(declare-fun array_inv!12669 (array!35004) Bool)

(assert (=> start!50832 (array_inv!12669 a!3118)))

(declare-fun b!555808 () Bool)

(declare-fun res!348114 () Bool)

(assert (=> b!555808 (=> (not res!348114) (not e!320338))))

(declare-datatypes ((List!10797 0))(
  ( (Nil!10794) (Cons!10793 (h!11781 (_ BitVec 64)) (t!17017 List!10797)) )
))
(declare-fun arrayNoDuplicates!0 (array!35004 (_ BitVec 32) List!10797) Bool)

(assert (=> b!555808 (= res!348114 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10794))))

(declare-fun b!555809 () Bool)

(declare-fun e!320340 () Bool)

(assert (=> b!555809 (= e!320338 e!320340)))

(declare-fun res!348116 () Bool)

(assert (=> b!555809 (=> (not res!348116) (not e!320340))))

(declare-fun lt!252637 () SeekEntryResult!5215)

(declare-fun lt!252640 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35004 (_ BitVec 32)) SeekEntryResult!5215)

(assert (=> b!555809 (= res!348116 (= lt!252637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252640 (select (store (arr!16810 a!3118) i!1132 k0!1914) j!142) (array!35005 (store (arr!16810 a!3118) i!1132 k0!1914) (size!17174 a!3118)) mask!3119)))))

(declare-fun lt!252639 () (_ BitVec 32))

(assert (=> b!555809 (= lt!252637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252639 (select (arr!16810 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555809 (= lt!252640 (toIndex!0 (select (store (arr!16810 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555809 (= lt!252639 (toIndex!0 (select (arr!16810 a!3118) j!142) mask!3119))))

(declare-fun b!555810 () Bool)

(assert (=> b!555810 (= e!320340 (not true))))

(declare-fun lt!252638 () SeekEntryResult!5215)

(get-info :version)

(assert (=> b!555810 (and (= lt!252638 (Found!5215 j!142)) (or (undefined!6027 lt!252637) (not ((_ is Intermediate!5215) lt!252637)) (= (select (arr!16810 a!3118) (index!23089 lt!252637)) (select (arr!16810 a!3118) j!142)) (not (= (select (arr!16810 a!3118) (index!23089 lt!252637)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252638 (MissingZero!5215 (index!23089 lt!252637)))))))

(assert (=> b!555810 (= lt!252638 (seekEntryOrOpen!0 (select (arr!16810 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555810 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17275 0))(
  ( (Unit!17276) )
))
(declare-fun lt!252636 () Unit!17275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17275)

(assert (=> b!555810 (= lt!252636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555811 () Bool)

(declare-fun res!348117 () Bool)

(assert (=> b!555811 (=> (not res!348117) (not e!320337))))

(declare-fun arrayContainsKey!0 (array!35004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555811 (= res!348117 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50832 res!348118) b!555805))

(assert (= (and b!555805 res!348111) b!555804))

(assert (= (and b!555804 res!348115) b!555803))

(assert (= (and b!555803 res!348112) b!555811))

(assert (= (and b!555811 res!348117) b!555807))

(assert (= (and b!555807 res!348113) b!555806))

(assert (= (and b!555806 res!348110) b!555808))

(assert (= (and b!555808 res!348114) b!555809))

(assert (= (and b!555809 res!348116) b!555810))

(declare-fun m!533693 () Bool)

(assert (=> b!555808 m!533693))

(declare-fun m!533695 () Bool)

(assert (=> b!555804 m!533695))

(assert (=> b!555804 m!533695))

(declare-fun m!533697 () Bool)

(assert (=> b!555804 m!533697))

(declare-fun m!533699 () Bool)

(assert (=> b!555803 m!533699))

(declare-fun m!533701 () Bool)

(assert (=> b!555809 m!533701))

(declare-fun m!533703 () Bool)

(assert (=> b!555809 m!533703))

(assert (=> b!555809 m!533695))

(declare-fun m!533705 () Bool)

(assert (=> b!555809 m!533705))

(assert (=> b!555809 m!533695))

(declare-fun m!533707 () Bool)

(assert (=> b!555809 m!533707))

(assert (=> b!555809 m!533695))

(assert (=> b!555809 m!533701))

(declare-fun m!533709 () Bool)

(assert (=> b!555809 m!533709))

(assert (=> b!555809 m!533701))

(declare-fun m!533711 () Bool)

(assert (=> b!555809 m!533711))

(declare-fun m!533713 () Bool)

(assert (=> start!50832 m!533713))

(declare-fun m!533715 () Bool)

(assert (=> start!50832 m!533715))

(assert (=> b!555810 m!533695))

(declare-fun m!533717 () Bool)

(assert (=> b!555810 m!533717))

(declare-fun m!533719 () Bool)

(assert (=> b!555810 m!533719))

(declare-fun m!533721 () Bool)

(assert (=> b!555810 m!533721))

(assert (=> b!555810 m!533695))

(declare-fun m!533723 () Bool)

(assert (=> b!555810 m!533723))

(declare-fun m!533725 () Bool)

(assert (=> b!555807 m!533725))

(declare-fun m!533727 () Bool)

(assert (=> b!555806 m!533727))

(declare-fun m!533729 () Bool)

(assert (=> b!555811 m!533729))

(check-sat (not b!555807) (not b!555803) (not b!555811) (not b!555809) (not b!555806) (not b!555808) (not b!555804) (not b!555810) (not start!50832))
(check-sat)
