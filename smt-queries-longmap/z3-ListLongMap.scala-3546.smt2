; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48892 () Bool)

(assert start!48892)

(declare-fun b!538177 () Bool)

(declare-fun e!312137 () Bool)

(declare-fun e!312134 () Bool)

(assert (=> b!538177 (= e!312137 e!312134)))

(declare-fun res!333280 () Bool)

(assert (=> b!538177 (=> (not res!333280) (not e!312134))))

(declare-datatypes ((SeekEntryResult!4777 0))(
  ( (MissingZero!4777 (index!21332 (_ BitVec 32))) (Found!4777 (index!21333 (_ BitVec 32))) (Intermediate!4777 (undefined!5589 Bool) (index!21334 (_ BitVec 32)) (x!50411 (_ BitVec 32))) (Undefined!4777) (MissingVacant!4777 (index!21335 (_ BitVec 32))) )
))
(declare-fun lt!246679 () SeekEntryResult!4777)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538177 (= res!333280 (or (= lt!246679 (MissingZero!4777 i!1153)) (= lt!246679 (MissingVacant!4777 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34052 0))(
  ( (array!34053 (arr!16363 (Array (_ BitVec 32) (_ BitVec 64))) (size!16727 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34052)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34052 (_ BitVec 32)) SeekEntryResult!4777)

(assert (=> b!538177 (= lt!246679 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538178 () Bool)

(declare-fun res!333279 () Bool)

(assert (=> b!538178 (=> (not res!333279) (not e!312137))))

(declare-fun arrayContainsKey!0 (array!34052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538178 (= res!333279 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538179 () Bool)

(declare-fun res!333281 () Bool)

(assert (=> b!538179 (=> (not res!333281) (not e!312137))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538179 (= res!333281 (validKeyInArray!0 (select (arr!16363 a!3154) j!147)))))

(declare-fun b!538180 () Bool)

(declare-fun e!312138 () Bool)

(assert (=> b!538180 (= e!312138 false)))

(declare-fun lt!246678 () (_ BitVec 32))

(declare-fun lt!246677 () SeekEntryResult!4777)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34052 (_ BitVec 32)) SeekEntryResult!4777)

(assert (=> b!538180 (= lt!246677 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246678 (select (arr!16363 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538181 () Bool)

(declare-fun res!333285 () Bool)

(assert (=> b!538181 (=> (not res!333285) (not e!312134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34052 (_ BitVec 32)) Bool)

(assert (=> b!538181 (= res!333285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538182 () Bool)

(declare-fun e!312136 () Bool)

(assert (=> b!538182 (= e!312136 e!312138)))

(declare-fun res!333282 () Bool)

(assert (=> b!538182 (=> (not res!333282) (not e!312138))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538182 (= res!333282 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246678 #b00000000000000000000000000000000) (bvslt lt!246678 (size!16727 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538182 (= lt!246678 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538183 () Bool)

(declare-fun res!333277 () Bool)

(assert (=> b!538183 (=> (not res!333277) (not e!312137))))

(assert (=> b!538183 (= res!333277 (and (= (size!16727 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16727 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16727 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538184 () Bool)

(declare-fun res!333287 () Bool)

(assert (=> b!538184 (=> (not res!333287) (not e!312136))))

(assert (=> b!538184 (= res!333287 (and (not (= (select (arr!16363 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16363 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16363 a!3154) index!1177) (select (arr!16363 a!3154) j!147)))))))

(declare-fun b!538185 () Bool)

(assert (=> b!538185 (= e!312134 e!312136)))

(declare-fun res!333288 () Bool)

(assert (=> b!538185 (=> (not res!333288) (not e!312136))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!246676 () SeekEntryResult!4777)

(assert (=> b!538185 (= res!333288 (= lt!246676 (Intermediate!4777 false resIndex!32 resX!32)))))

(assert (=> b!538185 (= lt!246676 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16363 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538186 () Bool)

(declare-fun res!333284 () Bool)

(assert (=> b!538186 (=> (not res!333284) (not e!312136))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538186 (= res!333284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16363 a!3154) j!147) mask!3216) (select (arr!16363 a!3154) j!147) a!3154 mask!3216) lt!246676))))

(declare-fun b!538187 () Bool)

(declare-fun res!333286 () Bool)

(assert (=> b!538187 (=> (not res!333286) (not e!312134))))

(declare-datatypes ((List!10389 0))(
  ( (Nil!10386) (Cons!10385 (h!11331 (_ BitVec 64)) (t!16609 List!10389)) )
))
(declare-fun arrayNoDuplicates!0 (array!34052 (_ BitVec 32) List!10389) Bool)

(assert (=> b!538187 (= res!333286 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10386))))

(declare-fun b!538188 () Bool)

(declare-fun res!333289 () Bool)

(assert (=> b!538188 (=> (not res!333289) (not e!312137))))

(assert (=> b!538188 (= res!333289 (validKeyInArray!0 k0!1998))))

(declare-fun b!538189 () Bool)

(declare-fun res!333278 () Bool)

(assert (=> b!538189 (=> (not res!333278) (not e!312134))))

(assert (=> b!538189 (= res!333278 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16727 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16727 a!3154)) (= (select (arr!16363 a!3154) resIndex!32) (select (arr!16363 a!3154) j!147))))))

(declare-fun res!333283 () Bool)

(assert (=> start!48892 (=> (not res!333283) (not e!312137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48892 (= res!333283 (validMask!0 mask!3216))))

(assert (=> start!48892 e!312137))

(assert (=> start!48892 true))

(declare-fun array_inv!12222 (array!34052) Bool)

(assert (=> start!48892 (array_inv!12222 a!3154)))

(assert (= (and start!48892 res!333283) b!538183))

(assert (= (and b!538183 res!333277) b!538179))

(assert (= (and b!538179 res!333281) b!538188))

(assert (= (and b!538188 res!333289) b!538178))

(assert (= (and b!538178 res!333279) b!538177))

(assert (= (and b!538177 res!333280) b!538181))

(assert (= (and b!538181 res!333285) b!538187))

(assert (= (and b!538187 res!333286) b!538189))

(assert (= (and b!538189 res!333278) b!538185))

(assert (= (and b!538185 res!333288) b!538186))

(assert (= (and b!538186 res!333284) b!538184))

(assert (= (and b!538184 res!333287) b!538182))

(assert (= (and b!538182 res!333282) b!538180))

(declare-fun m!517435 () Bool)

(assert (=> b!538189 m!517435))

(declare-fun m!517437 () Bool)

(assert (=> b!538189 m!517437))

(assert (=> b!538186 m!517437))

(assert (=> b!538186 m!517437))

(declare-fun m!517439 () Bool)

(assert (=> b!538186 m!517439))

(assert (=> b!538186 m!517439))

(assert (=> b!538186 m!517437))

(declare-fun m!517441 () Bool)

(assert (=> b!538186 m!517441))

(declare-fun m!517443 () Bool)

(assert (=> b!538181 m!517443))

(assert (=> b!538180 m!517437))

(assert (=> b!538180 m!517437))

(declare-fun m!517445 () Bool)

(assert (=> b!538180 m!517445))

(declare-fun m!517447 () Bool)

(assert (=> b!538188 m!517447))

(declare-fun m!517449 () Bool)

(assert (=> b!538184 m!517449))

(assert (=> b!538184 m!517437))

(declare-fun m!517451 () Bool)

(assert (=> start!48892 m!517451))

(declare-fun m!517453 () Bool)

(assert (=> start!48892 m!517453))

(declare-fun m!517455 () Bool)

(assert (=> b!538182 m!517455))

(assert (=> b!538179 m!517437))

(assert (=> b!538179 m!517437))

(declare-fun m!517457 () Bool)

(assert (=> b!538179 m!517457))

(declare-fun m!517459 () Bool)

(assert (=> b!538178 m!517459))

(declare-fun m!517461 () Bool)

(assert (=> b!538187 m!517461))

(assert (=> b!538185 m!517437))

(assert (=> b!538185 m!517437))

(declare-fun m!517463 () Bool)

(assert (=> b!538185 m!517463))

(declare-fun m!517465 () Bool)

(assert (=> b!538177 m!517465))

(check-sat (not b!538180) (not b!538182) (not b!538177) (not b!538187) (not start!48892) (not b!538181) (not b!538186) (not b!538178) (not b!538185) (not b!538188) (not b!538179))
(check-sat)
