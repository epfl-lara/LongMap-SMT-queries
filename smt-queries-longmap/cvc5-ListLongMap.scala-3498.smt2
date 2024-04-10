; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48558 () Bool)

(assert start!48558)

(declare-fun b!533093 () Bool)

(declare-fun e!310302 () Bool)

(declare-fun e!310301 () Bool)

(assert (=> b!533093 (= e!310302 e!310301)))

(declare-fun res!328300 () Bool)

(assert (=> b!533093 (=> (not res!328300) (not e!310301))))

(declare-datatypes ((SeekEntryResult!4682 0))(
  ( (MissingZero!4682 (index!20952 (_ BitVec 32))) (Found!4682 (index!20953 (_ BitVec 32))) (Intermediate!4682 (undefined!5494 Bool) (index!20954 (_ BitVec 32)) (x!49929 (_ BitVec 32))) (Undefined!4682) (MissingVacant!4682 (index!20955 (_ BitVec 32))) )
))
(declare-fun lt!245386 () SeekEntryResult!4682)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533093 (= res!328300 (or (= lt!245386 (MissingZero!4682 i!1153)) (= lt!245386 (MissingVacant!4682 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33770 0))(
  ( (array!33771 (arr!16224 (Array (_ BitVec 32) (_ BitVec 64))) (size!16588 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33770)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33770 (_ BitVec 32)) SeekEntryResult!4682)

(assert (=> b!533093 (= lt!245386 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533095 () Bool)

(assert (=> b!533095 (= e!310301 false)))

(declare-fun lt!245385 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533095 (= lt!245385 (toIndex!0 (select (arr!16224 a!3154) j!147) mask!3216))))

(declare-fun b!533096 () Bool)

(declare-fun res!328307 () Bool)

(assert (=> b!533096 (=> (not res!328307) (not e!310302))))

(assert (=> b!533096 (= res!328307 (and (= (size!16588 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16588 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16588 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533097 () Bool)

(declare-fun res!328304 () Bool)

(assert (=> b!533097 (=> (not res!328304) (not e!310301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33770 (_ BitVec 32)) Bool)

(assert (=> b!533097 (= res!328304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533098 () Bool)

(declare-fun res!328298 () Bool)

(assert (=> b!533098 (=> (not res!328298) (not e!310301))))

(declare-datatypes ((List!10343 0))(
  ( (Nil!10340) (Cons!10339 (h!11282 (_ BitVec 64)) (t!16571 List!10343)) )
))
(declare-fun arrayNoDuplicates!0 (array!33770 (_ BitVec 32) List!10343) Bool)

(assert (=> b!533098 (= res!328298 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10340))))

(declare-fun b!533099 () Bool)

(declare-fun res!328305 () Bool)

(assert (=> b!533099 (=> (not res!328305) (not e!310301))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533099 (= res!328305 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16588 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16588 a!3154)) (= (select (arr!16224 a!3154) resIndex!32) (select (arr!16224 a!3154) j!147))))))

(declare-fun b!533100 () Bool)

(declare-fun res!328306 () Bool)

(assert (=> b!533100 (=> (not res!328306) (not e!310302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533100 (= res!328306 (validKeyInArray!0 k!1998))))

(declare-fun b!533101 () Bool)

(declare-fun res!328303 () Bool)

(assert (=> b!533101 (=> (not res!328303) (not e!310302))))

(assert (=> b!533101 (= res!328303 (validKeyInArray!0 (select (arr!16224 a!3154) j!147)))))

(declare-fun b!533102 () Bool)

(declare-fun res!328299 () Bool)

(assert (=> b!533102 (=> (not res!328299) (not e!310301))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33770 (_ BitVec 32)) SeekEntryResult!4682)

(assert (=> b!533102 (= res!328299 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16224 a!3154) j!147) a!3154 mask!3216) (Intermediate!4682 false resIndex!32 resX!32)))))

(declare-fun b!533094 () Bool)

(declare-fun res!328302 () Bool)

(assert (=> b!533094 (=> (not res!328302) (not e!310302))))

(declare-fun arrayContainsKey!0 (array!33770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533094 (= res!328302 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!328301 () Bool)

(assert (=> start!48558 (=> (not res!328301) (not e!310302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48558 (= res!328301 (validMask!0 mask!3216))))

(assert (=> start!48558 e!310302))

(assert (=> start!48558 true))

(declare-fun array_inv!12020 (array!33770) Bool)

(assert (=> start!48558 (array_inv!12020 a!3154)))

(assert (= (and start!48558 res!328301) b!533096))

(assert (= (and b!533096 res!328307) b!533101))

(assert (= (and b!533101 res!328303) b!533100))

(assert (= (and b!533100 res!328306) b!533094))

(assert (= (and b!533094 res!328302) b!533093))

(assert (= (and b!533093 res!328300) b!533097))

(assert (= (and b!533097 res!328304) b!533098))

(assert (= (and b!533098 res!328298) b!533099))

(assert (= (and b!533099 res!328305) b!533102))

(assert (= (and b!533102 res!328299) b!533095))

(declare-fun m!513045 () Bool)

(assert (=> b!533099 m!513045))

(declare-fun m!513047 () Bool)

(assert (=> b!533099 m!513047))

(assert (=> b!533101 m!513047))

(assert (=> b!533101 m!513047))

(declare-fun m!513049 () Bool)

(assert (=> b!533101 m!513049))

(declare-fun m!513051 () Bool)

(assert (=> start!48558 m!513051))

(declare-fun m!513053 () Bool)

(assert (=> start!48558 m!513053))

(declare-fun m!513055 () Bool)

(assert (=> b!533100 m!513055))

(declare-fun m!513057 () Bool)

(assert (=> b!533094 m!513057))

(declare-fun m!513059 () Bool)

(assert (=> b!533098 m!513059))

(declare-fun m!513061 () Bool)

(assert (=> b!533093 m!513061))

(declare-fun m!513063 () Bool)

(assert (=> b!533097 m!513063))

(assert (=> b!533095 m!513047))

(assert (=> b!533095 m!513047))

(declare-fun m!513065 () Bool)

(assert (=> b!533095 m!513065))

(assert (=> b!533102 m!513047))

(assert (=> b!533102 m!513047))

(declare-fun m!513067 () Bool)

(assert (=> b!533102 m!513067))

(push 1)

