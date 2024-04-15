; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32672 () Bool)

(assert start!32672)

(declare-fun b!326316 () Bool)

(declare-fun res!179493 () Bool)

(declare-fun e!200896 () Bool)

(assert (=> b!326316 (=> (not res!179493) (not e!200896))))

(declare-datatypes ((array!16713 0))(
  ( (array!16714 (arr!7911 (Array (_ BitVec 32) (_ BitVec 64))) (size!8264 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16713)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326316 (= res!179493 (and (= (size!8264 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8264 a!3305))))))

(declare-fun res!179494 () Bool)

(assert (=> start!32672 (=> (not res!179494) (not e!200896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32672 (= res!179494 (validMask!0 mask!3777))))

(assert (=> start!32672 e!200896))

(declare-fun array_inv!5883 (array!16713) Bool)

(assert (=> start!32672 (array_inv!5883 a!3305)))

(assert (=> start!32672 true))

(declare-fun b!326317 () Bool)

(declare-fun e!200895 () Bool)

(assert (=> b!326317 (= e!200896 e!200895)))

(declare-fun res!179499 () Bool)

(assert (=> b!326317 (=> (not res!179499) (not e!200895))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3041 0))(
  ( (MissingZero!3041 (index!14340 (_ BitVec 32))) (Found!3041 (index!14341 (_ BitVec 32))) (Intermediate!3041 (undefined!3853 Bool) (index!14342 (_ BitVec 32)) (x!32602 (_ BitVec 32))) (Undefined!3041) (MissingVacant!3041 (index!14343 (_ BitVec 32))) )
))
(declare-fun lt!157121 () SeekEntryResult!3041)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16713 (_ BitVec 32)) SeekEntryResult!3041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326317 (= res!179499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157121))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326317 (= lt!157121 (Intermediate!3041 false resIndex!58 resX!58))))

(declare-fun b!326318 () Bool)

(declare-fun res!179497 () Bool)

(assert (=> b!326318 (=> (not res!179497) (not e!200895))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326318 (= res!179497 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7911 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326319 () Bool)

(declare-fun res!179502 () Bool)

(assert (=> b!326319 (=> (not res!179502) (not e!200896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326319 (= res!179502 (validKeyInArray!0 k0!2497))))

(declare-fun b!326320 () Bool)

(declare-fun res!179500 () Bool)

(assert (=> b!326320 (=> (not res!179500) (not e!200896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16713 (_ BitVec 32)) Bool)

(assert (=> b!326320 (= res!179500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326321 () Bool)

(declare-fun res!179495 () Bool)

(assert (=> b!326321 (=> (not res!179495) (not e!200895))))

(assert (=> b!326321 (= res!179495 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157121))))

(declare-fun b!326322 () Bool)

(assert (=> b!326322 (= e!200895 false)))

(declare-datatypes ((Unit!10094 0))(
  ( (Unit!10095) )
))
(declare-fun lt!157120 () Unit!10094)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10094)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326322 (= lt!157120 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326323 () Bool)

(declare-fun res!179501 () Bool)

(assert (=> b!326323 (=> (not res!179501) (not e!200896))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16713 (_ BitVec 32)) SeekEntryResult!3041)

(assert (=> b!326323 (= res!179501 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3041 i!1250)))))

(declare-fun b!326324 () Bool)

(declare-fun res!179498 () Bool)

(assert (=> b!326324 (=> (not res!179498) (not e!200896))))

(declare-fun arrayContainsKey!0 (array!16713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326324 (= res!179498 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326325 () Bool)

(declare-fun res!179496 () Bool)

(assert (=> b!326325 (=> (not res!179496) (not e!200895))))

(assert (=> b!326325 (= res!179496 (and (= (select (arr!7911 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8264 a!3305))))))

(assert (= (and start!32672 res!179494) b!326316))

(assert (= (and b!326316 res!179493) b!326319))

(assert (= (and b!326319 res!179502) b!326324))

(assert (= (and b!326324 res!179498) b!326323))

(assert (= (and b!326323 res!179501) b!326320))

(assert (= (and b!326320 res!179500) b!326317))

(assert (= (and b!326317 res!179499) b!326325))

(assert (= (and b!326325 res!179496) b!326321))

(assert (= (and b!326321 res!179495) b!326318))

(assert (= (and b!326318 res!179497) b!326322))

(declare-fun m!332389 () Bool)

(assert (=> start!32672 m!332389))

(declare-fun m!332391 () Bool)

(assert (=> start!32672 m!332391))

(declare-fun m!332393 () Bool)

(assert (=> b!326320 m!332393))

(declare-fun m!332395 () Bool)

(assert (=> b!326319 m!332395))

(declare-fun m!332397 () Bool)

(assert (=> b!326317 m!332397))

(assert (=> b!326317 m!332397))

(declare-fun m!332399 () Bool)

(assert (=> b!326317 m!332399))

(declare-fun m!332401 () Bool)

(assert (=> b!326318 m!332401))

(declare-fun m!332403 () Bool)

(assert (=> b!326322 m!332403))

(assert (=> b!326322 m!332403))

(declare-fun m!332405 () Bool)

(assert (=> b!326322 m!332405))

(declare-fun m!332407 () Bool)

(assert (=> b!326323 m!332407))

(declare-fun m!332409 () Bool)

(assert (=> b!326321 m!332409))

(declare-fun m!332411 () Bool)

(assert (=> b!326324 m!332411))

(declare-fun m!332413 () Bool)

(assert (=> b!326325 m!332413))

(check-sat (not start!32672) (not b!326320) (not b!326323) (not b!326322) (not b!326321) (not b!326324) (not b!326317) (not b!326319))
(check-sat)
