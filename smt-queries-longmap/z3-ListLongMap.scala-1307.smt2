; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26402 () Bool)

(assert start!26402)

(declare-fun b!273672 () Bool)

(declare-fun res!137717 () Bool)

(declare-fun e!175324 () Bool)

(assert (=> b!273672 (=> (not res!137717) (not e!175324))))

(declare-datatypes ((array!13488 0))(
  ( (array!13489 (arr!6393 (Array (_ BitVec 32) (_ BitVec 64))) (size!6746 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13488)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273672 (= res!137717 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273673 () Bool)

(declare-fun e!175323 () Bool)

(assert (=> b!273673 (= e!175324 e!175323)))

(declare-fun res!137715 () Bool)

(assert (=> b!273673 (=> (not res!137715) (not e!175323))))

(declare-datatypes ((SeekEntryResult!1550 0))(
  ( (MissingZero!1550 (index!8370 (_ BitVec 32))) (Found!1550 (index!8371 (_ BitVec 32))) (Intermediate!1550 (undefined!2362 Bool) (index!8372 (_ BitVec 32)) (x!26690 (_ BitVec 32))) (Undefined!1550) (MissingVacant!1550 (index!8373 (_ BitVec 32))) )
))
(declare-fun lt!136412 () SeekEntryResult!1550)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273673 (= res!137715 (or (= lt!136412 (MissingZero!1550 i!1267)) (= lt!136412 (MissingVacant!1550 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13488 (_ BitVec 32)) SeekEntryResult!1550)

(assert (=> b!273673 (= lt!136412 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273674 () Bool)

(declare-fun e!175325 () Bool)

(assert (=> b!273674 (= e!175325 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13488 (_ BitVec 32)) Bool)

(assert (=> b!273674 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8553 0))(
  ( (Unit!8554) )
))
(declare-fun lt!136413 () Unit!8553)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!273674 (= lt!136413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136415 () array!13488)

(assert (=> b!273674 (= (seekEntryOrOpen!0 (select (arr!6393 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6393 a!3325) i!1267 k0!2581) startIndex!26) lt!136415 mask!3868))))

(declare-fun lt!136416 () Unit!8553)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!273674 (= lt!136416 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4174 0))(
  ( (Nil!4171) (Cons!4170 (h!4837 (_ BitVec 64)) (t!9247 List!4174)) )
))
(declare-fun arrayNoDuplicates!0 (array!13488 (_ BitVec 32) List!4174) Bool)

(assert (=> b!273674 (arrayNoDuplicates!0 lt!136415 #b00000000000000000000000000000000 Nil!4171)))

(declare-fun lt!136414 () Unit!8553)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4174) Unit!8553)

(assert (=> b!273674 (= lt!136414 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4171))))

(declare-fun b!273675 () Bool)

(declare-fun res!137718 () Bool)

(assert (=> b!273675 (=> (not res!137718) (not e!175324))))

(assert (=> b!273675 (= res!137718 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4171))))

(declare-fun b!273676 () Bool)

(declare-fun res!137714 () Bool)

(assert (=> b!273676 (=> (not res!137714) (not e!175324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273676 (= res!137714 (validKeyInArray!0 k0!2581))))

(declare-fun res!137720 () Bool)

(assert (=> start!26402 (=> (not res!137720) (not e!175324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26402 (= res!137720 (validMask!0 mask!3868))))

(assert (=> start!26402 e!175324))

(declare-fun array_inv!4365 (array!13488) Bool)

(assert (=> start!26402 (array_inv!4365 a!3325)))

(assert (=> start!26402 true))

(declare-fun b!273677 () Bool)

(assert (=> b!273677 (= e!175323 e!175325)))

(declare-fun res!137719 () Bool)

(assert (=> b!273677 (=> (not res!137719) (not e!175325))))

(assert (=> b!273677 (= res!137719 (not (= startIndex!26 i!1267)))))

(assert (=> b!273677 (= lt!136415 (array!13489 (store (arr!6393 a!3325) i!1267 k0!2581) (size!6746 a!3325)))))

(declare-fun b!273678 () Bool)

(declare-fun res!137721 () Bool)

(assert (=> b!273678 (=> (not res!137721) (not e!175323))))

(assert (=> b!273678 (= res!137721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273679 () Bool)

(declare-fun res!137716 () Bool)

(assert (=> b!273679 (=> (not res!137716) (not e!175325))))

(assert (=> b!273679 (= res!137716 (validKeyInArray!0 (select (arr!6393 a!3325) startIndex!26)))))

(declare-fun b!273680 () Bool)

(declare-fun res!137722 () Bool)

(assert (=> b!273680 (=> (not res!137722) (not e!175324))))

(assert (=> b!273680 (= res!137722 (and (= (size!6746 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6746 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6746 a!3325))))))

(assert (= (and start!26402 res!137720) b!273680))

(assert (= (and b!273680 res!137722) b!273676))

(assert (= (and b!273676 res!137714) b!273675))

(assert (= (and b!273675 res!137718) b!273672))

(assert (= (and b!273672 res!137717) b!273673))

(assert (= (and b!273673 res!137715) b!273678))

(assert (= (and b!273678 res!137721) b!273677))

(assert (= (and b!273677 res!137719) b!273679))

(assert (= (and b!273679 res!137716) b!273674))

(declare-fun m!288545 () Bool)

(assert (=> b!273678 m!288545))

(declare-fun m!288547 () Bool)

(assert (=> b!273675 m!288547))

(declare-fun m!288549 () Bool)

(assert (=> b!273673 m!288549))

(declare-fun m!288551 () Bool)

(assert (=> b!273679 m!288551))

(assert (=> b!273679 m!288551))

(declare-fun m!288553 () Bool)

(assert (=> b!273679 m!288553))

(declare-fun m!288555 () Bool)

(assert (=> b!273674 m!288555))

(declare-fun m!288557 () Bool)

(assert (=> b!273674 m!288557))

(declare-fun m!288559 () Bool)

(assert (=> b!273674 m!288559))

(declare-fun m!288561 () Bool)

(assert (=> b!273674 m!288561))

(assert (=> b!273674 m!288551))

(declare-fun m!288563 () Bool)

(assert (=> b!273674 m!288563))

(declare-fun m!288565 () Bool)

(assert (=> b!273674 m!288565))

(assert (=> b!273674 m!288551))

(declare-fun m!288567 () Bool)

(assert (=> b!273674 m!288567))

(declare-fun m!288569 () Bool)

(assert (=> b!273674 m!288569))

(assert (=> b!273674 m!288569))

(declare-fun m!288571 () Bool)

(assert (=> b!273674 m!288571))

(declare-fun m!288573 () Bool)

(assert (=> b!273676 m!288573))

(declare-fun m!288575 () Bool)

(assert (=> start!26402 m!288575))

(declare-fun m!288577 () Bool)

(assert (=> start!26402 m!288577))

(assert (=> b!273677 m!288559))

(declare-fun m!288579 () Bool)

(assert (=> b!273672 m!288579))

(check-sat (not b!273678) (not b!273673) (not start!26402) (not b!273676) (not b!273675) (not b!273672) (not b!273679) (not b!273674))
(check-sat)
