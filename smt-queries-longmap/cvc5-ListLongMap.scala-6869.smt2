; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86468 () Bool)

(assert start!86468)

(declare-fun b!1001202 () Bool)

(declare-fun e!564189 () Bool)

(declare-fun e!564191 () Bool)

(assert (=> b!1001202 (= e!564189 e!564191)))

(declare-fun res!670683 () Bool)

(assert (=> b!1001202 (=> (not res!670683) (not e!564191))))

(declare-datatypes ((SeekEntryResult!9392 0))(
  ( (MissingZero!9392 (index!39939 (_ BitVec 32))) (Found!9392 (index!39940 (_ BitVec 32))) (Intermediate!9392 (undefined!10204 Bool) (index!39941 (_ BitVec 32)) (x!87364 (_ BitVec 32))) (Undefined!9392) (MissingVacant!9392 (index!39942 (_ BitVec 32))) )
))
(declare-fun lt!442564 () SeekEntryResult!9392)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001202 (= res!670683 (or (= lt!442564 (MissingVacant!9392 i!1194)) (= lt!442564 (MissingZero!9392 i!1194))))))

(declare-datatypes ((array!63269 0))(
  ( (array!63270 (arr!30460 (Array (_ BitVec 32) (_ BitVec 64))) (size!30962 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63269)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63269 (_ BitVec 32)) SeekEntryResult!9392)

(assert (=> b!1001202 (= lt!442564 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001203 () Bool)

(declare-fun e!564192 () Bool)

(assert (=> b!1001203 (= e!564191 e!564192)))

(declare-fun res!670685 () Bool)

(assert (=> b!1001203 (=> (not res!670685) (not e!564192))))

(declare-fun lt!442563 () SeekEntryResult!9392)

(declare-fun lt!442560 () SeekEntryResult!9392)

(assert (=> b!1001203 (= res!670685 (= lt!442563 lt!442560))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001203 (= lt!442560 (Intermediate!9392 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63269 (_ BitVec 32)) SeekEntryResult!9392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001203 (= lt!442563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30460 a!3219) j!170) mask!3464) (select (arr!30460 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001204 () Bool)

(declare-fun e!564188 () Bool)

(assert (=> b!1001204 (= e!564192 e!564188)))

(declare-fun res!670680 () Bool)

(assert (=> b!1001204 (=> (not res!670680) (not e!564188))))

(declare-fun lt!442565 () SeekEntryResult!9392)

(assert (=> b!1001204 (= res!670680 (= lt!442565 lt!442560))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001204 (= lt!442565 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30460 a!3219) j!170) a!3219 mask!3464))))

(declare-fun e!564190 () Bool)

(declare-fun b!1001205 () Bool)

(assert (=> b!1001205 (= e!564190 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1001206 () Bool)

(assert (=> b!1001206 (= e!564188 e!564190)))

(declare-fun res!670684 () Bool)

(assert (=> b!1001206 (=> (not res!670684) (not e!564190))))

(declare-fun lt!442562 () (_ BitVec 64))

(declare-fun lt!442561 () array!63269)

(assert (=> b!1001206 (= res!670684 (not (= lt!442563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442562 mask!3464) lt!442562 lt!442561 mask!3464))))))

(assert (=> b!1001206 (= lt!442562 (select (store (arr!30460 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001206 (= lt!442561 (array!63270 (store (arr!30460 a!3219) i!1194 k!2224) (size!30962 a!3219)))))

(declare-fun b!1001207 () Bool)

(declare-fun res!670687 () Bool)

(assert (=> b!1001207 (=> (not res!670687) (not e!564189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001207 (= res!670687 (validKeyInArray!0 (select (arr!30460 a!3219) j!170)))))

(declare-fun b!1001208 () Bool)

(declare-fun res!670688 () Bool)

(assert (=> b!1001208 (=> (not res!670688) (not e!564189))))

(assert (=> b!1001208 (= res!670688 (and (= (size!30962 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30962 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30962 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001209 () Bool)

(declare-fun res!670691 () Bool)

(assert (=> b!1001209 (=> (not res!670691) (not e!564191))))

(assert (=> b!1001209 (= res!670691 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30962 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30962 a!3219))))))

(declare-fun res!670681 () Bool)

(assert (=> start!86468 (=> (not res!670681) (not e!564189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86468 (= res!670681 (validMask!0 mask!3464))))

(assert (=> start!86468 e!564189))

(declare-fun array_inv!23584 (array!63269) Bool)

(assert (=> start!86468 (array_inv!23584 a!3219)))

(assert (=> start!86468 true))

(declare-fun b!1001210 () Bool)

(declare-fun res!670692 () Bool)

(assert (=> b!1001210 (=> (not res!670692) (not e!564191))))

(declare-datatypes ((List!21136 0))(
  ( (Nil!21133) (Cons!21132 (h!22309 (_ BitVec 64)) (t!30137 List!21136)) )
))
(declare-fun arrayNoDuplicates!0 (array!63269 (_ BitVec 32) List!21136) Bool)

(assert (=> b!1001210 (= res!670692 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21133))))

(declare-fun b!1001211 () Bool)

(declare-fun res!670682 () Bool)

(assert (=> b!1001211 (=> (not res!670682) (not e!564189))))

(assert (=> b!1001211 (= res!670682 (validKeyInArray!0 k!2224))))

(declare-fun b!1001212 () Bool)

(declare-fun res!670690 () Bool)

(assert (=> b!1001212 (=> (not res!670690) (not e!564190))))

(assert (=> b!1001212 (= res!670690 (not (= lt!442565 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442562 lt!442561 mask!3464))))))

(declare-fun b!1001213 () Bool)

(declare-fun res!670686 () Bool)

(assert (=> b!1001213 (=> (not res!670686) (not e!564189))))

(declare-fun arrayContainsKey!0 (array!63269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001213 (= res!670686 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001214 () Bool)

(declare-fun res!670689 () Bool)

(assert (=> b!1001214 (=> (not res!670689) (not e!564191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63269 (_ BitVec 32)) Bool)

(assert (=> b!1001214 (= res!670689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86468 res!670681) b!1001208))

(assert (= (and b!1001208 res!670688) b!1001207))

(assert (= (and b!1001207 res!670687) b!1001211))

(assert (= (and b!1001211 res!670682) b!1001213))

(assert (= (and b!1001213 res!670686) b!1001202))

(assert (= (and b!1001202 res!670683) b!1001214))

(assert (= (and b!1001214 res!670689) b!1001210))

(assert (= (and b!1001210 res!670692) b!1001209))

(assert (= (and b!1001209 res!670691) b!1001203))

(assert (= (and b!1001203 res!670685) b!1001204))

(assert (= (and b!1001204 res!670680) b!1001206))

(assert (= (and b!1001206 res!670684) b!1001212))

(assert (= (and b!1001212 res!670690) b!1001205))

(declare-fun m!927287 () Bool)

(assert (=> b!1001212 m!927287))

(declare-fun m!927289 () Bool)

(assert (=> b!1001202 m!927289))

(declare-fun m!927291 () Bool)

(assert (=> b!1001204 m!927291))

(assert (=> b!1001204 m!927291))

(declare-fun m!927293 () Bool)

(assert (=> b!1001204 m!927293))

(declare-fun m!927295 () Bool)

(assert (=> start!86468 m!927295))

(declare-fun m!927297 () Bool)

(assert (=> start!86468 m!927297))

(declare-fun m!927299 () Bool)

(assert (=> b!1001206 m!927299))

(assert (=> b!1001206 m!927299))

(declare-fun m!927301 () Bool)

(assert (=> b!1001206 m!927301))

(declare-fun m!927303 () Bool)

(assert (=> b!1001206 m!927303))

(declare-fun m!927305 () Bool)

(assert (=> b!1001206 m!927305))

(declare-fun m!927307 () Bool)

(assert (=> b!1001213 m!927307))

(assert (=> b!1001203 m!927291))

(assert (=> b!1001203 m!927291))

(declare-fun m!927309 () Bool)

(assert (=> b!1001203 m!927309))

(assert (=> b!1001203 m!927309))

(assert (=> b!1001203 m!927291))

(declare-fun m!927311 () Bool)

(assert (=> b!1001203 m!927311))

(declare-fun m!927313 () Bool)

(assert (=> b!1001211 m!927313))

(declare-fun m!927315 () Bool)

(assert (=> b!1001214 m!927315))

(assert (=> b!1001207 m!927291))

(assert (=> b!1001207 m!927291))

(declare-fun m!927317 () Bool)

(assert (=> b!1001207 m!927317))

(declare-fun m!927319 () Bool)

(assert (=> b!1001210 m!927319))

(push 1)

