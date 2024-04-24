; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26112 () Bool)

(assert start!26112)

(declare-fun b!269476 () Bool)

(declare-fun e!173865 () Bool)

(declare-fun e!173867 () Bool)

(assert (=> b!269476 (= e!173865 e!173867)))

(declare-fun res!133657 () Bool)

(assert (=> b!269476 (=> (not res!133657) (not e!173867))))

(declare-datatypes ((SeekEntryResult!1376 0))(
  ( (MissingZero!1376 (index!7674 (_ BitVec 32))) (Found!1376 (index!7675 (_ BitVec 32))) (Intermediate!1376 (undefined!2188 Bool) (index!7676 (_ BitVec 32)) (x!26133 (_ BitVec 32))) (Undefined!1376) (MissingVacant!1376 (index!7677 (_ BitVec 32))) )
))
(declare-fun lt!135255 () SeekEntryResult!1376)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269476 (= res!133657 (or (= lt!135255 (MissingZero!1376 i!1267)) (= lt!135255 (MissingVacant!1376 i!1267))))))

(declare-datatypes ((array!13208 0))(
  ( (array!13209 (arr!6253 (Array (_ BitVec 32) (_ BitVec 64))) (size!6605 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13208)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13208 (_ BitVec 32)) SeekEntryResult!1376)

(assert (=> b!269476 (= lt!135255 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269477 () Bool)

(declare-fun res!133654 () Bool)

(assert (=> b!269477 (=> (not res!133654) (not e!173865))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269477 (= res!133654 (and (= (size!6605 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6605 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6605 a!3325))))))

(declare-fun b!269478 () Bool)

(declare-fun res!133656 () Bool)

(assert (=> b!269478 (=> (not res!133656) (not e!173865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269478 (= res!133656 (validKeyInArray!0 k0!2581))))

(declare-fun b!269479 () Bool)

(declare-fun res!133659 () Bool)

(assert (=> b!269479 (=> (not res!133659) (not e!173865))))

(declare-fun arrayContainsKey!0 (array!13208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269479 (= res!133659 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269480 () Bool)

(declare-fun res!133652 () Bool)

(assert (=> b!269480 (=> (not res!133652) (not e!173867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13208 (_ BitVec 32)) Bool)

(assert (=> b!269480 (= res!133652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269481 () Bool)

(declare-fun res!133653 () Bool)

(assert (=> b!269481 (=> (not res!133653) (not e!173865))))

(declare-datatypes ((List!3974 0))(
  ( (Nil!3971) (Cons!3970 (h!4637 (_ BitVec 64)) (t!9048 List!3974)) )
))
(declare-fun arrayNoDuplicates!0 (array!13208 (_ BitVec 32) List!3974) Bool)

(assert (=> b!269481 (= res!133653 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3971))))

(declare-fun b!269483 () Bool)

(declare-fun res!133658 () Bool)

(assert (=> b!269483 (=> (not res!133658) (not e!173867))))

(assert (=> b!269483 (= res!133658 (= startIndex!26 i!1267))))

(declare-fun b!269484 () Bool)

(declare-datatypes ((Unit!8321 0))(
  ( (Unit!8322) )
))
(declare-fun e!173866 () Unit!8321)

(declare-fun lt!135254 () Unit!8321)

(assert (=> b!269484 (= e!173866 lt!135254)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13208 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8321)

(assert (=> b!269484 (= lt!135254 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13209 (store (arr!6253 a!3325) i!1267 k0!2581) (size!6605 a!3325)) mask!3868)))

(declare-fun b!269485 () Bool)

(assert (=> b!269485 (= e!173867 false)))

(declare-fun lt!135253 () Unit!8321)

(assert (=> b!269485 (= lt!135253 e!173866)))

(declare-fun c!45463 () Bool)

(assert (=> b!269485 (= c!45463 (bvslt startIndex!26 (bvsub (size!6605 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!133655 () Bool)

(assert (=> start!26112 (=> (not res!133655) (not e!173865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26112 (= res!133655 (validMask!0 mask!3868))))

(assert (=> start!26112 e!173865))

(declare-fun array_inv!4203 (array!13208) Bool)

(assert (=> start!26112 (array_inv!4203 a!3325)))

(assert (=> start!26112 true))

(declare-fun b!269482 () Bool)

(declare-fun Unit!8323 () Unit!8321)

(assert (=> b!269482 (= e!173866 Unit!8323)))

(assert (= (and start!26112 res!133655) b!269477))

(assert (= (and b!269477 res!133654) b!269478))

(assert (= (and b!269478 res!133656) b!269481))

(assert (= (and b!269481 res!133653) b!269479))

(assert (= (and b!269479 res!133659) b!269476))

(assert (= (and b!269476 res!133657) b!269480))

(assert (= (and b!269480 res!133652) b!269483))

(assert (= (and b!269483 res!133658) b!269485))

(assert (= (and b!269485 c!45463) b!269484))

(assert (= (and b!269485 (not c!45463)) b!269482))

(declare-fun m!285497 () Bool)

(assert (=> start!26112 m!285497))

(declare-fun m!285499 () Bool)

(assert (=> start!26112 m!285499))

(declare-fun m!285501 () Bool)

(assert (=> b!269478 m!285501))

(declare-fun m!285503 () Bool)

(assert (=> b!269479 m!285503))

(declare-fun m!285505 () Bool)

(assert (=> b!269484 m!285505))

(declare-fun m!285507 () Bool)

(assert (=> b!269484 m!285507))

(declare-fun m!285509 () Bool)

(assert (=> b!269484 m!285509))

(declare-fun m!285511 () Bool)

(assert (=> b!269480 m!285511))

(declare-fun m!285513 () Bool)

(assert (=> b!269476 m!285513))

(declare-fun m!285515 () Bool)

(assert (=> b!269481 m!285515))

(check-sat (not b!269479) (not start!26112) (not b!269480) (not b!269484) (not b!269478) (not b!269476) (not b!269481))
(check-sat)
