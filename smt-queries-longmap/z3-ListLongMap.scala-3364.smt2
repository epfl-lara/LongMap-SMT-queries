; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46226 () Bool)

(assert start!46226)

(declare-fun b!511969 () Bool)

(declare-fun res!312692 () Bool)

(declare-fun e!299062 () Bool)

(assert (=> b!511969 (=> (not res!312692) (not e!299062))))

(declare-datatypes ((array!32881 0))(
  ( (array!32882 (arr!15817 (Array (_ BitVec 32) (_ BitVec 64))) (size!16181 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32881)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511969 (= res!312692 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511970 () Bool)

(declare-fun res!312689 () Bool)

(declare-fun e!299061 () Bool)

(assert (=> b!511970 (=> res!312689 e!299061)))

(declare-datatypes ((SeekEntryResult!4240 0))(
  ( (MissingZero!4240 (index!19148 (_ BitVec 32))) (Found!4240 (index!19149 (_ BitVec 32))) (Intermediate!4240 (undefined!5052 Bool) (index!19150 (_ BitVec 32)) (x!48244 (_ BitVec 32))) (Undefined!4240) (MissingVacant!4240 (index!19151 (_ BitVec 32))) )
))
(declare-fun lt!234352 () SeekEntryResult!4240)

(get-info :version)

(assert (=> b!511970 (= res!312689 (or (not ((_ is Intermediate!4240) lt!234352)) (not (undefined!5052 lt!234352))))))

(declare-fun res!312688 () Bool)

(assert (=> start!46226 (=> (not res!312688) (not e!299062))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46226 (= res!312688 (validMask!0 mask!3524))))

(assert (=> start!46226 e!299062))

(assert (=> start!46226 true))

(declare-fun array_inv!11676 (array!32881) Bool)

(assert (=> start!46226 (array_inv!11676 a!3235)))

(declare-fun b!511971 () Bool)

(assert (=> b!511971 (= e!299061 false)))

(declare-fun lt!234350 () SeekEntryResult!4240)

(assert (=> b!511971 (= lt!234350 Undefined!4240)))

(declare-fun b!511972 () Bool)

(declare-fun res!312687 () Bool)

(assert (=> b!511972 (=> (not res!312687) (not e!299062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511972 (= res!312687 (validKeyInArray!0 k0!2280))))

(declare-fun b!511973 () Bool)

(declare-fun res!312691 () Bool)

(declare-fun e!299063 () Bool)

(assert (=> b!511973 (=> (not res!312691) (not e!299063))))

(declare-datatypes ((List!9882 0))(
  ( (Nil!9879) (Cons!9878 (h!10758 (_ BitVec 64)) (t!16102 List!9882)) )
))
(declare-fun arrayNoDuplicates!0 (array!32881 (_ BitVec 32) List!9882) Bool)

(assert (=> b!511973 (= res!312691 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9879))))

(declare-fun b!511974 () Bool)

(declare-fun res!312694 () Bool)

(assert (=> b!511974 (=> (not res!312694) (not e!299063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32881 (_ BitVec 32)) Bool)

(assert (=> b!511974 (= res!312694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511975 () Bool)

(declare-fun res!312685 () Bool)

(assert (=> b!511975 (=> (not res!312685) (not e!299062))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511975 (= res!312685 (and (= (size!16181 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16181 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16181 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511976 () Bool)

(assert (=> b!511976 (= e!299063 (not e!299061))))

(declare-fun res!312690 () Bool)

(assert (=> b!511976 (=> res!312690 e!299061)))

(declare-fun lt!234351 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32881 (_ BitVec 32)) SeekEntryResult!4240)

(assert (=> b!511976 (= res!312690 (= lt!234352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234351 (select (store (arr!15817 a!3235) i!1204 k0!2280) j!176) (array!32882 (store (arr!15817 a!3235) i!1204 k0!2280) (size!16181 a!3235)) mask!3524)))))

(declare-fun lt!234348 () (_ BitVec 32))

(assert (=> b!511976 (= lt!234352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234348 (select (arr!15817 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511976 (= lt!234351 (toIndex!0 (select (store (arr!15817 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511976 (= lt!234348 (toIndex!0 (select (arr!15817 a!3235) j!176) mask!3524))))

(assert (=> b!511976 (= lt!234350 (Found!4240 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32881 (_ BitVec 32)) SeekEntryResult!4240)

(assert (=> b!511976 (= lt!234350 (seekEntryOrOpen!0 (select (arr!15817 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511976 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15799 0))(
  ( (Unit!15800) )
))
(declare-fun lt!234349 () Unit!15799)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15799)

(assert (=> b!511976 (= lt!234349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511977 () Bool)

(assert (=> b!511977 (= e!299062 e!299063)))

(declare-fun res!312693 () Bool)

(assert (=> b!511977 (=> (not res!312693) (not e!299063))))

(declare-fun lt!234347 () SeekEntryResult!4240)

(assert (=> b!511977 (= res!312693 (or (= lt!234347 (MissingZero!4240 i!1204)) (= lt!234347 (MissingVacant!4240 i!1204))))))

(assert (=> b!511977 (= lt!234347 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511978 () Bool)

(declare-fun res!312686 () Bool)

(assert (=> b!511978 (=> (not res!312686) (not e!299062))))

(assert (=> b!511978 (= res!312686 (validKeyInArray!0 (select (arr!15817 a!3235) j!176)))))

(assert (= (and start!46226 res!312688) b!511975))

(assert (= (and b!511975 res!312685) b!511978))

(assert (= (and b!511978 res!312686) b!511972))

(assert (= (and b!511972 res!312687) b!511969))

(assert (= (and b!511969 res!312692) b!511977))

(assert (= (and b!511977 res!312693) b!511974))

(assert (= (and b!511974 res!312694) b!511973))

(assert (= (and b!511973 res!312691) b!511976))

(assert (= (and b!511976 (not res!312690)) b!511970))

(assert (= (and b!511970 (not res!312689)) b!511971))

(declare-fun m!493789 () Bool)

(assert (=> b!511972 m!493789))

(declare-fun m!493791 () Bool)

(assert (=> b!511969 m!493791))

(declare-fun m!493793 () Bool)

(assert (=> b!511976 m!493793))

(declare-fun m!493795 () Bool)

(assert (=> b!511976 m!493795))

(declare-fun m!493797 () Bool)

(assert (=> b!511976 m!493797))

(declare-fun m!493799 () Bool)

(assert (=> b!511976 m!493799))

(assert (=> b!511976 m!493797))

(declare-fun m!493801 () Bool)

(assert (=> b!511976 m!493801))

(assert (=> b!511976 m!493797))

(declare-fun m!493803 () Bool)

(assert (=> b!511976 m!493803))

(assert (=> b!511976 m!493797))

(declare-fun m!493805 () Bool)

(assert (=> b!511976 m!493805))

(assert (=> b!511976 m!493795))

(declare-fun m!493807 () Bool)

(assert (=> b!511976 m!493807))

(assert (=> b!511976 m!493795))

(declare-fun m!493809 () Bool)

(assert (=> b!511976 m!493809))

(declare-fun m!493811 () Bool)

(assert (=> b!511976 m!493811))

(declare-fun m!493813 () Bool)

(assert (=> b!511974 m!493813))

(declare-fun m!493815 () Bool)

(assert (=> b!511973 m!493815))

(declare-fun m!493817 () Bool)

(assert (=> b!511977 m!493817))

(assert (=> b!511978 m!493797))

(assert (=> b!511978 m!493797))

(declare-fun m!493819 () Bool)

(assert (=> b!511978 m!493819))

(declare-fun m!493821 () Bool)

(assert (=> start!46226 m!493821))

(declare-fun m!493823 () Bool)

(assert (=> start!46226 m!493823))

(check-sat (not b!511974) (not b!511969) (not b!511976) (not b!511973) (not start!46226) (not b!511978) (not b!511977) (not b!511972))
(check-sat)
