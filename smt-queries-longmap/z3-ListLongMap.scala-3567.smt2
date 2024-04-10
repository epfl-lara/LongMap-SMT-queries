; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49028 () Bool)

(assert start!49028)

(declare-fun b!540297 () Bool)

(declare-fun res!335350 () Bool)

(declare-fun e!313024 () Bool)

(assert (=> b!540297 (=> (not res!335350) (not e!313024))))

(declare-datatypes ((array!34189 0))(
  ( (array!34190 (arr!16432 (Array (_ BitVec 32) (_ BitVec 64))) (size!16796 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34189)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540297 (= res!335350 (validKeyInArray!0 (select (arr!16432 a!3154) j!147)))))

(declare-fun b!540298 () Bool)

(declare-fun res!335349 () Bool)

(assert (=> b!540298 (=> (not res!335349) (not e!313024))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540298 (= res!335349 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540299 () Bool)

(declare-fun e!313026 () Bool)

(assert (=> b!540299 (= e!313026 false)))

(declare-datatypes ((SeekEntryResult!4890 0))(
  ( (MissingZero!4890 (index!21784 (_ BitVec 32))) (Found!4890 (index!21785 (_ BitVec 32))) (Intermediate!4890 (undefined!5702 Bool) (index!21786 (_ BitVec 32)) (x!50695 (_ BitVec 32))) (Undefined!4890) (MissingVacant!4890 (index!21787 (_ BitVec 32))) )
))
(declare-fun lt!247350 () SeekEntryResult!4890)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34189 (_ BitVec 32)) SeekEntryResult!4890)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540299 (= lt!247350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16432 a!3154) j!147) mask!3216) (select (arr!16432 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540300 () Bool)

(declare-fun res!335351 () Bool)

(assert (=> b!540300 (=> (not res!335351) (not e!313026))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540300 (= res!335351 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16432 a!3154) j!147) a!3154 mask!3216) (Intermediate!4890 false resIndex!32 resX!32)))))

(declare-fun b!540301 () Bool)

(declare-fun res!335345 () Bool)

(assert (=> b!540301 (=> (not res!335345) (not e!313026))))

(declare-datatypes ((List!10551 0))(
  ( (Nil!10548) (Cons!10547 (h!11493 (_ BitVec 64)) (t!16779 List!10551)) )
))
(declare-fun arrayNoDuplicates!0 (array!34189 (_ BitVec 32) List!10551) Bool)

(assert (=> b!540301 (= res!335345 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10548))))

(declare-fun b!540296 () Bool)

(declare-fun res!335343 () Bool)

(assert (=> b!540296 (=> (not res!335343) (not e!313024))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540296 (= res!335343 (and (= (size!16796 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16796 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16796 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335344 () Bool)

(assert (=> start!49028 (=> (not res!335344) (not e!313024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49028 (= res!335344 (validMask!0 mask!3216))))

(assert (=> start!49028 e!313024))

(assert (=> start!49028 true))

(declare-fun array_inv!12228 (array!34189) Bool)

(assert (=> start!49028 (array_inv!12228 a!3154)))

(declare-fun b!540302 () Bool)

(declare-fun res!335347 () Bool)

(assert (=> b!540302 (=> (not res!335347) (not e!313026))))

(assert (=> b!540302 (= res!335347 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16796 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16796 a!3154)) (= (select (arr!16432 a!3154) resIndex!32) (select (arr!16432 a!3154) j!147))))))

(declare-fun b!540303 () Bool)

(declare-fun res!335348 () Bool)

(assert (=> b!540303 (=> (not res!335348) (not e!313024))))

(assert (=> b!540303 (= res!335348 (validKeyInArray!0 k0!1998))))

(declare-fun b!540304 () Bool)

(assert (=> b!540304 (= e!313024 e!313026)))

(declare-fun res!335342 () Bool)

(assert (=> b!540304 (=> (not res!335342) (not e!313026))))

(declare-fun lt!247351 () SeekEntryResult!4890)

(assert (=> b!540304 (= res!335342 (or (= lt!247351 (MissingZero!4890 i!1153)) (= lt!247351 (MissingVacant!4890 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34189 (_ BitVec 32)) SeekEntryResult!4890)

(assert (=> b!540304 (= lt!247351 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540305 () Bool)

(declare-fun res!335346 () Bool)

(assert (=> b!540305 (=> (not res!335346) (not e!313026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34189 (_ BitVec 32)) Bool)

(assert (=> b!540305 (= res!335346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49028 res!335344) b!540296))

(assert (= (and b!540296 res!335343) b!540297))

(assert (= (and b!540297 res!335350) b!540303))

(assert (= (and b!540303 res!335348) b!540298))

(assert (= (and b!540298 res!335349) b!540304))

(assert (= (and b!540304 res!335342) b!540305))

(assert (= (and b!540305 res!335346) b!540301))

(assert (= (and b!540301 res!335345) b!540302))

(assert (= (and b!540302 res!335347) b!540300))

(assert (= (and b!540300 res!335351) b!540299))

(declare-fun m!519113 () Bool)

(assert (=> b!540300 m!519113))

(assert (=> b!540300 m!519113))

(declare-fun m!519115 () Bool)

(assert (=> b!540300 m!519115))

(assert (=> b!540299 m!519113))

(assert (=> b!540299 m!519113))

(declare-fun m!519117 () Bool)

(assert (=> b!540299 m!519117))

(assert (=> b!540299 m!519117))

(assert (=> b!540299 m!519113))

(declare-fun m!519119 () Bool)

(assert (=> b!540299 m!519119))

(declare-fun m!519121 () Bool)

(assert (=> b!540298 m!519121))

(declare-fun m!519123 () Bool)

(assert (=> b!540304 m!519123))

(declare-fun m!519125 () Bool)

(assert (=> b!540305 m!519125))

(declare-fun m!519127 () Bool)

(assert (=> b!540303 m!519127))

(declare-fun m!519129 () Bool)

(assert (=> b!540302 m!519129))

(assert (=> b!540302 m!519113))

(declare-fun m!519131 () Bool)

(assert (=> start!49028 m!519131))

(declare-fun m!519133 () Bool)

(assert (=> start!49028 m!519133))

(assert (=> b!540297 m!519113))

(assert (=> b!540297 m!519113))

(declare-fun m!519135 () Bool)

(assert (=> b!540297 m!519135))

(declare-fun m!519137 () Bool)

(assert (=> b!540301 m!519137))

(check-sat (not start!49028) (not b!540298) (not b!540304) (not b!540301) (not b!540297) (not b!540299) (not b!540303) (not b!540305) (not b!540300))
(check-sat)
