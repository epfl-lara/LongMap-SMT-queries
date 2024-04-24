; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86548 () Bool)

(assert start!86548)

(declare-fun b!1000421 () Bool)

(declare-fun res!669337 () Bool)

(declare-fun e!564162 () Bool)

(assert (=> b!1000421 (=> (not res!669337) (not e!564162))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9298 0))(
  ( (MissingZero!9298 (index!39563 (_ BitVec 32))) (Found!9298 (index!39564 (_ BitVec 32))) (Intermediate!9298 (undefined!10110 Bool) (index!39565 (_ BitVec 32)) (x!87156 (_ BitVec 32))) (Undefined!9298) (MissingVacant!9298 (index!39566 (_ BitVec 32))) )
))
(declare-fun lt!442409 () SeekEntryResult!9298)

(declare-datatypes ((array!63219 0))(
  ( (array!63220 (arr!30430 (Array (_ BitVec 32) (_ BitVec 64))) (size!30933 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63219)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63219 (_ BitVec 32)) SeekEntryResult!9298)

(assert (=> b!1000421 (= res!669337 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30430 a!3219) j!170) a!3219 mask!3464) lt!442409))))

(declare-fun b!1000422 () Bool)

(declare-fun res!669333 () Bool)

(declare-fun e!564164 () Bool)

(assert (=> b!1000422 (=> (not res!669333) (not e!564164))))

(declare-datatypes ((List!21077 0))(
  ( (Nil!21074) (Cons!21073 (h!22256 (_ BitVec 64)) (t!30070 List!21077)) )
))
(declare-fun arrayNoDuplicates!0 (array!63219 (_ BitVec 32) List!21077) Bool)

(assert (=> b!1000422 (= res!669333 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21074))))

(declare-fun res!669342 () Bool)

(declare-fun e!564161 () Bool)

(assert (=> start!86548 (=> (not res!669342) (not e!564161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86548 (= res!669342 (validMask!0 mask!3464))))

(assert (=> start!86548 e!564161))

(declare-fun array_inv!23566 (array!63219) Bool)

(assert (=> start!86548 (array_inv!23566 a!3219)))

(assert (=> start!86548 true))

(declare-fun b!1000423 () Bool)

(declare-fun res!669338 () Bool)

(assert (=> b!1000423 (=> (not res!669338) (not e!564164))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000423 (= res!669338 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30933 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30933 a!3219))))))

(declare-fun b!1000424 () Bool)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun e!564163 () Bool)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000424 (= e!564163 (not (validKeyInArray!0 (select (store (arr!30430 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!1000425 () Bool)

(assert (=> b!1000425 (= e!564161 e!564164)))

(declare-fun res!669335 () Bool)

(assert (=> b!1000425 (=> (not res!669335) (not e!564164))))

(declare-fun lt!442407 () SeekEntryResult!9298)

(assert (=> b!1000425 (= res!669335 (or (= lt!442407 (MissingVacant!9298 i!1194)) (= lt!442407 (MissingZero!9298 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63219 (_ BitVec 32)) SeekEntryResult!9298)

(assert (=> b!1000425 (= lt!442407 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000426 () Bool)

(declare-fun res!669334 () Bool)

(assert (=> b!1000426 (=> (not res!669334) (not e!564164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63219 (_ BitVec 32)) Bool)

(assert (=> b!1000426 (= res!669334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000427 () Bool)

(declare-fun res!669339 () Bool)

(assert (=> b!1000427 (=> (not res!669339) (not e!564161))))

(assert (=> b!1000427 (= res!669339 (validKeyInArray!0 (select (arr!30430 a!3219) j!170)))))

(declare-fun b!1000428 () Bool)

(assert (=> b!1000428 (= e!564164 e!564162)))

(declare-fun res!669341 () Bool)

(assert (=> b!1000428 (=> (not res!669341) (not e!564162))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000428 (= res!669341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30430 a!3219) j!170) mask!3464) (select (arr!30430 a!3219) j!170) a!3219 mask!3464) lt!442409))))

(assert (=> b!1000428 (= lt!442409 (Intermediate!9298 false resIndex!38 resX!38))))

(declare-fun b!1000429 () Bool)

(declare-fun res!669344 () Bool)

(assert (=> b!1000429 (=> (not res!669344) (not e!564161))))

(declare-fun arrayContainsKey!0 (array!63219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000429 (= res!669344 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000430 () Bool)

(declare-fun res!669336 () Bool)

(assert (=> b!1000430 (=> (not res!669336) (not e!564161))))

(assert (=> b!1000430 (= res!669336 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000431 () Bool)

(declare-fun res!669340 () Bool)

(assert (=> b!1000431 (=> (not res!669340) (not e!564161))))

(assert (=> b!1000431 (= res!669340 (and (= (size!30933 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30933 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30933 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000432 () Bool)

(assert (=> b!1000432 (= e!564162 e!564163)))

(declare-fun res!669343 () Bool)

(assert (=> b!1000432 (=> (not res!669343) (not e!564163))))

(declare-fun lt!442408 () (_ BitVec 32))

(assert (=> b!1000432 (= res!669343 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge lt!442408 #b00000000000000000000000000000000) (bvslt lt!442408 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(assert (=> b!1000432 (= lt!442408 (toIndex!0 (select (store (arr!30430 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(assert (= (and start!86548 res!669342) b!1000431))

(assert (= (and b!1000431 res!669340) b!1000427))

(assert (= (and b!1000427 res!669339) b!1000430))

(assert (= (and b!1000430 res!669336) b!1000429))

(assert (= (and b!1000429 res!669344) b!1000425))

(assert (= (and b!1000425 res!669335) b!1000426))

(assert (= (and b!1000426 res!669334) b!1000422))

(assert (= (and b!1000422 res!669333) b!1000423))

(assert (= (and b!1000423 res!669338) b!1000428))

(assert (= (and b!1000428 res!669341) b!1000421))

(assert (= (and b!1000421 res!669337) b!1000432))

(assert (= (and b!1000432 res!669343) b!1000424))

(declare-fun m!927065 () Bool)

(assert (=> b!1000428 m!927065))

(assert (=> b!1000428 m!927065))

(declare-fun m!927067 () Bool)

(assert (=> b!1000428 m!927067))

(assert (=> b!1000428 m!927067))

(assert (=> b!1000428 m!927065))

(declare-fun m!927069 () Bool)

(assert (=> b!1000428 m!927069))

(declare-fun m!927071 () Bool)

(assert (=> b!1000432 m!927071))

(declare-fun m!927073 () Bool)

(assert (=> b!1000432 m!927073))

(assert (=> b!1000432 m!927073))

(declare-fun m!927075 () Bool)

(assert (=> b!1000432 m!927075))

(declare-fun m!927077 () Bool)

(assert (=> b!1000430 m!927077))

(assert (=> b!1000424 m!927071))

(assert (=> b!1000424 m!927073))

(assert (=> b!1000424 m!927073))

(declare-fun m!927079 () Bool)

(assert (=> b!1000424 m!927079))

(declare-fun m!927081 () Bool)

(assert (=> start!86548 m!927081))

(declare-fun m!927083 () Bool)

(assert (=> start!86548 m!927083))

(assert (=> b!1000421 m!927065))

(assert (=> b!1000421 m!927065))

(declare-fun m!927085 () Bool)

(assert (=> b!1000421 m!927085))

(declare-fun m!927087 () Bool)

(assert (=> b!1000425 m!927087))

(declare-fun m!927089 () Bool)

(assert (=> b!1000429 m!927089))

(declare-fun m!927091 () Bool)

(assert (=> b!1000422 m!927091))

(declare-fun m!927093 () Bool)

(assert (=> b!1000426 m!927093))

(assert (=> b!1000427 m!927065))

(assert (=> b!1000427 m!927065))

(declare-fun m!927095 () Bool)

(assert (=> b!1000427 m!927095))

(check-sat (not b!1000432) (not b!1000422) (not b!1000428) (not b!1000429) (not b!1000427) (not b!1000421) (not b!1000426) (not b!1000424) (not b!1000430) (not b!1000425) (not start!86548))
(check-sat)
