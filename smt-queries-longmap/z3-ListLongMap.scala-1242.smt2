; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26010 () Bool)

(assert start!26010)

(declare-fun b!268399 () Bool)

(declare-fun res!132656 () Bool)

(declare-fun e!173369 () Bool)

(assert (=> b!268399 (=> (not res!132656) (not e!173369))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268399 (= res!132656 (validKeyInArray!0 k0!2581))))

(declare-fun b!268400 () Bool)

(declare-fun res!132654 () Bool)

(declare-fun e!173368 () Bool)

(assert (=> b!268400 (=> (not res!132654) (not e!173368))))

(declare-datatypes ((array!13106 0))(
  ( (array!13107 (arr!6202 (Array (_ BitVec 32) (_ BitVec 64))) (size!6554 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13106)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13106 (_ BitVec 32)) Bool)

(assert (=> b!268400 (= res!132654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132657 () Bool)

(assert (=> start!26010 (=> (not res!132657) (not e!173369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26010 (= res!132657 (validMask!0 mask!3868))))

(assert (=> start!26010 e!173369))

(declare-fun array_inv!4152 (array!13106) Bool)

(assert (=> start!26010 (array_inv!4152 a!3325)))

(assert (=> start!26010 true))

(declare-fun b!268401 () Bool)

(declare-fun res!132655 () Bool)

(assert (=> b!268401 (=> (not res!132655) (not e!173369))))

(declare-datatypes ((List!3923 0))(
  ( (Nil!3920) (Cons!3919 (h!4586 (_ BitVec 64)) (t!8997 List!3923)) )
))
(declare-fun arrayNoDuplicates!0 (array!13106 (_ BitVec 32) List!3923) Bool)

(assert (=> b!268401 (= res!132655 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3920))))

(declare-fun b!268402 () Bool)

(declare-fun res!132652 () Bool)

(assert (=> b!268402 (=> (not res!132652) (not e!173369))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268402 (= res!132652 (and (= (size!6554 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6554 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6554 a!3325))))))

(declare-fun b!268403 () Bool)

(assert (=> b!268403 (= e!173368 (bvsgt #b00000000000000000000000000000000 (size!6554 a!3325)))))

(declare-fun b!268404 () Bool)

(declare-fun res!132653 () Bool)

(assert (=> b!268404 (=> (not res!132653) (not e!173369))))

(declare-fun arrayContainsKey!0 (array!13106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268404 (= res!132653 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268405 () Bool)

(assert (=> b!268405 (= e!173369 e!173368)))

(declare-fun res!132651 () Bool)

(assert (=> b!268405 (=> (not res!132651) (not e!173368))))

(declare-datatypes ((SeekEntryResult!1325 0))(
  ( (MissingZero!1325 (index!7470 (_ BitVec 32))) (Found!1325 (index!7471 (_ BitVec 32))) (Intermediate!1325 (undefined!2137 Bool) (index!7472 (_ BitVec 32)) (x!25946 (_ BitVec 32))) (Undefined!1325) (MissingVacant!1325 (index!7473 (_ BitVec 32))) )
))
(declare-fun lt!134916 () SeekEntryResult!1325)

(assert (=> b!268405 (= res!132651 (or (= lt!134916 (MissingZero!1325 i!1267)) (= lt!134916 (MissingVacant!1325 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13106 (_ BitVec 32)) SeekEntryResult!1325)

(assert (=> b!268405 (= lt!134916 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26010 res!132657) b!268402))

(assert (= (and b!268402 res!132652) b!268399))

(assert (= (and b!268399 res!132656) b!268401))

(assert (= (and b!268401 res!132655) b!268404))

(assert (= (and b!268404 res!132653) b!268405))

(assert (= (and b!268405 res!132651) b!268400))

(assert (= (and b!268400 res!132654) b!268403))

(declare-fun m!284711 () Bool)

(assert (=> start!26010 m!284711))

(declare-fun m!284713 () Bool)

(assert (=> start!26010 m!284713))

(declare-fun m!284715 () Bool)

(assert (=> b!268400 m!284715))

(declare-fun m!284717 () Bool)

(assert (=> b!268399 m!284717))

(declare-fun m!284719 () Bool)

(assert (=> b!268401 m!284719))

(declare-fun m!284721 () Bool)

(assert (=> b!268404 m!284721))

(declare-fun m!284723 () Bool)

(assert (=> b!268405 m!284723))

(check-sat (not b!268401) (not start!26010) (not b!268404) (not b!268399) (not b!268405) (not b!268400))
(check-sat)
