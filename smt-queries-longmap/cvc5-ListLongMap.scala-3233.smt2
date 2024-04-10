; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45204 () Bool)

(assert start!45204)

(declare-fun b!496189 () Bool)

(declare-fun res!298580 () Bool)

(declare-fun e!291008 () Bool)

(assert (=> b!496189 (=> (not res!298580) (not e!291008))))

(declare-datatypes ((array!32092 0))(
  ( (array!32093 (arr!15429 (Array (_ BitVec 32) (_ BitVec 64))) (size!15793 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32092)

(declare-datatypes ((List!9587 0))(
  ( (Nil!9584) (Cons!9583 (h!10454 (_ BitVec 64)) (t!15815 List!9587)) )
))
(declare-fun arrayNoDuplicates!0 (array!32092 (_ BitVec 32) List!9587) Bool)

(assert (=> b!496189 (= res!298580 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9584))))

(declare-fun b!496190 () Bool)

(declare-fun res!298579 () Bool)

(declare-fun e!291012 () Bool)

(assert (=> b!496190 (=> res!298579 e!291012)))

(declare-datatypes ((SeekEntryResult!3896 0))(
  ( (MissingZero!3896 (index!17763 (_ BitVec 32))) (Found!3896 (index!17764 (_ BitVec 32))) (Intermediate!3896 (undefined!4708 Bool) (index!17765 (_ BitVec 32)) (x!46828 (_ BitVec 32))) (Undefined!3896) (MissingVacant!3896 (index!17766 (_ BitVec 32))) )
))
(declare-fun lt!224629 () SeekEntryResult!3896)

(assert (=> b!496190 (= res!298579 (or (undefined!4708 lt!224629) (not (is-Intermediate!3896 lt!224629))))))

(declare-fun res!298583 () Bool)

(declare-fun e!291011 () Bool)

(assert (=> start!45204 (=> (not res!298583) (not e!291011))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45204 (= res!298583 (validMask!0 mask!3524))))

(assert (=> start!45204 e!291011))

(assert (=> start!45204 true))

(declare-fun array_inv!11225 (array!32092) Bool)

(assert (=> start!45204 (array_inv!11225 a!3235)))

(declare-fun b!496191 () Bool)

(assert (=> b!496191 (= e!291011 e!291008)))

(declare-fun res!298581 () Bool)

(assert (=> b!496191 (=> (not res!298581) (not e!291008))))

(declare-fun lt!224632 () SeekEntryResult!3896)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496191 (= res!298581 (or (= lt!224632 (MissingZero!3896 i!1204)) (= lt!224632 (MissingVacant!3896 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32092 (_ BitVec 32)) SeekEntryResult!3896)

(assert (=> b!496191 (= lt!224632 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!291010 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!496192 () Bool)

(assert (=> b!496192 (= e!291010 (= (seekEntryOrOpen!0 (select (arr!15429 a!3235) j!176) a!3235 mask!3524) (Found!3896 j!176)))))

(declare-fun b!496193 () Bool)

(assert (=> b!496193 (= e!291008 (not e!291012))))

(declare-fun res!298578 () Bool)

(assert (=> b!496193 (=> res!298578 e!291012)))

(declare-fun lt!224628 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32092 (_ BitVec 32)) SeekEntryResult!3896)

(assert (=> b!496193 (= res!298578 (= lt!224629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224628 (select (store (arr!15429 a!3235) i!1204 k!2280) j!176) (array!32093 (store (arr!15429 a!3235) i!1204 k!2280) (size!15793 a!3235)) mask!3524)))))

(declare-fun lt!224631 () (_ BitVec 32))

(assert (=> b!496193 (= lt!224629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224631 (select (arr!15429 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496193 (= lt!224628 (toIndex!0 (select (store (arr!15429 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496193 (= lt!224631 (toIndex!0 (select (arr!15429 a!3235) j!176) mask!3524))))

(assert (=> b!496193 e!291010))

(declare-fun res!298577 () Bool)

(assert (=> b!496193 (=> (not res!298577) (not e!291010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32092 (_ BitVec 32)) Bool)

(assert (=> b!496193 (= res!298577 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14738 0))(
  ( (Unit!14739) )
))
(declare-fun lt!224630 () Unit!14738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14738)

(assert (=> b!496193 (= lt!224630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496194 () Bool)

(declare-fun res!298584 () Bool)

(assert (=> b!496194 (=> (not res!298584) (not e!291011))))

(declare-fun arrayContainsKey!0 (array!32092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496194 (= res!298584 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496195 () Bool)

(declare-fun res!298582 () Bool)

(assert (=> b!496195 (=> (not res!298582) (not e!291011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496195 (= res!298582 (validKeyInArray!0 k!2280))))

(declare-fun b!496196 () Bool)

(assert (=> b!496196 (= e!291012 true)))

(assert (=> b!496196 (and (bvslt (x!46828 lt!224629) #b01111111111111111111111111111110) (or (= (select (arr!15429 a!3235) (index!17765 lt!224629)) (select (arr!15429 a!3235) j!176)) (= (select (arr!15429 a!3235) (index!17765 lt!224629)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15429 a!3235) (index!17765 lt!224629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496197 () Bool)

(declare-fun res!298576 () Bool)

(assert (=> b!496197 (=> (not res!298576) (not e!291008))))

(assert (=> b!496197 (= res!298576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496198 () Bool)

(declare-fun res!298586 () Bool)

(assert (=> b!496198 (=> (not res!298586) (not e!291011))))

(assert (=> b!496198 (= res!298586 (and (= (size!15793 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15793 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15793 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496199 () Bool)

(declare-fun res!298585 () Bool)

(assert (=> b!496199 (=> (not res!298585) (not e!291011))))

(assert (=> b!496199 (= res!298585 (validKeyInArray!0 (select (arr!15429 a!3235) j!176)))))

(assert (= (and start!45204 res!298583) b!496198))

(assert (= (and b!496198 res!298586) b!496199))

(assert (= (and b!496199 res!298585) b!496195))

(assert (= (and b!496195 res!298582) b!496194))

(assert (= (and b!496194 res!298584) b!496191))

(assert (= (and b!496191 res!298581) b!496197))

(assert (= (and b!496197 res!298576) b!496189))

(assert (= (and b!496189 res!298580) b!496193))

(assert (= (and b!496193 res!298577) b!496192))

(assert (= (and b!496193 (not res!298578)) b!496190))

(assert (= (and b!496190 (not res!298579)) b!496196))

(declare-fun m!477387 () Bool)

(assert (=> b!496191 m!477387))

(declare-fun m!477389 () Bool)

(assert (=> b!496192 m!477389))

(assert (=> b!496192 m!477389))

(declare-fun m!477391 () Bool)

(assert (=> b!496192 m!477391))

(declare-fun m!477393 () Bool)

(assert (=> b!496189 m!477393))

(declare-fun m!477395 () Bool)

(assert (=> b!496195 m!477395))

(declare-fun m!477397 () Bool)

(assert (=> b!496196 m!477397))

(assert (=> b!496196 m!477389))

(declare-fun m!477399 () Bool)

(assert (=> start!45204 m!477399))

(declare-fun m!477401 () Bool)

(assert (=> start!45204 m!477401))

(declare-fun m!477403 () Bool)

(assert (=> b!496193 m!477403))

(declare-fun m!477405 () Bool)

(assert (=> b!496193 m!477405))

(declare-fun m!477407 () Bool)

(assert (=> b!496193 m!477407))

(assert (=> b!496193 m!477389))

(declare-fun m!477409 () Bool)

(assert (=> b!496193 m!477409))

(assert (=> b!496193 m!477407))

(declare-fun m!477411 () Bool)

(assert (=> b!496193 m!477411))

(assert (=> b!496193 m!477389))

(declare-fun m!477413 () Bool)

(assert (=> b!496193 m!477413))

(assert (=> b!496193 m!477407))

(declare-fun m!477415 () Bool)

(assert (=> b!496193 m!477415))

(assert (=> b!496193 m!477389))

(declare-fun m!477417 () Bool)

(assert (=> b!496193 m!477417))

(declare-fun m!477419 () Bool)

(assert (=> b!496197 m!477419))

(assert (=> b!496199 m!477389))

(assert (=> b!496199 m!477389))

(declare-fun m!477421 () Bool)

(assert (=> b!496199 m!477421))

(declare-fun m!477423 () Bool)

(assert (=> b!496194 m!477423))

(push 1)

