; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86784 () Bool)

(assert start!86784)

(declare-fun b!1006101 () Bool)

(declare-fun res!675322 () Bool)

(declare-fun e!566323 () Bool)

(assert (=> b!1006101 (=> (not res!675322) (not e!566323))))

(declare-datatypes ((array!63430 0))(
  ( (array!63431 (arr!30537 (Array (_ BitVec 32) (_ BitVec 64))) (size!31041 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63430)

(declare-datatypes ((List!21279 0))(
  ( (Nil!21276) (Cons!21275 (h!22458 (_ BitVec 64)) (t!30271 List!21279)) )
))
(declare-fun arrayNoDuplicates!0 (array!63430 (_ BitVec 32) List!21279) Bool)

(assert (=> b!1006101 (= res!675322 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21276))))

(declare-fun b!1006102 () Bool)

(declare-fun res!675319 () Bool)

(declare-fun e!566321 () Bool)

(assert (=> b!1006102 (=> (not res!675319) (not e!566321))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006102 (= res!675319 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006103 () Bool)

(declare-fun e!566322 () Bool)

(assert (=> b!1006103 (= e!566323 e!566322)))

(declare-fun res!675316 () Bool)

(assert (=> b!1006103 (=> (not res!675316) (not e!566322))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9494 0))(
  ( (MissingZero!9494 (index!40347 (_ BitVec 32))) (Found!9494 (index!40348 (_ BitVec 32))) (Intermediate!9494 (undefined!10306 Bool) (index!40349 (_ BitVec 32)) (x!87761 (_ BitVec 32))) (Undefined!9494) (MissingVacant!9494 (index!40350 (_ BitVec 32))) )
))
(declare-fun lt!444521 () SeekEntryResult!9494)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63430 (_ BitVec 32)) SeekEntryResult!9494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006103 (= res!675316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30537 a!3219) j!170) mask!3464) (select (arr!30537 a!3219) j!170) a!3219 mask!3464) lt!444521))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006103 (= lt!444521 (Intermediate!9494 false resIndex!38 resX!38))))

(declare-fun b!1006104 () Bool)

(declare-fun res!675321 () Bool)

(assert (=> b!1006104 (=> (not res!675321) (not e!566321))))

(assert (=> b!1006104 (= res!675321 (validKeyInArray!0 (select (arr!30537 a!3219) j!170)))))

(declare-fun b!1006105 () Bool)

(declare-fun res!675313 () Bool)

(assert (=> b!1006105 (=> (not res!675313) (not e!566323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63430 (_ BitVec 32)) Bool)

(assert (=> b!1006105 (= res!675313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006106 () Bool)

(assert (=> b!1006106 (= e!566321 e!566323)))

(declare-fun res!675320 () Bool)

(assert (=> b!1006106 (=> (not res!675320) (not e!566323))))

(declare-fun lt!444522 () SeekEntryResult!9494)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006106 (= res!675320 (or (= lt!444522 (MissingVacant!9494 i!1194)) (= lt!444522 (MissingZero!9494 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63430 (_ BitVec 32)) SeekEntryResult!9494)

(assert (=> b!1006106 (= lt!444522 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006107 () Bool)

(declare-fun res!675314 () Bool)

(assert (=> b!1006107 (=> (not res!675314) (not e!566323))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1006107 (= res!675314 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31041 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31041 a!3219))))))

(declare-fun b!1006108 () Bool)

(declare-fun res!675317 () Bool)

(assert (=> b!1006108 (=> (not res!675317) (not e!566322))))

(assert (=> b!1006108 (= res!675317 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30537 a!3219) j!170) a!3219 mask!3464) lt!444521))))

(declare-fun b!1006109 () Bool)

(declare-fun res!675315 () Bool)

(assert (=> b!1006109 (=> (not res!675315) (not e!566321))))

(assert (=> b!1006109 (= res!675315 (and (= (size!31041 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31041 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31041 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675323 () Bool)

(assert (=> start!86784 (=> (not res!675323) (not e!566321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86784 (= res!675323 (validMask!0 mask!3464))))

(assert (=> start!86784 e!566321))

(declare-fun array_inv!23680 (array!63430) Bool)

(assert (=> start!86784 (array_inv!23680 a!3219)))

(assert (=> start!86784 true))

(declare-fun b!1006110 () Bool)

(declare-fun res!675318 () Bool)

(assert (=> b!1006110 (=> (not res!675318) (not e!566321))))

(declare-fun arrayContainsKey!0 (array!63430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006110 (= res!675318 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006111 () Bool)

(assert (=> b!1006111 (= e!566322 false)))

(declare-fun lt!444523 () SeekEntryResult!9494)

(assert (=> b!1006111 (= lt!444523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30537 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30537 a!3219) i!1194 k0!2224) j!170) (array!63431 (store (arr!30537 a!3219) i!1194 k0!2224) (size!31041 a!3219)) mask!3464))))

(assert (= (and start!86784 res!675323) b!1006109))

(assert (= (and b!1006109 res!675315) b!1006104))

(assert (= (and b!1006104 res!675321) b!1006102))

(assert (= (and b!1006102 res!675319) b!1006110))

(assert (= (and b!1006110 res!675318) b!1006106))

(assert (= (and b!1006106 res!675320) b!1006105))

(assert (= (and b!1006105 res!675313) b!1006101))

(assert (= (and b!1006101 res!675322) b!1006107))

(assert (= (and b!1006107 res!675314) b!1006103))

(assert (= (and b!1006103 res!675316) b!1006108))

(assert (= (and b!1006108 res!675317) b!1006111))

(declare-fun m!930691 () Bool)

(assert (=> b!1006106 m!930691))

(declare-fun m!930693 () Bool)

(assert (=> b!1006103 m!930693))

(assert (=> b!1006103 m!930693))

(declare-fun m!930695 () Bool)

(assert (=> b!1006103 m!930695))

(assert (=> b!1006103 m!930695))

(assert (=> b!1006103 m!930693))

(declare-fun m!930697 () Bool)

(assert (=> b!1006103 m!930697))

(declare-fun m!930699 () Bool)

(assert (=> b!1006105 m!930699))

(declare-fun m!930701 () Bool)

(assert (=> b!1006111 m!930701))

(declare-fun m!930703 () Bool)

(assert (=> b!1006111 m!930703))

(assert (=> b!1006111 m!930703))

(declare-fun m!930705 () Bool)

(assert (=> b!1006111 m!930705))

(assert (=> b!1006111 m!930705))

(assert (=> b!1006111 m!930703))

(declare-fun m!930707 () Bool)

(assert (=> b!1006111 m!930707))

(declare-fun m!930709 () Bool)

(assert (=> start!86784 m!930709))

(declare-fun m!930711 () Bool)

(assert (=> start!86784 m!930711))

(declare-fun m!930713 () Bool)

(assert (=> b!1006101 m!930713))

(declare-fun m!930715 () Bool)

(assert (=> b!1006102 m!930715))

(assert (=> b!1006104 m!930693))

(assert (=> b!1006104 m!930693))

(declare-fun m!930717 () Bool)

(assert (=> b!1006104 m!930717))

(assert (=> b!1006108 m!930693))

(assert (=> b!1006108 m!930693))

(declare-fun m!930719 () Bool)

(assert (=> b!1006108 m!930719))

(declare-fun m!930721 () Bool)

(assert (=> b!1006110 m!930721))

(check-sat (not b!1006111) (not b!1006108) (not start!86784) (not b!1006106) (not b!1006104) (not b!1006105) (not b!1006110) (not b!1006101) (not b!1006103) (not b!1006102))
(check-sat)
