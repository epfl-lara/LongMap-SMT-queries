; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86412 () Bool)

(assert start!86412)

(declare-fun b!1000184 () Bool)

(declare-fun res!669662 () Bool)

(declare-fun e!563805 () Bool)

(assert (=> b!1000184 (=> (not res!669662) (not e!563805))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000184 (= res!669662 (validKeyInArray!0 k!2224))))

(declare-fun b!1000185 () Bool)

(declare-fun res!669665 () Bool)

(declare-fun e!563803 () Bool)

(assert (=> b!1000185 (=> (not res!669665) (not e!563803))))

(declare-datatypes ((array!63213 0))(
  ( (array!63214 (arr!30432 (Array (_ BitVec 32) (_ BitVec 64))) (size!30934 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63213)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000185 (= res!669665 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30934 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30934 a!3219))))))

(declare-fun b!1000186 () Bool)

(declare-fun e!563804 () Bool)

(assert (=> b!1000186 (= e!563804 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9364 0))(
  ( (MissingZero!9364 (index!39827 (_ BitVec 32))) (Found!9364 (index!39828 (_ BitVec 32))) (Intermediate!9364 (undefined!10176 Bool) (index!39829 (_ BitVec 32)) (x!87256 (_ BitVec 32))) (Undefined!9364) (MissingVacant!9364 (index!39830 (_ BitVec 32))) )
))
(declare-fun lt!442222 () SeekEntryResult!9364)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63213 (_ BitVec 32)) SeekEntryResult!9364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000186 (= lt!442222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30432 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30432 a!3219) i!1194 k!2224) j!170) (array!63214 (store (arr!30432 a!3219) i!1194 k!2224) (size!30934 a!3219)) mask!3464))))

(declare-fun b!1000187 () Bool)

(assert (=> b!1000187 (= e!563805 e!563803)))

(declare-fun res!669672 () Bool)

(assert (=> b!1000187 (=> (not res!669672) (not e!563803))))

(declare-fun lt!442223 () SeekEntryResult!9364)

(assert (=> b!1000187 (= res!669672 (or (= lt!442223 (MissingVacant!9364 i!1194)) (= lt!442223 (MissingZero!9364 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63213 (_ BitVec 32)) SeekEntryResult!9364)

(assert (=> b!1000187 (= lt!442223 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000188 () Bool)

(declare-fun res!669667 () Bool)

(assert (=> b!1000188 (=> (not res!669667) (not e!563803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63213 (_ BitVec 32)) Bool)

(assert (=> b!1000188 (= res!669667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!669663 () Bool)

(assert (=> start!86412 (=> (not res!669663) (not e!563805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86412 (= res!669663 (validMask!0 mask!3464))))

(assert (=> start!86412 e!563805))

(declare-fun array_inv!23556 (array!63213) Bool)

(assert (=> start!86412 (array_inv!23556 a!3219)))

(assert (=> start!86412 true))

(declare-fun b!1000189 () Bool)

(declare-fun res!669666 () Bool)

(assert (=> b!1000189 (=> (not res!669666) (not e!563805))))

(assert (=> b!1000189 (= res!669666 (validKeyInArray!0 (select (arr!30432 a!3219) j!170)))))

(declare-fun b!1000190 () Bool)

(declare-fun res!669664 () Bool)

(assert (=> b!1000190 (=> (not res!669664) (not e!563804))))

(declare-fun lt!442221 () SeekEntryResult!9364)

(assert (=> b!1000190 (= res!669664 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30432 a!3219) j!170) a!3219 mask!3464) lt!442221))))

(declare-fun b!1000191 () Bool)

(declare-fun res!669669 () Bool)

(assert (=> b!1000191 (=> (not res!669669) (not e!563805))))

(declare-fun arrayContainsKey!0 (array!63213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000191 (= res!669669 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000192 () Bool)

(declare-fun res!669670 () Bool)

(assert (=> b!1000192 (=> (not res!669670) (not e!563805))))

(assert (=> b!1000192 (= res!669670 (and (= (size!30934 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30934 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30934 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000193 () Bool)

(assert (=> b!1000193 (= e!563803 e!563804)))

(declare-fun res!669668 () Bool)

(assert (=> b!1000193 (=> (not res!669668) (not e!563804))))

(assert (=> b!1000193 (= res!669668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30432 a!3219) j!170) mask!3464) (select (arr!30432 a!3219) j!170) a!3219 mask!3464) lt!442221))))

(assert (=> b!1000193 (= lt!442221 (Intermediate!9364 false resIndex!38 resX!38))))

(declare-fun b!1000194 () Bool)

(declare-fun res!669671 () Bool)

(assert (=> b!1000194 (=> (not res!669671) (not e!563803))))

(declare-datatypes ((List!21108 0))(
  ( (Nil!21105) (Cons!21104 (h!22281 (_ BitVec 64)) (t!30109 List!21108)) )
))
(declare-fun arrayNoDuplicates!0 (array!63213 (_ BitVec 32) List!21108) Bool)

(assert (=> b!1000194 (= res!669671 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21105))))

(assert (= (and start!86412 res!669663) b!1000192))

(assert (= (and b!1000192 res!669670) b!1000189))

(assert (= (and b!1000189 res!669666) b!1000184))

(assert (= (and b!1000184 res!669662) b!1000191))

(assert (= (and b!1000191 res!669669) b!1000187))

(assert (= (and b!1000187 res!669672) b!1000188))

(assert (= (and b!1000188 res!669667) b!1000194))

(assert (= (and b!1000194 res!669671) b!1000185))

(assert (= (and b!1000185 res!669665) b!1000193))

(assert (= (and b!1000193 res!669668) b!1000190))

(assert (= (and b!1000190 res!669664) b!1000186))

(declare-fun m!926367 () Bool)

(assert (=> b!1000188 m!926367))

(declare-fun m!926369 () Bool)

(assert (=> b!1000186 m!926369))

(declare-fun m!926371 () Bool)

(assert (=> b!1000186 m!926371))

(assert (=> b!1000186 m!926371))

(declare-fun m!926373 () Bool)

(assert (=> b!1000186 m!926373))

(assert (=> b!1000186 m!926373))

(assert (=> b!1000186 m!926371))

(declare-fun m!926375 () Bool)

(assert (=> b!1000186 m!926375))

(declare-fun m!926377 () Bool)

(assert (=> start!86412 m!926377))

(declare-fun m!926379 () Bool)

(assert (=> start!86412 m!926379))

(declare-fun m!926381 () Bool)

(assert (=> b!1000190 m!926381))

(assert (=> b!1000190 m!926381))

(declare-fun m!926383 () Bool)

(assert (=> b!1000190 m!926383))

(declare-fun m!926385 () Bool)

(assert (=> b!1000191 m!926385))

(declare-fun m!926387 () Bool)

(assert (=> b!1000194 m!926387))

(declare-fun m!926389 () Bool)

(assert (=> b!1000187 m!926389))

(assert (=> b!1000189 m!926381))

(assert (=> b!1000189 m!926381))

(declare-fun m!926391 () Bool)

(assert (=> b!1000189 m!926391))

(assert (=> b!1000193 m!926381))

(assert (=> b!1000193 m!926381))

(declare-fun m!926393 () Bool)

(assert (=> b!1000193 m!926393))

(assert (=> b!1000193 m!926393))

(assert (=> b!1000193 m!926381))

(declare-fun m!926395 () Bool)

(assert (=> b!1000193 m!926395))

(declare-fun m!926397 () Bool)

(assert (=> b!1000184 m!926397))

(push 1)

(assert (not b!1000194))

(assert (not b!1000193))

(assert (not b!1000187))

(assert (not b!1000186))

(assert (not b!1000184))

(assert (not start!86412))

(assert (not b!1000190))

(assert (not b!1000188))

(assert (not b!1000191))

