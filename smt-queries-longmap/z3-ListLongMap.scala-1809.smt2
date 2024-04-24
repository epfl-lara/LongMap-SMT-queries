; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32648 () Bool)

(assert start!32648)

(declare-fun b!326178 () Bool)

(declare-fun e!200931 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!326178 (= e!200931 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((array!16698 0))(
  ( (array!16699 (arr!7903 (Array (_ BitVec 32) (_ BitVec 64))) (size!8255 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16698)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((Unit!10066 0))(
  ( (Unit!10067) )
))
(declare-fun lt!157301 () Unit!10066)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16698 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10066)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326178 (= lt!157301 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326179 () Bool)

(declare-fun res!179266 () Bool)

(declare-fun e!200930 () Bool)

(assert (=> b!326179 (=> (not res!179266) (not e!200930))))

(declare-datatypes ((SeekEntryResult!2999 0))(
  ( (MissingZero!2999 (index!14172 (_ BitVec 32))) (Found!2999 (index!14173 (_ BitVec 32))) (Intermediate!2999 (undefined!3811 Bool) (index!14174 (_ BitVec 32)) (x!32530 (_ BitVec 32))) (Undefined!2999) (MissingVacant!2999 (index!14175 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16698 (_ BitVec 32)) SeekEntryResult!2999)

(assert (=> b!326179 (= res!179266 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2999 i!1250)))))

(declare-fun b!326180 () Bool)

(declare-fun res!179259 () Bool)

(assert (=> b!326180 (=> (not res!179259) (not e!200930))))

(declare-fun arrayContainsKey!0 (array!16698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326180 (= res!179259 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326181 () Bool)

(declare-fun res!179260 () Bool)

(assert (=> b!326181 (=> (not res!179260) (not e!200931))))

(assert (=> b!326181 (= res!179260 (and (= (select (arr!7903 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8255 a!3305))))))

(declare-fun b!326182 () Bool)

(declare-fun res!179263 () Bool)

(assert (=> b!326182 (=> (not res!179263) (not e!200931))))

(declare-fun lt!157302 () SeekEntryResult!2999)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16698 (_ BitVec 32)) SeekEntryResult!2999)

(assert (=> b!326182 (= res!179263 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157302))))

(declare-fun b!326183 () Bool)

(declare-fun res!179261 () Bool)

(assert (=> b!326183 (=> (not res!179261) (not e!200930))))

(assert (=> b!326183 (= res!179261 (and (= (size!8255 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8255 a!3305))))))

(declare-fun b!326184 () Bool)

(assert (=> b!326184 (= e!200930 e!200931)))

(declare-fun res!179264 () Bool)

(assert (=> b!326184 (=> (not res!179264) (not e!200931))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326184 (= res!179264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157302))))

(assert (=> b!326184 (= lt!157302 (Intermediate!2999 false resIndex!58 resX!58))))

(declare-fun b!326185 () Bool)

(declare-fun res!179265 () Bool)

(assert (=> b!326185 (=> (not res!179265) (not e!200930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16698 (_ BitVec 32)) Bool)

(assert (=> b!326185 (= res!179265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179267 () Bool)

(assert (=> start!32648 (=> (not res!179267) (not e!200930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32648 (= res!179267 (validMask!0 mask!3777))))

(assert (=> start!32648 e!200930))

(declare-fun array_inv!5853 (array!16698) Bool)

(assert (=> start!32648 (array_inv!5853 a!3305)))

(assert (=> start!32648 true))

(declare-fun b!326186 () Bool)

(declare-fun res!179262 () Bool)

(assert (=> b!326186 (=> (not res!179262) (not e!200931))))

(assert (=> b!326186 (= res!179262 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7903 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326187 () Bool)

(declare-fun res!179268 () Bool)

(assert (=> b!326187 (=> (not res!179268) (not e!200930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326187 (= res!179268 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32648 res!179267) b!326183))

(assert (= (and b!326183 res!179261) b!326187))

(assert (= (and b!326187 res!179268) b!326180))

(assert (= (and b!326180 res!179259) b!326179))

(assert (= (and b!326179 res!179266) b!326185))

(assert (= (and b!326185 res!179265) b!326184))

(assert (= (and b!326184 res!179264) b!326181))

(assert (= (and b!326181 res!179260) b!326182))

(assert (= (and b!326182 res!179263) b!326186))

(assert (= (and b!326186 res!179262) b!326178))

(declare-fun m!333001 () Bool)

(assert (=> b!326184 m!333001))

(assert (=> b!326184 m!333001))

(declare-fun m!333003 () Bool)

(assert (=> b!326184 m!333003))

(declare-fun m!333005 () Bool)

(assert (=> b!326179 m!333005))

(declare-fun m!333007 () Bool)

(assert (=> b!326185 m!333007))

(declare-fun m!333009 () Bool)

(assert (=> b!326181 m!333009))

(declare-fun m!333011 () Bool)

(assert (=> b!326178 m!333011))

(assert (=> b!326178 m!333011))

(declare-fun m!333013 () Bool)

(assert (=> b!326178 m!333013))

(declare-fun m!333015 () Bool)

(assert (=> start!32648 m!333015))

(declare-fun m!333017 () Bool)

(assert (=> start!32648 m!333017))

(declare-fun m!333019 () Bool)

(assert (=> b!326187 m!333019))

(declare-fun m!333021 () Bool)

(assert (=> b!326182 m!333021))

(declare-fun m!333023 () Bool)

(assert (=> b!326186 m!333023))

(declare-fun m!333025 () Bool)

(assert (=> b!326180 m!333025))

(check-sat (not b!326185) (not b!326179) (not b!326178) (not b!326184) (not b!326182) (not start!32648) (not b!326180) (not b!326187))
(check-sat)
