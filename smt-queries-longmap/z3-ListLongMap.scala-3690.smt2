; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50758 () Bool)

(assert start!50758)

(declare-fun b!555225 () Bool)

(declare-fun res!347638 () Bool)

(declare-fun e!320040 () Bool)

(assert (=> b!555225 (=> (not res!347638) (not e!320040))))

(declare-datatypes ((array!34983 0))(
  ( (array!34984 (arr!16801 (Array (_ BitVec 32) (_ BitVec 64))) (size!17165 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34983)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34983 (_ BitVec 32)) Bool)

(assert (=> b!555225 (= res!347638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555226 () Bool)

(declare-fun e!320042 () Bool)

(assert (=> b!555226 (= e!320042 e!320040)))

(declare-fun res!347645 () Bool)

(assert (=> b!555226 (=> (not res!347645) (not e!320040))))

(declare-datatypes ((SeekEntryResult!5250 0))(
  ( (MissingZero!5250 (index!23227 (_ BitVec 32))) (Found!5250 (index!23228 (_ BitVec 32))) (Intermediate!5250 (undefined!6062 Bool) (index!23229 (_ BitVec 32)) (x!52132 (_ BitVec 32))) (Undefined!5250) (MissingVacant!5250 (index!23230 (_ BitVec 32))) )
))
(declare-fun lt!252277 () SeekEntryResult!5250)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555226 (= res!347645 (or (= lt!252277 (MissingZero!5250 i!1132)) (= lt!252277 (MissingVacant!5250 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34983 (_ BitVec 32)) SeekEntryResult!5250)

(assert (=> b!555226 (= lt!252277 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555227 () Bool)

(declare-fun res!347643 () Bool)

(assert (=> b!555227 (=> (not res!347643) (not e!320040))))

(declare-datatypes ((List!10881 0))(
  ( (Nil!10878) (Cons!10877 (h!11862 (_ BitVec 64)) (t!17109 List!10881)) )
))
(declare-fun arrayNoDuplicates!0 (array!34983 (_ BitVec 32) List!10881) Bool)

(assert (=> b!555227 (= res!347643 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10878))))

(declare-fun res!347644 () Bool)

(assert (=> start!50758 (=> (not res!347644) (not e!320042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50758 (= res!347644 (validMask!0 mask!3119))))

(assert (=> start!50758 e!320042))

(assert (=> start!50758 true))

(declare-fun array_inv!12597 (array!34983) Bool)

(assert (=> start!50758 (array_inv!12597 a!3118)))

(declare-fun b!555228 () Bool)

(declare-fun res!347640 () Bool)

(assert (=> b!555228 (=> (not res!347640) (not e!320042))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555228 (= res!347640 (and (= (size!17165 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17165 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17165 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555229 () Bool)

(declare-fun res!347641 () Bool)

(assert (=> b!555229 (=> (not res!347641) (not e!320042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555229 (= res!347641 (validKeyInArray!0 k0!1914))))

(declare-fun b!555230 () Bool)

(declare-fun res!347642 () Bool)

(assert (=> b!555230 (=> (not res!347642) (not e!320042))))

(assert (=> b!555230 (= res!347642 (validKeyInArray!0 (select (arr!16801 a!3118) j!142)))))

(declare-fun b!555231 () Bool)

(declare-fun e!320041 () Bool)

(assert (=> b!555231 (= e!320041 (not true))))

(declare-fun lt!252275 () SeekEntryResult!5250)

(declare-fun lt!252274 () SeekEntryResult!5250)

(get-info :version)

(assert (=> b!555231 (and (= lt!252274 (Found!5250 j!142)) (or (undefined!6062 lt!252275) (not ((_ is Intermediate!5250) lt!252275)) (= (select (arr!16801 a!3118) (index!23229 lt!252275)) (select (arr!16801 a!3118) j!142)) (not (= (select (arr!16801 a!3118) (index!23229 lt!252275)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252274 (MissingZero!5250 (index!23229 lt!252275)))))))

(assert (=> b!555231 (= lt!252274 (seekEntryOrOpen!0 (select (arr!16801 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555231 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17274 0))(
  ( (Unit!17275) )
))
(declare-fun lt!252276 () Unit!17274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17274)

(assert (=> b!555231 (= lt!252276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555232 () Bool)

(declare-fun res!347639 () Bool)

(assert (=> b!555232 (=> (not res!347639) (not e!320042))))

(declare-fun arrayContainsKey!0 (array!34983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555232 (= res!347639 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555233 () Bool)

(assert (=> b!555233 (= e!320040 e!320041)))

(declare-fun res!347637 () Bool)

(assert (=> b!555233 (=> (not res!347637) (not e!320041))))

(declare-fun lt!252272 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34983 (_ BitVec 32)) SeekEntryResult!5250)

(assert (=> b!555233 (= res!347637 (= lt!252275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252272 (select (store (arr!16801 a!3118) i!1132 k0!1914) j!142) (array!34984 (store (arr!16801 a!3118) i!1132 k0!1914) (size!17165 a!3118)) mask!3119)))))

(declare-fun lt!252273 () (_ BitVec 32))

(assert (=> b!555233 (= lt!252275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252273 (select (arr!16801 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555233 (= lt!252272 (toIndex!0 (select (store (arr!16801 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555233 (= lt!252273 (toIndex!0 (select (arr!16801 a!3118) j!142) mask!3119))))

(assert (= (and start!50758 res!347644) b!555228))

(assert (= (and b!555228 res!347640) b!555230))

(assert (= (and b!555230 res!347642) b!555229))

(assert (= (and b!555229 res!347641) b!555232))

(assert (= (and b!555232 res!347639) b!555226))

(assert (= (and b!555226 res!347645) b!555225))

(assert (= (and b!555225 res!347638) b!555227))

(assert (= (and b!555227 res!347643) b!555233))

(assert (= (and b!555233 res!347637) b!555231))

(declare-fun m!532823 () Bool)

(assert (=> b!555225 m!532823))

(declare-fun m!532825 () Bool)

(assert (=> b!555229 m!532825))

(declare-fun m!532827 () Bool)

(assert (=> b!555227 m!532827))

(declare-fun m!532829 () Bool)

(assert (=> b!555231 m!532829))

(declare-fun m!532831 () Bool)

(assert (=> b!555231 m!532831))

(declare-fun m!532833 () Bool)

(assert (=> b!555231 m!532833))

(declare-fun m!532835 () Bool)

(assert (=> b!555231 m!532835))

(assert (=> b!555231 m!532829))

(declare-fun m!532837 () Bool)

(assert (=> b!555231 m!532837))

(declare-fun m!532839 () Bool)

(assert (=> b!555232 m!532839))

(assert (=> b!555233 m!532829))

(declare-fun m!532841 () Bool)

(assert (=> b!555233 m!532841))

(assert (=> b!555233 m!532829))

(declare-fun m!532843 () Bool)

(assert (=> b!555233 m!532843))

(declare-fun m!532845 () Bool)

(assert (=> b!555233 m!532845))

(assert (=> b!555233 m!532843))

(assert (=> b!555233 m!532829))

(declare-fun m!532847 () Bool)

(assert (=> b!555233 m!532847))

(declare-fun m!532849 () Bool)

(assert (=> b!555233 m!532849))

(assert (=> b!555233 m!532843))

(declare-fun m!532851 () Bool)

(assert (=> b!555233 m!532851))

(declare-fun m!532853 () Bool)

(assert (=> start!50758 m!532853))

(declare-fun m!532855 () Bool)

(assert (=> start!50758 m!532855))

(assert (=> b!555230 m!532829))

(assert (=> b!555230 m!532829))

(declare-fun m!532857 () Bool)

(assert (=> b!555230 m!532857))

(declare-fun m!532859 () Bool)

(assert (=> b!555226 m!532859))

(check-sat (not b!555231) (not b!555232) (not b!555225) (not b!555229) (not start!50758) (not b!555226) (not b!555227) (not b!555230) (not b!555233))
(check-sat)
