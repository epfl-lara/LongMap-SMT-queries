; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45206 () Bool)

(assert start!45206)

(declare-fun b!496326 () Bool)

(declare-fun e!291063 () Bool)

(declare-fun e!291059 () Bool)

(assert (=> b!496326 (= e!291063 e!291059)))

(declare-fun res!298776 () Bool)

(assert (=> b!496326 (=> (not res!298776) (not e!291059))))

(declare-datatypes ((SeekEntryResult!3853 0))(
  ( (MissingZero!3853 (index!17591 (_ BitVec 32))) (Found!3853 (index!17592 (_ BitVec 32))) (Intermediate!3853 (undefined!4665 Bool) (index!17593 (_ BitVec 32)) (x!46798 (_ BitVec 32))) (Undefined!3853) (MissingVacant!3853 (index!17594 (_ BitVec 32))) )
))
(declare-fun lt!224730 () SeekEntryResult!3853)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496326 (= res!298776 (or (= lt!224730 (MissingZero!3853 i!1204)) (= lt!224730 (MissingVacant!3853 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32095 0))(
  ( (array!32096 (arr!15430 (Array (_ BitVec 32) (_ BitVec 64))) (size!15794 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32095)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32095 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!496326 (= lt!224730 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496327 () Bool)

(declare-fun res!298771 () Bool)

(declare-fun e!291060 () Bool)

(assert (=> b!496327 (=> res!298771 e!291060)))

(declare-fun lt!224732 () SeekEntryResult!3853)

(get-info :version)

(assert (=> b!496327 (= res!298771 (or (undefined!4665 lt!224732) (not ((_ is Intermediate!3853) lt!224732))))))

(declare-fun b!496328 () Bool)

(declare-fun res!298767 () Bool)

(assert (=> b!496328 (=> (not res!298767) (not e!291063))))

(declare-fun arrayContainsKey!0 (array!32095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496328 (= res!298767 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496329 () Bool)

(declare-fun res!298770 () Bool)

(assert (=> b!496329 (=> (not res!298770) (not e!291059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32095 (_ BitVec 32)) Bool)

(assert (=> b!496329 (= res!298770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496330 () Bool)

(declare-fun res!298774 () Bool)

(assert (=> b!496330 (=> (not res!298774) (not e!291059))))

(declare-datatypes ((List!9495 0))(
  ( (Nil!9492) (Cons!9491 (h!10362 (_ BitVec 64)) (t!15715 List!9495)) )
))
(declare-fun arrayNoDuplicates!0 (array!32095 (_ BitVec 32) List!9495) Bool)

(assert (=> b!496330 (= res!298774 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9492))))

(declare-fun res!298768 () Bool)

(assert (=> start!45206 (=> (not res!298768) (not e!291063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45206 (= res!298768 (validMask!0 mask!3524))))

(assert (=> start!45206 e!291063))

(assert (=> start!45206 true))

(declare-fun array_inv!11289 (array!32095) Bool)

(assert (=> start!45206 (array_inv!11289 a!3235)))

(declare-fun b!496331 () Bool)

(assert (=> b!496331 (= e!291059 (not e!291060))))

(declare-fun res!298777 () Bool)

(assert (=> b!496331 (=> res!298777 e!291060)))

(declare-fun lt!224733 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32095 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!496331 (= res!298777 (= lt!224732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224733 (select (store (arr!15430 a!3235) i!1204 k0!2280) j!176) (array!32096 (store (arr!15430 a!3235) i!1204 k0!2280) (size!15794 a!3235)) mask!3524)))))

(declare-fun lt!224731 () (_ BitVec 32))

(assert (=> b!496331 (= lt!224732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224731 (select (arr!15430 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496331 (= lt!224733 (toIndex!0 (select (store (arr!15430 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496331 (= lt!224731 (toIndex!0 (select (arr!15430 a!3235) j!176) mask!3524))))

(declare-fun e!291062 () Bool)

(assert (=> b!496331 e!291062))

(declare-fun res!298772 () Bool)

(assert (=> b!496331 (=> (not res!298772) (not e!291062))))

(assert (=> b!496331 (= res!298772 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14713 0))(
  ( (Unit!14714) )
))
(declare-fun lt!224734 () Unit!14713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14713)

(assert (=> b!496331 (= lt!224734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496332 () Bool)

(declare-fun res!298773 () Bool)

(assert (=> b!496332 (=> (not res!298773) (not e!291063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496332 (= res!298773 (validKeyInArray!0 k0!2280))))

(declare-fun b!496333 () Bool)

(declare-fun res!298769 () Bool)

(assert (=> b!496333 (=> (not res!298769) (not e!291063))))

(assert (=> b!496333 (= res!298769 (and (= (size!15794 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15794 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15794 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496334 () Bool)

(assert (=> b!496334 (= e!291060 true)))

(assert (=> b!496334 (and (bvslt (x!46798 lt!224732) #b01111111111111111111111111111110) (or (= (select (arr!15430 a!3235) (index!17593 lt!224732)) (select (arr!15430 a!3235) j!176)) (= (select (arr!15430 a!3235) (index!17593 lt!224732)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15430 a!3235) (index!17593 lt!224732)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496335 () Bool)

(declare-fun res!298775 () Bool)

(assert (=> b!496335 (=> (not res!298775) (not e!291063))))

(assert (=> b!496335 (= res!298775 (validKeyInArray!0 (select (arr!15430 a!3235) j!176)))))

(declare-fun b!496336 () Bool)

(assert (=> b!496336 (= e!291062 (= (seekEntryOrOpen!0 (select (arr!15430 a!3235) j!176) a!3235 mask!3524) (Found!3853 j!176)))))

(assert (= (and start!45206 res!298768) b!496333))

(assert (= (and b!496333 res!298769) b!496335))

(assert (= (and b!496335 res!298775) b!496332))

(assert (= (and b!496332 res!298773) b!496328))

(assert (= (and b!496328 res!298767) b!496326))

(assert (= (and b!496326 res!298776) b!496329))

(assert (= (and b!496329 res!298770) b!496330))

(assert (= (and b!496330 res!298774) b!496331))

(assert (= (and b!496331 res!298772) b!496336))

(assert (= (and b!496331 (not res!298777)) b!496327))

(assert (= (and b!496327 (not res!298771)) b!496334))

(declare-fun m!477799 () Bool)

(assert (=> b!496326 m!477799))

(declare-fun m!477801 () Bool)

(assert (=> b!496334 m!477801))

(declare-fun m!477803 () Bool)

(assert (=> b!496334 m!477803))

(declare-fun m!477805 () Bool)

(assert (=> b!496330 m!477805))

(declare-fun m!477807 () Bool)

(assert (=> start!45206 m!477807))

(declare-fun m!477809 () Bool)

(assert (=> start!45206 m!477809))

(declare-fun m!477811 () Bool)

(assert (=> b!496332 m!477811))

(declare-fun m!477813 () Bool)

(assert (=> b!496328 m!477813))

(assert (=> b!496335 m!477803))

(assert (=> b!496335 m!477803))

(declare-fun m!477815 () Bool)

(assert (=> b!496335 m!477815))

(declare-fun m!477817 () Bool)

(assert (=> b!496329 m!477817))

(declare-fun m!477819 () Bool)

(assert (=> b!496331 m!477819))

(declare-fun m!477821 () Bool)

(assert (=> b!496331 m!477821))

(declare-fun m!477823 () Bool)

(assert (=> b!496331 m!477823))

(assert (=> b!496331 m!477803))

(declare-fun m!477825 () Bool)

(assert (=> b!496331 m!477825))

(assert (=> b!496331 m!477823))

(declare-fun m!477827 () Bool)

(assert (=> b!496331 m!477827))

(assert (=> b!496331 m!477823))

(declare-fun m!477829 () Bool)

(assert (=> b!496331 m!477829))

(assert (=> b!496331 m!477803))

(declare-fun m!477831 () Bool)

(assert (=> b!496331 m!477831))

(assert (=> b!496331 m!477803))

(declare-fun m!477833 () Bool)

(assert (=> b!496331 m!477833))

(assert (=> b!496336 m!477803))

(assert (=> b!496336 m!477803))

(declare-fun m!477835 () Bool)

(assert (=> b!496336 m!477835))

(check-sat (not b!496330) (not b!496336) (not b!496335) (not b!496329) (not b!496332) (not b!496326) (not b!496328) (not b!496331) (not start!45206))
(check-sat)
