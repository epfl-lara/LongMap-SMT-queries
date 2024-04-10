; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26020 () Bool)

(assert start!26020)

(declare-fun b!268449 () Bool)

(declare-fun res!132727 () Bool)

(declare-fun e!173389 () Bool)

(assert (=> b!268449 (=> (not res!132727) (not e!173389))))

(declare-datatypes ((array!13117 0))(
  ( (array!13118 (arr!6208 (Array (_ BitVec 32) (_ BitVec 64))) (size!6560 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13117)

(declare-datatypes ((List!4016 0))(
  ( (Nil!4013) (Cons!4012 (h!4679 (_ BitVec 64)) (t!9098 List!4016)) )
))
(declare-fun arrayNoDuplicates!0 (array!13117 (_ BitVec 32) List!4016) Bool)

(assert (=> b!268449 (= res!132727 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4013))))

(declare-fun b!268450 () Bool)

(declare-fun res!132729 () Bool)

(assert (=> b!268450 (=> (not res!132729) (not e!173389))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268450 (= res!132729 (validKeyInArray!0 k!2581))))

(declare-fun b!268451 () Bool)

(declare-fun res!132728 () Bool)

(assert (=> b!268451 (=> (not res!132728) (not e!173389))))

(declare-fun arrayContainsKey!0 (array!13117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268451 (= res!132728 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268452 () Bool)

(declare-fun e!173388 () Bool)

(assert (=> b!268452 (= e!173388 false)))

(declare-fun lt!134880 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13117 (_ BitVec 32)) Bool)

(assert (=> b!268452 (= lt!134880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268453 () Bool)

(declare-fun res!132732 () Bool)

(assert (=> b!268453 (=> (not res!132732) (not e!173389))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268453 (= res!132732 (and (= (size!6560 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6560 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6560 a!3325))))))

(declare-fun res!132731 () Bool)

(assert (=> start!26020 (=> (not res!132731) (not e!173389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26020 (= res!132731 (validMask!0 mask!3868))))

(assert (=> start!26020 e!173389))

(declare-fun array_inv!4171 (array!13117) Bool)

(assert (=> start!26020 (array_inv!4171 a!3325)))

(assert (=> start!26020 true))

(declare-fun b!268454 () Bool)

(assert (=> b!268454 (= e!173389 e!173388)))

(declare-fun res!132730 () Bool)

(assert (=> b!268454 (=> (not res!132730) (not e!173388))))

(declare-datatypes ((SeekEntryResult!1366 0))(
  ( (MissingZero!1366 (index!7634 (_ BitVec 32))) (Found!1366 (index!7635 (_ BitVec 32))) (Intermediate!1366 (undefined!2178 Bool) (index!7636 (_ BitVec 32)) (x!25995 (_ BitVec 32))) (Undefined!1366) (MissingVacant!1366 (index!7637 (_ BitVec 32))) )
))
(declare-fun lt!134881 () SeekEntryResult!1366)

(assert (=> b!268454 (= res!132730 (or (= lt!134881 (MissingZero!1366 i!1267)) (= lt!134881 (MissingVacant!1366 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13117 (_ BitVec 32)) SeekEntryResult!1366)

(assert (=> b!268454 (= lt!134881 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26020 res!132731) b!268453))

(assert (= (and b!268453 res!132732) b!268450))

(assert (= (and b!268450 res!132729) b!268449))

(assert (= (and b!268449 res!132727) b!268451))

(assert (= (and b!268451 res!132728) b!268454))

(assert (= (and b!268454 res!132730) b!268452))

(declare-fun m!284575 () Bool)

(assert (=> b!268452 m!284575))

(declare-fun m!284577 () Bool)

(assert (=> b!268450 m!284577))

(declare-fun m!284579 () Bool)

(assert (=> b!268454 m!284579))

(declare-fun m!284581 () Bool)

(assert (=> b!268449 m!284581))

(declare-fun m!284583 () Bool)

(assert (=> start!26020 m!284583))

(declare-fun m!284585 () Bool)

(assert (=> start!26020 m!284585))

(declare-fun m!284587 () Bool)

(assert (=> b!268451 m!284587))

(push 1)

(assert (not b!268451))

(assert (not start!26020))

(assert (not b!268452))

(assert (not b!268454))

(assert (not b!268449))

(assert (not b!268450))

(check-sat)

