; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27240 () Bool)

(assert start!27240)

(declare-fun res!145162 () Bool)

(declare-fun e!179172 () Bool)

(assert (=> start!27240 (=> (not res!145162) (not e!179172))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27240 (= res!145162 (validMask!0 mask!3868))))

(assert (=> start!27240 e!179172))

(declare-datatypes ((array!14057 0))(
  ( (array!14058 (arr!6670 (Array (_ BitVec 32) (_ BitVec 64))) (size!7022 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14057)

(declare-fun array_inv!4620 (array!14057) Bool)

(assert (=> start!27240 (array_inv!4620 a!3325)))

(assert (=> start!27240 true))

(declare-fun b!282113 () Bool)

(declare-fun res!145160 () Bool)

(declare-fun e!179173 () Bool)

(assert (=> b!282113 (=> (not res!145160) (not e!179173))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282113 (= res!145160 (validKeyInArray!0 (select (arr!6670 a!3325) startIndex!26)))))

(declare-fun b!282114 () Bool)

(declare-fun res!145163 () Bool)

(declare-fun e!179171 () Bool)

(assert (=> b!282114 (=> (not res!145163) (not e!179171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14057 (_ BitVec 32)) Bool)

(assert (=> b!282114 (= res!145163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282115 () Bool)

(assert (=> b!282115 (= e!179171 e!179173)))

(declare-fun res!145159 () Bool)

(assert (=> b!282115 (=> (not res!145159) (not e!179173))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282115 (= res!145159 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139397 () array!14057)

(assert (=> b!282115 (= lt!139397 (array!14058 (store (arr!6670 a!3325) i!1267 k0!2581) (size!7022 a!3325)))))

(declare-fun b!282116 () Bool)

(assert (=> b!282116 (= e!179173 (not true))))

(assert (=> b!282116 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8916 0))(
  ( (Unit!8917) )
))
(declare-fun lt!139401 () Unit!8916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8916)

(assert (=> b!282116 (= lt!139401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1793 0))(
  ( (MissingZero!1793 (index!9342 (_ BitVec 32))) (Found!1793 (index!9343 (_ BitVec 32))) (Intermediate!1793 (undefined!2605 Bool) (index!9344 (_ BitVec 32)) (x!27671 (_ BitVec 32))) (Undefined!1793) (MissingVacant!1793 (index!9345 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14057 (_ BitVec 32)) SeekEntryResult!1793)

(assert (=> b!282116 (= (seekEntryOrOpen!0 (select (arr!6670 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6670 a!3325) i!1267 k0!2581) startIndex!26) lt!139397 mask!3868))))

(declare-fun lt!139398 () Unit!8916)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8916)

(assert (=> b!282116 (= lt!139398 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4391 0))(
  ( (Nil!4388) (Cons!4387 (h!5057 (_ BitVec 64)) (t!9465 List!4391)) )
))
(declare-fun arrayNoDuplicates!0 (array!14057 (_ BitVec 32) List!4391) Bool)

(assert (=> b!282116 (arrayNoDuplicates!0 lt!139397 #b00000000000000000000000000000000 Nil!4388)))

(declare-fun lt!139399 () Unit!8916)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4391) Unit!8916)

(assert (=> b!282116 (= lt!139399 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4388))))

(declare-fun b!282117 () Bool)

(declare-fun res!145157 () Bool)

(assert (=> b!282117 (=> (not res!145157) (not e!179172))))

(assert (=> b!282117 (= res!145157 (and (= (size!7022 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7022 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7022 a!3325))))))

(declare-fun b!282118 () Bool)

(declare-fun res!145158 () Bool)

(assert (=> b!282118 (=> (not res!145158) (not e!179172))))

(declare-fun arrayContainsKey!0 (array!14057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282118 (= res!145158 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282119 () Bool)

(declare-fun res!145156 () Bool)

(assert (=> b!282119 (=> (not res!145156) (not e!179172))))

(assert (=> b!282119 (= res!145156 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4388))))

(declare-fun b!282120 () Bool)

(declare-fun res!145164 () Bool)

(assert (=> b!282120 (=> (not res!145164) (not e!179172))))

(assert (=> b!282120 (= res!145164 (validKeyInArray!0 k0!2581))))

(declare-fun b!282121 () Bool)

(assert (=> b!282121 (= e!179172 e!179171)))

(declare-fun res!145161 () Bool)

(assert (=> b!282121 (=> (not res!145161) (not e!179171))))

(declare-fun lt!139400 () SeekEntryResult!1793)

(assert (=> b!282121 (= res!145161 (or (= lt!139400 (MissingZero!1793 i!1267)) (= lt!139400 (MissingVacant!1793 i!1267))))))

(assert (=> b!282121 (= lt!139400 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27240 res!145162) b!282117))

(assert (= (and b!282117 res!145157) b!282120))

(assert (= (and b!282120 res!145164) b!282119))

(assert (= (and b!282119 res!145156) b!282118))

(assert (= (and b!282118 res!145158) b!282121))

(assert (= (and b!282121 res!145161) b!282114))

(assert (= (and b!282114 res!145163) b!282115))

(assert (= (and b!282115 res!145159) b!282113))

(assert (= (and b!282113 res!145160) b!282116))

(declare-fun m!296717 () Bool)

(assert (=> b!282118 m!296717))

(declare-fun m!296719 () Bool)

(assert (=> b!282120 m!296719))

(declare-fun m!296721 () Bool)

(assert (=> b!282113 m!296721))

(assert (=> b!282113 m!296721))

(declare-fun m!296723 () Bool)

(assert (=> b!282113 m!296723))

(declare-fun m!296725 () Bool)

(assert (=> b!282114 m!296725))

(declare-fun m!296727 () Bool)

(assert (=> b!282121 m!296727))

(declare-fun m!296729 () Bool)

(assert (=> b!282115 m!296729))

(declare-fun m!296731 () Bool)

(assert (=> start!27240 m!296731))

(declare-fun m!296733 () Bool)

(assert (=> start!27240 m!296733))

(declare-fun m!296735 () Bool)

(assert (=> b!282119 m!296735))

(declare-fun m!296737 () Bool)

(assert (=> b!282116 m!296737))

(declare-fun m!296739 () Bool)

(assert (=> b!282116 m!296739))

(assert (=> b!282116 m!296729))

(declare-fun m!296741 () Bool)

(assert (=> b!282116 m!296741))

(assert (=> b!282116 m!296721))

(declare-fun m!296743 () Bool)

(assert (=> b!282116 m!296743))

(declare-fun m!296745 () Bool)

(assert (=> b!282116 m!296745))

(assert (=> b!282116 m!296721))

(declare-fun m!296747 () Bool)

(assert (=> b!282116 m!296747))

(declare-fun m!296749 () Bool)

(assert (=> b!282116 m!296749))

(assert (=> b!282116 m!296739))

(declare-fun m!296751 () Bool)

(assert (=> b!282116 m!296751))

(check-sat (not b!282118) (not b!282120) (not b!282119) (not b!282121) (not b!282114) (not b!282116) (not start!27240) (not b!282113))
(check-sat)
