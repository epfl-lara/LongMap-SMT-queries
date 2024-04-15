; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26342 () Bool)

(assert start!26342)

(declare-fun b!272862 () Bool)

(declare-fun res!136910 () Bool)

(declare-fun e!174964 () Bool)

(assert (=> b!272862 (=> (not res!136910) (not e!174964))))

(declare-datatypes ((array!13428 0))(
  ( (array!13429 (arr!6363 (Array (_ BitVec 32) (_ BitVec 64))) (size!6716 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13428)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272862 (= res!136910 (validKeyInArray!0 (select (arr!6363 a!3325) startIndex!26)))))

(declare-fun b!272863 () Bool)

(declare-fun res!136909 () Bool)

(declare-fun e!174963 () Bool)

(assert (=> b!272863 (=> (not res!136909) (not e!174963))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272863 (= res!136909 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272864 () Bool)

(declare-fun res!136905 () Bool)

(declare-fun e!174965 () Bool)

(assert (=> b!272864 (=> (not res!136905) (not e!174965))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13428 (_ BitVec 32)) Bool)

(assert (=> b!272864 (= res!136905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272865 () Bool)

(declare-fun res!136911 () Bool)

(assert (=> b!272865 (=> (not res!136911) (not e!174963))))

(assert (=> b!272865 (= res!136911 (validKeyInArray!0 k0!2581))))

(declare-fun res!136908 () Bool)

(assert (=> start!26342 (=> (not res!136908) (not e!174963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26342 (= res!136908 (validMask!0 mask!3868))))

(assert (=> start!26342 e!174963))

(declare-fun array_inv!4335 (array!13428) Bool)

(assert (=> start!26342 (array_inv!4335 a!3325)))

(assert (=> start!26342 true))

(declare-fun b!272866 () Bool)

(assert (=> b!272866 (= e!174965 e!174964)))

(declare-fun res!136912 () Bool)

(assert (=> b!272866 (=> (not res!136912) (not e!174964))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272866 (= res!136912 (not (= startIndex!26 i!1267)))))

(declare-fun lt!135987 () array!13428)

(assert (=> b!272866 (= lt!135987 (array!13429 (store (arr!6363 a!3325) i!1267 k0!2581) (size!6716 a!3325)))))

(declare-fun b!272867 () Bool)

(assert (=> b!272867 (= e!174964 (not true))))

(declare-datatypes ((SeekEntryResult!1520 0))(
  ( (MissingZero!1520 (index!8250 (_ BitVec 32))) (Found!1520 (index!8251 (_ BitVec 32))) (Intermediate!1520 (undefined!2332 Bool) (index!8252 (_ BitVec 32)) (x!26580 (_ BitVec 32))) (Undefined!1520) (MissingVacant!1520 (index!8253 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13428 (_ BitVec 32)) SeekEntryResult!1520)

(assert (=> b!272867 (= (seekEntryOrOpen!0 (select (arr!6363 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6363 a!3325) i!1267 k0!2581) startIndex!26) lt!135987 mask!3868))))

(declare-datatypes ((Unit!8493 0))(
  ( (Unit!8494) )
))
(declare-fun lt!135990 () Unit!8493)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13428 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8493)

(assert (=> b!272867 (= lt!135990 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4144 0))(
  ( (Nil!4141) (Cons!4140 (h!4807 (_ BitVec 64)) (t!9217 List!4144)) )
))
(declare-fun arrayNoDuplicates!0 (array!13428 (_ BitVec 32) List!4144) Bool)

(assert (=> b!272867 (arrayNoDuplicates!0 lt!135987 #b00000000000000000000000000000000 Nil!4141)))

(declare-fun lt!135988 () Unit!8493)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13428 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4144) Unit!8493)

(assert (=> b!272867 (= lt!135988 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4141))))

(declare-fun b!272868 () Bool)

(declare-fun res!136907 () Bool)

(assert (=> b!272868 (=> (not res!136907) (not e!174963))))

(assert (=> b!272868 (= res!136907 (and (= (size!6716 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6716 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6716 a!3325))))))

(declare-fun b!272869 () Bool)

(assert (=> b!272869 (= e!174963 e!174965)))

(declare-fun res!136906 () Bool)

(assert (=> b!272869 (=> (not res!136906) (not e!174965))))

(declare-fun lt!135989 () SeekEntryResult!1520)

(assert (=> b!272869 (= res!136906 (or (= lt!135989 (MissingZero!1520 i!1267)) (= lt!135989 (MissingVacant!1520 i!1267))))))

(assert (=> b!272869 (= lt!135989 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272870 () Bool)

(declare-fun res!136904 () Bool)

(assert (=> b!272870 (=> (not res!136904) (not e!174963))))

(assert (=> b!272870 (= res!136904 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4141))))

(assert (= (and start!26342 res!136908) b!272868))

(assert (= (and b!272868 res!136907) b!272865))

(assert (= (and b!272865 res!136911) b!272870))

(assert (= (and b!272870 res!136904) b!272863))

(assert (= (and b!272863 res!136909) b!272869))

(assert (= (and b!272869 res!136906) b!272864))

(assert (= (and b!272864 res!136905) b!272866))

(assert (= (and b!272866 res!136912) b!272862))

(assert (= (and b!272862 res!136910) b!272867))

(declare-fun m!287501 () Bool)

(assert (=> b!272866 m!287501))

(declare-fun m!287503 () Bool)

(assert (=> b!272862 m!287503))

(assert (=> b!272862 m!287503))

(declare-fun m!287505 () Bool)

(assert (=> b!272862 m!287505))

(declare-fun m!287507 () Bool)

(assert (=> b!272869 m!287507))

(declare-fun m!287509 () Bool)

(assert (=> start!26342 m!287509))

(declare-fun m!287511 () Bool)

(assert (=> start!26342 m!287511))

(declare-fun m!287513 () Bool)

(assert (=> b!272864 m!287513))

(declare-fun m!287515 () Bool)

(assert (=> b!272870 m!287515))

(declare-fun m!287517 () Bool)

(assert (=> b!272867 m!287517))

(declare-fun m!287519 () Bool)

(assert (=> b!272867 m!287519))

(assert (=> b!272867 m!287501))

(assert (=> b!272867 m!287503))

(declare-fun m!287521 () Bool)

(assert (=> b!272867 m!287521))

(assert (=> b!272867 m!287503))

(declare-fun m!287523 () Bool)

(assert (=> b!272867 m!287523))

(assert (=> b!272867 m!287517))

(declare-fun m!287525 () Bool)

(assert (=> b!272867 m!287525))

(declare-fun m!287527 () Bool)

(assert (=> b!272867 m!287527))

(declare-fun m!287529 () Bool)

(assert (=> b!272863 m!287529))

(declare-fun m!287531 () Bool)

(assert (=> b!272865 m!287531))

(check-sat (not b!272864) (not b!272865) (not start!26342) (not b!272862) (not b!272869) (not b!272867) (not b!272863) (not b!272870))
(check-sat)
