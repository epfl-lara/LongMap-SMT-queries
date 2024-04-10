; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32670 () Bool)

(assert start!32670)

(declare-fun res!179389 () Bool)

(declare-fun e!200999 () Bool)

(assert (=> start!32670 (=> (not res!179389) (not e!200999))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32670 (= res!179389 (validMask!0 mask!3777))))

(assert (=> start!32670 e!200999))

(declare-datatypes ((array!16707 0))(
  ( (array!16708 (arr!7908 (Array (_ BitVec 32) (_ BitVec 64))) (size!8260 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16707)

(declare-fun array_inv!5871 (array!16707) Bool)

(assert (=> start!32670 (array_inv!5871 a!3305)))

(assert (=> start!32670 true))

(declare-fun b!326351 () Bool)

(declare-fun res!179391 () Bool)

(assert (=> b!326351 (=> (not res!179391) (not e!200999))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326351 (= res!179391 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326352 () Bool)

(declare-fun res!179390 () Bool)

(assert (=> b!326352 (=> (not res!179390) (not e!200999))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326352 (= res!179390 (and (= (size!8260 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8260 a!3305))))))

(declare-fun b!326353 () Bool)

(declare-fun res!179382 () Bool)

(assert (=> b!326353 (=> (not res!179382) (not e!200999))))

(declare-datatypes ((SeekEntryResult!3039 0))(
  ( (MissingZero!3039 (index!14332 (_ BitVec 32))) (Found!3039 (index!14333 (_ BitVec 32))) (Intermediate!3039 (undefined!3851 Bool) (index!14334 (_ BitVec 32)) (x!32581 (_ BitVec 32))) (Undefined!3039) (MissingVacant!3039 (index!14335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16707 (_ BitVec 32)) SeekEntryResult!3039)

(assert (=> b!326353 (= res!179382 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3039 i!1250)))))

(declare-fun b!326354 () Bool)

(declare-fun res!179384 () Bool)

(declare-fun e!201001 () Bool)

(assert (=> b!326354 (=> (not res!179384) (not e!201001))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326354 (= res!179384 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7908 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326355 () Bool)

(declare-fun res!179387 () Bool)

(assert (=> b!326355 (=> (not res!179387) (not e!200999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16707 (_ BitVec 32)) Bool)

(assert (=> b!326355 (= res!179387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326356 () Bool)

(assert (=> b!326356 (= e!200999 e!201001)))

(declare-fun res!179386 () Bool)

(assert (=> b!326356 (=> (not res!179386) (not e!201001))))

(declare-fun lt!157308 () SeekEntryResult!3039)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16707 (_ BitVec 32)) SeekEntryResult!3039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326356 (= res!179386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157308))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326356 (= lt!157308 (Intermediate!3039 false resIndex!58 resX!58))))

(declare-fun b!326357 () Bool)

(declare-fun res!179383 () Bool)

(assert (=> b!326357 (=> (not res!179383) (not e!201001))))

(assert (=> b!326357 (= res!179383 (and (= (select (arr!7908 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8260 a!3305))))))

(declare-fun b!326358 () Bool)

(declare-fun res!179385 () Bool)

(assert (=> b!326358 (=> (not res!179385) (not e!200999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326358 (= res!179385 (validKeyInArray!0 k0!2497))))

(declare-fun b!326359 () Bool)

(declare-fun res!179388 () Bool)

(assert (=> b!326359 (=> (not res!179388) (not e!201001))))

(assert (=> b!326359 (= res!179388 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157308))))

(declare-fun b!326360 () Bool)

(assert (=> b!326360 (= e!201001 false)))

(declare-datatypes ((Unit!10112 0))(
  ( (Unit!10113) )
))
(declare-fun lt!157307 () Unit!10112)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10112)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326360 (= lt!157307 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32670 res!179389) b!326352))

(assert (= (and b!326352 res!179390) b!326358))

(assert (= (and b!326358 res!179385) b!326351))

(assert (= (and b!326351 res!179391) b!326353))

(assert (= (and b!326353 res!179382) b!326355))

(assert (= (and b!326355 res!179387) b!326356))

(assert (= (and b!326356 res!179386) b!326357))

(assert (= (and b!326357 res!179383) b!326359))

(assert (= (and b!326359 res!179388) b!326354))

(assert (= (and b!326354 res!179384) b!326360))

(declare-fun m!332911 () Bool)

(assert (=> b!326351 m!332911))

(declare-fun m!332913 () Bool)

(assert (=> b!326353 m!332913))

(declare-fun m!332915 () Bool)

(assert (=> b!326359 m!332915))

(declare-fun m!332917 () Bool)

(assert (=> b!326358 m!332917))

(declare-fun m!332919 () Bool)

(assert (=> b!326360 m!332919))

(assert (=> b!326360 m!332919))

(declare-fun m!332921 () Bool)

(assert (=> b!326360 m!332921))

(declare-fun m!332923 () Bool)

(assert (=> b!326354 m!332923))

(declare-fun m!332925 () Bool)

(assert (=> start!32670 m!332925))

(declare-fun m!332927 () Bool)

(assert (=> start!32670 m!332927))

(declare-fun m!332929 () Bool)

(assert (=> b!326355 m!332929))

(declare-fun m!332931 () Bool)

(assert (=> b!326357 m!332931))

(declare-fun m!332933 () Bool)

(assert (=> b!326356 m!332933))

(assert (=> b!326356 m!332933))

(declare-fun m!332935 () Bool)

(assert (=> b!326356 m!332935))

(check-sat (not b!326359) (not b!326355) (not b!326360) (not start!32670) (not b!326358) (not b!326353) (not b!326356) (not b!326351))
(check-sat)
