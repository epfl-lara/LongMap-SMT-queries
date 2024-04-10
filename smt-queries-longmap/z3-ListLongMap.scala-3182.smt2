; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44720 () Bool)

(assert start!44720)

(declare-fun b!490812 () Bool)

(declare-fun res!293750 () Bool)

(declare-fun e!288473 () Bool)

(assert (=> b!490812 (=> (not res!293750) (not e!288473))))

(declare-datatypes ((array!31779 0))(
  ( (array!31780 (arr!15277 (Array (_ BitVec 32) (_ BitVec 64))) (size!15641 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31779)

(declare-datatypes ((List!9435 0))(
  ( (Nil!9432) (Cons!9431 (h!10293 (_ BitVec 64)) (t!15663 List!9435)) )
))
(declare-fun arrayNoDuplicates!0 (array!31779 (_ BitVec 32) List!9435) Bool)

(assert (=> b!490812 (= res!293750 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9432))))

(declare-fun b!490813 () Bool)

(declare-fun res!293753 () Bool)

(declare-fun e!288471 () Bool)

(assert (=> b!490813 (=> (not res!293753) (not e!288471))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490813 (= res!293753 (and (= (size!15641 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15641 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15641 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490814 () Bool)

(declare-fun res!293752 () Bool)

(assert (=> b!490814 (=> (not res!293752) (not e!288471))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490814 (= res!293752 (validKeyInArray!0 k0!2280))))

(declare-fun res!293749 () Bool)

(assert (=> start!44720 (=> (not res!293749) (not e!288471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44720 (= res!293749 (validMask!0 mask!3524))))

(assert (=> start!44720 e!288471))

(assert (=> start!44720 true))

(declare-fun array_inv!11073 (array!31779) Bool)

(assert (=> start!44720 (array_inv!11073 a!3235)))

(declare-fun b!490815 () Bool)

(declare-fun res!293754 () Bool)

(assert (=> b!490815 (=> (not res!293754) (not e!288473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31779 (_ BitVec 32)) Bool)

(assert (=> b!490815 (= res!293754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490816 () Bool)

(assert (=> b!490816 (= e!288471 e!288473)))

(declare-fun res!293751 () Bool)

(assert (=> b!490816 (=> (not res!293751) (not e!288473))))

(declare-datatypes ((SeekEntryResult!3744 0))(
  ( (MissingZero!3744 (index!17155 (_ BitVec 32))) (Found!3744 (index!17156 (_ BitVec 32))) (Intermediate!3744 (undefined!4556 Bool) (index!17157 (_ BitVec 32)) (x!46250 (_ BitVec 32))) (Undefined!3744) (MissingVacant!3744 (index!17158 (_ BitVec 32))) )
))
(declare-fun lt!221746 () SeekEntryResult!3744)

(assert (=> b!490816 (= res!293751 (or (= lt!221746 (MissingZero!3744 i!1204)) (= lt!221746 (MissingVacant!3744 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31779 (_ BitVec 32)) SeekEntryResult!3744)

(assert (=> b!490816 (= lt!221746 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490817 () Bool)

(declare-fun res!293748 () Bool)

(assert (=> b!490817 (=> (not res!293748) (not e!288471))))

(declare-fun arrayContainsKey!0 (array!31779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490817 (= res!293748 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490818 () Bool)

(declare-fun res!293755 () Bool)

(assert (=> b!490818 (=> (not res!293755) (not e!288471))))

(assert (=> b!490818 (= res!293755 (validKeyInArray!0 (select (arr!15277 a!3235) j!176)))))

(declare-fun b!490819 () Bool)

(declare-fun e!288474 () Bool)

(assert (=> b!490819 (= e!288473 (not e!288474))))

(declare-fun res!293756 () Bool)

(assert (=> b!490819 (=> res!293756 e!288474)))

(declare-fun lt!221743 () (_ BitVec 64))

(declare-fun lt!221744 () array!31779)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31779 (_ BitVec 32)) SeekEntryResult!3744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490819 (= res!293756 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15277 a!3235) j!176) mask!3524) (select (arr!15277 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221743 mask!3524) lt!221743 lt!221744 mask!3524))))))

(assert (=> b!490819 (= lt!221743 (select (store (arr!15277 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490819 (= lt!221744 (array!31780 (store (arr!15277 a!3235) i!1204 k0!2280) (size!15641 a!3235)))))

(declare-fun lt!221745 () SeekEntryResult!3744)

(assert (=> b!490819 (= lt!221745 (Found!3744 j!176))))

(assert (=> b!490819 (= lt!221745 (seekEntryOrOpen!0 (select (arr!15277 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14434 0))(
  ( (Unit!14435) )
))
(declare-fun lt!221742 () Unit!14434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14434)

(assert (=> b!490819 (= lt!221742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490820 () Bool)

(assert (=> b!490820 (= e!288474 true)))

(assert (=> b!490820 (= lt!221745 (seekEntryOrOpen!0 lt!221743 lt!221744 mask!3524))))

(declare-fun lt!221741 () Unit!14434)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14434)

(assert (=> b!490820 (= lt!221741 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44720 res!293749) b!490813))

(assert (= (and b!490813 res!293753) b!490818))

(assert (= (and b!490818 res!293755) b!490814))

(assert (= (and b!490814 res!293752) b!490817))

(assert (= (and b!490817 res!293748) b!490816))

(assert (= (and b!490816 res!293751) b!490815))

(assert (= (and b!490815 res!293754) b!490812))

(assert (= (and b!490812 res!293750) b!490819))

(assert (= (and b!490819 (not res!293756)) b!490820))

(declare-fun m!471097 () Bool)

(assert (=> b!490820 m!471097))

(declare-fun m!471099 () Bool)

(assert (=> b!490820 m!471099))

(declare-fun m!471101 () Bool)

(assert (=> b!490816 m!471101))

(declare-fun m!471103 () Bool)

(assert (=> b!490815 m!471103))

(declare-fun m!471105 () Bool)

(assert (=> b!490818 m!471105))

(assert (=> b!490818 m!471105))

(declare-fun m!471107 () Bool)

(assert (=> b!490818 m!471107))

(declare-fun m!471109 () Bool)

(assert (=> b!490814 m!471109))

(declare-fun m!471111 () Bool)

(assert (=> b!490817 m!471111))

(declare-fun m!471113 () Bool)

(assert (=> b!490812 m!471113))

(declare-fun m!471115 () Bool)

(assert (=> start!44720 m!471115))

(declare-fun m!471117 () Bool)

(assert (=> start!44720 m!471117))

(declare-fun m!471119 () Bool)

(assert (=> b!490819 m!471119))

(declare-fun m!471121 () Bool)

(assert (=> b!490819 m!471121))

(declare-fun m!471123 () Bool)

(assert (=> b!490819 m!471123))

(assert (=> b!490819 m!471105))

(declare-fun m!471125 () Bool)

(assert (=> b!490819 m!471125))

(assert (=> b!490819 m!471105))

(assert (=> b!490819 m!471123))

(declare-fun m!471127 () Bool)

(assert (=> b!490819 m!471127))

(declare-fun m!471129 () Bool)

(assert (=> b!490819 m!471129))

(assert (=> b!490819 m!471105))

(declare-fun m!471131 () Bool)

(assert (=> b!490819 m!471131))

(assert (=> b!490819 m!471105))

(declare-fun m!471133 () Bool)

(assert (=> b!490819 m!471133))

(assert (=> b!490819 m!471127))

(declare-fun m!471135 () Bool)

(assert (=> b!490819 m!471135))

(check-sat (not b!490818) (not b!490812) (not b!490820) (not b!490816) (not b!490815) (not b!490819) (not b!490814) (not start!44720) (not b!490817))
(check-sat)
