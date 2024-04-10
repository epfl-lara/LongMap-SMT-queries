; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51532 () Bool)

(assert start!51532)

(declare-fun b!563825 () Bool)

(declare-fun res!354980 () Bool)

(declare-fun e!324856 () Bool)

(assert (=> b!563825 (=> (not res!354980) (not e!324856))))

(declare-datatypes ((array!35397 0))(
  ( (array!35398 (arr!16999 (Array (_ BitVec 32) (_ BitVec 64))) (size!17363 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35397)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563825 (= res!354980 (validKeyInArray!0 (select (arr!16999 a!3118) j!142)))))

(declare-fun b!563826 () Bool)

(declare-fun res!354983 () Bool)

(declare-fun e!324857 () Bool)

(assert (=> b!563826 (=> (not res!354983) (not e!324857))))

(declare-datatypes ((List!11079 0))(
  ( (Nil!11076) (Cons!11075 (h!12078 (_ BitVec 64)) (t!17307 List!11079)) )
))
(declare-fun arrayNoDuplicates!0 (array!35397 (_ BitVec 32) List!11079) Bool)

(assert (=> b!563826 (= res!354983 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11076))))

(declare-fun b!563827 () Bool)

(declare-fun e!324858 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5448 0))(
  ( (MissingZero!5448 (index!24019 (_ BitVec 32))) (Found!5448 (index!24020 (_ BitVec 32))) (Intermediate!5448 (undefined!6260 Bool) (index!24021 (_ BitVec 32)) (x!52903 (_ BitVec 32))) (Undefined!5448) (MissingVacant!5448 (index!24022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35397 (_ BitVec 32)) SeekEntryResult!5448)

(assert (=> b!563827 (= e!324858 (= (seekEntryOrOpen!0 (select (arr!16999 a!3118) j!142) a!3118 mask!3119) (Found!5448 j!142)))))

(declare-fun b!563828 () Bool)

(assert (=> b!563828 (= e!324856 e!324857)))

(declare-fun res!354985 () Bool)

(assert (=> b!563828 (=> (not res!354985) (not e!324857))))

(declare-fun lt!257347 () SeekEntryResult!5448)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563828 (= res!354985 (or (= lt!257347 (MissingZero!5448 i!1132)) (= lt!257347 (MissingVacant!5448 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!563828 (= lt!257347 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!354978 () Bool)

(assert (=> start!51532 (=> (not res!354978) (not e!324856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51532 (= res!354978 (validMask!0 mask!3119))))

(assert (=> start!51532 e!324856))

(assert (=> start!51532 true))

(declare-fun array_inv!12795 (array!35397) Bool)

(assert (=> start!51532 (array_inv!12795 a!3118)))

(declare-fun b!563829 () Bool)

(declare-fun res!354984 () Bool)

(assert (=> b!563829 (=> (not res!354984) (not e!324856))))

(assert (=> b!563829 (= res!354984 (validKeyInArray!0 k0!1914))))

(declare-fun b!563830 () Bool)

(assert (=> b!563830 (= e!324857 (not true))))

(assert (=> b!563830 e!324858))

(declare-fun res!354979 () Bool)

(assert (=> b!563830 (=> (not res!354979) (not e!324858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35397 (_ BitVec 32)) Bool)

(assert (=> b!563830 (= res!354979 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17670 0))(
  ( (Unit!17671) )
))
(declare-fun lt!257346 () Unit!17670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17670)

(assert (=> b!563830 (= lt!257346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563831 () Bool)

(declare-fun res!354977 () Bool)

(assert (=> b!563831 (=> (not res!354977) (not e!324857))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35397 (_ BitVec 32)) SeekEntryResult!5448)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563831 (= res!354977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16999 a!3118) j!142) mask!3119) (select (arr!16999 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16999 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16999 a!3118) i!1132 k0!1914) j!142) (array!35398 (store (arr!16999 a!3118) i!1132 k0!1914) (size!17363 a!3118)) mask!3119)))))

(declare-fun b!563832 () Bool)

(declare-fun res!354982 () Bool)

(assert (=> b!563832 (=> (not res!354982) (not e!324856))))

(assert (=> b!563832 (= res!354982 (and (= (size!17363 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17363 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17363 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563833 () Bool)

(declare-fun res!354986 () Bool)

(assert (=> b!563833 (=> (not res!354986) (not e!324856))))

(declare-fun arrayContainsKey!0 (array!35397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563833 (= res!354986 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563834 () Bool)

(declare-fun res!354981 () Bool)

(assert (=> b!563834 (=> (not res!354981) (not e!324857))))

(assert (=> b!563834 (= res!354981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51532 res!354978) b!563832))

(assert (= (and b!563832 res!354982) b!563825))

(assert (= (and b!563825 res!354980) b!563829))

(assert (= (and b!563829 res!354984) b!563833))

(assert (= (and b!563833 res!354986) b!563828))

(assert (= (and b!563828 res!354985) b!563834))

(assert (= (and b!563834 res!354981) b!563826))

(assert (= (and b!563826 res!354983) b!563831))

(assert (= (and b!563831 res!354977) b!563830))

(assert (= (and b!563830 res!354979) b!563827))

(declare-fun m!542247 () Bool)

(assert (=> b!563826 m!542247))

(declare-fun m!542249 () Bool)

(assert (=> b!563830 m!542249))

(declare-fun m!542251 () Bool)

(assert (=> b!563830 m!542251))

(declare-fun m!542253 () Bool)

(assert (=> start!51532 m!542253))

(declare-fun m!542255 () Bool)

(assert (=> start!51532 m!542255))

(declare-fun m!542257 () Bool)

(assert (=> b!563833 m!542257))

(declare-fun m!542259 () Bool)

(assert (=> b!563834 m!542259))

(declare-fun m!542261 () Bool)

(assert (=> b!563827 m!542261))

(assert (=> b!563827 m!542261))

(declare-fun m!542263 () Bool)

(assert (=> b!563827 m!542263))

(assert (=> b!563825 m!542261))

(assert (=> b!563825 m!542261))

(declare-fun m!542265 () Bool)

(assert (=> b!563825 m!542265))

(declare-fun m!542267 () Bool)

(assert (=> b!563828 m!542267))

(assert (=> b!563831 m!542261))

(declare-fun m!542269 () Bool)

(assert (=> b!563831 m!542269))

(assert (=> b!563831 m!542261))

(declare-fun m!542271 () Bool)

(assert (=> b!563831 m!542271))

(declare-fun m!542273 () Bool)

(assert (=> b!563831 m!542273))

(assert (=> b!563831 m!542271))

(declare-fun m!542275 () Bool)

(assert (=> b!563831 m!542275))

(assert (=> b!563831 m!542269))

(assert (=> b!563831 m!542261))

(declare-fun m!542277 () Bool)

(assert (=> b!563831 m!542277))

(declare-fun m!542279 () Bool)

(assert (=> b!563831 m!542279))

(assert (=> b!563831 m!542271))

(assert (=> b!563831 m!542273))

(declare-fun m!542281 () Bool)

(assert (=> b!563829 m!542281))

(check-sat (not start!51532) (not b!563828) (not b!563826) (not b!563825) (not b!563834) (not b!563827) (not b!563831) (not b!563830) (not b!563829) (not b!563833))
(check-sat)
