; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86542 () Bool)

(assert start!86542)

(declare-fun b!1000321 () Bool)

(declare-fun e!564125 () Bool)

(declare-fun e!564123 () Bool)

(assert (=> b!1000321 (= e!564125 e!564123)))

(declare-fun res!669236 () Bool)

(assert (=> b!1000321 (=> (not res!669236) (not e!564123))))

(declare-datatypes ((array!63213 0))(
  ( (array!63214 (arr!30427 (Array (_ BitVec 32) (_ BitVec 64))) (size!30930 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63213)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9295 0))(
  ( (MissingZero!9295 (index!39551 (_ BitVec 32))) (Found!9295 (index!39552 (_ BitVec 32))) (Intermediate!9295 (undefined!10107 Bool) (index!39553 (_ BitVec 32)) (x!87145 (_ BitVec 32))) (Undefined!9295) (MissingVacant!9295 (index!39554 (_ BitVec 32))) )
))
(declare-fun lt!442381 () SeekEntryResult!9295)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63213 (_ BitVec 32)) SeekEntryResult!9295)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000321 (= res!669236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30427 a!3219) j!170) mask!3464) (select (arr!30427 a!3219) j!170) a!3219 mask!3464) lt!442381))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000321 (= lt!442381 (Intermediate!9295 false resIndex!38 resX!38))))

(declare-fun b!1000322 () Bool)

(declare-fun res!669240 () Bool)

(assert (=> b!1000322 (=> (not res!669240) (not e!564125))))

(declare-datatypes ((List!21074 0))(
  ( (Nil!21071) (Cons!21070 (h!22253 (_ BitVec 64)) (t!30067 List!21074)) )
))
(declare-fun arrayNoDuplicates!0 (array!63213 (_ BitVec 32) List!21074) Bool)

(assert (=> b!1000322 (= res!669240 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21071))))

(declare-fun b!1000323 () Bool)

(declare-fun res!669233 () Bool)

(assert (=> b!1000323 (=> (not res!669233) (not e!564123))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000323 (= res!669233 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30427 a!3219) j!170) a!3219 mask!3464) lt!442381))))

(declare-fun b!1000324 () Bool)

(declare-fun e!564126 () Bool)

(assert (=> b!1000324 (= e!564126 e!564125)))

(declare-fun res!669241 () Bool)

(assert (=> b!1000324 (=> (not res!669241) (not e!564125))))

(declare-fun lt!442380 () SeekEntryResult!9295)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000324 (= res!669241 (or (= lt!442380 (MissingVacant!9295 i!1194)) (= lt!442380 (MissingZero!9295 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63213 (_ BitVec 32)) SeekEntryResult!9295)

(assert (=> b!1000324 (= lt!442380 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000325 () Bool)

(declare-fun res!669239 () Bool)

(assert (=> b!1000325 (=> (not res!669239) (not e!564125))))

(assert (=> b!1000325 (= res!669239 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30930 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30930 a!3219))))))

(declare-fun b!1000326 () Bool)

(declare-fun res!669235 () Bool)

(assert (=> b!1000326 (=> (not res!669235) (not e!564126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000326 (= res!669235 (validKeyInArray!0 (select (arr!30427 a!3219) j!170)))))

(declare-fun b!1000327 () Bool)

(declare-fun res!669238 () Bool)

(assert (=> b!1000327 (=> (not res!669238) (not e!564126))))

(assert (=> b!1000327 (= res!669238 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000328 () Bool)

(declare-fun res!669234 () Bool)

(assert (=> b!1000328 (=> (not res!669234) (not e!564126))))

(declare-fun arrayContainsKey!0 (array!63213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000328 (= res!669234 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!669242 () Bool)

(assert (=> start!86542 (=> (not res!669242) (not e!564126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86542 (= res!669242 (validMask!0 mask!3464))))

(assert (=> start!86542 e!564126))

(declare-fun array_inv!23563 (array!63213) Bool)

(assert (=> start!86542 (array_inv!23563 a!3219)))

(assert (=> start!86542 true))

(declare-fun b!1000320 () Bool)

(declare-fun res!669237 () Bool)

(assert (=> b!1000320 (=> (not res!669237) (not e!564125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63213 (_ BitVec 32)) Bool)

(assert (=> b!1000320 (= res!669237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000329 () Bool)

(assert (=> b!1000329 (= e!564123 false)))

(declare-fun lt!442382 () (_ BitVec 32))

(assert (=> b!1000329 (= lt!442382 (toIndex!0 (select (store (arr!30427 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1000330 () Bool)

(declare-fun res!669232 () Bool)

(assert (=> b!1000330 (=> (not res!669232) (not e!564126))))

(assert (=> b!1000330 (= res!669232 (and (= (size!30930 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30930 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30930 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86542 res!669242) b!1000330))

(assert (= (and b!1000330 res!669232) b!1000326))

(assert (= (and b!1000326 res!669235) b!1000327))

(assert (= (and b!1000327 res!669238) b!1000328))

(assert (= (and b!1000328 res!669234) b!1000324))

(assert (= (and b!1000324 res!669241) b!1000320))

(assert (= (and b!1000320 res!669237) b!1000322))

(assert (= (and b!1000322 res!669240) b!1000325))

(assert (= (and b!1000325 res!669239) b!1000321))

(assert (= (and b!1000321 res!669236) b!1000323))

(assert (= (and b!1000323 res!669233) b!1000329))

(declare-fun m!926975 () Bool)

(assert (=> b!1000322 m!926975))

(declare-fun m!926977 () Bool)

(assert (=> b!1000320 m!926977))

(declare-fun m!926979 () Bool)

(assert (=> b!1000329 m!926979))

(declare-fun m!926981 () Bool)

(assert (=> b!1000329 m!926981))

(assert (=> b!1000329 m!926981))

(declare-fun m!926983 () Bool)

(assert (=> b!1000329 m!926983))

(declare-fun m!926985 () Bool)

(assert (=> b!1000324 m!926985))

(declare-fun m!926987 () Bool)

(assert (=> start!86542 m!926987))

(declare-fun m!926989 () Bool)

(assert (=> start!86542 m!926989))

(declare-fun m!926991 () Bool)

(assert (=> b!1000321 m!926991))

(assert (=> b!1000321 m!926991))

(declare-fun m!926993 () Bool)

(assert (=> b!1000321 m!926993))

(assert (=> b!1000321 m!926993))

(assert (=> b!1000321 m!926991))

(declare-fun m!926995 () Bool)

(assert (=> b!1000321 m!926995))

(declare-fun m!926997 () Bool)

(assert (=> b!1000327 m!926997))

(assert (=> b!1000326 m!926991))

(assert (=> b!1000326 m!926991))

(declare-fun m!926999 () Bool)

(assert (=> b!1000326 m!926999))

(assert (=> b!1000323 m!926991))

(assert (=> b!1000323 m!926991))

(declare-fun m!927001 () Bool)

(assert (=> b!1000323 m!927001))

(declare-fun m!927003 () Bool)

(assert (=> b!1000328 m!927003))

(check-sat (not b!1000329) (not start!86542) (not b!1000321) (not b!1000328) (not b!1000324) (not b!1000320) (not b!1000323) (not b!1000327) (not b!1000326) (not b!1000322))
(check-sat)
