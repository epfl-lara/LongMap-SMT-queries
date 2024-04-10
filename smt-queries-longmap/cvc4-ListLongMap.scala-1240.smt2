; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26002 () Bool)

(assert start!26002)

(declare-fun b!268278 () Bool)

(declare-fun res!132559 () Bool)

(declare-fun e!173307 () Bool)

(assert (=> b!268278 (=> (not res!132559) (not e!173307))))

(declare-datatypes ((array!13099 0))(
  ( (array!13100 (arr!6199 (Array (_ BitVec 32) (_ BitVec 64))) (size!6551 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13099)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268278 (= res!132559 (and (= (size!6551 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6551 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6551 a!3325))))))

(declare-fun b!268279 () Bool)

(declare-fun res!132558 () Bool)

(assert (=> b!268279 (=> (not res!132558) (not e!173307))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268279 (= res!132558 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132561 () Bool)

(assert (=> start!26002 (=> (not res!132561) (not e!173307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26002 (= res!132561 (validMask!0 mask!3868))))

(assert (=> start!26002 e!173307))

(declare-fun array_inv!4162 (array!13099) Bool)

(assert (=> start!26002 (array_inv!4162 a!3325)))

(assert (=> start!26002 true))

(declare-fun b!268280 () Bool)

(declare-fun e!173309 () Bool)

(assert (=> b!268280 (= e!173309 false)))

(declare-fun lt!134835 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13099 (_ BitVec 32)) Bool)

(assert (=> b!268280 (= lt!134835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268281 () Bool)

(declare-fun res!132557 () Bool)

(assert (=> b!268281 (=> (not res!132557) (not e!173307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268281 (= res!132557 (validKeyInArray!0 k!2581))))

(declare-fun b!268282 () Bool)

(assert (=> b!268282 (= e!173307 e!173309)))

(declare-fun res!132560 () Bool)

(assert (=> b!268282 (=> (not res!132560) (not e!173309))))

(declare-datatypes ((SeekEntryResult!1357 0))(
  ( (MissingZero!1357 (index!7598 (_ BitVec 32))) (Found!1357 (index!7599 (_ BitVec 32))) (Intermediate!1357 (undefined!2169 Bool) (index!7600 (_ BitVec 32)) (x!25962 (_ BitVec 32))) (Undefined!1357) (MissingVacant!1357 (index!7601 (_ BitVec 32))) )
))
(declare-fun lt!134836 () SeekEntryResult!1357)

(assert (=> b!268282 (= res!132560 (or (= lt!134836 (MissingZero!1357 i!1267)) (= lt!134836 (MissingVacant!1357 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13099 (_ BitVec 32)) SeekEntryResult!1357)

(assert (=> b!268282 (= lt!134836 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268283 () Bool)

(declare-fun res!132556 () Bool)

(assert (=> b!268283 (=> (not res!132556) (not e!173307))))

(declare-datatypes ((List!4007 0))(
  ( (Nil!4004) (Cons!4003 (h!4670 (_ BitVec 64)) (t!9089 List!4007)) )
))
(declare-fun arrayNoDuplicates!0 (array!13099 (_ BitVec 32) List!4007) Bool)

(assert (=> b!268283 (= res!132556 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4004))))

(assert (= (and start!26002 res!132561) b!268278))

(assert (= (and b!268278 res!132559) b!268281))

(assert (= (and b!268281 res!132557) b!268283))

(assert (= (and b!268283 res!132556) b!268279))

(assert (= (and b!268279 res!132558) b!268282))

(assert (= (and b!268282 res!132560) b!268280))

(declare-fun m!284449 () Bool)

(assert (=> start!26002 m!284449))

(declare-fun m!284451 () Bool)

(assert (=> start!26002 m!284451))

(declare-fun m!284453 () Bool)

(assert (=> b!268283 m!284453))

(declare-fun m!284455 () Bool)

(assert (=> b!268279 m!284455))

(declare-fun m!284457 () Bool)

(assert (=> b!268280 m!284457))

(declare-fun m!284459 () Bool)

(assert (=> b!268281 m!284459))

(declare-fun m!284461 () Bool)

(assert (=> b!268282 m!284461))

(push 1)

(assert (not start!26002))

(assert (not b!268281))

(assert (not b!268279))

(assert (not b!268280))

(assert (not b!268283))

(assert (not b!268282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

