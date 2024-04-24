; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32664 () Bool)

(assert start!32664)

(declare-fun res!179506 () Bool)

(declare-fun e!201003 () Bool)

(assert (=> start!32664 (=> (not res!179506) (not e!201003))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32664 (= res!179506 (validMask!0 mask!3777))))

(assert (=> start!32664 e!201003))

(declare-datatypes ((array!16714 0))(
  ( (array!16715 (arr!7911 (Array (_ BitVec 32) (_ BitVec 64))) (size!8263 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16714)

(declare-fun array_inv!5861 (array!16714) Bool)

(assert (=> start!32664 (array_inv!5861 a!3305)))

(assert (=> start!32664 true))

(declare-fun b!326418 () Bool)

(declare-fun res!179504 () Bool)

(declare-fun e!201002 () Bool)

(assert (=> b!326418 (=> (not res!179504) (not e!201002))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326418 (= res!179504 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7911 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326419 () Bool)

(declare-fun res!179501 () Bool)

(assert (=> b!326419 (=> (not res!179501) (not e!201003))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326419 (= res!179501 (and (= (size!8263 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8263 a!3305))))))

(declare-fun b!326420 () Bool)

(declare-fun res!179508 () Bool)

(assert (=> b!326420 (=> (not res!179508) (not e!201002))))

(declare-datatypes ((SeekEntryResult!3007 0))(
  ( (MissingZero!3007 (index!14204 (_ BitVec 32))) (Found!3007 (index!14205 (_ BitVec 32))) (Intermediate!3007 (undefined!3819 Bool) (index!14206 (_ BitVec 32)) (x!32554 (_ BitVec 32))) (Undefined!3007) (MissingVacant!3007 (index!14207 (_ BitVec 32))) )
))
(declare-fun lt!157350 () SeekEntryResult!3007)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16714 (_ BitVec 32)) SeekEntryResult!3007)

(assert (=> b!326420 (= res!179508 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157350))))

(declare-fun b!326421 () Bool)

(assert (=> b!326421 (= e!201003 e!201002)))

(declare-fun res!179503 () Bool)

(assert (=> b!326421 (=> (not res!179503) (not e!201002))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326421 (= res!179503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157350))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326421 (= lt!157350 (Intermediate!3007 false resIndex!58 resX!58))))

(declare-fun b!326422 () Bool)

(assert (=> b!326422 (= e!201002 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10082 0))(
  ( (Unit!10083) )
))
(declare-fun lt!157349 () Unit!10082)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10082)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326422 (= lt!157349 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326423 () Bool)

(declare-fun res!179499 () Bool)

(assert (=> b!326423 (=> (not res!179499) (not e!201003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326423 (= res!179499 (validKeyInArray!0 k!2497))))

(declare-fun b!326424 () Bool)

(declare-fun res!179505 () Bool)

(assert (=> b!326424 (=> (not res!179505) (not e!201002))))

(assert (=> b!326424 (= res!179505 (and (= (select (arr!7911 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8263 a!3305))))))

(declare-fun b!326425 () Bool)

(declare-fun res!179507 () Bool)

(assert (=> b!326425 (=> (not res!179507) (not e!201003))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16714 (_ BitVec 32)) SeekEntryResult!3007)

(assert (=> b!326425 (= res!179507 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3007 i!1250)))))

(declare-fun b!326426 () Bool)

(declare-fun res!179502 () Bool)

(assert (=> b!326426 (=> (not res!179502) (not e!201003))))

(declare-fun arrayContainsKey!0 (array!16714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326426 (= res!179502 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326427 () Bool)

(declare-fun res!179500 () Bool)

(assert (=> b!326427 (=> (not res!179500) (not e!201003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16714 (_ BitVec 32)) Bool)

(assert (=> b!326427 (= res!179500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32664 res!179506) b!326419))

(assert (= (and b!326419 res!179501) b!326423))

(assert (= (and b!326423 res!179499) b!326426))

(assert (= (and b!326426 res!179502) b!326425))

(assert (= (and b!326425 res!179507) b!326427))

(assert (= (and b!326427 res!179500) b!326421))

(assert (= (and b!326421 res!179503) b!326424))

(assert (= (and b!326424 res!179505) b!326420))

(assert (= (and b!326420 res!179508) b!326418))

(assert (= (and b!326418 res!179504) b!326422))

(declare-fun m!333209 () Bool)

(assert (=> b!326418 m!333209))

(declare-fun m!333211 () Bool)

(assert (=> b!326421 m!333211))

(assert (=> b!326421 m!333211))

(declare-fun m!333213 () Bool)

(assert (=> b!326421 m!333213))

(declare-fun m!333215 () Bool)

(assert (=> b!326422 m!333215))

(assert (=> b!326422 m!333215))

(declare-fun m!333217 () Bool)

(assert (=> b!326422 m!333217))

(declare-fun m!333219 () Bool)

(assert (=> start!32664 m!333219))

(declare-fun m!333221 () Bool)

(assert (=> start!32664 m!333221))

(declare-fun m!333223 () Bool)

(assert (=> b!326420 m!333223))

(declare-fun m!333225 () Bool)

(assert (=> b!326425 m!333225))

(declare-fun m!333227 () Bool)

(assert (=> b!326426 m!333227))

(declare-fun m!333229 () Bool)

(assert (=> b!326424 m!333229))

(declare-fun m!333231 () Bool)

(assert (=> b!326423 m!333231))

(declare-fun m!333233 () Bool)

(assert (=> b!326427 m!333233))

(push 1)

(assert (not b!326426))

(assert (not b!326421))

(assert (not b!326422))

(assert (not b!326427))

(assert (not start!32664))

(assert (not b!326423))

(assert (not b!326425))

(assert (not b!326420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

