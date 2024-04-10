; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48862 () Bool)

(assert start!48862)

(declare-fun b!538289 () Bool)

(declare-fun res!333499 () Bool)

(declare-fun e!312145 () Bool)

(assert (=> b!538289 (=> (not res!333499) (not e!312145))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34074 0))(
  ( (array!34075 (arr!16376 (Array (_ BitVec 32) (_ BitVec 64))) (size!16740 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34074)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538289 (= res!333499 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16740 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16740 a!3154)) (= (select (arr!16376 a!3154) resIndex!32) (select (arr!16376 a!3154) j!147))))))

(declare-fun b!538290 () Bool)

(declare-fun res!333500 () Bool)

(declare-fun e!312142 () Bool)

(assert (=> b!538290 (=> (not res!333500) (not e!312142))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538290 (= res!333500 (validKeyInArray!0 k!1998))))

(declare-fun b!538291 () Bool)

(declare-fun res!333497 () Bool)

(assert (=> b!538291 (=> (not res!333497) (not e!312142))))

(declare-fun arrayContainsKey!0 (array!34074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538291 (= res!333497 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538292 () Bool)

(declare-fun e!312144 () Bool)

(declare-fun e!312146 () Bool)

(assert (=> b!538292 (= e!312144 e!312146)))

(declare-fun res!333506 () Bool)

(assert (=> b!538292 (=> (not res!333506) (not e!312146))))

(declare-fun lt!246692 () (_ BitVec 32))

(assert (=> b!538292 (= res!333506 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246692 #b00000000000000000000000000000000) (bvslt lt!246692 (size!16740 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538292 (= lt!246692 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538293 () Bool)

(declare-fun res!333501 () Bool)

(assert (=> b!538293 (=> (not res!333501) (not e!312145))))

(declare-datatypes ((List!10495 0))(
  ( (Nil!10492) (Cons!10491 (h!11434 (_ BitVec 64)) (t!16723 List!10495)) )
))
(declare-fun arrayNoDuplicates!0 (array!34074 (_ BitVec 32) List!10495) Bool)

(assert (=> b!538293 (= res!333501 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10492))))

(declare-fun b!538294 () Bool)

(declare-fun res!333504 () Bool)

(assert (=> b!538294 (=> (not res!333504) (not e!312145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34074 (_ BitVec 32)) Bool)

(assert (=> b!538294 (= res!333504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538295 () Bool)

(declare-fun e!312147 () Bool)

(assert (=> b!538295 (= e!312147 e!312144)))

(declare-fun res!333495 () Bool)

(assert (=> b!538295 (=> (not res!333495) (not e!312144))))

(declare-datatypes ((SeekEntryResult!4834 0))(
  ( (MissingZero!4834 (index!21560 (_ BitVec 32))) (Found!4834 (index!21561 (_ BitVec 32))) (Intermediate!4834 (undefined!5646 Bool) (index!21562 (_ BitVec 32)) (x!50481 (_ BitVec 32))) (Undefined!4834) (MissingVacant!4834 (index!21563 (_ BitVec 32))) )
))
(declare-fun lt!246691 () SeekEntryResult!4834)

(declare-fun lt!246694 () SeekEntryResult!4834)

(assert (=> b!538295 (= res!333495 (and (= lt!246691 lt!246694) (not (= (select (arr!16376 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16376 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16376 a!3154) index!1177) (select (arr!16376 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34074 (_ BitVec 32)) SeekEntryResult!4834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538295 (= lt!246691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16376 a!3154) j!147) mask!3216) (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333505 () Bool)

(assert (=> start!48862 (=> (not res!333505) (not e!312142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48862 (= res!333505 (validMask!0 mask!3216))))

(assert (=> start!48862 e!312142))

(assert (=> start!48862 true))

(declare-fun array_inv!12172 (array!34074) Bool)

(assert (=> start!48862 (array_inv!12172 a!3154)))

(declare-fun b!538296 () Bool)

(declare-fun res!333494 () Bool)

(assert (=> b!538296 (=> (not res!333494) (not e!312142))))

(assert (=> b!538296 (= res!333494 (validKeyInArray!0 (select (arr!16376 a!3154) j!147)))))

(declare-fun b!538297 () Bool)

(assert (=> b!538297 (= e!312145 e!312147)))

(declare-fun res!333496 () Bool)

(assert (=> b!538297 (=> (not res!333496) (not e!312147))))

(declare-fun lt!246693 () SeekEntryResult!4834)

(assert (=> b!538297 (= res!333496 (= lt!246694 lt!246693))))

(assert (=> b!538297 (= lt!246693 (Intermediate!4834 false resIndex!32 resX!32))))

(assert (=> b!538297 (= lt!246694 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538298 () Bool)

(assert (=> b!538298 (= e!312142 e!312145)))

(declare-fun res!333498 () Bool)

(assert (=> b!538298 (=> (not res!333498) (not e!312145))))

(declare-fun lt!246688 () SeekEntryResult!4834)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538298 (= res!333498 (or (= lt!246688 (MissingZero!4834 i!1153)) (= lt!246688 (MissingVacant!4834 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34074 (_ BitVec 32)) SeekEntryResult!4834)

(assert (=> b!538298 (= lt!246688 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538299 () Bool)

(declare-fun e!312143 () Bool)

(assert (=> b!538299 (= e!312143 (not true))))

(assert (=> b!538299 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246692 (select (store (arr!16376 a!3154) i!1153 k!1998) j!147) (array!34075 (store (arr!16376 a!3154) i!1153 k!1998) (size!16740 a!3154)) mask!3216) lt!246693)))

(declare-datatypes ((Unit!16852 0))(
  ( (Unit!16853) )
))
(declare-fun lt!246690 () Unit!16852)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16852)

(assert (=> b!538299 (= lt!246690 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246692 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538300 () Bool)

(declare-fun res!333502 () Bool)

(assert (=> b!538300 (=> (not res!333502) (not e!312142))))

(assert (=> b!538300 (= res!333502 (and (= (size!16740 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16740 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16740 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538301 () Bool)

(assert (=> b!538301 (= e!312146 e!312143)))

(declare-fun res!333503 () Bool)

(assert (=> b!538301 (=> (not res!333503) (not e!312143))))

(declare-fun lt!246689 () SeekEntryResult!4834)

(assert (=> b!538301 (= res!333503 (and (= lt!246689 lt!246693) (= lt!246691 lt!246689)))))

(assert (=> b!538301 (= lt!246689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246692 (select (arr!16376 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48862 res!333505) b!538300))

(assert (= (and b!538300 res!333502) b!538296))

(assert (= (and b!538296 res!333494) b!538290))

(assert (= (and b!538290 res!333500) b!538291))

(assert (= (and b!538291 res!333497) b!538298))

(assert (= (and b!538298 res!333498) b!538294))

(assert (= (and b!538294 res!333504) b!538293))

(assert (= (and b!538293 res!333501) b!538289))

(assert (= (and b!538289 res!333499) b!538297))

(assert (= (and b!538297 res!333496) b!538295))

(assert (= (and b!538295 res!333495) b!538292))

(assert (= (and b!538292 res!333506) b!538301))

(assert (= (and b!538301 res!333503) b!538299))

(declare-fun m!517385 () Bool)

(assert (=> b!538295 m!517385))

(declare-fun m!517387 () Bool)

(assert (=> b!538295 m!517387))

(assert (=> b!538295 m!517387))

(declare-fun m!517389 () Bool)

(assert (=> b!538295 m!517389))

(assert (=> b!538295 m!517389))

(assert (=> b!538295 m!517387))

(declare-fun m!517391 () Bool)

(assert (=> b!538295 m!517391))

(declare-fun m!517393 () Bool)

(assert (=> b!538294 m!517393))

(declare-fun m!517395 () Bool)

(assert (=> b!538292 m!517395))

(assert (=> b!538296 m!517387))

(assert (=> b!538296 m!517387))

(declare-fun m!517397 () Bool)

(assert (=> b!538296 m!517397))

(assert (=> b!538301 m!517387))

(assert (=> b!538301 m!517387))

(declare-fun m!517399 () Bool)

(assert (=> b!538301 m!517399))

(assert (=> b!538297 m!517387))

(assert (=> b!538297 m!517387))

(declare-fun m!517401 () Bool)

(assert (=> b!538297 m!517401))

(declare-fun m!517403 () Bool)

(assert (=> b!538293 m!517403))

(declare-fun m!517405 () Bool)

(assert (=> start!48862 m!517405))

(declare-fun m!517407 () Bool)

(assert (=> start!48862 m!517407))

(declare-fun m!517409 () Bool)

(assert (=> b!538298 m!517409))

(declare-fun m!517411 () Bool)

(assert (=> b!538290 m!517411))

(declare-fun m!517413 () Bool)

(assert (=> b!538299 m!517413))

(declare-fun m!517415 () Bool)

(assert (=> b!538299 m!517415))

(assert (=> b!538299 m!517415))

(declare-fun m!517417 () Bool)

(assert (=> b!538299 m!517417))

(declare-fun m!517419 () Bool)

(assert (=> b!538299 m!517419))

(declare-fun m!517421 () Bool)

(assert (=> b!538289 m!517421))

(assert (=> b!538289 m!517387))

(declare-fun m!517423 () Bool)

(assert (=> b!538291 m!517423))

(push 1)

(assert (not b!538299))

(assert (not b!538293))

