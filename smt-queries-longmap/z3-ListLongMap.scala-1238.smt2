; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25988 () Bool)

(assert start!25988)

(declare-fun res!132437 () Bool)

(declare-fun e!173248 () Bool)

(assert (=> start!25988 (=> (not res!132437) (not e!173248))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25988 (= res!132437 (validMask!0 mask!3868))))

(assert (=> start!25988 e!173248))

(declare-datatypes ((array!13085 0))(
  ( (array!13086 (arr!6192 (Array (_ BitVec 32) (_ BitVec 64))) (size!6544 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13085)

(declare-fun array_inv!4155 (array!13085) Bool)

(assert (=> start!25988 (array_inv!4155 a!3325)))

(assert (=> start!25988 true))

(declare-fun b!268156 () Bool)

(declare-fun res!132436 () Bool)

(assert (=> b!268156 (=> (not res!132436) (not e!173248))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268156 (= res!132436 (and (= (size!6544 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6544 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6544 a!3325))))))

(declare-fun b!268157 () Bool)

(declare-fun res!132438 () Bool)

(assert (=> b!268157 (=> (not res!132438) (not e!173248))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268157 (= res!132438 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268158 () Bool)

(declare-datatypes ((SeekEntryResult!1350 0))(
  ( (MissingZero!1350 (index!7570 (_ BitVec 32))) (Found!1350 (index!7571 (_ BitVec 32))) (Intermediate!1350 (undefined!2162 Bool) (index!7572 (_ BitVec 32)) (x!25939 (_ BitVec 32))) (Undefined!1350) (MissingVacant!1350 (index!7573 (_ BitVec 32))) )
))
(declare-fun lt!134797 () SeekEntryResult!1350)

(assert (=> b!268158 (= e!173248 (and (or (= lt!134797 (MissingZero!1350 i!1267)) (= lt!134797 (MissingVacant!1350 i!1267))) (bvsgt #b00000000000000000000000000000000 (size!6544 a!3325))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13085 (_ BitVec 32)) SeekEntryResult!1350)

(assert (=> b!268158 (= lt!134797 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268159 () Bool)

(declare-fun res!132434 () Bool)

(assert (=> b!268159 (=> (not res!132434) (not e!173248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268159 (= res!132434 (validKeyInArray!0 k0!2581))))

(declare-fun b!268160 () Bool)

(declare-fun res!132435 () Bool)

(assert (=> b!268160 (=> (not res!132435) (not e!173248))))

(declare-datatypes ((List!4000 0))(
  ( (Nil!3997) (Cons!3996 (h!4663 (_ BitVec 64)) (t!9082 List!4000)) )
))
(declare-fun arrayNoDuplicates!0 (array!13085 (_ BitVec 32) List!4000) Bool)

(assert (=> b!268160 (= res!132435 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3997))))

(assert (= (and start!25988 res!132437) b!268156))

(assert (= (and b!268156 res!132436) b!268159))

(assert (= (and b!268159 res!132434) b!268160))

(assert (= (and b!268160 res!132435) b!268157))

(assert (= (and b!268157 res!132438) b!268158))

(declare-fun m!284355 () Bool)

(assert (=> start!25988 m!284355))

(declare-fun m!284357 () Bool)

(assert (=> start!25988 m!284357))

(declare-fun m!284359 () Bool)

(assert (=> b!268157 m!284359))

(declare-fun m!284361 () Bool)

(assert (=> b!268160 m!284361))

(declare-fun m!284363 () Bool)

(assert (=> b!268158 m!284363))

(declare-fun m!284365 () Bool)

(assert (=> b!268159 m!284365))

(check-sat (not b!268159) (not b!268160) (not b!268158) (not b!268157) (not start!25988))
(check-sat)
