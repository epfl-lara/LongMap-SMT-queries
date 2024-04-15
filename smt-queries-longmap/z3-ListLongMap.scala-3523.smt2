; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48696 () Bool)

(assert start!48696)

(declare-fun b!535090 () Bool)

(declare-fun res!330446 () Bool)

(declare-fun e!310839 () Bool)

(assert (=> b!535090 (=> (not res!330446) (not e!310839))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33918 0))(
  ( (array!33919 (arr!16298 (Array (_ BitVec 32) (_ BitVec 64))) (size!16663 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33918)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535090 (= res!330446 (and (= (size!16663 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16663 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16663 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535091 () Bool)

(declare-fun res!330438 () Bool)

(declare-fun e!310838 () Bool)

(assert (=> b!535091 (=> (not res!330438) (not e!310838))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4753 0))(
  ( (MissingZero!4753 (index!21236 (_ BitVec 32))) (Found!4753 (index!21237 (_ BitVec 32))) (Intermediate!4753 (undefined!5565 Bool) (index!21238 (_ BitVec 32)) (x!50195 (_ BitVec 32))) (Undefined!4753) (MissingVacant!4753 (index!21239 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33918 (_ BitVec 32)) SeekEntryResult!4753)

(assert (=> b!535091 (= res!330438 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16298 a!3154) j!147) a!3154 mask!3216) (Intermediate!4753 false resIndex!32 resX!32)))))

(declare-fun b!535092 () Bool)

(declare-fun res!330442 () Bool)

(assert (=> b!535092 (=> (not res!330442) (not e!310838))))

(assert (=> b!535092 (= res!330442 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16663 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16663 a!3154)) (= (select (arr!16298 a!3154) resIndex!32) (select (arr!16298 a!3154) j!147))))))

(declare-fun res!330445 () Bool)

(assert (=> start!48696 (=> (not res!330445) (not e!310839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48696 (= res!330445 (validMask!0 mask!3216))))

(assert (=> start!48696 e!310839))

(assert (=> start!48696 true))

(declare-fun array_inv!12181 (array!33918) Bool)

(assert (=> start!48696 (array_inv!12181 a!3154)))

(declare-fun b!535093 () Bool)

(assert (=> b!535093 (= e!310838 false)))

(declare-fun lt!245574 () SeekEntryResult!4753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535093 (= lt!245574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16298 a!3154) j!147) mask!3216) (select (arr!16298 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535094 () Bool)

(declare-fun res!330439 () Bool)

(assert (=> b!535094 (=> (not res!330439) (not e!310838))))

(declare-datatypes ((List!10456 0))(
  ( (Nil!10453) (Cons!10452 (h!11395 (_ BitVec 64)) (t!16675 List!10456)) )
))
(declare-fun arrayNoDuplicates!0 (array!33918 (_ BitVec 32) List!10456) Bool)

(assert (=> b!535094 (= res!330439 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10453))))

(declare-fun b!535095 () Bool)

(declare-fun res!330444 () Bool)

(assert (=> b!535095 (=> (not res!330444) (not e!310839))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535095 (= res!330444 (validKeyInArray!0 k0!1998))))

(declare-fun b!535096 () Bool)

(declare-fun res!330437 () Bool)

(assert (=> b!535096 (=> (not res!330437) (not e!310839))))

(assert (=> b!535096 (= res!330437 (validKeyInArray!0 (select (arr!16298 a!3154) j!147)))))

(declare-fun b!535097 () Bool)

(declare-fun res!330441 () Bool)

(assert (=> b!535097 (=> (not res!330441) (not e!310838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33918 (_ BitVec 32)) Bool)

(assert (=> b!535097 (= res!330441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535098 () Bool)

(declare-fun res!330443 () Bool)

(assert (=> b!535098 (=> (not res!330443) (not e!310839))))

(declare-fun arrayContainsKey!0 (array!33918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535098 (= res!330443 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535099 () Bool)

(assert (=> b!535099 (= e!310839 e!310838)))

(declare-fun res!330440 () Bool)

(assert (=> b!535099 (=> (not res!330440) (not e!310838))))

(declare-fun lt!245575 () SeekEntryResult!4753)

(assert (=> b!535099 (= res!330440 (or (= lt!245575 (MissingZero!4753 i!1153)) (= lt!245575 (MissingVacant!4753 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33918 (_ BitVec 32)) SeekEntryResult!4753)

(assert (=> b!535099 (= lt!245575 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48696 res!330445) b!535090))

(assert (= (and b!535090 res!330446) b!535096))

(assert (= (and b!535096 res!330437) b!535095))

(assert (= (and b!535095 res!330444) b!535098))

(assert (= (and b!535098 res!330443) b!535099))

(assert (= (and b!535099 res!330440) b!535097))

(assert (= (and b!535097 res!330441) b!535094))

(assert (= (and b!535094 res!330439) b!535092))

(assert (= (and b!535092 res!330442) b!535091))

(assert (= (and b!535091 res!330438) b!535093))

(declare-fun m!514207 () Bool)

(assert (=> b!535092 m!514207))

(declare-fun m!514209 () Bool)

(assert (=> b!535092 m!514209))

(declare-fun m!514211 () Bool)

(assert (=> b!535099 m!514211))

(declare-fun m!514213 () Bool)

(assert (=> b!535098 m!514213))

(declare-fun m!514215 () Bool)

(assert (=> start!48696 m!514215))

(declare-fun m!514217 () Bool)

(assert (=> start!48696 m!514217))

(declare-fun m!514219 () Bool)

(assert (=> b!535095 m!514219))

(declare-fun m!514221 () Bool)

(assert (=> b!535094 m!514221))

(assert (=> b!535093 m!514209))

(assert (=> b!535093 m!514209))

(declare-fun m!514223 () Bool)

(assert (=> b!535093 m!514223))

(assert (=> b!535093 m!514223))

(assert (=> b!535093 m!514209))

(declare-fun m!514225 () Bool)

(assert (=> b!535093 m!514225))

(assert (=> b!535096 m!514209))

(assert (=> b!535096 m!514209))

(declare-fun m!514227 () Bool)

(assert (=> b!535096 m!514227))

(declare-fun m!514229 () Bool)

(assert (=> b!535097 m!514229))

(assert (=> b!535091 m!514209))

(assert (=> b!535091 m!514209))

(declare-fun m!514231 () Bool)

(assert (=> b!535091 m!514231))

(check-sat (not b!535095) (not b!535098) (not start!48696) (not b!535097) (not b!535093) (not b!535099) (not b!535094) (not b!535091) (not b!535096))
(check-sat)
