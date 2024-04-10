; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48842 () Bool)

(assert start!48842)

(declare-fun b!537899 () Bool)

(declare-fun res!333108 () Bool)

(declare-fun e!311977 () Bool)

(assert (=> b!537899 (=> (not res!333108) (not e!311977))))

(declare-datatypes ((SeekEntryResult!4824 0))(
  ( (MissingZero!4824 (index!21520 (_ BitVec 32))) (Found!4824 (index!21521 (_ BitVec 32))) (Intermediate!4824 (undefined!5636 Bool) (index!21522 (_ BitVec 32)) (x!50447 (_ BitVec 32))) (Undefined!4824) (MissingVacant!4824 (index!21523 (_ BitVec 32))) )
))
(declare-fun lt!246544 () SeekEntryResult!4824)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34054 0))(
  ( (array!34055 (arr!16366 (Array (_ BitVec 32) (_ BitVec 64))) (size!16730 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34054)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34054 (_ BitVec 32)) SeekEntryResult!4824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537899 (= res!333108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16366 a!3154) j!147) mask!3216) (select (arr!16366 a!3154) j!147) a!3154 mask!3216) lt!246544))))

(declare-fun b!537900 () Bool)

(declare-fun res!333105 () Bool)

(declare-fun e!311976 () Bool)

(assert (=> b!537900 (=> (not res!333105) (not e!311976))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537900 (= res!333105 (validKeyInArray!0 k0!1998))))

(declare-fun b!537901 () Bool)

(declare-fun e!311975 () Bool)

(assert (=> b!537901 (= e!311977 e!311975)))

(declare-fun res!333109 () Bool)

(assert (=> b!537901 (=> (not res!333109) (not e!311975))))

(declare-fun lt!246546 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537901 (= res!333109 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246546 #b00000000000000000000000000000000) (bvslt lt!246546 (size!16730 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537901 (= lt!246546 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537902 () Bool)

(declare-fun res!333116 () Bool)

(declare-fun e!311978 () Bool)

(assert (=> b!537902 (=> (not res!333116) (not e!311978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34054 (_ BitVec 32)) Bool)

(assert (=> b!537902 (= res!333116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537903 () Bool)

(assert (=> b!537903 (= e!311978 e!311977)))

(declare-fun res!333113 () Bool)

(assert (=> b!537903 (=> (not res!333113) (not e!311977))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537903 (= res!333113 (= lt!246544 (Intermediate!4824 false resIndex!32 resX!32)))))

(assert (=> b!537903 (= lt!246544 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16366 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537904 () Bool)

(assert (=> b!537904 (= e!311976 e!311978)))

(declare-fun res!333112 () Bool)

(assert (=> b!537904 (=> (not res!333112) (not e!311978))))

(declare-fun lt!246547 () SeekEntryResult!4824)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537904 (= res!333112 (or (= lt!246547 (MissingZero!4824 i!1153)) (= lt!246547 (MissingVacant!4824 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34054 (_ BitVec 32)) SeekEntryResult!4824)

(assert (=> b!537904 (= lt!246547 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537905 () Bool)

(declare-fun res!333114 () Bool)

(assert (=> b!537905 (=> (not res!333114) (not e!311976))))

(assert (=> b!537905 (= res!333114 (validKeyInArray!0 (select (arr!16366 a!3154) j!147)))))

(declare-fun b!537906 () Bool)

(declare-fun res!333110 () Bool)

(assert (=> b!537906 (=> (not res!333110) (not e!311976))))

(assert (=> b!537906 (= res!333110 (and (= (size!16730 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16730 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16730 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537907 () Bool)

(declare-fun res!333106 () Bool)

(assert (=> b!537907 (=> (not res!333106) (not e!311978))))

(assert (=> b!537907 (= res!333106 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16730 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16730 a!3154)) (= (select (arr!16366 a!3154) resIndex!32) (select (arr!16366 a!3154) j!147))))))

(declare-fun b!537908 () Bool)

(declare-fun res!333111 () Bool)

(assert (=> b!537908 (=> (not res!333111) (not e!311978))))

(declare-datatypes ((List!10485 0))(
  ( (Nil!10482) (Cons!10481 (h!11424 (_ BitVec 64)) (t!16713 List!10485)) )
))
(declare-fun arrayNoDuplicates!0 (array!34054 (_ BitVec 32) List!10485) Bool)

(assert (=> b!537908 (= res!333111 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10482))))

(declare-fun b!537909 () Bool)

(assert (=> b!537909 (= e!311975 false)))

(declare-fun lt!246545 () SeekEntryResult!4824)

(assert (=> b!537909 (= lt!246545 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246546 (select (arr!16366 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333107 () Bool)

(assert (=> start!48842 (=> (not res!333107) (not e!311976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48842 (= res!333107 (validMask!0 mask!3216))))

(assert (=> start!48842 e!311976))

(assert (=> start!48842 true))

(declare-fun array_inv!12162 (array!34054) Bool)

(assert (=> start!48842 (array_inv!12162 a!3154)))

(declare-fun b!537910 () Bool)

(declare-fun res!333115 () Bool)

(assert (=> b!537910 (=> (not res!333115) (not e!311976))))

(declare-fun arrayContainsKey!0 (array!34054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537910 (= res!333115 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537911 () Bool)

(declare-fun res!333104 () Bool)

(assert (=> b!537911 (=> (not res!333104) (not e!311977))))

(assert (=> b!537911 (= res!333104 (and (not (= (select (arr!16366 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16366 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16366 a!3154) index!1177) (select (arr!16366 a!3154) j!147)))))))

(assert (= (and start!48842 res!333107) b!537906))

(assert (= (and b!537906 res!333110) b!537905))

(assert (= (and b!537905 res!333114) b!537900))

(assert (= (and b!537900 res!333105) b!537910))

(assert (= (and b!537910 res!333115) b!537904))

(assert (= (and b!537904 res!333112) b!537902))

(assert (= (and b!537902 res!333116) b!537908))

(assert (= (and b!537908 res!333111) b!537907))

(assert (= (and b!537907 res!333106) b!537903))

(assert (= (and b!537903 res!333113) b!537899))

(assert (= (and b!537899 res!333108) b!537911))

(assert (= (and b!537911 res!333104) b!537901))

(assert (= (and b!537901 res!333109) b!537909))

(declare-fun m!517049 () Bool)

(assert (=> b!537910 m!517049))

(declare-fun m!517051 () Bool)

(assert (=> b!537899 m!517051))

(assert (=> b!537899 m!517051))

(declare-fun m!517053 () Bool)

(assert (=> b!537899 m!517053))

(assert (=> b!537899 m!517053))

(assert (=> b!537899 m!517051))

(declare-fun m!517055 () Bool)

(assert (=> b!537899 m!517055))

(declare-fun m!517057 () Bool)

(assert (=> b!537911 m!517057))

(assert (=> b!537911 m!517051))

(declare-fun m!517059 () Bool)

(assert (=> b!537900 m!517059))

(declare-fun m!517061 () Bool)

(assert (=> b!537901 m!517061))

(declare-fun m!517063 () Bool)

(assert (=> b!537904 m!517063))

(assert (=> b!537905 m!517051))

(assert (=> b!537905 m!517051))

(declare-fun m!517065 () Bool)

(assert (=> b!537905 m!517065))

(assert (=> b!537909 m!517051))

(assert (=> b!537909 m!517051))

(declare-fun m!517067 () Bool)

(assert (=> b!537909 m!517067))

(declare-fun m!517069 () Bool)

(assert (=> start!48842 m!517069))

(declare-fun m!517071 () Bool)

(assert (=> start!48842 m!517071))

(declare-fun m!517073 () Bool)

(assert (=> b!537907 m!517073))

(assert (=> b!537907 m!517051))

(declare-fun m!517075 () Bool)

(assert (=> b!537902 m!517075))

(declare-fun m!517077 () Bool)

(assert (=> b!537908 m!517077))

(assert (=> b!537903 m!517051))

(assert (=> b!537903 m!517051))

(declare-fun m!517079 () Bool)

(assert (=> b!537903 m!517079))

(check-sat (not b!537899) (not b!537904) (not b!537903) (not b!537908) (not b!537910) (not start!48842) (not b!537909) (not b!537901) (not b!537902) (not b!537900) (not b!537905))
(check-sat)
