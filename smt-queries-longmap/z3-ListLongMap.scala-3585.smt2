; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49298 () Bool)

(assert start!49298)

(declare-fun b!542862 () Bool)

(declare-fun e!314106 () Bool)

(assert (=> b!542862 (= e!314106 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248029 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542862 (= lt!248029 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!337414 () Bool)

(declare-fun e!314109 () Bool)

(assert (=> start!49298 (=> (not res!337414) (not e!314109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49298 (= res!337414 (validMask!0 mask!3216))))

(assert (=> start!49298 e!314109))

(assert (=> start!49298 true))

(declare-datatypes ((array!34306 0))(
  ( (array!34307 (arr!16486 (Array (_ BitVec 32) (_ BitVec 64))) (size!16850 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34306)

(declare-fun array_inv!12282 (array!34306) Bool)

(assert (=> start!49298 (array_inv!12282 a!3154)))

(declare-fun b!542863 () Bool)

(declare-fun res!337417 () Bool)

(declare-fun e!314108 () Bool)

(assert (=> b!542863 (=> (not res!337417) (not e!314108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34306 (_ BitVec 32)) Bool)

(assert (=> b!542863 (= res!337417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542864 () Bool)

(declare-fun res!337419 () Bool)

(assert (=> b!542864 (=> (not res!337419) (not e!314106))))

(declare-datatypes ((SeekEntryResult!4944 0))(
  ( (MissingZero!4944 (index!22000 (_ BitVec 32))) (Found!4944 (index!22001 (_ BitVec 32))) (Intermediate!4944 (undefined!5756 Bool) (index!22002 (_ BitVec 32)) (x!50911 (_ BitVec 32))) (Undefined!4944) (MissingVacant!4944 (index!22003 (_ BitVec 32))) )
))
(declare-fun lt!248027 () SeekEntryResult!4944)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34306 (_ BitVec 32)) SeekEntryResult!4944)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542864 (= res!337419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16486 a!3154) j!147) mask!3216) (select (arr!16486 a!3154) j!147) a!3154 mask!3216) lt!248027))))

(declare-fun b!542865 () Bool)

(assert (=> b!542865 (= e!314109 e!314108)))

(declare-fun res!337424 () Bool)

(assert (=> b!542865 (=> (not res!337424) (not e!314108))))

(declare-fun lt!248028 () SeekEntryResult!4944)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542865 (= res!337424 (or (= lt!248028 (MissingZero!4944 i!1153)) (= lt!248028 (MissingVacant!4944 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34306 (_ BitVec 32)) SeekEntryResult!4944)

(assert (=> b!542865 (= lt!248028 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542866 () Bool)

(declare-fun res!337418 () Bool)

(assert (=> b!542866 (=> (not res!337418) (not e!314106))))

(assert (=> b!542866 (= res!337418 (and (not (= (select (arr!16486 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16486 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16486 a!3154) index!1177) (select (arr!16486 a!3154) j!147)))))))

(declare-fun b!542867 () Bool)

(declare-fun res!337416 () Bool)

(assert (=> b!542867 (=> (not res!337416) (not e!314109))))

(declare-fun arrayContainsKey!0 (array!34306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542867 (= res!337416 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542868 () Bool)

(declare-fun res!337421 () Bool)

(assert (=> b!542868 (=> (not res!337421) (not e!314108))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542868 (= res!337421 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16850 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16850 a!3154)) (= (select (arr!16486 a!3154) resIndex!32) (select (arr!16486 a!3154) j!147))))))

(declare-fun b!542869 () Bool)

(declare-fun res!337415 () Bool)

(assert (=> b!542869 (=> (not res!337415) (not e!314108))))

(declare-datatypes ((List!10605 0))(
  ( (Nil!10602) (Cons!10601 (h!11556 (_ BitVec 64)) (t!16833 List!10605)) )
))
(declare-fun arrayNoDuplicates!0 (array!34306 (_ BitVec 32) List!10605) Bool)

(assert (=> b!542869 (= res!337415 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10602))))

(declare-fun b!542870 () Bool)

(assert (=> b!542870 (= e!314108 e!314106)))

(declare-fun res!337423 () Bool)

(assert (=> b!542870 (=> (not res!337423) (not e!314106))))

(assert (=> b!542870 (= res!337423 (= lt!248027 (Intermediate!4944 false resIndex!32 resX!32)))))

(assert (=> b!542870 (= lt!248027 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16486 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542871 () Bool)

(declare-fun res!337413 () Bool)

(assert (=> b!542871 (=> (not res!337413) (not e!314109))))

(assert (=> b!542871 (= res!337413 (and (= (size!16850 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16850 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16850 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542872 () Bool)

(declare-fun res!337420 () Bool)

(assert (=> b!542872 (=> (not res!337420) (not e!314109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542872 (= res!337420 (validKeyInArray!0 (select (arr!16486 a!3154) j!147)))))

(declare-fun b!542873 () Bool)

(declare-fun res!337422 () Bool)

(assert (=> b!542873 (=> (not res!337422) (not e!314109))))

(assert (=> b!542873 (= res!337422 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49298 res!337414) b!542871))

(assert (= (and b!542871 res!337413) b!542872))

(assert (= (and b!542872 res!337420) b!542873))

(assert (= (and b!542873 res!337422) b!542867))

(assert (= (and b!542867 res!337416) b!542865))

(assert (= (and b!542865 res!337424) b!542863))

(assert (= (and b!542863 res!337417) b!542869))

(assert (= (and b!542869 res!337415) b!542868))

(assert (= (and b!542868 res!337421) b!542870))

(assert (= (and b!542870 res!337423) b!542864))

(assert (= (and b!542864 res!337419) b!542866))

(assert (= (and b!542866 res!337418) b!542862))

(declare-fun m!521049 () Bool)

(assert (=> b!542862 m!521049))

(declare-fun m!521051 () Bool)

(assert (=> b!542867 m!521051))

(declare-fun m!521053 () Bool)

(assert (=> b!542873 m!521053))

(declare-fun m!521055 () Bool)

(assert (=> b!542870 m!521055))

(assert (=> b!542870 m!521055))

(declare-fun m!521057 () Bool)

(assert (=> b!542870 m!521057))

(declare-fun m!521059 () Bool)

(assert (=> b!542866 m!521059))

(assert (=> b!542866 m!521055))

(declare-fun m!521061 () Bool)

(assert (=> b!542865 m!521061))

(declare-fun m!521063 () Bool)

(assert (=> b!542863 m!521063))

(declare-fun m!521065 () Bool)

(assert (=> start!49298 m!521065))

(declare-fun m!521067 () Bool)

(assert (=> start!49298 m!521067))

(declare-fun m!521069 () Bool)

(assert (=> b!542868 m!521069))

(assert (=> b!542868 m!521055))

(assert (=> b!542864 m!521055))

(assert (=> b!542864 m!521055))

(declare-fun m!521071 () Bool)

(assert (=> b!542864 m!521071))

(assert (=> b!542864 m!521071))

(assert (=> b!542864 m!521055))

(declare-fun m!521073 () Bool)

(assert (=> b!542864 m!521073))

(declare-fun m!521075 () Bool)

(assert (=> b!542869 m!521075))

(assert (=> b!542872 m!521055))

(assert (=> b!542872 m!521055))

(declare-fun m!521077 () Bool)

(assert (=> b!542872 m!521077))

(check-sat (not b!542862) (not b!542872) (not b!542870) (not b!542873) (not b!542864) (not b!542869) (not b!542863) (not b!542865) (not b!542867) (not start!49298))
(check-sat)
