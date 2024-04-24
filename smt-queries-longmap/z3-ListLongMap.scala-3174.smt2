; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44660 () Bool)

(assert start!44660)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31720 0))(
  ( (array!31721 (arr!15247 (Array (_ BitVec 32) (_ BitVec 64))) (size!15611 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31720)

(declare-fun b!490076 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!288134 () Bool)

(declare-datatypes ((SeekEntryResult!3670 0))(
  ( (MissingZero!3670 (index!16859 (_ BitVec 32))) (Found!3670 (index!16860 (_ BitVec 32))) (Intermediate!3670 (undefined!4482 Bool) (index!16861 (_ BitVec 32)) (x!46109 (_ BitVec 32))) (Undefined!3670) (MissingVacant!3670 (index!16862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31720 (_ BitVec 32)) SeekEntryResult!3670)

(assert (=> b!490076 (= e!288134 (= (seekEntryOrOpen!0 (select (arr!15247 a!3235) j!176) a!3235 mask!3524) (Found!3670 j!176)))))

(declare-fun b!490077 () Bool)

(declare-fun res!293069 () Bool)

(declare-fun e!288135 () Bool)

(assert (=> b!490077 (=> (not res!293069) (not e!288135))))

(declare-datatypes ((List!9312 0))(
  ( (Nil!9309) (Cons!9308 (h!10170 (_ BitVec 64)) (t!15532 List!9312)) )
))
(declare-fun arrayNoDuplicates!0 (array!31720 (_ BitVec 32) List!9312) Bool)

(assert (=> b!490077 (= res!293069 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9309))))

(declare-fun res!293074 () Bool)

(declare-fun e!288133 () Bool)

(assert (=> start!44660 (=> (not res!293074) (not e!288133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44660 (= res!293074 (validMask!0 mask!3524))))

(assert (=> start!44660 e!288133))

(assert (=> start!44660 true))

(declare-fun array_inv!11106 (array!31720) Bool)

(assert (=> start!44660 (array_inv!11106 a!3235)))

(declare-fun b!490078 () Bool)

(assert (=> b!490078 (= e!288135 (not true))))

(declare-fun lt!221307 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221305 () SeekEntryResult!3670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31720 (_ BitVec 32)) SeekEntryResult!3670)

(assert (=> b!490078 (= lt!221305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221307 (select (store (arr!15247 a!3235) i!1204 k0!2280) j!176) (array!31721 (store (arr!15247 a!3235) i!1204 k0!2280) (size!15611 a!3235)) mask!3524))))

(declare-fun lt!221303 () (_ BitVec 32))

(declare-fun lt!221308 () SeekEntryResult!3670)

(assert (=> b!490078 (= lt!221308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221303 (select (arr!15247 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490078 (= lt!221307 (toIndex!0 (select (store (arr!15247 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490078 (= lt!221303 (toIndex!0 (select (arr!15247 a!3235) j!176) mask!3524))))

(assert (=> b!490078 e!288134))

(declare-fun res!293068 () Bool)

(assert (=> b!490078 (=> (not res!293068) (not e!288134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31720 (_ BitVec 32)) Bool)

(assert (=> b!490078 (= res!293068 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14347 0))(
  ( (Unit!14348) )
))
(declare-fun lt!221306 () Unit!14347)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14347)

(assert (=> b!490078 (= lt!221306 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490079 () Bool)

(declare-fun res!293073 () Bool)

(assert (=> b!490079 (=> (not res!293073) (not e!288133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490079 (= res!293073 (validKeyInArray!0 k0!2280))))

(declare-fun b!490080 () Bool)

(declare-fun res!293072 () Bool)

(assert (=> b!490080 (=> (not res!293072) (not e!288133))))

(assert (=> b!490080 (= res!293072 (and (= (size!15611 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15611 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15611 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490081 () Bool)

(declare-fun res!293066 () Bool)

(assert (=> b!490081 (=> (not res!293066) (not e!288133))))

(assert (=> b!490081 (= res!293066 (validKeyInArray!0 (select (arr!15247 a!3235) j!176)))))

(declare-fun b!490082 () Bool)

(assert (=> b!490082 (= e!288133 e!288135)))

(declare-fun res!293070 () Bool)

(assert (=> b!490082 (=> (not res!293070) (not e!288135))))

(declare-fun lt!221304 () SeekEntryResult!3670)

(assert (=> b!490082 (= res!293070 (or (= lt!221304 (MissingZero!3670 i!1204)) (= lt!221304 (MissingVacant!3670 i!1204))))))

(assert (=> b!490082 (= lt!221304 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490083 () Bool)

(declare-fun res!293067 () Bool)

(assert (=> b!490083 (=> (not res!293067) (not e!288133))))

(declare-fun arrayContainsKey!0 (array!31720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490083 (= res!293067 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490084 () Bool)

(declare-fun res!293071 () Bool)

(assert (=> b!490084 (=> (not res!293071) (not e!288135))))

(assert (=> b!490084 (= res!293071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44660 res!293074) b!490080))

(assert (= (and b!490080 res!293072) b!490081))

(assert (= (and b!490081 res!293066) b!490079))

(assert (= (and b!490079 res!293073) b!490083))

(assert (= (and b!490083 res!293067) b!490082))

(assert (= (and b!490082 res!293070) b!490084))

(assert (= (and b!490084 res!293071) b!490077))

(assert (= (and b!490077 res!293069) b!490078))

(assert (= (and b!490078 res!293068) b!490076))

(declare-fun m!470329 () Bool)

(assert (=> b!490076 m!470329))

(assert (=> b!490076 m!470329))

(declare-fun m!470331 () Bool)

(assert (=> b!490076 m!470331))

(declare-fun m!470333 () Bool)

(assert (=> b!490078 m!470333))

(declare-fun m!470335 () Bool)

(assert (=> b!490078 m!470335))

(declare-fun m!470337 () Bool)

(assert (=> b!490078 m!470337))

(assert (=> b!490078 m!470337))

(declare-fun m!470339 () Bool)

(assert (=> b!490078 m!470339))

(assert (=> b!490078 m!470329))

(declare-fun m!470341 () Bool)

(assert (=> b!490078 m!470341))

(assert (=> b!490078 m!470337))

(declare-fun m!470343 () Bool)

(assert (=> b!490078 m!470343))

(assert (=> b!490078 m!470329))

(declare-fun m!470345 () Bool)

(assert (=> b!490078 m!470345))

(assert (=> b!490078 m!470329))

(declare-fun m!470347 () Bool)

(assert (=> b!490078 m!470347))

(declare-fun m!470349 () Bool)

(assert (=> b!490079 m!470349))

(declare-fun m!470351 () Bool)

(assert (=> start!44660 m!470351))

(declare-fun m!470353 () Bool)

(assert (=> start!44660 m!470353))

(declare-fun m!470355 () Bool)

(assert (=> b!490082 m!470355))

(assert (=> b!490081 m!470329))

(assert (=> b!490081 m!470329))

(declare-fun m!470357 () Bool)

(assert (=> b!490081 m!470357))

(declare-fun m!470359 () Bool)

(assert (=> b!490083 m!470359))

(declare-fun m!470361 () Bool)

(assert (=> b!490084 m!470361))

(declare-fun m!470363 () Bool)

(assert (=> b!490077 m!470363))

(check-sat (not b!490084) (not b!490083) (not b!490077) (not b!490078) (not b!490076) (not b!490079) (not b!490081) (not b!490082) (not start!44660))
(check-sat)
