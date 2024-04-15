; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49272 () Bool)

(assert start!49272)

(declare-fun b!542339 () Bool)

(declare-fun res!337033 () Bool)

(declare-fun e!313851 () Bool)

(assert (=> b!542339 (=> (not res!337033) (not e!313851))))

(declare-datatypes ((array!34290 0))(
  ( (array!34291 (arr!16478 (Array (_ BitVec 32) (_ BitVec 64))) (size!16843 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34290)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34290 (_ BitVec 32)) Bool)

(assert (=> b!542339 (= res!337033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542340 () Bool)

(declare-fun e!313849 () Bool)

(assert (=> b!542340 (= e!313849 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!247730 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542340 (= lt!247730 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542341 () Bool)

(declare-fun res!337032 () Bool)

(declare-fun e!313850 () Bool)

(assert (=> b!542341 (=> (not res!337032) (not e!313850))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542341 (= res!337032 (validKeyInArray!0 k0!1998))))

(declare-fun b!542342 () Bool)

(declare-fun res!337037 () Bool)

(assert (=> b!542342 (=> (not res!337037) (not e!313850))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542342 (= res!337037 (and (= (size!16843 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16843 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16843 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542343 () Bool)

(assert (=> b!542343 (= e!313850 e!313851)))

(declare-fun res!337040 () Bool)

(assert (=> b!542343 (=> (not res!337040) (not e!313851))))

(declare-datatypes ((SeekEntryResult!4933 0))(
  ( (MissingZero!4933 (index!21956 (_ BitVec 32))) (Found!4933 (index!21957 (_ BitVec 32))) (Intermediate!4933 (undefined!5745 Bool) (index!21958 (_ BitVec 32)) (x!50879 (_ BitVec 32))) (Undefined!4933) (MissingVacant!4933 (index!21959 (_ BitVec 32))) )
))
(declare-fun lt!247731 () SeekEntryResult!4933)

(assert (=> b!542343 (= res!337040 (or (= lt!247731 (MissingZero!4933 i!1153)) (= lt!247731 (MissingVacant!4933 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34290 (_ BitVec 32)) SeekEntryResult!4933)

(assert (=> b!542343 (= lt!247731 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542344 () Bool)

(declare-fun res!337036 () Bool)

(assert (=> b!542344 (=> (not res!337036) (not e!313849))))

(declare-fun lt!247732 () SeekEntryResult!4933)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34290 (_ BitVec 32)) SeekEntryResult!4933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542344 (= res!337036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16478 a!3154) j!147) mask!3216) (select (arr!16478 a!3154) j!147) a!3154 mask!3216) lt!247732))))

(declare-fun res!337035 () Bool)

(assert (=> start!49272 (=> (not res!337035) (not e!313850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49272 (= res!337035 (validMask!0 mask!3216))))

(assert (=> start!49272 e!313850))

(assert (=> start!49272 true))

(declare-fun array_inv!12361 (array!34290) Bool)

(assert (=> start!49272 (array_inv!12361 a!3154)))

(declare-fun b!542345 () Bool)

(declare-fun res!337041 () Bool)

(assert (=> b!542345 (=> (not res!337041) (not e!313851))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542345 (= res!337041 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16843 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16843 a!3154)) (= (select (arr!16478 a!3154) resIndex!32) (select (arr!16478 a!3154) j!147))))))

(declare-fun b!542346 () Bool)

(assert (=> b!542346 (= e!313851 e!313849)))

(declare-fun res!337034 () Bool)

(assert (=> b!542346 (=> (not res!337034) (not e!313849))))

(assert (=> b!542346 (= res!337034 (= lt!247732 (Intermediate!4933 false resIndex!32 resX!32)))))

(assert (=> b!542346 (= lt!247732 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16478 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542347 () Bool)

(declare-fun res!337042 () Bool)

(assert (=> b!542347 (=> (not res!337042) (not e!313851))))

(declare-datatypes ((List!10636 0))(
  ( (Nil!10633) (Cons!10632 (h!11587 (_ BitVec 64)) (t!16855 List!10636)) )
))
(declare-fun arrayNoDuplicates!0 (array!34290 (_ BitVec 32) List!10636) Bool)

(assert (=> b!542347 (= res!337042 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10633))))

(declare-fun b!542348 () Bool)

(declare-fun res!337043 () Bool)

(assert (=> b!542348 (=> (not res!337043) (not e!313850))))

(assert (=> b!542348 (= res!337043 (validKeyInArray!0 (select (arr!16478 a!3154) j!147)))))

(declare-fun b!542349 () Bool)

(declare-fun res!337038 () Bool)

(assert (=> b!542349 (=> (not res!337038) (not e!313849))))

(assert (=> b!542349 (= res!337038 (and (not (= (select (arr!16478 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16478 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16478 a!3154) index!1177) (select (arr!16478 a!3154) j!147)))))))

(declare-fun b!542350 () Bool)

(declare-fun res!337039 () Bool)

(assert (=> b!542350 (=> (not res!337039) (not e!313850))))

(declare-fun arrayContainsKey!0 (array!34290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542350 (= res!337039 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49272 res!337035) b!542342))

(assert (= (and b!542342 res!337037) b!542348))

(assert (= (and b!542348 res!337043) b!542341))

(assert (= (and b!542341 res!337032) b!542350))

(assert (= (and b!542350 res!337039) b!542343))

(assert (= (and b!542343 res!337040) b!542339))

(assert (= (and b!542339 res!337033) b!542347))

(assert (= (and b!542347 res!337042) b!542345))

(assert (= (and b!542345 res!337041) b!542346))

(assert (= (and b!542346 res!337034) b!542344))

(assert (= (and b!542344 res!337036) b!542349))

(assert (= (and b!542349 res!337038) b!542340))

(declare-fun m!520087 () Bool)

(assert (=> b!542343 m!520087))

(declare-fun m!520089 () Bool)

(assert (=> start!49272 m!520089))

(declare-fun m!520091 () Bool)

(assert (=> start!49272 m!520091))

(declare-fun m!520093 () Bool)

(assert (=> b!542346 m!520093))

(assert (=> b!542346 m!520093))

(declare-fun m!520095 () Bool)

(assert (=> b!542346 m!520095))

(assert (=> b!542348 m!520093))

(assert (=> b!542348 m!520093))

(declare-fun m!520097 () Bool)

(assert (=> b!542348 m!520097))

(declare-fun m!520099 () Bool)

(assert (=> b!542340 m!520099))

(declare-fun m!520101 () Bool)

(assert (=> b!542350 m!520101))

(assert (=> b!542344 m!520093))

(assert (=> b!542344 m!520093))

(declare-fun m!520103 () Bool)

(assert (=> b!542344 m!520103))

(assert (=> b!542344 m!520103))

(assert (=> b!542344 m!520093))

(declare-fun m!520105 () Bool)

(assert (=> b!542344 m!520105))

(declare-fun m!520107 () Bool)

(assert (=> b!542339 m!520107))

(declare-fun m!520109 () Bool)

(assert (=> b!542345 m!520109))

(assert (=> b!542345 m!520093))

(declare-fun m!520111 () Bool)

(assert (=> b!542347 m!520111))

(declare-fun m!520113 () Bool)

(assert (=> b!542349 m!520113))

(assert (=> b!542349 m!520093))

(declare-fun m!520115 () Bool)

(assert (=> b!542341 m!520115))

(check-sat (not b!542341) (not b!542343) (not b!542339) (not b!542348) (not b!542340) (not b!542347) (not start!49272) (not b!542350) (not b!542346) (not b!542344))
(check-sat)
