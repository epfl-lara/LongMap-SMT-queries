; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47400 () Bool)

(assert start!47400)

(declare-fun b!521349 () Bool)

(declare-fun res!319269 () Bool)

(declare-fun e!304134 () Bool)

(assert (=> b!521349 (=> res!319269 e!304134)))

(declare-datatypes ((SeekEntryResult!4438 0))(
  ( (MissingZero!4438 (index!19955 (_ BitVec 32))) (Found!4438 (index!19956 (_ BitVec 32))) (Intermediate!4438 (undefined!5250 Bool) (index!19957 (_ BitVec 32)) (x!48947 (_ BitVec 32))) (Undefined!4438) (MissingVacant!4438 (index!19958 (_ BitVec 32))) )
))
(declare-fun lt!238845 () SeekEntryResult!4438)

(get-info :version)

(assert (=> b!521349 (= res!319269 (or (undefined!5250 lt!238845) (not ((_ is Intermediate!4438) lt!238845))))))

(declare-fun b!521350 () Bool)

(declare-fun e!304136 () Bool)

(declare-fun e!304133 () Bool)

(assert (=> b!521350 (= e!304136 e!304133)))

(declare-fun res!319268 () Bool)

(assert (=> b!521350 (=> (not res!319268) (not e!304133))))

(declare-fun lt!238848 () SeekEntryResult!4438)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521350 (= res!319268 (or (= lt!238848 (MissingZero!4438 i!1204)) (= lt!238848 (MissingVacant!4438 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33236 0))(
  ( (array!33237 (arr!15974 (Array (_ BitVec 32) (_ BitVec 64))) (size!16339 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33236 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!521350 (= lt!238848 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521351 () Bool)

(declare-datatypes ((Unit!16198 0))(
  ( (Unit!16199) )
))
(declare-fun e!304131 () Unit!16198)

(declare-fun Unit!16200 () Unit!16198)

(assert (=> b!521351 (= e!304131 Unit!16200)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!238846 () Unit!16198)

(declare-fun lt!238842 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16198)

(assert (=> b!521351 (= lt!238846 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238842 #b00000000000000000000000000000000 (index!19957 lt!238845) (x!48947 lt!238845) mask!3524))))

(declare-fun lt!238847 () array!33236)

(declare-fun res!319270 () Bool)

(declare-fun lt!238849 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33236 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!521351 (= res!319270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238842 lt!238849 lt!238847 mask!3524) (Intermediate!4438 false (index!19957 lt!238845) (x!48947 lt!238845))))))

(declare-fun e!304137 () Bool)

(assert (=> b!521351 (=> (not res!319270) (not e!304137))))

(assert (=> b!521351 e!304137))

(declare-fun res!319264 () Bool)

(assert (=> start!47400 (=> (not res!319264) (not e!304136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47400 (= res!319264 (validMask!0 mask!3524))))

(assert (=> start!47400 e!304136))

(assert (=> start!47400 true))

(declare-fun array_inv!11857 (array!33236) Bool)

(assert (=> start!47400 (array_inv!11857 a!3235)))

(declare-fun b!521352 () Bool)

(assert (=> b!521352 (= e!304133 (not e!304134))))

(declare-fun res!319267 () Bool)

(assert (=> b!521352 (=> res!319267 e!304134)))

(declare-fun lt!238841 () (_ BitVec 32))

(assert (=> b!521352 (= res!319267 (= lt!238845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238841 lt!238849 lt!238847 mask!3524)))))

(assert (=> b!521352 (= lt!238845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238842 (select (arr!15974 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521352 (= lt!238841 (toIndex!0 lt!238849 mask!3524))))

(assert (=> b!521352 (= lt!238849 (select (store (arr!15974 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521352 (= lt!238842 (toIndex!0 (select (arr!15974 a!3235) j!176) mask!3524))))

(assert (=> b!521352 (= lt!238847 (array!33237 (store (arr!15974 a!3235) i!1204 k0!2280) (size!16339 a!3235)))))

(declare-fun e!304132 () Bool)

(assert (=> b!521352 e!304132))

(declare-fun res!319263 () Bool)

(assert (=> b!521352 (=> (not res!319263) (not e!304132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33236 (_ BitVec 32)) Bool)

(assert (=> b!521352 (= res!319263 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238844 () Unit!16198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16198)

(assert (=> b!521352 (= lt!238844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521353 () Bool)

(assert (=> b!521353 (= e!304132 (= (seekEntryOrOpen!0 (select (arr!15974 a!3235) j!176) a!3235 mask!3524) (Found!4438 j!176)))))

(declare-fun b!521354 () Bool)

(assert (=> b!521354 (= e!304137 false)))

(declare-fun b!521355 () Bool)

(declare-fun res!319266 () Bool)

(assert (=> b!521355 (=> (not res!319266) (not e!304136))))

(declare-fun arrayContainsKey!0 (array!33236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521355 (= res!319266 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521356 () Bool)

(declare-fun res!319273 () Bool)

(assert (=> b!521356 (=> (not res!319273) (not e!304136))))

(assert (=> b!521356 (= res!319273 (and (= (size!16339 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16339 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16339 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521357 () Bool)

(declare-fun res!319274 () Bool)

(assert (=> b!521357 (=> (not res!319274) (not e!304136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521357 (= res!319274 (validKeyInArray!0 (select (arr!15974 a!3235) j!176)))))

(declare-fun b!521358 () Bool)

(assert (=> b!521358 (= e!304134 true)))

(assert (=> b!521358 (and (or (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238843 () Unit!16198)

(assert (=> b!521358 (= lt!238843 e!304131)))

(declare-fun c!61344 () Bool)

(assert (=> b!521358 (= c!61344 (= (select (arr!15974 a!3235) (index!19957 lt!238845)) (select (arr!15974 a!3235) j!176)))))

(assert (=> b!521358 (and (bvslt (x!48947 lt!238845) #b01111111111111111111111111111110) (or (= (select (arr!15974 a!3235) (index!19957 lt!238845)) (select (arr!15974 a!3235) j!176)) (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15974 a!3235) (index!19957 lt!238845)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521359 () Bool)

(declare-fun res!319265 () Bool)

(assert (=> b!521359 (=> (not res!319265) (not e!304133))))

(declare-datatypes ((List!10171 0))(
  ( (Nil!10168) (Cons!10167 (h!11089 (_ BitVec 64)) (t!16390 List!10171)) )
))
(declare-fun arrayNoDuplicates!0 (array!33236 (_ BitVec 32) List!10171) Bool)

(assert (=> b!521359 (= res!319265 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10168))))

(declare-fun b!521360 () Bool)

(declare-fun res!319271 () Bool)

(assert (=> b!521360 (=> (not res!319271) (not e!304136))))

(assert (=> b!521360 (= res!319271 (validKeyInArray!0 k0!2280))))

(declare-fun b!521361 () Bool)

(declare-fun Unit!16201 () Unit!16198)

(assert (=> b!521361 (= e!304131 Unit!16201)))

(declare-fun b!521362 () Bool)

(declare-fun res!319272 () Bool)

(assert (=> b!521362 (=> (not res!319272) (not e!304133))))

(assert (=> b!521362 (= res!319272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47400 res!319264) b!521356))

(assert (= (and b!521356 res!319273) b!521357))

(assert (= (and b!521357 res!319274) b!521360))

(assert (= (and b!521360 res!319271) b!521355))

(assert (= (and b!521355 res!319266) b!521350))

(assert (= (and b!521350 res!319268) b!521362))

(assert (= (and b!521362 res!319272) b!521359))

(assert (= (and b!521359 res!319265) b!521352))

(assert (= (and b!521352 res!319263) b!521353))

(assert (= (and b!521352 (not res!319267)) b!521349))

(assert (= (and b!521349 (not res!319269)) b!521358))

(assert (= (and b!521358 c!61344) b!521351))

(assert (= (and b!521358 (not c!61344)) b!521361))

(assert (= (and b!521351 res!319270) b!521354))

(declare-fun m!501781 () Bool)

(assert (=> b!521355 m!501781))

(declare-fun m!501783 () Bool)

(assert (=> b!521360 m!501783))

(declare-fun m!501785 () Bool)

(assert (=> b!521351 m!501785))

(declare-fun m!501787 () Bool)

(assert (=> b!521351 m!501787))

(declare-fun m!501789 () Bool)

(assert (=> b!521357 m!501789))

(assert (=> b!521357 m!501789))

(declare-fun m!501791 () Bool)

(assert (=> b!521357 m!501791))

(declare-fun m!501793 () Bool)

(assert (=> start!47400 m!501793))

(declare-fun m!501795 () Bool)

(assert (=> start!47400 m!501795))

(declare-fun m!501797 () Bool)

(assert (=> b!521359 m!501797))

(declare-fun m!501799 () Bool)

(assert (=> b!521362 m!501799))

(assert (=> b!521353 m!501789))

(assert (=> b!521353 m!501789))

(declare-fun m!501801 () Bool)

(assert (=> b!521353 m!501801))

(declare-fun m!501803 () Bool)

(assert (=> b!521350 m!501803))

(declare-fun m!501805 () Bool)

(assert (=> b!521358 m!501805))

(assert (=> b!521358 m!501789))

(declare-fun m!501807 () Bool)

(assert (=> b!521352 m!501807))

(declare-fun m!501809 () Bool)

(assert (=> b!521352 m!501809))

(declare-fun m!501811 () Bool)

(assert (=> b!521352 m!501811))

(assert (=> b!521352 m!501789))

(declare-fun m!501813 () Bool)

(assert (=> b!521352 m!501813))

(declare-fun m!501815 () Bool)

(assert (=> b!521352 m!501815))

(declare-fun m!501817 () Bool)

(assert (=> b!521352 m!501817))

(assert (=> b!521352 m!501789))

(declare-fun m!501819 () Bool)

(assert (=> b!521352 m!501819))

(assert (=> b!521352 m!501789))

(declare-fun m!501821 () Bool)

(assert (=> b!521352 m!501821))

(check-sat (not b!521353) (not b!521362) (not b!521360) (not b!521352) (not b!521350) (not b!521359) (not b!521355) (not b!521351) (not start!47400) (not b!521357))
(check-sat)
