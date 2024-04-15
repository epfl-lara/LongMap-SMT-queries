; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47682 () Bool)

(assert start!47682)

(declare-fun b!524094 () Bool)

(declare-fun e!305643 () Bool)

(declare-fun e!305646 () Bool)

(assert (=> b!524094 (= e!305643 e!305646)))

(declare-fun res!321155 () Bool)

(assert (=> b!524094 (=> (not res!321155) (not e!305646))))

(declare-datatypes ((SeekEntryResult!4480 0))(
  ( (MissingZero!4480 (index!20132 (_ BitVec 32))) (Found!4480 (index!20133 (_ BitVec 32))) (Intermediate!4480 (undefined!5292 Bool) (index!20134 (_ BitVec 32)) (x!49128 (_ BitVec 32))) (Undefined!4480) (MissingVacant!4480 (index!20135 (_ BitVec 32))) )
))
(declare-fun lt!240409 () SeekEntryResult!4480)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524094 (= res!321155 (or (= lt!240409 (MissingZero!4480 i!1204)) (= lt!240409 (MissingVacant!4480 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33329 0))(
  ( (array!33330 (arr!16016 (Array (_ BitVec 32) (_ BitVec 64))) (size!16381 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33329)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33329 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!524094 (= lt!240409 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524095 () Bool)

(declare-fun res!321157 () Bool)

(assert (=> b!524095 (=> (not res!321157) (not e!305643))))

(declare-fun arrayContainsKey!0 (array!33329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524095 (= res!321157 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524096 () Bool)

(declare-datatypes ((Unit!16366 0))(
  ( (Unit!16367) )
))
(declare-fun e!305644 () Unit!16366)

(declare-fun Unit!16368 () Unit!16366)

(assert (=> b!524096 (= e!305644 Unit!16368)))

(declare-fun lt!240412 () Unit!16366)

(declare-fun lt!240407 () (_ BitVec 32))

(declare-fun lt!240415 () SeekEntryResult!4480)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16366)

(assert (=> b!524096 (= lt!240412 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240407 #b00000000000000000000000000000000 (index!20134 lt!240415) (x!49128 lt!240415) mask!3524))))

(declare-fun res!321158 () Bool)

(declare-fun lt!240411 () array!33329)

(declare-fun lt!240413 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33329 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!524096 (= res!321158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240407 lt!240413 lt!240411 mask!3524) (Intermediate!4480 false (index!20134 lt!240415) (x!49128 lt!240415))))))

(declare-fun e!305648 () Bool)

(assert (=> b!524096 (=> (not res!321158) (not e!305648))))

(assert (=> b!524096 e!305648))

(declare-fun res!321162 () Bool)

(assert (=> start!47682 (=> (not res!321162) (not e!305643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47682 (= res!321162 (validMask!0 mask!3524))))

(assert (=> start!47682 e!305643))

(assert (=> start!47682 true))

(declare-fun array_inv!11899 (array!33329) Bool)

(assert (=> start!47682 (array_inv!11899 a!3235)))

(declare-fun b!524097 () Bool)

(declare-fun res!321160 () Bool)

(assert (=> b!524097 (=> (not res!321160) (not e!305646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33329 (_ BitVec 32)) Bool)

(assert (=> b!524097 (= res!321160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524098 () Bool)

(declare-fun e!305647 () Bool)

(assert (=> b!524098 (= e!305646 (not e!305647))))

(declare-fun res!321156 () Bool)

(assert (=> b!524098 (=> res!321156 e!305647)))

(declare-fun lt!240410 () (_ BitVec 32))

(assert (=> b!524098 (= res!321156 (= lt!240415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240410 lt!240413 lt!240411 mask!3524)))))

(assert (=> b!524098 (= lt!240415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240407 (select (arr!16016 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524098 (= lt!240410 (toIndex!0 lt!240413 mask!3524))))

(assert (=> b!524098 (= lt!240413 (select (store (arr!16016 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524098 (= lt!240407 (toIndex!0 (select (arr!16016 a!3235) j!176) mask!3524))))

(assert (=> b!524098 (= lt!240411 (array!33330 (store (arr!16016 a!3235) i!1204 k0!2280) (size!16381 a!3235)))))

(declare-fun e!305649 () Bool)

(assert (=> b!524098 e!305649))

(declare-fun res!321153 () Bool)

(assert (=> b!524098 (=> (not res!321153) (not e!305649))))

(assert (=> b!524098 (= res!321153 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240408 () Unit!16366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16366)

(assert (=> b!524098 (= lt!240408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524099 () Bool)

(assert (=> b!524099 (= e!305649 (= (seekEntryOrOpen!0 (select (arr!16016 a!3235) j!176) a!3235 mask!3524) (Found!4480 j!176)))))

(declare-fun b!524100 () Bool)

(declare-fun res!321164 () Bool)

(assert (=> b!524100 (=> (not res!321164) (not e!305643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524100 (= res!321164 (validKeyInArray!0 k0!2280))))

(declare-fun b!524101 () Bool)

(declare-fun res!321159 () Bool)

(assert (=> b!524101 (=> (not res!321159) (not e!305643))))

(assert (=> b!524101 (= res!321159 (validKeyInArray!0 (select (arr!16016 a!3235) j!176)))))

(declare-fun b!524102 () Bool)

(assert (=> b!524102 (= e!305648 false)))

(declare-fun b!524103 () Bool)

(assert (=> b!524103 (= e!305647 true)))

(assert (=> b!524103 (and (or (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240414 () Unit!16366)

(assert (=> b!524103 (= lt!240414 e!305644)))

(declare-fun c!61776 () Bool)

(assert (=> b!524103 (= c!61776 (= (select (arr!16016 a!3235) (index!20134 lt!240415)) (select (arr!16016 a!3235) j!176)))))

(assert (=> b!524103 (and (bvslt (x!49128 lt!240415) #b01111111111111111111111111111110) (or (= (select (arr!16016 a!3235) (index!20134 lt!240415)) (select (arr!16016 a!3235) j!176)) (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16016 a!3235) (index!20134 lt!240415)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524104 () Bool)

(declare-fun res!321154 () Bool)

(assert (=> b!524104 (=> (not res!321154) (not e!305643))))

(assert (=> b!524104 (= res!321154 (and (= (size!16381 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16381 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16381 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524105 () Bool)

(declare-fun Unit!16369 () Unit!16366)

(assert (=> b!524105 (= e!305644 Unit!16369)))

(declare-fun b!524106 () Bool)

(declare-fun res!321163 () Bool)

(assert (=> b!524106 (=> (not res!321163) (not e!305646))))

(declare-datatypes ((List!10213 0))(
  ( (Nil!10210) (Cons!10209 (h!11140 (_ BitVec 64)) (t!16432 List!10213)) )
))
(declare-fun arrayNoDuplicates!0 (array!33329 (_ BitVec 32) List!10213) Bool)

(assert (=> b!524106 (= res!321163 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10210))))

(declare-fun b!524107 () Bool)

(declare-fun res!321161 () Bool)

(assert (=> b!524107 (=> res!321161 e!305647)))

(get-info :version)

(assert (=> b!524107 (= res!321161 (or (undefined!5292 lt!240415) (not ((_ is Intermediate!4480) lt!240415))))))

(assert (= (and start!47682 res!321162) b!524104))

(assert (= (and b!524104 res!321154) b!524101))

(assert (= (and b!524101 res!321159) b!524100))

(assert (= (and b!524100 res!321164) b!524095))

(assert (= (and b!524095 res!321157) b!524094))

(assert (= (and b!524094 res!321155) b!524097))

(assert (= (and b!524097 res!321160) b!524106))

(assert (= (and b!524106 res!321163) b!524098))

(assert (= (and b!524098 res!321153) b!524099))

(assert (= (and b!524098 (not res!321156)) b!524107))

(assert (= (and b!524107 (not res!321161)) b!524103))

(assert (= (and b!524103 c!61776) b!524096))

(assert (= (and b!524103 (not c!61776)) b!524105))

(assert (= (and b!524096 res!321158) b!524102))

(declare-fun m!504247 () Bool)

(assert (=> b!524106 m!504247))

(declare-fun m!504249 () Bool)

(assert (=> b!524097 m!504249))

(declare-fun m!504251 () Bool)

(assert (=> b!524099 m!504251))

(assert (=> b!524099 m!504251))

(declare-fun m!504253 () Bool)

(assert (=> b!524099 m!504253))

(declare-fun m!504255 () Bool)

(assert (=> b!524096 m!504255))

(declare-fun m!504257 () Bool)

(assert (=> b!524096 m!504257))

(declare-fun m!504259 () Bool)

(assert (=> b!524095 m!504259))

(declare-fun m!504261 () Bool)

(assert (=> b!524094 m!504261))

(assert (=> b!524101 m!504251))

(assert (=> b!524101 m!504251))

(declare-fun m!504263 () Bool)

(assert (=> b!524101 m!504263))

(assert (=> b!524098 m!504251))

(declare-fun m!504265 () Bool)

(assert (=> b!524098 m!504265))

(declare-fun m!504267 () Bool)

(assert (=> b!524098 m!504267))

(declare-fun m!504269 () Bool)

(assert (=> b!524098 m!504269))

(assert (=> b!524098 m!504251))

(declare-fun m!504271 () Bool)

(assert (=> b!524098 m!504271))

(assert (=> b!524098 m!504251))

(declare-fun m!504273 () Bool)

(assert (=> b!524098 m!504273))

(declare-fun m!504275 () Bool)

(assert (=> b!524098 m!504275))

(declare-fun m!504277 () Bool)

(assert (=> b!524098 m!504277))

(declare-fun m!504279 () Bool)

(assert (=> b!524098 m!504279))

(declare-fun m!504281 () Bool)

(assert (=> b!524100 m!504281))

(declare-fun m!504283 () Bool)

(assert (=> b!524103 m!504283))

(assert (=> b!524103 m!504251))

(declare-fun m!504285 () Bool)

(assert (=> start!47682 m!504285))

(declare-fun m!504287 () Bool)

(assert (=> start!47682 m!504287))

(check-sat (not b!524096) (not b!524094) (not b!524098) (not b!524100) (not b!524106) (not b!524095) (not b!524101) (not b!524097) (not b!524099) (not start!47682))
(check-sat)
