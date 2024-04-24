; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47384 () Bool)

(assert start!47384)

(declare-fun b!521181 () Bool)

(declare-fun res!319062 () Bool)

(declare-fun e!304077 () Bool)

(assert (=> b!521181 (=> (not res!319062) (not e!304077))))

(declare-datatypes ((array!33211 0))(
  ( (array!33212 (arr!15961 (Array (_ BitVec 32) (_ BitVec 64))) (size!16325 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33211)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521181 (= res!319062 (validKeyInArray!0 (select (arr!15961 a!3235) j!176)))))

(declare-fun res!319069 () Bool)

(assert (=> start!47384 (=> (not res!319069) (not e!304077))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47384 (= res!319069 (validMask!0 mask!3524))))

(assert (=> start!47384 e!304077))

(assert (=> start!47384 true))

(declare-fun array_inv!11820 (array!33211) Bool)

(assert (=> start!47384 (array_inv!11820 a!3235)))

(declare-fun b!521182 () Bool)

(declare-fun e!304083 () Bool)

(assert (=> b!521182 (= e!304083 true)))

(declare-datatypes ((SeekEntryResult!4384 0))(
  ( (MissingZero!4384 (index!19739 (_ BitVec 32))) (Found!4384 (index!19740 (_ BitVec 32))) (Intermediate!4384 (undefined!5196 Bool) (index!19741 (_ BitVec 32)) (x!48871 (_ BitVec 32))) (Undefined!4384) (MissingVacant!4384 (index!19742 (_ BitVec 32))) )
))
(declare-fun lt!238849 () SeekEntryResult!4384)

(assert (=> b!521182 (and (or (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16147 0))(
  ( (Unit!16148) )
))
(declare-fun lt!238852 () Unit!16147)

(declare-fun e!304082 () Unit!16147)

(assert (=> b!521182 (= lt!238852 e!304082)))

(declare-fun c!61361 () Bool)

(assert (=> b!521182 (= c!61361 (= (select (arr!15961 a!3235) (index!19741 lt!238849)) (select (arr!15961 a!3235) j!176)))))

(assert (=> b!521182 (and (bvslt (x!48871 lt!238849) #b01111111111111111111111111111110) (or (= (select (arr!15961 a!3235) (index!19741 lt!238849)) (select (arr!15961 a!3235) j!176)) (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15961 a!3235) (index!19741 lt!238849)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521183 () Bool)

(declare-fun res!319066 () Bool)

(assert (=> b!521183 (=> (not res!319066) (not e!304077))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521183 (= res!319066 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521184 () Bool)

(declare-fun Unit!16149 () Unit!16147)

(assert (=> b!521184 (= e!304082 Unit!16149)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238850 () (_ BitVec 32))

(declare-fun lt!238846 () Unit!16147)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16147)

(assert (=> b!521184 (= lt!238846 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238850 #b00000000000000000000000000000000 (index!19741 lt!238849) (x!48871 lt!238849) mask!3524))))

(declare-fun res!319067 () Bool)

(declare-fun lt!238845 () array!33211)

(declare-fun lt!238847 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33211 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!521184 (= res!319067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238850 lt!238847 lt!238845 mask!3524) (Intermediate!4384 false (index!19741 lt!238849) (x!48871 lt!238849))))))

(declare-fun e!304079 () Bool)

(assert (=> b!521184 (=> (not res!319067) (not e!304079))))

(assert (=> b!521184 e!304079))

(declare-fun b!521185 () Bool)

(declare-fun Unit!16150 () Unit!16147)

(assert (=> b!521185 (= e!304082 Unit!16150)))

(declare-fun b!521186 () Bool)

(declare-fun res!319071 () Bool)

(declare-fun e!304078 () Bool)

(assert (=> b!521186 (=> (not res!319071) (not e!304078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33211 (_ BitVec 32)) Bool)

(assert (=> b!521186 (= res!319071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521187 () Bool)

(declare-fun res!319070 () Bool)

(assert (=> b!521187 (=> res!319070 e!304083)))

(get-info :version)

(assert (=> b!521187 (= res!319070 (or (undefined!5196 lt!238849) (not ((_ is Intermediate!4384) lt!238849))))))

(declare-fun e!304080 () Bool)

(declare-fun b!521188 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33211 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!521188 (= e!304080 (= (seekEntryOrOpen!0 (select (arr!15961 a!3235) j!176) a!3235 mask!3524) (Found!4384 j!176)))))

(declare-fun b!521189 () Bool)

(assert (=> b!521189 (= e!304077 e!304078)))

(declare-fun res!319063 () Bool)

(assert (=> b!521189 (=> (not res!319063) (not e!304078))))

(declare-fun lt!238851 () SeekEntryResult!4384)

(assert (=> b!521189 (= res!319063 (or (= lt!238851 (MissingZero!4384 i!1204)) (= lt!238851 (MissingVacant!4384 i!1204))))))

(assert (=> b!521189 (= lt!238851 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521190 () Bool)

(assert (=> b!521190 (= e!304079 false)))

(declare-fun b!521191 () Bool)

(declare-fun res!319064 () Bool)

(assert (=> b!521191 (=> (not res!319064) (not e!304077))))

(assert (=> b!521191 (= res!319064 (validKeyInArray!0 k0!2280))))

(declare-fun b!521192 () Bool)

(declare-fun res!319072 () Bool)

(assert (=> b!521192 (=> (not res!319072) (not e!304078))))

(declare-datatypes ((List!10026 0))(
  ( (Nil!10023) (Cons!10022 (h!10944 (_ BitVec 64)) (t!16246 List!10026)) )
))
(declare-fun arrayNoDuplicates!0 (array!33211 (_ BitVec 32) List!10026) Bool)

(assert (=> b!521192 (= res!319072 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10023))))

(declare-fun b!521193 () Bool)

(assert (=> b!521193 (= e!304078 (not e!304083))))

(declare-fun res!319061 () Bool)

(assert (=> b!521193 (=> res!319061 e!304083)))

(declare-fun lt!238844 () (_ BitVec 32))

(assert (=> b!521193 (= res!319061 (= lt!238849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238844 lt!238847 lt!238845 mask!3524)))))

(assert (=> b!521193 (= lt!238849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238850 (select (arr!15961 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521193 (= lt!238844 (toIndex!0 lt!238847 mask!3524))))

(assert (=> b!521193 (= lt!238847 (select (store (arr!15961 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521193 (= lt!238850 (toIndex!0 (select (arr!15961 a!3235) j!176) mask!3524))))

(assert (=> b!521193 (= lt!238845 (array!33212 (store (arr!15961 a!3235) i!1204 k0!2280) (size!16325 a!3235)))))

(assert (=> b!521193 e!304080))

(declare-fun res!319065 () Bool)

(assert (=> b!521193 (=> (not res!319065) (not e!304080))))

(assert (=> b!521193 (= res!319065 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238848 () Unit!16147)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16147)

(assert (=> b!521193 (= lt!238848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521194 () Bool)

(declare-fun res!319068 () Bool)

(assert (=> b!521194 (=> (not res!319068) (not e!304077))))

(assert (=> b!521194 (= res!319068 (and (= (size!16325 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16325 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16325 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47384 res!319069) b!521194))

(assert (= (and b!521194 res!319068) b!521181))

(assert (= (and b!521181 res!319062) b!521191))

(assert (= (and b!521191 res!319064) b!521183))

(assert (= (and b!521183 res!319066) b!521189))

(assert (= (and b!521189 res!319063) b!521186))

(assert (= (and b!521186 res!319071) b!521192))

(assert (= (and b!521192 res!319072) b!521193))

(assert (= (and b!521193 res!319065) b!521188))

(assert (= (and b!521193 (not res!319061)) b!521187))

(assert (= (and b!521187 (not res!319070)) b!521182))

(assert (= (and b!521182 c!61361) b!521184))

(assert (= (and b!521182 (not c!61361)) b!521185))

(assert (= (and b!521184 res!319067) b!521190))

(declare-fun m!502339 () Bool)

(assert (=> b!521186 m!502339))

(declare-fun m!502341 () Bool)

(assert (=> b!521189 m!502341))

(declare-fun m!502343 () Bool)

(assert (=> b!521193 m!502343))

(declare-fun m!502345 () Bool)

(assert (=> b!521193 m!502345))

(declare-fun m!502347 () Bool)

(assert (=> b!521193 m!502347))

(declare-fun m!502349 () Bool)

(assert (=> b!521193 m!502349))

(declare-fun m!502351 () Bool)

(assert (=> b!521193 m!502351))

(assert (=> b!521193 m!502343))

(declare-fun m!502353 () Bool)

(assert (=> b!521193 m!502353))

(assert (=> b!521193 m!502343))

(declare-fun m!502355 () Bool)

(assert (=> b!521193 m!502355))

(declare-fun m!502357 () Bool)

(assert (=> b!521193 m!502357))

(declare-fun m!502359 () Bool)

(assert (=> b!521193 m!502359))

(declare-fun m!502361 () Bool)

(assert (=> b!521183 m!502361))

(declare-fun m!502363 () Bool)

(assert (=> b!521184 m!502363))

(declare-fun m!502365 () Bool)

(assert (=> b!521184 m!502365))

(assert (=> b!521181 m!502343))

(assert (=> b!521181 m!502343))

(declare-fun m!502367 () Bool)

(assert (=> b!521181 m!502367))

(declare-fun m!502369 () Bool)

(assert (=> start!47384 m!502369))

(declare-fun m!502371 () Bool)

(assert (=> start!47384 m!502371))

(assert (=> b!521188 m!502343))

(assert (=> b!521188 m!502343))

(declare-fun m!502373 () Bool)

(assert (=> b!521188 m!502373))

(declare-fun m!502375 () Bool)

(assert (=> b!521192 m!502375))

(declare-fun m!502377 () Bool)

(assert (=> b!521191 m!502377))

(declare-fun m!502379 () Bool)

(assert (=> b!521182 m!502379))

(assert (=> b!521182 m!502343))

(check-sat (not b!521192) (not b!521181) (not b!521191) (not b!521188) (not b!521184) (not b!521189) (not b!521186) (not b!521183) (not b!521193) (not start!47384))
(check-sat)
