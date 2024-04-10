; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86414 () Bool)

(assert start!86414)

(declare-fun b!1000217 () Bool)

(declare-fun res!669705 () Bool)

(declare-fun e!563817 () Bool)

(assert (=> b!1000217 (=> (not res!669705) (not e!563817))))

(declare-datatypes ((array!63215 0))(
  ( (array!63216 (arr!30433 (Array (_ BitVec 32) (_ BitVec 64))) (size!30935 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63215)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000217 (= res!669705 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30935 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30935 a!3219))))))

(declare-fun res!669699 () Bool)

(declare-fun e!563816 () Bool)

(assert (=> start!86414 (=> (not res!669699) (not e!563816))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86414 (= res!669699 (validMask!0 mask!3464))))

(assert (=> start!86414 e!563816))

(declare-fun array_inv!23557 (array!63215) Bool)

(assert (=> start!86414 (array_inv!23557 a!3219)))

(assert (=> start!86414 true))

(declare-fun b!1000218 () Bool)

(declare-fun e!563818 () Bool)

(assert (=> b!1000218 (= e!563817 e!563818)))

(declare-fun res!669700 () Bool)

(assert (=> b!1000218 (=> (not res!669700) (not e!563818))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9365 0))(
  ( (MissingZero!9365 (index!39831 (_ BitVec 32))) (Found!9365 (index!39832 (_ BitVec 32))) (Intermediate!9365 (undefined!10177 Bool) (index!39833 (_ BitVec 32)) (x!87265 (_ BitVec 32))) (Undefined!9365) (MissingVacant!9365 (index!39834 (_ BitVec 32))) )
))
(declare-fun lt!442231 () SeekEntryResult!9365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63215 (_ BitVec 32)) SeekEntryResult!9365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000218 (= res!669700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30433 a!3219) j!170) mask!3464) (select (arr!30433 a!3219) j!170) a!3219 mask!3464) lt!442231))))

(assert (=> b!1000218 (= lt!442231 (Intermediate!9365 false resIndex!38 resX!38))))

(declare-fun b!1000219 () Bool)

(declare-fun res!669696 () Bool)

(assert (=> b!1000219 (=> (not res!669696) (not e!563816))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000219 (= res!669696 (validKeyInArray!0 k!2224))))

(declare-fun b!1000220 () Bool)

(declare-fun res!669704 () Bool)

(assert (=> b!1000220 (=> (not res!669704) (not e!563816))))

(declare-fun arrayContainsKey!0 (array!63215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000220 (= res!669704 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000221 () Bool)

(declare-fun res!669702 () Bool)

(assert (=> b!1000221 (=> (not res!669702) (not e!563818))))

(assert (=> b!1000221 (= res!669702 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30433 a!3219) j!170) a!3219 mask!3464) lt!442231))))

(declare-fun b!1000222 () Bool)

(assert (=> b!1000222 (= e!563816 e!563817)))

(declare-fun res!669698 () Bool)

(assert (=> b!1000222 (=> (not res!669698) (not e!563817))))

(declare-fun lt!442232 () SeekEntryResult!9365)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000222 (= res!669698 (or (= lt!442232 (MissingVacant!9365 i!1194)) (= lt!442232 (MissingZero!9365 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63215 (_ BitVec 32)) SeekEntryResult!9365)

(assert (=> b!1000222 (= lt!442232 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000223 () Bool)

(assert (=> b!1000223 (= e!563818 false)))

(declare-fun lt!442230 () SeekEntryResult!9365)

(assert (=> b!1000223 (= lt!442230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30433 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30433 a!3219) i!1194 k!2224) j!170) (array!63216 (store (arr!30433 a!3219) i!1194 k!2224) (size!30935 a!3219)) mask!3464))))

(declare-fun b!1000224 () Bool)

(declare-fun res!669695 () Bool)

(assert (=> b!1000224 (=> (not res!669695) (not e!563816))))

(assert (=> b!1000224 (= res!669695 (validKeyInArray!0 (select (arr!30433 a!3219) j!170)))))

(declare-fun b!1000225 () Bool)

(declare-fun res!669701 () Bool)

(assert (=> b!1000225 (=> (not res!669701) (not e!563817))))

(declare-datatypes ((List!21109 0))(
  ( (Nil!21106) (Cons!21105 (h!22282 (_ BitVec 64)) (t!30110 List!21109)) )
))
(declare-fun arrayNoDuplicates!0 (array!63215 (_ BitVec 32) List!21109) Bool)

(assert (=> b!1000225 (= res!669701 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21106))))

(declare-fun b!1000226 () Bool)

(declare-fun res!669697 () Bool)

(assert (=> b!1000226 (=> (not res!669697) (not e!563816))))

(assert (=> b!1000226 (= res!669697 (and (= (size!30935 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30935 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30935 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000227 () Bool)

(declare-fun res!669703 () Bool)

(assert (=> b!1000227 (=> (not res!669703) (not e!563817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63215 (_ BitVec 32)) Bool)

(assert (=> b!1000227 (= res!669703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86414 res!669699) b!1000226))

(assert (= (and b!1000226 res!669697) b!1000224))

(assert (= (and b!1000224 res!669695) b!1000219))

(assert (= (and b!1000219 res!669696) b!1000220))

(assert (= (and b!1000220 res!669704) b!1000222))

(assert (= (and b!1000222 res!669698) b!1000227))

(assert (= (and b!1000227 res!669703) b!1000225))

(assert (= (and b!1000225 res!669701) b!1000217))

(assert (= (and b!1000217 res!669705) b!1000218))

(assert (= (and b!1000218 res!669700) b!1000221))

(assert (= (and b!1000221 res!669702) b!1000223))

(declare-fun m!926399 () Bool)

(assert (=> start!86414 m!926399))

(declare-fun m!926401 () Bool)

(assert (=> start!86414 m!926401))

(declare-fun m!926403 () Bool)

(assert (=> b!1000219 m!926403))

(declare-fun m!926405 () Bool)

(assert (=> b!1000223 m!926405))

(declare-fun m!926407 () Bool)

(assert (=> b!1000223 m!926407))

(assert (=> b!1000223 m!926407))

(declare-fun m!926409 () Bool)

(assert (=> b!1000223 m!926409))

(assert (=> b!1000223 m!926409))

(assert (=> b!1000223 m!926407))

(declare-fun m!926411 () Bool)

(assert (=> b!1000223 m!926411))

(declare-fun m!926413 () Bool)

(assert (=> b!1000225 m!926413))

(declare-fun m!926415 () Bool)

(assert (=> b!1000227 m!926415))

(declare-fun m!926417 () Bool)

(assert (=> b!1000221 m!926417))

(assert (=> b!1000221 m!926417))

(declare-fun m!926419 () Bool)

(assert (=> b!1000221 m!926419))

(assert (=> b!1000224 m!926417))

(assert (=> b!1000224 m!926417))

(declare-fun m!926421 () Bool)

(assert (=> b!1000224 m!926421))

(assert (=> b!1000218 m!926417))

(assert (=> b!1000218 m!926417))

(declare-fun m!926423 () Bool)

(assert (=> b!1000218 m!926423))

(assert (=> b!1000218 m!926423))

(assert (=> b!1000218 m!926417))

(declare-fun m!926425 () Bool)

(assert (=> b!1000218 m!926425))

(declare-fun m!926427 () Bool)

(assert (=> b!1000220 m!926427))

(declare-fun m!926429 () Bool)

(assert (=> b!1000222 m!926429))

(push 1)

