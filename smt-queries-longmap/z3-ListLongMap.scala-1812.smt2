; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32666 () Bool)

(assert start!32666)

(declare-fun b!326448 () Bool)

(declare-fun res!179530 () Bool)

(declare-fun e!201011 () Bool)

(assert (=> b!326448 (=> (not res!179530) (not e!201011))))

(declare-datatypes ((array!16716 0))(
  ( (array!16717 (arr!7912 (Array (_ BitVec 32) (_ BitVec 64))) (size!8264 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16716)

(declare-datatypes ((SeekEntryResult!3008 0))(
  ( (MissingZero!3008 (index!14208 (_ BitVec 32))) (Found!3008 (index!14209 (_ BitVec 32))) (Intermediate!3008 (undefined!3820 Bool) (index!14210 (_ BitVec 32)) (x!32563 (_ BitVec 32))) (Undefined!3008) (MissingVacant!3008 (index!14211 (_ BitVec 32))) )
))
(declare-fun lt!157356 () SeekEntryResult!3008)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16716 (_ BitVec 32)) SeekEntryResult!3008)

(assert (=> b!326448 (= res!179530 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157356))))

(declare-fun b!326449 () Bool)

(declare-fun res!179536 () Bool)

(declare-fun e!201012 () Bool)

(assert (=> b!326449 (=> (not res!179536) (not e!201012))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326449 (= res!179536 (and (= (size!8264 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8264 a!3305))))))

(declare-fun b!326450 () Bool)

(declare-fun res!179537 () Bool)

(assert (=> b!326450 (=> (not res!179537) (not e!201012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16716 (_ BitVec 32)) Bool)

(assert (=> b!326450 (= res!179537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326451 () Bool)

(assert (=> b!326451 (= e!201012 e!201011)))

(declare-fun res!179529 () Bool)

(assert (=> b!326451 (=> (not res!179529) (not e!201011))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326451 (= res!179529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157356))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326451 (= lt!157356 (Intermediate!3008 false resIndex!58 resX!58))))

(declare-fun b!326452 () Bool)

(declare-fun res!179531 () Bool)

(assert (=> b!326452 (=> (not res!179531) (not e!201012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326452 (= res!179531 (validKeyInArray!0 k0!2497))))

(declare-fun b!326453 () Bool)

(declare-fun res!179535 () Bool)

(assert (=> b!326453 (=> (not res!179535) (not e!201012))))

(declare-fun arrayContainsKey!0 (array!16716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326453 (= res!179535 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326454 () Bool)

(declare-fun res!179533 () Bool)

(assert (=> b!326454 (=> (not res!179533) (not e!201011))))

(assert (=> b!326454 (= res!179533 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7912 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326455 () Bool)

(assert (=> b!326455 (= e!201011 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10084 0))(
  ( (Unit!10085) )
))
(declare-fun lt!157355 () Unit!10084)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16716 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10084)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326455 (= lt!157355 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326457 () Bool)

(declare-fun res!179538 () Bool)

(assert (=> b!326457 (=> (not res!179538) (not e!201012))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16716 (_ BitVec 32)) SeekEntryResult!3008)

(assert (=> b!326457 (= res!179538 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3008 i!1250)))))

(declare-fun b!326456 () Bool)

(declare-fun res!179534 () Bool)

(assert (=> b!326456 (=> (not res!179534) (not e!201011))))

(assert (=> b!326456 (= res!179534 (and (= (select (arr!7912 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8264 a!3305))))))

(declare-fun res!179532 () Bool)

(assert (=> start!32666 (=> (not res!179532) (not e!201012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32666 (= res!179532 (validMask!0 mask!3777))))

(assert (=> start!32666 e!201012))

(declare-fun array_inv!5862 (array!16716) Bool)

(assert (=> start!32666 (array_inv!5862 a!3305)))

(assert (=> start!32666 true))

(assert (= (and start!32666 res!179532) b!326449))

(assert (= (and b!326449 res!179536) b!326452))

(assert (= (and b!326452 res!179531) b!326453))

(assert (= (and b!326453 res!179535) b!326457))

(assert (= (and b!326457 res!179538) b!326450))

(assert (= (and b!326450 res!179537) b!326451))

(assert (= (and b!326451 res!179529) b!326456))

(assert (= (and b!326456 res!179534) b!326448))

(assert (= (and b!326448 res!179530) b!326454))

(assert (= (and b!326454 res!179533) b!326455))

(declare-fun m!333235 () Bool)

(assert (=> b!326455 m!333235))

(assert (=> b!326455 m!333235))

(declare-fun m!333237 () Bool)

(assert (=> b!326455 m!333237))

(declare-fun m!333239 () Bool)

(assert (=> b!326450 m!333239))

(declare-fun m!333241 () Bool)

(assert (=> b!326451 m!333241))

(assert (=> b!326451 m!333241))

(declare-fun m!333243 () Bool)

(assert (=> b!326451 m!333243))

(declare-fun m!333245 () Bool)

(assert (=> b!326456 m!333245))

(declare-fun m!333247 () Bool)

(assert (=> start!32666 m!333247))

(declare-fun m!333249 () Bool)

(assert (=> start!32666 m!333249))

(declare-fun m!333251 () Bool)

(assert (=> b!326454 m!333251))

(declare-fun m!333253 () Bool)

(assert (=> b!326452 m!333253))

(declare-fun m!333255 () Bool)

(assert (=> b!326453 m!333255))

(declare-fun m!333257 () Bool)

(assert (=> b!326448 m!333257))

(declare-fun m!333259 () Bool)

(assert (=> b!326457 m!333259))

(check-sat (not b!326450) (not b!326452) (not b!326453) (not b!326457) (not start!32666) (not b!326448) (not b!326451) (not b!326455))
(check-sat)
