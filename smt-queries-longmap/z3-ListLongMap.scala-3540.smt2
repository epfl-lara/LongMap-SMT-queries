; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48812 () Bool)

(assert start!48812)

(declare-fun b!537314 () Bool)

(declare-fun res!332519 () Bool)

(declare-fun e!311751 () Bool)

(assert (=> b!537314 (=> (not res!332519) (not e!311751))))

(declare-datatypes ((array!34024 0))(
  ( (array!34025 (arr!16351 (Array (_ BitVec 32) (_ BitVec 64))) (size!16715 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34024)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34024 (_ BitVec 32)) Bool)

(assert (=> b!537314 (= res!332519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332524 () Bool)

(declare-fun e!311753 () Bool)

(assert (=> start!48812 (=> (not res!332524) (not e!311753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48812 (= res!332524 (validMask!0 mask!3216))))

(assert (=> start!48812 e!311753))

(assert (=> start!48812 true))

(declare-fun array_inv!12147 (array!34024) Bool)

(assert (=> start!48812 (array_inv!12147 a!3154)))

(declare-fun b!537315 () Bool)

(declare-fun res!332526 () Bool)

(declare-fun e!311752 () Bool)

(assert (=> b!537315 (=> (not res!332526) (not e!311752))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537315 (= res!332526 (and (not (= (select (arr!16351 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16351 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16351 a!3154) index!1177) (select (arr!16351 a!3154) j!147)))))))

(declare-fun b!537316 () Bool)

(assert (=> b!537316 (= e!311751 e!311752)))

(declare-fun res!332522 () Bool)

(assert (=> b!537316 (=> (not res!332522) (not e!311752))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4809 0))(
  ( (MissingZero!4809 (index!21460 (_ BitVec 32))) (Found!4809 (index!21461 (_ BitVec 32))) (Intermediate!4809 (undefined!5621 Bool) (index!21462 (_ BitVec 32)) (x!50392 (_ BitVec 32))) (Undefined!4809) (MissingVacant!4809 (index!21463 (_ BitVec 32))) )
))
(declare-fun lt!246366 () SeekEntryResult!4809)

(assert (=> b!537316 (= res!332522 (= lt!246366 (Intermediate!4809 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34024 (_ BitVec 32)) SeekEntryResult!4809)

(assert (=> b!537316 (= lt!246366 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16351 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537317 () Bool)

(declare-fun e!311754 () Bool)

(assert (=> b!537317 (= e!311754 false)))

(declare-fun lt!246365 () (_ BitVec 32))

(declare-fun lt!246364 () SeekEntryResult!4809)

(assert (=> b!537317 (= lt!246364 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246365 (select (arr!16351 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537318 () Bool)

(assert (=> b!537318 (= e!311752 e!311754)))

(declare-fun res!332520 () Bool)

(assert (=> b!537318 (=> (not res!332520) (not e!311754))))

(assert (=> b!537318 (= res!332520 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246365 #b00000000000000000000000000000000) (bvslt lt!246365 (size!16715 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537318 (= lt!246365 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537319 () Bool)

(declare-fun res!332528 () Bool)

(assert (=> b!537319 (=> (not res!332528) (not e!311751))))

(declare-datatypes ((List!10470 0))(
  ( (Nil!10467) (Cons!10466 (h!11409 (_ BitVec 64)) (t!16698 List!10470)) )
))
(declare-fun arrayNoDuplicates!0 (array!34024 (_ BitVec 32) List!10470) Bool)

(assert (=> b!537319 (= res!332528 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10467))))

(declare-fun b!537320 () Bool)

(declare-fun res!332529 () Bool)

(assert (=> b!537320 (=> (not res!332529) (not e!311753))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537320 (= res!332529 (validKeyInArray!0 k0!1998))))

(declare-fun b!537321 () Bool)

(assert (=> b!537321 (= e!311753 e!311751)))

(declare-fun res!332530 () Bool)

(assert (=> b!537321 (=> (not res!332530) (not e!311751))))

(declare-fun lt!246367 () SeekEntryResult!4809)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537321 (= res!332530 (or (= lt!246367 (MissingZero!4809 i!1153)) (= lt!246367 (MissingVacant!4809 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34024 (_ BitVec 32)) SeekEntryResult!4809)

(assert (=> b!537321 (= lt!246367 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537322 () Bool)

(declare-fun res!332525 () Bool)

(assert (=> b!537322 (=> (not res!332525) (not e!311753))))

(declare-fun arrayContainsKey!0 (array!34024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537322 (= res!332525 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537323 () Bool)

(declare-fun res!332521 () Bool)

(assert (=> b!537323 (=> (not res!332521) (not e!311753))))

(assert (=> b!537323 (= res!332521 (and (= (size!16715 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16715 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16715 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537324 () Bool)

(declare-fun res!332527 () Bool)

(assert (=> b!537324 (=> (not res!332527) (not e!311753))))

(assert (=> b!537324 (= res!332527 (validKeyInArray!0 (select (arr!16351 a!3154) j!147)))))

(declare-fun b!537325 () Bool)

(declare-fun res!332531 () Bool)

(assert (=> b!537325 (=> (not res!332531) (not e!311752))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537325 (= res!332531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16351 a!3154) j!147) mask!3216) (select (arr!16351 a!3154) j!147) a!3154 mask!3216) lt!246366))))

(declare-fun b!537326 () Bool)

(declare-fun res!332523 () Bool)

(assert (=> b!537326 (=> (not res!332523) (not e!311751))))

(assert (=> b!537326 (= res!332523 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16715 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16715 a!3154)) (= (select (arr!16351 a!3154) resIndex!32) (select (arr!16351 a!3154) j!147))))))

(assert (= (and start!48812 res!332524) b!537323))

(assert (= (and b!537323 res!332521) b!537324))

(assert (= (and b!537324 res!332527) b!537320))

(assert (= (and b!537320 res!332529) b!537322))

(assert (= (and b!537322 res!332525) b!537321))

(assert (= (and b!537321 res!332530) b!537314))

(assert (= (and b!537314 res!332519) b!537319))

(assert (= (and b!537319 res!332528) b!537326))

(assert (= (and b!537326 res!332523) b!537316))

(assert (= (and b!537316 res!332522) b!537325))

(assert (= (and b!537325 res!332531) b!537315))

(assert (= (and b!537315 res!332526) b!537318))

(assert (= (and b!537318 res!332520) b!537317))

(declare-fun m!516569 () Bool)

(assert (=> b!537319 m!516569))

(declare-fun m!516571 () Bool)

(assert (=> b!537318 m!516571))

(declare-fun m!516573 () Bool)

(assert (=> b!537325 m!516573))

(assert (=> b!537325 m!516573))

(declare-fun m!516575 () Bool)

(assert (=> b!537325 m!516575))

(assert (=> b!537325 m!516575))

(assert (=> b!537325 m!516573))

(declare-fun m!516577 () Bool)

(assert (=> b!537325 m!516577))

(declare-fun m!516579 () Bool)

(assert (=> b!537321 m!516579))

(declare-fun m!516581 () Bool)

(assert (=> start!48812 m!516581))

(declare-fun m!516583 () Bool)

(assert (=> start!48812 m!516583))

(assert (=> b!537316 m!516573))

(assert (=> b!537316 m!516573))

(declare-fun m!516585 () Bool)

(assert (=> b!537316 m!516585))

(assert (=> b!537324 m!516573))

(assert (=> b!537324 m!516573))

(declare-fun m!516587 () Bool)

(assert (=> b!537324 m!516587))

(declare-fun m!516589 () Bool)

(assert (=> b!537314 m!516589))

(declare-fun m!516591 () Bool)

(assert (=> b!537326 m!516591))

(assert (=> b!537326 m!516573))

(declare-fun m!516593 () Bool)

(assert (=> b!537315 m!516593))

(assert (=> b!537315 m!516573))

(assert (=> b!537317 m!516573))

(assert (=> b!537317 m!516573))

(declare-fun m!516595 () Bool)

(assert (=> b!537317 m!516595))

(declare-fun m!516597 () Bool)

(assert (=> b!537322 m!516597))

(declare-fun m!516599 () Bool)

(assert (=> b!537320 m!516599))

(check-sat (not b!537317) (not b!537320) (not b!537322) (not b!537324) (not b!537314) (not b!537321) (not b!537316) (not b!537325) (not start!48812) (not b!537319) (not b!537318))
(check-sat)
