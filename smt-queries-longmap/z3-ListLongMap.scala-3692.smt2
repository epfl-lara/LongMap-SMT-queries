; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50756 () Bool)

(assert start!50756)

(declare-fun b!555089 () Bool)

(declare-fun res!347648 () Bool)

(declare-fun e!319929 () Bool)

(assert (=> b!555089 (=> (not res!347648) (not e!319929))))

(declare-datatypes ((array!34990 0))(
  ( (array!34991 (arr!16805 (Array (_ BitVec 32) (_ BitVec 64))) (size!17170 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34990)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555089 (= res!347648 (validKeyInArray!0 (select (arr!16805 a!3118) j!142)))))

(declare-fun b!555090 () Bool)

(declare-fun res!347644 () Bool)

(declare-fun e!319927 () Bool)

(assert (=> b!555090 (=> (not res!347644) (not e!319927))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34990 (_ BitVec 32)) Bool)

(assert (=> b!555090 (= res!347644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555091 () Bool)

(assert (=> b!555091 (= e!319929 e!319927)))

(declare-fun res!347649 () Bool)

(assert (=> b!555091 (=> (not res!347649) (not e!319927))))

(declare-datatypes ((SeekEntryResult!5251 0))(
  ( (MissingZero!5251 (index!23231 (_ BitVec 32))) (Found!5251 (index!23232 (_ BitVec 32))) (Intermediate!5251 (undefined!6063 Bool) (index!23233 (_ BitVec 32)) (x!52144 (_ BitVec 32))) (Undefined!5251) (MissingVacant!5251 (index!23234 (_ BitVec 32))) )
))
(declare-fun lt!252129 () SeekEntryResult!5251)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555091 (= res!347649 (or (= lt!252129 (MissingZero!5251 i!1132)) (= lt!252129 (MissingVacant!5251 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34990 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!555091 (= lt!252129 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555092 () Bool)

(declare-fun e!319926 () Bool)

(assert (=> b!555092 (= e!319927 e!319926)))

(declare-fun res!347645 () Bool)

(assert (=> b!555092 (=> (not res!347645) (not e!319926))))

(declare-fun lt!252132 () SeekEntryResult!5251)

(declare-fun lt!252133 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34990 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!555092 (= res!347645 (= lt!252132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252133 (select (store (arr!16805 a!3118) i!1132 k0!1914) j!142) (array!34991 (store (arr!16805 a!3118) i!1132 k0!1914) (size!17170 a!3118)) mask!3119)))))

(declare-fun lt!252130 () (_ BitVec 32))

(assert (=> b!555092 (= lt!252132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252130 (select (arr!16805 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555092 (= lt!252133 (toIndex!0 (select (store (arr!16805 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555092 (= lt!252130 (toIndex!0 (select (arr!16805 a!3118) j!142) mask!3119))))

(declare-fun b!555093 () Bool)

(declare-fun res!347647 () Bool)

(assert (=> b!555093 (=> (not res!347647) (not e!319927))))

(declare-datatypes ((List!10924 0))(
  ( (Nil!10921) (Cons!10920 (h!11905 (_ BitVec 64)) (t!17143 List!10924)) )
))
(declare-fun arrayNoDuplicates!0 (array!34990 (_ BitVec 32) List!10924) Bool)

(assert (=> b!555093 (= res!347647 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10921))))

(declare-fun b!555094 () Bool)

(assert (=> b!555094 (= e!319926 (not true))))

(declare-fun lt!252128 () SeekEntryResult!5251)

(get-info :version)

(assert (=> b!555094 (and (= lt!252128 (Found!5251 j!142)) (or (undefined!6063 lt!252132) (not ((_ is Intermediate!5251) lt!252132)) (= (select (arr!16805 a!3118) (index!23233 lt!252132)) (select (arr!16805 a!3118) j!142)) (not (= (select (arr!16805 a!3118) (index!23233 lt!252132)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252128 (MissingZero!5251 (index!23233 lt!252132)))))))

(assert (=> b!555094 (= lt!252128 (seekEntryOrOpen!0 (select (arr!16805 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555094 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17262 0))(
  ( (Unit!17263) )
))
(declare-fun lt!252131 () Unit!17262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17262)

(assert (=> b!555094 (= lt!252131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555095 () Bool)

(declare-fun res!347650 () Bool)

(assert (=> b!555095 (=> (not res!347650) (not e!319929))))

(declare-fun arrayContainsKey!0 (array!34990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555095 (= res!347650 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347643 () Bool)

(assert (=> start!50756 (=> (not res!347643) (not e!319929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50756 (= res!347643 (validMask!0 mask!3119))))

(assert (=> start!50756 e!319929))

(assert (=> start!50756 true))

(declare-fun array_inv!12688 (array!34990) Bool)

(assert (=> start!50756 (array_inv!12688 a!3118)))

(declare-fun b!555096 () Bool)

(declare-fun res!347651 () Bool)

(assert (=> b!555096 (=> (not res!347651) (not e!319929))))

(assert (=> b!555096 (= res!347651 (and (= (size!17170 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17170 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17170 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555097 () Bool)

(declare-fun res!347646 () Bool)

(assert (=> b!555097 (=> (not res!347646) (not e!319929))))

(assert (=> b!555097 (= res!347646 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50756 res!347643) b!555096))

(assert (= (and b!555096 res!347651) b!555089))

(assert (= (and b!555089 res!347648) b!555097))

(assert (= (and b!555097 res!347646) b!555095))

(assert (= (and b!555095 res!347650) b!555091))

(assert (= (and b!555091 res!347649) b!555090))

(assert (= (and b!555090 res!347644) b!555093))

(assert (= (and b!555093 res!347647) b!555092))

(assert (= (and b!555092 res!347645) b!555094))

(declare-fun m!532241 () Bool)

(assert (=> b!555094 m!532241))

(declare-fun m!532243 () Bool)

(assert (=> b!555094 m!532243))

(declare-fun m!532245 () Bool)

(assert (=> b!555094 m!532245))

(declare-fun m!532247 () Bool)

(assert (=> b!555094 m!532247))

(assert (=> b!555094 m!532241))

(declare-fun m!532249 () Bool)

(assert (=> b!555094 m!532249))

(declare-fun m!532251 () Bool)

(assert (=> b!555090 m!532251))

(declare-fun m!532253 () Bool)

(assert (=> b!555092 m!532253))

(declare-fun m!532255 () Bool)

(assert (=> b!555092 m!532255))

(assert (=> b!555092 m!532241))

(declare-fun m!532257 () Bool)

(assert (=> b!555092 m!532257))

(assert (=> b!555092 m!532241))

(declare-fun m!532259 () Bool)

(assert (=> b!555092 m!532259))

(assert (=> b!555092 m!532241))

(assert (=> b!555092 m!532253))

(declare-fun m!532261 () Bool)

(assert (=> b!555092 m!532261))

(assert (=> b!555092 m!532253))

(declare-fun m!532263 () Bool)

(assert (=> b!555092 m!532263))

(declare-fun m!532265 () Bool)

(assert (=> b!555095 m!532265))

(declare-fun m!532267 () Bool)

(assert (=> b!555093 m!532267))

(assert (=> b!555089 m!532241))

(assert (=> b!555089 m!532241))

(declare-fun m!532269 () Bool)

(assert (=> b!555089 m!532269))

(declare-fun m!532271 () Bool)

(assert (=> b!555091 m!532271))

(declare-fun m!532273 () Bool)

(assert (=> b!555097 m!532273))

(declare-fun m!532275 () Bool)

(assert (=> start!50756 m!532275))

(declare-fun m!532277 () Bool)

(assert (=> start!50756 m!532277))

(check-sat (not b!555090) (not b!555094) (not b!555091) (not b!555089) (not start!50756) (not b!555093) (not b!555092) (not b!555097) (not b!555095))
(check-sat)
