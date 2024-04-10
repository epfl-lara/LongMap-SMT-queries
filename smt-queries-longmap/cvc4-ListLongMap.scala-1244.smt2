; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26026 () Bool)

(assert start!26026)

(declare-fun res!132782 () Bool)

(declare-fun e!173417 () Bool)

(assert (=> start!26026 (=> (not res!132782) (not e!173417))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26026 (= res!132782 (validMask!0 mask!3868))))

(assert (=> start!26026 e!173417))

(declare-datatypes ((array!13123 0))(
  ( (array!13124 (arr!6211 (Array (_ BitVec 32) (_ BitVec 64))) (size!6563 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13123)

(declare-fun array_inv!4174 (array!13123) Bool)

(assert (=> start!26026 (array_inv!4174 a!3325)))

(assert (=> start!26026 true))

(declare-fun b!268503 () Bool)

(declare-fun e!173415 () Bool)

(assert (=> b!268503 (= e!173415 false)))

(declare-fun lt!134899 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13123 (_ BitVec 32)) Bool)

(assert (=> b!268503 (= lt!134899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268504 () Bool)

(declare-fun res!132785 () Bool)

(assert (=> b!268504 (=> (not res!132785) (not e!173417))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268504 (= res!132785 (validKeyInArray!0 k!2581))))

(declare-fun b!268505 () Bool)

(assert (=> b!268505 (= e!173417 e!173415)))

(declare-fun res!132784 () Bool)

(assert (=> b!268505 (=> (not res!132784) (not e!173415))))

(declare-datatypes ((SeekEntryResult!1369 0))(
  ( (MissingZero!1369 (index!7646 (_ BitVec 32))) (Found!1369 (index!7647 (_ BitVec 32))) (Intermediate!1369 (undefined!2181 Bool) (index!7648 (_ BitVec 32)) (x!26006 (_ BitVec 32))) (Undefined!1369) (MissingVacant!1369 (index!7649 (_ BitVec 32))) )
))
(declare-fun lt!134898 () SeekEntryResult!1369)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268505 (= res!132784 (or (= lt!134898 (MissingZero!1369 i!1267)) (= lt!134898 (MissingVacant!1369 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13123 (_ BitVec 32)) SeekEntryResult!1369)

(assert (=> b!268505 (= lt!134898 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268506 () Bool)

(declare-fun res!132781 () Bool)

(assert (=> b!268506 (=> (not res!132781) (not e!173417))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268506 (= res!132781 (and (= (size!6563 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6563 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6563 a!3325))))))

(declare-fun b!268507 () Bool)

(declare-fun res!132783 () Bool)

(assert (=> b!268507 (=> (not res!132783) (not e!173417))))

(declare-fun arrayContainsKey!0 (array!13123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268507 (= res!132783 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268508 () Bool)

(declare-fun res!132786 () Bool)

(assert (=> b!268508 (=> (not res!132786) (not e!173417))))

(declare-datatypes ((List!4019 0))(
  ( (Nil!4016) (Cons!4015 (h!4682 (_ BitVec 64)) (t!9101 List!4019)) )
))
(declare-fun arrayNoDuplicates!0 (array!13123 (_ BitVec 32) List!4019) Bool)

(assert (=> b!268508 (= res!132786 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4016))))

(assert (= (and start!26026 res!132782) b!268506))

(assert (= (and b!268506 res!132781) b!268504))

(assert (= (and b!268504 res!132785) b!268508))

(assert (= (and b!268508 res!132786) b!268507))

(assert (= (and b!268507 res!132783) b!268505))

(assert (= (and b!268505 res!132784) b!268503))

(declare-fun m!284617 () Bool)

(assert (=> b!268508 m!284617))

(declare-fun m!284619 () Bool)

(assert (=> b!268505 m!284619))

(declare-fun m!284621 () Bool)

(assert (=> start!26026 m!284621))

(declare-fun m!284623 () Bool)

(assert (=> start!26026 m!284623))

(declare-fun m!284625 () Bool)

(assert (=> b!268503 m!284625))

(declare-fun m!284627 () Bool)

(assert (=> b!268507 m!284627))

(declare-fun m!284629 () Bool)

(assert (=> b!268504 m!284629))

(push 1)

(assert (not b!268507))

(assert (not b!268503))

(assert (not start!26026))

(assert (not b!268505))

(assert (not b!268504))

(assert (not b!268508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

