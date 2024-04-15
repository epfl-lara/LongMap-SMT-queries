; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52424 () Bool)

(assert start!52424)

(declare-fun b!572194 () Bool)

(declare-fun e!329117 () Bool)

(declare-fun e!329123 () Bool)

(assert (=> b!572194 (= e!329117 e!329123)))

(declare-fun res!361846 () Bool)

(assert (=> b!572194 (=> (not res!361846) (not e!329123))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5650 0))(
  ( (MissingZero!5650 (index!24827 (_ BitVec 32))) (Found!5650 (index!24828 (_ BitVec 32))) (Intermediate!5650 (undefined!6462 Bool) (index!24829 (_ BitVec 32)) (x!53706 (_ BitVec 32))) (Undefined!5650) (MissingVacant!5650 (index!24830 (_ BitVec 32))) )
))
(declare-fun lt!261028 () SeekEntryResult!5650)

(declare-fun lt!261026 () SeekEntryResult!5650)

(declare-datatypes ((array!35830 0))(
  ( (array!35831 (arr!17204 (Array (_ BitVec 32) (_ BitVec 64))) (size!17569 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35830)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35830 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572194 (= res!361846 (= lt!261026 (seekKeyOrZeroReturnVacant!0 (x!53706 lt!261028) (index!24829 lt!261028) (index!24829 lt!261028) (select (arr!17204 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361844 () Bool)

(declare-fun e!329118 () Bool)

(assert (=> start!52424 (=> (not res!361844) (not e!329118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52424 (= res!361844 (validMask!0 mask!3119))))

(assert (=> start!52424 e!329118))

(assert (=> start!52424 true))

(declare-fun array_inv!13087 (array!35830) Bool)

(assert (=> start!52424 (array_inv!13087 a!3118)))

(declare-fun b!572195 () Bool)

(declare-fun e!329124 () Bool)

(assert (=> b!572195 (= e!329118 e!329124)))

(declare-fun res!361856 () Bool)

(assert (=> b!572195 (=> (not res!361856) (not e!329124))))

(declare-fun lt!261024 () SeekEntryResult!5650)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572195 (= res!361856 (or (= lt!261024 (MissingZero!5650 i!1132)) (= lt!261024 (MissingVacant!5650 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35830 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572195 (= lt!261024 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572196 () Bool)

(declare-fun e!329119 () Bool)

(declare-fun e!329121 () Bool)

(assert (=> b!572196 (= e!329119 e!329121)))

(declare-fun res!361852 () Bool)

(assert (=> b!572196 (=> res!361852 e!329121)))

(get-info :version)

(assert (=> b!572196 (= res!361852 (or (undefined!6462 lt!261028) (not ((_ is Intermediate!5650) lt!261028))))))

(declare-fun b!572197 () Bool)

(declare-fun e!329120 () Bool)

(assert (=> b!572197 (= e!329120 (not true))))

(assert (=> b!572197 e!329119))

(declare-fun res!361855 () Bool)

(assert (=> b!572197 (=> (not res!361855) (not e!329119))))

(assert (=> b!572197 (= res!361855 (= lt!261026 (Found!5650 j!142)))))

(assert (=> b!572197 (= lt!261026 (seekEntryOrOpen!0 (select (arr!17204 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35830 (_ BitVec 32)) Bool)

(assert (=> b!572197 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17988 0))(
  ( (Unit!17989) )
))
(declare-fun lt!261023 () Unit!17988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17988)

(assert (=> b!572197 (= lt!261023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun lt!261027 () (_ BitVec 64))

(declare-fun lt!261022 () array!35830)

(declare-fun b!572198 () Bool)

(assert (=> b!572198 (= e!329123 (= (seekEntryOrOpen!0 lt!261027 lt!261022 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53706 lt!261028) (index!24829 lt!261028) (index!24829 lt!261028) lt!261027 lt!261022 mask!3119)))))

(declare-fun b!572199 () Bool)

(declare-fun res!361848 () Bool)

(assert (=> b!572199 (=> (not res!361848) (not e!329118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572199 (= res!361848 (validKeyInArray!0 (select (arr!17204 a!3118) j!142)))))

(declare-fun b!572200 () Bool)

(declare-fun res!361849 () Bool)

(assert (=> b!572200 (=> (not res!361849) (not e!329118))))

(assert (=> b!572200 (= res!361849 (validKeyInArray!0 k0!1914))))

(declare-fun b!572201 () Bool)

(declare-fun res!361847 () Bool)

(assert (=> b!572201 (=> (not res!361847) (not e!329118))))

(declare-fun arrayContainsKey!0 (array!35830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572201 (= res!361847 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572202 () Bool)

(declare-fun res!361851 () Bool)

(assert (=> b!572202 (=> (not res!361851) (not e!329118))))

(assert (=> b!572202 (= res!361851 (and (= (size!17569 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17569 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17569 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572203 () Bool)

(assert (=> b!572203 (= e!329121 e!329117)))

(declare-fun res!361854 () Bool)

(assert (=> b!572203 (=> res!361854 e!329117)))

(declare-fun lt!261020 () (_ BitVec 64))

(assert (=> b!572203 (= res!361854 (or (= lt!261020 (select (arr!17204 a!3118) j!142)) (= lt!261020 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572203 (= lt!261020 (select (arr!17204 a!3118) (index!24829 lt!261028)))))

(declare-fun b!572204 () Bool)

(assert (=> b!572204 (= e!329124 e!329120)))

(declare-fun res!361853 () Bool)

(assert (=> b!572204 (=> (not res!361853) (not e!329120))))

(declare-fun lt!261025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35830 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572204 (= res!361853 (= lt!261028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261025 lt!261027 lt!261022 mask!3119)))))

(declare-fun lt!261021 () (_ BitVec 32))

(assert (=> b!572204 (= lt!261028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261021 (select (arr!17204 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572204 (= lt!261025 (toIndex!0 lt!261027 mask!3119))))

(assert (=> b!572204 (= lt!261027 (select (store (arr!17204 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572204 (= lt!261021 (toIndex!0 (select (arr!17204 a!3118) j!142) mask!3119))))

(assert (=> b!572204 (= lt!261022 (array!35831 (store (arr!17204 a!3118) i!1132 k0!1914) (size!17569 a!3118)))))

(declare-fun b!572205 () Bool)

(declare-fun res!361850 () Bool)

(assert (=> b!572205 (=> (not res!361850) (not e!329124))))

(assert (=> b!572205 (= res!361850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572206 () Bool)

(declare-fun res!361845 () Bool)

(assert (=> b!572206 (=> (not res!361845) (not e!329124))))

(declare-datatypes ((List!11323 0))(
  ( (Nil!11320) (Cons!11319 (h!12346 (_ BitVec 64)) (t!17542 List!11323)) )
))
(declare-fun arrayNoDuplicates!0 (array!35830 (_ BitVec 32) List!11323) Bool)

(assert (=> b!572206 (= res!361845 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11320))))

(assert (= (and start!52424 res!361844) b!572202))

(assert (= (and b!572202 res!361851) b!572199))

(assert (= (and b!572199 res!361848) b!572200))

(assert (= (and b!572200 res!361849) b!572201))

(assert (= (and b!572201 res!361847) b!572195))

(assert (= (and b!572195 res!361856) b!572205))

(assert (= (and b!572205 res!361850) b!572206))

(assert (= (and b!572206 res!361845) b!572204))

(assert (= (and b!572204 res!361853) b!572197))

(assert (= (and b!572197 res!361855) b!572196))

(assert (= (and b!572196 (not res!361852)) b!572203))

(assert (= (and b!572203 (not res!361854)) b!572194))

(assert (= (and b!572194 res!361846) b!572198))

(declare-fun m!550673 () Bool)

(assert (=> b!572195 m!550673))

(declare-fun m!550675 () Bool)

(assert (=> b!572200 m!550675))

(declare-fun m!550677 () Bool)

(assert (=> b!572205 m!550677))

(declare-fun m!550679 () Bool)

(assert (=> b!572204 m!550679))

(declare-fun m!550681 () Bool)

(assert (=> b!572204 m!550681))

(declare-fun m!550683 () Bool)

(assert (=> b!572204 m!550683))

(assert (=> b!572204 m!550681))

(declare-fun m!550685 () Bool)

(assert (=> b!572204 m!550685))

(declare-fun m!550687 () Bool)

(assert (=> b!572204 m!550687))

(assert (=> b!572204 m!550681))

(declare-fun m!550689 () Bool)

(assert (=> b!572204 m!550689))

(declare-fun m!550691 () Bool)

(assert (=> b!572204 m!550691))

(declare-fun m!550693 () Bool)

(assert (=> start!52424 m!550693))

(declare-fun m!550695 () Bool)

(assert (=> start!52424 m!550695))

(declare-fun m!550697 () Bool)

(assert (=> b!572206 m!550697))

(declare-fun m!550699 () Bool)

(assert (=> b!572198 m!550699))

(declare-fun m!550701 () Bool)

(assert (=> b!572198 m!550701))

(assert (=> b!572197 m!550681))

(assert (=> b!572197 m!550681))

(declare-fun m!550703 () Bool)

(assert (=> b!572197 m!550703))

(declare-fun m!550705 () Bool)

(assert (=> b!572197 m!550705))

(declare-fun m!550707 () Bool)

(assert (=> b!572197 m!550707))

(declare-fun m!550709 () Bool)

(assert (=> b!572201 m!550709))

(assert (=> b!572203 m!550681))

(declare-fun m!550711 () Bool)

(assert (=> b!572203 m!550711))

(assert (=> b!572199 m!550681))

(assert (=> b!572199 m!550681))

(declare-fun m!550713 () Bool)

(assert (=> b!572199 m!550713))

(assert (=> b!572194 m!550681))

(assert (=> b!572194 m!550681))

(declare-fun m!550715 () Bool)

(assert (=> b!572194 m!550715))

(check-sat (not b!572204) (not b!572206) (not start!52424) (not b!572194) (not b!572195) (not b!572199) (not b!572200) (not b!572198) (not b!572197) (not b!572201) (not b!572205))
(check-sat)
