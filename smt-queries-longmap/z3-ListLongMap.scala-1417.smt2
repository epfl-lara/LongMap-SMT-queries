; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27530 () Bool)

(assert start!27530)

(declare-fun b!284472 () Bool)

(declare-fun e!180455 () Bool)

(declare-fun e!180453 () Bool)

(assert (=> b!284472 (= e!180455 e!180453)))

(declare-fun res!146980 () Bool)

(assert (=> b!284472 (=> (not res!146980) (not e!180453))))

(declare-datatypes ((SeekEntryResult!1887 0))(
  ( (MissingZero!1887 (index!9718 (_ BitVec 32))) (Found!1887 (index!9719 (_ BitVec 32))) (Intermediate!1887 (undefined!2699 Bool) (index!9720 (_ BitVec 32)) (x!27926 (_ BitVec 32))) (Undefined!1887) (MissingVacant!1887 (index!9721 (_ BitVec 32))) )
))
(declare-fun lt!140521 () SeekEntryResult!1887)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284472 (= res!146980 (or (= lt!140521 (MissingZero!1887 i!1267)) (= lt!140521 (MissingVacant!1887 i!1267))))))

(declare-datatypes ((array!14180 0))(
  ( (array!14181 (arr!6729 (Array (_ BitVec 32) (_ BitVec 64))) (size!7081 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14180)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14180 (_ BitVec 32)) SeekEntryResult!1887)

(assert (=> b!284472 (= lt!140521 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284474 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284474 (= e!180453 (and (bvslt startIndex!26 (bvsub (size!7081 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284475 () Bool)

(declare-fun res!146981 () Bool)

(assert (=> b!284475 (=> (not res!146981) (not e!180453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14180 (_ BitVec 32)) Bool)

(assert (=> b!284475 (= res!146981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284476 () Bool)

(declare-fun res!146984 () Bool)

(assert (=> b!284476 (=> (not res!146984) (not e!180455))))

(assert (=> b!284476 (= res!146984 (and (= (size!7081 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7081 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7081 a!3325))))))

(declare-fun b!284473 () Bool)

(declare-fun res!146982 () Bool)

(assert (=> b!284473 (=> (not res!146982) (not e!180453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284473 (= res!146982 (not (validKeyInArray!0 (select (arr!6729 a!3325) startIndex!26))))))

(declare-fun res!146985 () Bool)

(assert (=> start!27530 (=> (not res!146985) (not e!180455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27530 (= res!146985 (validMask!0 mask!3868))))

(assert (=> start!27530 e!180455))

(declare-fun array_inv!4692 (array!14180) Bool)

(assert (=> start!27530 (array_inv!4692 a!3325)))

(assert (=> start!27530 true))

(declare-fun b!284477 () Bool)

(declare-fun res!146983 () Bool)

(assert (=> b!284477 (=> (not res!146983) (not e!180455))))

(assert (=> b!284477 (= res!146983 (validKeyInArray!0 k0!2581))))

(declare-fun b!284478 () Bool)

(declare-fun res!146988 () Bool)

(assert (=> b!284478 (=> (not res!146988) (not e!180453))))

(assert (=> b!284478 (= res!146988 (not (= startIndex!26 i!1267)))))

(declare-fun b!284479 () Bool)

(declare-fun res!146986 () Bool)

(assert (=> b!284479 (=> (not res!146986) (not e!180455))))

(declare-fun arrayContainsKey!0 (array!14180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284479 (= res!146986 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284480 () Bool)

(declare-fun res!146987 () Bool)

(assert (=> b!284480 (=> (not res!146987) (not e!180455))))

(declare-datatypes ((List!4537 0))(
  ( (Nil!4534) (Cons!4533 (h!5206 (_ BitVec 64)) (t!9619 List!4537)) )
))
(declare-fun arrayNoDuplicates!0 (array!14180 (_ BitVec 32) List!4537) Bool)

(assert (=> b!284480 (= res!146987 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4534))))

(assert (= (and start!27530 res!146985) b!284476))

(assert (= (and b!284476 res!146984) b!284477))

(assert (= (and b!284477 res!146983) b!284480))

(assert (= (and b!284480 res!146987) b!284479))

(assert (= (and b!284479 res!146986) b!284472))

(assert (= (and b!284472 res!146980) b!284475))

(assert (= (and b!284475 res!146981) b!284478))

(assert (= (and b!284478 res!146988) b!284473))

(assert (= (and b!284473 res!146982) b!284474))

(declare-fun m!299481 () Bool)

(assert (=> b!284473 m!299481))

(assert (=> b!284473 m!299481))

(declare-fun m!299483 () Bool)

(assert (=> b!284473 m!299483))

(declare-fun m!299485 () Bool)

(assert (=> b!284477 m!299485))

(declare-fun m!299487 () Bool)

(assert (=> b!284480 m!299487))

(declare-fun m!299489 () Bool)

(assert (=> b!284475 m!299489))

(declare-fun m!299491 () Bool)

(assert (=> start!27530 m!299491))

(declare-fun m!299493 () Bool)

(assert (=> start!27530 m!299493))

(declare-fun m!299495 () Bool)

(assert (=> b!284479 m!299495))

(declare-fun m!299497 () Bool)

(assert (=> b!284472 m!299497))

(check-sat (not start!27530) (not b!284477) (not b!284475) (not b!284479) (not b!284473) (not b!284480) (not b!284472))
(check-sat)
