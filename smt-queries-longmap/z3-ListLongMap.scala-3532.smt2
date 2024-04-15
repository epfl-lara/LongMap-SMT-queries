; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48750 () Bool)

(assert start!48750)

(declare-fun b!536068 () Bool)

(declare-fun e!311205 () Bool)

(assert (=> b!536068 (= e!311205 false)))

(declare-datatypes ((SeekEntryResult!4780 0))(
  ( (MissingZero!4780 (index!21344 (_ BitVec 32))) (Found!4780 (index!21345 (_ BitVec 32))) (Intermediate!4780 (undefined!5592 Bool) (index!21346 (_ BitVec 32)) (x!50294 (_ BitVec 32))) (Undefined!4780) (MissingVacant!4780 (index!21347 (_ BitVec 32))) )
))
(declare-fun lt!245831 () SeekEntryResult!4780)

(declare-fun lt!245833 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33972 0))(
  ( (array!33973 (arr!16325 (Array (_ BitVec 32) (_ BitVec 64))) (size!16690 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4780)

(assert (=> b!536068 (= lt!245831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245833 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536069 () Bool)

(declare-fun e!311204 () Bool)

(declare-fun e!311202 () Bool)

(assert (=> b!536069 (= e!311204 e!311202)))

(declare-fun res!331419 () Bool)

(assert (=> b!536069 (=> (not res!331419) (not e!311202))))

(declare-fun lt!245830 () SeekEntryResult!4780)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536069 (= res!331419 (or (= lt!245830 (MissingZero!4780 i!1153)) (= lt!245830 (MissingVacant!4780 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4780)

(assert (=> b!536069 (= lt!245830 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536070 () Bool)

(declare-fun res!331425 () Bool)

(assert (=> b!536070 (=> (not res!331425) (not e!311204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536070 (= res!331425 (validKeyInArray!0 k0!1998))))

(declare-fun b!536071 () Bool)

(declare-fun res!331422 () Bool)

(declare-fun e!311201 () Bool)

(assert (=> b!536071 (=> (not res!331422) (not e!311201))))

(declare-fun lt!245832 () SeekEntryResult!4780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536071 (= res!331422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16325 a!3154) j!147) mask!3216) (select (arr!16325 a!3154) j!147) a!3154 mask!3216) lt!245832))))

(declare-fun b!536072 () Bool)

(declare-fun res!331424 () Bool)

(assert (=> b!536072 (=> (not res!331424) (not e!311204))))

(assert (=> b!536072 (= res!331424 (validKeyInArray!0 (select (arr!16325 a!3154) j!147)))))

(declare-fun b!536073 () Bool)

(declare-fun res!331415 () Bool)

(assert (=> b!536073 (=> (not res!331415) (not e!311204))))

(declare-fun arrayContainsKey!0 (array!33972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536073 (= res!331415 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536074 () Bool)

(assert (=> b!536074 (= e!311202 e!311201)))

(declare-fun res!331426 () Bool)

(assert (=> b!536074 (=> (not res!331426) (not e!311201))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536074 (= res!331426 (= lt!245832 (Intermediate!4780 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536074 (= lt!245832 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536075 () Bool)

(assert (=> b!536075 (= e!311201 e!311205)))

(declare-fun res!331418 () Bool)

(assert (=> b!536075 (=> (not res!331418) (not e!311205))))

(assert (=> b!536075 (= res!331418 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245833 #b00000000000000000000000000000000) (bvslt lt!245833 (size!16690 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536075 (= lt!245833 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536077 () Bool)

(declare-fun res!331427 () Bool)

(assert (=> b!536077 (=> (not res!331427) (not e!311202))))

(assert (=> b!536077 (= res!331427 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16690 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16690 a!3154)) (= (select (arr!16325 a!3154) resIndex!32) (select (arr!16325 a!3154) j!147))))))

(declare-fun b!536078 () Bool)

(declare-fun res!331416 () Bool)

(assert (=> b!536078 (=> (not res!331416) (not e!311202))))

(declare-datatypes ((List!10483 0))(
  ( (Nil!10480) (Cons!10479 (h!11422 (_ BitVec 64)) (t!16702 List!10483)) )
))
(declare-fun arrayNoDuplicates!0 (array!33972 (_ BitVec 32) List!10483) Bool)

(assert (=> b!536078 (= res!331416 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10480))))

(declare-fun b!536079 () Bool)

(declare-fun res!331420 () Bool)

(assert (=> b!536079 (=> (not res!331420) (not e!311204))))

(assert (=> b!536079 (= res!331420 (and (= (size!16690 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16690 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16690 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536080 () Bool)

(declare-fun res!331423 () Bool)

(assert (=> b!536080 (=> (not res!331423) (not e!311201))))

(assert (=> b!536080 (= res!331423 (and (not (= (select (arr!16325 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) (select (arr!16325 a!3154) j!147)))))))

(declare-fun res!331421 () Bool)

(assert (=> start!48750 (=> (not res!331421) (not e!311204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48750 (= res!331421 (validMask!0 mask!3216))))

(assert (=> start!48750 e!311204))

(assert (=> start!48750 true))

(declare-fun array_inv!12208 (array!33972) Bool)

(assert (=> start!48750 (array_inv!12208 a!3154)))

(declare-fun b!536076 () Bool)

(declare-fun res!331417 () Bool)

(assert (=> b!536076 (=> (not res!331417) (not e!311202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33972 (_ BitVec 32)) Bool)

(assert (=> b!536076 (= res!331417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48750 res!331421) b!536079))

(assert (= (and b!536079 res!331420) b!536072))

(assert (= (and b!536072 res!331424) b!536070))

(assert (= (and b!536070 res!331425) b!536073))

(assert (= (and b!536073 res!331415) b!536069))

(assert (= (and b!536069 res!331419) b!536076))

(assert (= (and b!536076 res!331417) b!536078))

(assert (= (and b!536078 res!331416) b!536077))

(assert (= (and b!536077 res!331427) b!536074))

(assert (= (and b!536074 res!331426) b!536071))

(assert (= (and b!536071 res!331422) b!536080))

(assert (= (and b!536080 res!331423) b!536075))

(assert (= (and b!536075 res!331418) b!536068))

(declare-fun m!515017 () Bool)

(assert (=> start!48750 m!515017))

(declare-fun m!515019 () Bool)

(assert (=> start!48750 m!515019))

(declare-fun m!515021 () Bool)

(assert (=> b!536076 m!515021))

(declare-fun m!515023 () Bool)

(assert (=> b!536068 m!515023))

(assert (=> b!536068 m!515023))

(declare-fun m!515025 () Bool)

(assert (=> b!536068 m!515025))

(assert (=> b!536074 m!515023))

(assert (=> b!536074 m!515023))

(declare-fun m!515027 () Bool)

(assert (=> b!536074 m!515027))

(declare-fun m!515029 () Bool)

(assert (=> b!536073 m!515029))

(declare-fun m!515031 () Bool)

(assert (=> b!536075 m!515031))

(assert (=> b!536072 m!515023))

(assert (=> b!536072 m!515023))

(declare-fun m!515033 () Bool)

(assert (=> b!536072 m!515033))

(declare-fun m!515035 () Bool)

(assert (=> b!536078 m!515035))

(assert (=> b!536071 m!515023))

(assert (=> b!536071 m!515023))

(declare-fun m!515037 () Bool)

(assert (=> b!536071 m!515037))

(assert (=> b!536071 m!515037))

(assert (=> b!536071 m!515023))

(declare-fun m!515039 () Bool)

(assert (=> b!536071 m!515039))

(declare-fun m!515041 () Bool)

(assert (=> b!536070 m!515041))

(declare-fun m!515043 () Bool)

(assert (=> b!536069 m!515043))

(declare-fun m!515045 () Bool)

(assert (=> b!536080 m!515045))

(assert (=> b!536080 m!515023))

(declare-fun m!515047 () Bool)

(assert (=> b!536077 m!515047))

(assert (=> b!536077 m!515023))

(check-sat (not b!536078) (not b!536069) (not b!536075) (not b!536072) (not b!536076) (not b!536073) (not b!536071) (not b!536068) (not b!536070) (not start!48750) (not b!536074))
(check-sat)
