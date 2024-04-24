; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50874 () Bool)

(assert start!50874)

(declare-fun b!556399 () Bool)

(declare-fun res!348709 () Bool)

(declare-fun e!320601 () Bool)

(assert (=> b!556399 (=> (not res!348709) (not e!320601))))

(declare-datatypes ((array!35046 0))(
  ( (array!35047 (arr!16831 (Array (_ BitVec 32) (_ BitVec 64))) (size!17195 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35046)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35046 (_ BitVec 32)) Bool)

(assert (=> b!556399 (= res!348709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556400 () Bool)

(declare-fun res!348712 () Bool)

(declare-fun e!320600 () Bool)

(assert (=> b!556400 (=> (not res!348712) (not e!320600))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556400 (= res!348712 (and (= (size!17195 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17195 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17195 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556401 () Bool)

(assert (=> b!556401 (= e!320600 e!320601)))

(declare-fun res!348715 () Bool)

(assert (=> b!556401 (=> (not res!348715) (not e!320601))))

(declare-datatypes ((SeekEntryResult!5236 0))(
  ( (MissingZero!5236 (index!23171 (_ BitVec 32))) (Found!5236 (index!23172 (_ BitVec 32))) (Intermediate!5236 (undefined!6048 Bool) (index!23173 (_ BitVec 32)) (x!52217 (_ BitVec 32))) (Undefined!5236) (MissingVacant!5236 (index!23174 (_ BitVec 32))) )
))
(declare-fun lt!252925 () SeekEntryResult!5236)

(assert (=> b!556401 (= res!348715 (or (= lt!252925 (MissingZero!5236 i!1132)) (= lt!252925 (MissingVacant!5236 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35046 (_ BitVec 32)) SeekEntryResult!5236)

(assert (=> b!556401 (= lt!252925 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!348710 () Bool)

(assert (=> start!50874 (=> (not res!348710) (not e!320600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50874 (= res!348710 (validMask!0 mask!3119))))

(assert (=> start!50874 e!320600))

(assert (=> start!50874 true))

(declare-fun array_inv!12690 (array!35046) Bool)

(assert (=> start!50874 (array_inv!12690 a!3118)))

(declare-fun b!556402 () Bool)

(declare-fun res!348706 () Bool)

(assert (=> b!556402 (=> (not res!348706) (not e!320601))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35046 (_ BitVec 32)) SeekEntryResult!5236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556402 (= res!348706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16831 a!3118) j!142) mask!3119) (select (arr!16831 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16831 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16831 a!3118) i!1132 k0!1914) j!142) (array!35047 (store (arr!16831 a!3118) i!1132 k0!1914) (size!17195 a!3118)) mask!3119)))))

(declare-fun b!556403 () Bool)

(declare-fun res!348711 () Bool)

(assert (=> b!556403 (=> (not res!348711) (not e!320600))))

(declare-fun arrayContainsKey!0 (array!35046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556403 (= res!348711 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!320598 () Bool)

(declare-fun b!556404 () Bool)

(assert (=> b!556404 (= e!320598 (= (seekEntryOrOpen!0 (select (arr!16831 a!3118) j!142) a!3118 mask!3119) (Found!5236 j!142)))))

(declare-fun b!556405 () Bool)

(declare-fun res!348714 () Bool)

(assert (=> b!556405 (=> (not res!348714) (not e!320600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556405 (= res!348714 (validKeyInArray!0 k0!1914))))

(declare-fun b!556406 () Bool)

(assert (=> b!556406 (= e!320601 (not true))))

(assert (=> b!556406 e!320598))

(declare-fun res!348708 () Bool)

(assert (=> b!556406 (=> (not res!348708) (not e!320598))))

(assert (=> b!556406 (= res!348708 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17317 0))(
  ( (Unit!17318) )
))
(declare-fun lt!252924 () Unit!17317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17317)

(assert (=> b!556406 (= lt!252924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556407 () Bool)

(declare-fun res!348707 () Bool)

(assert (=> b!556407 (=> (not res!348707) (not e!320600))))

(assert (=> b!556407 (= res!348707 (validKeyInArray!0 (select (arr!16831 a!3118) j!142)))))

(declare-fun b!556408 () Bool)

(declare-fun res!348713 () Bool)

(assert (=> b!556408 (=> (not res!348713) (not e!320601))))

(declare-datatypes ((List!10818 0))(
  ( (Nil!10815) (Cons!10814 (h!11802 (_ BitVec 64)) (t!17038 List!10818)) )
))
(declare-fun arrayNoDuplicates!0 (array!35046 (_ BitVec 32) List!10818) Bool)

(assert (=> b!556408 (= res!348713 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10815))))

(assert (= (and start!50874 res!348710) b!556400))

(assert (= (and b!556400 res!348712) b!556407))

(assert (= (and b!556407 res!348707) b!556405))

(assert (= (and b!556405 res!348714) b!556403))

(assert (= (and b!556403 res!348711) b!556401))

(assert (= (and b!556401 res!348715) b!556399))

(assert (= (and b!556399 res!348709) b!556408))

(assert (= (and b!556408 res!348713) b!556402))

(assert (= (and b!556402 res!348706) b!556406))

(assert (= (and b!556406 res!348708) b!556404))

(declare-fun m!534479 () Bool)

(assert (=> b!556401 m!534479))

(declare-fun m!534481 () Bool)

(assert (=> b!556399 m!534481))

(declare-fun m!534483 () Bool)

(assert (=> start!50874 m!534483))

(declare-fun m!534485 () Bool)

(assert (=> start!50874 m!534485))

(declare-fun m!534487 () Bool)

(assert (=> b!556407 m!534487))

(assert (=> b!556407 m!534487))

(declare-fun m!534489 () Bool)

(assert (=> b!556407 m!534489))

(declare-fun m!534491 () Bool)

(assert (=> b!556403 m!534491))

(assert (=> b!556404 m!534487))

(assert (=> b!556404 m!534487))

(declare-fun m!534493 () Bool)

(assert (=> b!556404 m!534493))

(declare-fun m!534495 () Bool)

(assert (=> b!556405 m!534495))

(declare-fun m!534497 () Bool)

(assert (=> b!556406 m!534497))

(declare-fun m!534499 () Bool)

(assert (=> b!556406 m!534499))

(assert (=> b!556402 m!534487))

(declare-fun m!534501 () Bool)

(assert (=> b!556402 m!534501))

(assert (=> b!556402 m!534487))

(declare-fun m!534503 () Bool)

(assert (=> b!556402 m!534503))

(declare-fun m!534505 () Bool)

(assert (=> b!556402 m!534505))

(assert (=> b!556402 m!534503))

(declare-fun m!534507 () Bool)

(assert (=> b!556402 m!534507))

(assert (=> b!556402 m!534501))

(assert (=> b!556402 m!534487))

(declare-fun m!534509 () Bool)

(assert (=> b!556402 m!534509))

(declare-fun m!534511 () Bool)

(assert (=> b!556402 m!534511))

(assert (=> b!556402 m!534503))

(assert (=> b!556402 m!534505))

(declare-fun m!534513 () Bool)

(assert (=> b!556408 m!534513))

(check-sat (not b!556399) (not b!556404) (not b!556403) (not b!556406) (not b!556402) (not start!50874) (not b!556401) (not b!556408) (not b!556405) (not b!556407))
(check-sat)
