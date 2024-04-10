; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48740 () Bool)

(assert start!48740)

(declare-fun b!535910 () Bool)

(declare-fun res!331120 () Bool)

(declare-fun e!311212 () Bool)

(assert (=> b!535910 (=> (not res!331120) (not e!311212))))

(declare-datatypes ((array!33952 0))(
  ( (array!33953 (arr!16315 (Array (_ BitVec 32) (_ BitVec 64))) (size!16679 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33952)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33952 (_ BitVec 32)) Bool)

(assert (=> b!535910 (= res!331120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535911 () Bool)

(declare-fun e!311214 () Bool)

(assert (=> b!535911 (= e!311214 e!311212)))

(declare-fun res!331124 () Bool)

(assert (=> b!535911 (=> (not res!331124) (not e!311212))))

(declare-datatypes ((SeekEntryResult!4773 0))(
  ( (MissingZero!4773 (index!21316 (_ BitVec 32))) (Found!4773 (index!21317 (_ BitVec 32))) (Intermediate!4773 (undefined!5585 Bool) (index!21318 (_ BitVec 32)) (x!50260 (_ BitVec 32))) (Undefined!4773) (MissingVacant!4773 (index!21319 (_ BitVec 32))) )
))
(declare-fun lt!245932 () SeekEntryResult!4773)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535911 (= res!331124 (or (= lt!245932 (MissingZero!4773 i!1153)) (= lt!245932 (MissingVacant!4773 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33952 (_ BitVec 32)) SeekEntryResult!4773)

(assert (=> b!535911 (= lt!245932 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535912 () Bool)

(declare-fun e!311211 () Bool)

(assert (=> b!535912 (= e!311212 e!311211)))

(declare-fun res!331122 () Bool)

(assert (=> b!535912 (=> (not res!331122) (not e!311211))))

(declare-fun lt!245935 () SeekEntryResult!4773)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535912 (= res!331122 (= lt!245935 (Intermediate!4773 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33952 (_ BitVec 32)) SeekEntryResult!4773)

(assert (=> b!535912 (= lt!245935 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16315 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535913 () Bool)

(declare-fun res!331121 () Bool)

(assert (=> b!535913 (=> (not res!331121) (not e!311214))))

(declare-fun arrayContainsKey!0 (array!33952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535913 (= res!331121 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535915 () Bool)

(declare-fun e!311213 () Bool)

(assert (=> b!535915 (= e!311211 e!311213)))

(declare-fun res!331115 () Bool)

(assert (=> b!535915 (=> (not res!331115) (not e!311213))))

(declare-fun lt!245934 () (_ BitVec 32))

(assert (=> b!535915 (= res!331115 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245934 #b00000000000000000000000000000000) (bvslt lt!245934 (size!16679 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535915 (= lt!245934 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535916 () Bool)

(assert (=> b!535916 (= e!311213 false)))

(declare-fun lt!245933 () SeekEntryResult!4773)

(assert (=> b!535916 (= lt!245933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245934 (select (arr!16315 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535917 () Bool)

(declare-fun res!331118 () Bool)

(assert (=> b!535917 (=> (not res!331118) (not e!311212))))

(declare-datatypes ((List!10434 0))(
  ( (Nil!10431) (Cons!10430 (h!11373 (_ BitVec 64)) (t!16662 List!10434)) )
))
(declare-fun arrayNoDuplicates!0 (array!33952 (_ BitVec 32) List!10434) Bool)

(assert (=> b!535917 (= res!331118 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10431))))

(declare-fun b!535918 () Bool)

(declare-fun res!331125 () Bool)

(assert (=> b!535918 (=> (not res!331125) (not e!311211))))

(assert (=> b!535918 (= res!331125 (and (not (= (select (arr!16315 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16315 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16315 a!3154) index!1177) (select (arr!16315 a!3154) j!147)))))))

(declare-fun res!331117 () Bool)

(assert (=> start!48740 (=> (not res!331117) (not e!311214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48740 (= res!331117 (validMask!0 mask!3216))))

(assert (=> start!48740 e!311214))

(assert (=> start!48740 true))

(declare-fun array_inv!12111 (array!33952) Bool)

(assert (=> start!48740 (array_inv!12111 a!3154)))

(declare-fun b!535914 () Bool)

(declare-fun res!331123 () Bool)

(assert (=> b!535914 (=> (not res!331123) (not e!311214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535914 (= res!331123 (validKeyInArray!0 (select (arr!16315 a!3154) j!147)))))

(declare-fun b!535919 () Bool)

(declare-fun res!331127 () Bool)

(assert (=> b!535919 (=> (not res!331127) (not e!311214))))

(assert (=> b!535919 (= res!331127 (validKeyInArray!0 k0!1998))))

(declare-fun b!535920 () Bool)

(declare-fun res!331126 () Bool)

(assert (=> b!535920 (=> (not res!331126) (not e!311212))))

(assert (=> b!535920 (= res!331126 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16679 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16679 a!3154)) (= (select (arr!16315 a!3154) resIndex!32) (select (arr!16315 a!3154) j!147))))))

(declare-fun b!535921 () Bool)

(declare-fun res!331116 () Bool)

(assert (=> b!535921 (=> (not res!331116) (not e!311211))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535921 (= res!331116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16315 a!3154) j!147) mask!3216) (select (arr!16315 a!3154) j!147) a!3154 mask!3216) lt!245935))))

(declare-fun b!535922 () Bool)

(declare-fun res!331119 () Bool)

(assert (=> b!535922 (=> (not res!331119) (not e!311214))))

(assert (=> b!535922 (= res!331119 (and (= (size!16679 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16679 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16679 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48740 res!331117) b!535922))

(assert (= (and b!535922 res!331119) b!535914))

(assert (= (and b!535914 res!331123) b!535919))

(assert (= (and b!535919 res!331127) b!535913))

(assert (= (and b!535913 res!331121) b!535911))

(assert (= (and b!535911 res!331124) b!535910))

(assert (= (and b!535910 res!331120) b!535917))

(assert (= (and b!535917 res!331118) b!535920))

(assert (= (and b!535920 res!331126) b!535912))

(assert (= (and b!535912 res!331122) b!535921))

(assert (= (and b!535921 res!331116) b!535918))

(assert (= (and b!535918 res!331125) b!535915))

(assert (= (and b!535915 res!331115) b!535916))

(declare-fun m!515417 () Bool)

(assert (=> b!535913 m!515417))

(declare-fun m!515419 () Bool)

(assert (=> b!535914 m!515419))

(assert (=> b!535914 m!515419))

(declare-fun m!515421 () Bool)

(assert (=> b!535914 m!515421))

(declare-fun m!515423 () Bool)

(assert (=> b!535917 m!515423))

(declare-fun m!515425 () Bool)

(assert (=> b!535918 m!515425))

(assert (=> b!535918 m!515419))

(assert (=> b!535912 m!515419))

(assert (=> b!535912 m!515419))

(declare-fun m!515427 () Bool)

(assert (=> b!535912 m!515427))

(assert (=> b!535921 m!515419))

(assert (=> b!535921 m!515419))

(declare-fun m!515429 () Bool)

(assert (=> b!535921 m!515429))

(assert (=> b!535921 m!515429))

(assert (=> b!535921 m!515419))

(declare-fun m!515431 () Bool)

(assert (=> b!535921 m!515431))

(assert (=> b!535916 m!515419))

(assert (=> b!535916 m!515419))

(declare-fun m!515433 () Bool)

(assert (=> b!535916 m!515433))

(declare-fun m!515435 () Bool)

(assert (=> start!48740 m!515435))

(declare-fun m!515437 () Bool)

(assert (=> start!48740 m!515437))

(declare-fun m!515439 () Bool)

(assert (=> b!535919 m!515439))

(declare-fun m!515441 () Bool)

(assert (=> b!535910 m!515441))

(declare-fun m!515443 () Bool)

(assert (=> b!535920 m!515443))

(assert (=> b!535920 m!515419))

(declare-fun m!515445 () Bool)

(assert (=> b!535915 m!515445))

(declare-fun m!515447 () Bool)

(assert (=> b!535911 m!515447))

(check-sat (not b!535914) (not start!48740) (not b!535913) (not b!535921) (not b!535912) (not b!535911) (not b!535917) (not b!535916) (not b!535919) (not b!535910) (not b!535915))
(check-sat)
