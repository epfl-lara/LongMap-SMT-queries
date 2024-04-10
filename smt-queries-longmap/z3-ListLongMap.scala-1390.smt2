; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27194 () Bool)

(assert start!27194)

(declare-fun b!281445 () Bool)

(declare-fun res!144520 () Bool)

(declare-fun e!178876 () Bool)

(assert (=> b!281445 (=> (not res!144520) (not e!178876))))

(declare-datatypes ((array!14012 0))(
  ( (array!14013 (arr!6648 (Array (_ BitVec 32) (_ BitVec 64))) (size!7000 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14012)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281445 (= res!144520 (and (= (size!7000 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7000 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7000 a!3325))))))

(declare-fun b!281446 () Bool)

(declare-fun res!144514 () Bool)

(declare-fun e!178877 () Bool)

(assert (=> b!281446 (=> (not res!144514) (not e!178877))))

(assert (=> b!281446 (= res!144514 (not (= startIndex!26 i!1267)))))

(declare-fun b!281447 () Bool)

(declare-fun res!144516 () Bool)

(assert (=> b!281447 (=> (not res!144516) (not e!178877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281447 (= res!144516 (validKeyInArray!0 (select (arr!6648 a!3325) startIndex!26)))))

(declare-fun b!281448 () Bool)

(assert (=> b!281448 (= e!178876 e!178877)))

(declare-fun res!144517 () Bool)

(assert (=> b!281448 (=> (not res!144517) (not e!178877))))

(declare-datatypes ((SeekEntryResult!1806 0))(
  ( (MissingZero!1806 (index!9394 (_ BitVec 32))) (Found!1806 (index!9395 (_ BitVec 32))) (Intermediate!1806 (undefined!2618 Bool) (index!9396 (_ BitVec 32)) (x!27620 (_ BitVec 32))) (Undefined!1806) (MissingVacant!1806 (index!9397 (_ BitVec 32))) )
))
(declare-fun lt!139051 () SeekEntryResult!1806)

(assert (=> b!281448 (= res!144517 (or (= lt!139051 (MissingZero!1806 i!1267)) (= lt!139051 (MissingVacant!1806 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14012 (_ BitVec 32)) SeekEntryResult!1806)

(assert (=> b!281448 (= lt!139051 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281450 () Bool)

(assert (=> b!281450 (= e!178877 (not true))))

(declare-datatypes ((List!4456 0))(
  ( (Nil!4453) (Cons!4452 (h!5122 (_ BitVec 64)) (t!9538 List!4456)) )
))
(declare-fun arrayNoDuplicates!0 (array!14012 (_ BitVec 32) List!4456) Bool)

(assert (=> b!281450 (arrayNoDuplicates!0 (array!14013 (store (arr!6648 a!3325) i!1267 k0!2581) (size!7000 a!3325)) #b00000000000000000000000000000000 Nil!4453)))

(declare-datatypes ((Unit!8896 0))(
  ( (Unit!8897) )
))
(declare-fun lt!139050 () Unit!8896)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14012 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4456) Unit!8896)

(assert (=> b!281450 (= lt!139050 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4453))))

(declare-fun b!281451 () Bool)

(declare-fun res!144518 () Bool)

(assert (=> b!281451 (=> (not res!144518) (not e!178876))))

(declare-fun arrayContainsKey!0 (array!14012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281451 (= res!144518 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281452 () Bool)

(declare-fun res!144515 () Bool)

(assert (=> b!281452 (=> (not res!144515) (not e!178876))))

(assert (=> b!281452 (= res!144515 (validKeyInArray!0 k0!2581))))

(declare-fun b!281453 () Bool)

(declare-fun res!144519 () Bool)

(assert (=> b!281453 (=> (not res!144519) (not e!178876))))

(assert (=> b!281453 (= res!144519 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4453))))

(declare-fun b!281449 () Bool)

(declare-fun res!144522 () Bool)

(assert (=> b!281449 (=> (not res!144522) (not e!178877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14012 (_ BitVec 32)) Bool)

(assert (=> b!281449 (= res!144522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144521 () Bool)

(assert (=> start!27194 (=> (not res!144521) (not e!178876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27194 (= res!144521 (validMask!0 mask!3868))))

(assert (=> start!27194 e!178876))

(declare-fun array_inv!4611 (array!14012) Bool)

(assert (=> start!27194 (array_inv!4611 a!3325)))

(assert (=> start!27194 true))

(assert (= (and start!27194 res!144521) b!281445))

(assert (= (and b!281445 res!144520) b!281452))

(assert (= (and b!281452 res!144515) b!281453))

(assert (= (and b!281453 res!144519) b!281451))

(assert (= (and b!281451 res!144518) b!281448))

(assert (= (and b!281448 res!144517) b!281449))

(assert (= (and b!281449 res!144522) b!281446))

(assert (= (and b!281446 res!144514) b!281447))

(assert (= (and b!281447 res!144516) b!281450))

(declare-fun m!295767 () Bool)

(assert (=> start!27194 m!295767))

(declare-fun m!295769 () Bool)

(assert (=> start!27194 m!295769))

(declare-fun m!295771 () Bool)

(assert (=> b!281447 m!295771))

(assert (=> b!281447 m!295771))

(declare-fun m!295773 () Bool)

(assert (=> b!281447 m!295773))

(declare-fun m!295775 () Bool)

(assert (=> b!281449 m!295775))

(declare-fun m!295777 () Bool)

(assert (=> b!281448 m!295777))

(declare-fun m!295779 () Bool)

(assert (=> b!281452 m!295779))

(declare-fun m!295781 () Bool)

(assert (=> b!281453 m!295781))

(declare-fun m!295783 () Bool)

(assert (=> b!281450 m!295783))

(declare-fun m!295785 () Bool)

(assert (=> b!281450 m!295785))

(declare-fun m!295787 () Bool)

(assert (=> b!281450 m!295787))

(declare-fun m!295789 () Bool)

(assert (=> b!281451 m!295789))

(check-sat (not b!281448) (not b!281453) (not b!281447) (not b!281452) (not b!281450) (not b!281451) (not start!27194) (not b!281449))
(check-sat)
