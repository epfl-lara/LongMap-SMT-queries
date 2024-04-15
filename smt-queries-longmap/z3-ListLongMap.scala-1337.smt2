; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26582 () Bool)

(assert start!26582)

(declare-fun res!139864 () Bool)

(declare-fun e!176284 () Bool)

(assert (=> start!26582 (=> (not res!139864) (not e!176284))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26582 (= res!139864 (validMask!0 mask!3868))))

(assert (=> start!26582 e!176284))

(declare-datatypes ((array!13668 0))(
  ( (array!13669 (arr!6483 (Array (_ BitVec 32) (_ BitVec 64))) (size!6836 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13668)

(declare-fun array_inv!4455 (array!13668) Bool)

(assert (=> start!26582 (array_inv!4455 a!3325)))

(assert (=> start!26582 true))

(declare-fun b!275817 () Bool)

(declare-fun res!139861 () Bool)

(assert (=> b!275817 (=> (not res!139861) (not e!176284))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275817 (= res!139861 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275818 () Bool)

(declare-fun e!176285 () Bool)

(assert (=> b!275818 (= e!176285 false)))

(declare-fun lt!137333 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13668 (_ BitVec 32)) Bool)

(assert (=> b!275818 (= lt!137333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275819 () Bool)

(assert (=> b!275819 (= e!176284 e!176285)))

(declare-fun res!139859 () Bool)

(assert (=> b!275819 (=> (not res!139859) (not e!176285))))

(declare-datatypes ((SeekEntryResult!1640 0))(
  ( (MissingZero!1640 (index!8730 (_ BitVec 32))) (Found!1640 (index!8731 (_ BitVec 32))) (Intermediate!1640 (undefined!2452 Bool) (index!8732 (_ BitVec 32)) (x!27020 (_ BitVec 32))) (Undefined!1640) (MissingVacant!1640 (index!8733 (_ BitVec 32))) )
))
(declare-fun lt!137334 () SeekEntryResult!1640)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275819 (= res!139859 (or (= lt!137334 (MissingZero!1640 i!1267)) (= lt!137334 (MissingVacant!1640 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13668 (_ BitVec 32)) SeekEntryResult!1640)

(assert (=> b!275819 (= lt!137334 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275820 () Bool)

(declare-fun res!139860 () Bool)

(assert (=> b!275820 (=> (not res!139860) (not e!176284))))

(declare-datatypes ((List!4264 0))(
  ( (Nil!4261) (Cons!4260 (h!4927 (_ BitVec 64)) (t!9337 List!4264)) )
))
(declare-fun arrayNoDuplicates!0 (array!13668 (_ BitVec 32) List!4264) Bool)

(assert (=> b!275820 (= res!139860 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4261))))

(declare-fun b!275821 () Bool)

(declare-fun res!139862 () Bool)

(assert (=> b!275821 (=> (not res!139862) (not e!176284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275821 (= res!139862 (validKeyInArray!0 k0!2581))))

(declare-fun b!275822 () Bool)

(declare-fun res!139863 () Bool)

(assert (=> b!275822 (=> (not res!139863) (not e!176284))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275822 (= res!139863 (and (= (size!6836 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6836 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6836 a!3325))))))

(assert (= (and start!26582 res!139864) b!275822))

(assert (= (and b!275822 res!139863) b!275821))

(assert (= (and b!275821 res!139862) b!275820))

(assert (= (and b!275820 res!139860) b!275817))

(assert (= (and b!275817 res!139861) b!275819))

(assert (= (and b!275819 res!139859) b!275818))

(declare-fun m!290831 () Bool)

(assert (=> b!275821 m!290831))

(declare-fun m!290833 () Bool)

(assert (=> b!275818 m!290833))

(declare-fun m!290835 () Bool)

(assert (=> b!275819 m!290835))

(declare-fun m!290837 () Bool)

(assert (=> start!26582 m!290837))

(declare-fun m!290839 () Bool)

(assert (=> start!26582 m!290839))

(declare-fun m!290841 () Bool)

(assert (=> b!275817 m!290841))

(declare-fun m!290843 () Bool)

(assert (=> b!275820 m!290843))

(check-sat (not b!275817) (not b!275819) (not start!26582) (not b!275820) (not b!275821) (not b!275818))
(check-sat)
