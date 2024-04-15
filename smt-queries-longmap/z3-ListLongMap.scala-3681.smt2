; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50690 () Bool)

(assert start!50690)

(declare-fun b!554191 () Bool)

(declare-fun res!346749 () Bool)

(declare-fun e!319533 () Bool)

(assert (=> b!554191 (=> (not res!346749) (not e!319533))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554191 (= res!346749 (validKeyInArray!0 k0!1914))))

(declare-fun b!554192 () Bool)

(declare-fun e!319531 () Bool)

(assert (=> b!554192 (= e!319531 (not true))))

(declare-fun e!319530 () Bool)

(assert (=> b!554192 e!319530))

(declare-fun res!346752 () Bool)

(assert (=> b!554192 (=> (not res!346752) (not e!319530))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34924 0))(
  ( (array!34925 (arr!16772 (Array (_ BitVec 32) (_ BitVec 64))) (size!17137 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34924)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34924 (_ BitVec 32)) Bool)

(assert (=> b!554192 (= res!346752 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17196 0))(
  ( (Unit!17197) )
))
(declare-fun lt!251562 () Unit!17196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17196)

(assert (=> b!554192 (= lt!251562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554193 () Bool)

(declare-fun res!346747 () Bool)

(assert (=> b!554193 (=> (not res!346747) (not e!319531))))

(assert (=> b!554193 (= res!346747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554194 () Bool)

(declare-fun res!346751 () Bool)

(assert (=> b!554194 (=> (not res!346751) (not e!319533))))

(assert (=> b!554194 (= res!346751 (validKeyInArray!0 (select (arr!16772 a!3118) j!142)))))

(declare-fun res!346746 () Bool)

(assert (=> start!50690 (=> (not res!346746) (not e!319533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50690 (= res!346746 (validMask!0 mask!3119))))

(assert (=> start!50690 e!319533))

(assert (=> start!50690 true))

(declare-fun array_inv!12655 (array!34924) Bool)

(assert (=> start!50690 (array_inv!12655 a!3118)))

(declare-fun b!554195 () Bool)

(declare-datatypes ((SeekEntryResult!5218 0))(
  ( (MissingZero!5218 (index!23099 (_ BitVec 32))) (Found!5218 (index!23100 (_ BitVec 32))) (Intermediate!5218 (undefined!6030 Bool) (index!23101 (_ BitVec 32)) (x!52023 (_ BitVec 32))) (Undefined!5218) (MissingVacant!5218 (index!23102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34924 (_ BitVec 32)) SeekEntryResult!5218)

(assert (=> b!554195 (= e!319530 (= (seekEntryOrOpen!0 (select (arr!16772 a!3118) j!142) a!3118 mask!3119) (Found!5218 j!142)))))

(declare-fun b!554196 () Bool)

(declare-fun res!346745 () Bool)

(assert (=> b!554196 (=> (not res!346745) (not e!319533))))

(declare-fun arrayContainsKey!0 (array!34924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554196 (= res!346745 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554197 () Bool)

(declare-fun res!346753 () Bool)

(assert (=> b!554197 (=> (not res!346753) (not e!319531))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34924 (_ BitVec 32)) SeekEntryResult!5218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554197 (= res!346753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16772 a!3118) j!142) mask!3119) (select (arr!16772 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16772 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16772 a!3118) i!1132 k0!1914) j!142) (array!34925 (store (arr!16772 a!3118) i!1132 k0!1914) (size!17137 a!3118)) mask!3119)))))

(declare-fun b!554198 () Bool)

(declare-fun res!346748 () Bool)

(assert (=> b!554198 (=> (not res!346748) (not e!319531))))

(declare-datatypes ((List!10891 0))(
  ( (Nil!10888) (Cons!10887 (h!11872 (_ BitVec 64)) (t!17110 List!10891)) )
))
(declare-fun arrayNoDuplicates!0 (array!34924 (_ BitVec 32) List!10891) Bool)

(assert (=> b!554198 (= res!346748 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10888))))

(declare-fun b!554199 () Bool)

(assert (=> b!554199 (= e!319533 e!319531)))

(declare-fun res!346754 () Bool)

(assert (=> b!554199 (=> (not res!346754) (not e!319531))))

(declare-fun lt!251563 () SeekEntryResult!5218)

(assert (=> b!554199 (= res!346754 (or (= lt!251563 (MissingZero!5218 i!1132)) (= lt!251563 (MissingVacant!5218 i!1132))))))

(assert (=> b!554199 (= lt!251563 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554200 () Bool)

(declare-fun res!346750 () Bool)

(assert (=> b!554200 (=> (not res!346750) (not e!319533))))

(assert (=> b!554200 (= res!346750 (and (= (size!17137 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17137 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17137 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50690 res!346746) b!554200))

(assert (= (and b!554200 res!346750) b!554194))

(assert (= (and b!554194 res!346751) b!554191))

(assert (= (and b!554191 res!346749) b!554196))

(assert (= (and b!554196 res!346745) b!554199))

(assert (= (and b!554199 res!346754) b!554193))

(assert (= (and b!554193 res!346747) b!554198))

(assert (= (and b!554198 res!346748) b!554197))

(assert (= (and b!554197 res!346753) b!554192))

(assert (= (and b!554192 res!346752) b!554195))

(declare-fun m!530993 () Bool)

(assert (=> b!554192 m!530993))

(declare-fun m!530995 () Bool)

(assert (=> b!554192 m!530995))

(declare-fun m!530997 () Bool)

(assert (=> b!554196 m!530997))

(declare-fun m!530999 () Bool)

(assert (=> b!554194 m!530999))

(assert (=> b!554194 m!530999))

(declare-fun m!531001 () Bool)

(assert (=> b!554194 m!531001))

(declare-fun m!531003 () Bool)

(assert (=> b!554191 m!531003))

(declare-fun m!531005 () Bool)

(assert (=> b!554199 m!531005))

(declare-fun m!531007 () Bool)

(assert (=> b!554198 m!531007))

(declare-fun m!531009 () Bool)

(assert (=> b!554193 m!531009))

(assert (=> b!554195 m!530999))

(assert (=> b!554195 m!530999))

(declare-fun m!531011 () Bool)

(assert (=> b!554195 m!531011))

(assert (=> b!554197 m!530999))

(declare-fun m!531013 () Bool)

(assert (=> b!554197 m!531013))

(assert (=> b!554197 m!530999))

(declare-fun m!531015 () Bool)

(assert (=> b!554197 m!531015))

(declare-fun m!531017 () Bool)

(assert (=> b!554197 m!531017))

(assert (=> b!554197 m!531015))

(declare-fun m!531019 () Bool)

(assert (=> b!554197 m!531019))

(assert (=> b!554197 m!531013))

(assert (=> b!554197 m!530999))

(declare-fun m!531021 () Bool)

(assert (=> b!554197 m!531021))

(declare-fun m!531023 () Bool)

(assert (=> b!554197 m!531023))

(assert (=> b!554197 m!531015))

(assert (=> b!554197 m!531017))

(declare-fun m!531025 () Bool)

(assert (=> start!50690 m!531025))

(declare-fun m!531027 () Bool)

(assert (=> start!50690 m!531027))

(check-sat (not b!554197) (not b!554198) (not b!554196) (not start!50690) (not b!554195) (not b!554199) (not b!554194) (not b!554191) (not b!554193) (not b!554192))
(check-sat)
