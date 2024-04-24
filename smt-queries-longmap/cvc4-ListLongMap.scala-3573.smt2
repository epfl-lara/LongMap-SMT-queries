; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49164 () Bool)

(assert start!49164)

(declare-fun b!541306 () Bool)

(declare-fun res!336088 () Bool)

(declare-fun e!313492 () Bool)

(assert (=> b!541306 (=> (not res!336088) (not e!313492))))

(declare-datatypes ((array!34222 0))(
  ( (array!34223 (arr!16445 (Array (_ BitVec 32) (_ BitVec 64))) (size!16809 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34222)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541306 (= res!336088 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541307 () Bool)

(declare-fun res!336093 () Bool)

(assert (=> b!541307 (=> (not res!336093) (not e!313492))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541307 (= res!336093 (and (= (size!16809 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16809 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16809 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541308 () Bool)

(declare-fun res!336097 () Bool)

(declare-fun e!313494 () Bool)

(assert (=> b!541308 (=> (not res!336097) (not e!313494))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4859 0))(
  ( (MissingZero!4859 (index!21660 (_ BitVec 32))) (Found!4859 (index!21661 (_ BitVec 32))) (Intermediate!4859 (undefined!5671 Bool) (index!21662 (_ BitVec 32)) (x!50721 (_ BitVec 32))) (Undefined!4859) (MissingVacant!4859 (index!21663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34222 (_ BitVec 32)) SeekEntryResult!4859)

(assert (=> b!541308 (= res!336097 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16445 a!3154) j!147) a!3154 mask!3216) (Intermediate!4859 false resIndex!32 resX!32)))))

(declare-fun b!541309 () Bool)

(assert (=> b!541309 (= e!313492 e!313494)))

(declare-fun res!336096 () Bool)

(assert (=> b!541309 (=> (not res!336096) (not e!313494))))

(declare-fun lt!247663 () SeekEntryResult!4859)

(assert (=> b!541309 (= res!336096 (or (= lt!247663 (MissingZero!4859 i!1153)) (= lt!247663 (MissingVacant!4859 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34222 (_ BitVec 32)) SeekEntryResult!4859)

(assert (=> b!541309 (= lt!247663 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541310 () Bool)

(declare-fun res!336095 () Bool)

(assert (=> b!541310 (=> (not res!336095) (not e!313494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34222 (_ BitVec 32)) Bool)

(assert (=> b!541310 (= res!336095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541311 () Bool)

(declare-fun res!336090 () Bool)

(assert (=> b!541311 (=> (not res!336090) (not e!313494))))

(assert (=> b!541311 (= res!336090 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16809 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16809 a!3154)) (= (select (arr!16445 a!3154) resIndex!32) (select (arr!16445 a!3154) j!147))))))

(declare-fun b!541312 () Bool)

(declare-fun res!336094 () Bool)

(assert (=> b!541312 (=> (not res!336094) (not e!313492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541312 (= res!336094 (validKeyInArray!0 k!1998))))

(declare-fun b!541314 () Bool)

(declare-fun res!336091 () Bool)

(assert (=> b!541314 (=> (not res!336091) (not e!313492))))

(assert (=> b!541314 (= res!336091 (validKeyInArray!0 (select (arr!16445 a!3154) j!147)))))

(declare-fun b!541315 () Bool)

(assert (=> b!541315 (= e!313494 false)))

(declare-fun lt!247662 () SeekEntryResult!4859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541315 (= lt!247662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16445 a!3154) j!147) mask!3216) (select (arr!16445 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541313 () Bool)

(declare-fun res!336092 () Bool)

(assert (=> b!541313 (=> (not res!336092) (not e!313494))))

(declare-datatypes ((List!10471 0))(
  ( (Nil!10468) (Cons!10467 (h!11419 (_ BitVec 64)) (t!16691 List!10471)) )
))
(declare-fun arrayNoDuplicates!0 (array!34222 (_ BitVec 32) List!10471) Bool)

(assert (=> b!541313 (= res!336092 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10468))))

(declare-fun res!336089 () Bool)

(assert (=> start!49164 (=> (not res!336089) (not e!313492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49164 (= res!336089 (validMask!0 mask!3216))))

(assert (=> start!49164 e!313492))

(assert (=> start!49164 true))

(declare-fun array_inv!12304 (array!34222) Bool)

(assert (=> start!49164 (array_inv!12304 a!3154)))

(assert (= (and start!49164 res!336089) b!541307))

(assert (= (and b!541307 res!336093) b!541314))

(assert (= (and b!541314 res!336091) b!541312))

(assert (= (and b!541312 res!336094) b!541306))

(assert (= (and b!541306 res!336088) b!541309))

(assert (= (and b!541309 res!336096) b!541310))

(assert (= (and b!541310 res!336095) b!541313))

(assert (= (and b!541313 res!336092) b!541311))

(assert (= (and b!541311 res!336090) b!541308))

(assert (= (and b!541308 res!336097) b!541315))

(declare-fun m!520047 () Bool)

(assert (=> b!541309 m!520047))

(declare-fun m!520049 () Bool)

(assert (=> b!541311 m!520049))

(declare-fun m!520051 () Bool)

(assert (=> b!541311 m!520051))

(declare-fun m!520053 () Bool)

(assert (=> start!49164 m!520053))

(declare-fun m!520055 () Bool)

(assert (=> start!49164 m!520055))

(declare-fun m!520057 () Bool)

(assert (=> b!541313 m!520057))

(declare-fun m!520059 () Bool)

(assert (=> b!541306 m!520059))

(assert (=> b!541315 m!520051))

(assert (=> b!541315 m!520051))

(declare-fun m!520061 () Bool)

(assert (=> b!541315 m!520061))

(assert (=> b!541315 m!520061))

(assert (=> b!541315 m!520051))

(declare-fun m!520063 () Bool)

(assert (=> b!541315 m!520063))

(assert (=> b!541314 m!520051))

(assert (=> b!541314 m!520051))

(declare-fun m!520065 () Bool)

(assert (=> b!541314 m!520065))

(declare-fun m!520067 () Bool)

(assert (=> b!541310 m!520067))

(assert (=> b!541308 m!520051))

(assert (=> b!541308 m!520051))

(declare-fun m!520069 () Bool)

(assert (=> b!541308 m!520069))

(declare-fun m!520071 () Bool)

(assert (=> b!541312 m!520071))

(push 1)

(assert (not b!541314))

(assert (not b!541309))

(assert (not b!541313))

(assert (not b!541306))

(assert (not start!49164))

(assert (not b!541310))

(assert (not b!541308))

(assert (not b!541312))

(assert (not b!541315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

