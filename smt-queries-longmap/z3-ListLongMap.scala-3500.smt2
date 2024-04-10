; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48572 () Bool)

(assert start!48572)

(declare-fun b!533294 () Bool)

(declare-fun e!310365 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!533294 (= e!310365 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!533295 () Bool)

(declare-fun res!328501 () Bool)

(declare-fun e!310363 () Bool)

(assert (=> b!533295 (=> (not res!328501) (not e!310363))))

(declare-datatypes ((array!33784 0))(
  ( (array!33785 (arr!16231 (Array (_ BitVec 32) (_ BitVec 64))) (size!16595 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33784)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533295 (= res!328501 (validKeyInArray!0 (select (arr!16231 a!3154) j!147)))))

(declare-fun b!533296 () Bool)

(declare-fun res!328508 () Bool)

(assert (=> b!533296 (=> (not res!328508) (not e!310363))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!533296 (= res!328508 (validKeyInArray!0 k0!1998))))

(declare-fun b!533297 () Bool)

(declare-fun res!328506 () Bool)

(assert (=> b!533297 (=> (not res!328506) (not e!310365))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4689 0))(
  ( (MissingZero!4689 (index!20980 (_ BitVec 32))) (Found!4689 (index!20981 (_ BitVec 32))) (Intermediate!4689 (undefined!5501 Bool) (index!20982 (_ BitVec 32)) (x!49952 (_ BitVec 32))) (Undefined!4689) (MissingVacant!4689 (index!20983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33784 (_ BitVec 32)) SeekEntryResult!4689)

(assert (=> b!533297 (= res!328506 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16231 a!3154) j!147) a!3154 mask!3216) (Intermediate!4689 false resIndex!32 resX!32)))))

(declare-fun b!533298 () Bool)

(declare-fun res!328502 () Bool)

(assert (=> b!533298 (=> (not res!328502) (not e!310363))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533298 (= res!328502 (and (= (size!16595 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16595 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16595 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533299 () Bool)

(declare-fun res!328504 () Bool)

(assert (=> b!533299 (=> (not res!328504) (not e!310363))))

(declare-fun arrayContainsKey!0 (array!33784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533299 (= res!328504 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533300 () Bool)

(declare-fun res!328507 () Bool)

(assert (=> b!533300 (=> (not res!328507) (not e!310365))))

(assert (=> b!533300 (= res!328507 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16595 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16595 a!3154)) (= (select (arr!16231 a!3154) resIndex!32) (select (arr!16231 a!3154) j!147))))))

(declare-fun b!533301 () Bool)

(declare-fun res!328505 () Bool)

(assert (=> b!533301 (=> (not res!328505) (not e!310365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33784 (_ BitVec 32)) Bool)

(assert (=> b!533301 (= res!328505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533302 () Bool)

(assert (=> b!533302 (= e!310363 e!310365)))

(declare-fun res!328500 () Bool)

(assert (=> b!533302 (=> (not res!328500) (not e!310365))))

(declare-fun lt!245422 () SeekEntryResult!4689)

(assert (=> b!533302 (= res!328500 (or (= lt!245422 (MissingZero!4689 i!1153)) (= lt!245422 (MissingVacant!4689 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33784 (_ BitVec 32)) SeekEntryResult!4689)

(assert (=> b!533302 (= lt!245422 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!328503 () Bool)

(assert (=> start!48572 (=> (not res!328503) (not e!310363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48572 (= res!328503 (validMask!0 mask!3216))))

(assert (=> start!48572 e!310363))

(assert (=> start!48572 true))

(declare-fun array_inv!12027 (array!33784) Bool)

(assert (=> start!48572 (array_inv!12027 a!3154)))

(declare-fun b!533303 () Bool)

(declare-fun res!328499 () Bool)

(assert (=> b!533303 (=> (not res!328499) (not e!310365))))

(declare-datatypes ((List!10350 0))(
  ( (Nil!10347) (Cons!10346 (h!11289 (_ BitVec 64)) (t!16578 List!10350)) )
))
(declare-fun arrayNoDuplicates!0 (array!33784 (_ BitVec 32) List!10350) Bool)

(assert (=> b!533303 (= res!328499 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10347))))

(assert (= (and start!48572 res!328503) b!533298))

(assert (= (and b!533298 res!328502) b!533295))

(assert (= (and b!533295 res!328501) b!533296))

(assert (= (and b!533296 res!328508) b!533299))

(assert (= (and b!533299 res!328504) b!533302))

(assert (= (and b!533302 res!328500) b!533301))

(assert (= (and b!533301 res!328505) b!533303))

(assert (= (and b!533303 res!328499) b!533300))

(assert (= (and b!533300 res!328507) b!533297))

(assert (= (and b!533297 res!328506) b!533294))

(declare-fun m!513205 () Bool)

(assert (=> b!533303 m!513205))

(declare-fun m!513207 () Bool)

(assert (=> b!533302 m!513207))

(declare-fun m!513209 () Bool)

(assert (=> b!533295 m!513209))

(assert (=> b!533295 m!513209))

(declare-fun m!513211 () Bool)

(assert (=> b!533295 m!513211))

(declare-fun m!513213 () Bool)

(assert (=> start!48572 m!513213))

(declare-fun m!513215 () Bool)

(assert (=> start!48572 m!513215))

(declare-fun m!513217 () Bool)

(assert (=> b!533296 m!513217))

(declare-fun m!513219 () Bool)

(assert (=> b!533300 m!513219))

(assert (=> b!533300 m!513209))

(declare-fun m!513221 () Bool)

(assert (=> b!533301 m!513221))

(declare-fun m!513223 () Bool)

(assert (=> b!533299 m!513223))

(assert (=> b!533297 m!513209))

(assert (=> b!533297 m!513209))

(declare-fun m!513225 () Bool)

(assert (=> b!533297 m!513225))

(check-sat (not b!533303) (not start!48572) (not b!533301) (not b!533299) (not b!533295) (not b!533302) (not b!533297) (not b!533296))
(check-sat)
