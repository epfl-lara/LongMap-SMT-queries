; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86602 () Bool)

(assert start!86602)

(declare-fun b!1001355 () Bool)

(declare-fun res!670270 () Bool)

(declare-fun e!564494 () Bool)

(assert (=> b!1001355 (=> (not res!670270) (not e!564494))))

(declare-datatypes ((array!63273 0))(
  ( (array!63274 (arr!30457 (Array (_ BitVec 32) (_ BitVec 64))) (size!30960 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63273)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63273 (_ BitVec 32)) Bool)

(assert (=> b!1001355 (= res!670270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001356 () Bool)

(declare-fun res!670267 () Bool)

(declare-fun e!564493 () Bool)

(assert (=> b!1001356 (=> (not res!670267) (not e!564493))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9325 0))(
  ( (MissingZero!9325 (index!39671 (_ BitVec 32))) (Found!9325 (index!39672 (_ BitVec 32))) (Intermediate!9325 (undefined!10137 Bool) (index!39673 (_ BitVec 32)) (x!87255 (_ BitVec 32))) (Undefined!9325) (MissingVacant!9325 (index!39674 (_ BitVec 32))) )
))
(declare-fun lt!442652 () SeekEntryResult!9325)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63273 (_ BitVec 32)) SeekEntryResult!9325)

(assert (=> b!1001356 (= res!670267 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30457 a!3219) j!170) a!3219 mask!3464) lt!442652))))

(declare-fun res!670276 () Bool)

(declare-fun e!564495 () Bool)

(assert (=> start!86602 (=> (not res!670276) (not e!564495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86602 (= res!670276 (validMask!0 mask!3464))))

(assert (=> start!86602 e!564495))

(declare-fun array_inv!23593 (array!63273) Bool)

(assert (=> start!86602 (array_inv!23593 a!3219)))

(assert (=> start!86602 true))

(declare-fun b!1001357 () Bool)

(declare-fun res!670269 () Bool)

(assert (=> b!1001357 (=> (not res!670269) (not e!564494))))

(declare-datatypes ((List!21104 0))(
  ( (Nil!21101) (Cons!21100 (h!22283 (_ BitVec 64)) (t!30097 List!21104)) )
))
(declare-fun arrayNoDuplicates!0 (array!63273 (_ BitVec 32) List!21104) Bool)

(assert (=> b!1001357 (= res!670269 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21101))))

(declare-fun b!1001358 () Bool)

(assert (=> b!1001358 (= e!564493 false)))

(declare-fun lt!442650 () SeekEntryResult!9325)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001358 (= lt!442650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30457 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30457 a!3219) i!1194 k0!2224) j!170) (array!63274 (store (arr!30457 a!3219) i!1194 k0!2224) (size!30960 a!3219)) mask!3464))))

(declare-fun b!1001359 () Bool)

(declare-fun res!670271 () Bool)

(assert (=> b!1001359 (=> (not res!670271) (not e!564495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001359 (= res!670271 (validKeyInArray!0 (select (arr!30457 a!3219) j!170)))))

(declare-fun b!1001360 () Bool)

(declare-fun res!670272 () Bool)

(assert (=> b!1001360 (=> (not res!670272) (not e!564495))))

(assert (=> b!1001360 (= res!670272 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001361 () Bool)

(assert (=> b!1001361 (= e!564495 e!564494)))

(declare-fun res!670277 () Bool)

(assert (=> b!1001361 (=> (not res!670277) (not e!564494))))

(declare-fun lt!442651 () SeekEntryResult!9325)

(assert (=> b!1001361 (= res!670277 (or (= lt!442651 (MissingVacant!9325 i!1194)) (= lt!442651 (MissingZero!9325 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63273 (_ BitVec 32)) SeekEntryResult!9325)

(assert (=> b!1001361 (= lt!442651 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001362 () Bool)

(assert (=> b!1001362 (= e!564494 e!564493)))

(declare-fun res!670268 () Bool)

(assert (=> b!1001362 (=> (not res!670268) (not e!564493))))

(assert (=> b!1001362 (= res!670268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30457 a!3219) j!170) mask!3464) (select (arr!30457 a!3219) j!170) a!3219 mask!3464) lt!442652))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001362 (= lt!442652 (Intermediate!9325 false resIndex!38 resX!38))))

(declare-fun b!1001363 () Bool)

(declare-fun res!670275 () Bool)

(assert (=> b!1001363 (=> (not res!670275) (not e!564495))))

(assert (=> b!1001363 (= res!670275 (and (= (size!30960 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30960 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30960 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001364 () Bool)

(declare-fun res!670274 () Bool)

(assert (=> b!1001364 (=> (not res!670274) (not e!564494))))

(assert (=> b!1001364 (= res!670274 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30960 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30960 a!3219))))))

(declare-fun b!1001365 () Bool)

(declare-fun res!670273 () Bool)

(assert (=> b!1001365 (=> (not res!670273) (not e!564495))))

(declare-fun arrayContainsKey!0 (array!63273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001365 (= res!670273 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86602 res!670276) b!1001363))

(assert (= (and b!1001363 res!670275) b!1001359))

(assert (= (and b!1001359 res!670271) b!1001360))

(assert (= (and b!1001360 res!670272) b!1001365))

(assert (= (and b!1001365 res!670273) b!1001361))

(assert (= (and b!1001361 res!670277) b!1001355))

(assert (= (and b!1001355 res!670270) b!1001357))

(assert (= (and b!1001357 res!670269) b!1001364))

(assert (= (and b!1001364 res!670274) b!1001362))

(assert (= (and b!1001362 res!670268) b!1001356))

(assert (= (and b!1001356 res!670267) b!1001358))

(declare-fun m!927929 () Bool)

(assert (=> start!86602 m!927929))

(declare-fun m!927931 () Bool)

(assert (=> start!86602 m!927931))

(declare-fun m!927933 () Bool)

(assert (=> b!1001362 m!927933))

(assert (=> b!1001362 m!927933))

(declare-fun m!927935 () Bool)

(assert (=> b!1001362 m!927935))

(assert (=> b!1001362 m!927935))

(assert (=> b!1001362 m!927933))

(declare-fun m!927937 () Bool)

(assert (=> b!1001362 m!927937))

(declare-fun m!927939 () Bool)

(assert (=> b!1001360 m!927939))

(declare-fun m!927941 () Bool)

(assert (=> b!1001358 m!927941))

(declare-fun m!927943 () Bool)

(assert (=> b!1001358 m!927943))

(assert (=> b!1001358 m!927943))

(declare-fun m!927945 () Bool)

(assert (=> b!1001358 m!927945))

(assert (=> b!1001358 m!927945))

(assert (=> b!1001358 m!927943))

(declare-fun m!927947 () Bool)

(assert (=> b!1001358 m!927947))

(assert (=> b!1001359 m!927933))

(assert (=> b!1001359 m!927933))

(declare-fun m!927949 () Bool)

(assert (=> b!1001359 m!927949))

(declare-fun m!927951 () Bool)

(assert (=> b!1001365 m!927951))

(declare-fun m!927953 () Bool)

(assert (=> b!1001355 m!927953))

(declare-fun m!927955 () Bool)

(assert (=> b!1001357 m!927955))

(declare-fun m!927957 () Bool)

(assert (=> b!1001361 m!927957))

(assert (=> b!1001356 m!927933))

(assert (=> b!1001356 m!927933))

(declare-fun m!927959 () Bool)

(assert (=> b!1001356 m!927959))

(check-sat (not b!1001355) (not b!1001361) (not b!1001360) (not start!86602) (not b!1001356) (not b!1001365) (not b!1001359) (not b!1001357) (not b!1001362) (not b!1001358))
(check-sat)
