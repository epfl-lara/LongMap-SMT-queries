; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86786 () Bool)

(assert start!86786)

(declare-fun res!675312 () Bool)

(declare-fun e!566416 () Bool)

(assert (=> start!86786 (=> (not res!675312) (not e!566416))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86786 (= res!675312 (validMask!0 mask!3464))))

(assert (=> start!86786 e!566416))

(declare-datatypes ((array!63485 0))(
  ( (array!63486 (arr!30565 (Array (_ BitVec 32) (_ BitVec 64))) (size!31067 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63485)

(declare-fun array_inv!23689 (array!63485) Bool)

(assert (=> start!86786 (array_inv!23689 a!3219)))

(assert (=> start!86786 true))

(declare-fun b!1006220 () Bool)

(declare-fun res!675317 () Bool)

(declare-fun e!566418 () Bool)

(assert (=> b!1006220 (=> (not res!675317) (not e!566418))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006220 (= res!675317 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31067 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31067 a!3219))))))

(declare-fun b!1006221 () Bool)

(declare-fun res!675311 () Bool)

(assert (=> b!1006221 (=> (not res!675311) (not e!566416))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006221 (= res!675311 (validKeyInArray!0 (select (arr!30565 a!3219) j!170)))))

(declare-fun b!1006222 () Bool)

(declare-fun e!566417 () Bool)

(assert (=> b!1006222 (= e!566417 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9497 0))(
  ( (MissingZero!9497 (index!40359 (_ BitVec 32))) (Found!9497 (index!40360 (_ BitVec 32))) (Intermediate!9497 (undefined!10309 Bool) (index!40361 (_ BitVec 32)) (x!87761 (_ BitVec 32))) (Undefined!9497) (MissingVacant!9497 (index!40362 (_ BitVec 32))) )
))
(declare-fun lt!444726 () SeekEntryResult!9497)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63485 (_ BitVec 32)) SeekEntryResult!9497)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006222 (= lt!444726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30565 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30565 a!3219) i!1194 k!2224) j!170) (array!63486 (store (arr!30565 a!3219) i!1194 k!2224) (size!31067 a!3219)) mask!3464))))

(declare-fun b!1006223 () Bool)

(declare-fun res!675315 () Bool)

(assert (=> b!1006223 (=> (not res!675315) (not e!566417))))

(declare-fun lt!444727 () SeekEntryResult!9497)

(assert (=> b!1006223 (= res!675315 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30565 a!3219) j!170) a!3219 mask!3464) lt!444727))))

(declare-fun b!1006224 () Bool)

(assert (=> b!1006224 (= e!566418 e!566417)))

(declare-fun res!675310 () Bool)

(assert (=> b!1006224 (=> (not res!675310) (not e!566417))))

(assert (=> b!1006224 (= res!675310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30565 a!3219) j!170) mask!3464) (select (arr!30565 a!3219) j!170) a!3219 mask!3464) lt!444727))))

(assert (=> b!1006224 (= lt!444727 (Intermediate!9497 false resIndex!38 resX!38))))

(declare-fun b!1006225 () Bool)

(declare-fun res!675313 () Bool)

(assert (=> b!1006225 (=> (not res!675313) (not e!566418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63485 (_ BitVec 32)) Bool)

(assert (=> b!1006225 (= res!675313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006226 () Bool)

(declare-fun res!675318 () Bool)

(assert (=> b!1006226 (=> (not res!675318) (not e!566416))))

(assert (=> b!1006226 (= res!675318 (validKeyInArray!0 k!2224))))

(declare-fun b!1006227 () Bool)

(assert (=> b!1006227 (= e!566416 e!566418)))

(declare-fun res!675309 () Bool)

(assert (=> b!1006227 (=> (not res!675309) (not e!566418))))

(declare-fun lt!444728 () SeekEntryResult!9497)

(assert (=> b!1006227 (= res!675309 (or (= lt!444728 (MissingVacant!9497 i!1194)) (= lt!444728 (MissingZero!9497 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63485 (_ BitVec 32)) SeekEntryResult!9497)

(assert (=> b!1006227 (= lt!444728 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006228 () Bool)

(declare-fun res!675314 () Bool)

(assert (=> b!1006228 (=> (not res!675314) (not e!566416))))

(assert (=> b!1006228 (= res!675314 (and (= (size!31067 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31067 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31067 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006229 () Bool)

(declare-fun res!675316 () Bool)

(assert (=> b!1006229 (=> (not res!675316) (not e!566418))))

(declare-datatypes ((List!21241 0))(
  ( (Nil!21238) (Cons!21237 (h!22420 (_ BitVec 64)) (t!30242 List!21241)) )
))
(declare-fun arrayNoDuplicates!0 (array!63485 (_ BitVec 32) List!21241) Bool)

(assert (=> b!1006229 (= res!675316 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21238))))

(declare-fun b!1006230 () Bool)

(declare-fun res!675308 () Bool)

(assert (=> b!1006230 (=> (not res!675308) (not e!566416))))

(declare-fun arrayContainsKey!0 (array!63485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006230 (= res!675308 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86786 res!675312) b!1006228))

(assert (= (and b!1006228 res!675314) b!1006221))

(assert (= (and b!1006221 res!675311) b!1006226))

(assert (= (and b!1006226 res!675318) b!1006230))

(assert (= (and b!1006230 res!675308) b!1006227))

(assert (= (and b!1006227 res!675309) b!1006225))

(assert (= (and b!1006225 res!675313) b!1006229))

(assert (= (and b!1006229 res!675316) b!1006220))

(assert (= (and b!1006220 res!675317) b!1006224))

(assert (= (and b!1006224 res!675310) b!1006223))

(assert (= (and b!1006223 res!675315) b!1006222))

(declare-fun m!931325 () Bool)

(assert (=> b!1006230 m!931325))

(declare-fun m!931327 () Bool)

(assert (=> start!86786 m!931327))

(declare-fun m!931329 () Bool)

(assert (=> start!86786 m!931329))

(declare-fun m!931331 () Bool)

(assert (=> b!1006222 m!931331))

(declare-fun m!931333 () Bool)

(assert (=> b!1006222 m!931333))

(assert (=> b!1006222 m!931333))

(declare-fun m!931335 () Bool)

(assert (=> b!1006222 m!931335))

(assert (=> b!1006222 m!931335))

(assert (=> b!1006222 m!931333))

(declare-fun m!931337 () Bool)

(assert (=> b!1006222 m!931337))

(declare-fun m!931339 () Bool)

(assert (=> b!1006229 m!931339))

(declare-fun m!931341 () Bool)

(assert (=> b!1006221 m!931341))

(assert (=> b!1006221 m!931341))

(declare-fun m!931343 () Bool)

(assert (=> b!1006221 m!931343))

(declare-fun m!931345 () Bool)

(assert (=> b!1006225 m!931345))

(assert (=> b!1006224 m!931341))

(assert (=> b!1006224 m!931341))

(declare-fun m!931347 () Bool)

(assert (=> b!1006224 m!931347))

(assert (=> b!1006224 m!931347))

(assert (=> b!1006224 m!931341))

(declare-fun m!931349 () Bool)

(assert (=> b!1006224 m!931349))

(assert (=> b!1006223 m!931341))

(assert (=> b!1006223 m!931341))

(declare-fun m!931351 () Bool)

(assert (=> b!1006223 m!931351))

(declare-fun m!931353 () Bool)

(assert (=> b!1006227 m!931353))

(declare-fun m!931355 () Bool)

(assert (=> b!1006226 m!931355))

(push 1)

