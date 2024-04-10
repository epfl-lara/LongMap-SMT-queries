; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26022 () Bool)

(assert start!26022)

(declare-fun b!268467 () Bool)

(declare-fun res!132746 () Bool)

(declare-fun e!173399 () Bool)

(assert (=> b!268467 (=> (not res!132746) (not e!173399))))

(declare-datatypes ((array!13119 0))(
  ( (array!13120 (arr!6209 (Array (_ BitVec 32) (_ BitVec 64))) (size!6561 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13119)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268467 (= res!132746 (and (= (size!6561 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6561 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6561 a!3325))))))

(declare-fun b!268468 () Bool)

(declare-fun res!132745 () Bool)

(assert (=> b!268468 (=> (not res!132745) (not e!173399))))

(declare-datatypes ((List!4017 0))(
  ( (Nil!4014) (Cons!4013 (h!4680 (_ BitVec 64)) (t!9099 List!4017)) )
))
(declare-fun arrayNoDuplicates!0 (array!13119 (_ BitVec 32) List!4017) Bool)

(assert (=> b!268468 (= res!132745 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4014))))

(declare-fun b!268469 () Bool)

(declare-fun e!173397 () Bool)

(assert (=> b!268469 (= e!173397 false)))

(declare-fun lt!134886 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13119 (_ BitVec 32)) Bool)

(assert (=> b!268469 (= lt!134886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132750 () Bool)

(assert (=> start!26022 (=> (not res!132750) (not e!173399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26022 (= res!132750 (validMask!0 mask!3868))))

(assert (=> start!26022 e!173399))

(declare-fun array_inv!4172 (array!13119) Bool)

(assert (=> start!26022 (array_inv!4172 a!3325)))

(assert (=> start!26022 true))

(declare-fun b!268470 () Bool)

(declare-fun res!132747 () Bool)

(assert (=> b!268470 (=> (not res!132747) (not e!173399))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268470 (= res!132747 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268471 () Bool)

(assert (=> b!268471 (= e!173399 e!173397)))

(declare-fun res!132749 () Bool)

(assert (=> b!268471 (=> (not res!132749) (not e!173397))))

(declare-datatypes ((SeekEntryResult!1367 0))(
  ( (MissingZero!1367 (index!7638 (_ BitVec 32))) (Found!1367 (index!7639 (_ BitVec 32))) (Intermediate!1367 (undefined!2179 Bool) (index!7640 (_ BitVec 32)) (x!26004 (_ BitVec 32))) (Undefined!1367) (MissingVacant!1367 (index!7641 (_ BitVec 32))) )
))
(declare-fun lt!134887 () SeekEntryResult!1367)

(assert (=> b!268471 (= res!132749 (or (= lt!134887 (MissingZero!1367 i!1267)) (= lt!134887 (MissingVacant!1367 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13119 (_ BitVec 32)) SeekEntryResult!1367)

(assert (=> b!268471 (= lt!134887 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268472 () Bool)

(declare-fun res!132748 () Bool)

(assert (=> b!268472 (=> (not res!132748) (not e!173399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268472 (= res!132748 (validKeyInArray!0 k!2581))))

(assert (= (and start!26022 res!132750) b!268467))

(assert (= (and b!268467 res!132746) b!268472))

(assert (= (and b!268472 res!132748) b!268468))

(assert (= (and b!268468 res!132745) b!268470))

(assert (= (and b!268470 res!132747) b!268471))

(assert (= (and b!268471 res!132749) b!268469))

(declare-fun m!284589 () Bool)

(assert (=> b!268471 m!284589))

(declare-fun m!284591 () Bool)

(assert (=> b!268468 m!284591))

(declare-fun m!284593 () Bool)

(assert (=> start!26022 m!284593))

(declare-fun m!284595 () Bool)

(assert (=> start!26022 m!284595))

(declare-fun m!284597 () Bool)

(assert (=> b!268470 m!284597))

(declare-fun m!284599 () Bool)

(assert (=> b!268472 m!284599))

(declare-fun m!284601 () Bool)

(assert (=> b!268469 m!284601))

(push 1)

(assert (not b!268469))

(assert (not b!268470))

