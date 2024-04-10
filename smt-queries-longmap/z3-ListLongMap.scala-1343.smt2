; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26618 () Bool)

(assert start!26618)

(declare-fun b!276342 () Bool)

(declare-fun e!176557 () Bool)

(declare-fun e!176556 () Bool)

(assert (=> b!276342 (= e!176557 e!176556)))

(declare-fun res!140336 () Bool)

(assert (=> b!276342 (=> (not res!140336) (not e!176556))))

(declare-datatypes ((SeekEntryResult!1665 0))(
  ( (MissingZero!1665 (index!8830 (_ BitVec 32))) (Found!1665 (index!8831 (_ BitVec 32))) (Intermediate!1665 (undefined!2477 Bool) (index!8832 (_ BitVec 32)) (x!27094 (_ BitVec 32))) (Undefined!1665) (MissingVacant!1665 (index!8833 (_ BitVec 32))) )
))
(declare-fun lt!137610 () SeekEntryResult!1665)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276342 (= res!140336 (or (= lt!137610 (MissingZero!1665 i!1267)) (= lt!137610 (MissingVacant!1665 i!1267))))))

(declare-datatypes ((array!13715 0))(
  ( (array!13716 (arr!6507 (Array (_ BitVec 32) (_ BitVec 64))) (size!6859 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13715)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13715 (_ BitVec 32)) SeekEntryResult!1665)

(assert (=> b!276342 (= lt!137610 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276343 () Bool)

(declare-fun res!140334 () Bool)

(assert (=> b!276343 (=> (not res!140334) (not e!176557))))

(declare-fun arrayContainsKey!0 (array!13715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276343 (= res!140334 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276344 () Bool)

(declare-fun res!140335 () Bool)

(assert (=> b!276344 (=> (not res!140335) (not e!176557))))

(declare-datatypes ((List!4315 0))(
  ( (Nil!4312) (Cons!4311 (h!4978 (_ BitVec 64)) (t!9397 List!4315)) )
))
(declare-fun arrayNoDuplicates!0 (array!13715 (_ BitVec 32) List!4315) Bool)

(assert (=> b!276344 (= res!140335 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4312))))

(declare-fun b!276345 () Bool)

(declare-fun res!140333 () Bool)

(assert (=> b!276345 (=> (not res!140333) (not e!176557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276345 (= res!140333 (validKeyInArray!0 k0!2581))))

(declare-fun b!276347 () Bool)

(assert (=> b!276347 (= e!176556 false)))

(declare-fun lt!137611 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13715 (_ BitVec 32)) Bool)

(assert (=> b!276347 (= lt!137611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276346 () Bool)

(declare-fun res!140337 () Bool)

(assert (=> b!276346 (=> (not res!140337) (not e!176557))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276346 (= res!140337 (and (= (size!6859 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6859 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6859 a!3325))))))

(declare-fun res!140332 () Bool)

(assert (=> start!26618 (=> (not res!140332) (not e!176557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26618 (= res!140332 (validMask!0 mask!3868))))

(assert (=> start!26618 e!176557))

(declare-fun array_inv!4470 (array!13715) Bool)

(assert (=> start!26618 (array_inv!4470 a!3325)))

(assert (=> start!26618 true))

(assert (= (and start!26618 res!140332) b!276346))

(assert (= (and b!276346 res!140337) b!276345))

(assert (= (and b!276345 res!140333) b!276344))

(assert (= (and b!276344 res!140335) b!276343))

(assert (= (and b!276343 res!140334) b!276342))

(assert (= (and b!276342 res!140336) b!276347))

(declare-fun m!291701 () Bool)

(assert (=> b!276345 m!291701))

(declare-fun m!291703 () Bool)

(assert (=> b!276342 m!291703))

(declare-fun m!291705 () Bool)

(assert (=> start!26618 m!291705))

(declare-fun m!291707 () Bool)

(assert (=> start!26618 m!291707))

(declare-fun m!291709 () Bool)

(assert (=> b!276347 m!291709))

(declare-fun m!291711 () Bool)

(assert (=> b!276343 m!291711))

(declare-fun m!291713 () Bool)

(assert (=> b!276344 m!291713))

(check-sat (not b!276345) (not b!276347) (not b!276343) (not start!26618) (not b!276344) (not b!276342))
(check-sat)
