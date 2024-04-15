; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26906 () Bool)

(assert start!26906)

(declare-fun b!278691 () Bool)

(declare-fun e!177732 () Bool)

(declare-fun e!177730 () Bool)

(assert (=> b!278691 (= e!177732 e!177730)))

(declare-fun res!142086 () Bool)

(assert (=> b!278691 (=> (not res!142086) (not e!177730))))

(declare-datatypes ((SeekEntryResult!1733 0))(
  ( (MissingZero!1733 (index!9102 (_ BitVec 32))) (Found!1733 (index!9103 (_ BitVec 32))) (Intermediate!1733 (undefined!2545 Bool) (index!9104 (_ BitVec 32)) (x!27370 (_ BitVec 32))) (Undefined!1733) (MissingVacant!1733 (index!9105 (_ BitVec 32))) )
))
(declare-fun lt!138315 () SeekEntryResult!1733)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278691 (= res!142086 (or (= lt!138315 (MissingZero!1733 i!1267)) (= lt!138315 (MissingVacant!1733 i!1267))))))

(declare-datatypes ((array!13860 0))(
  ( (array!13861 (arr!6576 (Array (_ BitVec 32) (_ BitVec 64))) (size!6929 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13860)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13860 (_ BitVec 32)) SeekEntryResult!1733)

(assert (=> b!278691 (= lt!138315 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278692 () Bool)

(declare-fun res!142085 () Bool)

(assert (=> b!278692 (=> (not res!142085) (not e!177732))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278692 (= res!142085 (and (= (size!6929 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6929 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6929 a!3325))))))

(declare-fun b!278693 () Bool)

(declare-fun res!142084 () Bool)

(assert (=> b!278693 (=> (not res!142084) (not e!177732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278693 (= res!142084 (validKeyInArray!0 k0!2581))))

(declare-fun b!278694 () Bool)

(declare-fun res!142082 () Bool)

(assert (=> b!278694 (=> (not res!142082) (not e!177732))))

(declare-fun arrayContainsKey!0 (array!13860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278694 (= res!142082 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!142083 () Bool)

(assert (=> start!26906 (=> (not res!142083) (not e!177732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26906 (= res!142083 (validMask!0 mask!3868))))

(assert (=> start!26906 e!177732))

(declare-fun array_inv!4548 (array!13860) Bool)

(assert (=> start!26906 (array_inv!4548 a!3325)))

(assert (=> start!26906 true))

(declare-fun b!278695 () Bool)

(declare-fun res!142087 () Bool)

(assert (=> b!278695 (=> (not res!142087) (not e!177732))))

(declare-datatypes ((List!4357 0))(
  ( (Nil!4354) (Cons!4353 (h!5023 (_ BitVec 64)) (t!9430 List!4357)) )
))
(declare-fun arrayNoDuplicates!0 (array!13860 (_ BitVec 32) List!4357) Bool)

(assert (=> b!278695 (= res!142087 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4354))))

(declare-fun b!278696 () Bool)

(assert (=> b!278696 (= e!177730 false)))

(declare-fun lt!138314 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13860 (_ BitVec 32)) Bool)

(assert (=> b!278696 (= lt!138314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26906 res!142083) b!278692))

(assert (= (and b!278692 res!142085) b!278693))

(assert (= (and b!278693 res!142084) b!278695))

(assert (= (and b!278695 res!142087) b!278694))

(assert (= (and b!278694 res!142082) b!278691))

(assert (= (and b!278691 res!142086) b!278696))

(declare-fun m!293195 () Bool)

(assert (=> b!278694 m!293195))

(declare-fun m!293197 () Bool)

(assert (=> b!278691 m!293197))

(declare-fun m!293199 () Bool)

(assert (=> b!278696 m!293199))

(declare-fun m!293201 () Bool)

(assert (=> b!278695 m!293201))

(declare-fun m!293203 () Bool)

(assert (=> start!26906 m!293203))

(declare-fun m!293205 () Bool)

(assert (=> start!26906 m!293205))

(declare-fun m!293207 () Bool)

(assert (=> b!278693 m!293207))

(check-sat (not b!278691) (not b!278694) (not start!26906) (not b!278693) (not b!278696) (not b!278695))
(check-sat)
