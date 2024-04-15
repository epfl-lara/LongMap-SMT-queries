; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48864 () Bool)

(assert start!48864)

(declare-fun b!538291 () Bool)

(declare-fun res!333649 () Bool)

(declare-fun e!312118 () Bool)

(assert (=> b!538291 (=> (not res!333649) (not e!312118))))

(declare-datatypes ((array!34086 0))(
  ( (array!34087 (arr!16382 (Array (_ BitVec 32) (_ BitVec 64))) (size!16747 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34086)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538291 (= res!333649 (validKeyInArray!0 (select (arr!16382 a!3154) j!147)))))

(declare-fun b!538292 () Bool)

(declare-fun res!333640 () Bool)

(assert (=> b!538292 (=> (not res!333640) (not e!312118))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!538292 (= res!333640 (validKeyInArray!0 k0!1998))))

(declare-fun b!538293 () Bool)

(declare-fun e!312116 () Bool)

(assert (=> b!538293 (= e!312118 e!312116)))

(declare-fun res!333645 () Bool)

(assert (=> b!538293 (=> (not res!333645) (not e!312116))))

(declare-datatypes ((SeekEntryResult!4837 0))(
  ( (MissingZero!4837 (index!21572 (_ BitVec 32))) (Found!4837 (index!21573 (_ BitVec 32))) (Intermediate!4837 (undefined!5649 Bool) (index!21574 (_ BitVec 32)) (x!50503 (_ BitVec 32))) (Undefined!4837) (MissingVacant!4837 (index!21575 (_ BitVec 32))) )
))
(declare-fun lt!246602 () SeekEntryResult!4837)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538293 (= res!333645 (or (= lt!246602 (MissingZero!4837 i!1153)) (= lt!246602 (MissingVacant!4837 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34086 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!538293 (= lt!246602 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538294 () Bool)

(declare-fun res!333644 () Bool)

(assert (=> b!538294 (=> (not res!333644) (not e!312118))))

(declare-fun arrayContainsKey!0 (array!34086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538294 (= res!333644 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538295 () Bool)

(declare-fun e!312117 () Bool)

(declare-fun e!312120 () Bool)

(assert (=> b!538295 (= e!312117 e!312120)))

(declare-fun res!333650 () Bool)

(assert (=> b!538295 (=> (not res!333650) (not e!312120))))

(declare-fun lt!246605 () SeekEntryResult!4837)

(declare-fun lt!246601 () SeekEntryResult!4837)

(declare-fun lt!246607 () SeekEntryResult!4837)

(assert (=> b!538295 (= res!333650 (and (= lt!246601 lt!246607) (= lt!246605 lt!246601)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246603 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34086 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!538295 (= lt!246601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246603 (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538296 () Bool)

(declare-fun e!312119 () Bool)

(assert (=> b!538296 (= e!312116 e!312119)))

(declare-fun res!333642 () Bool)

(assert (=> b!538296 (=> (not res!333642) (not e!312119))))

(declare-fun lt!246606 () SeekEntryResult!4837)

(assert (=> b!538296 (= res!333642 (= lt!246606 lt!246607))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538296 (= lt!246607 (Intermediate!4837 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538296 (= lt!246606 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538297 () Bool)

(declare-fun res!333643 () Bool)

(assert (=> b!538297 (=> (not res!333643) (not e!312116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34086 (_ BitVec 32)) Bool)

(assert (=> b!538297 (= res!333643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!333638 () Bool)

(assert (=> start!48864 (=> (not res!333638) (not e!312118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48864 (= res!333638 (validMask!0 mask!3216))))

(assert (=> start!48864 e!312118))

(assert (=> start!48864 true))

(declare-fun array_inv!12265 (array!34086) Bool)

(assert (=> start!48864 (array_inv!12265 a!3154)))

(declare-fun b!538298 () Bool)

(declare-fun res!333639 () Bool)

(assert (=> b!538298 (=> (not res!333639) (not e!312116))))

(assert (=> b!538298 (= res!333639 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16747 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16747 a!3154)) (= (select (arr!16382 a!3154) resIndex!32) (select (arr!16382 a!3154) j!147))))))

(declare-fun b!538299 () Bool)

(declare-fun res!333647 () Bool)

(assert (=> b!538299 (=> (not res!333647) (not e!312118))))

(assert (=> b!538299 (= res!333647 (and (= (size!16747 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16747 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16747 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538300 () Bool)

(declare-fun res!333641 () Bool)

(assert (=> b!538300 (=> (not res!333641) (not e!312116))))

(declare-datatypes ((List!10540 0))(
  ( (Nil!10537) (Cons!10536 (h!11479 (_ BitVec 64)) (t!16759 List!10540)) )
))
(declare-fun arrayNoDuplicates!0 (array!34086 (_ BitVec 32) List!10540) Bool)

(assert (=> b!538300 (= res!333641 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10537))))

(declare-fun b!538301 () Bool)

(assert (=> b!538301 (= e!312120 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(assert (=> b!538301 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246603 (select (store (arr!16382 a!3154) i!1153 k0!1998) j!147) (array!34087 (store (arr!16382 a!3154) i!1153 k0!1998) (size!16747 a!3154)) mask!3216) lt!246607)))

(declare-datatypes ((Unit!16846 0))(
  ( (Unit!16847) )
))
(declare-fun lt!246604 () Unit!16846)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16846)

(assert (=> b!538301 (= lt!246604 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246603 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538302 () Bool)

(declare-fun e!312114 () Bool)

(assert (=> b!538302 (= e!312114 e!312117)))

(declare-fun res!333648 () Bool)

(assert (=> b!538302 (=> (not res!333648) (not e!312117))))

(assert (=> b!538302 (= res!333648 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246603 #b00000000000000000000000000000000) (bvslt lt!246603 (size!16747 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538302 (= lt!246603 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538303 () Bool)

(assert (=> b!538303 (= e!312119 e!312114)))

(declare-fun res!333646 () Bool)

(assert (=> b!538303 (=> (not res!333646) (not e!312114))))

(assert (=> b!538303 (= res!333646 (and (= lt!246605 lt!246606) (not (= (select (arr!16382 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16382 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16382 a!3154) index!1177) (select (arr!16382 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538303 (= lt!246605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16382 a!3154) j!147) mask!3216) (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48864 res!333638) b!538299))

(assert (= (and b!538299 res!333647) b!538291))

(assert (= (and b!538291 res!333649) b!538292))

(assert (= (and b!538292 res!333640) b!538294))

(assert (= (and b!538294 res!333644) b!538293))

(assert (= (and b!538293 res!333645) b!538297))

(assert (= (and b!538297 res!333643) b!538300))

(assert (= (and b!538300 res!333641) b!538298))

(assert (= (and b!538298 res!333639) b!538296))

(assert (= (and b!538296 res!333642) b!538303))

(assert (= (and b!538303 res!333646) b!538302))

(assert (= (and b!538302 res!333648) b!538295))

(assert (= (and b!538295 res!333650) b!538301))

(declare-fun m!516913 () Bool)

(assert (=> b!538296 m!516913))

(assert (=> b!538296 m!516913))

(declare-fun m!516915 () Bool)

(assert (=> b!538296 m!516915))

(declare-fun m!516917 () Bool)

(assert (=> b!538293 m!516917))

(declare-fun m!516919 () Bool)

(assert (=> b!538303 m!516919))

(assert (=> b!538303 m!516913))

(assert (=> b!538303 m!516913))

(declare-fun m!516921 () Bool)

(assert (=> b!538303 m!516921))

(assert (=> b!538303 m!516921))

(assert (=> b!538303 m!516913))

(declare-fun m!516923 () Bool)

(assert (=> b!538303 m!516923))

(assert (=> b!538295 m!516913))

(assert (=> b!538295 m!516913))

(declare-fun m!516925 () Bool)

(assert (=> b!538295 m!516925))

(declare-fun m!516927 () Bool)

(assert (=> b!538292 m!516927))

(declare-fun m!516929 () Bool)

(assert (=> b!538300 m!516929))

(assert (=> b!538291 m!516913))

(assert (=> b!538291 m!516913))

(declare-fun m!516931 () Bool)

(assert (=> b!538291 m!516931))

(declare-fun m!516933 () Bool)

(assert (=> b!538297 m!516933))

(declare-fun m!516935 () Bool)

(assert (=> b!538298 m!516935))

(assert (=> b!538298 m!516913))

(declare-fun m!516937 () Bool)

(assert (=> b!538301 m!516937))

(declare-fun m!516939 () Bool)

(assert (=> b!538301 m!516939))

(assert (=> b!538301 m!516939))

(declare-fun m!516941 () Bool)

(assert (=> b!538301 m!516941))

(declare-fun m!516943 () Bool)

(assert (=> b!538301 m!516943))

(declare-fun m!516945 () Bool)

(assert (=> start!48864 m!516945))

(declare-fun m!516947 () Bool)

(assert (=> start!48864 m!516947))

(declare-fun m!516949 () Bool)

(assert (=> b!538302 m!516949))

(declare-fun m!516951 () Bool)

(assert (=> b!538294 m!516951))

(check-sat (not b!538300) (not b!538301) (not b!538291) (not b!538296) (not b!538294) (not b!538303) (not b!538297) (not b!538293) (not b!538292) (not b!538295) (not b!538302) (not start!48864))
(check-sat)
