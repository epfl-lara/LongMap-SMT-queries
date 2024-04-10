; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86550 () Bool)

(assert start!86550)

(declare-fun b!1003149 () Bool)

(declare-fun res!672641 () Bool)

(declare-fun e!565046 () Bool)

(assert (=> b!1003149 (=> (not res!672641) (not e!565046))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003149 (= res!672641 (validKeyInArray!0 k!2224))))

(declare-fun b!1003150 () Bool)

(declare-fun res!672628 () Bool)

(declare-fun e!565042 () Bool)

(assert (=> b!1003150 (=> (not res!672628) (not e!565042))))

(declare-datatypes ((array!63351 0))(
  ( (array!63352 (arr!30501 (Array (_ BitVec 32) (_ BitVec 64))) (size!31003 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63351)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003150 (= res!672628 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31003 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31003 a!3219))))))

(declare-fun b!1003151 () Bool)

(declare-fun res!672636 () Bool)

(declare-fun e!565044 () Bool)

(assert (=> b!1003151 (=> (not res!672636) (not e!565044))))

(declare-datatypes ((SeekEntryResult!9433 0))(
  ( (MissingZero!9433 (index!40103 (_ BitVec 32))) (Found!9433 (index!40104 (_ BitVec 32))) (Intermediate!9433 (undefined!10245 Bool) (index!40105 (_ BitVec 32)) (x!87509 (_ BitVec 32))) (Undefined!9433) (MissingVacant!9433 (index!40106 (_ BitVec 32))) )
))
(declare-fun lt!443534 () SeekEntryResult!9433)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443531 () array!63351)

(declare-fun lt!443535 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63351 (_ BitVec 32)) SeekEntryResult!9433)

(assert (=> b!1003151 (= res!672636 (not (= lt!443534 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443535 lt!443531 mask!3464))))))

(declare-fun b!1003152 () Bool)

(declare-fun e!565047 () Bool)

(assert (=> b!1003152 (= e!565047 false)))

(declare-fun lt!443537 () (_ BitVec 32))

(declare-fun lt!443530 () SeekEntryResult!9433)

(assert (=> b!1003152 (= lt!443530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443537 lt!443535 lt!443531 mask!3464))))

(declare-fun b!1003153 () Bool)

(declare-fun res!672631 () Bool)

(assert (=> b!1003153 (=> (not res!672631) (not e!565046))))

(declare-fun arrayContainsKey!0 (array!63351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003153 (= res!672631 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003154 () Bool)

(declare-fun res!672633 () Bool)

(assert (=> b!1003154 (=> (not res!672633) (not e!565046))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003154 (= res!672633 (and (= (size!31003 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31003 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31003 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003155 () Bool)

(declare-fun res!672637 () Bool)

(assert (=> b!1003155 (=> (not res!672637) (not e!565046))))

(assert (=> b!1003155 (= res!672637 (validKeyInArray!0 (select (arr!30501 a!3219) j!170)))))

(declare-fun b!1003156 () Bool)

(declare-fun res!672639 () Bool)

(assert (=> b!1003156 (=> (not res!672639) (not e!565044))))

(assert (=> b!1003156 (= res!672639 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003157 () Bool)

(declare-fun res!672635 () Bool)

(assert (=> b!1003157 (=> (not res!672635) (not e!565042))))

(declare-datatypes ((List!21177 0))(
  ( (Nil!21174) (Cons!21173 (h!22350 (_ BitVec 64)) (t!30178 List!21177)) )
))
(declare-fun arrayNoDuplicates!0 (array!63351 (_ BitVec 32) List!21177) Bool)

(assert (=> b!1003157 (= res!672635 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21174))))

(declare-fun b!1003158 () Bool)

(assert (=> b!1003158 (= e!565044 e!565047)))

(declare-fun res!672629 () Bool)

(assert (=> b!1003158 (=> (not res!672629) (not e!565047))))

(assert (=> b!1003158 (= res!672629 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443537 #b00000000000000000000000000000000) (bvslt lt!443537 (size!31003 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003158 (= lt!443537 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003159 () Bool)

(assert (=> b!1003159 (= e!565046 e!565042)))

(declare-fun res!672627 () Bool)

(assert (=> b!1003159 (=> (not res!672627) (not e!565042))))

(declare-fun lt!443536 () SeekEntryResult!9433)

(assert (=> b!1003159 (= res!672627 (or (= lt!443536 (MissingVacant!9433 i!1194)) (= lt!443536 (MissingZero!9433 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63351 (_ BitVec 32)) SeekEntryResult!9433)

(assert (=> b!1003159 (= lt!443536 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003160 () Bool)

(declare-fun e!565043 () Bool)

(declare-fun e!565048 () Bool)

(assert (=> b!1003160 (= e!565043 e!565048)))

(declare-fun res!672634 () Bool)

(assert (=> b!1003160 (=> (not res!672634) (not e!565048))))

(declare-fun lt!443533 () SeekEntryResult!9433)

(assert (=> b!1003160 (= res!672634 (= lt!443534 lt!443533))))

(assert (=> b!1003160 (= lt!443534 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003161 () Bool)

(assert (=> b!1003161 (= e!565042 e!565043)))

(declare-fun res!672638 () Bool)

(assert (=> b!1003161 (=> (not res!672638) (not e!565043))))

(declare-fun lt!443532 () SeekEntryResult!9433)

(assert (=> b!1003161 (= res!672638 (= lt!443532 lt!443533))))

(assert (=> b!1003161 (= lt!443533 (Intermediate!9433 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003161 (= lt!443532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003162 () Bool)

(declare-fun res!672640 () Bool)

(assert (=> b!1003162 (=> (not res!672640) (not e!565042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63351 (_ BitVec 32)) Bool)

(assert (=> b!1003162 (= res!672640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!672642 () Bool)

(assert (=> start!86550 (=> (not res!672642) (not e!565046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86550 (= res!672642 (validMask!0 mask!3464))))

(assert (=> start!86550 e!565046))

(declare-fun array_inv!23625 (array!63351) Bool)

(assert (=> start!86550 (array_inv!23625 a!3219)))

(assert (=> start!86550 true))

(declare-fun b!1003163 () Bool)

(declare-fun res!672632 () Bool)

(assert (=> b!1003163 (=> (not res!672632) (not e!565047))))

(assert (=> b!1003163 (= res!672632 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443537 (select (arr!30501 a!3219) j!170) a!3219 mask!3464) lt!443533))))

(declare-fun b!1003164 () Bool)

(assert (=> b!1003164 (= e!565048 e!565044)))

(declare-fun res!672630 () Bool)

(assert (=> b!1003164 (=> (not res!672630) (not e!565044))))

(assert (=> b!1003164 (= res!672630 (not (= lt!443532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443535 mask!3464) lt!443535 lt!443531 mask!3464))))))

(assert (=> b!1003164 (= lt!443535 (select (store (arr!30501 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003164 (= lt!443531 (array!63352 (store (arr!30501 a!3219) i!1194 k!2224) (size!31003 a!3219)))))

(assert (= (and start!86550 res!672642) b!1003154))

(assert (= (and b!1003154 res!672633) b!1003155))

(assert (= (and b!1003155 res!672637) b!1003149))

(assert (= (and b!1003149 res!672641) b!1003153))

(assert (= (and b!1003153 res!672631) b!1003159))

(assert (= (and b!1003159 res!672627) b!1003162))

(assert (= (and b!1003162 res!672640) b!1003157))

(assert (= (and b!1003157 res!672635) b!1003150))

(assert (= (and b!1003150 res!672628) b!1003161))

(assert (= (and b!1003161 res!672638) b!1003160))

(assert (= (and b!1003160 res!672634) b!1003164))

(assert (= (and b!1003164 res!672630) b!1003151))

(assert (= (and b!1003151 res!672636) b!1003156))

(assert (= (and b!1003156 res!672639) b!1003158))

(assert (= (and b!1003158 res!672629) b!1003163))

(assert (= (and b!1003163 res!672632) b!1003152))

(declare-fun m!928909 () Bool)

(assert (=> b!1003161 m!928909))

(assert (=> b!1003161 m!928909))

(declare-fun m!928911 () Bool)

(assert (=> b!1003161 m!928911))

(assert (=> b!1003161 m!928911))

(assert (=> b!1003161 m!928909))

(declare-fun m!928913 () Bool)

(assert (=> b!1003161 m!928913))

(declare-fun m!928915 () Bool)

(assert (=> b!1003158 m!928915))

(declare-fun m!928917 () Bool)

(assert (=> b!1003159 m!928917))

(declare-fun m!928919 () Bool)

(assert (=> b!1003153 m!928919))

(declare-fun m!928921 () Bool)

(assert (=> b!1003152 m!928921))

(declare-fun m!928923 () Bool)

(assert (=> b!1003157 m!928923))

(declare-fun m!928925 () Bool)

(assert (=> start!86550 m!928925))

(declare-fun m!928927 () Bool)

(assert (=> start!86550 m!928927))

(declare-fun m!928929 () Bool)

(assert (=> b!1003162 m!928929))

(declare-fun m!928931 () Bool)

(assert (=> b!1003149 m!928931))

(declare-fun m!928933 () Bool)

(assert (=> b!1003164 m!928933))

(assert (=> b!1003164 m!928933))

(declare-fun m!928935 () Bool)

(assert (=> b!1003164 m!928935))

(declare-fun m!928937 () Bool)

(assert (=> b!1003164 m!928937))

(declare-fun m!928939 () Bool)

(assert (=> b!1003164 m!928939))

(assert (=> b!1003160 m!928909))

(assert (=> b!1003160 m!928909))

(declare-fun m!928941 () Bool)

(assert (=> b!1003160 m!928941))

(assert (=> b!1003163 m!928909))

(assert (=> b!1003163 m!928909))

(declare-fun m!928943 () Bool)

(assert (=> b!1003163 m!928943))

(declare-fun m!928945 () Bool)

(assert (=> b!1003151 m!928945))

(assert (=> b!1003155 m!928909))

(assert (=> b!1003155 m!928909))

(declare-fun m!928947 () Bool)

(assert (=> b!1003155 m!928947))

(push 1)

(assert (not b!1003158))

