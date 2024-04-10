; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49290 () Bool)

(assert start!49290)

(declare-fun b!542718 () Bool)

(declare-fun res!337278 () Bool)

(declare-fun e!314060 () Bool)

(assert (=> b!542718 (=> (not res!337278) (not e!314060))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34298 0))(
  ( (array!34299 (arr!16482 (Array (_ BitVec 32) (_ BitVec 64))) (size!16846 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34298)

(assert (=> b!542718 (= res!337278 (and (not (= (select (arr!16482 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16482 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16482 a!3154) index!1177) (select (arr!16482 a!3154) j!147)))))))

(declare-fun b!542719 () Bool)

(declare-fun e!314058 () Bool)

(assert (=> b!542719 (= e!314058 e!314060)))

(declare-fun res!337274 () Bool)

(assert (=> b!542719 (=> (not res!337274) (not e!314060))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4940 0))(
  ( (MissingZero!4940 (index!21984 (_ BitVec 32))) (Found!4940 (index!21985 (_ BitVec 32))) (Intermediate!4940 (undefined!5752 Bool) (index!21986 (_ BitVec 32)) (x!50899 (_ BitVec 32))) (Undefined!4940) (MissingVacant!4940 (index!21987 (_ BitVec 32))) )
))
(declare-fun lt!247991 () SeekEntryResult!4940)

(assert (=> b!542719 (= res!337274 (= lt!247991 (Intermediate!4940 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34298 (_ BitVec 32)) SeekEntryResult!4940)

(assert (=> b!542719 (= lt!247991 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16482 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542720 () Bool)

(declare-fun res!337271 () Bool)

(assert (=> b!542720 (=> (not res!337271) (not e!314060))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542720 (= res!337271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16482 a!3154) j!147) mask!3216) (select (arr!16482 a!3154) j!147) a!3154 mask!3216) lt!247991))))

(declare-fun b!542721 () Bool)

(declare-fun res!337276 () Bool)

(assert (=> b!542721 (=> (not res!337276) (not e!314058))))

(assert (=> b!542721 (= res!337276 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16846 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16846 a!3154)) (= (select (arr!16482 a!3154) resIndex!32) (select (arr!16482 a!3154) j!147))))))

(declare-fun b!542722 () Bool)

(declare-fun res!337272 () Bool)

(declare-fun e!314061 () Bool)

(assert (=> b!542722 (=> (not res!337272) (not e!314061))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542722 (= res!337272 (and (= (size!16846 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16846 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16846 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542723 () Bool)

(declare-fun res!337280 () Bool)

(assert (=> b!542723 (=> (not res!337280) (not e!314058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34298 (_ BitVec 32)) Bool)

(assert (=> b!542723 (= res!337280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542724 () Bool)

(declare-fun res!337269 () Bool)

(assert (=> b!542724 (=> (not res!337269) (not e!314061))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542724 (= res!337269 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542725 () Bool)

(declare-fun res!337275 () Bool)

(assert (=> b!542725 (=> (not res!337275) (not e!314061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542725 (= res!337275 (validKeyInArray!0 (select (arr!16482 a!3154) j!147)))))

(declare-fun b!542726 () Bool)

(assert (=> b!542726 (= e!314060 false)))

(declare-fun lt!247993 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542726 (= lt!247993 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542727 () Bool)

(assert (=> b!542727 (= e!314061 e!314058)))

(declare-fun res!337277 () Bool)

(assert (=> b!542727 (=> (not res!337277) (not e!314058))))

(declare-fun lt!247992 () SeekEntryResult!4940)

(assert (=> b!542727 (= res!337277 (or (= lt!247992 (MissingZero!4940 i!1153)) (= lt!247992 (MissingVacant!4940 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34298 (_ BitVec 32)) SeekEntryResult!4940)

(assert (=> b!542727 (= lt!247992 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!337279 () Bool)

(assert (=> start!49290 (=> (not res!337279) (not e!314061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49290 (= res!337279 (validMask!0 mask!3216))))

(assert (=> start!49290 e!314061))

(assert (=> start!49290 true))

(declare-fun array_inv!12278 (array!34298) Bool)

(assert (=> start!49290 (array_inv!12278 a!3154)))

(declare-fun b!542728 () Bool)

(declare-fun res!337273 () Bool)

(assert (=> b!542728 (=> (not res!337273) (not e!314061))))

(assert (=> b!542728 (= res!337273 (validKeyInArray!0 k!1998))))

(declare-fun b!542729 () Bool)

(declare-fun res!337270 () Bool)

(assert (=> b!542729 (=> (not res!337270) (not e!314058))))

(declare-datatypes ((List!10601 0))(
  ( (Nil!10598) (Cons!10597 (h!11552 (_ BitVec 64)) (t!16829 List!10601)) )
))
(declare-fun arrayNoDuplicates!0 (array!34298 (_ BitVec 32) List!10601) Bool)

(assert (=> b!542729 (= res!337270 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10598))))

(assert (= (and start!49290 res!337279) b!542722))

(assert (= (and b!542722 res!337272) b!542725))

(assert (= (and b!542725 res!337275) b!542728))

(assert (= (and b!542728 res!337273) b!542724))

(assert (= (and b!542724 res!337269) b!542727))

(assert (= (and b!542727 res!337277) b!542723))

(assert (= (and b!542723 res!337280) b!542729))

(assert (= (and b!542729 res!337270) b!542721))

(assert (= (and b!542721 res!337276) b!542719))

(assert (= (and b!542719 res!337274) b!542720))

(assert (= (and b!542720 res!337271) b!542718))

(assert (= (and b!542718 res!337278) b!542726))

(declare-fun m!520929 () Bool)

(assert (=> b!542718 m!520929))

(declare-fun m!520931 () Bool)

(assert (=> b!542718 m!520931))

(declare-fun m!520933 () Bool)

(assert (=> b!542727 m!520933))

(declare-fun m!520935 () Bool)

(assert (=> b!542726 m!520935))

(declare-fun m!520937 () Bool)

(assert (=> b!542729 m!520937))

(assert (=> b!542719 m!520931))

(assert (=> b!542719 m!520931))

(declare-fun m!520939 () Bool)

(assert (=> b!542719 m!520939))

(assert (=> b!542725 m!520931))

(assert (=> b!542725 m!520931))

(declare-fun m!520941 () Bool)

(assert (=> b!542725 m!520941))

(declare-fun m!520943 () Bool)

(assert (=> b!542721 m!520943))

(assert (=> b!542721 m!520931))

(assert (=> b!542720 m!520931))

(assert (=> b!542720 m!520931))

(declare-fun m!520945 () Bool)

(assert (=> b!542720 m!520945))

(assert (=> b!542720 m!520945))

(assert (=> b!542720 m!520931))

(declare-fun m!520947 () Bool)

(assert (=> b!542720 m!520947))

(declare-fun m!520949 () Bool)

(assert (=> b!542728 m!520949))

(declare-fun m!520951 () Bool)

(assert (=> b!542723 m!520951))

(declare-fun m!520953 () Bool)

(assert (=> b!542724 m!520953))

(declare-fun m!520955 () Bool)

(assert (=> start!49290 m!520955))

(declare-fun m!520957 () Bool)

(assert (=> start!49290 m!520957))

(push 1)

