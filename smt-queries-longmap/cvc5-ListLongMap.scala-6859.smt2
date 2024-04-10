; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86408 () Bool)

(assert start!86408)

(declare-fun b!1000118 () Bool)

(declare-fun res!669606 () Bool)

(declare-fun e!563779 () Bool)

(assert (=> b!1000118 (=> (not res!669606) (not e!563779))))

(declare-datatypes ((array!63209 0))(
  ( (array!63210 (arr!30430 (Array (_ BitVec 32) (_ BitVec 64))) (size!30932 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63209)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9362 0))(
  ( (MissingZero!9362 (index!39819 (_ BitVec 32))) (Found!9362 (index!39820 (_ BitVec 32))) (Intermediate!9362 (undefined!10174 Bool) (index!39821 (_ BitVec 32)) (x!87254 (_ BitVec 32))) (Undefined!9362) (MissingVacant!9362 (index!39822 (_ BitVec 32))) )
))
(declare-fun lt!442205 () SeekEntryResult!9362)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63209 (_ BitVec 32)) SeekEntryResult!9362)

(assert (=> b!1000118 (= res!669606 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30430 a!3219) j!170) a!3219 mask!3464) lt!442205))))

(declare-fun b!1000119 () Bool)

(declare-fun res!669600 () Bool)

(declare-fun e!563782 () Bool)

(assert (=> b!1000119 (=> (not res!669600) (not e!563782))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000119 (= res!669600 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000120 () Bool)

(declare-fun res!669601 () Bool)

(assert (=> b!1000120 (=> (not res!669601) (not e!563782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000120 (= res!669601 (validKeyInArray!0 k!2224))))

(declare-fun b!1000121 () Bool)

(declare-fun res!669603 () Bool)

(assert (=> b!1000121 (=> (not res!669603) (not e!563782))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000121 (= res!669603 (and (= (size!30932 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30932 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30932 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000122 () Bool)

(declare-fun res!669599 () Bool)

(declare-fun e!563780 () Bool)

(assert (=> b!1000122 (=> (not res!669599) (not e!563780))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000122 (= res!669599 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30932 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30932 a!3219))))))

(declare-fun b!1000123 () Bool)

(declare-fun res!669597 () Bool)

(assert (=> b!1000123 (=> (not res!669597) (not e!563780))))

(declare-datatypes ((List!21106 0))(
  ( (Nil!21103) (Cons!21102 (h!22279 (_ BitVec 64)) (t!30107 List!21106)) )
))
(declare-fun arrayNoDuplicates!0 (array!63209 (_ BitVec 32) List!21106) Bool)

(assert (=> b!1000123 (= res!669597 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21103))))

(declare-fun b!1000124 () Bool)

(assert (=> b!1000124 (= e!563780 e!563779)))

(declare-fun res!669602 () Bool)

(assert (=> b!1000124 (=> (not res!669602) (not e!563779))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000124 (= res!669602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30430 a!3219) j!170) mask!3464) (select (arr!30430 a!3219) j!170) a!3219 mask!3464) lt!442205))))

(assert (=> b!1000124 (= lt!442205 (Intermediate!9362 false resIndex!38 resX!38))))

(declare-fun b!1000125 () Bool)

(declare-fun res!669605 () Bool)

(assert (=> b!1000125 (=> (not res!669605) (not e!563782))))

(assert (=> b!1000125 (= res!669605 (validKeyInArray!0 (select (arr!30430 a!3219) j!170)))))

(declare-fun b!1000126 () Bool)

(declare-fun res!669604 () Bool)

(assert (=> b!1000126 (=> (not res!669604) (not e!563780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63209 (_ BitVec 32)) Bool)

(assert (=> b!1000126 (= res!669604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!669596 () Bool)

(assert (=> start!86408 (=> (not res!669596) (not e!563782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86408 (= res!669596 (validMask!0 mask!3464))))

(assert (=> start!86408 e!563782))

(declare-fun array_inv!23554 (array!63209) Bool)

(assert (=> start!86408 (array_inv!23554 a!3219)))

(assert (=> start!86408 true))

(declare-fun b!1000127 () Bool)

(assert (=> b!1000127 (= e!563779 false)))

(declare-fun lt!442203 () SeekEntryResult!9362)

(assert (=> b!1000127 (= lt!442203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30430 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30430 a!3219) i!1194 k!2224) j!170) (array!63210 (store (arr!30430 a!3219) i!1194 k!2224) (size!30932 a!3219)) mask!3464))))

(declare-fun b!1000128 () Bool)

(assert (=> b!1000128 (= e!563782 e!563780)))

(declare-fun res!669598 () Bool)

(assert (=> b!1000128 (=> (not res!669598) (not e!563780))))

(declare-fun lt!442204 () SeekEntryResult!9362)

(assert (=> b!1000128 (= res!669598 (or (= lt!442204 (MissingVacant!9362 i!1194)) (= lt!442204 (MissingZero!9362 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63209 (_ BitVec 32)) SeekEntryResult!9362)

(assert (=> b!1000128 (= lt!442204 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86408 res!669596) b!1000121))

(assert (= (and b!1000121 res!669603) b!1000125))

(assert (= (and b!1000125 res!669605) b!1000120))

(assert (= (and b!1000120 res!669601) b!1000119))

(assert (= (and b!1000119 res!669600) b!1000128))

(assert (= (and b!1000128 res!669598) b!1000126))

(assert (= (and b!1000126 res!669604) b!1000123))

(assert (= (and b!1000123 res!669597) b!1000122))

(assert (= (and b!1000122 res!669599) b!1000124))

(assert (= (and b!1000124 res!669602) b!1000118))

(assert (= (and b!1000118 res!669606) b!1000127))

(declare-fun m!926303 () Bool)

(assert (=> start!86408 m!926303))

(declare-fun m!926305 () Bool)

(assert (=> start!86408 m!926305))

(declare-fun m!926307 () Bool)

(assert (=> b!1000125 m!926307))

(assert (=> b!1000125 m!926307))

(declare-fun m!926309 () Bool)

(assert (=> b!1000125 m!926309))

(declare-fun m!926311 () Bool)

(assert (=> b!1000128 m!926311))

(declare-fun m!926313 () Bool)

(assert (=> b!1000120 m!926313))

(declare-fun m!926315 () Bool)

(assert (=> b!1000126 m!926315))

(declare-fun m!926317 () Bool)

(assert (=> b!1000123 m!926317))

(assert (=> b!1000124 m!926307))

(assert (=> b!1000124 m!926307))

(declare-fun m!926319 () Bool)

(assert (=> b!1000124 m!926319))

(assert (=> b!1000124 m!926319))

(assert (=> b!1000124 m!926307))

(declare-fun m!926321 () Bool)

(assert (=> b!1000124 m!926321))

(declare-fun m!926323 () Bool)

(assert (=> b!1000119 m!926323))

(declare-fun m!926325 () Bool)

(assert (=> b!1000127 m!926325))

(declare-fun m!926327 () Bool)

(assert (=> b!1000127 m!926327))

(assert (=> b!1000127 m!926327))

(declare-fun m!926329 () Bool)

(assert (=> b!1000127 m!926329))

(assert (=> b!1000127 m!926329))

(assert (=> b!1000127 m!926327))

(declare-fun m!926331 () Bool)

(assert (=> b!1000127 m!926331))

(assert (=> b!1000118 m!926307))

(assert (=> b!1000118 m!926307))

(declare-fun m!926333 () Bool)

(assert (=> b!1000118 m!926333))

(push 1)

