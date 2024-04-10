; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48854 () Bool)

(assert start!48854)

(declare-fun b!538133 () Bool)

(declare-fun res!333345 () Bool)

(declare-fun e!312069 () Bool)

(assert (=> b!538133 (=> (not res!333345) (not e!312069))))

(declare-datatypes ((array!34066 0))(
  ( (array!34067 (arr!16372 (Array (_ BitVec 32) (_ BitVec 64))) (size!16736 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34066)

(declare-datatypes ((List!10491 0))(
  ( (Nil!10488) (Cons!10487 (h!11430 (_ BitVec 64)) (t!16719 List!10491)) )
))
(declare-fun arrayNoDuplicates!0 (array!34066 (_ BitVec 32) List!10491) Bool)

(assert (=> b!538133 (= res!333345 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10488))))

(declare-fun b!538134 () Bool)

(declare-fun res!333338 () Bool)

(assert (=> b!538134 (=> (not res!333338) (not e!312069))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538134 (= res!333338 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16736 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16736 a!3154)) (= (select (arr!16372 a!3154) resIndex!32) (select (arr!16372 a!3154) j!147))))))

(declare-fun b!538135 () Bool)

(declare-fun res!333344 () Bool)

(declare-fun e!312065 () Bool)

(assert (=> b!538135 (=> (not res!333344) (not e!312065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538135 (= res!333344 (validKeyInArray!0 (select (arr!16372 a!3154) j!147)))))

(declare-fun b!538136 () Bool)

(declare-fun res!333340 () Bool)

(assert (=> b!538136 (=> (not res!333340) (not e!312069))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34066 (_ BitVec 32)) Bool)

(assert (=> b!538136 (= res!333340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538137 () Bool)

(declare-fun res!333350 () Bool)

(assert (=> b!538137 (=> (not res!333350) (not e!312065))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538137 (= res!333350 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538138 () Bool)

(declare-fun res!333348 () Bool)

(assert (=> b!538138 (=> (not res!333348) (not e!312065))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538138 (= res!333348 (and (= (size!16736 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16736 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16736 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538139 () Bool)

(declare-fun e!312068 () Bool)

(assert (=> b!538139 (= e!312068 false)))

(declare-fun lt!246617 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4830 0))(
  ( (MissingZero!4830 (index!21544 (_ BitVec 32))) (Found!4830 (index!21545 (_ BitVec 32))) (Intermediate!4830 (undefined!5642 Bool) (index!21546 (_ BitVec 32)) (x!50469 (_ BitVec 32))) (Undefined!4830) (MissingVacant!4830 (index!21547 (_ BitVec 32))) )
))
(declare-fun lt!246619 () SeekEntryResult!4830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34066 (_ BitVec 32)) SeekEntryResult!4830)

(assert (=> b!538139 (= lt!246619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246617 (select (arr!16372 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333347 () Bool)

(assert (=> start!48854 (=> (not res!333347) (not e!312065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48854 (= res!333347 (validMask!0 mask!3216))))

(assert (=> start!48854 e!312065))

(assert (=> start!48854 true))

(declare-fun array_inv!12168 (array!34066) Bool)

(assert (=> start!48854 (array_inv!12168 a!3154)))

(declare-fun b!538140 () Bool)

(declare-fun e!312066 () Bool)

(assert (=> b!538140 (= e!312066 e!312068)))

(declare-fun res!333339 () Bool)

(assert (=> b!538140 (=> (not res!333339) (not e!312068))))

(assert (=> b!538140 (= res!333339 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246617 #b00000000000000000000000000000000) (bvslt lt!246617 (size!16736 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538140 (= lt!246617 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538141 () Bool)

(declare-fun res!333341 () Bool)

(assert (=> b!538141 (=> (not res!333341) (not e!312066))))

(declare-fun lt!246616 () SeekEntryResult!4830)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538141 (= res!333341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16372 a!3154) j!147) mask!3216) (select (arr!16372 a!3154) j!147) a!3154 mask!3216) lt!246616))))

(declare-fun b!538142 () Bool)

(declare-fun res!333346 () Bool)

(assert (=> b!538142 (=> (not res!333346) (not e!312066))))

(assert (=> b!538142 (= res!333346 (and (not (= (select (arr!16372 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16372 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16372 a!3154) index!1177) (select (arr!16372 a!3154) j!147)))))))

(declare-fun b!538143 () Bool)

(assert (=> b!538143 (= e!312065 e!312069)))

(declare-fun res!333342 () Bool)

(assert (=> b!538143 (=> (not res!333342) (not e!312069))))

(declare-fun lt!246618 () SeekEntryResult!4830)

(assert (=> b!538143 (= res!333342 (or (= lt!246618 (MissingZero!4830 i!1153)) (= lt!246618 (MissingVacant!4830 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34066 (_ BitVec 32)) SeekEntryResult!4830)

(assert (=> b!538143 (= lt!246618 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538144 () Bool)

(assert (=> b!538144 (= e!312069 e!312066)))

(declare-fun res!333349 () Bool)

(assert (=> b!538144 (=> (not res!333349) (not e!312066))))

(assert (=> b!538144 (= res!333349 (= lt!246616 (Intermediate!4830 false resIndex!32 resX!32)))))

(assert (=> b!538144 (= lt!246616 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16372 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538145 () Bool)

(declare-fun res!333343 () Bool)

(assert (=> b!538145 (=> (not res!333343) (not e!312065))))

(assert (=> b!538145 (= res!333343 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48854 res!333347) b!538138))

(assert (= (and b!538138 res!333348) b!538135))

(assert (= (and b!538135 res!333344) b!538145))

(assert (= (and b!538145 res!333343) b!538137))

(assert (= (and b!538137 res!333350) b!538143))

(assert (= (and b!538143 res!333342) b!538136))

(assert (= (and b!538136 res!333340) b!538133))

(assert (= (and b!538133 res!333345) b!538134))

(assert (= (and b!538134 res!333338) b!538144))

(assert (= (and b!538144 res!333349) b!538141))

(assert (= (and b!538141 res!333341) b!538142))

(assert (= (and b!538142 res!333346) b!538140))

(assert (= (and b!538140 res!333339) b!538139))

(declare-fun m!517241 () Bool)

(assert (=> b!538136 m!517241))

(declare-fun m!517243 () Bool)

(assert (=> b!538141 m!517243))

(assert (=> b!538141 m!517243))

(declare-fun m!517245 () Bool)

(assert (=> b!538141 m!517245))

(assert (=> b!538141 m!517245))

(assert (=> b!538141 m!517243))

(declare-fun m!517247 () Bool)

(assert (=> b!538141 m!517247))

(assert (=> b!538135 m!517243))

(assert (=> b!538135 m!517243))

(declare-fun m!517249 () Bool)

(assert (=> b!538135 m!517249))

(assert (=> b!538144 m!517243))

(assert (=> b!538144 m!517243))

(declare-fun m!517251 () Bool)

(assert (=> b!538144 m!517251))

(declare-fun m!517253 () Bool)

(assert (=> b!538140 m!517253))

(assert (=> b!538139 m!517243))

(assert (=> b!538139 m!517243))

(declare-fun m!517255 () Bool)

(assert (=> b!538139 m!517255))

(declare-fun m!517257 () Bool)

(assert (=> b!538145 m!517257))

(declare-fun m!517259 () Bool)

(assert (=> b!538143 m!517259))

(declare-fun m!517261 () Bool)

(assert (=> b!538133 m!517261))

(declare-fun m!517263 () Bool)

(assert (=> b!538137 m!517263))

(declare-fun m!517265 () Bool)

(assert (=> start!48854 m!517265))

(declare-fun m!517267 () Bool)

(assert (=> start!48854 m!517267))

(declare-fun m!517269 () Bool)

(assert (=> b!538142 m!517269))

(assert (=> b!538142 m!517243))

(declare-fun m!517271 () Bool)

(assert (=> b!538134 m!517271))

(assert (=> b!538134 m!517243))

(check-sat (not b!538135) (not b!538137) (not b!538139) (not b!538144) (not b!538140) (not b!538145) (not b!538141) (not b!538143) (not b!538136) (not start!48854) (not b!538133))
(check-sat)
