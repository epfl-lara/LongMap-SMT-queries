; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48728 () Bool)

(assert start!48728)

(declare-fun b!535684 () Bool)

(declare-fun res!330894 () Bool)

(declare-fun e!311126 () Bool)

(assert (=> b!535684 (=> (not res!330894) (not e!311126))))

(declare-datatypes ((SeekEntryResult!4767 0))(
  ( (MissingZero!4767 (index!21292 (_ BitVec 32))) (Found!4767 (index!21293 (_ BitVec 32))) (Intermediate!4767 (undefined!5579 Bool) (index!21294 (_ BitVec 32)) (x!50238 (_ BitVec 32))) (Undefined!4767) (MissingVacant!4767 (index!21295 (_ BitVec 32))) )
))
(declare-fun lt!245868 () SeekEntryResult!4767)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33940 0))(
  ( (array!33941 (arr!16309 (Array (_ BitVec 32) (_ BitVec 64))) (size!16673 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33940)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33940 (_ BitVec 32)) SeekEntryResult!4767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535684 (= res!330894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16309 a!3154) j!147) mask!3216) (select (arr!16309 a!3154) j!147) a!3154 mask!3216) lt!245868))))

(declare-fun res!330898 () Bool)

(declare-fun e!311127 () Bool)

(assert (=> start!48728 (=> (not res!330898) (not e!311127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48728 (= res!330898 (validMask!0 mask!3216))))

(assert (=> start!48728 e!311127))

(assert (=> start!48728 true))

(declare-fun array_inv!12105 (array!33940) Bool)

(assert (=> start!48728 (array_inv!12105 a!3154)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun b!535685 () Bool)

(assert (=> b!535685 (= e!311126 (and (not (= (select (arr!16309 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16309 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16309 a!3154) index!1177) (select (arr!16309 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535686 () Bool)

(declare-fun e!311125 () Bool)

(assert (=> b!535686 (= e!311127 e!311125)))

(declare-fun res!330890 () Bool)

(assert (=> b!535686 (=> (not res!330890) (not e!311125))))

(declare-fun lt!245869 () SeekEntryResult!4767)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535686 (= res!330890 (or (= lt!245869 (MissingZero!4767 i!1153)) (= lt!245869 (MissingVacant!4767 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33940 (_ BitVec 32)) SeekEntryResult!4767)

(assert (=> b!535686 (= lt!245869 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535687 () Bool)

(declare-fun res!330895 () Bool)

(assert (=> b!535687 (=> (not res!330895) (not e!311125))))

(declare-datatypes ((List!10428 0))(
  ( (Nil!10425) (Cons!10424 (h!11367 (_ BitVec 64)) (t!16656 List!10428)) )
))
(declare-fun arrayNoDuplicates!0 (array!33940 (_ BitVec 32) List!10428) Bool)

(assert (=> b!535687 (= res!330895 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10425))))

(declare-fun b!535688 () Bool)

(declare-fun res!330892 () Bool)

(assert (=> b!535688 (=> (not res!330892) (not e!311127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535688 (= res!330892 (validKeyInArray!0 k0!1998))))

(declare-fun b!535689 () Bool)

(declare-fun res!330896 () Bool)

(assert (=> b!535689 (=> (not res!330896) (not e!311127))))

(declare-fun arrayContainsKey!0 (array!33940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535689 (= res!330896 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535690 () Bool)

(declare-fun res!330899 () Bool)

(assert (=> b!535690 (=> (not res!330899) (not e!311125))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535690 (= res!330899 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16673 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16673 a!3154)) (= (select (arr!16309 a!3154) resIndex!32) (select (arr!16309 a!3154) j!147))))))

(declare-fun b!535691 () Bool)

(declare-fun res!330893 () Bool)

(assert (=> b!535691 (=> (not res!330893) (not e!311127))))

(assert (=> b!535691 (= res!330893 (and (= (size!16673 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16673 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16673 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535692 () Bool)

(declare-fun res!330889 () Bool)

(assert (=> b!535692 (=> (not res!330889) (not e!311125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33940 (_ BitVec 32)) Bool)

(assert (=> b!535692 (= res!330889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535693 () Bool)

(declare-fun res!330891 () Bool)

(assert (=> b!535693 (=> (not res!330891) (not e!311127))))

(assert (=> b!535693 (= res!330891 (validKeyInArray!0 (select (arr!16309 a!3154) j!147)))))

(declare-fun b!535694 () Bool)

(assert (=> b!535694 (= e!311125 e!311126)))

(declare-fun res!330897 () Bool)

(assert (=> b!535694 (=> (not res!330897) (not e!311126))))

(assert (=> b!535694 (= res!330897 (= lt!245868 (Intermediate!4767 false resIndex!32 resX!32)))))

(assert (=> b!535694 (= lt!245868 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16309 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48728 res!330898) b!535691))

(assert (= (and b!535691 res!330893) b!535693))

(assert (= (and b!535693 res!330891) b!535688))

(assert (= (and b!535688 res!330892) b!535689))

(assert (= (and b!535689 res!330896) b!535686))

(assert (= (and b!535686 res!330890) b!535692))

(assert (= (and b!535692 res!330889) b!535687))

(assert (= (and b!535687 res!330895) b!535690))

(assert (= (and b!535690 res!330899) b!535694))

(assert (= (and b!535694 res!330897) b!535684))

(assert (= (and b!535684 res!330894) b!535685))

(declare-fun m!515233 () Bool)

(assert (=> b!535693 m!515233))

(assert (=> b!535693 m!515233))

(declare-fun m!515235 () Bool)

(assert (=> b!535693 m!515235))

(assert (=> b!535694 m!515233))

(assert (=> b!535694 m!515233))

(declare-fun m!515237 () Bool)

(assert (=> b!535694 m!515237))

(declare-fun m!515239 () Bool)

(assert (=> b!535689 m!515239))

(declare-fun m!515241 () Bool)

(assert (=> b!535687 m!515241))

(declare-fun m!515243 () Bool)

(assert (=> b!535690 m!515243))

(assert (=> b!535690 m!515233))

(declare-fun m!515245 () Bool)

(assert (=> b!535686 m!515245))

(declare-fun m!515247 () Bool)

(assert (=> b!535692 m!515247))

(declare-fun m!515249 () Bool)

(assert (=> start!48728 m!515249))

(declare-fun m!515251 () Bool)

(assert (=> start!48728 m!515251))

(assert (=> b!535684 m!515233))

(assert (=> b!535684 m!515233))

(declare-fun m!515253 () Bool)

(assert (=> b!535684 m!515253))

(assert (=> b!535684 m!515253))

(assert (=> b!535684 m!515233))

(declare-fun m!515255 () Bool)

(assert (=> b!535684 m!515255))

(declare-fun m!515257 () Bool)

(assert (=> b!535688 m!515257))

(declare-fun m!515259 () Bool)

(assert (=> b!535685 m!515259))

(assert (=> b!535685 m!515233))

(check-sat (not start!48728) (not b!535689) (not b!535686) (not b!535693) (not b!535688) (not b!535687) (not b!535684) (not b!535694) (not b!535692))
(check-sat)
