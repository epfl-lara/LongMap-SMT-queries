; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32660 () Bool)

(assert start!32660)

(declare-fun b!326136 () Bool)

(declare-fun res!179320 () Bool)

(declare-fun e!200842 () Bool)

(assert (=> b!326136 (=> (not res!179320) (not e!200842))))

(declare-datatypes ((array!16701 0))(
  ( (array!16702 (arr!7905 (Array (_ BitVec 32) (_ BitVec 64))) (size!8258 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16701)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326136 (= res!179320 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326137 () Bool)

(declare-fun e!200843 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326137 (= e!200843 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10082 0))(
  ( (Unit!10083) )
))
(declare-fun lt!157085 () Unit!10082)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10082)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326137 (= lt!157085 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!179313 () Bool)

(assert (=> start!32660 (=> (not res!179313) (not e!200842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32660 (= res!179313 (validMask!0 mask!3777))))

(assert (=> start!32660 e!200842))

(declare-fun array_inv!5877 (array!16701) Bool)

(assert (=> start!32660 (array_inv!5877 a!3305)))

(assert (=> start!32660 true))

(declare-fun b!326138 () Bool)

(declare-fun res!179314 () Bool)

(assert (=> b!326138 (=> (not res!179314) (not e!200843))))

(assert (=> b!326138 (= res!179314 (and (= (select (arr!7905 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8258 a!3305))))))

(declare-fun b!326139 () Bool)

(declare-fun res!179317 () Bool)

(assert (=> b!326139 (=> (not res!179317) (not e!200842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16701 (_ BitVec 32)) Bool)

(assert (=> b!326139 (= res!179317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326140 () Bool)

(declare-fun res!179322 () Bool)

(assert (=> b!326140 (=> (not res!179322) (not e!200842))))

(assert (=> b!326140 (= res!179322 (and (= (size!8258 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8258 a!3305))))))

(declare-fun b!326141 () Bool)

(declare-fun res!179321 () Bool)

(assert (=> b!326141 (=> (not res!179321) (not e!200843))))

(declare-datatypes ((SeekEntryResult!3035 0))(
  ( (MissingZero!3035 (index!14316 (_ BitVec 32))) (Found!3035 (index!14317 (_ BitVec 32))) (Intermediate!3035 (undefined!3847 Bool) (index!14318 (_ BitVec 32)) (x!32580 (_ BitVec 32))) (Undefined!3035) (MissingVacant!3035 (index!14319 (_ BitVec 32))) )
))
(declare-fun lt!157084 () SeekEntryResult!3035)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16701 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!326141 (= res!179321 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157084))))

(declare-fun b!326142 () Bool)

(declare-fun res!179316 () Bool)

(assert (=> b!326142 (=> (not res!179316) (not e!200842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326142 (= res!179316 (validKeyInArray!0 k0!2497))))

(declare-fun b!326143 () Bool)

(declare-fun res!179319 () Bool)

(assert (=> b!326143 (=> (not res!179319) (not e!200843))))

(assert (=> b!326143 (= res!179319 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7905 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326144 () Bool)

(assert (=> b!326144 (= e!200842 e!200843)))

(declare-fun res!179318 () Bool)

(assert (=> b!326144 (=> (not res!179318) (not e!200843))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326144 (= res!179318 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157084))))

(assert (=> b!326144 (= lt!157084 (Intermediate!3035 false resIndex!58 resX!58))))

(declare-fun b!326145 () Bool)

(declare-fun res!179315 () Bool)

(assert (=> b!326145 (=> (not res!179315) (not e!200842))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16701 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!326145 (= res!179315 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3035 i!1250)))))

(assert (= (and start!32660 res!179313) b!326140))

(assert (= (and b!326140 res!179322) b!326142))

(assert (= (and b!326142 res!179316) b!326136))

(assert (= (and b!326136 res!179320) b!326145))

(assert (= (and b!326145 res!179315) b!326139))

(assert (= (and b!326139 res!179317) b!326144))

(assert (= (and b!326144 res!179318) b!326138))

(assert (= (and b!326138 res!179314) b!326141))

(assert (= (and b!326141 res!179321) b!326143))

(assert (= (and b!326143 res!179319) b!326137))

(declare-fun m!332233 () Bool)

(assert (=> b!326136 m!332233))

(declare-fun m!332235 () Bool)

(assert (=> b!326137 m!332235))

(assert (=> b!326137 m!332235))

(declare-fun m!332237 () Bool)

(assert (=> b!326137 m!332237))

(declare-fun m!332239 () Bool)

(assert (=> b!326138 m!332239))

(declare-fun m!332241 () Bool)

(assert (=> b!326144 m!332241))

(assert (=> b!326144 m!332241))

(declare-fun m!332243 () Bool)

(assert (=> b!326144 m!332243))

(declare-fun m!332245 () Bool)

(assert (=> b!326142 m!332245))

(declare-fun m!332247 () Bool)

(assert (=> b!326139 m!332247))

(declare-fun m!332249 () Bool)

(assert (=> b!326141 m!332249))

(declare-fun m!332251 () Bool)

(assert (=> b!326145 m!332251))

(declare-fun m!332253 () Bool)

(assert (=> b!326143 m!332253))

(declare-fun m!332255 () Bool)

(assert (=> start!32660 m!332255))

(declare-fun m!332257 () Bool)

(assert (=> start!32660 m!332257))

(check-sat (not b!326136) (not start!32660) (not b!326142) (not b!326139) (not b!326145) (not b!326141) (not b!326144) (not b!326137))
(check-sat)
