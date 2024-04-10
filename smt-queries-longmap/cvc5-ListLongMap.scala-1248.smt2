; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26046 () Bool)

(assert start!26046)

(declare-fun b!268683 () Bool)

(declare-fun res!132966 () Bool)

(declare-fun e!173505 () Bool)

(assert (=> b!268683 (=> (not res!132966) (not e!173505))))

(declare-datatypes ((array!13143 0))(
  ( (array!13144 (arr!6221 (Array (_ BitVec 32) (_ BitVec 64))) (size!6573 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13143)

(declare-datatypes ((List!4029 0))(
  ( (Nil!4026) (Cons!4025 (h!4692 (_ BitVec 64)) (t!9111 List!4029)) )
))
(declare-fun arrayNoDuplicates!0 (array!13143 (_ BitVec 32) List!4029) Bool)

(assert (=> b!268683 (= res!132966 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4026))))

(declare-fun b!268684 () Bool)

(declare-fun res!132961 () Bool)

(assert (=> b!268684 (=> (not res!132961) (not e!173505))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268684 (= res!132961 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268685 () Bool)

(declare-fun e!173506 () Bool)

(assert (=> b!268685 (= e!173506 false)))

(declare-fun lt!134958 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13143 (_ BitVec 32)) Bool)

(assert (=> b!268685 (= lt!134958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132965 () Bool)

(assert (=> start!26046 (=> (not res!132965) (not e!173505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26046 (= res!132965 (validMask!0 mask!3868))))

(assert (=> start!26046 e!173505))

(declare-fun array_inv!4184 (array!13143) Bool)

(assert (=> start!26046 (array_inv!4184 a!3325)))

(assert (=> start!26046 true))

(declare-fun b!268686 () Bool)

(declare-fun res!132962 () Bool)

(assert (=> b!268686 (=> (not res!132962) (not e!173505))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268686 (= res!132962 (and (= (size!6573 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6573 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6573 a!3325))))))

(declare-fun b!268687 () Bool)

(assert (=> b!268687 (= e!173505 e!173506)))

(declare-fun res!132963 () Bool)

(assert (=> b!268687 (=> (not res!132963) (not e!173506))))

(declare-datatypes ((SeekEntryResult!1379 0))(
  ( (MissingZero!1379 (index!7686 (_ BitVec 32))) (Found!1379 (index!7687 (_ BitVec 32))) (Intermediate!1379 (undefined!2191 Bool) (index!7688 (_ BitVec 32)) (x!26048 (_ BitVec 32))) (Undefined!1379) (MissingVacant!1379 (index!7689 (_ BitVec 32))) )
))
(declare-fun lt!134959 () SeekEntryResult!1379)

(assert (=> b!268687 (= res!132963 (or (= lt!134959 (MissingZero!1379 i!1267)) (= lt!134959 (MissingVacant!1379 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13143 (_ BitVec 32)) SeekEntryResult!1379)

(assert (=> b!268687 (= lt!134959 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268688 () Bool)

(declare-fun res!132964 () Bool)

(assert (=> b!268688 (=> (not res!132964) (not e!173505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268688 (= res!132964 (validKeyInArray!0 k!2581))))

(assert (= (and start!26046 res!132965) b!268686))

(assert (= (and b!268686 res!132962) b!268688))

(assert (= (and b!268688 res!132964) b!268683))

(assert (= (and b!268683 res!132966) b!268684))

(assert (= (and b!268684 res!132961) b!268687))

(assert (= (and b!268687 res!132963) b!268685))

(declare-fun m!284757 () Bool)

(assert (=> start!26046 m!284757))

(declare-fun m!284759 () Bool)

(assert (=> start!26046 m!284759))

(declare-fun m!284761 () Bool)

(assert (=> b!268687 m!284761))

(declare-fun m!284763 () Bool)

(assert (=> b!268684 m!284763))

(declare-fun m!284765 () Bool)

(assert (=> b!268685 m!284765))

(declare-fun m!284767 () Bool)

(assert (=> b!268683 m!284767))

(declare-fun m!284769 () Bool)

(assert (=> b!268688 m!284769))

(push 1)

