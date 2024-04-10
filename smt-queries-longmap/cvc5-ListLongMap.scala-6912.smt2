; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86888 () Bool)

(assert start!86888)

(declare-fun b!1007423 () Bool)

(declare-fun res!676321 () Bool)

(declare-fun e!566979 () Bool)

(assert (=> b!1007423 (=> (not res!676321) (not e!566979))))

(declare-datatypes ((array!63536 0))(
  ( (array!63537 (arr!30589 (Array (_ BitVec 32) (_ BitVec 64))) (size!31091 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63536)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007423 (= res!676321 (validKeyInArray!0 (select (arr!30589 a!3219) j!170)))))

(declare-fun b!1007424 () Bool)

(declare-fun e!566978 () Bool)

(declare-fun e!566983 () Bool)

(assert (=> b!1007424 (= e!566978 e!566983)))

(declare-fun res!676320 () Bool)

(assert (=> b!1007424 (=> (not res!676320) (not e!566983))))

(declare-datatypes ((SeekEntryResult!9521 0))(
  ( (MissingZero!9521 (index!40455 (_ BitVec 32))) (Found!9521 (index!40456 (_ BitVec 32))) (Intermediate!9521 (undefined!10333 Bool) (index!40457 (_ BitVec 32)) (x!87855 (_ BitVec 32))) (Undefined!9521) (MissingVacant!9521 (index!40458 (_ BitVec 32))) )
))
(declare-fun lt!445193 () SeekEntryResult!9521)

(declare-fun lt!445192 () SeekEntryResult!9521)

(assert (=> b!1007424 (= res!676320 (= lt!445193 lt!445192))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63536 (_ BitVec 32)) SeekEntryResult!9521)

(assert (=> b!1007424 (= lt!445193 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30589 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007425 () Bool)

(declare-fun res!676322 () Bool)

(declare-fun e!566982 () Bool)

(assert (=> b!1007425 (=> (not res!676322) (not e!566982))))

(declare-fun lt!445196 () (_ BitVec 64))

(declare-fun lt!445191 () array!63536)

(assert (=> b!1007425 (= res!676322 (not (= lt!445193 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445196 lt!445191 mask!3464))))))

(declare-fun b!1007426 () Bool)

(declare-fun res!676324 () Bool)

(assert (=> b!1007426 (=> (not res!676324) (not e!566979))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007426 (= res!676324 (validKeyInArray!0 k!2224))))

(declare-fun b!1007427 () Bool)

(declare-fun res!676325 () Bool)

(assert (=> b!1007427 (=> (not res!676325) (not e!566979))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007427 (= res!676325 (and (= (size!31091 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31091 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31091 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007428 () Bool)

(declare-fun res!676319 () Bool)

(assert (=> b!1007428 (=> (not res!676319) (not e!566979))))

(declare-fun arrayContainsKey!0 (array!63536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007428 (= res!676319 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007429 () Bool)

(assert (=> b!1007429 (= e!566982 false)))

(declare-fun lt!445190 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007429 (= lt!445190 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007430 () Bool)

(declare-fun res!676329 () Bool)

(declare-fun e!566981 () Bool)

(assert (=> b!1007430 (=> (not res!676329) (not e!566981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63536 (_ BitVec 32)) Bool)

(assert (=> b!1007430 (= res!676329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007431 () Bool)

(declare-fun res!676323 () Bool)

(assert (=> b!1007431 (=> (not res!676323) (not e!566982))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007431 (= res!676323 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!676327 () Bool)

(assert (=> start!86888 (=> (not res!676327) (not e!566979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86888 (= res!676327 (validMask!0 mask!3464))))

(assert (=> start!86888 e!566979))

(declare-fun array_inv!23713 (array!63536) Bool)

(assert (=> start!86888 (array_inv!23713 a!3219)))

(assert (=> start!86888 true))

(declare-fun b!1007432 () Bool)

(assert (=> b!1007432 (= e!566979 e!566981)))

(declare-fun res!676317 () Bool)

(assert (=> b!1007432 (=> (not res!676317) (not e!566981))))

(declare-fun lt!445195 () SeekEntryResult!9521)

(assert (=> b!1007432 (= res!676317 (or (= lt!445195 (MissingVacant!9521 i!1194)) (= lt!445195 (MissingZero!9521 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63536 (_ BitVec 32)) SeekEntryResult!9521)

(assert (=> b!1007432 (= lt!445195 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007433 () Bool)

(assert (=> b!1007433 (= e!566981 e!566978)))

(declare-fun res!676318 () Bool)

(assert (=> b!1007433 (=> (not res!676318) (not e!566978))))

(declare-fun lt!445194 () SeekEntryResult!9521)

(assert (=> b!1007433 (= res!676318 (= lt!445194 lt!445192))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007433 (= lt!445192 (Intermediate!9521 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007433 (= lt!445194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30589 a!3219) j!170) mask!3464) (select (arr!30589 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007434 () Bool)

(declare-fun res!676328 () Bool)

(assert (=> b!1007434 (=> (not res!676328) (not e!566981))))

(declare-datatypes ((List!21265 0))(
  ( (Nil!21262) (Cons!21261 (h!22447 (_ BitVec 64)) (t!30266 List!21265)) )
))
(declare-fun arrayNoDuplicates!0 (array!63536 (_ BitVec 32) List!21265) Bool)

(assert (=> b!1007434 (= res!676328 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21262))))

(declare-fun b!1007435 () Bool)

(assert (=> b!1007435 (= e!566983 e!566982)))

(declare-fun res!676316 () Bool)

(assert (=> b!1007435 (=> (not res!676316) (not e!566982))))

(assert (=> b!1007435 (= res!676316 (not (= lt!445194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445196 mask!3464) lt!445196 lt!445191 mask!3464))))))

(assert (=> b!1007435 (= lt!445196 (select (store (arr!30589 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007435 (= lt!445191 (array!63537 (store (arr!30589 a!3219) i!1194 k!2224) (size!31091 a!3219)))))

(declare-fun b!1007436 () Bool)

(declare-fun res!676326 () Bool)

(assert (=> b!1007436 (=> (not res!676326) (not e!566981))))

(assert (=> b!1007436 (= res!676326 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31091 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31091 a!3219))))))

(assert (= (and start!86888 res!676327) b!1007427))

(assert (= (and b!1007427 res!676325) b!1007423))

(assert (= (and b!1007423 res!676321) b!1007426))

(assert (= (and b!1007426 res!676324) b!1007428))

(assert (= (and b!1007428 res!676319) b!1007432))

(assert (= (and b!1007432 res!676317) b!1007430))

(assert (= (and b!1007430 res!676329) b!1007434))

(assert (= (and b!1007434 res!676328) b!1007436))

(assert (= (and b!1007436 res!676326) b!1007433))

(assert (= (and b!1007433 res!676318) b!1007424))

(assert (= (and b!1007424 res!676320) b!1007435))

(assert (= (and b!1007435 res!676316) b!1007425))

(assert (= (and b!1007425 res!676322) b!1007431))

(assert (= (and b!1007431 res!676323) b!1007429))

(declare-fun m!932315 () Bool)

(assert (=> b!1007432 m!932315))

(declare-fun m!932317 () Bool)

(assert (=> b!1007433 m!932317))

(assert (=> b!1007433 m!932317))

(declare-fun m!932319 () Bool)

(assert (=> b!1007433 m!932319))

(assert (=> b!1007433 m!932319))

(assert (=> b!1007433 m!932317))

(declare-fun m!932321 () Bool)

(assert (=> b!1007433 m!932321))

(assert (=> b!1007424 m!932317))

(assert (=> b!1007424 m!932317))

(declare-fun m!932323 () Bool)

(assert (=> b!1007424 m!932323))

(declare-fun m!932325 () Bool)

(assert (=> b!1007435 m!932325))

(assert (=> b!1007435 m!932325))

(declare-fun m!932327 () Bool)

(assert (=> b!1007435 m!932327))

(declare-fun m!932329 () Bool)

(assert (=> b!1007435 m!932329))

(declare-fun m!932331 () Bool)

(assert (=> b!1007435 m!932331))

(declare-fun m!932333 () Bool)

(assert (=> b!1007429 m!932333))

(assert (=> b!1007423 m!932317))

(assert (=> b!1007423 m!932317))

(declare-fun m!932335 () Bool)

(assert (=> b!1007423 m!932335))

(declare-fun m!932337 () Bool)

(assert (=> b!1007434 m!932337))

(declare-fun m!932339 () Bool)

(assert (=> b!1007430 m!932339))

(declare-fun m!932341 () Bool)

(assert (=> start!86888 m!932341))

(declare-fun m!932343 () Bool)

(assert (=> start!86888 m!932343))

(declare-fun m!932345 () Bool)

(assert (=> b!1007428 m!932345))

(declare-fun m!932347 () Bool)

(assert (=> b!1007425 m!932347))

(declare-fun m!932349 () Bool)

(assert (=> b!1007426 m!932349))

(push 1)

