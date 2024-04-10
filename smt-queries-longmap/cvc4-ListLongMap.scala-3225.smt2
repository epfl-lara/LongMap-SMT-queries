; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45160 () Bool)

(assert start!45160)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32048 0))(
  ( (array!32049 (arr!15407 (Array (_ BitVec 32) (_ BitVec 64))) (size!15771 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32048)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!495463 () Bool)

(declare-fun e!290679 () Bool)

(declare-datatypes ((SeekEntryResult!3874 0))(
  ( (MissingZero!3874 (index!17675 (_ BitVec 32))) (Found!3874 (index!17676 (_ BitVec 32))) (Intermediate!3874 (undefined!4686 Bool) (index!17677 (_ BitVec 32)) (x!46742 (_ BitVec 32))) (Undefined!3874) (MissingVacant!3874 (index!17678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32048 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!495463 (= e!290679 (= (seekEntryOrOpen!0 (select (arr!15407 a!3235) j!176) a!3235 mask!3524) (Found!3874 j!176)))))

(declare-fun b!495464 () Bool)

(declare-fun res!297856 () Bool)

(declare-fun e!290678 () Bool)

(assert (=> b!495464 (=> (not res!297856) (not e!290678))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495464 (= res!297856 (validKeyInArray!0 k!2280))))

(declare-fun b!495465 () Bool)

(declare-fun res!297857 () Bool)

(declare-fun e!290682 () Bool)

(assert (=> b!495465 (=> res!297857 e!290682)))

(declare-fun lt!224302 () SeekEntryResult!3874)

(assert (=> b!495465 (= res!297857 (or (undefined!4686 lt!224302) (not (is-Intermediate!3874 lt!224302))))))

(declare-fun b!495466 () Bool)

(declare-fun res!297850 () Bool)

(declare-fun e!290681 () Bool)

(assert (=> b!495466 (=> (not res!297850) (not e!290681))))

(declare-datatypes ((List!9565 0))(
  ( (Nil!9562) (Cons!9561 (h!10432 (_ BitVec 64)) (t!15793 List!9565)) )
))
(declare-fun arrayNoDuplicates!0 (array!32048 (_ BitVec 32) List!9565) Bool)

(assert (=> b!495466 (= res!297850 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9562))))

(declare-fun b!495467 () Bool)

(assert (=> b!495467 (= e!290681 (not e!290682))))

(declare-fun res!297851 () Bool)

(assert (=> b!495467 (=> res!297851 e!290682)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224298 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32048 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!495467 (= res!297851 (= lt!224302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224298 (select (store (arr!15407 a!3235) i!1204 k!2280) j!176) (array!32049 (store (arr!15407 a!3235) i!1204 k!2280) (size!15771 a!3235)) mask!3524)))))

(declare-fun lt!224299 () (_ BitVec 32))

(assert (=> b!495467 (= lt!224302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224299 (select (arr!15407 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495467 (= lt!224298 (toIndex!0 (select (store (arr!15407 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495467 (= lt!224299 (toIndex!0 (select (arr!15407 a!3235) j!176) mask!3524))))

(assert (=> b!495467 e!290679))

(declare-fun res!297854 () Bool)

(assert (=> b!495467 (=> (not res!297854) (not e!290679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32048 (_ BitVec 32)) Bool)

(assert (=> b!495467 (= res!297854 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14694 0))(
  ( (Unit!14695) )
))
(declare-fun lt!224301 () Unit!14694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14694)

(assert (=> b!495467 (= lt!224301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495468 () Bool)

(declare-fun res!297852 () Bool)

(assert (=> b!495468 (=> (not res!297852) (not e!290678))))

(assert (=> b!495468 (= res!297852 (and (= (size!15771 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15771 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15771 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495469 () Bool)

(assert (=> b!495469 (= e!290678 e!290681)))

(declare-fun res!297860 () Bool)

(assert (=> b!495469 (=> (not res!297860) (not e!290681))))

(declare-fun lt!224300 () SeekEntryResult!3874)

(assert (=> b!495469 (= res!297860 (or (= lt!224300 (MissingZero!3874 i!1204)) (= lt!224300 (MissingVacant!3874 i!1204))))))

(assert (=> b!495469 (= lt!224300 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495470 () Bool)

(declare-fun res!297859 () Bool)

(assert (=> b!495470 (=> (not res!297859) (not e!290681))))

(assert (=> b!495470 (= res!297859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!297858 () Bool)

(assert (=> start!45160 (=> (not res!297858) (not e!290678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45160 (= res!297858 (validMask!0 mask!3524))))

(assert (=> start!45160 e!290678))

(assert (=> start!45160 true))

(declare-fun array_inv!11203 (array!32048) Bool)

(assert (=> start!45160 (array_inv!11203 a!3235)))

(declare-fun b!495471 () Bool)

(assert (=> b!495471 (= e!290682 true)))

(assert (=> b!495471 (and (bvslt (x!46742 lt!224302) #b01111111111111111111111111111110) (or (= (select (arr!15407 a!3235) (index!17677 lt!224302)) (select (arr!15407 a!3235) j!176)) (= (select (arr!15407 a!3235) (index!17677 lt!224302)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15407 a!3235) (index!17677 lt!224302)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495472 () Bool)

(declare-fun res!297853 () Bool)

(assert (=> b!495472 (=> (not res!297853) (not e!290678))))

(declare-fun arrayContainsKey!0 (array!32048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495472 (= res!297853 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495473 () Bool)

(declare-fun res!297855 () Bool)

(assert (=> b!495473 (=> (not res!297855) (not e!290678))))

(assert (=> b!495473 (= res!297855 (validKeyInArray!0 (select (arr!15407 a!3235) j!176)))))

(assert (= (and start!45160 res!297858) b!495468))

(assert (= (and b!495468 res!297852) b!495473))

(assert (= (and b!495473 res!297855) b!495464))

(assert (= (and b!495464 res!297856) b!495472))

(assert (= (and b!495472 res!297853) b!495469))

(assert (= (and b!495469 res!297860) b!495470))

(assert (= (and b!495470 res!297859) b!495466))

(assert (= (and b!495466 res!297850) b!495467))

(assert (= (and b!495467 res!297854) b!495463))

(assert (= (and b!495467 (not res!297851)) b!495465))

(assert (= (and b!495465 (not res!297857)) b!495471))

(declare-fun m!476551 () Bool)

(assert (=> b!495466 m!476551))

(declare-fun m!476553 () Bool)

(assert (=> b!495464 m!476553))

(declare-fun m!476555 () Bool)

(assert (=> b!495463 m!476555))

(assert (=> b!495463 m!476555))

(declare-fun m!476557 () Bool)

(assert (=> b!495463 m!476557))

(declare-fun m!476559 () Bool)

(assert (=> b!495472 m!476559))

(declare-fun m!476561 () Bool)

(assert (=> b!495467 m!476561))

(declare-fun m!476563 () Bool)

(assert (=> b!495467 m!476563))

(declare-fun m!476565 () Bool)

(assert (=> b!495467 m!476565))

(assert (=> b!495467 m!476555))

(declare-fun m!476567 () Bool)

(assert (=> b!495467 m!476567))

(assert (=> b!495467 m!476555))

(declare-fun m!476569 () Bool)

(assert (=> b!495467 m!476569))

(assert (=> b!495467 m!476555))

(assert (=> b!495467 m!476565))

(declare-fun m!476571 () Bool)

(assert (=> b!495467 m!476571))

(declare-fun m!476573 () Bool)

(assert (=> b!495467 m!476573))

(assert (=> b!495467 m!476565))

(declare-fun m!476575 () Bool)

(assert (=> b!495467 m!476575))

(declare-fun m!476577 () Bool)

(assert (=> b!495469 m!476577))

(declare-fun m!476579 () Bool)

(assert (=> b!495470 m!476579))

(assert (=> b!495473 m!476555))

(assert (=> b!495473 m!476555))

(declare-fun m!476581 () Bool)

(assert (=> b!495473 m!476581))

(declare-fun m!476583 () Bool)

(assert (=> start!45160 m!476583))

(declare-fun m!476585 () Bool)

(assert (=> start!45160 m!476585))

(declare-fun m!476587 () Bool)

(assert (=> b!495471 m!476587))

(assert (=> b!495471 m!476555))

(push 1)

