; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26550 () Bool)

(assert start!26550)

(declare-fun b!275605 () Bool)

(declare-fun res!139572 () Bool)

(declare-fun e!176274 () Bool)

(assert (=> b!275605 (=> (not res!139572) (not e!176274))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275605 (= res!139572 (not (= startIndex!26 i!1267)))))

(declare-fun b!275606 () Bool)

(declare-fun res!139571 () Bool)

(assert (=> b!275606 (=> (not res!139571) (not e!176274))))

(declare-datatypes ((array!13646 0))(
  ( (array!13647 (arr!6472 (Array (_ BitVec 32) (_ BitVec 64))) (size!6824 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13646)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13646 (_ BitVec 32)) Bool)

(assert (=> b!275606 (= res!139571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139578 () Bool)

(declare-fun e!176276 () Bool)

(assert (=> start!26550 (=> (not res!139578) (not e!176276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26550 (= res!139578 (validMask!0 mask!3868))))

(assert (=> start!26550 e!176276))

(declare-fun array_inv!4422 (array!13646) Bool)

(assert (=> start!26550 (array_inv!4422 a!3325)))

(assert (=> start!26550 true))

(declare-fun b!275607 () Bool)

(assert (=> b!275607 (= e!176274 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!275607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13647 (store (arr!6472 a!3325) i!1267 k0!2581) (size!6824 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8657 0))(
  ( (Unit!8658) )
))
(declare-fun lt!137483 () Unit!8657)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8657)

(assert (=> b!275607 (= lt!137483 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275608 () Bool)

(declare-fun res!139570 () Bool)

(assert (=> b!275608 (=> (not res!139570) (not e!176276))))

(assert (=> b!275608 (= res!139570 (and (= (size!6824 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6824 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6824 a!3325))))))

(declare-fun b!275609 () Bool)

(declare-fun res!139576 () Bool)

(assert (=> b!275609 (=> (not res!139576) (not e!176276))))

(declare-fun arrayContainsKey!0 (array!13646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275609 (= res!139576 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275610 () Bool)

(declare-fun res!139569 () Bool)

(assert (=> b!275610 (=> (not res!139569) (not e!176274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275610 (= res!139569 (not (validKeyInArray!0 (select (arr!6472 a!3325) startIndex!26))))))

(declare-fun b!275611 () Bool)

(declare-fun res!139577 () Bool)

(assert (=> b!275611 (=> (not res!139577) (not e!176274))))

(assert (=> b!275611 (= res!139577 (and (bvslt startIndex!26 (bvsub (size!6824 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275612 () Bool)

(declare-fun res!139574 () Bool)

(assert (=> b!275612 (=> (not res!139574) (not e!176276))))

(assert (=> b!275612 (= res!139574 (validKeyInArray!0 k0!2581))))

(declare-fun b!275613 () Bool)

(assert (=> b!275613 (= e!176276 e!176274)))

(declare-fun res!139575 () Bool)

(assert (=> b!275613 (=> (not res!139575) (not e!176274))))

(declare-datatypes ((SeekEntryResult!1595 0))(
  ( (MissingZero!1595 (index!8550 (_ BitVec 32))) (Found!1595 (index!8551 (_ BitVec 32))) (Intermediate!1595 (undefined!2407 Bool) (index!8552 (_ BitVec 32)) (x!26936 (_ BitVec 32))) (Undefined!1595) (MissingVacant!1595 (index!8553 (_ BitVec 32))) )
))
(declare-fun lt!137484 () SeekEntryResult!1595)

(assert (=> b!275613 (= res!139575 (or (= lt!137484 (MissingZero!1595 i!1267)) (= lt!137484 (MissingVacant!1595 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13646 (_ BitVec 32)) SeekEntryResult!1595)

(assert (=> b!275613 (= lt!137484 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275614 () Bool)

(declare-fun res!139573 () Bool)

(assert (=> b!275614 (=> (not res!139573) (not e!176276))))

(declare-datatypes ((List!4193 0))(
  ( (Nil!4190) (Cons!4189 (h!4856 (_ BitVec 64)) (t!9267 List!4193)) )
))
(declare-fun arrayNoDuplicates!0 (array!13646 (_ BitVec 32) List!4193) Bool)

(assert (=> b!275614 (= res!139573 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4190))))

(assert (= (and start!26550 res!139578) b!275608))

(assert (= (and b!275608 res!139570) b!275612))

(assert (= (and b!275612 res!139574) b!275614))

(assert (= (and b!275614 res!139573) b!275609))

(assert (= (and b!275609 res!139576) b!275613))

(assert (= (and b!275613 res!139575) b!275606))

(assert (= (and b!275606 res!139571) b!275605))

(assert (= (and b!275605 res!139572) b!275610))

(assert (= (and b!275610 res!139569) b!275611))

(assert (= (and b!275611 res!139577) b!275607))

(declare-fun m!291299 () Bool)

(assert (=> b!275613 m!291299))

(declare-fun m!291301 () Bool)

(assert (=> b!275609 m!291301))

(declare-fun m!291303 () Bool)

(assert (=> b!275614 m!291303))

(declare-fun m!291305 () Bool)

(assert (=> b!275610 m!291305))

(assert (=> b!275610 m!291305))

(declare-fun m!291307 () Bool)

(assert (=> b!275610 m!291307))

(declare-fun m!291309 () Bool)

(assert (=> start!26550 m!291309))

(declare-fun m!291311 () Bool)

(assert (=> start!26550 m!291311))

(declare-fun m!291313 () Bool)

(assert (=> b!275606 m!291313))

(declare-fun m!291315 () Bool)

(assert (=> b!275607 m!291315))

(declare-fun m!291317 () Bool)

(assert (=> b!275607 m!291317))

(declare-fun m!291319 () Bool)

(assert (=> b!275607 m!291319))

(declare-fun m!291321 () Bool)

(assert (=> b!275612 m!291321))

(check-sat (not b!275609) (not b!275610) (not b!275607) (not start!26550) (not b!275612) (not b!275606) (not b!275613) (not b!275614))
(check-sat)
