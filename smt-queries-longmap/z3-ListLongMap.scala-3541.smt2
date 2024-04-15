; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48804 () Bool)

(assert start!48804)

(declare-fun b!537121 () Bool)

(declare-fun res!332469 () Bool)

(declare-fun e!311606 () Bool)

(assert (=> b!537121 (=> (not res!332469) (not e!311606))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34026 0))(
  ( (array!34027 (arr!16352 (Array (_ BitVec 32) (_ BitVec 64))) (size!16717 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34026)

(assert (=> b!537121 (= res!332469 (and (not (= (select (arr!16352 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16352 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16352 a!3154) index!1177) (select (arr!16352 a!3154) j!147)))))))

(declare-fun b!537122 () Bool)

(declare-fun res!332468 () Bool)

(assert (=> b!537122 (=> (not res!332468) (not e!311606))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4807 0))(
  ( (MissingZero!4807 (index!21452 (_ BitVec 32))) (Found!4807 (index!21453 (_ BitVec 32))) (Intermediate!4807 (undefined!5619 Bool) (index!21454 (_ BitVec 32)) (x!50393 (_ BitVec 32))) (Undefined!4807) (MissingVacant!4807 (index!21455 (_ BitVec 32))) )
))
(declare-fun lt!246155 () SeekEntryResult!4807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34026 (_ BitVec 32)) SeekEntryResult!4807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537122 (= res!332468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16352 a!3154) j!147) mask!3216) (select (arr!16352 a!3154) j!147) a!3154 mask!3216) lt!246155))))

(declare-fun res!332473 () Bool)

(declare-fun e!311608 () Bool)

(assert (=> start!48804 (=> (not res!332473) (not e!311608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48804 (= res!332473 (validMask!0 mask!3216))))

(assert (=> start!48804 e!311608))

(assert (=> start!48804 true))

(declare-fun array_inv!12235 (array!34026) Bool)

(assert (=> start!48804 (array_inv!12235 a!3154)))

(declare-fun b!537123 () Bool)

(declare-fun res!332472 () Bool)

(declare-fun e!311607 () Bool)

(assert (=> b!537123 (=> (not res!332472) (not e!311607))))

(declare-datatypes ((List!10510 0))(
  ( (Nil!10507) (Cons!10506 (h!11449 (_ BitVec 64)) (t!16729 List!10510)) )
))
(declare-fun arrayNoDuplicates!0 (array!34026 (_ BitVec 32) List!10510) Bool)

(assert (=> b!537123 (= res!332472 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10507))))

(declare-fun b!537124 () Bool)

(declare-fun res!332477 () Bool)

(assert (=> b!537124 (=> (not res!332477) (not e!311608))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537124 (= res!332477 (and (= (size!16717 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16717 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16717 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537125 () Bool)

(declare-fun res!332471 () Bool)

(assert (=> b!537125 (=> (not res!332471) (not e!311607))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537125 (= res!332471 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16717 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16717 a!3154)) (= (select (arr!16352 a!3154) resIndex!32) (select (arr!16352 a!3154) j!147))))))

(declare-fun b!537126 () Bool)

(declare-fun res!332474 () Bool)

(assert (=> b!537126 (=> (not res!332474) (not e!311607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34026 (_ BitVec 32)) Bool)

(assert (=> b!537126 (= res!332474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537127 () Bool)

(assert (=> b!537127 (= e!311608 e!311607)))

(declare-fun res!332480 () Bool)

(assert (=> b!537127 (=> (not res!332480) (not e!311607))))

(declare-fun lt!246154 () SeekEntryResult!4807)

(assert (=> b!537127 (= res!332480 (or (= lt!246154 (MissingZero!4807 i!1153)) (= lt!246154 (MissingVacant!4807 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34026 (_ BitVec 32)) SeekEntryResult!4807)

(assert (=> b!537127 (= lt!246154 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537128 () Bool)

(declare-fun res!332478 () Bool)

(assert (=> b!537128 (=> (not res!332478) (not e!311608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537128 (= res!332478 (validKeyInArray!0 k0!1998))))

(declare-fun b!537129 () Bool)

(declare-fun res!332470 () Bool)

(assert (=> b!537129 (=> (not res!332470) (not e!311608))))

(declare-fun arrayContainsKey!0 (array!34026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537129 (= res!332470 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537130 () Bool)

(assert (=> b!537130 (= e!311607 e!311606)))

(declare-fun res!332475 () Bool)

(assert (=> b!537130 (=> (not res!332475) (not e!311606))))

(assert (=> b!537130 (= res!332475 (= lt!246155 (Intermediate!4807 false resIndex!32 resX!32)))))

(assert (=> b!537130 (= lt!246155 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16352 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537131 () Bool)

(declare-fun res!332476 () Bool)

(assert (=> b!537131 (=> (not res!332476) (not e!311608))))

(assert (=> b!537131 (= res!332476 (validKeyInArray!0 (select (arr!16352 a!3154) j!147)))))

(declare-fun b!537132 () Bool)

(declare-fun e!311610 () Bool)

(assert (=> b!537132 (= e!311606 e!311610)))

(declare-fun res!332479 () Bool)

(assert (=> b!537132 (=> (not res!332479) (not e!311610))))

(declare-fun lt!246156 () (_ BitVec 32))

(assert (=> b!537132 (= res!332479 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246156 #b00000000000000000000000000000000) (bvslt lt!246156 (size!16717 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537132 (= lt!246156 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537133 () Bool)

(assert (=> b!537133 (= e!311610 false)))

(declare-fun lt!246157 () SeekEntryResult!4807)

(assert (=> b!537133 (= lt!246157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246156 (select (arr!16352 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48804 res!332473) b!537124))

(assert (= (and b!537124 res!332477) b!537131))

(assert (= (and b!537131 res!332476) b!537128))

(assert (= (and b!537128 res!332478) b!537129))

(assert (= (and b!537129 res!332470) b!537127))

(assert (= (and b!537127 res!332480) b!537126))

(assert (= (and b!537126 res!332474) b!537123))

(assert (= (and b!537123 res!332472) b!537125))

(assert (= (and b!537125 res!332471) b!537130))

(assert (= (and b!537130 res!332475) b!537122))

(assert (= (and b!537122 res!332468) b!537121))

(assert (= (and b!537121 res!332469) b!537132))

(assert (= (and b!537132 res!332479) b!537133))

(declare-fun m!515881 () Bool)

(assert (=> b!537128 m!515881))

(declare-fun m!515883 () Bool)

(assert (=> b!537122 m!515883))

(assert (=> b!537122 m!515883))

(declare-fun m!515885 () Bool)

(assert (=> b!537122 m!515885))

(assert (=> b!537122 m!515885))

(assert (=> b!537122 m!515883))

(declare-fun m!515887 () Bool)

(assert (=> b!537122 m!515887))

(declare-fun m!515889 () Bool)

(assert (=> start!48804 m!515889))

(declare-fun m!515891 () Bool)

(assert (=> start!48804 m!515891))

(declare-fun m!515893 () Bool)

(assert (=> b!537123 m!515893))

(declare-fun m!515895 () Bool)

(assert (=> b!537129 m!515895))

(assert (=> b!537131 m!515883))

(assert (=> b!537131 m!515883))

(declare-fun m!515897 () Bool)

(assert (=> b!537131 m!515897))

(declare-fun m!515899 () Bool)

(assert (=> b!537121 m!515899))

(assert (=> b!537121 m!515883))

(assert (=> b!537133 m!515883))

(assert (=> b!537133 m!515883))

(declare-fun m!515901 () Bool)

(assert (=> b!537133 m!515901))

(assert (=> b!537130 m!515883))

(assert (=> b!537130 m!515883))

(declare-fun m!515903 () Bool)

(assert (=> b!537130 m!515903))

(declare-fun m!515905 () Bool)

(assert (=> b!537127 m!515905))

(declare-fun m!515907 () Bool)

(assert (=> b!537126 m!515907))

(declare-fun m!515909 () Bool)

(assert (=> b!537125 m!515909))

(assert (=> b!537125 m!515883))

(declare-fun m!515911 () Bool)

(assert (=> b!537132 m!515911))

(check-sat (not b!537129) (not b!537122) (not b!537123) (not b!537126) (not b!537127) (not b!537131) (not b!537133) (not b!537132) (not start!48804) (not b!537128) (not b!537130))
(check-sat)
