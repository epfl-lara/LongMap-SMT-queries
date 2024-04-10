; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50596 () Bool)

(assert start!50596)

(declare-fun b!552854 () Bool)

(declare-fun e!318995 () Bool)

(declare-fun e!318992 () Bool)

(assert (=> b!552854 (= e!318995 e!318992)))

(declare-fun res!345267 () Bool)

(assert (=> b!552854 (=> (not res!345267) (not e!318992))))

(declare-datatypes ((SeekEntryResult!5169 0))(
  ( (MissingZero!5169 (index!22903 (_ BitVec 32))) (Found!5169 (index!22904 (_ BitVec 32))) (Intermediate!5169 (undefined!5981 Bool) (index!22905 (_ BitVec 32)) (x!51835 (_ BitVec 32))) (Undefined!5169) (MissingVacant!5169 (index!22906 (_ BitVec 32))) )
))
(declare-fun lt!251306 () SeekEntryResult!5169)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552854 (= res!345267 (or (= lt!251306 (MissingZero!5169 i!1132)) (= lt!251306 (MissingVacant!5169 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34821 0))(
  ( (array!34822 (arr!16720 (Array (_ BitVec 32) (_ BitVec 64))) (size!17084 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34821)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34821 (_ BitVec 32)) SeekEntryResult!5169)

(assert (=> b!552854 (= lt!251306 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552856 () Bool)

(declare-fun res!345273 () Bool)

(assert (=> b!552856 (=> (not res!345273) (not e!318995))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552856 (= res!345273 (validKeyInArray!0 (select (arr!16720 a!3118) j!142)))))

(declare-fun b!552857 () Bool)

(declare-fun res!345269 () Bool)

(assert (=> b!552857 (=> (not res!345269) (not e!318992))))

(declare-datatypes ((List!10800 0))(
  ( (Nil!10797) (Cons!10796 (h!11781 (_ BitVec 64)) (t!17028 List!10800)) )
))
(declare-fun arrayNoDuplicates!0 (array!34821 (_ BitVec 32) List!10800) Bool)

(assert (=> b!552857 (= res!345269 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10797))))

(declare-fun b!552858 () Bool)

(declare-fun e!318996 () Bool)

(declare-fun lt!251305 () SeekEntryResult!5169)

(get-info :version)

(assert (=> b!552858 (= e!318996 (not (or (not ((_ is Intermediate!5169) lt!251305)) (not (undefined!5981 lt!251305)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!318993 () Bool)

(assert (=> b!552858 e!318993))

(declare-fun res!345271 () Bool)

(assert (=> b!552858 (=> (not res!345271) (not e!318993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34821 (_ BitVec 32)) Bool)

(assert (=> b!552858 (= res!345271 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17112 0))(
  ( (Unit!17113) )
))
(declare-fun lt!251307 () Unit!17112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17112)

(assert (=> b!552858 (= lt!251307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345274 () Bool)

(assert (=> start!50596 (=> (not res!345274) (not e!318995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50596 (= res!345274 (validMask!0 mask!3119))))

(assert (=> start!50596 e!318995))

(assert (=> start!50596 true))

(declare-fun array_inv!12516 (array!34821) Bool)

(assert (=> start!50596 (array_inv!12516 a!3118)))

(declare-fun b!552855 () Bool)

(declare-fun res!345268 () Bool)

(assert (=> b!552855 (=> (not res!345268) (not e!318995))))

(assert (=> b!552855 (= res!345268 (validKeyInArray!0 k0!1914))))

(declare-fun b!552859 () Bool)

(assert (=> b!552859 (= e!318992 e!318996)))

(declare-fun res!345272 () Bool)

(assert (=> b!552859 (=> (not res!345272) (not e!318996))))

(declare-fun lt!251308 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34821 (_ BitVec 32)) SeekEntryResult!5169)

(assert (=> b!552859 (= res!345272 (= lt!251305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251308 (select (store (arr!16720 a!3118) i!1132 k0!1914) j!142) (array!34822 (store (arr!16720 a!3118) i!1132 k0!1914) (size!17084 a!3118)) mask!3119)))))

(declare-fun lt!251304 () (_ BitVec 32))

(assert (=> b!552859 (= lt!251305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251304 (select (arr!16720 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552859 (= lt!251308 (toIndex!0 (select (store (arr!16720 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552859 (= lt!251304 (toIndex!0 (select (arr!16720 a!3118) j!142) mask!3119))))

(declare-fun b!552860 () Bool)

(declare-fun res!345275 () Bool)

(assert (=> b!552860 (=> (not res!345275) (not e!318995))))

(declare-fun arrayContainsKey!0 (array!34821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552860 (= res!345275 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552861 () Bool)

(declare-fun res!345266 () Bool)

(assert (=> b!552861 (=> (not res!345266) (not e!318992))))

(assert (=> b!552861 (= res!345266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552862 () Bool)

(assert (=> b!552862 (= e!318993 (= (seekEntryOrOpen!0 (select (arr!16720 a!3118) j!142) a!3118 mask!3119) (Found!5169 j!142)))))

(declare-fun b!552863 () Bool)

(declare-fun res!345270 () Bool)

(assert (=> b!552863 (=> (not res!345270) (not e!318995))))

(assert (=> b!552863 (= res!345270 (and (= (size!17084 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17084 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17084 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50596 res!345274) b!552863))

(assert (= (and b!552863 res!345270) b!552856))

(assert (= (and b!552856 res!345273) b!552855))

(assert (= (and b!552855 res!345268) b!552860))

(assert (= (and b!552860 res!345275) b!552854))

(assert (= (and b!552854 res!345267) b!552861))

(assert (= (and b!552861 res!345266) b!552857))

(assert (= (and b!552857 res!345269) b!552859))

(assert (= (and b!552859 res!345272) b!552858))

(assert (= (and b!552858 res!345271) b!552862))

(declare-fun m!529821 () Bool)

(assert (=> b!552858 m!529821))

(declare-fun m!529823 () Bool)

(assert (=> b!552858 m!529823))

(declare-fun m!529825 () Bool)

(assert (=> b!552856 m!529825))

(assert (=> b!552856 m!529825))

(declare-fun m!529827 () Bool)

(assert (=> b!552856 m!529827))

(assert (=> b!552862 m!529825))

(assert (=> b!552862 m!529825))

(declare-fun m!529829 () Bool)

(assert (=> b!552862 m!529829))

(assert (=> b!552859 m!529825))

(declare-fun m!529831 () Bool)

(assert (=> b!552859 m!529831))

(assert (=> b!552859 m!529825))

(declare-fun m!529833 () Bool)

(assert (=> b!552859 m!529833))

(assert (=> b!552859 m!529833))

(declare-fun m!529835 () Bool)

(assert (=> b!552859 m!529835))

(declare-fun m!529837 () Bool)

(assert (=> b!552859 m!529837))

(assert (=> b!552859 m!529825))

(declare-fun m!529839 () Bool)

(assert (=> b!552859 m!529839))

(assert (=> b!552859 m!529833))

(declare-fun m!529841 () Bool)

(assert (=> b!552859 m!529841))

(declare-fun m!529843 () Bool)

(assert (=> b!552857 m!529843))

(declare-fun m!529845 () Bool)

(assert (=> start!50596 m!529845))

(declare-fun m!529847 () Bool)

(assert (=> start!50596 m!529847))

(declare-fun m!529849 () Bool)

(assert (=> b!552854 m!529849))

(declare-fun m!529851 () Bool)

(assert (=> b!552855 m!529851))

(declare-fun m!529853 () Bool)

(assert (=> b!552861 m!529853))

(declare-fun m!529855 () Bool)

(assert (=> b!552860 m!529855))

(check-sat (not b!552855) (not start!50596) (not b!552861) (not b!552854) (not b!552859) (not b!552860) (not b!552858) (not b!552862) (not b!552856) (not b!552857))
(check-sat)
