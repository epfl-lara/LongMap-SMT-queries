; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33278 () Bool)

(assert start!33278)

(declare-fun b!330993 () Bool)

(declare-fun res!182445 () Bool)

(declare-fun e!203095 () Bool)

(assert (=> b!330993 (=> (not res!182445) (not e!203095))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330993 (= res!182445 (validKeyInArray!0 k0!2497))))

(declare-fun b!330994 () Bool)

(declare-fun res!182453 () Bool)

(assert (=> b!330994 (=> (not res!182453) (not e!203095))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16899 0))(
  ( (array!16900 (arr!7990 (Array (_ BitVec 32) (_ BitVec 64))) (size!8342 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16899)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3086 0))(
  ( (MissingZero!3086 (index!14520 (_ BitVec 32))) (Found!3086 (index!14521 (_ BitVec 32))) (Intermediate!3086 (undefined!3898 Bool) (index!14522 (_ BitVec 32)) (x!32915 (_ BitVec 32))) (Undefined!3086) (MissingVacant!3086 (index!14523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16899 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!330994 (= res!182453 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3086 i!1250)))))

(declare-fun b!330995 () Bool)

(declare-fun res!182451 () Bool)

(assert (=> b!330995 (=> (not res!182451) (not e!203095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16899 (_ BitVec 32)) Bool)

(assert (=> b!330995 (= res!182451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330996 () Bool)

(declare-fun res!182448 () Bool)

(declare-fun e!203096 () Bool)

(assert (=> b!330996 (=> (not res!182448) (not e!203096))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330996 (= res!182448 (and (= (select (arr!7990 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8342 a!3305))))))

(declare-fun b!330997 () Bool)

(declare-fun res!182447 () Bool)

(assert (=> b!330997 (=> (not res!182447) (not e!203095))))

(declare-fun arrayContainsKey!0 (array!16899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330997 (= res!182447 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330998 () Bool)

(declare-fun res!182446 () Bool)

(assert (=> b!330998 (=> (not res!182446) (not e!203096))))

(declare-fun lt!158721 () SeekEntryResult!3086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16899 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!330998 (= res!182446 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158721))))

(declare-fun res!182454 () Bool)

(assert (=> start!33278 (=> (not res!182454) (not e!203095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33278 (= res!182454 (validMask!0 mask!3777))))

(assert (=> start!33278 e!203095))

(declare-fun array_inv!5940 (array!16899) Bool)

(assert (=> start!33278 (array_inv!5940 a!3305)))

(assert (=> start!33278 true))

(declare-fun b!330999 () Bool)

(declare-fun res!182449 () Bool)

(assert (=> b!330999 (=> (not res!182449) (not e!203095))))

(assert (=> b!330999 (= res!182449 (and (= (size!8342 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8342 a!3305))))))

(declare-fun b!331000 () Bool)

(assert (=> b!331000 (= e!203096 false)))

(declare-datatypes ((Unit!10291 0))(
  ( (Unit!10292) )
))
(declare-fun lt!158720 () Unit!10291)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10291)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331000 (= lt!158720 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331001 () Bool)

(declare-fun res!182450 () Bool)

(assert (=> b!331001 (=> (not res!182450) (not e!203096))))

(assert (=> b!331001 (= res!182450 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7990 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!331002 () Bool)

(assert (=> b!331002 (= e!203095 e!203096)))

(declare-fun res!182452 () Bool)

(assert (=> b!331002 (=> (not res!182452) (not e!203096))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331002 (= res!182452 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158721))))

(assert (=> b!331002 (= lt!158721 (Intermediate!3086 false resIndex!58 resX!58))))

(assert (= (and start!33278 res!182454) b!330999))

(assert (= (and b!330999 res!182449) b!330993))

(assert (= (and b!330993 res!182445) b!330997))

(assert (= (and b!330997 res!182447) b!330994))

(assert (= (and b!330994 res!182453) b!330995))

(assert (= (and b!330995 res!182451) b!331002))

(assert (= (and b!331002 res!182452) b!330996))

(assert (= (and b!330996 res!182448) b!330998))

(assert (= (and b!330998 res!182446) b!331001))

(assert (= (and b!331001 res!182450) b!331000))

(declare-fun m!336271 () Bool)

(assert (=> b!331001 m!336271))

(declare-fun m!336273 () Bool)

(assert (=> b!330996 m!336273))

(declare-fun m!336275 () Bool)

(assert (=> start!33278 m!336275))

(declare-fun m!336277 () Bool)

(assert (=> start!33278 m!336277))

(declare-fun m!336279 () Bool)

(assert (=> b!330995 m!336279))

(declare-fun m!336281 () Bool)

(assert (=> b!330994 m!336281))

(declare-fun m!336283 () Bool)

(assert (=> b!331000 m!336283))

(assert (=> b!331000 m!336283))

(declare-fun m!336285 () Bool)

(assert (=> b!331000 m!336285))

(declare-fun m!336287 () Bool)

(assert (=> b!330993 m!336287))

(declare-fun m!336289 () Bool)

(assert (=> b!330997 m!336289))

(declare-fun m!336291 () Bool)

(assert (=> b!330998 m!336291))

(declare-fun m!336293 () Bool)

(assert (=> b!331002 m!336293))

(assert (=> b!331002 m!336293))

(declare-fun m!336295 () Bool)

(assert (=> b!331002 m!336295))

(check-sat (not b!330998) (not start!33278) (not b!330994) (not b!330997) (not b!330995) (not b!330993) (not b!331002) (not b!331000))
(check-sat)
