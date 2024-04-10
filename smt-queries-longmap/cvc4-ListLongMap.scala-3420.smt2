; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47446 () Bool)

(assert start!47446)

(declare-fun b!522334 () Bool)

(declare-fun res!320015 () Bool)

(declare-fun e!304663 () Bool)

(assert (=> b!522334 (=> (not res!320015) (not e!304663))))

(declare-datatypes ((array!33272 0))(
  ( (array!33273 (arr!15992 (Array (_ BitVec 32) (_ BitVec 64))) (size!16356 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33272)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33272 (_ BitVec 32)) Bool)

(assert (=> b!522334 (= res!320015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522335 () Bool)

(declare-fun res!320009 () Bool)

(declare-fun e!304668 () Bool)

(assert (=> b!522335 (=> (not res!320009) (not e!304668))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522335 (= res!320009 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522336 () Bool)

(declare-fun e!304664 () Bool)

(assert (=> b!522336 (= e!304664 true)))

(declare-datatypes ((SeekEntryResult!4459 0))(
  ( (MissingZero!4459 (index!20039 (_ BitVec 32))) (Found!4459 (index!20040 (_ BitVec 32))) (Intermediate!4459 (undefined!5271 Bool) (index!20041 (_ BitVec 32)) (x!49013 (_ BitVec 32))) (Undefined!4459) (MissingVacant!4459 (index!20042 (_ BitVec 32))) )
))
(declare-fun lt!239535 () SeekEntryResult!4459)

(assert (=> b!522336 (and (or (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16288 0))(
  ( (Unit!16289) )
))
(declare-fun lt!239536 () Unit!16288)

(declare-fun e!304662 () Unit!16288)

(assert (=> b!522336 (= lt!239536 e!304662)))

(declare-fun c!61466 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522336 (= c!61466 (= (select (arr!15992 a!3235) (index!20041 lt!239535)) (select (arr!15992 a!3235) j!176)))))

(assert (=> b!522336 (and (bvslt (x!49013 lt!239535) #b01111111111111111111111111111110) (or (= (select (arr!15992 a!3235) (index!20041 lt!239535)) (select (arr!15992 a!3235) j!176)) (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15992 a!3235) (index!20041 lt!239535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522337 () Bool)

(assert (=> b!522337 (= e!304663 (not e!304664))))

(declare-fun res!320006 () Bool)

(assert (=> b!522337 (=> res!320006 e!304664)))

(declare-fun lt!239534 () array!33272)

(declare-fun lt!239538 () (_ BitVec 32))

(declare-fun lt!239542 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33272 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!522337 (= res!320006 (= lt!239535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239538 lt!239542 lt!239534 mask!3524)))))

(declare-fun lt!239537 () (_ BitVec 32))

(assert (=> b!522337 (= lt!239535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239537 (select (arr!15992 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522337 (= lt!239538 (toIndex!0 lt!239542 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522337 (= lt!239542 (select (store (arr!15992 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522337 (= lt!239537 (toIndex!0 (select (arr!15992 a!3235) j!176) mask!3524))))

(assert (=> b!522337 (= lt!239534 (array!33273 (store (arr!15992 a!3235) i!1204 k!2280) (size!16356 a!3235)))))

(declare-fun e!304665 () Bool)

(assert (=> b!522337 e!304665))

(declare-fun res!320011 () Bool)

(assert (=> b!522337 (=> (not res!320011) (not e!304665))))

(assert (=> b!522337 (= res!320011 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239540 () Unit!16288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16288)

(assert (=> b!522337 (= lt!239540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522339 () Bool)

(declare-fun Unit!16290 () Unit!16288)

(assert (=> b!522339 (= e!304662 Unit!16290)))

(declare-fun lt!239539 () Unit!16288)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33272 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16288)

(assert (=> b!522339 (= lt!239539 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239537 #b00000000000000000000000000000000 (index!20041 lt!239535) (x!49013 lt!239535) mask!3524))))

(declare-fun res!320007 () Bool)

(assert (=> b!522339 (= res!320007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239537 lt!239542 lt!239534 mask!3524) (Intermediate!4459 false (index!20041 lt!239535) (x!49013 lt!239535))))))

(declare-fun e!304666 () Bool)

(assert (=> b!522339 (=> (not res!320007) (not e!304666))))

(assert (=> b!522339 e!304666))

(declare-fun b!522340 () Bool)

(declare-fun res!320013 () Bool)

(assert (=> b!522340 (=> res!320013 e!304664)))

(assert (=> b!522340 (= res!320013 (or (undefined!5271 lt!239535) (not (is-Intermediate!4459 lt!239535))))))

(declare-fun b!522341 () Bool)

(declare-fun Unit!16291 () Unit!16288)

(assert (=> b!522341 (= e!304662 Unit!16291)))

(declare-fun b!522342 () Bool)

(declare-fun res!320012 () Bool)

(assert (=> b!522342 (=> (not res!320012) (not e!304668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522342 (= res!320012 (validKeyInArray!0 (select (arr!15992 a!3235) j!176)))))

(declare-fun b!522343 () Bool)

(declare-fun res!320008 () Bool)

(assert (=> b!522343 (=> (not res!320008) (not e!304668))))

(assert (=> b!522343 (= res!320008 (and (= (size!16356 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16356 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16356 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522344 () Bool)

(assert (=> b!522344 (= e!304668 e!304663)))

(declare-fun res!320005 () Bool)

(assert (=> b!522344 (=> (not res!320005) (not e!304663))))

(declare-fun lt!239541 () SeekEntryResult!4459)

(assert (=> b!522344 (= res!320005 (or (= lt!239541 (MissingZero!4459 i!1204)) (= lt!239541 (MissingVacant!4459 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33272 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!522344 (= lt!239541 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522345 () Bool)

(declare-fun res!320010 () Bool)

(assert (=> b!522345 (=> (not res!320010) (not e!304663))))

(declare-datatypes ((List!10150 0))(
  ( (Nil!10147) (Cons!10146 (h!11068 (_ BitVec 64)) (t!16378 List!10150)) )
))
(declare-fun arrayNoDuplicates!0 (array!33272 (_ BitVec 32) List!10150) Bool)

(assert (=> b!522345 (= res!320010 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10147))))

(declare-fun b!522338 () Bool)

(assert (=> b!522338 (= e!304665 (= (seekEntryOrOpen!0 (select (arr!15992 a!3235) j!176) a!3235 mask!3524) (Found!4459 j!176)))))

(declare-fun res!320004 () Bool)

(assert (=> start!47446 (=> (not res!320004) (not e!304668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47446 (= res!320004 (validMask!0 mask!3524))))

(assert (=> start!47446 e!304668))

(assert (=> start!47446 true))

(declare-fun array_inv!11788 (array!33272) Bool)

(assert (=> start!47446 (array_inv!11788 a!3235)))

(declare-fun b!522346 () Bool)

(assert (=> b!522346 (= e!304666 false)))

(declare-fun b!522347 () Bool)

(declare-fun res!320014 () Bool)

(assert (=> b!522347 (=> (not res!320014) (not e!304668))))

(assert (=> b!522347 (= res!320014 (validKeyInArray!0 k!2280))))

(assert (= (and start!47446 res!320004) b!522343))

(assert (= (and b!522343 res!320008) b!522342))

(assert (= (and b!522342 res!320012) b!522347))

(assert (= (and b!522347 res!320014) b!522335))

(assert (= (and b!522335 res!320009) b!522344))

(assert (= (and b!522344 res!320005) b!522334))

(assert (= (and b!522334 res!320015) b!522345))

(assert (= (and b!522345 res!320010) b!522337))

(assert (= (and b!522337 res!320011) b!522338))

(assert (= (and b!522337 (not res!320006)) b!522340))

(assert (= (and b!522340 (not res!320013)) b!522336))

(assert (= (and b!522336 c!61466) b!522339))

(assert (= (and b!522336 (not c!61466)) b!522341))

(assert (= (and b!522339 res!320007) b!522346))

(declare-fun m!503247 () Bool)

(assert (=> b!522339 m!503247))

(declare-fun m!503249 () Bool)

(assert (=> b!522339 m!503249))

(declare-fun m!503251 () Bool)

(assert (=> b!522344 m!503251))

(declare-fun m!503253 () Bool)

(assert (=> b!522337 m!503253))

(declare-fun m!503255 () Bool)

(assert (=> b!522337 m!503255))

(declare-fun m!503257 () Bool)

(assert (=> b!522337 m!503257))

(declare-fun m!503259 () Bool)

(assert (=> b!522337 m!503259))

(declare-fun m!503261 () Bool)

(assert (=> b!522337 m!503261))

(assert (=> b!522337 m!503259))

(declare-fun m!503263 () Bool)

(assert (=> b!522337 m!503263))

(declare-fun m!503265 () Bool)

(assert (=> b!522337 m!503265))

(declare-fun m!503267 () Bool)

(assert (=> b!522337 m!503267))

(assert (=> b!522337 m!503259))

(declare-fun m!503269 () Bool)

(assert (=> b!522337 m!503269))

(declare-fun m!503271 () Bool)

(assert (=> b!522345 m!503271))

(declare-fun m!503273 () Bool)

(assert (=> b!522336 m!503273))

(assert (=> b!522336 m!503259))

(assert (=> b!522338 m!503259))

(assert (=> b!522338 m!503259))

(declare-fun m!503275 () Bool)

(assert (=> b!522338 m!503275))

(assert (=> b!522342 m!503259))

(assert (=> b!522342 m!503259))

(declare-fun m!503277 () Bool)

(assert (=> b!522342 m!503277))

(declare-fun m!503279 () Bool)

(assert (=> b!522335 m!503279))

(declare-fun m!503281 () Bool)

(assert (=> b!522347 m!503281))

(declare-fun m!503283 () Bool)

(assert (=> b!522334 m!503283))

(declare-fun m!503285 () Bool)

(assert (=> start!47446 m!503285))

(declare-fun m!503287 () Bool)

(assert (=> start!47446 m!503287))

(push 1)

