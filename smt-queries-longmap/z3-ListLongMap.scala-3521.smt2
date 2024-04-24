; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48688 () Bool)

(assert start!48688)

(declare-fun res!330363 () Bool)

(declare-fun e!310905 () Bool)

(assert (=> start!48688 (=> (not res!330363) (not e!310905))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48688 (= res!330363 (validMask!0 mask!3216))))

(assert (=> start!48688 e!310905))

(assert (=> start!48688 true))

(declare-datatypes ((array!33899 0))(
  ( (array!33900 (arr!16288 (Array (_ BitVec 32) (_ BitVec 64))) (size!16652 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33899)

(declare-fun array_inv!12147 (array!33899) Bool)

(assert (=> start!48688 (array_inv!12147 a!3154)))

(declare-fun b!535095 () Bool)

(declare-fun res!330362 () Bool)

(assert (=> b!535095 (=> (not res!330362) (not e!310905))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535095 (= res!330362 (validKeyInArray!0 (select (arr!16288 a!3154) j!147)))))

(declare-fun b!535096 () Bool)

(declare-fun e!310903 () Bool)

(declare-fun e!310902 () Bool)

(assert (=> b!535096 (= e!310903 e!310902)))

(declare-fun res!330359 () Bool)

(assert (=> b!535096 (=> (not res!330359) (not e!310902))))

(declare-datatypes ((SeekEntryResult!4702 0))(
  ( (MissingZero!4702 (index!21032 (_ BitVec 32))) (Found!4702 (index!21033 (_ BitVec 32))) (Intermediate!4702 (undefined!5514 Bool) (index!21034 (_ BitVec 32)) (x!50130 (_ BitVec 32))) (Undefined!4702) (MissingVacant!4702 (index!21035 (_ BitVec 32))) )
))
(declare-fun lt!245785 () SeekEntryResult!4702)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535096 (= res!330359 (= lt!245785 (Intermediate!4702 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33899 (_ BitVec 32)) SeekEntryResult!4702)

(assert (=> b!535096 (= lt!245785 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16288 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535097 () Bool)

(declare-fun res!330364 () Bool)

(assert (=> b!535097 (=> (not res!330364) (not e!310903))))

(declare-datatypes ((List!10314 0))(
  ( (Nil!10311) (Cons!10310 (h!11253 (_ BitVec 64)) (t!16534 List!10314)) )
))
(declare-fun arrayNoDuplicates!0 (array!33899 (_ BitVec 32) List!10314) Bool)

(assert (=> b!535097 (= res!330364 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10311))))

(declare-fun b!535098 () Bool)

(declare-fun res!330354 () Bool)

(assert (=> b!535098 (=> (not res!330354) (not e!310905))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535098 (= res!330354 (and (= (size!16652 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16652 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16652 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535099 () Bool)

(declare-fun res!330357 () Bool)

(assert (=> b!535099 (=> (not res!330357) (not e!310902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535099 (= res!330357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16288 a!3154) j!147) mask!3216) (select (arr!16288 a!3154) j!147) a!3154 mask!3216) lt!245785))))

(declare-fun b!535100 () Bool)

(declare-fun res!330360 () Bool)

(assert (=> b!535100 (=> (not res!330360) (not e!310903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33899 (_ BitVec 32)) Bool)

(assert (=> b!535100 (= res!330360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535101 () Bool)

(assert (=> b!535101 (= e!310905 e!310903)))

(declare-fun res!330361 () Bool)

(assert (=> b!535101 (=> (not res!330361) (not e!310903))))

(declare-fun lt!245784 () SeekEntryResult!4702)

(assert (=> b!535101 (= res!330361 (or (= lt!245784 (MissingZero!4702 i!1153)) (= lt!245784 (MissingVacant!4702 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33899 (_ BitVec 32)) SeekEntryResult!4702)

(assert (=> b!535101 (= lt!245784 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535102 () Bool)

(declare-fun res!330355 () Bool)

(assert (=> b!535102 (=> (not res!330355) (not e!310903))))

(assert (=> b!535102 (= res!330355 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16652 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16652 a!3154)) (= (select (arr!16288 a!3154) resIndex!32) (select (arr!16288 a!3154) j!147))))))

(declare-fun b!535103 () Bool)

(declare-fun res!330356 () Bool)

(assert (=> b!535103 (=> (not res!330356) (not e!310905))))

(assert (=> b!535103 (= res!330356 (validKeyInArray!0 k0!1998))))

(declare-fun b!535104 () Bool)

(declare-fun res!330358 () Bool)

(assert (=> b!535104 (=> (not res!330358) (not e!310905))))

(declare-fun arrayContainsKey!0 (array!33899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535104 (= res!330358 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535105 () Bool)

(assert (=> b!535105 (= e!310902 (and (not (= (select (arr!16288 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16288 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16288 a!3154) index!1177) (select (arr!16288 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (= (and start!48688 res!330363) b!535098))

(assert (= (and b!535098 res!330354) b!535095))

(assert (= (and b!535095 res!330362) b!535103))

(assert (= (and b!535103 res!330356) b!535104))

(assert (= (and b!535104 res!330358) b!535101))

(assert (= (and b!535101 res!330361) b!535100))

(assert (= (and b!535100 res!330360) b!535097))

(assert (= (and b!535097 res!330364) b!535102))

(assert (= (and b!535102 res!330355) b!535096))

(assert (= (and b!535096 res!330359) b!535099))

(assert (= (and b!535099 res!330357) b!535105))

(declare-fun m!514957 () Bool)

(assert (=> b!535095 m!514957))

(assert (=> b!535095 m!514957))

(declare-fun m!514959 () Bool)

(assert (=> b!535095 m!514959))

(assert (=> b!535099 m!514957))

(assert (=> b!535099 m!514957))

(declare-fun m!514961 () Bool)

(assert (=> b!535099 m!514961))

(assert (=> b!535099 m!514961))

(assert (=> b!535099 m!514957))

(declare-fun m!514963 () Bool)

(assert (=> b!535099 m!514963))

(declare-fun m!514965 () Bool)

(assert (=> b!535097 m!514965))

(declare-fun m!514967 () Bool)

(assert (=> b!535100 m!514967))

(declare-fun m!514969 () Bool)

(assert (=> b!535103 m!514969))

(assert (=> b!535096 m!514957))

(assert (=> b!535096 m!514957))

(declare-fun m!514971 () Bool)

(assert (=> b!535096 m!514971))

(declare-fun m!514973 () Bool)

(assert (=> b!535101 m!514973))

(declare-fun m!514975 () Bool)

(assert (=> b!535102 m!514975))

(assert (=> b!535102 m!514957))

(declare-fun m!514977 () Bool)

(assert (=> b!535104 m!514977))

(declare-fun m!514979 () Bool)

(assert (=> start!48688 m!514979))

(declare-fun m!514981 () Bool)

(assert (=> start!48688 m!514981))

(declare-fun m!514983 () Bool)

(assert (=> b!535105 m!514983))

(assert (=> b!535105 m!514957))

(check-sat (not b!535096) (not b!535097) (not b!535100) (not b!535099) (not b!535095) (not b!535101) (not b!535104) (not b!535103) (not start!48688))
(check-sat)
