; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32336 () Bool)

(assert start!32336)

(declare-fun b!322047 () Bool)

(declare-fun res!176083 () Bool)

(declare-fun e!199410 () Bool)

(assert (=> b!322047 (=> (not res!176083) (not e!199410))))

(declare-datatypes ((array!16488 0))(
  ( (array!16489 (arr!7801 (Array (_ BitVec 32) (_ BitVec 64))) (size!8153 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16488)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2897 0))(
  ( (MissingZero!2897 (index!13764 (_ BitVec 32))) (Found!2897 (index!13765 (_ BitVec 32))) (Intermediate!2897 (undefined!3709 Bool) (index!13766 (_ BitVec 32)) (x!32138 (_ BitVec 32))) (Undefined!2897) (MissingVacant!2897 (index!13767 (_ BitVec 32))) )
))
(declare-fun lt!156401 () SeekEntryResult!2897)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16488 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!322047 (= res!176083 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156401))))

(declare-fun b!322048 () Bool)

(declare-fun res!176081 () Bool)

(declare-fun e!199409 () Bool)

(assert (=> b!322048 (=> (not res!176081) (not e!199409))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322048 (= res!176081 (and (= (size!8153 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8153 a!3305))))))

(declare-fun b!322049 () Bool)

(declare-fun res!176076 () Bool)

(assert (=> b!322049 (=> (not res!176076) (not e!199409))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16488 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!322049 (= res!176076 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2897 i!1250)))))

(declare-fun res!176078 () Bool)

(assert (=> start!32336 (=> (not res!176078) (not e!199409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32336 (= res!176078 (validMask!0 mask!3777))))

(assert (=> start!32336 e!199409))

(declare-fun array_inv!5751 (array!16488) Bool)

(assert (=> start!32336 (array_inv!5751 a!3305)))

(assert (=> start!32336 true))

(declare-fun b!322050 () Bool)

(assert (=> b!322050 (= e!199409 e!199410)))

(declare-fun res!176085 () Bool)

(assert (=> b!322050 (=> (not res!176085) (not e!199410))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322050 (= res!176085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156401))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322050 (= lt!156401 (Intermediate!2897 false resIndex!58 resX!58))))

(declare-fun b!322051 () Bool)

(declare-fun res!176079 () Bool)

(assert (=> b!322051 (=> (not res!176079) (not e!199410))))

(assert (=> b!322051 (= res!176079 (and (= (select (arr!7801 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8153 a!3305))))))

(declare-fun b!322052 () Bool)

(declare-fun res!176077 () Bool)

(assert (=> b!322052 (=> (not res!176077) (not e!199410))))

(assert (=> b!322052 (= res!176077 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7801 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7801 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7801 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322053 () Bool)

(declare-fun res!176082 () Bool)

(assert (=> b!322053 (=> (not res!176082) (not e!199409))))

(declare-fun arrayContainsKey!0 (array!16488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322053 (= res!176082 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun lt!156402 () (_ BitVec 32))

(declare-fun b!322054 () Bool)

(assert (=> b!322054 (= e!199410 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge lt!156402 #b00000000000000000000000000000000) (bvslt lt!156402 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322054 (= lt!156402 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!322055 () Bool)

(declare-fun res!176084 () Bool)

(assert (=> b!322055 (=> (not res!176084) (not e!199409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16488 (_ BitVec 32)) Bool)

(assert (=> b!322055 (= res!176084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322056 () Bool)

(declare-fun res!176080 () Bool)

(assert (=> b!322056 (=> (not res!176080) (not e!199409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322056 (= res!176080 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32336 res!176078) b!322048))

(assert (= (and b!322048 res!176081) b!322056))

(assert (= (and b!322056 res!176080) b!322053))

(assert (= (and b!322053 res!176082) b!322049))

(assert (= (and b!322049 res!176076) b!322055))

(assert (= (and b!322055 res!176084) b!322050))

(assert (= (and b!322050 res!176085) b!322051))

(assert (= (and b!322051 res!176079) b!322047))

(assert (= (and b!322047 res!176083) b!322052))

(assert (= (and b!322052 res!176077) b!322054))

(declare-fun m!330235 () Bool)

(assert (=> b!322056 m!330235))

(declare-fun m!330237 () Bool)

(assert (=> b!322049 m!330237))

(declare-fun m!330239 () Bool)

(assert (=> b!322050 m!330239))

(assert (=> b!322050 m!330239))

(declare-fun m!330241 () Bool)

(assert (=> b!322050 m!330241))

(declare-fun m!330243 () Bool)

(assert (=> start!32336 m!330243))

(declare-fun m!330245 () Bool)

(assert (=> start!32336 m!330245))

(declare-fun m!330247 () Bool)

(assert (=> b!322051 m!330247))

(declare-fun m!330249 () Bool)

(assert (=> b!322053 m!330249))

(declare-fun m!330251 () Bool)

(assert (=> b!322055 m!330251))

(declare-fun m!330253 () Bool)

(assert (=> b!322052 m!330253))

(declare-fun m!330255 () Bool)

(assert (=> b!322054 m!330255))

(declare-fun m!330257 () Bool)

(assert (=> b!322047 m!330257))

(check-sat (not b!322050) (not b!322055) (not b!322053) (not b!322049) (not b!322047) (not b!322054) (not start!32336) (not b!322056))
(check-sat)
