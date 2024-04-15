; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44274 () Bool)

(assert start!44274)

(declare-fun b!486729 () Bool)

(declare-fun res!290257 () Bool)

(declare-fun e!286439 () Bool)

(assert (=> b!486729 (=> (not res!290257) (not e!286439))))

(declare-datatypes ((array!31535 0))(
  ( (array!31536 (arr!15161 (Array (_ BitVec 32) (_ BitVec 64))) (size!15526 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31535)

(declare-datatypes ((List!9358 0))(
  ( (Nil!9355) (Cons!9354 (h!10210 (_ BitVec 64)) (t!15577 List!9358)) )
))
(declare-fun arrayNoDuplicates!0 (array!31535 (_ BitVec 32) List!9358) Bool)

(assert (=> b!486729 (= res!290257 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9355))))

(declare-fun b!486730 () Bool)

(declare-fun res!290261 () Bool)

(declare-fun e!286440 () Bool)

(assert (=> b!486730 (=> (not res!290261) (not e!286440))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486730 (= res!290261 (validKeyInArray!0 k0!2280))))

(declare-fun b!486731 () Bool)

(declare-fun res!290264 () Bool)

(assert (=> b!486731 (=> (not res!290264) (not e!286440))))

(declare-fun arrayContainsKey!0 (array!31535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486731 (= res!290264 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290258 () Bool)

(assert (=> start!44274 (=> (not res!290258) (not e!286440))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44274 (= res!290258 (validMask!0 mask!3524))))

(assert (=> start!44274 e!286440))

(assert (=> start!44274 true))

(declare-fun array_inv!11044 (array!31535) Bool)

(assert (=> start!44274 (array_inv!11044 a!3235)))

(declare-fun b!486732 () Bool)

(declare-fun res!290262 () Bool)

(assert (=> b!486732 (=> (not res!290262) (not e!286440))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486732 (= res!290262 (and (= (size!15526 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15526 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15526 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486733 () Bool)

(assert (=> b!486733 (= e!286439 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31535 (_ BitVec 32)) Bool)

(assert (=> b!486733 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14182 0))(
  ( (Unit!14183) )
))
(declare-fun lt!219682 () Unit!14182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14182)

(assert (=> b!486733 (= lt!219682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!486734 () Bool)

(declare-fun res!290263 () Bool)

(assert (=> b!486734 (=> (not res!290263) (not e!286440))))

(assert (=> b!486734 (= res!290263 (validKeyInArray!0 (select (arr!15161 a!3235) j!176)))))

(declare-fun b!486735 () Bool)

(assert (=> b!486735 (= e!286440 e!286439)))

(declare-fun res!290260 () Bool)

(assert (=> b!486735 (=> (not res!290260) (not e!286439))))

(declare-datatypes ((SeekEntryResult!3625 0))(
  ( (MissingZero!3625 (index!16679 (_ BitVec 32))) (Found!3625 (index!16680 (_ BitVec 32))) (Intermediate!3625 (undefined!4437 Bool) (index!16681 (_ BitVec 32)) (x!45816 (_ BitVec 32))) (Undefined!3625) (MissingVacant!3625 (index!16682 (_ BitVec 32))) )
))
(declare-fun lt!219681 () SeekEntryResult!3625)

(assert (=> b!486735 (= res!290260 (or (= lt!219681 (MissingZero!3625 i!1204)) (= lt!219681 (MissingVacant!3625 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31535 (_ BitVec 32)) SeekEntryResult!3625)

(assert (=> b!486735 (= lt!219681 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486736 () Bool)

(declare-fun res!290259 () Bool)

(assert (=> b!486736 (=> (not res!290259) (not e!286439))))

(assert (=> b!486736 (= res!290259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44274 res!290258) b!486732))

(assert (= (and b!486732 res!290262) b!486734))

(assert (= (and b!486734 res!290263) b!486730))

(assert (= (and b!486730 res!290261) b!486731))

(assert (= (and b!486731 res!290264) b!486735))

(assert (= (and b!486735 res!290260) b!486736))

(assert (= (and b!486736 res!290259) b!486729))

(assert (= (and b!486729 res!290257) b!486733))

(declare-fun m!466105 () Bool)

(assert (=> b!486729 m!466105))

(declare-fun m!466107 () Bool)

(assert (=> b!486733 m!466107))

(declare-fun m!466109 () Bool)

(assert (=> b!486733 m!466109))

(declare-fun m!466111 () Bool)

(assert (=> b!486736 m!466111))

(declare-fun m!466113 () Bool)

(assert (=> b!486734 m!466113))

(assert (=> b!486734 m!466113))

(declare-fun m!466115 () Bool)

(assert (=> b!486734 m!466115))

(declare-fun m!466117 () Bool)

(assert (=> start!44274 m!466117))

(declare-fun m!466119 () Bool)

(assert (=> start!44274 m!466119))

(declare-fun m!466121 () Bool)

(assert (=> b!486731 m!466121))

(declare-fun m!466123 () Bool)

(assert (=> b!486730 m!466123))

(declare-fun m!466125 () Bool)

(assert (=> b!486735 m!466125))

(check-sat (not b!486736) (not b!486731) (not b!486735) (not b!486729) (not b!486733) (not b!486730) (not b!486734) (not start!44274))
(check-sat)
