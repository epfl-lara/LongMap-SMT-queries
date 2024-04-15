; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46698 () Bool)

(assert start!46698)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!515307 () Bool)

(declare-datatypes ((array!33020 0))(
  ( (array!33021 (arr!15878 (Array (_ BitVec 32) (_ BitVec 64))) (size!16243 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33020)

(declare-fun e!300838 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4342 0))(
  ( (MissingZero!4342 (index!19556 (_ BitVec 32))) (Found!4342 (index!19557 (_ BitVec 32))) (Intermediate!4342 (undefined!5154 Bool) (index!19558 (_ BitVec 32)) (x!48532 (_ BitVec 32))) (Undefined!4342) (MissingVacant!4342 (index!19559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33020 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!515307 (= e!300838 (= (seekEntryOrOpen!0 (select (arr!15878 a!3235) j!176) a!3235 mask!3524) (Found!4342 j!176)))))

(declare-fun b!515308 () Bool)

(declare-fun res!315017 () Bool)

(declare-fun e!300837 () Bool)

(assert (=> b!515308 (=> (not res!315017) (not e!300837))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515308 (= res!315017 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515309 () Bool)

(declare-fun res!315021 () Bool)

(declare-fun e!300839 () Bool)

(assert (=> b!515309 (=> (not res!315021) (not e!300839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33020 (_ BitVec 32)) Bool)

(assert (=> b!515309 (= res!315021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515310 () Bool)

(declare-fun e!300840 () Bool)

(assert (=> b!515310 (= e!300839 (not e!300840))))

(declare-fun res!315019 () Bool)

(assert (=> b!515310 (=> res!315019 e!300840)))

(declare-fun lt!235793 () SeekEntryResult!4342)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235791 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33020 (_ BitVec 32)) SeekEntryResult!4342)

(assert (=> b!515310 (= res!315019 (= lt!235793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235791 (select (store (arr!15878 a!3235) i!1204 k0!2280) j!176) (array!33021 (store (arr!15878 a!3235) i!1204 k0!2280) (size!16243 a!3235)) mask!3524)))))

(declare-fun lt!235792 () (_ BitVec 32))

(assert (=> b!515310 (= lt!235793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235792 (select (arr!15878 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515310 (= lt!235791 (toIndex!0 (select (store (arr!15878 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515310 (= lt!235792 (toIndex!0 (select (arr!15878 a!3235) j!176) mask!3524))))

(assert (=> b!515310 e!300838))

(declare-fun res!315022 () Bool)

(assert (=> b!515310 (=> (not res!315022) (not e!300838))))

(assert (=> b!515310 (= res!315022 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15928 0))(
  ( (Unit!15929) )
))
(declare-fun lt!235795 () Unit!15928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15928)

(assert (=> b!515310 (= lt!235795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515311 () Bool)

(assert (=> b!515311 (= e!300840 true)))

(assert (=> b!515311 (and (bvslt (x!48532 lt!235793) #b01111111111111111111111111111110) (or (= (select (arr!15878 a!3235) (index!19558 lt!235793)) (select (arr!15878 a!3235) j!176)) (= (select (arr!15878 a!3235) (index!19558 lt!235793)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15878 a!3235) (index!19558 lt!235793)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515312 () Bool)

(declare-fun res!315018 () Bool)

(assert (=> b!515312 (=> (not res!315018) (not e!300837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515312 (= res!315018 (validKeyInArray!0 k0!2280))))

(declare-fun b!515313 () Bool)

(declare-fun res!315013 () Bool)

(assert (=> b!515313 (=> (not res!315013) (not e!300837))))

(assert (=> b!515313 (= res!315013 (and (= (size!16243 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16243 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16243 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315014 () Bool)

(assert (=> start!46698 (=> (not res!315014) (not e!300837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46698 (= res!315014 (validMask!0 mask!3524))))

(assert (=> start!46698 e!300837))

(assert (=> start!46698 true))

(declare-fun array_inv!11761 (array!33020) Bool)

(assert (=> start!46698 (array_inv!11761 a!3235)))

(declare-fun b!515314 () Bool)

(declare-fun res!315020 () Bool)

(assert (=> b!515314 (=> (not res!315020) (not e!300837))))

(assert (=> b!515314 (= res!315020 (validKeyInArray!0 (select (arr!15878 a!3235) j!176)))))

(declare-fun b!515315 () Bool)

(assert (=> b!515315 (= e!300837 e!300839)))

(declare-fun res!315023 () Bool)

(assert (=> b!515315 (=> (not res!315023) (not e!300839))))

(declare-fun lt!235794 () SeekEntryResult!4342)

(assert (=> b!515315 (= res!315023 (or (= lt!235794 (MissingZero!4342 i!1204)) (= lt!235794 (MissingVacant!4342 i!1204))))))

(assert (=> b!515315 (= lt!235794 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515316 () Bool)

(declare-fun res!315016 () Bool)

(assert (=> b!515316 (=> (not res!315016) (not e!300839))))

(declare-datatypes ((List!10075 0))(
  ( (Nil!10072) (Cons!10071 (h!10969 (_ BitVec 64)) (t!16294 List!10075)) )
))
(declare-fun arrayNoDuplicates!0 (array!33020 (_ BitVec 32) List!10075) Bool)

(assert (=> b!515316 (= res!315016 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10072))))

(declare-fun b!515317 () Bool)

(declare-fun res!315015 () Bool)

(assert (=> b!515317 (=> res!315015 e!300840)))

(get-info :version)

(assert (=> b!515317 (= res!315015 (or (undefined!5154 lt!235793) (not ((_ is Intermediate!4342) lt!235793))))))

(assert (= (and start!46698 res!315014) b!515313))

(assert (= (and b!515313 res!315013) b!515314))

(assert (= (and b!515314 res!315020) b!515312))

(assert (= (and b!515312 res!315018) b!515308))

(assert (= (and b!515308 res!315017) b!515315))

(assert (= (and b!515315 res!315023) b!515309))

(assert (= (and b!515309 res!315021) b!515316))

(assert (= (and b!515316 res!315016) b!515310))

(assert (= (and b!515310 res!315022) b!515307))

(assert (= (and b!515310 (not res!315019)) b!515317))

(assert (= (and b!515317 (not res!315015)) b!515311))

(declare-fun m!496183 () Bool)

(assert (=> b!515316 m!496183))

(declare-fun m!496185 () Bool)

(assert (=> b!515312 m!496185))

(declare-fun m!496187 () Bool)

(assert (=> b!515314 m!496187))

(assert (=> b!515314 m!496187))

(declare-fun m!496189 () Bool)

(assert (=> b!515314 m!496189))

(declare-fun m!496191 () Bool)

(assert (=> b!515309 m!496191))

(declare-fun m!496193 () Bool)

(assert (=> start!46698 m!496193))

(declare-fun m!496195 () Bool)

(assert (=> start!46698 m!496195))

(declare-fun m!496197 () Bool)

(assert (=> b!515315 m!496197))

(declare-fun m!496199 () Bool)

(assert (=> b!515311 m!496199))

(assert (=> b!515311 m!496187))

(declare-fun m!496201 () Bool)

(assert (=> b!515310 m!496201))

(declare-fun m!496203 () Bool)

(assert (=> b!515310 m!496203))

(declare-fun m!496205 () Bool)

(assert (=> b!515310 m!496205))

(assert (=> b!515310 m!496187))

(declare-fun m!496207 () Bool)

(assert (=> b!515310 m!496207))

(assert (=> b!515310 m!496187))

(declare-fun m!496209 () Bool)

(assert (=> b!515310 m!496209))

(assert (=> b!515310 m!496187))

(declare-fun m!496211 () Bool)

(assert (=> b!515310 m!496211))

(assert (=> b!515310 m!496205))

(declare-fun m!496213 () Bool)

(assert (=> b!515310 m!496213))

(assert (=> b!515310 m!496205))

(declare-fun m!496215 () Bool)

(assert (=> b!515310 m!496215))

(declare-fun m!496217 () Bool)

(assert (=> b!515308 m!496217))

(assert (=> b!515307 m!496187))

(assert (=> b!515307 m!496187))

(declare-fun m!496219 () Bool)

(assert (=> b!515307 m!496219))

(check-sat (not b!515308) (not b!515315) (not start!46698) (not b!515316) (not b!515307) (not b!515310) (not b!515314) (not b!515309) (not b!515312))
(check-sat)
