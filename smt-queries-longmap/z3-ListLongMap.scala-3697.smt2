; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50800 () Bool)

(assert start!50800)

(declare-fun b!555792 () Bool)

(declare-fun res!348206 () Bool)

(declare-fun e!320295 () Bool)

(assert (=> b!555792 (=> (not res!348206) (not e!320295))))

(declare-datatypes ((array!35025 0))(
  ( (array!35026 (arr!16822 (Array (_ BitVec 32) (_ BitVec 64))) (size!17186 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35025)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555792 (= res!348206 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555793 () Bool)

(declare-fun e!320294 () Bool)

(assert (=> b!555793 (= e!320294 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5271 0))(
  ( (MissingZero!5271 (index!23311 (_ BitVec 32))) (Found!5271 (index!23312 (_ BitVec 32))) (Intermediate!5271 (undefined!6083 Bool) (index!23313 (_ BitVec 32)) (x!52209 (_ BitVec 32))) (Undefined!5271) (MissingVacant!5271 (index!23314 (_ BitVec 32))) )
))
(declare-fun lt!252650 () SeekEntryResult!5271)

(declare-fun lt!252652 () SeekEntryResult!5271)

(get-info :version)

(assert (=> b!555793 (and (= lt!252652 (Found!5271 j!142)) (or (undefined!6083 lt!252650) (not ((_ is Intermediate!5271) lt!252650)) (= (select (arr!16822 a!3118) (index!23313 lt!252650)) (select (arr!16822 a!3118) j!142)) (not (= (select (arr!16822 a!3118) (index!23313 lt!252650)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252652 (MissingZero!5271 (index!23313 lt!252650)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35025 (_ BitVec 32)) SeekEntryResult!5271)

(assert (=> b!555793 (= lt!252652 (seekEntryOrOpen!0 (select (arr!16822 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35025 (_ BitVec 32)) Bool)

(assert (=> b!555793 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17316 0))(
  ( (Unit!17317) )
))
(declare-fun lt!252651 () Unit!17316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17316)

(assert (=> b!555793 (= lt!252651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555794 () Bool)

(declare-fun e!320292 () Bool)

(assert (=> b!555794 (= e!320295 e!320292)))

(declare-fun res!348204 () Bool)

(assert (=> b!555794 (=> (not res!348204) (not e!320292))))

(declare-fun lt!252654 () SeekEntryResult!5271)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555794 (= res!348204 (or (= lt!252654 (MissingZero!5271 i!1132)) (= lt!252654 (MissingVacant!5271 i!1132))))))

(assert (=> b!555794 (= lt!252654 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!348212 () Bool)

(assert (=> start!50800 (=> (not res!348212) (not e!320295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50800 (= res!348212 (validMask!0 mask!3119))))

(assert (=> start!50800 e!320295))

(assert (=> start!50800 true))

(declare-fun array_inv!12618 (array!35025) Bool)

(assert (=> start!50800 (array_inv!12618 a!3118)))

(declare-fun b!555795 () Bool)

(assert (=> b!555795 (= e!320292 e!320294)))

(declare-fun res!348209 () Bool)

(assert (=> b!555795 (=> (not res!348209) (not e!320294))))

(declare-fun lt!252653 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35025 (_ BitVec 32)) SeekEntryResult!5271)

(assert (=> b!555795 (= res!348209 (= lt!252650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252653 (select (store (arr!16822 a!3118) i!1132 k0!1914) j!142) (array!35026 (store (arr!16822 a!3118) i!1132 k0!1914) (size!17186 a!3118)) mask!3119)))))

(declare-fun lt!252655 () (_ BitVec 32))

(assert (=> b!555795 (= lt!252650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252655 (select (arr!16822 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555795 (= lt!252653 (toIndex!0 (select (store (arr!16822 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555795 (= lt!252655 (toIndex!0 (select (arr!16822 a!3118) j!142) mask!3119))))

(declare-fun b!555796 () Bool)

(declare-fun res!348207 () Bool)

(assert (=> b!555796 (=> (not res!348207) (not e!320292))))

(declare-datatypes ((List!10902 0))(
  ( (Nil!10899) (Cons!10898 (h!11883 (_ BitVec 64)) (t!17130 List!10902)) )
))
(declare-fun arrayNoDuplicates!0 (array!35025 (_ BitVec 32) List!10902) Bool)

(assert (=> b!555796 (= res!348207 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10899))))

(declare-fun b!555797 () Bool)

(declare-fun res!348211 () Bool)

(assert (=> b!555797 (=> (not res!348211) (not e!320292))))

(assert (=> b!555797 (= res!348211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555798 () Bool)

(declare-fun res!348208 () Bool)

(assert (=> b!555798 (=> (not res!348208) (not e!320295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555798 (= res!348208 (validKeyInArray!0 (select (arr!16822 a!3118) j!142)))))

(declare-fun b!555799 () Bool)

(declare-fun res!348205 () Bool)

(assert (=> b!555799 (=> (not res!348205) (not e!320295))))

(assert (=> b!555799 (= res!348205 (and (= (size!17186 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17186 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17186 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555800 () Bool)

(declare-fun res!348210 () Bool)

(assert (=> b!555800 (=> (not res!348210) (not e!320295))))

(assert (=> b!555800 (= res!348210 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50800 res!348212) b!555799))

(assert (= (and b!555799 res!348205) b!555798))

(assert (= (and b!555798 res!348208) b!555800))

(assert (= (and b!555800 res!348210) b!555792))

(assert (= (and b!555792 res!348206) b!555794))

(assert (= (and b!555794 res!348204) b!555797))

(assert (= (and b!555797 res!348211) b!555796))

(assert (= (and b!555796 res!348207) b!555795))

(assert (= (and b!555795 res!348209) b!555793))

(declare-fun m!533621 () Bool)

(assert (=> b!555797 m!533621))

(declare-fun m!533623 () Bool)

(assert (=> b!555793 m!533623))

(declare-fun m!533625 () Bool)

(assert (=> b!555793 m!533625))

(declare-fun m!533627 () Bool)

(assert (=> b!555793 m!533627))

(declare-fun m!533629 () Bool)

(assert (=> b!555793 m!533629))

(assert (=> b!555793 m!533623))

(declare-fun m!533631 () Bool)

(assert (=> b!555793 m!533631))

(declare-fun m!533633 () Bool)

(assert (=> b!555796 m!533633))

(assert (=> b!555798 m!533623))

(assert (=> b!555798 m!533623))

(declare-fun m!533635 () Bool)

(assert (=> b!555798 m!533635))

(declare-fun m!533637 () Bool)

(assert (=> b!555794 m!533637))

(assert (=> b!555795 m!533623))

(declare-fun m!533639 () Bool)

(assert (=> b!555795 m!533639))

(assert (=> b!555795 m!533623))

(declare-fun m!533641 () Bool)

(assert (=> b!555795 m!533641))

(assert (=> b!555795 m!533641))

(declare-fun m!533643 () Bool)

(assert (=> b!555795 m!533643))

(declare-fun m!533645 () Bool)

(assert (=> b!555795 m!533645))

(assert (=> b!555795 m!533623))

(declare-fun m!533647 () Bool)

(assert (=> b!555795 m!533647))

(assert (=> b!555795 m!533641))

(declare-fun m!533649 () Bool)

(assert (=> b!555795 m!533649))

(declare-fun m!533651 () Bool)

(assert (=> b!555792 m!533651))

(declare-fun m!533653 () Bool)

(assert (=> b!555800 m!533653))

(declare-fun m!533655 () Bool)

(assert (=> start!50800 m!533655))

(declare-fun m!533657 () Bool)

(assert (=> start!50800 m!533657))

(check-sat (not b!555792) (not start!50800) (not b!555796) (not b!555795) (not b!555794) (not b!555800) (not b!555798) (not b!555793) (not b!555797))
(check-sat)
