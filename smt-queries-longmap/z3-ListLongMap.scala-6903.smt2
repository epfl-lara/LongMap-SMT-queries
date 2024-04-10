; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86782 () Bool)

(assert start!86782)

(declare-fun b!1006154 () Bool)

(declare-fun e!566393 () Bool)

(assert (=> b!1006154 (= e!566393 false)))

(declare-datatypes ((array!63481 0))(
  ( (array!63482 (arr!30563 (Array (_ BitVec 32) (_ BitVec 64))) (size!31065 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63481)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun lt!444710 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006154 (= lt!444710 (toIndex!0 (select (store (arr!30563 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1006155 () Bool)

(declare-fun e!566395 () Bool)

(assert (=> b!1006155 (= e!566395 e!566393)))

(declare-fun res!675246 () Bool)

(assert (=> b!1006155 (=> (not res!675246) (not e!566393))))

(declare-datatypes ((SeekEntryResult!9495 0))(
  ( (MissingZero!9495 (index!40351 (_ BitVec 32))) (Found!9495 (index!40352 (_ BitVec 32))) (Intermediate!9495 (undefined!10307 Bool) (index!40353 (_ BitVec 32)) (x!87751 (_ BitVec 32))) (Undefined!9495) (MissingVacant!9495 (index!40354 (_ BitVec 32))) )
))
(declare-fun lt!444708 () SeekEntryResult!9495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63481 (_ BitVec 32)) SeekEntryResult!9495)

(assert (=> b!1006155 (= res!675246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30563 a!3219) j!170) mask!3464) (select (arr!30563 a!3219) j!170) a!3219 mask!3464) lt!444708))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006155 (= lt!444708 (Intermediate!9495 false resIndex!38 resX!38))))

(declare-fun b!1006156 () Bool)

(declare-fun e!566394 () Bool)

(assert (=> b!1006156 (= e!566394 e!566395)))

(declare-fun res!675250 () Bool)

(assert (=> b!1006156 (=> (not res!675250) (not e!566395))))

(declare-fun lt!444709 () SeekEntryResult!9495)

(assert (=> b!1006156 (= res!675250 (or (= lt!444709 (MissingVacant!9495 i!1194)) (= lt!444709 (MissingZero!9495 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63481 (_ BitVec 32)) SeekEntryResult!9495)

(assert (=> b!1006156 (= lt!444709 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006157 () Bool)

(declare-fun res!675249 () Bool)

(assert (=> b!1006157 (=> (not res!675249) (not e!566394))))

(declare-fun arrayContainsKey!0 (array!63481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006157 (= res!675249 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006158 () Bool)

(declare-fun res!675243 () Bool)

(assert (=> b!1006158 (=> (not res!675243) (not e!566394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006158 (= res!675243 (validKeyInArray!0 (select (arr!30563 a!3219) j!170)))))

(declare-fun b!1006159 () Bool)

(declare-fun res!675242 () Bool)

(assert (=> b!1006159 (=> (not res!675242) (not e!566395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63481 (_ BitVec 32)) Bool)

(assert (=> b!1006159 (= res!675242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006160 () Bool)

(declare-fun res!675244 () Bool)

(assert (=> b!1006160 (=> (not res!675244) (not e!566394))))

(assert (=> b!1006160 (= res!675244 (and (= (size!31065 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31065 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31065 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675248 () Bool)

(assert (=> start!86782 (=> (not res!675248) (not e!566394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86782 (= res!675248 (validMask!0 mask!3464))))

(assert (=> start!86782 e!566394))

(declare-fun array_inv!23687 (array!63481) Bool)

(assert (=> start!86782 (array_inv!23687 a!3219)))

(assert (=> start!86782 true))

(declare-fun b!1006161 () Bool)

(declare-fun res!675252 () Bool)

(assert (=> b!1006161 (=> (not res!675252) (not e!566395))))

(declare-datatypes ((List!21239 0))(
  ( (Nil!21236) (Cons!21235 (h!22418 (_ BitVec 64)) (t!30240 List!21239)) )
))
(declare-fun arrayNoDuplicates!0 (array!63481 (_ BitVec 32) List!21239) Bool)

(assert (=> b!1006161 (= res!675252 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21236))))

(declare-fun b!1006162 () Bool)

(declare-fun res!675251 () Bool)

(assert (=> b!1006162 (=> (not res!675251) (not e!566393))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1006162 (= res!675251 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30563 a!3219) j!170) a!3219 mask!3464) lt!444708))))

(declare-fun b!1006163 () Bool)

(declare-fun res!675247 () Bool)

(assert (=> b!1006163 (=> (not res!675247) (not e!566395))))

(assert (=> b!1006163 (= res!675247 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31065 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31065 a!3219))))))

(declare-fun b!1006164 () Bool)

(declare-fun res!675245 () Bool)

(assert (=> b!1006164 (=> (not res!675245) (not e!566394))))

(assert (=> b!1006164 (= res!675245 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86782 res!675248) b!1006160))

(assert (= (and b!1006160 res!675244) b!1006158))

(assert (= (and b!1006158 res!675243) b!1006164))

(assert (= (and b!1006164 res!675245) b!1006157))

(assert (= (and b!1006157 res!675249) b!1006156))

(assert (= (and b!1006156 res!675250) b!1006159))

(assert (= (and b!1006159 res!675242) b!1006161))

(assert (= (and b!1006161 res!675252) b!1006163))

(assert (= (and b!1006163 res!675247) b!1006155))

(assert (= (and b!1006155 res!675246) b!1006162))

(assert (= (and b!1006162 res!675251) b!1006154))

(declare-fun m!931265 () Bool)

(assert (=> b!1006159 m!931265))

(declare-fun m!931267 () Bool)

(assert (=> b!1006156 m!931267))

(declare-fun m!931269 () Bool)

(assert (=> b!1006154 m!931269))

(declare-fun m!931271 () Bool)

(assert (=> b!1006154 m!931271))

(assert (=> b!1006154 m!931271))

(declare-fun m!931273 () Bool)

(assert (=> b!1006154 m!931273))

(declare-fun m!931275 () Bool)

(assert (=> b!1006158 m!931275))

(assert (=> b!1006158 m!931275))

(declare-fun m!931277 () Bool)

(assert (=> b!1006158 m!931277))

(declare-fun m!931279 () Bool)

(assert (=> b!1006164 m!931279))

(declare-fun m!931281 () Bool)

(assert (=> b!1006157 m!931281))

(assert (=> b!1006155 m!931275))

(assert (=> b!1006155 m!931275))

(declare-fun m!931283 () Bool)

(assert (=> b!1006155 m!931283))

(assert (=> b!1006155 m!931283))

(assert (=> b!1006155 m!931275))

(declare-fun m!931285 () Bool)

(assert (=> b!1006155 m!931285))

(assert (=> b!1006162 m!931275))

(assert (=> b!1006162 m!931275))

(declare-fun m!931287 () Bool)

(assert (=> b!1006162 m!931287))

(declare-fun m!931289 () Bool)

(assert (=> start!86782 m!931289))

(declare-fun m!931291 () Bool)

(assert (=> start!86782 m!931291))

(declare-fun m!931293 () Bool)

(assert (=> b!1006161 m!931293))

(check-sat (not start!86782) (not b!1006155) (not b!1006159) (not b!1006158) (not b!1006157) (not b!1006162) (not b!1006164) (not b!1006161) (not b!1006156) (not b!1006154))
(check-sat)
