; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44658 () Bool)

(assert start!44658)

(declare-fun b!489866 () Bool)

(declare-fun e!287999 () Bool)

(declare-fun e!288000 () Bool)

(assert (=> b!489866 (= e!287999 e!288000)))

(declare-fun res!292947 () Bool)

(assert (=> b!489866 (=> (not res!292947) (not e!288000))))

(declare-datatypes ((SeekEntryResult!3715 0))(
  ( (MissingZero!3715 (index!17039 (_ BitVec 32))) (Found!3715 (index!17040 (_ BitVec 32))) (Intermediate!3715 (undefined!4527 Bool) (index!17041 (_ BitVec 32)) (x!46152 (_ BitVec 32))) (Undefined!3715) (MissingVacant!3715 (index!17042 (_ BitVec 32))) )
))
(declare-fun lt!221060 () SeekEntryResult!3715)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489866 (= res!292947 (or (= lt!221060 (MissingZero!3715 i!1204)) (= lt!221060 (MissingVacant!3715 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31727 0))(
  ( (array!31728 (arr!15251 (Array (_ BitVec 32) (_ BitVec 64))) (size!15616 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31727)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31727 (_ BitVec 32)) SeekEntryResult!3715)

(assert (=> b!489866 (= lt!221060 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489867 () Bool)

(declare-fun res!292951 () Bool)

(assert (=> b!489867 (=> (not res!292951) (not e!287999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489867 (= res!292951 (validKeyInArray!0 k0!2280))))

(declare-fun b!489868 () Bool)

(declare-fun res!292946 () Bool)

(assert (=> b!489868 (=> (not res!292946) (not e!288000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31727 (_ BitVec 32)) Bool)

(assert (=> b!489868 (= res!292946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489869 () Bool)

(assert (=> b!489869 (= e!288000 (not true))))

(declare-fun lt!221058 () (_ BitVec 32))

(declare-fun lt!221059 () SeekEntryResult!3715)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31727 (_ BitVec 32)) SeekEntryResult!3715)

(assert (=> b!489869 (= lt!221059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221058 (select (store (arr!15251 a!3235) i!1204 k0!2280) j!176) (array!31728 (store (arr!15251 a!3235) i!1204 k0!2280) (size!15616 a!3235)) mask!3524))))

(declare-fun lt!221061 () (_ BitVec 32))

(declare-fun lt!221062 () SeekEntryResult!3715)

(assert (=> b!489869 (= lt!221062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221061 (select (arr!15251 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489869 (= lt!221058 (toIndex!0 (select (store (arr!15251 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489869 (= lt!221061 (toIndex!0 (select (arr!15251 a!3235) j!176) mask!3524))))

(declare-fun e!287998 () Bool)

(assert (=> b!489869 e!287998))

(declare-fun res!292948 () Bool)

(assert (=> b!489869 (=> (not res!292948) (not e!287998))))

(assert (=> b!489869 (= res!292948 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14362 0))(
  ( (Unit!14363) )
))
(declare-fun lt!221057 () Unit!14362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14362)

(assert (=> b!489869 (= lt!221057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!292952 () Bool)

(assert (=> start!44658 (=> (not res!292952) (not e!287999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44658 (= res!292952 (validMask!0 mask!3524))))

(assert (=> start!44658 e!287999))

(assert (=> start!44658 true))

(declare-fun array_inv!11134 (array!31727) Bool)

(assert (=> start!44658 (array_inv!11134 a!3235)))

(declare-fun b!489870 () Bool)

(declare-fun res!292949 () Bool)

(assert (=> b!489870 (=> (not res!292949) (not e!287999))))

(declare-fun arrayContainsKey!0 (array!31727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489870 (= res!292949 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489871 () Bool)

(declare-fun res!292944 () Bool)

(assert (=> b!489871 (=> (not res!292944) (not e!287999))))

(assert (=> b!489871 (= res!292944 (validKeyInArray!0 (select (arr!15251 a!3235) j!176)))))

(declare-fun b!489872 () Bool)

(assert (=> b!489872 (= e!287998 (= (seekEntryOrOpen!0 (select (arr!15251 a!3235) j!176) a!3235 mask!3524) (Found!3715 j!176)))))

(declare-fun b!489873 () Bool)

(declare-fun res!292950 () Bool)

(assert (=> b!489873 (=> (not res!292950) (not e!287999))))

(assert (=> b!489873 (= res!292950 (and (= (size!15616 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15616 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15616 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489874 () Bool)

(declare-fun res!292945 () Bool)

(assert (=> b!489874 (=> (not res!292945) (not e!288000))))

(declare-datatypes ((List!9448 0))(
  ( (Nil!9445) (Cons!9444 (h!10306 (_ BitVec 64)) (t!15667 List!9448)) )
))
(declare-fun arrayNoDuplicates!0 (array!31727 (_ BitVec 32) List!9448) Bool)

(assert (=> b!489874 (= res!292945 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9445))))

(assert (= (and start!44658 res!292952) b!489873))

(assert (= (and b!489873 res!292950) b!489871))

(assert (= (and b!489871 res!292944) b!489867))

(assert (= (and b!489867 res!292951) b!489870))

(assert (= (and b!489870 res!292949) b!489866))

(assert (= (and b!489866 res!292947) b!489868))

(assert (= (and b!489868 res!292946) b!489874))

(assert (= (and b!489874 res!292945) b!489869))

(assert (= (and b!489869 res!292948) b!489872))

(declare-fun m!469393 () Bool)

(assert (=> start!44658 m!469393))

(declare-fun m!469395 () Bool)

(assert (=> start!44658 m!469395))

(declare-fun m!469397 () Bool)

(assert (=> b!489869 m!469397))

(declare-fun m!469399 () Bool)

(assert (=> b!489869 m!469399))

(declare-fun m!469401 () Bool)

(assert (=> b!489869 m!469401))

(declare-fun m!469403 () Bool)

(assert (=> b!489869 m!469403))

(declare-fun m!469405 () Bool)

(assert (=> b!489869 m!469405))

(declare-fun m!469407 () Bool)

(assert (=> b!489869 m!469407))

(assert (=> b!489869 m!469401))

(declare-fun m!469409 () Bool)

(assert (=> b!489869 m!469409))

(assert (=> b!489869 m!469401))

(declare-fun m!469411 () Bool)

(assert (=> b!489869 m!469411))

(assert (=> b!489869 m!469403))

(declare-fun m!469413 () Bool)

(assert (=> b!489869 m!469413))

(assert (=> b!489869 m!469403))

(declare-fun m!469415 () Bool)

(assert (=> b!489867 m!469415))

(declare-fun m!469417 () Bool)

(assert (=> b!489870 m!469417))

(declare-fun m!469419 () Bool)

(assert (=> b!489874 m!469419))

(declare-fun m!469421 () Bool)

(assert (=> b!489866 m!469421))

(assert (=> b!489872 m!469403))

(assert (=> b!489872 m!469403))

(declare-fun m!469423 () Bool)

(assert (=> b!489872 m!469423))

(assert (=> b!489871 m!469403))

(assert (=> b!489871 m!469403))

(declare-fun m!469425 () Bool)

(assert (=> b!489871 m!469425))

(declare-fun m!469427 () Bool)

(assert (=> b!489868 m!469427))

(check-sat (not b!489869) (not b!489867) (not start!44658) (not b!489870) (not b!489868) (not b!489871) (not b!489866) (not b!489874) (not b!489872))
(check-sat)
