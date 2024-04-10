; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32674 () Bool)

(assert start!32674)

(declare-fun b!326411 () Bool)

(declare-fun res!179445 () Bool)

(declare-fun e!201019 () Bool)

(assert (=> b!326411 (=> (not res!179445) (not e!201019))))

(declare-datatypes ((array!16711 0))(
  ( (array!16712 (arr!7910 (Array (_ BitVec 32) (_ BitVec 64))) (size!8262 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16711)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3041 0))(
  ( (MissingZero!3041 (index!14340 (_ BitVec 32))) (Found!3041 (index!14341 (_ BitVec 32))) (Intermediate!3041 (undefined!3853 Bool) (index!14342 (_ BitVec 32)) (x!32591 (_ BitVec 32))) (Undefined!3041) (MissingVacant!3041 (index!14343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16711 (_ BitVec 32)) SeekEntryResult!3041)

(assert (=> b!326411 (= res!179445 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3041 i!1250)))))

(declare-fun b!326413 () Bool)

(declare-fun e!201018 () Bool)

(assert (=> b!326413 (= e!201019 e!201018)))

(declare-fun res!179448 () Bool)

(assert (=> b!326413 (=> (not res!179448) (not e!201018))))

(declare-fun lt!157319 () SeekEntryResult!3041)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16711 (_ BitVec 32)) SeekEntryResult!3041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326413 (= res!179448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157319))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326413 (= lt!157319 (Intermediate!3041 false resIndex!58 resX!58))))

(declare-fun b!326414 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326414 (= e!201018 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10116 0))(
  ( (Unit!10117) )
))
(declare-fun lt!157320 () Unit!10116)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16711 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10116)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326414 (= lt!157320 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326415 () Bool)

(declare-fun res!179447 () Bool)

(assert (=> b!326415 (=> (not res!179447) (not e!201018))))

(assert (=> b!326415 (= res!179447 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157319))))

(declare-fun b!326416 () Bool)

(declare-fun res!179446 () Bool)

(assert (=> b!326416 (=> (not res!179446) (not e!201019))))

(assert (=> b!326416 (= res!179446 (and (= (size!8262 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8262 a!3305))))))

(declare-fun b!326417 () Bool)

(declare-fun res!179449 () Bool)

(assert (=> b!326417 (=> (not res!179449) (not e!201018))))

(assert (=> b!326417 (= res!179449 (and (= (select (arr!7910 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8262 a!3305))))))

(declare-fun b!326418 () Bool)

(declare-fun res!179444 () Bool)

(assert (=> b!326418 (=> (not res!179444) (not e!201019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16711 (_ BitVec 32)) Bool)

(assert (=> b!326418 (= res!179444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326412 () Bool)

(declare-fun res!179450 () Bool)

(assert (=> b!326412 (=> (not res!179450) (not e!201019))))

(declare-fun arrayContainsKey!0 (array!16711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326412 (= res!179450 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179443 () Bool)

(assert (=> start!32674 (=> (not res!179443) (not e!201019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32674 (= res!179443 (validMask!0 mask!3777))))

(assert (=> start!32674 e!201019))

(declare-fun array_inv!5873 (array!16711) Bool)

(assert (=> start!32674 (array_inv!5873 a!3305)))

(assert (=> start!32674 true))

(declare-fun b!326419 () Bool)

(declare-fun res!179451 () Bool)

(assert (=> b!326419 (=> (not res!179451) (not e!201018))))

(assert (=> b!326419 (= res!179451 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7910 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326420 () Bool)

(declare-fun res!179442 () Bool)

(assert (=> b!326420 (=> (not res!179442) (not e!201019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326420 (= res!179442 (validKeyInArray!0 k!2497))))

(assert (= (and start!32674 res!179443) b!326416))

(assert (= (and b!326416 res!179446) b!326420))

(assert (= (and b!326420 res!179442) b!326412))

(assert (= (and b!326412 res!179450) b!326411))

(assert (= (and b!326411 res!179445) b!326418))

(assert (= (and b!326418 res!179444) b!326413))

(assert (= (and b!326413 res!179448) b!326417))

(assert (= (and b!326417 res!179449) b!326415))

(assert (= (and b!326415 res!179447) b!326419))

(assert (= (and b!326419 res!179451) b!326414))

(declare-fun m!332963 () Bool)

(assert (=> b!326412 m!332963))

(declare-fun m!332965 () Bool)

(assert (=> start!32674 m!332965))

(declare-fun m!332967 () Bool)

(assert (=> start!32674 m!332967))

(declare-fun m!332969 () Bool)

(assert (=> b!326417 m!332969))

(declare-fun m!332971 () Bool)

(assert (=> b!326415 m!332971))

(declare-fun m!332973 () Bool)

(assert (=> b!326414 m!332973))

(assert (=> b!326414 m!332973))

(declare-fun m!332975 () Bool)

(assert (=> b!326414 m!332975))

(declare-fun m!332977 () Bool)

(assert (=> b!326419 m!332977))

(declare-fun m!332979 () Bool)

(assert (=> b!326413 m!332979))

(assert (=> b!326413 m!332979))

(declare-fun m!332981 () Bool)

(assert (=> b!326413 m!332981))

(declare-fun m!332983 () Bool)

(assert (=> b!326420 m!332983))

(declare-fun m!332985 () Bool)

(assert (=> b!326418 m!332985))

(declare-fun m!332987 () Bool)

(assert (=> b!326411 m!332987))

(push 1)

(assert (not b!326415))

(assert (not b!326420))

(assert (not b!326418))

(assert (not start!32674))

(assert (not b!326412))

(assert (not b!326414))

(assert (not b!326413))

(assert (not b!326411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

