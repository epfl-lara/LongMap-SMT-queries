; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26658 () Bool)

(assert start!26658)

(declare-fun b!276758 () Bool)

(declare-fun res!140722 () Bool)

(declare-fun e!176760 () Bool)

(assert (=> b!276758 (=> (not res!140722) (not e!176760))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276758 (= res!140722 (validKeyInArray!0 k0!2581))))

(declare-fun b!276759 () Bool)

(declare-fun res!140723 () Bool)

(assert (=> b!276759 (=> (not res!140723) (not e!176760))))

(declare-datatypes ((array!13754 0))(
  ( (array!13755 (arr!6526 (Array (_ BitVec 32) (_ BitVec 64))) (size!6878 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13754)

(declare-fun arrayContainsKey!0 (array!13754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276759 (= res!140723 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276760 () Bool)

(declare-fun e!176761 () Bool)

(assert (=> b!276760 (= e!176760 e!176761)))

(declare-fun res!140726 () Bool)

(assert (=> b!276760 (=> (not res!140726) (not e!176761))))

(declare-datatypes ((SeekEntryResult!1649 0))(
  ( (MissingZero!1649 (index!8766 (_ BitVec 32))) (Found!1649 (index!8767 (_ BitVec 32))) (Intermediate!1649 (undefined!2461 Bool) (index!8768 (_ BitVec 32)) (x!27134 (_ BitVec 32))) (Undefined!1649) (MissingVacant!1649 (index!8769 (_ BitVec 32))) )
))
(declare-fun lt!137781 () SeekEntryResult!1649)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276760 (= res!140726 (or (= lt!137781 (MissingZero!1649 i!1267)) (= lt!137781 (MissingVacant!1649 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13754 (_ BitVec 32)) SeekEntryResult!1649)

(assert (=> b!276760 (= lt!137781 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276761 () Bool)

(declare-fun res!140725 () Bool)

(assert (=> b!276761 (=> (not res!140725) (not e!176760))))

(declare-datatypes ((List!4247 0))(
  ( (Nil!4244) (Cons!4243 (h!4910 (_ BitVec 64)) (t!9321 List!4247)) )
))
(declare-fun arrayNoDuplicates!0 (array!13754 (_ BitVec 32) List!4247) Bool)

(assert (=> b!276761 (= res!140725 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4244))))

(declare-fun b!276762 () Bool)

(declare-fun res!140724 () Bool)

(assert (=> b!276762 (=> (not res!140724) (not e!176760))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276762 (= res!140724 (and (= (size!6878 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6878 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6878 a!3325))))))

(declare-fun res!140727 () Bool)

(assert (=> start!26658 (=> (not res!140727) (not e!176760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26658 (= res!140727 (validMask!0 mask!3868))))

(assert (=> start!26658 e!176760))

(declare-fun array_inv!4476 (array!13754) Bool)

(assert (=> start!26658 (array_inv!4476 a!3325)))

(assert (=> start!26658 true))

(declare-fun b!276763 () Bool)

(assert (=> b!276763 (= e!176761 false)))

(declare-fun lt!137780 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13754 (_ BitVec 32)) Bool)

(assert (=> b!276763 (= lt!137780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26658 res!140727) b!276762))

(assert (= (and b!276762 res!140724) b!276758))

(assert (= (and b!276758 res!140722) b!276761))

(assert (= (and b!276761 res!140725) b!276759))

(assert (= (and b!276759 res!140723) b!276760))

(assert (= (and b!276760 res!140726) b!276763))

(declare-fun m!292187 () Bool)

(assert (=> start!26658 m!292187))

(declare-fun m!292189 () Bool)

(assert (=> start!26658 m!292189))

(declare-fun m!292191 () Bool)

(assert (=> b!276758 m!292191))

(declare-fun m!292193 () Bool)

(assert (=> b!276759 m!292193))

(declare-fun m!292195 () Bool)

(assert (=> b!276761 m!292195))

(declare-fun m!292197 () Bool)

(assert (=> b!276760 m!292197))

(declare-fun m!292199 () Bool)

(assert (=> b!276763 m!292199))

(check-sat (not b!276761) (not b!276759) (not b!276760) (not b!276763) (not b!276758) (not start!26658))
(check-sat)
