; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48692 () Bool)

(assert start!48692)

(declare-fun b!535090 () Bool)

(declare-fun res!330300 () Bool)

(declare-fun e!310919 () Bool)

(assert (=> b!535090 (=> (not res!330300) (not e!310919))))

(declare-datatypes ((array!33904 0))(
  ( (array!33905 (arr!16291 (Array (_ BitVec 32) (_ BitVec 64))) (size!16655 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33904)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535090 (= res!330300 (validKeyInArray!0 (select (arr!16291 a!3154) j!147)))))

(declare-fun b!535091 () Bool)

(declare-fun res!330305 () Bool)

(declare-fun e!310917 () Bool)

(assert (=> b!535091 (=> (not res!330305) (not e!310917))))

(declare-datatypes ((SeekEntryResult!4749 0))(
  ( (MissingZero!4749 (index!21220 (_ BitVec 32))) (Found!4749 (index!21221 (_ BitVec 32))) (Intermediate!4749 (undefined!5561 Bool) (index!21222 (_ BitVec 32)) (x!50172 (_ BitVec 32))) (Undefined!4749) (MissingVacant!4749 (index!21223 (_ BitVec 32))) )
))
(declare-fun lt!245760 () SeekEntryResult!4749)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33904 (_ BitVec 32)) SeekEntryResult!4749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535091 (= res!330305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16291 a!3154) j!147) mask!3216) (select (arr!16291 a!3154) j!147) a!3154 mask!3216) lt!245760))))

(declare-fun b!535092 () Bool)

(declare-fun e!310920 () Bool)

(assert (=> b!535092 (= e!310919 e!310920)))

(declare-fun res!330295 () Bool)

(assert (=> b!535092 (=> (not res!330295) (not e!310920))))

(declare-fun lt!245761 () SeekEntryResult!4749)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535092 (= res!330295 (or (= lt!245761 (MissingZero!4749 i!1153)) (= lt!245761 (MissingVacant!4749 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33904 (_ BitVec 32)) SeekEntryResult!4749)

(assert (=> b!535092 (= lt!245761 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!330297 () Bool)

(assert (=> start!48692 (=> (not res!330297) (not e!310919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48692 (= res!330297 (validMask!0 mask!3216))))

(assert (=> start!48692 e!310919))

(assert (=> start!48692 true))

(declare-fun array_inv!12087 (array!33904) Bool)

(assert (=> start!48692 (array_inv!12087 a!3154)))

(declare-fun b!535093 () Bool)

(declare-fun res!330302 () Bool)

(assert (=> b!535093 (=> (not res!330302) (not e!310919))))

(declare-fun arrayContainsKey!0 (array!33904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535093 (= res!330302 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535094 () Bool)

(declare-fun res!330296 () Bool)

(assert (=> b!535094 (=> (not res!330296) (not e!310920))))

(declare-datatypes ((List!10410 0))(
  ( (Nil!10407) (Cons!10406 (h!11349 (_ BitVec 64)) (t!16638 List!10410)) )
))
(declare-fun arrayNoDuplicates!0 (array!33904 (_ BitVec 32) List!10410) Bool)

(assert (=> b!535094 (= res!330296 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10407))))

(declare-fun b!535095 () Bool)

(declare-fun res!330299 () Bool)

(assert (=> b!535095 (=> (not res!330299) (not e!310919))))

(assert (=> b!535095 (= res!330299 (and (= (size!16655 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16655 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16655 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535096 () Bool)

(declare-fun res!330303 () Bool)

(assert (=> b!535096 (=> (not res!330303) (not e!310920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33904 (_ BitVec 32)) Bool)

(assert (=> b!535096 (= res!330303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535097 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535097 (= e!310917 (and (not (= (select (arr!16291 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16291 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16291 a!3154) index!1177) (select (arr!16291 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!535098 () Bool)

(assert (=> b!535098 (= e!310920 e!310917)))

(declare-fun res!330301 () Bool)

(assert (=> b!535098 (=> (not res!330301) (not e!310917))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535098 (= res!330301 (= lt!245760 (Intermediate!4749 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535098 (= lt!245760 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16291 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535099 () Bool)

(declare-fun res!330304 () Bool)

(assert (=> b!535099 (=> (not res!330304) (not e!310920))))

(assert (=> b!535099 (= res!330304 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16655 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16655 a!3154)) (= (select (arr!16291 a!3154) resIndex!32) (select (arr!16291 a!3154) j!147))))))

(declare-fun b!535100 () Bool)

(declare-fun res!330298 () Bool)

(assert (=> b!535100 (=> (not res!330298) (not e!310919))))

(assert (=> b!535100 (= res!330298 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48692 res!330297) b!535095))

(assert (= (and b!535095 res!330299) b!535090))

(assert (= (and b!535090 res!330300) b!535100))

(assert (= (and b!535100 res!330298) b!535093))

(assert (= (and b!535093 res!330302) b!535092))

(assert (= (and b!535092 res!330295) b!535096))

(assert (= (and b!535096 res!330303) b!535094))

(assert (= (and b!535094 res!330296) b!535099))

(assert (= (and b!535099 res!330304) b!535098))

(assert (= (and b!535098 res!330301) b!535091))

(assert (= (and b!535091 res!330305) b!535097))

(declare-fun m!514717 () Bool)

(assert (=> b!535092 m!514717))

(declare-fun m!514719 () Bool)

(assert (=> start!48692 m!514719))

(declare-fun m!514721 () Bool)

(assert (=> start!48692 m!514721))

(declare-fun m!514723 () Bool)

(assert (=> b!535099 m!514723))

(declare-fun m!514725 () Bool)

(assert (=> b!535099 m!514725))

(declare-fun m!514727 () Bool)

(assert (=> b!535097 m!514727))

(assert (=> b!535097 m!514725))

(assert (=> b!535091 m!514725))

(assert (=> b!535091 m!514725))

(declare-fun m!514729 () Bool)

(assert (=> b!535091 m!514729))

(assert (=> b!535091 m!514729))

(assert (=> b!535091 m!514725))

(declare-fun m!514731 () Bool)

(assert (=> b!535091 m!514731))

(declare-fun m!514733 () Bool)

(assert (=> b!535096 m!514733))

(assert (=> b!535098 m!514725))

(assert (=> b!535098 m!514725))

(declare-fun m!514735 () Bool)

(assert (=> b!535098 m!514735))

(declare-fun m!514737 () Bool)

(assert (=> b!535100 m!514737))

(assert (=> b!535090 m!514725))

(assert (=> b!535090 m!514725))

(declare-fun m!514739 () Bool)

(assert (=> b!535090 m!514739))

(declare-fun m!514741 () Bool)

(assert (=> b!535094 m!514741))

(declare-fun m!514743 () Bool)

(assert (=> b!535093 m!514743))

(check-sat (not b!535092) (not b!535093) (not b!535091) (not b!535100) (not b!535096) (not start!48692) (not b!535098) (not b!535090) (not b!535094))
(check-sat)
