; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26672 () Bool)

(assert start!26672)

(declare-fun b!276672 () Bool)

(declare-fun res!140719 () Bool)

(declare-fun e!176690 () Bool)

(assert (=> b!276672 (=> (not res!140719) (not e!176690))))

(declare-datatypes ((array!13758 0))(
  ( (array!13759 (arr!6528 (Array (_ BitVec 32) (_ BitVec 64))) (size!6881 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13758)

(declare-datatypes ((List!4309 0))(
  ( (Nil!4306) (Cons!4305 (h!4972 (_ BitVec 64)) (t!9382 List!4309)) )
))
(declare-fun arrayNoDuplicates!0 (array!13758 (_ BitVec 32) List!4309) Bool)

(assert (=> b!276672 (= res!140719 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4306))))

(declare-fun b!276673 () Bool)

(declare-fun res!140714 () Bool)

(assert (=> b!276673 (=> (not res!140714) (not e!176690))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276673 (= res!140714 (and (= (size!6881 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6881 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6881 a!3325))))))

(declare-fun b!276674 () Bool)

(declare-fun e!176689 () Bool)

(assert (=> b!276674 (= e!176689 false)))

(declare-fun lt!137577 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13758 (_ BitVec 32)) Bool)

(assert (=> b!276674 (= lt!137577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140715 () Bool)

(assert (=> start!26672 (=> (not res!140715) (not e!176690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26672 (= res!140715 (validMask!0 mask!3868))))

(assert (=> start!26672 e!176690))

(declare-fun array_inv!4500 (array!13758) Bool)

(assert (=> start!26672 (array_inv!4500 a!3325)))

(assert (=> start!26672 true))

(declare-fun b!276675 () Bool)

(declare-fun res!140716 () Bool)

(assert (=> b!276675 (=> (not res!140716) (not e!176690))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276675 (= res!140716 (validKeyInArray!0 k0!2581))))

(declare-fun b!276676 () Bool)

(declare-fun res!140718 () Bool)

(assert (=> b!276676 (=> (not res!140718) (not e!176690))))

(declare-fun arrayContainsKey!0 (array!13758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276676 (= res!140718 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276677 () Bool)

(assert (=> b!276677 (= e!176690 e!176689)))

(declare-fun res!140717 () Bool)

(assert (=> b!276677 (=> (not res!140717) (not e!176689))))

(declare-datatypes ((SeekEntryResult!1685 0))(
  ( (MissingZero!1685 (index!8910 (_ BitVec 32))) (Found!1685 (index!8911 (_ BitVec 32))) (Intermediate!1685 (undefined!2497 Bool) (index!8912 (_ BitVec 32)) (x!27185 (_ BitVec 32))) (Undefined!1685) (MissingVacant!1685 (index!8913 (_ BitVec 32))) )
))
(declare-fun lt!137576 () SeekEntryResult!1685)

(assert (=> b!276677 (= res!140717 (or (= lt!137576 (MissingZero!1685 i!1267)) (= lt!137576 (MissingVacant!1685 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13758 (_ BitVec 32)) SeekEntryResult!1685)

(assert (=> b!276677 (= lt!137576 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26672 res!140715) b!276673))

(assert (= (and b!276673 res!140714) b!276675))

(assert (= (and b!276675 res!140716) b!276672))

(assert (= (and b!276672 res!140719) b!276676))

(assert (= (and b!276676 res!140718) b!276677))

(assert (= (and b!276677 res!140717) b!276674))

(declare-fun m!291473 () Bool)

(assert (=> b!276677 m!291473))

(declare-fun m!291475 () Bool)

(assert (=> start!26672 m!291475))

(declare-fun m!291477 () Bool)

(assert (=> start!26672 m!291477))

(declare-fun m!291479 () Bool)

(assert (=> b!276672 m!291479))

(declare-fun m!291481 () Bool)

(assert (=> b!276675 m!291481))

(declare-fun m!291483 () Bool)

(assert (=> b!276674 m!291483))

(declare-fun m!291485 () Bool)

(assert (=> b!276676 m!291485))

(check-sat (not start!26672) (not b!276676) (not b!276672) (not b!276675) (not b!276677) (not b!276674))
(check-sat)
