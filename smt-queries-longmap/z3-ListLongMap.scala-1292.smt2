; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26312 () Bool)

(assert start!26312)

(declare-fun res!136503 () Bool)

(declare-fun e!174809 () Bool)

(assert (=> start!26312 (=> (not res!136503) (not e!174809))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26312 (= res!136503 (validMask!0 mask!3868))))

(assert (=> start!26312 e!174809))

(declare-datatypes ((array!13398 0))(
  ( (array!13399 (arr!6348 (Array (_ BitVec 32) (_ BitVec 64))) (size!6701 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13398)

(declare-fun array_inv!4320 (array!13398) Bool)

(assert (=> start!26312 (array_inv!4320 a!3325)))

(assert (=> start!26312 true))

(declare-fun b!272457 () Bool)

(declare-fun res!136501 () Bool)

(assert (=> b!272457 (=> (not res!136501) (not e!174809))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272457 (= res!136501 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272458 () Bool)

(declare-fun res!136504 () Bool)

(declare-fun e!174808 () Bool)

(assert (=> b!272458 (=> (not res!136504) (not e!174808))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272458 (= res!136504 (validKeyInArray!0 (select (arr!6348 a!3325) startIndex!26)))))

(declare-fun b!272459 () Bool)

(declare-fun res!136505 () Bool)

(assert (=> b!272459 (=> (not res!136505) (not e!174809))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272459 (= res!136505 (and (= (size!6701 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6701 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6701 a!3325))))))

(declare-fun b!272460 () Bool)

(declare-fun res!136507 () Bool)

(assert (=> b!272460 (=> (not res!136507) (not e!174809))))

(declare-datatypes ((List!4129 0))(
  ( (Nil!4126) (Cons!4125 (h!4792 (_ BitVec 64)) (t!9202 List!4129)) )
))
(declare-fun arrayNoDuplicates!0 (array!13398 (_ BitVec 32) List!4129) Bool)

(assert (=> b!272460 (= res!136507 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4126))))

(declare-fun b!272461 () Bool)

(declare-fun res!136500 () Bool)

(assert (=> b!272461 (=> (not res!136500) (not e!174808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13398 (_ BitVec 32)) Bool)

(assert (=> b!272461 (= res!136500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272462 () Bool)

(declare-fun res!136499 () Bool)

(assert (=> b!272462 (=> (not res!136499) (not e!174809))))

(assert (=> b!272462 (= res!136499 (validKeyInArray!0 k0!2581))))

(declare-fun b!272463 () Bool)

(assert (=> b!272463 (= e!174809 e!174808)))

(declare-fun res!136506 () Bool)

(assert (=> b!272463 (=> (not res!136506) (not e!174808))))

(declare-datatypes ((SeekEntryResult!1505 0))(
  ( (MissingZero!1505 (index!8190 (_ BitVec 32))) (Found!1505 (index!8191 (_ BitVec 32))) (Intermediate!1505 (undefined!2317 Bool) (index!8192 (_ BitVec 32)) (x!26525 (_ BitVec 32))) (Undefined!1505) (MissingVacant!1505 (index!8193 (_ BitVec 32))) )
))
(declare-fun lt!135858 () SeekEntryResult!1505)

(assert (=> b!272463 (= res!136506 (or (= lt!135858 (MissingZero!1505 i!1267)) (= lt!135858 (MissingVacant!1505 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13398 (_ BitVec 32)) SeekEntryResult!1505)

(assert (=> b!272463 (= lt!135858 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272464 () Bool)

(declare-fun res!136502 () Bool)

(assert (=> b!272464 (=> (not res!136502) (not e!174808))))

(assert (=> b!272464 (= res!136502 (not (= startIndex!26 i!1267)))))

(declare-fun b!272465 () Bool)

(assert (=> b!272465 (= e!174808 (not true))))

(assert (=> b!272465 (arrayNoDuplicates!0 (array!13399 (store (arr!6348 a!3325) i!1267 k0!2581) (size!6701 a!3325)) #b00000000000000000000000000000000 Nil!4126)))

(declare-datatypes ((Unit!8463 0))(
  ( (Unit!8464) )
))
(declare-fun lt!135857 () Unit!8463)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4129) Unit!8463)

(assert (=> b!272465 (= lt!135857 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4126))))

(assert (= (and start!26312 res!136503) b!272459))

(assert (= (and b!272459 res!136505) b!272462))

(assert (= (and b!272462 res!136499) b!272460))

(assert (= (and b!272460 res!136507) b!272457))

(assert (= (and b!272457 res!136501) b!272463))

(assert (= (and b!272463 res!136506) b!272461))

(assert (= (and b!272461 res!136500) b!272464))

(assert (= (and b!272464 res!136502) b!272458))

(assert (= (and b!272458 res!136504) b!272465))

(declare-fun m!287093 () Bool)

(assert (=> b!272465 m!287093))

(declare-fun m!287095 () Bool)

(assert (=> b!272465 m!287095))

(declare-fun m!287097 () Bool)

(assert (=> b!272465 m!287097))

(declare-fun m!287099 () Bool)

(assert (=> b!272460 m!287099))

(declare-fun m!287101 () Bool)

(assert (=> b!272462 m!287101))

(declare-fun m!287103 () Bool)

(assert (=> b!272461 m!287103))

(declare-fun m!287105 () Bool)

(assert (=> b!272457 m!287105))

(declare-fun m!287107 () Bool)

(assert (=> b!272458 m!287107))

(assert (=> b!272458 m!287107))

(declare-fun m!287109 () Bool)

(assert (=> b!272458 m!287109))

(declare-fun m!287111 () Bool)

(assert (=> start!26312 m!287111))

(declare-fun m!287113 () Bool)

(assert (=> start!26312 m!287113))

(declare-fun m!287115 () Bool)

(assert (=> b!272463 m!287115))

(check-sat (not b!272457) (not b!272461) (not b!272460) (not b!272463) (not b!272462) (not start!26312) (not b!272458) (not b!272465))
(check-sat)
