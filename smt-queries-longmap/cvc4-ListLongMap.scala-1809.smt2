; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32666 () Bool)

(assert start!32666)

(declare-fun b!326291 () Bool)

(declare-fun res!179324 () Bool)

(declare-fun e!200982 () Bool)

(assert (=> b!326291 (=> (not res!179324) (not e!200982))))

(declare-datatypes ((array!16703 0))(
  ( (array!16704 (arr!7906 (Array (_ BitVec 32) (_ BitVec 64))) (size!8258 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16703)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326291 (= res!179324 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326292 () Bool)

(declare-fun res!179326 () Bool)

(assert (=> b!326292 (=> (not res!179326) (not e!200982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326292 (= res!179326 (validKeyInArray!0 k!2497))))

(declare-fun b!326294 () Bool)

(declare-fun res!179325 () Bool)

(assert (=> b!326294 (=> (not res!179325) (not e!200982))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326294 (= res!179325 (and (= (size!8258 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8258 a!3305))))))

(declare-fun b!326295 () Bool)

(declare-fun res!179329 () Bool)

(assert (=> b!326295 (=> (not res!179329) (not e!200982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16703 (_ BitVec 32)) Bool)

(assert (=> b!326295 (= res!179329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179322 () Bool)

(assert (=> start!32666 (=> (not res!179322) (not e!200982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32666 (= res!179322 (validMask!0 mask!3777))))

(assert (=> start!32666 e!200982))

(declare-fun array_inv!5869 (array!16703) Bool)

(assert (=> start!32666 (array_inv!5869 a!3305)))

(assert (=> start!32666 true))

(declare-fun b!326293 () Bool)

(declare-fun res!179330 () Bool)

(declare-fun e!200983 () Bool)

(assert (=> b!326293 (=> (not res!179330) (not e!200983))))

(declare-datatypes ((SeekEntryResult!3037 0))(
  ( (MissingZero!3037 (index!14324 (_ BitVec 32))) (Found!3037 (index!14325 (_ BitVec 32))) (Intermediate!3037 (undefined!3849 Bool) (index!14326 (_ BitVec 32)) (x!32571 (_ BitVec 32))) (Undefined!3037) (MissingVacant!3037 (index!14327 (_ BitVec 32))) )
))
(declare-fun lt!157296 () SeekEntryResult!3037)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16703 (_ BitVec 32)) SeekEntryResult!3037)

(assert (=> b!326293 (= res!179330 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157296))))

(declare-fun b!326296 () Bool)

(assert (=> b!326296 (= e!200982 e!200983)))

(declare-fun res!179327 () Bool)

(assert (=> b!326296 (=> (not res!179327) (not e!200983))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326296 (= res!179327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157296))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326296 (= lt!157296 (Intermediate!3037 false resIndex!58 resX!58))))

(declare-fun b!326297 () Bool)

(declare-fun res!179328 () Bool)

(assert (=> b!326297 (=> (not res!179328) (not e!200982))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16703 (_ BitVec 32)) SeekEntryResult!3037)

(assert (=> b!326297 (= res!179328 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3037 i!1250)))))

(declare-fun b!326298 () Bool)

(assert (=> b!326298 (= e!200983 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10108 0))(
  ( (Unit!10109) )
))
(declare-fun lt!157295 () Unit!10108)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16703 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10108)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326298 (= lt!157295 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326299 () Bool)

(declare-fun res!179323 () Bool)

(assert (=> b!326299 (=> (not res!179323) (not e!200983))))

(assert (=> b!326299 (= res!179323 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7906 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326300 () Bool)

(declare-fun res!179331 () Bool)

(assert (=> b!326300 (=> (not res!179331) (not e!200983))))

(assert (=> b!326300 (= res!179331 (and (= (select (arr!7906 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8258 a!3305))))))

(assert (= (and start!32666 res!179322) b!326294))

(assert (= (and b!326294 res!179325) b!326292))

(assert (= (and b!326292 res!179326) b!326291))

(assert (= (and b!326291 res!179324) b!326297))

(assert (= (and b!326297 res!179328) b!326295))

(assert (= (and b!326295 res!179329) b!326296))

(assert (= (and b!326296 res!179327) b!326300))

(assert (= (and b!326300 res!179331) b!326293))

(assert (= (and b!326293 res!179330) b!326299))

(assert (= (and b!326299 res!179323) b!326298))

(declare-fun m!332859 () Bool)

(assert (=> b!326292 m!332859))

(declare-fun m!332861 () Bool)

(assert (=> b!326299 m!332861))

(declare-fun m!332863 () Bool)

(assert (=> b!326291 m!332863))

(declare-fun m!332865 () Bool)

(assert (=> b!326298 m!332865))

(assert (=> b!326298 m!332865))

(declare-fun m!332867 () Bool)

(assert (=> b!326298 m!332867))

(declare-fun m!332869 () Bool)

(assert (=> b!326295 m!332869))

(declare-fun m!332871 () Bool)

(assert (=> b!326293 m!332871))

(declare-fun m!332873 () Bool)

(assert (=> b!326300 m!332873))

(declare-fun m!332875 () Bool)

(assert (=> b!326296 m!332875))

(assert (=> b!326296 m!332875))

(declare-fun m!332877 () Bool)

(assert (=> b!326296 m!332877))

(declare-fun m!332879 () Bool)

(assert (=> start!32666 m!332879))

(declare-fun m!332881 () Bool)

(assert (=> start!32666 m!332881))

(declare-fun m!332883 () Bool)

(assert (=> b!326297 m!332883))

(push 1)

(assert (not start!32666))

(assert (not b!326291))

(assert (not b!326292))

(assert (not b!326295))

(assert (not b!326293))

(assert (not b!326296))

(assert (not b!326297))

(assert (not b!326298))

(check-sat)

(pop 1)

