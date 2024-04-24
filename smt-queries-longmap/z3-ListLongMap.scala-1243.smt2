; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26016 () Bool)

(assert start!26016)

(declare-fun b!268461 () Bool)

(declare-fun res!132716 () Bool)

(declare-fun e!173396 () Bool)

(assert (=> b!268461 (=> (not res!132716) (not e!173396))))

(declare-datatypes ((array!13112 0))(
  ( (array!13113 (arr!6205 (Array (_ BitVec 32) (_ BitVec 64))) (size!6557 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13112)

(declare-datatypes ((List!3926 0))(
  ( (Nil!3923) (Cons!3922 (h!4589 (_ BitVec 64)) (t!9000 List!3926)) )
))
(declare-fun arrayNoDuplicates!0 (array!13112 (_ BitVec 32) List!3926) Bool)

(assert (=> b!268461 (= res!132716 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3923))))

(declare-fun b!268462 () Bool)

(declare-fun res!132712 () Bool)

(assert (=> b!268462 (=> (not res!132712) (not e!173396))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268462 (= res!132712 (and (= (size!6557 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6557 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6557 a!3325))))))

(declare-fun b!268463 () Bool)

(declare-fun res!132715 () Bool)

(assert (=> b!268463 (=> (not res!132715) (not e!173396))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268463 (= res!132715 (validKeyInArray!0 k0!2581))))

(declare-fun b!268464 () Bool)

(declare-fun e!173394 () Bool)

(assert (=> b!268464 (= e!173396 e!173394)))

(declare-fun res!132714 () Bool)

(assert (=> b!268464 (=> (not res!132714) (not e!173394))))

(declare-datatypes ((SeekEntryResult!1328 0))(
  ( (MissingZero!1328 (index!7482 (_ BitVec 32))) (Found!1328 (index!7483 (_ BitVec 32))) (Intermediate!1328 (undefined!2140 Bool) (index!7484 (_ BitVec 32)) (x!25957 (_ BitVec 32))) (Undefined!1328) (MissingVacant!1328 (index!7485 (_ BitVec 32))) )
))
(declare-fun lt!134928 () SeekEntryResult!1328)

(assert (=> b!268464 (= res!132714 (or (= lt!134928 (MissingZero!1328 i!1267)) (= lt!134928 (MissingVacant!1328 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13112 (_ BitVec 32)) SeekEntryResult!1328)

(assert (=> b!268464 (= lt!134928 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268465 () Bool)

(declare-fun res!132713 () Bool)

(assert (=> b!268465 (=> (not res!132713) (not e!173396))))

(declare-fun arrayContainsKey!0 (array!13112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268465 (= res!132713 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132717 () Bool)

(assert (=> start!26016 (=> (not res!132717) (not e!173396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26016 (= res!132717 (validMask!0 mask!3868))))

(assert (=> start!26016 e!173396))

(declare-fun array_inv!4155 (array!13112) Bool)

(assert (=> start!26016 (array_inv!4155 a!3325)))

(assert (=> start!26016 true))

(declare-fun b!268460 () Bool)

(assert (=> b!268460 (= e!173394 false)))

(declare-fun lt!134927 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13112 (_ BitVec 32)) Bool)

(assert (=> b!268460 (= lt!134927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26016 res!132717) b!268462))

(assert (= (and b!268462 res!132712) b!268463))

(assert (= (and b!268463 res!132715) b!268461))

(assert (= (and b!268461 res!132716) b!268465))

(assert (= (and b!268465 res!132713) b!268464))

(assert (= (and b!268464 res!132714) b!268460))

(declare-fun m!284753 () Bool)

(assert (=> b!268461 m!284753))

(declare-fun m!284755 () Bool)

(assert (=> start!26016 m!284755))

(declare-fun m!284757 () Bool)

(assert (=> start!26016 m!284757))

(declare-fun m!284759 () Bool)

(assert (=> b!268463 m!284759))

(declare-fun m!284761 () Bool)

(assert (=> b!268465 m!284761))

(declare-fun m!284763 () Bool)

(assert (=> b!268464 m!284763))

(declare-fun m!284765 () Bool)

(assert (=> b!268460 m!284765))

(check-sat (not b!268461) (not b!268463) (not start!26016) (not b!268460) (not b!268465) (not b!268464))
(check-sat)
