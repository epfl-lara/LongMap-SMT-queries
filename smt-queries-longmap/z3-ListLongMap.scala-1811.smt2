; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32676 () Bool)

(assert start!32676)

(declare-fun b!326441 () Bool)

(declare-fun res!179477 () Bool)

(declare-fun e!201027 () Bool)

(assert (=> b!326441 (=> (not res!179477) (not e!201027))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16713 0))(
  ( (array!16714 (arr!7911 (Array (_ BitVec 32) (_ BitVec 64))) (size!8263 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16713)

(assert (=> b!326441 (= res!179477 (and (= (size!8263 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8263 a!3305))))))

(declare-fun b!326442 () Bool)

(declare-fun e!201028 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326442 (= e!201028 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((Unit!10118 0))(
  ( (Unit!10119) )
))
(declare-fun lt!157326 () Unit!10118)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10118)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326442 (= lt!157326 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326443 () Bool)

(declare-fun res!179472 () Bool)

(assert (=> b!326443 (=> (not res!179472) (not e!201028))))

(declare-datatypes ((SeekEntryResult!3042 0))(
  ( (MissingZero!3042 (index!14344 (_ BitVec 32))) (Found!3042 (index!14345 (_ BitVec 32))) (Intermediate!3042 (undefined!3854 Bool) (index!14346 (_ BitVec 32)) (x!32592 (_ BitVec 32))) (Undefined!3042) (MissingVacant!3042 (index!14347 (_ BitVec 32))) )
))
(declare-fun lt!157325 () SeekEntryResult!3042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16713 (_ BitVec 32)) SeekEntryResult!3042)

(assert (=> b!326443 (= res!179472 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157325))))

(declare-fun b!326444 () Bool)

(declare-fun res!179481 () Bool)

(assert (=> b!326444 (=> (not res!179481) (not e!201027))))

(declare-fun arrayContainsKey!0 (array!16713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326444 (= res!179481 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326445 () Bool)

(declare-fun res!179480 () Bool)

(assert (=> b!326445 (=> (not res!179480) (not e!201028))))

(assert (=> b!326445 (= res!179480 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7911 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179479 () Bool)

(assert (=> start!32676 (=> (not res!179479) (not e!201027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32676 (= res!179479 (validMask!0 mask!3777))))

(assert (=> start!32676 e!201027))

(declare-fun array_inv!5874 (array!16713) Bool)

(assert (=> start!32676 (array_inv!5874 a!3305)))

(assert (=> start!32676 true))

(declare-fun b!326446 () Bool)

(declare-fun res!179475 () Bool)

(assert (=> b!326446 (=> (not res!179475) (not e!201027))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16713 (_ BitVec 32)) SeekEntryResult!3042)

(assert (=> b!326446 (= res!179475 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3042 i!1250)))))

(declare-fun b!326447 () Bool)

(declare-fun res!179476 () Bool)

(assert (=> b!326447 (=> (not res!179476) (not e!201028))))

(assert (=> b!326447 (= res!179476 (and (= (select (arr!7911 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8263 a!3305))))))

(declare-fun b!326448 () Bool)

(assert (=> b!326448 (= e!201027 e!201028)))

(declare-fun res!179478 () Bool)

(assert (=> b!326448 (=> (not res!179478) (not e!201028))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326448 (= res!179478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157325))))

(assert (=> b!326448 (= lt!157325 (Intermediate!3042 false resIndex!58 resX!58))))

(declare-fun b!326449 () Bool)

(declare-fun res!179473 () Bool)

(assert (=> b!326449 (=> (not res!179473) (not e!201027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16713 (_ BitVec 32)) Bool)

(assert (=> b!326449 (= res!179473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326450 () Bool)

(declare-fun res!179474 () Bool)

(assert (=> b!326450 (=> (not res!179474) (not e!201027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326450 (= res!179474 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32676 res!179479) b!326441))

(assert (= (and b!326441 res!179477) b!326450))

(assert (= (and b!326450 res!179474) b!326444))

(assert (= (and b!326444 res!179481) b!326446))

(assert (= (and b!326446 res!179475) b!326449))

(assert (= (and b!326449 res!179473) b!326448))

(assert (= (and b!326448 res!179478) b!326447))

(assert (= (and b!326447 res!179476) b!326443))

(assert (= (and b!326443 res!179472) b!326445))

(assert (= (and b!326445 res!179480) b!326442))

(declare-fun m!332989 () Bool)

(assert (=> b!326442 m!332989))

(assert (=> b!326442 m!332989))

(declare-fun m!332991 () Bool)

(assert (=> b!326442 m!332991))

(declare-fun m!332993 () Bool)

(assert (=> b!326448 m!332993))

(assert (=> b!326448 m!332993))

(declare-fun m!332995 () Bool)

(assert (=> b!326448 m!332995))

(declare-fun m!332997 () Bool)

(assert (=> b!326449 m!332997))

(declare-fun m!332999 () Bool)

(assert (=> b!326450 m!332999))

(declare-fun m!333001 () Bool)

(assert (=> b!326447 m!333001))

(declare-fun m!333003 () Bool)

(assert (=> start!32676 m!333003))

(declare-fun m!333005 () Bool)

(assert (=> start!32676 m!333005))

(declare-fun m!333007 () Bool)

(assert (=> b!326444 m!333007))

(declare-fun m!333009 () Bool)

(assert (=> b!326446 m!333009))

(declare-fun m!333011 () Bool)

(assert (=> b!326445 m!333011))

(declare-fun m!333013 () Bool)

(assert (=> b!326443 m!333013))

(check-sat (not b!326442) (not b!326444) (not b!326448) (not b!326450) (not b!326446) (not start!32676) (not b!326443) (not b!326449))
(check-sat)
