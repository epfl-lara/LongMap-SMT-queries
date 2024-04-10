; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26034 () Bool)

(assert start!26034)

(declare-fun b!268575 () Bool)

(declare-fun res!132853 () Bool)

(declare-fun e!173451 () Bool)

(assert (=> b!268575 (=> (not res!132853) (not e!173451))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268575 (= res!132853 (validKeyInArray!0 k!2581))))

(declare-fun b!268576 () Bool)

(declare-fun res!132854 () Bool)

(assert (=> b!268576 (=> (not res!132854) (not e!173451))))

(declare-datatypes ((array!13131 0))(
  ( (array!13132 (arr!6215 (Array (_ BitVec 32) (_ BitVec 64))) (size!6567 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13131)

(declare-datatypes ((List!4023 0))(
  ( (Nil!4020) (Cons!4019 (h!4686 (_ BitVec 64)) (t!9105 List!4023)) )
))
(declare-fun arrayNoDuplicates!0 (array!13131 (_ BitVec 32) List!4023) Bool)

(assert (=> b!268576 (= res!132854 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4020))))

(declare-fun b!268577 () Bool)

(declare-fun res!132856 () Bool)

(assert (=> b!268577 (=> (not res!132856) (not e!173451))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268577 (= res!132856 (and (= (size!6567 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6567 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6567 a!3325))))))

(declare-fun b!268578 () Bool)

(declare-fun e!173452 () Bool)

(assert (=> b!268578 (= e!173451 e!173452)))

(declare-fun res!132857 () Bool)

(assert (=> b!268578 (=> (not res!132857) (not e!173452))))

(declare-datatypes ((SeekEntryResult!1373 0))(
  ( (MissingZero!1373 (index!7662 (_ BitVec 32))) (Found!1373 (index!7663 (_ BitVec 32))) (Intermediate!1373 (undefined!2185 Bool) (index!7664 (_ BitVec 32)) (x!26026 (_ BitVec 32))) (Undefined!1373) (MissingVacant!1373 (index!7665 (_ BitVec 32))) )
))
(declare-fun lt!134922 () SeekEntryResult!1373)

(assert (=> b!268578 (= res!132857 (or (= lt!134922 (MissingZero!1373 i!1267)) (= lt!134922 (MissingVacant!1373 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13131 (_ BitVec 32)) SeekEntryResult!1373)

(assert (=> b!268578 (= lt!134922 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268579 () Bool)

(declare-fun res!132858 () Bool)

(assert (=> b!268579 (=> (not res!132858) (not e!173451))))

(declare-fun arrayContainsKey!0 (array!13131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268579 (= res!132858 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132855 () Bool)

(assert (=> start!26034 (=> (not res!132855) (not e!173451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26034 (= res!132855 (validMask!0 mask!3868))))

(assert (=> start!26034 e!173451))

(declare-fun array_inv!4178 (array!13131) Bool)

(assert (=> start!26034 (array_inv!4178 a!3325)))

(assert (=> start!26034 true))

(declare-fun b!268580 () Bool)

(assert (=> b!268580 (= e!173452 false)))

(declare-fun lt!134923 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13131 (_ BitVec 32)) Bool)

(assert (=> b!268580 (= lt!134923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26034 res!132855) b!268577))

(assert (= (and b!268577 res!132856) b!268575))

(assert (= (and b!268575 res!132853) b!268576))

(assert (= (and b!268576 res!132854) b!268579))

(assert (= (and b!268579 res!132858) b!268578))

(assert (= (and b!268578 res!132857) b!268580))

(declare-fun m!284673 () Bool)

(assert (=> b!268578 m!284673))

(declare-fun m!284675 () Bool)

(assert (=> b!268579 m!284675))

(declare-fun m!284677 () Bool)

(assert (=> b!268576 m!284677))

(declare-fun m!284679 () Bool)

(assert (=> b!268580 m!284679))

(declare-fun m!284681 () Bool)

(assert (=> start!26034 m!284681))

(declare-fun m!284683 () Bool)

(assert (=> start!26034 m!284683))

(declare-fun m!284685 () Bool)

(assert (=> b!268575 m!284685))

(push 1)

