; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48626 () Bool)

(assert start!48626)

(declare-fun b!534086 () Bool)

(declare-fun res!329293 () Bool)

(declare-fun e!310607 () Bool)

(assert (=> b!534086 (=> (not res!329293) (not e!310607))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534086 (= res!329293 (validKeyInArray!0 k0!1998))))

(declare-fun b!534087 () Bool)

(declare-fun res!329295 () Bool)

(declare-fun e!310606 () Bool)

(assert (=> b!534087 (=> (not res!329295) (not e!310606))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33838 0))(
  ( (array!33839 (arr!16258 (Array (_ BitVec 32) (_ BitVec 64))) (size!16622 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33838)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534087 (= res!329295 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16622 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16622 a!3154)) (= (select (arr!16258 a!3154) resIndex!32) (select (arr!16258 a!3154) j!147))))))

(declare-fun b!534088 () Bool)

(assert (=> b!534088 (= e!310606 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4716 0))(
  ( (MissingZero!4716 (index!21088 (_ BitVec 32))) (Found!4716 (index!21089 (_ BitVec 32))) (Intermediate!4716 (undefined!5528 Bool) (index!21090 (_ BitVec 32)) (x!50051 (_ BitVec 32))) (Undefined!4716) (MissingVacant!4716 (index!21091 (_ BitVec 32))) )
))
(declare-fun lt!245562 () SeekEntryResult!4716)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33838 (_ BitVec 32)) SeekEntryResult!4716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534088 (= lt!245562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16258 a!3154) j!147) mask!3216) (select (arr!16258 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534089 () Bool)

(declare-fun res!329299 () Bool)

(assert (=> b!534089 (=> (not res!329299) (not e!310606))))

(declare-datatypes ((List!10377 0))(
  ( (Nil!10374) (Cons!10373 (h!11316 (_ BitVec 64)) (t!16605 List!10377)) )
))
(declare-fun arrayNoDuplicates!0 (array!33838 (_ BitVec 32) List!10377) Bool)

(assert (=> b!534089 (= res!329299 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10374))))

(declare-fun b!534090 () Bool)

(declare-fun res!329296 () Bool)

(assert (=> b!534090 (=> (not res!329296) (not e!310606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33838 (_ BitVec 32)) Bool)

(assert (=> b!534090 (= res!329296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534091 () Bool)

(declare-fun res!329298 () Bool)

(assert (=> b!534091 (=> (not res!329298) (not e!310607))))

(assert (=> b!534091 (= res!329298 (validKeyInArray!0 (select (arr!16258 a!3154) j!147)))))

(declare-fun b!534092 () Bool)

(assert (=> b!534092 (= e!310607 e!310606)))

(declare-fun res!329297 () Bool)

(assert (=> b!534092 (=> (not res!329297) (not e!310606))))

(declare-fun lt!245563 () SeekEntryResult!4716)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534092 (= res!329297 (or (= lt!245563 (MissingZero!4716 i!1153)) (= lt!245563 (MissingVacant!4716 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33838 (_ BitVec 32)) SeekEntryResult!4716)

(assert (=> b!534092 (= lt!245563 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534093 () Bool)

(declare-fun res!329291 () Bool)

(assert (=> b!534093 (=> (not res!329291) (not e!310607))))

(declare-fun arrayContainsKey!0 (array!33838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534093 (= res!329291 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!329294 () Bool)

(assert (=> start!48626 (=> (not res!329294) (not e!310607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48626 (= res!329294 (validMask!0 mask!3216))))

(assert (=> start!48626 e!310607))

(assert (=> start!48626 true))

(declare-fun array_inv!12054 (array!33838) Bool)

(assert (=> start!48626 (array_inv!12054 a!3154)))

(declare-fun b!534094 () Bool)

(declare-fun res!329300 () Bool)

(assert (=> b!534094 (=> (not res!329300) (not e!310607))))

(assert (=> b!534094 (= res!329300 (and (= (size!16622 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16622 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16622 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534095 () Bool)

(declare-fun res!329292 () Bool)

(assert (=> b!534095 (=> (not res!329292) (not e!310606))))

(assert (=> b!534095 (= res!329292 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16258 a!3154) j!147) a!3154 mask!3216) (Intermediate!4716 false resIndex!32 resX!32)))))

(assert (= (and start!48626 res!329294) b!534094))

(assert (= (and b!534094 res!329300) b!534091))

(assert (= (and b!534091 res!329298) b!534086))

(assert (= (and b!534086 res!329293) b!534093))

(assert (= (and b!534093 res!329291) b!534092))

(assert (= (and b!534092 res!329297) b!534090))

(assert (= (and b!534090 res!329296) b!534089))

(assert (= (and b!534089 res!329299) b!534087))

(assert (= (and b!534087 res!329295) b!534095))

(assert (= (and b!534095 res!329292) b!534088))

(declare-fun m!513851 () Bool)

(assert (=> start!48626 m!513851))

(declare-fun m!513853 () Bool)

(assert (=> start!48626 m!513853))

(declare-fun m!513855 () Bool)

(assert (=> b!534093 m!513855))

(declare-fun m!513857 () Bool)

(assert (=> b!534089 m!513857))

(declare-fun m!513859 () Bool)

(assert (=> b!534086 m!513859))

(declare-fun m!513861 () Bool)

(assert (=> b!534090 m!513861))

(declare-fun m!513863 () Bool)

(assert (=> b!534087 m!513863))

(declare-fun m!513865 () Bool)

(assert (=> b!534087 m!513865))

(assert (=> b!534095 m!513865))

(assert (=> b!534095 m!513865))

(declare-fun m!513867 () Bool)

(assert (=> b!534095 m!513867))

(assert (=> b!534091 m!513865))

(assert (=> b!534091 m!513865))

(declare-fun m!513869 () Bool)

(assert (=> b!534091 m!513869))

(declare-fun m!513871 () Bool)

(assert (=> b!534092 m!513871))

(assert (=> b!534088 m!513865))

(assert (=> b!534088 m!513865))

(declare-fun m!513873 () Bool)

(assert (=> b!534088 m!513873))

(assert (=> b!534088 m!513873))

(assert (=> b!534088 m!513865))

(declare-fun m!513875 () Bool)

(assert (=> b!534088 m!513875))

(check-sat (not b!534088) (not b!534090) (not b!534086) (not b!534092) (not b!534095) (not b!534093) (not b!534091) (not start!48626) (not b!534089))
(check-sat)
