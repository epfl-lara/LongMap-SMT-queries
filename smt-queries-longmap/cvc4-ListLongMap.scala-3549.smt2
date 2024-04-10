; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48868 () Bool)

(assert start!48868)

(declare-fun b!538406 () Bool)

(declare-fun res!333615 () Bool)

(declare-fun e!312210 () Bool)

(assert (=> b!538406 (=> (not res!333615) (not e!312210))))

(declare-datatypes ((array!34080 0))(
  ( (array!34081 (arr!16379 (Array (_ BitVec 32) (_ BitVec 64))) (size!16743 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34080)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538406 (= res!333615 (and (= (size!16743 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16743 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16743 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538407 () Bool)

(declare-fun e!312204 () Bool)

(declare-fun e!312209 () Bool)

(assert (=> b!538407 (= e!312204 e!312209)))

(declare-fun res!333614 () Bool)

(assert (=> b!538407 (=> (not res!333614) (not e!312209))))

(declare-datatypes ((SeekEntryResult!4837 0))(
  ( (MissingZero!4837 (index!21572 (_ BitVec 32))) (Found!4837 (index!21573 (_ BitVec 32))) (Intermediate!4837 (undefined!5649 Bool) (index!21574 (_ BitVec 32)) (x!50492 (_ BitVec 32))) (Undefined!4837) (MissingVacant!4837 (index!21575 (_ BitVec 32))) )
))
(declare-fun lt!246751 () SeekEntryResult!4837)

(declare-fun lt!246753 () SeekEntryResult!4837)

(assert (=> b!538407 (= res!333614 (= lt!246751 lt!246753))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538407 (= lt!246753 (Intermediate!4837 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34080 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!538407 (= lt!246751 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333620 () Bool)

(assert (=> start!48868 (=> (not res!333620) (not e!312210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48868 (= res!333620 (validMask!0 mask!3216))))

(assert (=> start!48868 e!312210))

(assert (=> start!48868 true))

(declare-fun array_inv!12175 (array!34080) Bool)

(assert (=> start!48868 (array_inv!12175 a!3154)))

(declare-fun b!538408 () Bool)

(declare-fun e!312206 () Bool)

(assert (=> b!538408 (= e!312209 e!312206)))

(declare-fun res!333618 () Bool)

(assert (=> b!538408 (=> (not res!333618) (not e!312206))))

(declare-fun lt!246757 () SeekEntryResult!4837)

(assert (=> b!538408 (= res!333618 (and (= lt!246757 lt!246751) (not (= (select (arr!16379 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16379 a!3154) index!1177) (select (arr!16379 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538408 (= lt!246757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16379 a!3154) j!147) mask!3216) (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538409 () Bool)

(declare-fun e!312208 () Bool)

(assert (=> b!538409 (= e!312206 e!312208)))

(declare-fun res!333623 () Bool)

(assert (=> b!538409 (=> (not res!333623) (not e!312208))))

(declare-fun lt!246754 () (_ BitVec 32))

(assert (=> b!538409 (= res!333623 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246754 #b00000000000000000000000000000000) (bvslt lt!246754 (size!16743 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538409 (= lt!246754 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538410 () Bool)

(assert (=> b!538410 (= e!312210 e!312204)))

(declare-fun res!333619 () Bool)

(assert (=> b!538410 (=> (not res!333619) (not e!312204))))

(declare-fun lt!246752 () SeekEntryResult!4837)

(assert (=> b!538410 (= res!333619 (or (= lt!246752 (MissingZero!4837 i!1153)) (= lt!246752 (MissingVacant!4837 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34080 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!538410 (= lt!246752 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538411 () Bool)

(declare-fun res!333621 () Bool)

(assert (=> b!538411 (=> (not res!333621) (not e!312210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538411 (= res!333621 (validKeyInArray!0 k!1998))))

(declare-fun b!538412 () Bool)

(declare-fun res!333613 () Bool)

(assert (=> b!538412 (=> (not res!333613) (not e!312210))))

(declare-fun arrayContainsKey!0 (array!34080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538412 (= res!333613 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538413 () Bool)

(declare-fun e!312205 () Bool)

(assert (=> b!538413 (= e!312208 e!312205)))

(declare-fun res!333617 () Bool)

(assert (=> b!538413 (=> (not res!333617) (not e!312205))))

(declare-fun lt!246755 () SeekEntryResult!4837)

(assert (=> b!538413 (= res!333617 (and (= lt!246755 lt!246753) (= lt!246757 lt!246755)))))

(assert (=> b!538413 (= lt!246755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246754 (select (arr!16379 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538414 () Bool)

(declare-fun res!333612 () Bool)

(assert (=> b!538414 (=> (not res!333612) (not e!312204))))

(declare-datatypes ((List!10498 0))(
  ( (Nil!10495) (Cons!10494 (h!11437 (_ BitVec 64)) (t!16726 List!10498)) )
))
(declare-fun arrayNoDuplicates!0 (array!34080 (_ BitVec 32) List!10498) Bool)

(assert (=> b!538414 (= res!333612 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10495))))

(declare-fun b!538415 () Bool)

(declare-fun res!333616 () Bool)

(assert (=> b!538415 (=> (not res!333616) (not e!312204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34080 (_ BitVec 32)) Bool)

(assert (=> b!538415 (= res!333616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538416 () Bool)

(declare-fun res!333611 () Bool)

(assert (=> b!538416 (=> (not res!333611) (not e!312210))))

(assert (=> b!538416 (= res!333611 (validKeyInArray!0 (select (arr!16379 a!3154) j!147)))))

(declare-fun b!538417 () Bool)

(declare-fun res!333622 () Bool)

(assert (=> b!538417 (=> (not res!333622) (not e!312204))))

(assert (=> b!538417 (= res!333622 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16743 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16743 a!3154)) (= (select (arr!16379 a!3154) resIndex!32) (select (arr!16379 a!3154) j!147))))))

(declare-fun b!538418 () Bool)

(assert (=> b!538418 (= e!312205 (not (bvsge mask!3216 #b00000000000000000000000000000000)))))

(assert (=> b!538418 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246754 (select (store (arr!16379 a!3154) i!1153 k!1998) j!147) (array!34081 (store (arr!16379 a!3154) i!1153 k!1998) (size!16743 a!3154)) mask!3216) lt!246753)))

(declare-datatypes ((Unit!16858 0))(
  ( (Unit!16859) )
))
(declare-fun lt!246756 () Unit!16858)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16858)

(assert (=> b!538418 (= lt!246756 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246754 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (= (and start!48868 res!333620) b!538406))

(assert (= (and b!538406 res!333615) b!538416))

(assert (= (and b!538416 res!333611) b!538411))

(assert (= (and b!538411 res!333621) b!538412))

(assert (= (and b!538412 res!333613) b!538410))

(assert (= (and b!538410 res!333619) b!538415))

(assert (= (and b!538415 res!333616) b!538414))

(assert (= (and b!538414 res!333612) b!538417))

(assert (= (and b!538417 res!333622) b!538407))

(assert (= (and b!538407 res!333614) b!538408))

(assert (= (and b!538408 res!333618) b!538409))

(assert (= (and b!538409 res!333623) b!538413))

(assert (= (and b!538413 res!333617) b!538418))

(declare-fun m!517505 () Bool)

(assert (=> b!538417 m!517505))

(declare-fun m!517507 () Bool)

(assert (=> b!538417 m!517507))

(assert (=> b!538416 m!517507))

(assert (=> b!538416 m!517507))

(declare-fun m!517509 () Bool)

(assert (=> b!538416 m!517509))

(assert (=> b!538407 m!517507))

(assert (=> b!538407 m!517507))

(declare-fun m!517511 () Bool)

(assert (=> b!538407 m!517511))

(declare-fun m!517513 () Bool)

(assert (=> b!538410 m!517513))

(declare-fun m!517515 () Bool)

(assert (=> start!48868 m!517515))

(declare-fun m!517517 () Bool)

(assert (=> start!48868 m!517517))

(declare-fun m!517519 () Bool)

(assert (=> b!538411 m!517519))

(declare-fun m!517521 () Bool)

(assert (=> b!538409 m!517521))

(declare-fun m!517523 () Bool)

(assert (=> b!538414 m!517523))

(assert (=> b!538413 m!517507))

(assert (=> b!538413 m!517507))

(declare-fun m!517525 () Bool)

(assert (=> b!538413 m!517525))

(declare-fun m!517527 () Bool)

(assert (=> b!538412 m!517527))

(declare-fun m!517529 () Bool)

(assert (=> b!538415 m!517529))

(declare-fun m!517531 () Bool)

(assert (=> b!538408 m!517531))

(assert (=> b!538408 m!517507))

(assert (=> b!538408 m!517507))

(declare-fun m!517533 () Bool)

(assert (=> b!538408 m!517533))

(assert (=> b!538408 m!517533))

(assert (=> b!538408 m!517507))

(declare-fun m!517535 () Bool)

(assert (=> b!538408 m!517535))

(declare-fun m!517537 () Bool)

(assert (=> b!538418 m!517537))

(declare-fun m!517539 () Bool)

(assert (=> b!538418 m!517539))

(assert (=> b!538418 m!517539))

(declare-fun m!517541 () Bool)

(assert (=> b!538418 m!517541))

(declare-fun m!517543 () Bool)

(assert (=> b!538418 m!517543))

(push 1)

(assert (not b!538411))

(assert (not start!48868))

(assert (not b!538415))

(assert (not b!538412))

(assert (not b!538416))

(assert (not b!538418))

