; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26612 () Bool)

(assert start!26612)

(declare-fun b!276288 () Bool)

(declare-fun e!176531 () Bool)

(declare-fun e!176530 () Bool)

(assert (=> b!276288 (= e!176531 e!176530)))

(declare-fun res!140283 () Bool)

(assert (=> b!276288 (=> (not res!140283) (not e!176530))))

(declare-datatypes ((SeekEntryResult!1662 0))(
  ( (MissingZero!1662 (index!8818 (_ BitVec 32))) (Found!1662 (index!8819 (_ BitVec 32))) (Intermediate!1662 (undefined!2474 Bool) (index!8820 (_ BitVec 32)) (x!27083 (_ BitVec 32))) (Undefined!1662) (MissingVacant!1662 (index!8821 (_ BitVec 32))) )
))
(declare-fun lt!137592 () SeekEntryResult!1662)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276288 (= res!140283 (or (= lt!137592 (MissingZero!1662 i!1267)) (= lt!137592 (MissingVacant!1662 i!1267))))))

(declare-datatypes ((array!13709 0))(
  ( (array!13710 (arr!6504 (Array (_ BitVec 32) (_ BitVec 64))) (size!6856 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13709)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13709 (_ BitVec 32)) SeekEntryResult!1662)

(assert (=> b!276288 (= lt!137592 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!140279 () Bool)

(assert (=> start!26612 (=> (not res!140279) (not e!176531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26612 (= res!140279 (validMask!0 mask!3868))))

(assert (=> start!26612 e!176531))

(declare-fun array_inv!4467 (array!13709) Bool)

(assert (=> start!26612 (array_inv!4467 a!3325)))

(assert (=> start!26612 true))

(declare-fun b!276289 () Bool)

(assert (=> b!276289 (= e!176530 false)))

(declare-fun lt!137593 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13709 (_ BitVec 32)) Bool)

(assert (=> b!276289 (= lt!137593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276290 () Bool)

(declare-fun res!140281 () Bool)

(assert (=> b!276290 (=> (not res!140281) (not e!176531))))

(declare-fun arrayContainsKey!0 (array!13709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276290 (= res!140281 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276291 () Bool)

(declare-fun res!140280 () Bool)

(assert (=> b!276291 (=> (not res!140280) (not e!176531))))

(declare-datatypes ((List!4312 0))(
  ( (Nil!4309) (Cons!4308 (h!4975 (_ BitVec 64)) (t!9394 List!4312)) )
))
(declare-fun arrayNoDuplicates!0 (array!13709 (_ BitVec 32) List!4312) Bool)

(assert (=> b!276291 (= res!140280 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4309))))

(declare-fun b!276292 () Bool)

(declare-fun res!140278 () Bool)

(assert (=> b!276292 (=> (not res!140278) (not e!176531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276292 (= res!140278 (validKeyInArray!0 k0!2581))))

(declare-fun b!276293 () Bool)

(declare-fun res!140282 () Bool)

(assert (=> b!276293 (=> (not res!140282) (not e!176531))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276293 (= res!140282 (and (= (size!6856 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6856 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6856 a!3325))))))

(assert (= (and start!26612 res!140279) b!276293))

(assert (= (and b!276293 res!140282) b!276292))

(assert (= (and b!276292 res!140278) b!276291))

(assert (= (and b!276291 res!140280) b!276290))

(assert (= (and b!276290 res!140281) b!276288))

(assert (= (and b!276288 res!140283) b!276289))

(declare-fun m!291659 () Bool)

(assert (=> b!276288 m!291659))

(declare-fun m!291661 () Bool)

(assert (=> b!276290 m!291661))

(declare-fun m!291663 () Bool)

(assert (=> b!276289 m!291663))

(declare-fun m!291665 () Bool)

(assert (=> start!26612 m!291665))

(declare-fun m!291667 () Bool)

(assert (=> start!26612 m!291667))

(declare-fun m!291669 () Bool)

(assert (=> b!276291 m!291669))

(declare-fun m!291671 () Bool)

(assert (=> b!276292 m!291671))

(check-sat (not b!276289) (not b!276292) (not b!276291) (not b!276288) (not start!26612) (not b!276290))
(check-sat)
