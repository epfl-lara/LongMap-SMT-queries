; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26106 () Bool)

(assert start!26106)

(declare-fun b!269386 () Bool)

(declare-fun res!133580 () Bool)

(declare-fun e!173828 () Bool)

(assert (=> b!269386 (=> (not res!133580) (not e!173828))))

(declare-datatypes ((array!13202 0))(
  ( (array!13203 (arr!6250 (Array (_ BitVec 32) (_ BitVec 64))) (size!6602 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13202)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269386 (= res!133580 (and (= (size!6602 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6602 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6602 a!3325))))))

(declare-fun b!269387 () Bool)

(declare-fun res!133585 () Bool)

(assert (=> b!269387 (=> (not res!133585) (not e!173828))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269387 (= res!133585 (validKeyInArray!0 k0!2581))))

(declare-fun b!269388 () Bool)

(declare-fun e!173830 () Bool)

(assert (=> b!269388 (= e!173828 e!173830)))

(declare-fun res!133587 () Bool)

(assert (=> b!269388 (=> (not res!133587) (not e!173830))))

(declare-datatypes ((SeekEntryResult!1373 0))(
  ( (MissingZero!1373 (index!7662 (_ BitVec 32))) (Found!1373 (index!7663 (_ BitVec 32))) (Intermediate!1373 (undefined!2185 Bool) (index!7664 (_ BitVec 32)) (x!26122 (_ BitVec 32))) (Undefined!1373) (MissingVacant!1373 (index!7665 (_ BitVec 32))) )
))
(declare-fun lt!135227 () SeekEntryResult!1373)

(assert (=> b!269388 (= res!133587 (or (= lt!135227 (MissingZero!1373 i!1267)) (= lt!135227 (MissingVacant!1373 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13202 (_ BitVec 32)) SeekEntryResult!1373)

(assert (=> b!269388 (= lt!135227 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!133581 () Bool)

(assert (=> start!26106 (=> (not res!133581) (not e!173828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26106 (= res!133581 (validMask!0 mask!3868))))

(assert (=> start!26106 e!173828))

(declare-fun array_inv!4200 (array!13202) Bool)

(assert (=> start!26106 (array_inv!4200 a!3325)))

(assert (=> start!26106 true))

(declare-fun b!269389 () Bool)

(declare-fun res!133584 () Bool)

(assert (=> b!269389 (=> (not res!133584) (not e!173830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13202 (_ BitVec 32)) Bool)

(assert (=> b!269389 (= res!133584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269390 () Bool)

(assert (=> b!269390 (= e!173830 false)))

(declare-datatypes ((Unit!8312 0))(
  ( (Unit!8313) )
))
(declare-fun lt!135226 () Unit!8312)

(declare-fun e!173831 () Unit!8312)

(assert (=> b!269390 (= lt!135226 e!173831)))

(declare-fun c!45454 () Bool)

(assert (=> b!269390 (= c!45454 (bvslt startIndex!26 (bvsub (size!6602 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269391 () Bool)

(declare-fun Unit!8314 () Unit!8312)

(assert (=> b!269391 (= e!173831 Unit!8314)))

(declare-fun b!269392 () Bool)

(declare-fun res!133582 () Bool)

(assert (=> b!269392 (=> (not res!133582) (not e!173830))))

(assert (=> b!269392 (= res!133582 (= startIndex!26 i!1267))))

(declare-fun b!269393 () Bool)

(declare-fun res!133583 () Bool)

(assert (=> b!269393 (=> (not res!133583) (not e!173828))))

(declare-datatypes ((List!3971 0))(
  ( (Nil!3968) (Cons!3967 (h!4634 (_ BitVec 64)) (t!9045 List!3971)) )
))
(declare-fun arrayNoDuplicates!0 (array!13202 (_ BitVec 32) List!3971) Bool)

(assert (=> b!269393 (= res!133583 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3968))))

(declare-fun b!269394 () Bool)

(declare-fun lt!135228 () Unit!8312)

(assert (=> b!269394 (= e!173831 lt!135228)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13202 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8312)

(assert (=> b!269394 (= lt!135228 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269394 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13203 (store (arr!6250 a!3325) i!1267 k0!2581) (size!6602 a!3325)) mask!3868)))

(declare-fun b!269395 () Bool)

(declare-fun res!133586 () Bool)

(assert (=> b!269395 (=> (not res!133586) (not e!173828))))

(declare-fun arrayContainsKey!0 (array!13202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269395 (= res!133586 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26106 res!133581) b!269386))

(assert (= (and b!269386 res!133580) b!269387))

(assert (= (and b!269387 res!133585) b!269393))

(assert (= (and b!269393 res!133583) b!269395))

(assert (= (and b!269395 res!133586) b!269388))

(assert (= (and b!269388 res!133587) b!269389))

(assert (= (and b!269389 res!133584) b!269392))

(assert (= (and b!269392 res!133582) b!269390))

(assert (= (and b!269390 c!45454) b!269394))

(assert (= (and b!269390 (not c!45454)) b!269391))

(declare-fun m!285437 () Bool)

(assert (=> b!269393 m!285437))

(declare-fun m!285439 () Bool)

(assert (=> b!269387 m!285439))

(declare-fun m!285441 () Bool)

(assert (=> start!26106 m!285441))

(declare-fun m!285443 () Bool)

(assert (=> start!26106 m!285443))

(declare-fun m!285445 () Bool)

(assert (=> b!269388 m!285445))

(declare-fun m!285447 () Bool)

(assert (=> b!269389 m!285447))

(declare-fun m!285449 () Bool)

(assert (=> b!269394 m!285449))

(declare-fun m!285451 () Bool)

(assert (=> b!269394 m!285451))

(declare-fun m!285453 () Bool)

(assert (=> b!269394 m!285453))

(declare-fun m!285455 () Bool)

(assert (=> b!269395 m!285455))

(check-sat (not b!269389) (not b!269395) (not b!269387) (not start!26106) (not b!269388) (not b!269393) (not b!269394))
(check-sat)
