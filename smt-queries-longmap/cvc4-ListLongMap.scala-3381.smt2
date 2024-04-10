; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46702 () Bool)

(assert start!46702)

(declare-fun b!515446 () Bool)

(declare-fun res!315011 () Bool)

(declare-fun e!300954 () Bool)

(assert (=> b!515446 (=> (not res!315011) (not e!300954))))

(declare-datatypes ((array!33014 0))(
  ( (array!33015 (arr!15875 (Array (_ BitVec 32) (_ BitVec 64))) (size!16239 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33014)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33014 (_ BitVec 32)) Bool)

(assert (=> b!515446 (= res!315011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515447 () Bool)

(declare-fun e!300951 () Bool)

(assert (=> b!515447 (= e!300951 true)))

(declare-datatypes ((SeekEntryResult!4342 0))(
  ( (MissingZero!4342 (index!19556 (_ BitVec 32))) (Found!4342 (index!19557 (_ BitVec 32))) (Intermediate!4342 (undefined!5154 Bool) (index!19558 (_ BitVec 32)) (x!48521 (_ BitVec 32))) (Undefined!4342) (MissingVacant!4342 (index!19559 (_ BitVec 32))) )
))
(declare-fun lt!235968 () SeekEntryResult!4342)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515447 (and (bvslt (x!48521 lt!235968) #b01111111111111111111111111111110) (or (= (select (arr!15875 a!3235) (index!19558 lt!235968)) (select (arr!15875 a!3235) j!176)) (= (select (arr!15875 a!3235) (index!19558 lt!235968)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15875 a!3235) (index!19558 lt!235968)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515448 () Bool)

(declare-fun e!300952 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33014 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!515448 (= e!300952 (= (seekEntryOrOpen!0 (select (arr!15875 a!3235) j!176) a!3235 mask!3524) (Found!4342 j!176)))))

(declare-fun b!515449 () Bool)

(declare-fun res!315018 () Bool)

(assert (=> b!515449 (=> res!315018 e!300951)))

(assert (=> b!515449 (= res!315018 (or (undefined!5154 lt!235968) (not (is-Intermediate!4342 lt!235968))))))

(declare-fun b!515450 () Bool)

(declare-fun res!315015 () Bool)

(declare-fun e!300953 () Bool)

(assert (=> b!515450 (=> (not res!315015) (not e!300953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515450 (= res!315015 (validKeyInArray!0 (select (arr!15875 a!3235) j!176)))))

(declare-fun b!515451 () Bool)

(assert (=> b!515451 (= e!300954 (not e!300951))))

(declare-fun res!315012 () Bool)

(assert (=> b!515451 (=> res!315012 e!300951)))

(declare-fun lt!235965 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33014 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!515451 (= res!315012 (= lt!235968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235965 (select (store (arr!15875 a!3235) i!1204 k!2280) j!176) (array!33015 (store (arr!15875 a!3235) i!1204 k!2280) (size!16239 a!3235)) mask!3524)))))

(declare-fun lt!235969 () (_ BitVec 32))

(assert (=> b!515451 (= lt!235968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235969 (select (arr!15875 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515451 (= lt!235965 (toIndex!0 (select (store (arr!15875 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515451 (= lt!235969 (toIndex!0 (select (arr!15875 a!3235) j!176) mask!3524))))

(assert (=> b!515451 e!300952))

(declare-fun res!315010 () Bool)

(assert (=> b!515451 (=> (not res!315010) (not e!300952))))

(assert (=> b!515451 (= res!315010 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15942 0))(
  ( (Unit!15943) )
))
(declare-fun lt!235967 () Unit!15942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15942)

(assert (=> b!515451 (= lt!235967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!315014 () Bool)

(assert (=> start!46702 (=> (not res!315014) (not e!300953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46702 (= res!315014 (validMask!0 mask!3524))))

(assert (=> start!46702 e!300953))

(assert (=> start!46702 true))

(declare-fun array_inv!11671 (array!33014) Bool)

(assert (=> start!46702 (array_inv!11671 a!3235)))

(declare-fun b!515452 () Bool)

(assert (=> b!515452 (= e!300953 e!300954)))

(declare-fun res!315019 () Bool)

(assert (=> b!515452 (=> (not res!315019) (not e!300954))))

(declare-fun lt!235966 () SeekEntryResult!4342)

(assert (=> b!515452 (= res!315019 (or (= lt!235966 (MissingZero!4342 i!1204)) (= lt!235966 (MissingVacant!4342 i!1204))))))

(assert (=> b!515452 (= lt!235966 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515453 () Bool)

(declare-fun res!315016 () Bool)

(assert (=> b!515453 (=> (not res!315016) (not e!300953))))

(assert (=> b!515453 (= res!315016 (and (= (size!16239 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16239 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16239 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515454 () Bool)

(declare-fun res!315017 () Bool)

(assert (=> b!515454 (=> (not res!315017) (not e!300953))))

(assert (=> b!515454 (= res!315017 (validKeyInArray!0 k!2280))))

(declare-fun b!515455 () Bool)

(declare-fun res!315020 () Bool)

(assert (=> b!515455 (=> (not res!315020) (not e!300953))))

(declare-fun arrayContainsKey!0 (array!33014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515455 (= res!315020 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515456 () Bool)

(declare-fun res!315013 () Bool)

(assert (=> b!515456 (=> (not res!315013) (not e!300954))))

(declare-datatypes ((List!10033 0))(
  ( (Nil!10030) (Cons!10029 (h!10927 (_ BitVec 64)) (t!16261 List!10033)) )
))
(declare-fun arrayNoDuplicates!0 (array!33014 (_ BitVec 32) List!10033) Bool)

(assert (=> b!515456 (= res!315013 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10030))))

(assert (= (and start!46702 res!315014) b!515453))

(assert (= (and b!515453 res!315016) b!515450))

(assert (= (and b!515450 res!315015) b!515454))

(assert (= (and b!515454 res!315017) b!515455))

(assert (= (and b!515455 res!315020) b!515452))

(assert (= (and b!515452 res!315019) b!515446))

(assert (= (and b!515446 res!315011) b!515456))

(assert (= (and b!515456 res!315013) b!515451))

(assert (= (and b!515451 res!315010) b!515448))

(assert (= (and b!515451 (not res!315012)) b!515449))

(assert (= (and b!515449 (not res!315018)) b!515447))

(declare-fun m!496783 () Bool)

(assert (=> b!515451 m!496783))

(declare-fun m!496785 () Bool)

(assert (=> b!515451 m!496785))

(declare-fun m!496787 () Bool)

(assert (=> b!515451 m!496787))

(declare-fun m!496789 () Bool)

(assert (=> b!515451 m!496789))

(declare-fun m!496791 () Bool)

(assert (=> b!515451 m!496791))

(assert (=> b!515451 m!496789))

(declare-fun m!496793 () Bool)

(assert (=> b!515451 m!496793))

(assert (=> b!515451 m!496787))

(declare-fun m!496795 () Bool)

(assert (=> b!515451 m!496795))

(assert (=> b!515451 m!496787))

(declare-fun m!496797 () Bool)

(assert (=> b!515451 m!496797))

(assert (=> b!515451 m!496789))

(declare-fun m!496799 () Bool)

(assert (=> b!515451 m!496799))

(declare-fun m!496801 () Bool)

(assert (=> start!46702 m!496801))

(declare-fun m!496803 () Bool)

(assert (=> start!46702 m!496803))

(assert (=> b!515450 m!496789))

(assert (=> b!515450 m!496789))

(declare-fun m!496805 () Bool)

(assert (=> b!515450 m!496805))

(assert (=> b!515448 m!496789))

(assert (=> b!515448 m!496789))

(declare-fun m!496807 () Bool)

(assert (=> b!515448 m!496807))

(declare-fun m!496809 () Bool)

(assert (=> b!515447 m!496809))

(assert (=> b!515447 m!496789))

(declare-fun m!496811 () Bool)

(assert (=> b!515455 m!496811))

(declare-fun m!496813 () Bool)

(assert (=> b!515452 m!496813))

(declare-fun m!496815 () Bool)

(assert (=> b!515454 m!496815))

(declare-fun m!496817 () Bool)

(assert (=> b!515456 m!496817))

(declare-fun m!496819 () Bool)

(assert (=> b!515446 m!496819))

(push 1)

