; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46202 () Bool)

(assert start!46202)

(declare-fun res!312333 () Bool)

(declare-fun e!298919 () Bool)

(assert (=> start!46202 (=> (not res!312333) (not e!298919))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46202 (= res!312333 (validMask!0 mask!3524))))

(assert (=> start!46202 e!298919))

(assert (=> start!46202 true))

(declare-datatypes ((array!32857 0))(
  ( (array!32858 (arr!15805 (Array (_ BitVec 32) (_ BitVec 64))) (size!16169 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32857)

(declare-fun array_inv!11664 (array!32857) Bool)

(assert (=> start!46202 (array_inv!11664 a!3235)))

(declare-fun b!511609 () Bool)

(declare-fun res!312327 () Bool)

(declare-fun e!298920 () Bool)

(assert (=> b!511609 (=> (not res!312327) (not e!298920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32857 (_ BitVec 32)) Bool)

(assert (=> b!511609 (= res!312327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511610 () Bool)

(declare-fun res!312328 () Bool)

(assert (=> b!511610 (=> (not res!312328) (not e!298919))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511610 (= res!312328 (and (= (size!16169 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16169 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16169 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511611 () Bool)

(declare-fun e!298918 () Bool)

(assert (=> b!511611 (= e!298920 (not e!298918))))

(declare-fun res!312330 () Bool)

(assert (=> b!511611 (=> res!312330 e!298918)))

(declare-fun lt!234134 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4228 0))(
  ( (MissingZero!4228 (index!19100 (_ BitVec 32))) (Found!4228 (index!19101 (_ BitVec 32))) (Intermediate!4228 (undefined!5040 Bool) (index!19102 (_ BitVec 32)) (x!48200 (_ BitVec 32))) (Undefined!4228) (MissingVacant!4228 (index!19103 (_ BitVec 32))) )
))
(declare-fun lt!234133 () SeekEntryResult!4228)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32857 (_ BitVec 32)) SeekEntryResult!4228)

(assert (=> b!511611 (= res!312330 (= lt!234133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234134 (select (store (arr!15805 a!3235) i!1204 k0!2280) j!176) (array!32858 (store (arr!15805 a!3235) i!1204 k0!2280) (size!16169 a!3235)) mask!3524)))))

(declare-fun lt!234131 () (_ BitVec 32))

(assert (=> b!511611 (= lt!234133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234131 (select (arr!15805 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511611 (= lt!234134 (toIndex!0 (select (store (arr!15805 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511611 (= lt!234131 (toIndex!0 (select (arr!15805 a!3235) j!176) mask!3524))))

(declare-fun lt!234136 () SeekEntryResult!4228)

(assert (=> b!511611 (= lt!234136 (Found!4228 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32857 (_ BitVec 32)) SeekEntryResult!4228)

(assert (=> b!511611 (= lt!234136 (seekEntryOrOpen!0 (select (arr!15805 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511611 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15775 0))(
  ( (Unit!15776) )
))
(declare-fun lt!234132 () Unit!15775)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15775)

(assert (=> b!511611 (= lt!234132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511612 () Bool)

(declare-fun res!312334 () Bool)

(assert (=> b!511612 (=> (not res!312334) (not e!298919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511612 (= res!312334 (validKeyInArray!0 k0!2280))))

(declare-fun b!511613 () Bool)

(declare-fun res!312329 () Bool)

(assert (=> b!511613 (=> (not res!312329) (not e!298920))))

(declare-datatypes ((List!9870 0))(
  ( (Nil!9867) (Cons!9866 (h!10746 (_ BitVec 64)) (t!16090 List!9870)) )
))
(declare-fun arrayNoDuplicates!0 (array!32857 (_ BitVec 32) List!9870) Bool)

(assert (=> b!511613 (= res!312329 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9867))))

(declare-fun b!511614 () Bool)

(declare-fun res!312326 () Bool)

(assert (=> b!511614 (=> (not res!312326) (not e!298919))))

(assert (=> b!511614 (= res!312326 (validKeyInArray!0 (select (arr!15805 a!3235) j!176)))))

(declare-fun b!511615 () Bool)

(declare-fun res!312332 () Bool)

(assert (=> b!511615 (=> (not res!312332) (not e!298919))))

(declare-fun arrayContainsKey!0 (array!32857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511615 (= res!312332 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511616 () Bool)

(assert (=> b!511616 (= e!298918 (or (bvsgt #b00000000000000000000000000000000 (size!16169 a!3235)) (bvsle j!176 (size!16169 a!3235))))))

(assert (=> b!511616 (= lt!234136 Undefined!4228)))

(declare-fun b!511617 () Bool)

(declare-fun res!312325 () Bool)

(assert (=> b!511617 (=> res!312325 e!298918)))

(get-info :version)

(assert (=> b!511617 (= res!312325 (or (not ((_ is Intermediate!4228) lt!234133)) (not (undefined!5040 lt!234133))))))

(declare-fun b!511618 () Bool)

(assert (=> b!511618 (= e!298919 e!298920)))

(declare-fun res!312331 () Bool)

(assert (=> b!511618 (=> (not res!312331) (not e!298920))))

(declare-fun lt!234135 () SeekEntryResult!4228)

(assert (=> b!511618 (= res!312331 (or (= lt!234135 (MissingZero!4228 i!1204)) (= lt!234135 (MissingVacant!4228 i!1204))))))

(assert (=> b!511618 (= lt!234135 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46202 res!312333) b!511610))

(assert (= (and b!511610 res!312328) b!511614))

(assert (= (and b!511614 res!312326) b!511612))

(assert (= (and b!511612 res!312334) b!511615))

(assert (= (and b!511615 res!312332) b!511618))

(assert (= (and b!511618 res!312331) b!511609))

(assert (= (and b!511609 res!312327) b!511613))

(assert (= (and b!511613 res!312329) b!511611))

(assert (= (and b!511611 (not res!312330)) b!511617))

(assert (= (and b!511617 (not res!312325)) b!511616))

(declare-fun m!493357 () Bool)

(assert (=> b!511618 m!493357))

(declare-fun m!493359 () Bool)

(assert (=> b!511613 m!493359))

(declare-fun m!493361 () Bool)

(assert (=> b!511611 m!493361))

(declare-fun m!493363 () Bool)

(assert (=> b!511611 m!493363))

(declare-fun m!493365 () Bool)

(assert (=> b!511611 m!493365))

(declare-fun m!493367 () Bool)

(assert (=> b!511611 m!493367))

(declare-fun m!493369 () Bool)

(assert (=> b!511611 m!493369))

(declare-fun m!493371 () Bool)

(assert (=> b!511611 m!493371))

(assert (=> b!511611 m!493361))

(assert (=> b!511611 m!493365))

(declare-fun m!493373 () Bool)

(assert (=> b!511611 m!493373))

(assert (=> b!511611 m!493365))

(declare-fun m!493375 () Bool)

(assert (=> b!511611 m!493375))

(assert (=> b!511611 m!493365))

(declare-fun m!493377 () Bool)

(assert (=> b!511611 m!493377))

(assert (=> b!511611 m!493361))

(declare-fun m!493379 () Bool)

(assert (=> b!511611 m!493379))

(declare-fun m!493381 () Bool)

(assert (=> b!511612 m!493381))

(declare-fun m!493383 () Bool)

(assert (=> start!46202 m!493383))

(declare-fun m!493385 () Bool)

(assert (=> start!46202 m!493385))

(declare-fun m!493387 () Bool)

(assert (=> b!511609 m!493387))

(assert (=> b!511614 m!493365))

(assert (=> b!511614 m!493365))

(declare-fun m!493389 () Bool)

(assert (=> b!511614 m!493389))

(declare-fun m!493391 () Bool)

(assert (=> b!511615 m!493391))

(check-sat (not b!511609) (not b!511612) (not b!511615) (not b!511614) (not start!46202) (not b!511618) (not b!511613) (not b!511611))
(check-sat)
