; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48550 () Bool)

(assert start!48550)

(declare-fun b!533032 () Bool)

(declare-fun e!310263 () Bool)

(declare-fun e!310262 () Bool)

(assert (=> b!533032 (= e!310263 e!310262)))

(declare-fun res!328291 () Bool)

(assert (=> b!533032 (=> (not res!328291) (not e!310262))))

(declare-datatypes ((SeekEntryResult!4633 0))(
  ( (MissingZero!4633 (index!20756 (_ BitVec 32))) (Found!4633 (index!20757 (_ BitVec 32))) (Intermediate!4633 (undefined!5445 Bool) (index!20758 (_ BitVec 32)) (x!49877 (_ BitVec 32))) (Undefined!4633) (MissingVacant!4633 (index!20759 (_ BitVec 32))) )
))
(declare-fun lt!245397 () SeekEntryResult!4633)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533032 (= res!328291 (or (= lt!245397 (MissingZero!4633 i!1153)) (= lt!245397 (MissingVacant!4633 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33761 0))(
  ( (array!33762 (arr!16219 (Array (_ BitVec 32) (_ BitVec 64))) (size!16583 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33761)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33761 (_ BitVec 32)) SeekEntryResult!4633)

(assert (=> b!533032 (= lt!245397 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533033 () Bool)

(declare-fun res!328295 () Bool)

(assert (=> b!533033 (=> (not res!328295) (not e!310262))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533033 (= res!328295 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16583 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16583 a!3154)) (= (select (arr!16219 a!3154) resIndex!32) (select (arr!16219 a!3154) j!147))))))

(declare-fun b!533034 () Bool)

(declare-fun res!328294 () Bool)

(assert (=> b!533034 (=> (not res!328294) (not e!310263))))

(assert (=> b!533034 (= res!328294 (and (= (size!16583 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16583 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16583 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533035 () Bool)

(declare-fun res!328300 () Bool)

(assert (=> b!533035 (=> (not res!328300) (not e!310262))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33761 (_ BitVec 32)) SeekEntryResult!4633)

(assert (=> b!533035 (= res!328300 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16219 a!3154) j!147) a!3154 mask!3216) (Intermediate!4633 false resIndex!32 resX!32)))))

(declare-fun b!533036 () Bool)

(declare-fun res!328296 () Bool)

(assert (=> b!533036 (=> (not res!328296) (not e!310263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533036 (= res!328296 (validKeyInArray!0 (select (arr!16219 a!3154) j!147)))))

(declare-fun b!533037 () Bool)

(assert (=> b!533037 (= e!310262 false)))

(declare-fun lt!245398 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533037 (= lt!245398 (toIndex!0 (select (arr!16219 a!3154) j!147) mask!3216))))

(declare-fun b!533038 () Bool)

(declare-fun res!328297 () Bool)

(assert (=> b!533038 (=> (not res!328297) (not e!310262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33761 (_ BitVec 32)) Bool)

(assert (=> b!533038 (= res!328297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533039 () Bool)

(declare-fun res!328299 () Bool)

(assert (=> b!533039 (=> (not res!328299) (not e!310263))))

(declare-fun arrayContainsKey!0 (array!33761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533039 (= res!328299 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533041 () Bool)

(declare-fun res!328292 () Bool)

(assert (=> b!533041 (=> (not res!328292) (not e!310263))))

(assert (=> b!533041 (= res!328292 (validKeyInArray!0 k0!1998))))

(declare-fun res!328298 () Bool)

(assert (=> start!48550 (=> (not res!328298) (not e!310263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48550 (= res!328298 (validMask!0 mask!3216))))

(assert (=> start!48550 e!310263))

(assert (=> start!48550 true))

(declare-fun array_inv!12078 (array!33761) Bool)

(assert (=> start!48550 (array_inv!12078 a!3154)))

(declare-fun b!533040 () Bool)

(declare-fun res!328293 () Bool)

(assert (=> b!533040 (=> (not res!328293) (not e!310262))))

(declare-datatypes ((List!10245 0))(
  ( (Nil!10242) (Cons!10241 (h!11184 (_ BitVec 64)) (t!16465 List!10245)) )
))
(declare-fun arrayNoDuplicates!0 (array!33761 (_ BitVec 32) List!10245) Bool)

(assert (=> b!533040 (= res!328293 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10242))))

(assert (= (and start!48550 res!328298) b!533034))

(assert (= (and b!533034 res!328294) b!533036))

(assert (= (and b!533036 res!328296) b!533041))

(assert (= (and b!533041 res!328292) b!533039))

(assert (= (and b!533039 res!328299) b!533032))

(assert (= (and b!533032 res!328291) b!533038))

(assert (= (and b!533038 res!328297) b!533040))

(assert (= (and b!533040 res!328293) b!533033))

(assert (= (and b!533033 res!328295) b!533035))

(assert (= (and b!533035 res!328300) b!533037))

(declare-fun m!513229 () Bool)

(assert (=> b!533037 m!513229))

(assert (=> b!533037 m!513229))

(declare-fun m!513231 () Bool)

(assert (=> b!533037 m!513231))

(declare-fun m!513233 () Bool)

(assert (=> b!533032 m!513233))

(declare-fun m!513235 () Bool)

(assert (=> b!533039 m!513235))

(assert (=> b!533036 m!513229))

(assert (=> b!533036 m!513229))

(declare-fun m!513237 () Bool)

(assert (=> b!533036 m!513237))

(declare-fun m!513239 () Bool)

(assert (=> b!533041 m!513239))

(assert (=> b!533035 m!513229))

(assert (=> b!533035 m!513229))

(declare-fun m!513241 () Bool)

(assert (=> b!533035 m!513241))

(declare-fun m!513243 () Bool)

(assert (=> b!533040 m!513243))

(declare-fun m!513245 () Bool)

(assert (=> start!48550 m!513245))

(declare-fun m!513247 () Bool)

(assert (=> start!48550 m!513247))

(declare-fun m!513249 () Bool)

(assert (=> b!533038 m!513249))

(declare-fun m!513251 () Bool)

(assert (=> b!533033 m!513251))

(assert (=> b!533033 m!513229))

(check-sat (not b!533038) (not b!533036) (not b!533037) (not b!533035) (not b!533041) (not start!48550) (not b!533032) (not b!533040) (not b!533039))
(check-sat)
