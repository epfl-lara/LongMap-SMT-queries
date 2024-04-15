; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32666 () Bool)

(assert start!32666)

(declare-fun b!326226 () Bool)

(declare-fun res!179403 () Bool)

(declare-fun e!200868 () Bool)

(assert (=> b!326226 (=> (not res!179403) (not e!200868))))

(declare-datatypes ((array!16707 0))(
  ( (array!16708 (arr!7908 (Array (_ BitVec 32) (_ BitVec 64))) (size!8261 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16707)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16707 (_ BitVec 32)) Bool)

(assert (=> b!326226 (= res!179403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326227 () Bool)

(declare-fun res!179405 () Bool)

(assert (=> b!326227 (=> (not res!179405) (not e!200868))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326227 (= res!179405 (validKeyInArray!0 k0!2497))))

(declare-fun b!326228 () Bool)

(declare-fun res!179408 () Bool)

(assert (=> b!326228 (=> (not res!179408) (not e!200868))))

(declare-fun arrayContainsKey!0 (array!16707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326228 (= res!179408 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326229 () Bool)

(declare-fun e!200870 () Bool)

(assert (=> b!326229 (= e!200868 e!200870)))

(declare-fun res!179406 () Bool)

(assert (=> b!326229 (=> (not res!179406) (not e!200870))))

(declare-datatypes ((SeekEntryResult!3038 0))(
  ( (MissingZero!3038 (index!14328 (_ BitVec 32))) (Found!3038 (index!14329 (_ BitVec 32))) (Intermediate!3038 (undefined!3850 Bool) (index!14330 (_ BitVec 32)) (x!32591 (_ BitVec 32))) (Undefined!3038) (MissingVacant!3038 (index!14331 (_ BitVec 32))) )
))
(declare-fun lt!157102 () SeekEntryResult!3038)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16707 (_ BitVec 32)) SeekEntryResult!3038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326229 (= res!179406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157102))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326229 (= lt!157102 (Intermediate!3038 false resIndex!58 resX!58))))

(declare-fun res!179407 () Bool)

(assert (=> start!32666 (=> (not res!179407) (not e!200868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32666 (= res!179407 (validMask!0 mask!3777))))

(assert (=> start!32666 e!200868))

(declare-fun array_inv!5880 (array!16707) Bool)

(assert (=> start!32666 (array_inv!5880 a!3305)))

(assert (=> start!32666 true))

(declare-fun b!326230 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326230 (= e!200870 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10088 0))(
  ( (Unit!10089) )
))
(declare-fun lt!157103 () Unit!10088)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10088)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326230 (= lt!157103 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326231 () Bool)

(declare-fun res!179410 () Bool)

(assert (=> b!326231 (=> (not res!179410) (not e!200868))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16707 (_ BitVec 32)) SeekEntryResult!3038)

(assert (=> b!326231 (= res!179410 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3038 i!1250)))))

(declare-fun b!326232 () Bool)

(declare-fun res!179409 () Bool)

(assert (=> b!326232 (=> (not res!179409) (not e!200868))))

(assert (=> b!326232 (= res!179409 (and (= (size!8261 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8261 a!3305))))))

(declare-fun b!326233 () Bool)

(declare-fun res!179412 () Bool)

(assert (=> b!326233 (=> (not res!179412) (not e!200870))))

(assert (=> b!326233 (= res!179412 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157102))))

(declare-fun b!326234 () Bool)

(declare-fun res!179404 () Bool)

(assert (=> b!326234 (=> (not res!179404) (not e!200870))))

(assert (=> b!326234 (= res!179404 (and (= (select (arr!7908 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8261 a!3305))))))

(declare-fun b!326235 () Bool)

(declare-fun res!179411 () Bool)

(assert (=> b!326235 (=> (not res!179411) (not e!200870))))

(assert (=> b!326235 (= res!179411 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7908 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32666 res!179407) b!326232))

(assert (= (and b!326232 res!179409) b!326227))

(assert (= (and b!326227 res!179405) b!326228))

(assert (= (and b!326228 res!179408) b!326231))

(assert (= (and b!326231 res!179410) b!326226))

(assert (= (and b!326226 res!179403) b!326229))

(assert (= (and b!326229 res!179406) b!326234))

(assert (= (and b!326234 res!179404) b!326233))

(assert (= (and b!326233 res!179412) b!326235))

(assert (= (and b!326235 res!179411) b!326230))

(declare-fun m!332311 () Bool)

(assert (=> b!326229 m!332311))

(assert (=> b!326229 m!332311))

(declare-fun m!332313 () Bool)

(assert (=> b!326229 m!332313))

(declare-fun m!332315 () Bool)

(assert (=> b!326226 m!332315))

(declare-fun m!332317 () Bool)

(assert (=> b!326234 m!332317))

(declare-fun m!332319 () Bool)

(assert (=> b!326235 m!332319))

(declare-fun m!332321 () Bool)

(assert (=> b!326233 m!332321))

(declare-fun m!332323 () Bool)

(assert (=> start!32666 m!332323))

(declare-fun m!332325 () Bool)

(assert (=> start!32666 m!332325))

(declare-fun m!332327 () Bool)

(assert (=> b!326230 m!332327))

(assert (=> b!326230 m!332327))

(declare-fun m!332329 () Bool)

(assert (=> b!326230 m!332329))

(declare-fun m!332331 () Bool)

(assert (=> b!326227 m!332331))

(declare-fun m!332333 () Bool)

(assert (=> b!326231 m!332333))

(declare-fun m!332335 () Bool)

(assert (=> b!326228 m!332335))

(check-sat (not start!32666) (not b!326233) (not b!326228) (not b!326231) (not b!326229) (not b!326230) (not b!326226) (not b!326227))
(check-sat)
