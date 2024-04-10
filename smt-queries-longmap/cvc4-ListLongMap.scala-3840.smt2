; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52794 () Bool)

(assert start!52794)

(declare-fun b!575769 () Bool)

(declare-fun e!331293 () Bool)

(declare-datatypes ((SeekEntryResult!5701 0))(
  ( (MissingZero!5701 (index!25031 (_ BitVec 32))) (Found!5701 (index!25032 (_ BitVec 32))) (Intermediate!5701 (undefined!6513 Bool) (index!25033 (_ BitVec 32)) (x!53918 (_ BitVec 32))) (Undefined!5701) (MissingVacant!5701 (index!25034 (_ BitVec 32))) )
))
(declare-fun lt!263412 () SeekEntryResult!5701)

(declare-fun lt!263411 () SeekEntryResult!5701)

(assert (=> b!575769 (= e!331293 (= lt!263412 lt!263411))))

(declare-fun lt!263421 () SeekEntryResult!5701)

(declare-fun lt!263415 () SeekEntryResult!5701)

(assert (=> b!575769 (= lt!263421 lt!263415)))

(declare-datatypes ((Unit!18104 0))(
  ( (Unit!18105) )
))
(declare-fun lt!263422 () Unit!18104)

(declare-fun lt!263409 () SeekEntryResult!5701)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35939 0))(
  ( (array!35940 (arr!17252 (Array (_ BitVec 32) (_ BitVec 64))) (size!17616 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35939)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18104)

(assert (=> b!575769 (= lt!263422 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53918 lt!263409) (index!25033 lt!263409) (index!25033 lt!263409) mask!3119))))

(declare-fun b!575770 () Bool)

(declare-fun e!331291 () Bool)

(declare-fun e!331295 () Bool)

(assert (=> b!575770 (= e!331291 (not e!331295))))

(declare-fun res!364187 () Bool)

(assert (=> b!575770 (=> res!364187 e!331295)))

(assert (=> b!575770 (= res!364187 (or (undefined!6513 lt!263409) (not (is-Intermediate!5701 lt!263409))))))

(declare-fun lt!263417 () SeekEntryResult!5701)

(assert (=> b!575770 (= lt!263412 lt!263417)))

(assert (=> b!575770 (= lt!263417 (Found!5701 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35939 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!575770 (= lt!263412 (seekEntryOrOpen!0 (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35939 (_ BitVec 32)) Bool)

(assert (=> b!575770 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263419 () Unit!18104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18104)

(assert (=> b!575770 (= lt!263419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575771 () Bool)

(declare-fun res!364193 () Bool)

(declare-fun e!331296 () Bool)

(assert (=> b!575771 (=> (not res!364193) (not e!331296))))

(assert (=> b!575771 (= res!364193 (and (= (size!17616 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17616 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17616 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575772 () Bool)

(declare-fun e!331292 () Bool)

(assert (=> b!575772 (= e!331292 e!331293)))

(declare-fun res!364189 () Bool)

(assert (=> b!575772 (=> res!364189 e!331293)))

(declare-fun lt!263420 () (_ BitVec 64))

(assert (=> b!575772 (= res!364189 (or (bvslt (index!25033 lt!263409) #b00000000000000000000000000000000) (bvsge (index!25033 lt!263409) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53918 lt!263409) #b01111111111111111111111111111110) (bvslt (x!53918 lt!263409) #b00000000000000000000000000000000) (not (= lt!263420 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17252 a!3118) i!1132 k!1914) (index!25033 lt!263409)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263421 lt!263417))))))

(assert (=> b!575772 (= lt!263411 lt!263415)))

(declare-fun lt!263416 () array!35939)

(declare-fun lt!263413 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35939 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!575772 (= lt!263415 (seekKeyOrZeroReturnVacant!0 (x!53918 lt!263409) (index!25033 lt!263409) (index!25033 lt!263409) lt!263413 lt!263416 mask!3119))))

(assert (=> b!575772 (= lt!263411 (seekEntryOrOpen!0 lt!263413 lt!263416 mask!3119))))

(assert (=> b!575772 (= lt!263412 lt!263421)))

(assert (=> b!575772 (= lt!263421 (seekKeyOrZeroReturnVacant!0 (x!53918 lt!263409) (index!25033 lt!263409) (index!25033 lt!263409) (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!364186 () Bool)

(assert (=> start!52794 (=> (not res!364186) (not e!331296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52794 (= res!364186 (validMask!0 mask!3119))))

(assert (=> start!52794 e!331296))

(assert (=> start!52794 true))

(declare-fun array_inv!13048 (array!35939) Bool)

(assert (=> start!52794 (array_inv!13048 a!3118)))

(declare-fun b!575773 () Bool)

(declare-fun e!331294 () Bool)

(assert (=> b!575773 (= e!331294 e!331291)))

(declare-fun res!364192 () Bool)

(assert (=> b!575773 (=> (not res!364192) (not e!331291))))

(declare-fun lt!263418 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35939 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!575773 (= res!364192 (= lt!263409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263418 lt!263413 lt!263416 mask!3119)))))

(declare-fun lt!263414 () (_ BitVec 32))

(assert (=> b!575773 (= lt!263409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263414 (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575773 (= lt!263418 (toIndex!0 lt!263413 mask!3119))))

(assert (=> b!575773 (= lt!263413 (select (store (arr!17252 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575773 (= lt!263414 (toIndex!0 (select (arr!17252 a!3118) j!142) mask!3119))))

(assert (=> b!575773 (= lt!263416 (array!35940 (store (arr!17252 a!3118) i!1132 k!1914) (size!17616 a!3118)))))

(declare-fun b!575774 () Bool)

(assert (=> b!575774 (= e!331296 e!331294)))

(declare-fun res!364188 () Bool)

(assert (=> b!575774 (=> (not res!364188) (not e!331294))))

(declare-fun lt!263410 () SeekEntryResult!5701)

(assert (=> b!575774 (= res!364188 (or (= lt!263410 (MissingZero!5701 i!1132)) (= lt!263410 (MissingVacant!5701 i!1132))))))

(assert (=> b!575774 (= lt!263410 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575775 () Bool)

(declare-fun res!364196 () Bool)

(assert (=> b!575775 (=> (not res!364196) (not e!331296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575775 (= res!364196 (validKeyInArray!0 k!1914))))

(declare-fun b!575776 () Bool)

(declare-fun res!364195 () Bool)

(assert (=> b!575776 (=> (not res!364195) (not e!331294))))

(assert (=> b!575776 (= res!364195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575777 () Bool)

(declare-fun res!364191 () Bool)

(assert (=> b!575777 (=> (not res!364191) (not e!331294))))

(declare-datatypes ((List!11332 0))(
  ( (Nil!11329) (Cons!11328 (h!12367 (_ BitVec 64)) (t!17560 List!11332)) )
))
(declare-fun arrayNoDuplicates!0 (array!35939 (_ BitVec 32) List!11332) Bool)

(assert (=> b!575777 (= res!364191 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11329))))

(declare-fun b!575778 () Bool)

(declare-fun res!364190 () Bool)

(assert (=> b!575778 (=> (not res!364190) (not e!331296))))

(declare-fun arrayContainsKey!0 (array!35939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575778 (= res!364190 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575779 () Bool)

(assert (=> b!575779 (= e!331295 e!331292)))

(declare-fun res!364185 () Bool)

(assert (=> b!575779 (=> res!364185 e!331292)))

(assert (=> b!575779 (= res!364185 (or (= lt!263420 (select (arr!17252 a!3118) j!142)) (= lt!263420 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575779 (= lt!263420 (select (arr!17252 a!3118) (index!25033 lt!263409)))))

(declare-fun b!575780 () Bool)

(declare-fun res!364194 () Bool)

(assert (=> b!575780 (=> (not res!364194) (not e!331296))))

(assert (=> b!575780 (= res!364194 (validKeyInArray!0 (select (arr!17252 a!3118) j!142)))))

(assert (= (and start!52794 res!364186) b!575771))

(assert (= (and b!575771 res!364193) b!575780))

(assert (= (and b!575780 res!364194) b!575775))

(assert (= (and b!575775 res!364196) b!575778))

(assert (= (and b!575778 res!364190) b!575774))

(assert (= (and b!575774 res!364188) b!575776))

(assert (= (and b!575776 res!364195) b!575777))

(assert (= (and b!575777 res!364191) b!575773))

(assert (= (and b!575773 res!364192) b!575770))

(assert (= (and b!575770 (not res!364187)) b!575779))

(assert (= (and b!575779 (not res!364185)) b!575772))

(assert (= (and b!575772 (not res!364189)) b!575769))

(declare-fun m!554733 () Bool)

(assert (=> b!575775 m!554733))

(declare-fun m!554735 () Bool)

(assert (=> b!575777 m!554735))

(declare-fun m!554737 () Bool)

(assert (=> b!575772 m!554737))

(declare-fun m!554739 () Bool)

(assert (=> b!575772 m!554739))

(declare-fun m!554741 () Bool)

(assert (=> b!575772 m!554741))

(assert (=> b!575772 m!554739))

(declare-fun m!554743 () Bool)

(assert (=> b!575772 m!554743))

(declare-fun m!554745 () Bool)

(assert (=> b!575772 m!554745))

(declare-fun m!554747 () Bool)

(assert (=> b!575772 m!554747))

(declare-fun m!554749 () Bool)

(assert (=> b!575776 m!554749))

(declare-fun m!554751 () Bool)

(assert (=> start!52794 m!554751))

(declare-fun m!554753 () Bool)

(assert (=> start!52794 m!554753))

(assert (=> b!575773 m!554739))

(declare-fun m!554755 () Bool)

(assert (=> b!575773 m!554755))

(assert (=> b!575773 m!554739))

(declare-fun m!554757 () Bool)

(assert (=> b!575773 m!554757))

(declare-fun m!554759 () Bool)

(assert (=> b!575773 m!554759))

(assert (=> b!575773 m!554745))

(assert (=> b!575773 m!554739))

(declare-fun m!554761 () Bool)

(assert (=> b!575773 m!554761))

(declare-fun m!554763 () Bool)

(assert (=> b!575773 m!554763))

(declare-fun m!554765 () Bool)

(assert (=> b!575778 m!554765))

(assert (=> b!575779 m!554739))

(declare-fun m!554767 () Bool)

(assert (=> b!575779 m!554767))

(assert (=> b!575770 m!554739))

(assert (=> b!575770 m!554739))

(declare-fun m!554769 () Bool)

(assert (=> b!575770 m!554769))

(declare-fun m!554771 () Bool)

(assert (=> b!575770 m!554771))

(declare-fun m!554773 () Bool)

(assert (=> b!575770 m!554773))

(assert (=> b!575780 m!554739))

(assert (=> b!575780 m!554739))

(declare-fun m!554775 () Bool)

(assert (=> b!575780 m!554775))

(declare-fun m!554777 () Bool)

(assert (=> b!575774 m!554777))

(declare-fun m!554779 () Bool)

(assert (=> b!575769 m!554779))

(push 1)

