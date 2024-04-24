; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48880 () Bool)

(assert start!48880)

(declare-fun b!537943 () Bool)

(declare-fun res!333048 () Bool)

(declare-fun e!312046 () Bool)

(assert (=> b!537943 (=> (not res!333048) (not e!312046))))

(declare-datatypes ((array!34040 0))(
  ( (array!34041 (arr!16357 (Array (_ BitVec 32) (_ BitVec 64))) (size!16721 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34040)

(declare-datatypes ((List!10383 0))(
  ( (Nil!10380) (Cons!10379 (h!11325 (_ BitVec 64)) (t!16603 List!10383)) )
))
(declare-fun arrayNoDuplicates!0 (array!34040 (_ BitVec 32) List!10383) Bool)

(assert (=> b!537943 (= res!333048 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10380))))

(declare-fun b!537944 () Bool)

(declare-fun res!333055 () Bool)

(assert (=> b!537944 (=> (not res!333055) (not e!312046))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537944 (= res!333055 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16721 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16721 a!3154)) (= (select (arr!16357 a!3154) resIndex!32) (select (arr!16357 a!3154) j!147))))))

(declare-fun b!537946 () Bool)

(declare-fun res!333046 () Bool)

(declare-fun e!312044 () Bool)

(assert (=> b!537946 (=> (not res!333046) (not e!312044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537946 (= res!333046 (validKeyInArray!0 (select (arr!16357 a!3154) j!147)))))

(declare-fun b!537947 () Bool)

(declare-fun e!312047 () Bool)

(assert (=> b!537947 (= e!312047 false)))

(declare-datatypes ((SeekEntryResult!4771 0))(
  ( (MissingZero!4771 (index!21308 (_ BitVec 32))) (Found!4771 (index!21309 (_ BitVec 32))) (Intermediate!4771 (undefined!5583 Bool) (index!21310 (_ BitVec 32)) (x!50389 (_ BitVec 32))) (Undefined!4771) (MissingVacant!4771 (index!21311 (_ BitVec 32))) )
))
(declare-fun lt!246604 () SeekEntryResult!4771)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!246607 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34040 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!537947 (= lt!246604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246607 (select (arr!16357 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537948 () Bool)

(assert (=> b!537948 (= e!312044 e!312046)))

(declare-fun res!333050 () Bool)

(assert (=> b!537948 (=> (not res!333050) (not e!312046))))

(declare-fun lt!246606 () SeekEntryResult!4771)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537948 (= res!333050 (or (= lt!246606 (MissingZero!4771 i!1153)) (= lt!246606 (MissingVacant!4771 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34040 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!537948 (= lt!246606 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537949 () Bool)

(declare-fun e!312048 () Bool)

(assert (=> b!537949 (= e!312048 e!312047)))

(declare-fun res!333043 () Bool)

(assert (=> b!537949 (=> (not res!333043) (not e!312047))))

(assert (=> b!537949 (= res!333043 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246607 #b00000000000000000000000000000000) (bvslt lt!246607 (size!16721 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537949 (= lt!246607 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537950 () Bool)

(assert (=> b!537950 (= e!312046 e!312048)))

(declare-fun res!333045 () Bool)

(assert (=> b!537950 (=> (not res!333045) (not e!312048))))

(declare-fun lt!246605 () SeekEntryResult!4771)

(assert (=> b!537950 (= res!333045 (= lt!246605 (Intermediate!4771 false resIndex!32 resX!32)))))

(assert (=> b!537950 (= lt!246605 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16357 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537945 () Bool)

(declare-fun res!333052 () Bool)

(assert (=> b!537945 (=> (not res!333052) (not e!312046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34040 (_ BitVec 32)) Bool)

(assert (=> b!537945 (= res!333052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!333053 () Bool)

(assert (=> start!48880 (=> (not res!333053) (not e!312044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48880 (= res!333053 (validMask!0 mask!3216))))

(assert (=> start!48880 e!312044))

(assert (=> start!48880 true))

(declare-fun array_inv!12216 (array!34040) Bool)

(assert (=> start!48880 (array_inv!12216 a!3154)))

(declare-fun b!537951 () Bool)

(declare-fun res!333049 () Bool)

(assert (=> b!537951 (=> (not res!333049) (not e!312044))))

(declare-fun arrayContainsKey!0 (array!34040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537951 (= res!333049 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537952 () Bool)

(declare-fun res!333047 () Bool)

(assert (=> b!537952 (=> (not res!333047) (not e!312044))))

(assert (=> b!537952 (= res!333047 (and (= (size!16721 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16721 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16721 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537953 () Bool)

(declare-fun res!333051 () Bool)

(assert (=> b!537953 (=> (not res!333051) (not e!312048))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537953 (= res!333051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16357 a!3154) j!147) mask!3216) (select (arr!16357 a!3154) j!147) a!3154 mask!3216) lt!246605))))

(declare-fun b!537954 () Bool)

(declare-fun res!333044 () Bool)

(assert (=> b!537954 (=> (not res!333044) (not e!312044))))

(assert (=> b!537954 (= res!333044 (validKeyInArray!0 k0!1998))))

(declare-fun b!537955 () Bool)

(declare-fun res!333054 () Bool)

(assert (=> b!537955 (=> (not res!333054) (not e!312048))))

(assert (=> b!537955 (= res!333054 (and (not (= (select (arr!16357 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16357 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16357 a!3154) index!1177) (select (arr!16357 a!3154) j!147)))))))

(assert (= (and start!48880 res!333053) b!537952))

(assert (= (and b!537952 res!333047) b!537946))

(assert (= (and b!537946 res!333046) b!537954))

(assert (= (and b!537954 res!333044) b!537951))

(assert (= (and b!537951 res!333049) b!537948))

(assert (= (and b!537948 res!333050) b!537945))

(assert (= (and b!537945 res!333052) b!537943))

(assert (= (and b!537943 res!333048) b!537944))

(assert (= (and b!537944 res!333055) b!537950))

(assert (= (and b!537950 res!333045) b!537953))

(assert (= (and b!537953 res!333051) b!537955))

(assert (= (and b!537955 res!333054) b!537949))

(assert (= (and b!537949 res!333043) b!537947))

(declare-fun m!517243 () Bool)

(assert (=> b!537949 m!517243))

(declare-fun m!517245 () Bool)

(assert (=> b!537951 m!517245))

(declare-fun m!517247 () Bool)

(assert (=> b!537943 m!517247))

(declare-fun m!517249 () Bool)

(assert (=> b!537948 m!517249))

(declare-fun m!517251 () Bool)

(assert (=> b!537954 m!517251))

(declare-fun m!517253 () Bool)

(assert (=> b!537945 m!517253))

(declare-fun m!517255 () Bool)

(assert (=> b!537944 m!517255))

(declare-fun m!517257 () Bool)

(assert (=> b!537944 m!517257))

(assert (=> b!537946 m!517257))

(assert (=> b!537946 m!517257))

(declare-fun m!517259 () Bool)

(assert (=> b!537946 m!517259))

(assert (=> b!537947 m!517257))

(assert (=> b!537947 m!517257))

(declare-fun m!517261 () Bool)

(assert (=> b!537947 m!517261))

(declare-fun m!517263 () Bool)

(assert (=> b!537955 m!517263))

(assert (=> b!537955 m!517257))

(assert (=> b!537953 m!517257))

(assert (=> b!537953 m!517257))

(declare-fun m!517265 () Bool)

(assert (=> b!537953 m!517265))

(assert (=> b!537953 m!517265))

(assert (=> b!537953 m!517257))

(declare-fun m!517267 () Bool)

(assert (=> b!537953 m!517267))

(declare-fun m!517269 () Bool)

(assert (=> start!48880 m!517269))

(declare-fun m!517271 () Bool)

(assert (=> start!48880 m!517271))

(assert (=> b!537950 m!517257))

(assert (=> b!537950 m!517257))

(declare-fun m!517273 () Bool)

(assert (=> b!537950 m!517273))

(check-sat (not b!537953) (not b!537951) (not b!537943) (not b!537949) (not start!48880) (not b!537954) (not b!537948) (not b!537945) (not b!537950) (not b!537946) (not b!537947))
(check-sat)
