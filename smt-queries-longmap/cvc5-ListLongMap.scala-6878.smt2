; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86522 () Bool)

(assert start!86522)

(declare-fun b!1002477 () Bool)

(declare-fun res!671970 () Bool)

(declare-fun e!564752 () Bool)

(assert (=> b!1002477 (=> (not res!671970) (not e!564752))))

(declare-datatypes ((array!63323 0))(
  ( (array!63324 (arr!30487 (Array (_ BitVec 32) (_ BitVec 64))) (size!30989 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63323)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63323 (_ BitVec 32)) Bool)

(assert (=> b!1002477 (= res!671970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002478 () Bool)

(declare-fun e!564751 () Bool)

(declare-fun e!564748 () Bool)

(assert (=> b!1002478 (= e!564751 e!564748)))

(declare-fun res!671960 () Bool)

(assert (=> b!1002478 (=> (not res!671960) (not e!564748))))

(declare-fun lt!443198 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9419 0))(
  ( (MissingZero!9419 (index!40047 (_ BitVec 32))) (Found!9419 (index!40048 (_ BitVec 32))) (Intermediate!9419 (undefined!10231 Bool) (index!40049 (_ BitVec 32)) (x!87463 (_ BitVec 32))) (Undefined!9419) (MissingVacant!9419 (index!40050 (_ BitVec 32))) )
))
(declare-fun lt!443195 () SeekEntryResult!9419)

(declare-fun lt!443194 () array!63323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63323 (_ BitVec 32)) SeekEntryResult!9419)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002478 (= res!671960 (not (= lt!443195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443198 mask!3464) lt!443198 lt!443194 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002478 (= lt!443198 (select (store (arr!30487 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002478 (= lt!443194 (array!63324 (store (arr!30487 a!3219) i!1194 k!2224) (size!30989 a!3219)))))

(declare-fun b!1002479 () Bool)

(declare-fun res!671969 () Bool)

(declare-fun e!564750 () Bool)

(assert (=> b!1002479 (=> (not res!671969) (not e!564750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002479 (= res!671969 (validKeyInArray!0 k!2224))))

(declare-fun b!1002480 () Bool)

(declare-fun res!671967 () Bool)

(assert (=> b!1002480 (=> (not res!671967) (not e!564750))))

(declare-fun arrayContainsKey!0 (array!63323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002480 (= res!671967 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002481 () Bool)

(declare-fun res!671957 () Bool)

(assert (=> b!1002481 (=> (not res!671957) (not e!564748))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002481 (= res!671957 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002482 () Bool)

(declare-fun res!671961 () Bool)

(assert (=> b!1002482 (=> (not res!671961) (not e!564750))))

(assert (=> b!1002482 (= res!671961 (validKeyInArray!0 (select (arr!30487 a!3219) j!170)))))

(declare-fun b!1002483 () Bool)

(declare-fun res!671958 () Bool)

(declare-fun e!564753 () Bool)

(assert (=> b!1002483 (=> (not res!671958) (not e!564753))))

(declare-fun lt!443201 () (_ BitVec 32))

(declare-fun lt!443200 () SeekEntryResult!9419)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002483 (= res!671958 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443201 (select (arr!30487 a!3219) j!170) a!3219 mask!3464) lt!443200))))

(declare-fun b!1002484 () Bool)

(declare-fun e!564754 () Bool)

(assert (=> b!1002484 (= e!564752 e!564754)))

(declare-fun res!671965 () Bool)

(assert (=> b!1002484 (=> (not res!671965) (not e!564754))))

(assert (=> b!1002484 (= res!671965 (= lt!443195 lt!443200))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002484 (= lt!443200 (Intermediate!9419 false resIndex!38 resX!38))))

(assert (=> b!1002484 (= lt!443195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30487 a!3219) j!170) mask!3464) (select (arr!30487 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002485 () Bool)

(assert (=> b!1002485 (= e!564753 false)))

(declare-fun lt!443199 () SeekEntryResult!9419)

(assert (=> b!1002485 (= lt!443199 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443201 lt!443198 lt!443194 mask!3464))))

(declare-fun b!1002486 () Bool)

(declare-fun res!671964 () Bool)

(assert (=> b!1002486 (=> (not res!671964) (not e!564750))))

(assert (=> b!1002486 (= res!671964 (and (= (size!30989 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30989 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30989 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!671962 () Bool)

(assert (=> start!86522 (=> (not res!671962) (not e!564750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86522 (= res!671962 (validMask!0 mask!3464))))

(assert (=> start!86522 e!564750))

(declare-fun array_inv!23611 (array!63323) Bool)

(assert (=> start!86522 (array_inv!23611 a!3219)))

(assert (=> start!86522 true))

(declare-fun b!1002487 () Bool)

(assert (=> b!1002487 (= e!564750 e!564752)))

(declare-fun res!671955 () Bool)

(assert (=> b!1002487 (=> (not res!671955) (not e!564752))))

(declare-fun lt!443196 () SeekEntryResult!9419)

(assert (=> b!1002487 (= res!671955 (or (= lt!443196 (MissingVacant!9419 i!1194)) (= lt!443196 (MissingZero!9419 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63323 (_ BitVec 32)) SeekEntryResult!9419)

(assert (=> b!1002487 (= lt!443196 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002488 () Bool)

(assert (=> b!1002488 (= e!564748 e!564753)))

(declare-fun res!671963 () Bool)

(assert (=> b!1002488 (=> (not res!671963) (not e!564753))))

(assert (=> b!1002488 (= res!671963 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443201 #b00000000000000000000000000000000) (bvslt lt!443201 (size!30989 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002488 (= lt!443201 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002489 () Bool)

(declare-fun res!671968 () Bool)

(assert (=> b!1002489 (=> (not res!671968) (not e!564752))))

(declare-datatypes ((List!21163 0))(
  ( (Nil!21160) (Cons!21159 (h!22336 (_ BitVec 64)) (t!30164 List!21163)) )
))
(declare-fun arrayNoDuplicates!0 (array!63323 (_ BitVec 32) List!21163) Bool)

(assert (=> b!1002489 (= res!671968 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21160))))

(declare-fun b!1002490 () Bool)

(declare-fun res!671956 () Bool)

(assert (=> b!1002490 (=> (not res!671956) (not e!564748))))

(declare-fun lt!443197 () SeekEntryResult!9419)

(assert (=> b!1002490 (= res!671956 (not (= lt!443197 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443198 lt!443194 mask!3464))))))

(declare-fun b!1002491 () Bool)

(assert (=> b!1002491 (= e!564754 e!564751)))

(declare-fun res!671966 () Bool)

(assert (=> b!1002491 (=> (not res!671966) (not e!564751))))

(assert (=> b!1002491 (= res!671966 (= lt!443197 lt!443200))))

(assert (=> b!1002491 (= lt!443197 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30487 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002492 () Bool)

(declare-fun res!671959 () Bool)

(assert (=> b!1002492 (=> (not res!671959) (not e!564752))))

(assert (=> b!1002492 (= res!671959 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30989 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30989 a!3219))))))

(assert (= (and start!86522 res!671962) b!1002486))

(assert (= (and b!1002486 res!671964) b!1002482))

(assert (= (and b!1002482 res!671961) b!1002479))

(assert (= (and b!1002479 res!671969) b!1002480))

(assert (= (and b!1002480 res!671967) b!1002487))

(assert (= (and b!1002487 res!671955) b!1002477))

(assert (= (and b!1002477 res!671970) b!1002489))

(assert (= (and b!1002489 res!671968) b!1002492))

(assert (= (and b!1002492 res!671959) b!1002484))

(assert (= (and b!1002484 res!671965) b!1002491))

(assert (= (and b!1002491 res!671966) b!1002478))

(assert (= (and b!1002478 res!671960) b!1002490))

(assert (= (and b!1002490 res!671956) b!1002481))

(assert (= (and b!1002481 res!671957) b!1002488))

(assert (= (and b!1002488 res!671963) b!1002483))

(assert (= (and b!1002483 res!671958) b!1002485))

(declare-fun m!928349 () Bool)

(assert (=> b!1002491 m!928349))

(assert (=> b!1002491 m!928349))

(declare-fun m!928351 () Bool)

(assert (=> b!1002491 m!928351))

(declare-fun m!928353 () Bool)

(assert (=> b!1002485 m!928353))

(assert (=> b!1002483 m!928349))

(assert (=> b!1002483 m!928349))

(declare-fun m!928355 () Bool)

(assert (=> b!1002483 m!928355))

(declare-fun m!928357 () Bool)

(assert (=> b!1002488 m!928357))

(declare-fun m!928359 () Bool)

(assert (=> b!1002479 m!928359))

(assert (=> b!1002482 m!928349))

(assert (=> b!1002482 m!928349))

(declare-fun m!928361 () Bool)

(assert (=> b!1002482 m!928361))

(declare-fun m!928363 () Bool)

(assert (=> b!1002478 m!928363))

(assert (=> b!1002478 m!928363))

(declare-fun m!928365 () Bool)

(assert (=> b!1002478 m!928365))

(declare-fun m!928367 () Bool)

(assert (=> b!1002478 m!928367))

(declare-fun m!928369 () Bool)

(assert (=> b!1002478 m!928369))

(declare-fun m!928371 () Bool)

(assert (=> b!1002480 m!928371))

(declare-fun m!928373 () Bool)

(assert (=> b!1002477 m!928373))

(declare-fun m!928375 () Bool)

(assert (=> start!86522 m!928375))

(declare-fun m!928377 () Bool)

(assert (=> start!86522 m!928377))

(declare-fun m!928379 () Bool)

(assert (=> b!1002489 m!928379))

(declare-fun m!928381 () Bool)

(assert (=> b!1002487 m!928381))

(declare-fun m!928383 () Bool)

(assert (=> b!1002490 m!928383))

(assert (=> b!1002484 m!928349))

(assert (=> b!1002484 m!928349))

(declare-fun m!928385 () Bool)

(assert (=> b!1002484 m!928385))

(assert (=> b!1002484 m!928385))

(assert (=> b!1002484 m!928349))

(declare-fun m!928387 () Bool)

(assert (=> b!1002484 m!928387))

(push 1)

