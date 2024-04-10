; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48748 () Bool)

(assert start!48748)

(declare-fun b!536066 () Bool)

(declare-fun e!311270 () Bool)

(declare-fun e!311273 () Bool)

(assert (=> b!536066 (= e!311270 e!311273)))

(declare-fun res!331272 () Bool)

(assert (=> b!536066 (=> (not res!331272) (not e!311273))))

(declare-fun lt!245981 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!33960 0))(
  ( (array!33961 (arr!16319 (Array (_ BitVec 32) (_ BitVec 64))) (size!16683 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33960)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536066 (= res!331272 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245981 #b00000000000000000000000000000000) (bvslt lt!245981 (size!16683 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536066 (= lt!245981 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536067 () Bool)

(declare-fun res!331273 () Bool)

(assert (=> b!536067 (=> (not res!331273) (not e!311270))))

(declare-datatypes ((SeekEntryResult!4777 0))(
  ( (MissingZero!4777 (index!21332 (_ BitVec 32))) (Found!4777 (index!21333 (_ BitVec 32))) (Intermediate!4777 (undefined!5589 Bool) (index!21334 (_ BitVec 32)) (x!50272 (_ BitVec 32))) (Undefined!4777) (MissingVacant!4777 (index!21335 (_ BitVec 32))) )
))
(declare-fun lt!245982 () SeekEntryResult!4777)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33960 (_ BitVec 32)) SeekEntryResult!4777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536067 (= res!331273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16319 a!3154) j!147) mask!3216) (select (arr!16319 a!3154) j!147) a!3154 mask!3216) lt!245982))))

(declare-fun b!536068 () Bool)

(declare-fun e!311274 () Bool)

(assert (=> b!536068 (= e!311274 e!311270)))

(declare-fun res!331275 () Bool)

(assert (=> b!536068 (=> (not res!331275) (not e!311270))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536068 (= res!331275 (= lt!245982 (Intermediate!4777 false resIndex!32 resX!32)))))

(assert (=> b!536068 (= lt!245982 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16319 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536069 () Bool)

(declare-fun res!331277 () Bool)

(declare-fun e!311271 () Bool)

(assert (=> b!536069 (=> (not res!331277) (not e!311271))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536069 (= res!331277 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536070 () Bool)

(declare-fun res!331274 () Bool)

(assert (=> b!536070 (=> (not res!331274) (not e!311270))))

(assert (=> b!536070 (= res!331274 (and (not (= (select (arr!16319 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16319 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16319 a!3154) index!1177) (select (arr!16319 a!3154) j!147)))))))

(declare-fun b!536071 () Bool)

(declare-fun res!331283 () Bool)

(assert (=> b!536071 (=> (not res!331283) (not e!311271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536071 (= res!331283 (validKeyInArray!0 (select (arr!16319 a!3154) j!147)))))

(declare-fun b!536072 () Bool)

(declare-fun res!331276 () Bool)

(assert (=> b!536072 (=> (not res!331276) (not e!311274))))

(assert (=> b!536072 (= res!331276 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16683 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16683 a!3154)) (= (select (arr!16319 a!3154) resIndex!32) (select (arr!16319 a!3154) j!147))))))

(declare-fun b!536073 () Bool)

(declare-fun res!331282 () Bool)

(assert (=> b!536073 (=> (not res!331282) (not e!311271))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536073 (= res!331282 (and (= (size!16683 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16683 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16683 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536074 () Bool)

(assert (=> b!536074 (= e!311273 false)))

(declare-fun lt!245980 () SeekEntryResult!4777)

(assert (=> b!536074 (= lt!245980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245981 (select (arr!16319 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331271 () Bool)

(assert (=> start!48748 (=> (not res!331271) (not e!311271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48748 (= res!331271 (validMask!0 mask!3216))))

(assert (=> start!48748 e!311271))

(assert (=> start!48748 true))

(declare-fun array_inv!12115 (array!33960) Bool)

(assert (=> start!48748 (array_inv!12115 a!3154)))

(declare-fun b!536075 () Bool)

(declare-fun res!331279 () Bool)

(assert (=> b!536075 (=> (not res!331279) (not e!311274))))

(declare-datatypes ((List!10438 0))(
  ( (Nil!10435) (Cons!10434 (h!11377 (_ BitVec 64)) (t!16666 List!10438)) )
))
(declare-fun arrayNoDuplicates!0 (array!33960 (_ BitVec 32) List!10438) Bool)

(assert (=> b!536075 (= res!331279 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10435))))

(declare-fun b!536076 () Bool)

(declare-fun res!331281 () Bool)

(assert (=> b!536076 (=> (not res!331281) (not e!311271))))

(assert (=> b!536076 (= res!331281 (validKeyInArray!0 k!1998))))

(declare-fun b!536077 () Bool)

(assert (=> b!536077 (= e!311271 e!311274)))

(declare-fun res!331278 () Bool)

(assert (=> b!536077 (=> (not res!331278) (not e!311274))))

(declare-fun lt!245983 () SeekEntryResult!4777)

(assert (=> b!536077 (= res!331278 (or (= lt!245983 (MissingZero!4777 i!1153)) (= lt!245983 (MissingVacant!4777 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33960 (_ BitVec 32)) SeekEntryResult!4777)

(assert (=> b!536077 (= lt!245983 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536078 () Bool)

(declare-fun res!331280 () Bool)

(assert (=> b!536078 (=> (not res!331280) (not e!311274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33960 (_ BitVec 32)) Bool)

(assert (=> b!536078 (= res!331280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48748 res!331271) b!536073))

(assert (= (and b!536073 res!331282) b!536071))

(assert (= (and b!536071 res!331283) b!536076))

(assert (= (and b!536076 res!331281) b!536069))

(assert (= (and b!536069 res!331277) b!536077))

(assert (= (and b!536077 res!331278) b!536078))

(assert (= (and b!536078 res!331280) b!536075))

(assert (= (and b!536075 res!331279) b!536072))

(assert (= (and b!536072 res!331276) b!536068))

(assert (= (and b!536068 res!331275) b!536067))

(assert (= (and b!536067 res!331273) b!536070))

(assert (= (and b!536070 res!331274) b!536066))

(assert (= (and b!536066 res!331272) b!536074))

(declare-fun m!515545 () Bool)

(assert (=> b!536072 m!515545))

(declare-fun m!515547 () Bool)

(assert (=> b!536072 m!515547))

(declare-fun m!515549 () Bool)

(assert (=> b!536077 m!515549))

(declare-fun m!515551 () Bool)

(assert (=> b!536078 m!515551))

(declare-fun m!515553 () Bool)

(assert (=> start!48748 m!515553))

(declare-fun m!515555 () Bool)

(assert (=> start!48748 m!515555))

(declare-fun m!515557 () Bool)

(assert (=> b!536070 m!515557))

(assert (=> b!536070 m!515547))

(declare-fun m!515559 () Bool)

(assert (=> b!536076 m!515559))

(declare-fun m!515561 () Bool)

(assert (=> b!536066 m!515561))

(assert (=> b!536067 m!515547))

(assert (=> b!536067 m!515547))

(declare-fun m!515563 () Bool)

(assert (=> b!536067 m!515563))

(assert (=> b!536067 m!515563))

(assert (=> b!536067 m!515547))

(declare-fun m!515565 () Bool)

(assert (=> b!536067 m!515565))

(declare-fun m!515567 () Bool)

(assert (=> b!536069 m!515567))

(assert (=> b!536068 m!515547))

(assert (=> b!536068 m!515547))

(declare-fun m!515569 () Bool)

(assert (=> b!536068 m!515569))

(declare-fun m!515571 () Bool)

(assert (=> b!536075 m!515571))

(assert (=> b!536074 m!515547))

(assert (=> b!536074 m!515547))

(declare-fun m!515573 () Bool)

(assert (=> b!536074 m!515573))

(assert (=> b!536071 m!515547))

(assert (=> b!536071 m!515547))

(declare-fun m!515575 () Bool)

(assert (=> b!536071 m!515575))

(push 1)

(assert (not b!536074))

(assert (not b!536066))

(assert (not b!536068))

(assert (not b!536069))

(assert (not start!48748))

(assert (not b!536076))

(assert (not b!536077))

