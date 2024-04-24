; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48928 () Bool)

(assert start!48928)

(declare-fun b!538879 () Bool)

(declare-fun res!333989 () Bool)

(declare-fun e!312481 () Bool)

(assert (=> b!538879 (=> (not res!333989) (not e!312481))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538879 (= res!333989 (validKeyInArray!0 k0!1998))))

(declare-fun b!538880 () Bool)

(declare-fun res!333988 () Bool)

(assert (=> b!538880 (=> (not res!333988) (not e!312481))))

(declare-datatypes ((array!34088 0))(
  ( (array!34089 (arr!16381 (Array (_ BitVec 32) (_ BitVec 64))) (size!16745 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34088)

(declare-fun arrayContainsKey!0 (array!34088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538880 (= res!333988 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538881 () Bool)

(declare-fun res!333985 () Bool)

(assert (=> b!538881 (=> (not res!333985) (not e!312481))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538881 (= res!333985 (and (= (size!16745 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16745 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16745 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538882 () Bool)

(declare-fun res!333979 () Bool)

(declare-fun e!312486 () Bool)

(assert (=> b!538882 (=> (not res!333979) (not e!312486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34088 (_ BitVec 32)) Bool)

(assert (=> b!538882 (= res!333979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538883 () Bool)

(declare-fun e!312480 () Bool)

(declare-fun e!312483 () Bool)

(assert (=> b!538883 (= e!312480 e!312483)))

(declare-fun res!333980 () Bool)

(assert (=> b!538883 (=> (not res!333980) (not e!312483))))

(declare-datatypes ((SeekEntryResult!4795 0))(
  ( (MissingZero!4795 (index!21404 (_ BitVec 32))) (Found!4795 (index!21405 (_ BitVec 32))) (Intermediate!4795 (undefined!5607 Bool) (index!21406 (_ BitVec 32)) (x!50477 (_ BitVec 32))) (Undefined!4795) (MissingVacant!4795 (index!21407 (_ BitVec 32))) )
))
(declare-fun lt!247007 () SeekEntryResult!4795)

(declare-fun lt!247008 () SeekEntryResult!4795)

(declare-fun lt!247012 () SeekEntryResult!4795)

(assert (=> b!538883 (= res!333980 (and (= lt!247007 lt!247012) (= lt!247008 lt!247007)))))

(declare-fun lt!247006 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34088 (_ BitVec 32)) SeekEntryResult!4795)

(assert (=> b!538883 (= lt!247007 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247006 (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538884 () Bool)

(declare-fun e!312484 () Bool)

(declare-fun e!312482 () Bool)

(assert (=> b!538884 (= e!312484 e!312482)))

(declare-fun res!333990 () Bool)

(assert (=> b!538884 (=> (not res!333990) (not e!312482))))

(declare-fun lt!247009 () SeekEntryResult!4795)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538884 (= res!333990 (and (= lt!247008 lt!247009) (not (= (select (arr!16381 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16381 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16381 a!3154) index!1177) (select (arr!16381 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538884 (= lt!247008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16381 a!3154) j!147) mask!3216) (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538885 () Bool)

(assert (=> b!538885 (= e!312483 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110))))))

(assert (=> b!538885 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247006 (select (store (arr!16381 a!3154) i!1153 k0!1998) j!147) (array!34089 (store (arr!16381 a!3154) i!1153 k0!1998) (size!16745 a!3154)) mask!3216) lt!247012)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16847 0))(
  ( (Unit!16848) )
))
(declare-fun lt!247011 () Unit!16847)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34088 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16847)

(assert (=> b!538885 (= lt!247011 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!247006 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538886 () Bool)

(declare-fun res!333987 () Bool)

(assert (=> b!538886 (=> (not res!333987) (not e!312486))))

(assert (=> b!538886 (= res!333987 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16745 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16745 a!3154)) (= (select (arr!16381 a!3154) resIndex!32) (select (arr!16381 a!3154) j!147))))))

(declare-fun b!538887 () Bool)

(declare-fun res!333986 () Bool)

(assert (=> b!538887 (=> (not res!333986) (not e!312486))))

(declare-datatypes ((List!10407 0))(
  ( (Nil!10404) (Cons!10403 (h!11349 (_ BitVec 64)) (t!16627 List!10407)) )
))
(declare-fun arrayNoDuplicates!0 (array!34088 (_ BitVec 32) List!10407) Bool)

(assert (=> b!538887 (= res!333986 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10404))))

(declare-fun b!538888 () Bool)

(assert (=> b!538888 (= e!312481 e!312486)))

(declare-fun res!333983 () Bool)

(assert (=> b!538888 (=> (not res!333983) (not e!312486))))

(declare-fun lt!247010 () SeekEntryResult!4795)

(assert (=> b!538888 (= res!333983 (or (= lt!247010 (MissingZero!4795 i!1153)) (= lt!247010 (MissingVacant!4795 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34088 (_ BitVec 32)) SeekEntryResult!4795)

(assert (=> b!538888 (= lt!247010 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538890 () Bool)

(assert (=> b!538890 (= e!312482 e!312480)))

(declare-fun res!333982 () Bool)

(assert (=> b!538890 (=> (not res!333982) (not e!312480))))

(assert (=> b!538890 (= res!333982 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!247006 #b00000000000000000000000000000000) (bvslt lt!247006 (size!16745 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538890 (= lt!247006 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538891 () Bool)

(assert (=> b!538891 (= e!312486 e!312484)))

(declare-fun res!333984 () Bool)

(assert (=> b!538891 (=> (not res!333984) (not e!312484))))

(assert (=> b!538891 (= res!333984 (= lt!247009 lt!247012))))

(assert (=> b!538891 (= lt!247012 (Intermediate!4795 false resIndex!32 resX!32))))

(assert (=> b!538891 (= lt!247009 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333991 () Bool)

(assert (=> start!48928 (=> (not res!333991) (not e!312481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48928 (= res!333991 (validMask!0 mask!3216))))

(assert (=> start!48928 e!312481))

(assert (=> start!48928 true))

(declare-fun array_inv!12240 (array!34088) Bool)

(assert (=> start!48928 (array_inv!12240 a!3154)))

(declare-fun b!538889 () Bool)

(declare-fun res!333981 () Bool)

(assert (=> b!538889 (=> (not res!333981) (not e!312481))))

(assert (=> b!538889 (= res!333981 (validKeyInArray!0 (select (arr!16381 a!3154) j!147)))))

(assert (= (and start!48928 res!333991) b!538881))

(assert (= (and b!538881 res!333985) b!538889))

(assert (= (and b!538889 res!333981) b!538879))

(assert (= (and b!538879 res!333989) b!538880))

(assert (= (and b!538880 res!333988) b!538888))

(assert (= (and b!538888 res!333983) b!538882))

(assert (= (and b!538882 res!333979) b!538887))

(assert (= (and b!538887 res!333986) b!538886))

(assert (= (and b!538886 res!333987) b!538891))

(assert (= (and b!538891 res!333984) b!538884))

(assert (= (and b!538884 res!333990) b!538890))

(assert (= (and b!538890 res!333982) b!538883))

(assert (= (and b!538883 res!333980) b!538885))

(declare-fun m!518107 () Bool)

(assert (=> b!538888 m!518107))

(declare-fun m!518109 () Bool)

(assert (=> b!538882 m!518109))

(declare-fun m!518111 () Bool)

(assert (=> start!48928 m!518111))

(declare-fun m!518113 () Bool)

(assert (=> start!48928 m!518113))

(declare-fun m!518115 () Bool)

(assert (=> b!538891 m!518115))

(assert (=> b!538891 m!518115))

(declare-fun m!518117 () Bool)

(assert (=> b!538891 m!518117))

(declare-fun m!518119 () Bool)

(assert (=> b!538880 m!518119))

(declare-fun m!518121 () Bool)

(assert (=> b!538885 m!518121))

(declare-fun m!518123 () Bool)

(assert (=> b!538885 m!518123))

(assert (=> b!538885 m!518123))

(declare-fun m!518125 () Bool)

(assert (=> b!538885 m!518125))

(declare-fun m!518127 () Bool)

(assert (=> b!538885 m!518127))

(declare-fun m!518129 () Bool)

(assert (=> b!538879 m!518129))

(declare-fun m!518131 () Bool)

(assert (=> b!538884 m!518131))

(assert (=> b!538884 m!518115))

(assert (=> b!538884 m!518115))

(declare-fun m!518133 () Bool)

(assert (=> b!538884 m!518133))

(assert (=> b!538884 m!518133))

(assert (=> b!538884 m!518115))

(declare-fun m!518135 () Bool)

(assert (=> b!538884 m!518135))

(declare-fun m!518137 () Bool)

(assert (=> b!538890 m!518137))

(assert (=> b!538889 m!518115))

(assert (=> b!538889 m!518115))

(declare-fun m!518139 () Bool)

(assert (=> b!538889 m!518139))

(declare-fun m!518141 () Bool)

(assert (=> b!538887 m!518141))

(assert (=> b!538883 m!518115))

(assert (=> b!538883 m!518115))

(declare-fun m!518143 () Bool)

(assert (=> b!538883 m!518143))

(declare-fun m!518145 () Bool)

(assert (=> b!538886 m!518145))

(assert (=> b!538886 m!518115))

(check-sat (not b!538888) (not b!538882) (not b!538887) (not start!48928) (not b!538890) (not b!538879) (not b!538891) (not b!538885) (not b!538880) (not b!538884) (not b!538889) (not b!538883))
(check-sat)
