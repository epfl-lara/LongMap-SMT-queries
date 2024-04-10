; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44960 () Bool)

(assert start!44960)

(declare-fun b!493068 () Bool)

(declare-fun res!295638 () Bool)

(declare-fun e!289617 () Bool)

(assert (=> b!493068 (=> (not res!295638) (not e!289617))))

(declare-datatypes ((array!31905 0))(
  ( (array!31906 (arr!15337 (Array (_ BitVec 32) (_ BitVec 64))) (size!15701 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31905)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493068 (= res!295638 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295644 () Bool)

(assert (=> start!44960 (=> (not res!295644) (not e!289617))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44960 (= res!295644 (validMask!0 mask!3524))))

(assert (=> start!44960 e!289617))

(assert (=> start!44960 true))

(declare-fun array_inv!11133 (array!31905) Bool)

(assert (=> start!44960 (array_inv!11133 a!3235)))

(declare-fun b!493069 () Bool)

(declare-fun res!295641 () Bool)

(assert (=> b!493069 (=> (not res!295641) (not e!289617))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493069 (= res!295641 (validKeyInArray!0 (select (arr!15337 a!3235) j!176)))))

(declare-fun b!493070 () Bool)

(declare-fun res!295645 () Bool)

(assert (=> b!493070 (=> (not res!295645) (not e!289617))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493070 (= res!295645 (and (= (size!15701 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15701 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15701 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493071 () Bool)

(declare-fun res!295639 () Bool)

(assert (=> b!493071 (=> (not res!295639) (not e!289617))))

(assert (=> b!493071 (= res!295639 (validKeyInArray!0 k0!2280))))

(declare-fun b!493072 () Bool)

(declare-fun e!289619 () Bool)

(declare-datatypes ((SeekEntryResult!3804 0))(
  ( (MissingZero!3804 (index!17395 (_ BitVec 32))) (Found!3804 (index!17396 (_ BitVec 32))) (Intermediate!3804 (undefined!4616 Bool) (index!17397 (_ BitVec 32)) (x!46482 (_ BitVec 32))) (Undefined!3804) (MissingVacant!3804 (index!17398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31905 (_ BitVec 32)) SeekEntryResult!3804)

(assert (=> b!493072 (= e!289619 (= (seekEntryOrOpen!0 (select (arr!15337 a!3235) j!176) a!3235 mask!3524) (Found!3804 j!176)))))

(declare-fun b!493073 () Bool)

(declare-fun res!295646 () Bool)

(declare-fun e!289620 () Bool)

(assert (=> b!493073 (=> (not res!295646) (not e!289620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31905 (_ BitVec 32)) Bool)

(assert (=> b!493073 (= res!295646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493074 () Bool)

(assert (=> b!493074 (= e!289620 (not true))))

(declare-fun lt!222949 () (_ BitVec 32))

(declare-fun lt!222946 () SeekEntryResult!3804)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31905 (_ BitVec 32)) SeekEntryResult!3804)

(assert (=> b!493074 (= lt!222946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222949 (select (store (arr!15337 a!3235) i!1204 k0!2280) j!176) (array!31906 (store (arr!15337 a!3235) i!1204 k0!2280) (size!15701 a!3235)) mask!3524))))

(declare-fun lt!222947 () SeekEntryResult!3804)

(declare-fun lt!222945 () (_ BitVec 32))

(assert (=> b!493074 (= lt!222947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222945 (select (arr!15337 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493074 (= lt!222949 (toIndex!0 (select (store (arr!15337 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493074 (= lt!222945 (toIndex!0 (select (arr!15337 a!3235) j!176) mask!3524))))

(assert (=> b!493074 e!289619))

(declare-fun res!295642 () Bool)

(assert (=> b!493074 (=> (not res!295642) (not e!289619))))

(assert (=> b!493074 (= res!295642 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14554 0))(
  ( (Unit!14555) )
))
(declare-fun lt!222944 () Unit!14554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14554)

(assert (=> b!493074 (= lt!222944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493075 () Bool)

(declare-fun res!295640 () Bool)

(assert (=> b!493075 (=> (not res!295640) (not e!289620))))

(declare-datatypes ((List!9495 0))(
  ( (Nil!9492) (Cons!9491 (h!10359 (_ BitVec 64)) (t!15723 List!9495)) )
))
(declare-fun arrayNoDuplicates!0 (array!31905 (_ BitVec 32) List!9495) Bool)

(assert (=> b!493075 (= res!295640 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9492))))

(declare-fun b!493076 () Bool)

(assert (=> b!493076 (= e!289617 e!289620)))

(declare-fun res!295643 () Bool)

(assert (=> b!493076 (=> (not res!295643) (not e!289620))))

(declare-fun lt!222948 () SeekEntryResult!3804)

(assert (=> b!493076 (= res!295643 (or (= lt!222948 (MissingZero!3804 i!1204)) (= lt!222948 (MissingVacant!3804 i!1204))))))

(assert (=> b!493076 (= lt!222948 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44960 res!295644) b!493070))

(assert (= (and b!493070 res!295645) b!493069))

(assert (= (and b!493069 res!295641) b!493071))

(assert (= (and b!493071 res!295639) b!493068))

(assert (= (and b!493068 res!295638) b!493076))

(assert (= (and b!493076 res!295643) b!493073))

(assert (= (and b!493073 res!295646) b!493075))

(assert (= (and b!493075 res!295640) b!493074))

(assert (= (and b!493074 res!295642) b!493072))

(declare-fun m!473811 () Bool)

(assert (=> b!493069 m!473811))

(assert (=> b!493069 m!473811))

(declare-fun m!473813 () Bool)

(assert (=> b!493069 m!473813))

(declare-fun m!473815 () Bool)

(assert (=> b!493075 m!473815))

(declare-fun m!473817 () Bool)

(assert (=> b!493076 m!473817))

(declare-fun m!473819 () Bool)

(assert (=> start!44960 m!473819))

(declare-fun m!473821 () Bool)

(assert (=> start!44960 m!473821))

(assert (=> b!493072 m!473811))

(assert (=> b!493072 m!473811))

(declare-fun m!473823 () Bool)

(assert (=> b!493072 m!473823))

(declare-fun m!473825 () Bool)

(assert (=> b!493074 m!473825))

(declare-fun m!473827 () Bool)

(assert (=> b!493074 m!473827))

(declare-fun m!473829 () Bool)

(assert (=> b!493074 m!473829))

(assert (=> b!493074 m!473829))

(declare-fun m!473831 () Bool)

(assert (=> b!493074 m!473831))

(assert (=> b!493074 m!473811))

(declare-fun m!473833 () Bool)

(assert (=> b!493074 m!473833))

(assert (=> b!493074 m!473811))

(declare-fun m!473835 () Bool)

(assert (=> b!493074 m!473835))

(assert (=> b!493074 m!473829))

(declare-fun m!473837 () Bool)

(assert (=> b!493074 m!473837))

(assert (=> b!493074 m!473811))

(declare-fun m!473839 () Bool)

(assert (=> b!493074 m!473839))

(declare-fun m!473841 () Bool)

(assert (=> b!493071 m!473841))

(declare-fun m!473843 () Bool)

(assert (=> b!493073 m!473843))

(declare-fun m!473845 () Bool)

(assert (=> b!493068 m!473845))

(check-sat (not b!493074) (not start!44960) (not b!493068) (not b!493075) (not b!493069) (not b!493073) (not b!493076) (not b!493071) (not b!493072))
(check-sat)
