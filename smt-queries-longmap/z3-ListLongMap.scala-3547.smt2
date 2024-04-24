; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48898 () Bool)

(assert start!48898)

(declare-fun b!538294 () Bool)

(declare-fun res!333400 () Bool)

(declare-fun e!312180 () Bool)

(assert (=> b!538294 (=> (not res!333400) (not e!312180))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34058 0))(
  ( (array!34059 (arr!16366 (Array (_ BitVec 32) (_ BitVec 64))) (size!16730 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34058)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538294 (= res!333400 (and (= (size!16730 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16730 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16730 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538295 () Bool)

(declare-fun e!312182 () Bool)

(declare-fun e!312183 () Bool)

(assert (=> b!538295 (= e!312182 e!312183)))

(declare-fun res!333404 () Bool)

(assert (=> b!538295 (=> (not res!333404) (not e!312183))))

(declare-fun lt!246714 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538295 (= res!333404 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246714 #b00000000000000000000000000000000) (bvslt lt!246714 (size!16730 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538295 (= lt!246714 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538296 () Bool)

(declare-fun res!333398 () Bool)

(declare-fun e!312179 () Bool)

(assert (=> b!538296 (=> (not res!333398) (not e!312179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34058 (_ BitVec 32)) Bool)

(assert (=> b!538296 (= res!333398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538297 () Bool)

(declare-fun res!333399 () Bool)

(assert (=> b!538297 (=> (not res!333399) (not e!312180))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538297 (= res!333399 (validKeyInArray!0 k0!1998))))

(declare-fun res!333394 () Bool)

(assert (=> start!48898 (=> (not res!333394) (not e!312180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48898 (= res!333394 (validMask!0 mask!3216))))

(assert (=> start!48898 e!312180))

(assert (=> start!48898 true))

(declare-fun array_inv!12225 (array!34058) Bool)

(assert (=> start!48898 (array_inv!12225 a!3154)))

(declare-fun b!538298 () Bool)

(declare-fun res!333406 () Bool)

(assert (=> b!538298 (=> (not res!333406) (not e!312182))))

(declare-datatypes ((SeekEntryResult!4780 0))(
  ( (MissingZero!4780 (index!21344 (_ BitVec 32))) (Found!4780 (index!21345 (_ BitVec 32))) (Intermediate!4780 (undefined!5592 Bool) (index!21346 (_ BitVec 32)) (x!50422 (_ BitVec 32))) (Undefined!4780) (MissingVacant!4780 (index!21347 (_ BitVec 32))) )
))
(declare-fun lt!246712 () SeekEntryResult!4780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34058 (_ BitVec 32)) SeekEntryResult!4780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538298 (= res!333406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16366 a!3154) j!147) mask!3216) (select (arr!16366 a!3154) j!147) a!3154 mask!3216) lt!246712))))

(declare-fun b!538299 () Bool)

(declare-fun res!333395 () Bool)

(assert (=> b!538299 (=> (not res!333395) (not e!312180))))

(assert (=> b!538299 (= res!333395 (validKeyInArray!0 (select (arr!16366 a!3154) j!147)))))

(declare-fun b!538300 () Bool)

(declare-fun res!333402 () Bool)

(assert (=> b!538300 (=> (not res!333402) (not e!312179))))

(declare-datatypes ((List!10392 0))(
  ( (Nil!10389) (Cons!10388 (h!11334 (_ BitVec 64)) (t!16612 List!10392)) )
))
(declare-fun arrayNoDuplicates!0 (array!34058 (_ BitVec 32) List!10392) Bool)

(assert (=> b!538300 (= res!333402 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10389))))

(declare-fun b!538301 () Bool)

(assert (=> b!538301 (= e!312179 e!312182)))

(declare-fun res!333397 () Bool)

(assert (=> b!538301 (=> (not res!333397) (not e!312182))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538301 (= res!333397 (= lt!246712 (Intermediate!4780 false resIndex!32 resX!32)))))

(assert (=> b!538301 (= lt!246712 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16366 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538302 () Bool)

(assert (=> b!538302 (= e!312183 false)))

(declare-fun lt!246713 () SeekEntryResult!4780)

(assert (=> b!538302 (= lt!246713 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246714 (select (arr!16366 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538303 () Bool)

(declare-fun res!333401 () Bool)

(assert (=> b!538303 (=> (not res!333401) (not e!312179))))

(assert (=> b!538303 (= res!333401 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16730 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16730 a!3154)) (= (select (arr!16366 a!3154) resIndex!32) (select (arr!16366 a!3154) j!147))))))

(declare-fun b!538304 () Bool)

(declare-fun res!333396 () Bool)

(assert (=> b!538304 (=> (not res!333396) (not e!312182))))

(assert (=> b!538304 (= res!333396 (and (not (= (select (arr!16366 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16366 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16366 a!3154) index!1177) (select (arr!16366 a!3154) j!147)))))))

(declare-fun b!538305 () Bool)

(declare-fun res!333405 () Bool)

(assert (=> b!538305 (=> (not res!333405) (not e!312180))))

(declare-fun arrayContainsKey!0 (array!34058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538305 (= res!333405 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538306 () Bool)

(assert (=> b!538306 (= e!312180 e!312179)))

(declare-fun res!333403 () Bool)

(assert (=> b!538306 (=> (not res!333403) (not e!312179))))

(declare-fun lt!246715 () SeekEntryResult!4780)

(assert (=> b!538306 (= res!333403 (or (= lt!246715 (MissingZero!4780 i!1153)) (= lt!246715 (MissingVacant!4780 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34058 (_ BitVec 32)) SeekEntryResult!4780)

(assert (=> b!538306 (= lt!246715 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48898 res!333394) b!538294))

(assert (= (and b!538294 res!333400) b!538299))

(assert (= (and b!538299 res!333395) b!538297))

(assert (= (and b!538297 res!333399) b!538305))

(assert (= (and b!538305 res!333405) b!538306))

(assert (= (and b!538306 res!333403) b!538296))

(assert (= (and b!538296 res!333398) b!538300))

(assert (= (and b!538300 res!333402) b!538303))

(assert (= (and b!538303 res!333401) b!538301))

(assert (= (and b!538301 res!333397) b!538298))

(assert (= (and b!538298 res!333406) b!538304))

(assert (= (and b!538304 res!333396) b!538295))

(assert (= (and b!538295 res!333404) b!538302))

(declare-fun m!517531 () Bool)

(assert (=> b!538306 m!517531))

(declare-fun m!517533 () Bool)

(assert (=> b!538298 m!517533))

(assert (=> b!538298 m!517533))

(declare-fun m!517535 () Bool)

(assert (=> b!538298 m!517535))

(assert (=> b!538298 m!517535))

(assert (=> b!538298 m!517533))

(declare-fun m!517537 () Bool)

(assert (=> b!538298 m!517537))

(declare-fun m!517539 () Bool)

(assert (=> start!48898 m!517539))

(declare-fun m!517541 () Bool)

(assert (=> start!48898 m!517541))

(declare-fun m!517543 () Bool)

(assert (=> b!538297 m!517543))

(declare-fun m!517545 () Bool)

(assert (=> b!538303 m!517545))

(assert (=> b!538303 m!517533))

(assert (=> b!538301 m!517533))

(assert (=> b!538301 m!517533))

(declare-fun m!517547 () Bool)

(assert (=> b!538301 m!517547))

(declare-fun m!517549 () Bool)

(assert (=> b!538304 m!517549))

(assert (=> b!538304 m!517533))

(assert (=> b!538299 m!517533))

(assert (=> b!538299 m!517533))

(declare-fun m!517551 () Bool)

(assert (=> b!538299 m!517551))

(assert (=> b!538302 m!517533))

(assert (=> b!538302 m!517533))

(declare-fun m!517553 () Bool)

(assert (=> b!538302 m!517553))

(declare-fun m!517555 () Bool)

(assert (=> b!538305 m!517555))

(declare-fun m!517557 () Bool)

(assert (=> b!538300 m!517557))

(declare-fun m!517559 () Bool)

(assert (=> b!538295 m!517559))

(declare-fun m!517561 () Bool)

(assert (=> b!538296 m!517561))

(check-sat (not b!538298) (not b!538306) (not b!538296) (not b!538301) (not start!48898) (not b!538305) (not b!538302) (not b!538297) (not b!538300) (not b!538299) (not b!538295))
(check-sat)
