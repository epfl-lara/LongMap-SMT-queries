; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48624 () Bool)

(assert start!48624)

(declare-fun b!533965 () Bool)

(declare-fun res!329314 () Bool)

(declare-fun e!310478 () Bool)

(assert (=> b!533965 (=> (not res!329314) (not e!310478))))

(declare-datatypes ((array!33846 0))(
  ( (array!33847 (arr!16262 (Array (_ BitVec 32) (_ BitVec 64))) (size!16627 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33846)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33846 (_ BitVec 32)) Bool)

(assert (=> b!533965 (= res!329314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533966 () Bool)

(declare-fun res!329316 () Bool)

(declare-fun e!310477 () Bool)

(assert (=> b!533966 (=> (not res!329316) (not e!310477))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533966 (= res!329316 (and (= (size!16627 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16627 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16627 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!329312 () Bool)

(assert (=> start!48624 (=> (not res!329312) (not e!310477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48624 (= res!329312 (validMask!0 mask!3216))))

(assert (=> start!48624 e!310477))

(assert (=> start!48624 true))

(declare-fun array_inv!12145 (array!33846) Bool)

(assert (=> start!48624 (array_inv!12145 a!3154)))

(declare-fun b!533967 () Bool)

(declare-fun res!329319 () Bool)

(assert (=> b!533967 (=> (not res!329319) (not e!310478))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4717 0))(
  ( (MissingZero!4717 (index!21092 (_ BitVec 32))) (Found!4717 (index!21093 (_ BitVec 32))) (Intermediate!4717 (undefined!5529 Bool) (index!21094 (_ BitVec 32)) (x!50063 (_ BitVec 32))) (Undefined!4717) (MissingVacant!4717 (index!21095 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33846 (_ BitVec 32)) SeekEntryResult!4717)

(assert (=> b!533967 (= res!329319 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16262 a!3154) j!147) a!3154 mask!3216) (Intermediate!4717 false resIndex!32 resX!32)))))

(declare-fun b!533968 () Bool)

(declare-fun res!329318 () Bool)

(assert (=> b!533968 (=> (not res!329318) (not e!310477))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533968 (= res!329318 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533969 () Bool)

(assert (=> b!533969 (= e!310478 false)))

(declare-fun lt!245358 () SeekEntryResult!4717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533969 (= lt!245358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16262 a!3154) j!147) mask!3216) (select (arr!16262 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533970 () Bool)

(declare-fun res!329321 () Bool)

(assert (=> b!533970 (=> (not res!329321) (not e!310477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533970 (= res!329321 (validKeyInArray!0 (select (arr!16262 a!3154) j!147)))))

(declare-fun b!533971 () Bool)

(assert (=> b!533971 (= e!310477 e!310478)))

(declare-fun res!329320 () Bool)

(assert (=> b!533971 (=> (not res!329320) (not e!310478))))

(declare-fun lt!245359 () SeekEntryResult!4717)

(assert (=> b!533971 (= res!329320 (or (= lt!245359 (MissingZero!4717 i!1153)) (= lt!245359 (MissingVacant!4717 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33846 (_ BitVec 32)) SeekEntryResult!4717)

(assert (=> b!533971 (= lt!245359 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533972 () Bool)

(declare-fun res!329317 () Bool)

(assert (=> b!533972 (=> (not res!329317) (not e!310478))))

(assert (=> b!533972 (= res!329317 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16627 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16627 a!3154)) (= (select (arr!16262 a!3154) resIndex!32) (select (arr!16262 a!3154) j!147))))))

(declare-fun b!533973 () Bool)

(declare-fun res!329315 () Bool)

(assert (=> b!533973 (=> (not res!329315) (not e!310478))))

(declare-datatypes ((List!10420 0))(
  ( (Nil!10417) (Cons!10416 (h!11359 (_ BitVec 64)) (t!16639 List!10420)) )
))
(declare-fun arrayNoDuplicates!0 (array!33846 (_ BitVec 32) List!10420) Bool)

(assert (=> b!533973 (= res!329315 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10417))))

(declare-fun b!533974 () Bool)

(declare-fun res!329313 () Bool)

(assert (=> b!533974 (=> (not res!329313) (not e!310477))))

(assert (=> b!533974 (= res!329313 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48624 res!329312) b!533966))

(assert (= (and b!533966 res!329316) b!533970))

(assert (= (and b!533970 res!329321) b!533974))

(assert (= (and b!533974 res!329313) b!533968))

(assert (= (and b!533968 res!329318) b!533971))

(assert (= (and b!533971 res!329320) b!533965))

(assert (= (and b!533965 res!329314) b!533973))

(assert (= (and b!533973 res!329315) b!533972))

(assert (= (and b!533972 res!329317) b!533967))

(assert (= (and b!533967 res!329319) b!533969))

(declare-fun m!513229 () Bool)

(assert (=> b!533974 m!513229))

(declare-fun m!513231 () Bool)

(assert (=> b!533972 m!513231))

(declare-fun m!513233 () Bool)

(assert (=> b!533972 m!513233))

(declare-fun m!513235 () Bool)

(assert (=> b!533973 m!513235))

(declare-fun m!513237 () Bool)

(assert (=> b!533965 m!513237))

(declare-fun m!513239 () Bool)

(assert (=> b!533971 m!513239))

(assert (=> b!533967 m!513233))

(assert (=> b!533967 m!513233))

(declare-fun m!513241 () Bool)

(assert (=> b!533967 m!513241))

(assert (=> b!533969 m!513233))

(assert (=> b!533969 m!513233))

(declare-fun m!513243 () Bool)

(assert (=> b!533969 m!513243))

(assert (=> b!533969 m!513243))

(assert (=> b!533969 m!513233))

(declare-fun m!513245 () Bool)

(assert (=> b!533969 m!513245))

(declare-fun m!513247 () Bool)

(assert (=> start!48624 m!513247))

(declare-fun m!513249 () Bool)

(assert (=> start!48624 m!513249))

(declare-fun m!513251 () Bool)

(assert (=> b!533968 m!513251))

(assert (=> b!533970 m!513233))

(assert (=> b!533970 m!513233))

(declare-fun m!513253 () Bool)

(assert (=> b!533970 m!513253))

(check-sat (not b!533973) (not b!533967) (not b!533969) (not b!533970) (not b!533974) (not b!533968) (not b!533971) (not start!48624) (not b!533965))
(check-sat)
