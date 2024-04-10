; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87196 () Bool)

(assert start!87196)

(declare-fun b!1010940 () Bool)

(declare-fun res!679120 () Bool)

(declare-fun e!568722 () Bool)

(assert (=> b!1010940 (=> (not res!679120) (not e!568722))))

(declare-datatypes ((array!63657 0))(
  ( (array!63658 (arr!30645 (Array (_ BitVec 32) (_ BitVec 64))) (size!31147 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63657)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010940 (= res!679120 (validKeyInArray!0 (select (arr!30645 a!3219) j!170)))))

(declare-fun b!1010941 () Bool)

(declare-fun res!679122 () Bool)

(declare-fun e!568723 () Bool)

(assert (=> b!1010941 (=> (not res!679122) (not e!568723))))

(declare-datatypes ((SeekEntryResult!9577 0))(
  ( (MissingZero!9577 (index!40679 (_ BitVec 32))) (Found!9577 (index!40680 (_ BitVec 32))) (Intermediate!9577 (undefined!10389 Bool) (index!40681 (_ BitVec 32)) (x!88086 (_ BitVec 32))) (Undefined!9577) (MissingVacant!9577 (index!40682 (_ BitVec 32))) )
))
(declare-fun lt!446814 () SeekEntryResult!9577)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!446816 () array!63657)

(declare-fun lt!446817 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63657 (_ BitVec 32)) SeekEntryResult!9577)

(assert (=> b!1010941 (= res!679122 (not (= lt!446814 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446817 lt!446816 mask!3464))))))

(declare-fun b!1010942 () Bool)

(declare-fun e!568724 () Bool)

(assert (=> b!1010942 (= e!568722 e!568724)))

(declare-fun res!679126 () Bool)

(assert (=> b!1010942 (=> (not res!679126) (not e!568724))))

(declare-fun lt!446819 () SeekEntryResult!9577)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010942 (= res!679126 (or (= lt!446819 (MissingVacant!9577 i!1194)) (= lt!446819 (MissingZero!9577 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63657 (_ BitVec 32)) SeekEntryResult!9577)

(assert (=> b!1010942 (= lt!446819 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010943 () Bool)

(declare-fun res!679123 () Bool)

(assert (=> b!1010943 (=> (not res!679123) (not e!568724))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010943 (= res!679123 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31147 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31147 a!3219))))))

(declare-fun b!1010944 () Bool)

(declare-fun res!679132 () Bool)

(assert (=> b!1010944 (=> (not res!679132) (not e!568722))))

(declare-fun arrayContainsKey!0 (array!63657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010944 (= res!679132 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010945 () Bool)

(declare-fun e!568725 () Bool)

(declare-fun e!568721 () Bool)

(assert (=> b!1010945 (= e!568725 e!568721)))

(declare-fun res!679130 () Bool)

(assert (=> b!1010945 (=> (not res!679130) (not e!568721))))

(declare-fun lt!446815 () SeekEntryResult!9577)

(assert (=> b!1010945 (= res!679130 (= lt!446814 lt!446815))))

(assert (=> b!1010945 (= lt!446814 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30645 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010946 () Bool)

(declare-fun e!568720 () Bool)

(assert (=> b!1010946 (= e!568723 e!568720)))

(declare-fun res!679127 () Bool)

(assert (=> b!1010946 (=> (not res!679127) (not e!568720))))

(declare-fun lt!446818 () (_ BitVec 32))

(assert (=> b!1010946 (= res!679127 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446818 #b00000000000000000000000000000000) (bvslt lt!446818 (size!31147 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010946 (= lt!446818 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!679124 () Bool)

(assert (=> start!87196 (=> (not res!679124) (not e!568722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87196 (= res!679124 (validMask!0 mask!3464))))

(assert (=> start!87196 e!568722))

(declare-fun array_inv!23769 (array!63657) Bool)

(assert (=> start!87196 (array_inv!23769 a!3219)))

(assert (=> start!87196 true))

(declare-fun b!1010947 () Bool)

(declare-fun res!679134 () Bool)

(assert (=> b!1010947 (=> (not res!679134) (not e!568722))))

(assert (=> b!1010947 (= res!679134 (validKeyInArray!0 k!2224))))

(declare-fun b!1010948 () Bool)

(declare-fun res!679129 () Bool)

(assert (=> b!1010948 (=> (not res!679129) (not e!568724))))

(declare-datatypes ((List!21321 0))(
  ( (Nil!21318) (Cons!21317 (h!22512 (_ BitVec 64)) (t!30322 List!21321)) )
))
(declare-fun arrayNoDuplicates!0 (array!63657 (_ BitVec 32) List!21321) Bool)

(assert (=> b!1010948 (= res!679129 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21318))))

(declare-fun b!1010949 () Bool)

(declare-fun res!679131 () Bool)

(assert (=> b!1010949 (=> (not res!679131) (not e!568723))))

(assert (=> b!1010949 (= res!679131 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010950 () Bool)

(assert (=> b!1010950 (= e!568720 false)))

(declare-fun lt!446813 () SeekEntryResult!9577)

(assert (=> b!1010950 (= lt!446813 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446818 (select (arr!30645 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010951 () Bool)

(declare-fun res!679125 () Bool)

(assert (=> b!1010951 (=> (not res!679125) (not e!568722))))

(assert (=> b!1010951 (= res!679125 (and (= (size!31147 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31147 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31147 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010952 () Bool)

(declare-fun res!679133 () Bool)

(assert (=> b!1010952 (=> (not res!679133) (not e!568724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63657 (_ BitVec 32)) Bool)

(assert (=> b!1010952 (= res!679133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010953 () Bool)

(assert (=> b!1010953 (= e!568721 e!568723)))

(declare-fun res!679128 () Bool)

(assert (=> b!1010953 (=> (not res!679128) (not e!568723))))

(declare-fun lt!446820 () SeekEntryResult!9577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010953 (= res!679128 (not (= lt!446820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446817 mask!3464) lt!446817 lt!446816 mask!3464))))))

(assert (=> b!1010953 (= lt!446817 (select (store (arr!30645 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010953 (= lt!446816 (array!63658 (store (arr!30645 a!3219) i!1194 k!2224) (size!31147 a!3219)))))

(declare-fun b!1010954 () Bool)

(assert (=> b!1010954 (= e!568724 e!568725)))

(declare-fun res!679121 () Bool)

(assert (=> b!1010954 (=> (not res!679121) (not e!568725))))

(assert (=> b!1010954 (= res!679121 (= lt!446820 lt!446815))))

(assert (=> b!1010954 (= lt!446815 (Intermediate!9577 false resIndex!38 resX!38))))

(assert (=> b!1010954 (= lt!446820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30645 a!3219) j!170) mask!3464) (select (arr!30645 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87196 res!679124) b!1010951))

(assert (= (and b!1010951 res!679125) b!1010940))

(assert (= (and b!1010940 res!679120) b!1010947))

(assert (= (and b!1010947 res!679134) b!1010944))

(assert (= (and b!1010944 res!679132) b!1010942))

(assert (= (and b!1010942 res!679126) b!1010952))

(assert (= (and b!1010952 res!679133) b!1010948))

(assert (= (and b!1010948 res!679129) b!1010943))

(assert (= (and b!1010943 res!679123) b!1010954))

(assert (= (and b!1010954 res!679121) b!1010945))

(assert (= (and b!1010945 res!679130) b!1010953))

(assert (= (and b!1010953 res!679128) b!1010941))

(assert (= (and b!1010941 res!679122) b!1010949))

(assert (= (and b!1010949 res!679131) b!1010946))

(assert (= (and b!1010946 res!679127) b!1010950))

(declare-fun m!935107 () Bool)

(assert (=> b!1010942 m!935107))

(declare-fun m!935109 () Bool)

(assert (=> b!1010944 m!935109))

(declare-fun m!935111 () Bool)

(assert (=> b!1010940 m!935111))

(assert (=> b!1010940 m!935111))

(declare-fun m!935113 () Bool)

(assert (=> b!1010940 m!935113))

(declare-fun m!935115 () Bool)

(assert (=> b!1010948 m!935115))

(assert (=> b!1010945 m!935111))

(assert (=> b!1010945 m!935111))

(declare-fun m!935117 () Bool)

(assert (=> b!1010945 m!935117))

(declare-fun m!935119 () Bool)

(assert (=> b!1010947 m!935119))

(assert (=> b!1010950 m!935111))

(assert (=> b!1010950 m!935111))

(declare-fun m!935121 () Bool)

(assert (=> b!1010950 m!935121))

(declare-fun m!935123 () Bool)

(assert (=> b!1010953 m!935123))

(assert (=> b!1010953 m!935123))

(declare-fun m!935125 () Bool)

(assert (=> b!1010953 m!935125))

(declare-fun m!935127 () Bool)

(assert (=> b!1010953 m!935127))

(declare-fun m!935129 () Bool)

(assert (=> b!1010953 m!935129))

(declare-fun m!935131 () Bool)

(assert (=> b!1010952 m!935131))

(declare-fun m!935133 () Bool)

(assert (=> start!87196 m!935133))

(declare-fun m!935135 () Bool)

(assert (=> start!87196 m!935135))

(declare-fun m!935137 () Bool)

(assert (=> b!1010946 m!935137))

(declare-fun m!935139 () Bool)

(assert (=> b!1010941 m!935139))

(assert (=> b!1010954 m!935111))

(assert (=> b!1010954 m!935111))

(declare-fun m!935141 () Bool)

(assert (=> b!1010954 m!935141))

(assert (=> b!1010954 m!935141))

(assert (=> b!1010954 m!935111))

(declare-fun m!935143 () Bool)

(assert (=> b!1010954 m!935143))

(push 1)

