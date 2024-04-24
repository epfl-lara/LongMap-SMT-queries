; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52920 () Bool)

(assert start!52920)

(declare-fun res!364690 () Bool)

(declare-fun e!331738 () Bool)

(assert (=> start!52920 (=> (not res!364690) (not e!331738))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52920 (= res!364690 (validMask!0 mask!3119))))

(assert (=> start!52920 e!331738))

(assert (=> start!52920 true))

(declare-datatypes ((array!35955 0))(
  ( (array!35956 (arr!17257 (Array (_ BitVec 32) (_ BitVec 64))) (size!17621 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35955)

(declare-fun array_inv!13116 (array!35955) Bool)

(assert (=> start!52920 (array_inv!13116 a!3118)))

(declare-fun b!576562 () Bool)

(declare-fun res!364696 () Bool)

(declare-fun e!331737 () Bool)

(assert (=> b!576562 (=> (not res!364696) (not e!331737))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5662 0))(
  ( (MissingZero!5662 (index!24875 (_ BitVec 32))) (Found!5662 (index!24876 (_ BitVec 32))) (Intermediate!5662 (undefined!6474 Bool) (index!24877 (_ BitVec 32)) (x!53920 (_ BitVec 32))) (Undefined!5662) (MissingVacant!5662 (index!24878 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35955 (_ BitVec 32)) SeekEntryResult!5662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576562 (= res!364696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17257 a!3118) j!142) mask!3119) (select (arr!17257 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17257 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17257 a!3118) i!1132 k0!1914) j!142) (array!35956 (store (arr!17257 a!3118) i!1132 k0!1914) (size!17621 a!3118)) mask!3119)))))

(declare-fun b!576563 () Bool)

(declare-fun res!364693 () Bool)

(assert (=> b!576563 (=> (not res!364693) (not e!331738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576563 (= res!364693 (validKeyInArray!0 k0!1914))))

(declare-fun b!576564 () Bool)

(declare-fun res!364692 () Bool)

(assert (=> b!576564 (=> (not res!364692) (not e!331738))))

(assert (=> b!576564 (= res!364692 (validKeyInArray!0 (select (arr!17257 a!3118) j!142)))))

(declare-fun b!576565 () Bool)

(assert (=> b!576565 (= e!331737 (not true))))

(declare-fun e!331740 () Bool)

(assert (=> b!576565 e!331740))

(declare-fun res!364698 () Bool)

(assert (=> b!576565 (=> (not res!364698) (not e!331740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35955 (_ BitVec 32)) Bool)

(assert (=> b!576565 (= res!364698 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18097 0))(
  ( (Unit!18098) )
))
(declare-fun lt!263758 () Unit!18097)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18097)

(assert (=> b!576565 (= lt!263758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576566 () Bool)

(declare-fun res!364697 () Bool)

(assert (=> b!576566 (=> (not res!364697) (not e!331737))))

(declare-datatypes ((List!11244 0))(
  ( (Nil!11241) (Cons!11240 (h!12285 (_ BitVec 64)) (t!17464 List!11244)) )
))
(declare-fun arrayNoDuplicates!0 (array!35955 (_ BitVec 32) List!11244) Bool)

(assert (=> b!576566 (= res!364697 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11241))))

(declare-fun b!576567 () Bool)

(assert (=> b!576567 (= e!331738 e!331737)))

(declare-fun res!364699 () Bool)

(assert (=> b!576567 (=> (not res!364699) (not e!331737))))

(declare-fun lt!263757 () SeekEntryResult!5662)

(assert (=> b!576567 (= res!364699 (or (= lt!263757 (MissingZero!5662 i!1132)) (= lt!263757 (MissingVacant!5662 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35955 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!576567 (= lt!263757 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576568 () Bool)

(declare-fun res!364695 () Bool)

(assert (=> b!576568 (=> (not res!364695) (not e!331738))))

(declare-fun arrayContainsKey!0 (array!35955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576568 (= res!364695 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576569 () Bool)

(declare-fun res!364691 () Bool)

(assert (=> b!576569 (=> (not res!364691) (not e!331738))))

(assert (=> b!576569 (= res!364691 (and (= (size!17621 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17621 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17621 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576570 () Bool)

(declare-fun res!364694 () Bool)

(assert (=> b!576570 (=> (not res!364694) (not e!331737))))

(assert (=> b!576570 (= res!364694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576571 () Bool)

(assert (=> b!576571 (= e!331740 (= (seekEntryOrOpen!0 (select (arr!17257 a!3118) j!142) a!3118 mask!3119) (Found!5662 j!142)))))

(assert (= (and start!52920 res!364690) b!576569))

(assert (= (and b!576569 res!364691) b!576564))

(assert (= (and b!576564 res!364692) b!576563))

(assert (= (and b!576563 res!364693) b!576568))

(assert (= (and b!576568 res!364695) b!576567))

(assert (= (and b!576567 res!364699) b!576570))

(assert (= (and b!576570 res!364694) b!576566))

(assert (= (and b!576566 res!364697) b!576562))

(assert (= (and b!576562 res!364696) b!576565))

(assert (= (and b!576565 res!364698) b!576571))

(declare-fun m!555647 () Bool)

(assert (=> b!576571 m!555647))

(assert (=> b!576571 m!555647))

(declare-fun m!555649 () Bool)

(assert (=> b!576571 m!555649))

(declare-fun m!555651 () Bool)

(assert (=> b!576566 m!555651))

(declare-fun m!555653 () Bool)

(assert (=> b!576565 m!555653))

(declare-fun m!555655 () Bool)

(assert (=> b!576565 m!555655))

(declare-fun m!555657 () Bool)

(assert (=> b!576570 m!555657))

(declare-fun m!555659 () Bool)

(assert (=> b!576563 m!555659))

(declare-fun m!555661 () Bool)

(assert (=> b!576568 m!555661))

(declare-fun m!555663 () Bool)

(assert (=> b!576567 m!555663))

(assert (=> b!576562 m!555647))

(declare-fun m!555665 () Bool)

(assert (=> b!576562 m!555665))

(assert (=> b!576562 m!555647))

(declare-fun m!555667 () Bool)

(assert (=> b!576562 m!555667))

(declare-fun m!555669 () Bool)

(assert (=> b!576562 m!555669))

(assert (=> b!576562 m!555667))

(declare-fun m!555671 () Bool)

(assert (=> b!576562 m!555671))

(assert (=> b!576562 m!555665))

(assert (=> b!576562 m!555647))

(declare-fun m!555673 () Bool)

(assert (=> b!576562 m!555673))

(declare-fun m!555675 () Bool)

(assert (=> b!576562 m!555675))

(assert (=> b!576562 m!555667))

(assert (=> b!576562 m!555669))

(assert (=> b!576564 m!555647))

(assert (=> b!576564 m!555647))

(declare-fun m!555677 () Bool)

(assert (=> b!576564 m!555677))

(declare-fun m!555679 () Bool)

(assert (=> start!52920 m!555679))

(declare-fun m!555681 () Bool)

(assert (=> start!52920 m!555681))

(check-sat (not start!52920) (not b!576570) (not b!576571) (not b!576568) (not b!576567) (not b!576564) (not b!576563) (not b!576566) (not b!576565) (not b!576562))
(check-sat)
