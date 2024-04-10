; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86784 () Bool)

(assert start!86784)

(declare-fun b!1006187 () Bool)

(declare-fun e!566407 () Bool)

(declare-fun e!566405 () Bool)

(assert (=> b!1006187 (= e!566407 e!566405)))

(declare-fun res!675276 () Bool)

(assert (=> b!1006187 (=> (not res!675276) (not e!566405))))

(declare-datatypes ((array!63483 0))(
  ( (array!63484 (arr!30564 (Array (_ BitVec 32) (_ BitVec 64))) (size!31066 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63483)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9496 0))(
  ( (MissingZero!9496 (index!40355 (_ BitVec 32))) (Found!9496 (index!40356 (_ BitVec 32))) (Intermediate!9496 (undefined!10308 Bool) (index!40357 (_ BitVec 32)) (x!87752 (_ BitVec 32))) (Undefined!9496) (MissingVacant!9496 (index!40358 (_ BitVec 32))) )
))
(declare-fun lt!444717 () SeekEntryResult!9496)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63483 (_ BitVec 32)) SeekEntryResult!9496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006187 (= res!675276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30564 a!3219) j!170) mask!3464) (select (arr!30564 a!3219) j!170) a!3219 mask!3464) lt!444717))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006187 (= lt!444717 (Intermediate!9496 false resIndex!38 resX!38))))

(declare-fun b!1006188 () Bool)

(declare-fun e!566406 () Bool)

(assert (=> b!1006188 (= e!566406 e!566407)))

(declare-fun res!675279 () Bool)

(assert (=> b!1006188 (=> (not res!675279) (not e!566407))))

(declare-fun lt!444718 () SeekEntryResult!9496)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006188 (= res!675279 (or (= lt!444718 (MissingVacant!9496 i!1194)) (= lt!444718 (MissingZero!9496 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63483 (_ BitVec 32)) SeekEntryResult!9496)

(assert (=> b!1006188 (= lt!444718 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006189 () Bool)

(declare-fun res!675283 () Bool)

(assert (=> b!1006189 (=> (not res!675283) (not e!566406))))

(assert (=> b!1006189 (= res!675283 (and (= (size!31066 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31066 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31066 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006190 () Bool)

(declare-fun res!675277 () Bool)

(assert (=> b!1006190 (=> (not res!675277) (not e!566406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006190 (= res!675277 (validKeyInArray!0 k!2224))))

(declare-fun b!1006191 () Bool)

(declare-fun res!675285 () Bool)

(assert (=> b!1006191 (=> (not res!675285) (not e!566406))))

(assert (=> b!1006191 (= res!675285 (validKeyInArray!0 (select (arr!30564 a!3219) j!170)))))

(declare-fun b!1006192 () Bool)

(assert (=> b!1006192 (= e!566405 false)))

(declare-fun lt!444719 () (_ BitVec 32))

(assert (=> b!1006192 (= lt!444719 (toIndex!0 (select (store (arr!30564 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!1006193 () Bool)

(declare-fun res!675280 () Bool)

(assert (=> b!1006193 (=> (not res!675280) (not e!566407))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1006193 (= res!675280 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31066 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31066 a!3219))))))

(declare-fun b!1006194 () Bool)

(declare-fun res!675284 () Bool)

(assert (=> b!1006194 (=> (not res!675284) (not e!566405))))

(assert (=> b!1006194 (= res!675284 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30564 a!3219) j!170) a!3219 mask!3464) lt!444717))))

(declare-fun res!675278 () Bool)

(assert (=> start!86784 (=> (not res!675278) (not e!566406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86784 (= res!675278 (validMask!0 mask!3464))))

(assert (=> start!86784 e!566406))

(declare-fun array_inv!23688 (array!63483) Bool)

(assert (=> start!86784 (array_inv!23688 a!3219)))

(assert (=> start!86784 true))

(declare-fun b!1006195 () Bool)

(declare-fun res!675282 () Bool)

(assert (=> b!1006195 (=> (not res!675282) (not e!566406))))

(declare-fun arrayContainsKey!0 (array!63483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006195 (= res!675282 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006196 () Bool)

(declare-fun res!675281 () Bool)

(assert (=> b!1006196 (=> (not res!675281) (not e!566407))))

(declare-datatypes ((List!21240 0))(
  ( (Nil!21237) (Cons!21236 (h!22419 (_ BitVec 64)) (t!30241 List!21240)) )
))
(declare-fun arrayNoDuplicates!0 (array!63483 (_ BitVec 32) List!21240) Bool)

(assert (=> b!1006196 (= res!675281 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21237))))

(declare-fun b!1006197 () Bool)

(declare-fun res!675275 () Bool)

(assert (=> b!1006197 (=> (not res!675275) (not e!566407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63483 (_ BitVec 32)) Bool)

(assert (=> b!1006197 (= res!675275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86784 res!675278) b!1006189))

(assert (= (and b!1006189 res!675283) b!1006191))

(assert (= (and b!1006191 res!675285) b!1006190))

(assert (= (and b!1006190 res!675277) b!1006195))

(assert (= (and b!1006195 res!675282) b!1006188))

(assert (= (and b!1006188 res!675279) b!1006197))

(assert (= (and b!1006197 res!675275) b!1006196))

(assert (= (and b!1006196 res!675281) b!1006193))

(assert (= (and b!1006193 res!675280) b!1006187))

(assert (= (and b!1006187 res!675276) b!1006194))

(assert (= (and b!1006194 res!675284) b!1006192))

(declare-fun m!931295 () Bool)

(assert (=> b!1006192 m!931295))

(declare-fun m!931297 () Bool)

(assert (=> b!1006192 m!931297))

(assert (=> b!1006192 m!931297))

(declare-fun m!931299 () Bool)

(assert (=> b!1006192 m!931299))

(declare-fun m!931301 () Bool)

(assert (=> b!1006188 m!931301))

(declare-fun m!931303 () Bool)

(assert (=> b!1006191 m!931303))

(assert (=> b!1006191 m!931303))

(declare-fun m!931305 () Bool)

(assert (=> b!1006191 m!931305))

(assert (=> b!1006194 m!931303))

(assert (=> b!1006194 m!931303))

(declare-fun m!931307 () Bool)

(assert (=> b!1006194 m!931307))

(declare-fun m!931309 () Bool)

(assert (=> b!1006197 m!931309))

(declare-fun m!931311 () Bool)

(assert (=> b!1006196 m!931311))

(declare-fun m!931313 () Bool)

(assert (=> start!86784 m!931313))

(declare-fun m!931315 () Bool)

(assert (=> start!86784 m!931315))

(assert (=> b!1006187 m!931303))

(assert (=> b!1006187 m!931303))

(declare-fun m!931317 () Bool)

(assert (=> b!1006187 m!931317))

(assert (=> b!1006187 m!931317))

(assert (=> b!1006187 m!931303))

(declare-fun m!931319 () Bool)

(assert (=> b!1006187 m!931319))

(declare-fun m!931321 () Bool)

(assert (=> b!1006195 m!931321))

(declare-fun m!931323 () Bool)

(assert (=> b!1006190 m!931323))

(push 1)

(assert (not b!1006194))

(assert (not b!1006195))

(assert (not b!1006187))

