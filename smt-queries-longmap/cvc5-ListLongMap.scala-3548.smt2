; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48858 () Bool)

(assert start!48858)

(declare-fun b!538211 () Bool)

(declare-fun res!333416 () Bool)

(declare-fun e!312105 () Bool)

(assert (=> b!538211 (=> (not res!333416) (not e!312105))))

(declare-datatypes ((array!34070 0))(
  ( (array!34071 (arr!16374 (Array (_ BitVec 32) (_ BitVec 64))) (size!16738 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34070)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34070 (_ BitVec 32)) Bool)

(assert (=> b!538211 (= res!333416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538212 () Bool)

(declare-fun e!312100 () Bool)

(declare-fun e!312099 () Bool)

(assert (=> b!538212 (= e!312100 e!312099)))

(declare-fun res!333417 () Bool)

(assert (=> b!538212 (=> (not res!333417) (not e!312099))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!246650 () (_ BitVec 32))

(assert (=> b!538212 (= res!333417 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246650 #b00000000000000000000000000000000) (bvslt lt!246650 (size!16738 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538212 (= lt!246650 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538213 () Bool)

(declare-fun e!312101 () Bool)

(assert (=> b!538213 (= e!312101 (not true))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4832 0))(
  ( (MissingZero!4832 (index!21552 (_ BitVec 32))) (Found!4832 (index!21553 (_ BitVec 32))) (Intermediate!4832 (undefined!5644 Bool) (index!21554 (_ BitVec 32)) (x!50479 (_ BitVec 32))) (Undefined!4832) (MissingVacant!4832 (index!21555 (_ BitVec 32))) )
))
(declare-fun lt!246649 () SeekEntryResult!4832)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34070 (_ BitVec 32)) SeekEntryResult!4832)

(assert (=> b!538213 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246650 (select (store (arr!16374 a!3154) i!1153 k!1998) j!147) (array!34071 (store (arr!16374 a!3154) i!1153 k!1998) (size!16738 a!3154)) mask!3216) lt!246649)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16848 0))(
  ( (Unit!16849) )
))
(declare-fun lt!246648 () Unit!16848)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16848)

(assert (=> b!538213 (= lt!246648 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246650 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538214 () Bool)

(assert (=> b!538214 (= e!312099 e!312101)))

(declare-fun res!333419 () Bool)

(assert (=> b!538214 (=> (not res!333419) (not e!312101))))

(declare-fun lt!246646 () SeekEntryResult!4832)

(declare-fun lt!246651 () SeekEntryResult!4832)

(assert (=> b!538214 (= res!333419 (and (= lt!246646 lt!246649) (= lt!246651 lt!246646)))))

(assert (=> b!538214 (= lt!246646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246650 (select (arr!16374 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333428 () Bool)

(declare-fun e!312104 () Bool)

(assert (=> start!48858 (=> (not res!333428) (not e!312104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48858 (= res!333428 (validMask!0 mask!3216))))

(assert (=> start!48858 e!312104))

(assert (=> start!48858 true))

(declare-fun array_inv!12170 (array!34070) Bool)

(assert (=> start!48858 (array_inv!12170 a!3154)))

(declare-fun b!538215 () Bool)

(declare-fun e!312102 () Bool)

(assert (=> b!538215 (= e!312102 e!312100)))

(declare-fun res!333418 () Bool)

(assert (=> b!538215 (=> (not res!333418) (not e!312100))))

(declare-fun lt!246652 () SeekEntryResult!4832)

(assert (=> b!538215 (= res!333418 (and (= lt!246651 lt!246652) (not (= (select (arr!16374 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16374 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16374 a!3154) index!1177) (select (arr!16374 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538215 (= lt!246651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16374 a!3154) j!147) mask!3216) (select (arr!16374 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538216 () Bool)

(declare-fun res!333422 () Bool)

(assert (=> b!538216 (=> (not res!333422) (not e!312104))))

(assert (=> b!538216 (= res!333422 (and (= (size!16738 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16738 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16738 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538217 () Bool)

(declare-fun res!333426 () Bool)

(assert (=> b!538217 (=> (not res!333426) (not e!312105))))

(assert (=> b!538217 (= res!333426 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16738 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16738 a!3154)) (= (select (arr!16374 a!3154) resIndex!32) (select (arr!16374 a!3154) j!147))))))

(declare-fun b!538218 () Bool)

(declare-fun res!333427 () Bool)

(assert (=> b!538218 (=> (not res!333427) (not e!312104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538218 (= res!333427 (validKeyInArray!0 (select (arr!16374 a!3154) j!147)))))

(declare-fun b!538219 () Bool)

(assert (=> b!538219 (= e!312105 e!312102)))

(declare-fun res!333420 () Bool)

(assert (=> b!538219 (=> (not res!333420) (not e!312102))))

(assert (=> b!538219 (= res!333420 (= lt!246652 lt!246649))))

(assert (=> b!538219 (= lt!246649 (Intermediate!4832 false resIndex!32 resX!32))))

(assert (=> b!538219 (= lt!246652 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16374 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538220 () Bool)

(declare-fun res!333425 () Bool)

(assert (=> b!538220 (=> (not res!333425) (not e!312104))))

(declare-fun arrayContainsKey!0 (array!34070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538220 (= res!333425 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538221 () Bool)

(assert (=> b!538221 (= e!312104 e!312105)))

(declare-fun res!333424 () Bool)

(assert (=> b!538221 (=> (not res!333424) (not e!312105))))

(declare-fun lt!246647 () SeekEntryResult!4832)

(assert (=> b!538221 (= res!333424 (or (= lt!246647 (MissingZero!4832 i!1153)) (= lt!246647 (MissingVacant!4832 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34070 (_ BitVec 32)) SeekEntryResult!4832)

(assert (=> b!538221 (= lt!246647 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538222 () Bool)

(declare-fun res!333421 () Bool)

(assert (=> b!538222 (=> (not res!333421) (not e!312105))))

(declare-datatypes ((List!10493 0))(
  ( (Nil!10490) (Cons!10489 (h!11432 (_ BitVec 64)) (t!16721 List!10493)) )
))
(declare-fun arrayNoDuplicates!0 (array!34070 (_ BitVec 32) List!10493) Bool)

(assert (=> b!538222 (= res!333421 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10490))))

(declare-fun b!538223 () Bool)

(declare-fun res!333423 () Bool)

(assert (=> b!538223 (=> (not res!333423) (not e!312104))))

(assert (=> b!538223 (= res!333423 (validKeyInArray!0 k!1998))))

(assert (= (and start!48858 res!333428) b!538216))

(assert (= (and b!538216 res!333422) b!538218))

(assert (= (and b!538218 res!333427) b!538223))

(assert (= (and b!538223 res!333423) b!538220))

(assert (= (and b!538220 res!333425) b!538221))

(assert (= (and b!538221 res!333424) b!538211))

(assert (= (and b!538211 res!333416) b!538222))

(assert (= (and b!538222 res!333421) b!538217))

(assert (= (and b!538217 res!333426) b!538219))

(assert (= (and b!538219 res!333420) b!538215))

(assert (= (and b!538215 res!333418) b!538212))

(assert (= (and b!538212 res!333417) b!538214))

(assert (= (and b!538214 res!333419) b!538213))

(declare-fun m!517305 () Bool)

(assert (=> b!538220 m!517305))

(declare-fun m!517307 () Bool)

(assert (=> b!538213 m!517307))

(declare-fun m!517309 () Bool)

(assert (=> b!538213 m!517309))

(assert (=> b!538213 m!517309))

(declare-fun m!517311 () Bool)

(assert (=> b!538213 m!517311))

(declare-fun m!517313 () Bool)

(assert (=> b!538213 m!517313))

(declare-fun m!517315 () Bool)

(assert (=> b!538221 m!517315))

(declare-fun m!517317 () Bool)

(assert (=> b!538223 m!517317))

(declare-fun m!517319 () Bool)

(assert (=> b!538218 m!517319))

(assert (=> b!538218 m!517319))

(declare-fun m!517321 () Bool)

(assert (=> b!538218 m!517321))

(declare-fun m!517323 () Bool)

(assert (=> b!538222 m!517323))

(declare-fun m!517325 () Bool)

(assert (=> start!48858 m!517325))

(declare-fun m!517327 () Bool)

(assert (=> start!48858 m!517327))

(declare-fun m!517329 () Bool)

(assert (=> b!538211 m!517329))

(declare-fun m!517331 () Bool)

(assert (=> b!538217 m!517331))

(assert (=> b!538217 m!517319))

(declare-fun m!517333 () Bool)

(assert (=> b!538215 m!517333))

(assert (=> b!538215 m!517319))

(assert (=> b!538215 m!517319))

(declare-fun m!517335 () Bool)

(assert (=> b!538215 m!517335))

(assert (=> b!538215 m!517335))

(assert (=> b!538215 m!517319))

(declare-fun m!517337 () Bool)

(assert (=> b!538215 m!517337))

(assert (=> b!538219 m!517319))

(assert (=> b!538219 m!517319))

(declare-fun m!517339 () Bool)

(assert (=> b!538219 m!517339))

(declare-fun m!517341 () Bool)

(assert (=> b!538212 m!517341))

(assert (=> b!538214 m!517319))

(assert (=> b!538214 m!517319))

(declare-fun m!517343 () Bool)

(assert (=> b!538214 m!517343))

(push 1)

