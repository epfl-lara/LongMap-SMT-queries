; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52434 () Bool)

(assert start!52434)

(declare-fun b!571729 () Bool)

(declare-fun res!361134 () Bool)

(declare-fun e!328846 () Bool)

(assert (=> b!571729 (=> (not res!361134) (not e!328846))))

(declare-datatypes ((array!35778 0))(
  ( (array!35779 (arr!17176 (Array (_ BitVec 32) (_ BitVec 64))) (size!17540 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35778)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35778 (_ BitVec 32)) Bool)

(assert (=> b!571729 (= res!361134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571730 () Bool)

(declare-fun e!328844 () Bool)

(assert (=> b!571730 (= e!328844 e!328846)))

(declare-fun res!361139 () Bool)

(assert (=> b!571730 (=> (not res!361139) (not e!328846))))

(declare-datatypes ((SeekEntryResult!5581 0))(
  ( (MissingZero!5581 (index!24551 (_ BitVec 32))) (Found!5581 (index!24552 (_ BitVec 32))) (Intermediate!5581 (undefined!6393 Bool) (index!24553 (_ BitVec 32)) (x!53581 (_ BitVec 32))) (Undefined!5581) (MissingVacant!5581 (index!24554 (_ BitVec 32))) )
))
(declare-fun lt!260718 () SeekEntryResult!5581)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571730 (= res!361139 (or (= lt!260718 (MissingZero!5581 i!1132)) (= lt!260718 (MissingVacant!5581 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!571730 (= lt!260718 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571731 () Bool)

(declare-fun res!361141 () Bool)

(assert (=> b!571731 (=> (not res!361141) (not e!328844))))

(declare-fun arrayContainsKey!0 (array!35778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571731 (= res!361141 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571732 () Bool)

(declare-fun e!328850 () Bool)

(assert (=> b!571732 (= e!328850 (not true))))

(declare-fun e!328848 () Bool)

(assert (=> b!571732 e!328848))

(declare-fun res!361132 () Bool)

(assert (=> b!571732 (=> (not res!361132) (not e!328848))))

(declare-fun lt!260721 () SeekEntryResult!5581)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571732 (= res!361132 (= lt!260721 (Found!5581 j!142)))))

(assert (=> b!571732 (= lt!260721 (seekEntryOrOpen!0 (select (arr!17176 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571732 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17935 0))(
  ( (Unit!17936) )
))
(declare-fun lt!260719 () Unit!17935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17935)

(assert (=> b!571732 (= lt!260719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571733 () Bool)

(declare-fun res!361143 () Bool)

(assert (=> b!571733 (=> (not res!361143) (not e!328844))))

(assert (=> b!571733 (= res!361143 (and (= (size!17540 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17540 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17540 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571734 () Bool)

(declare-fun e!328847 () Bool)

(declare-fun e!328849 () Bool)

(assert (=> b!571734 (= e!328847 e!328849)))

(declare-fun res!361137 () Bool)

(assert (=> b!571734 (=> (not res!361137) (not e!328849))))

(declare-fun lt!260720 () SeekEntryResult!5581)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!571734 (= res!361137 (= lt!260721 (seekKeyOrZeroReturnVacant!0 (x!53581 lt!260720) (index!24553 lt!260720) (index!24553 lt!260720) (select (arr!17176 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!260723 () array!35778)

(declare-fun lt!260722 () (_ BitVec 64))

(declare-fun b!571735 () Bool)

(assert (=> b!571735 (= e!328849 (= (seekEntryOrOpen!0 lt!260722 lt!260723 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53581 lt!260720) (index!24553 lt!260720) (index!24553 lt!260720) lt!260722 lt!260723 mask!3119)))))

(declare-fun res!361144 () Bool)

(assert (=> start!52434 (=> (not res!361144) (not e!328844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52434 (= res!361144 (validMask!0 mask!3119))))

(assert (=> start!52434 e!328844))

(assert (=> start!52434 true))

(declare-fun array_inv!13035 (array!35778) Bool)

(assert (=> start!52434 (array_inv!13035 a!3118)))

(declare-fun b!571736 () Bool)

(declare-fun res!361133 () Bool)

(assert (=> b!571736 (=> (not res!361133) (not e!328846))))

(declare-datatypes ((List!11163 0))(
  ( (Nil!11160) (Cons!11159 (h!12189 (_ BitVec 64)) (t!17383 List!11163)) )
))
(declare-fun arrayNoDuplicates!0 (array!35778 (_ BitVec 32) List!11163) Bool)

(assert (=> b!571736 (= res!361133 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11160))))

(declare-fun b!571737 () Bool)

(declare-fun e!328845 () Bool)

(assert (=> b!571737 (= e!328848 e!328845)))

(declare-fun res!361136 () Bool)

(assert (=> b!571737 (=> res!361136 e!328845)))

(get-info :version)

(assert (=> b!571737 (= res!361136 (or (undefined!6393 lt!260720) (not ((_ is Intermediate!5581) lt!260720))))))

(declare-fun b!571738 () Bool)

(assert (=> b!571738 (= e!328845 e!328847)))

(declare-fun res!361142 () Bool)

(assert (=> b!571738 (=> res!361142 e!328847)))

(declare-fun lt!260717 () (_ BitVec 64))

(assert (=> b!571738 (= res!361142 (or (= lt!260717 (select (arr!17176 a!3118) j!142)) (= lt!260717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571738 (= lt!260717 (select (arr!17176 a!3118) (index!24553 lt!260720)))))

(declare-fun b!571739 () Bool)

(declare-fun res!361135 () Bool)

(assert (=> b!571739 (=> (not res!361135) (not e!328844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571739 (= res!361135 (validKeyInArray!0 (select (arr!17176 a!3118) j!142)))))

(declare-fun b!571740 () Bool)

(assert (=> b!571740 (= e!328846 e!328850)))

(declare-fun res!361140 () Bool)

(assert (=> b!571740 (=> (not res!361140) (not e!328850))))

(declare-fun lt!260725 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!571740 (= res!361140 (= lt!260720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260725 lt!260722 lt!260723 mask!3119)))))

(declare-fun lt!260724 () (_ BitVec 32))

(assert (=> b!571740 (= lt!260720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260724 (select (arr!17176 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571740 (= lt!260725 (toIndex!0 lt!260722 mask!3119))))

(assert (=> b!571740 (= lt!260722 (select (store (arr!17176 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571740 (= lt!260724 (toIndex!0 (select (arr!17176 a!3118) j!142) mask!3119))))

(assert (=> b!571740 (= lt!260723 (array!35779 (store (arr!17176 a!3118) i!1132 k0!1914) (size!17540 a!3118)))))

(declare-fun b!571741 () Bool)

(declare-fun res!361138 () Bool)

(assert (=> b!571741 (=> (not res!361138) (not e!328844))))

(assert (=> b!571741 (= res!361138 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52434 res!361144) b!571733))

(assert (= (and b!571733 res!361143) b!571739))

(assert (= (and b!571739 res!361135) b!571741))

(assert (= (and b!571741 res!361138) b!571731))

(assert (= (and b!571731 res!361141) b!571730))

(assert (= (and b!571730 res!361139) b!571729))

(assert (= (and b!571729 res!361134) b!571736))

(assert (= (and b!571736 res!361133) b!571740))

(assert (= (and b!571740 res!361140) b!571732))

(assert (= (and b!571732 res!361132) b!571737))

(assert (= (and b!571737 (not res!361136)) b!571738))

(assert (= (and b!571738 (not res!361142)) b!571734))

(assert (= (and b!571734 res!361137) b!571735))

(declare-fun m!550727 () Bool)

(assert (=> b!571739 m!550727))

(assert (=> b!571739 m!550727))

(declare-fun m!550729 () Bool)

(assert (=> b!571739 m!550729))

(declare-fun m!550731 () Bool)

(assert (=> b!571741 m!550731))

(declare-fun m!550733 () Bool)

(assert (=> b!571730 m!550733))

(assert (=> b!571738 m!550727))

(declare-fun m!550735 () Bool)

(assert (=> b!571738 m!550735))

(declare-fun m!550737 () Bool)

(assert (=> b!571731 m!550737))

(assert (=> b!571740 m!550727))

(declare-fun m!550739 () Bool)

(assert (=> b!571740 m!550739))

(declare-fun m!550741 () Bool)

(assert (=> b!571740 m!550741))

(assert (=> b!571740 m!550727))

(assert (=> b!571740 m!550727))

(declare-fun m!550743 () Bool)

(assert (=> b!571740 m!550743))

(declare-fun m!550745 () Bool)

(assert (=> b!571740 m!550745))

(declare-fun m!550747 () Bool)

(assert (=> b!571740 m!550747))

(declare-fun m!550749 () Bool)

(assert (=> b!571740 m!550749))

(declare-fun m!550751 () Bool)

(assert (=> b!571735 m!550751))

(declare-fun m!550753 () Bool)

(assert (=> b!571735 m!550753))

(declare-fun m!550755 () Bool)

(assert (=> b!571736 m!550755))

(declare-fun m!550757 () Bool)

(assert (=> start!52434 m!550757))

(declare-fun m!550759 () Bool)

(assert (=> start!52434 m!550759))

(assert (=> b!571734 m!550727))

(assert (=> b!571734 m!550727))

(declare-fun m!550761 () Bool)

(assert (=> b!571734 m!550761))

(declare-fun m!550763 () Bool)

(assert (=> b!571729 m!550763))

(assert (=> b!571732 m!550727))

(assert (=> b!571732 m!550727))

(declare-fun m!550765 () Bool)

(assert (=> b!571732 m!550765))

(declare-fun m!550767 () Bool)

(assert (=> b!571732 m!550767))

(declare-fun m!550769 () Bool)

(assert (=> b!571732 m!550769))

(check-sat (not b!571729) (not b!571741) (not b!571734) (not b!571730) (not b!571732) (not b!571739) (not b!571731) (not b!571736) (not start!52434) (not b!571735) (not b!571740))
(check-sat)
