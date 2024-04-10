; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51534 () Bool)

(assert start!51534)

(declare-fun b!563855 () Bool)

(declare-fun res!355016 () Bool)

(declare-fun e!324870 () Bool)

(assert (=> b!563855 (=> (not res!355016) (not e!324870))))

(declare-datatypes ((array!35399 0))(
  ( (array!35400 (arr!17000 (Array (_ BitVec 32) (_ BitVec 64))) (size!17364 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35399)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563855 (= res!355016 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563856 () Bool)

(declare-fun res!355011 () Bool)

(declare-fun e!324869 () Bool)

(assert (=> b!563856 (=> (not res!355011) (not e!324869))))

(declare-datatypes ((List!11080 0))(
  ( (Nil!11077) (Cons!11076 (h!12079 (_ BitVec 64)) (t!17308 List!11080)) )
))
(declare-fun arrayNoDuplicates!0 (array!35399 (_ BitVec 32) List!11080) Bool)

(assert (=> b!563856 (= res!355011 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11077))))

(declare-fun b!563857 () Bool)

(declare-fun res!355007 () Bool)

(assert (=> b!563857 (=> (not res!355007) (not e!324869))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5449 0))(
  ( (MissingZero!5449 (index!24023 (_ BitVec 32))) (Found!5449 (index!24024 (_ BitVec 32))) (Intermediate!5449 (undefined!6261 Bool) (index!24025 (_ BitVec 32)) (x!52904 (_ BitVec 32))) (Undefined!5449) (MissingVacant!5449 (index!24026 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35399 (_ BitVec 32)) SeekEntryResult!5449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563857 (= res!355007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17000 a!3118) j!142) mask!3119) (select (arr!17000 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17000 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17000 a!3118) i!1132 k!1914) j!142) (array!35400 (store (arr!17000 a!3118) i!1132 k!1914) (size!17364 a!3118)) mask!3119)))))

(declare-fun res!355008 () Bool)

(assert (=> start!51534 (=> (not res!355008) (not e!324870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51534 (= res!355008 (validMask!0 mask!3119))))

(assert (=> start!51534 e!324870))

(assert (=> start!51534 true))

(declare-fun array_inv!12796 (array!35399) Bool)

(assert (=> start!51534 (array_inv!12796 a!3118)))

(declare-fun b!563858 () Bool)

(declare-fun res!355012 () Bool)

(assert (=> b!563858 (=> (not res!355012) (not e!324870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563858 (= res!355012 (validKeyInArray!0 (select (arr!17000 a!3118) j!142)))))

(declare-fun b!563859 () Bool)

(assert (=> b!563859 (= e!324869 (not true))))

(declare-fun e!324867 () Bool)

(assert (=> b!563859 e!324867))

(declare-fun res!355015 () Bool)

(assert (=> b!563859 (=> (not res!355015) (not e!324867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35399 (_ BitVec 32)) Bool)

(assert (=> b!563859 (= res!355015 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17672 0))(
  ( (Unit!17673) )
))
(declare-fun lt!257353 () Unit!17672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17672)

(assert (=> b!563859 (= lt!257353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563860 () Bool)

(assert (=> b!563860 (= e!324870 e!324869)))

(declare-fun res!355013 () Bool)

(assert (=> b!563860 (=> (not res!355013) (not e!324869))))

(declare-fun lt!257352 () SeekEntryResult!5449)

(assert (=> b!563860 (= res!355013 (or (= lt!257352 (MissingZero!5449 i!1132)) (= lt!257352 (MissingVacant!5449 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35399 (_ BitVec 32)) SeekEntryResult!5449)

(assert (=> b!563860 (= lt!257352 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563861 () Bool)

(declare-fun res!355009 () Bool)

(assert (=> b!563861 (=> (not res!355009) (not e!324870))))

(assert (=> b!563861 (= res!355009 (and (= (size!17364 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17364 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17364 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563862 () Bool)

(declare-fun res!355010 () Bool)

(assert (=> b!563862 (=> (not res!355010) (not e!324870))))

(assert (=> b!563862 (= res!355010 (validKeyInArray!0 k!1914))))

(declare-fun b!563863 () Bool)

(declare-fun res!355014 () Bool)

(assert (=> b!563863 (=> (not res!355014) (not e!324869))))

(assert (=> b!563863 (= res!355014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563864 () Bool)

(assert (=> b!563864 (= e!324867 (= (seekEntryOrOpen!0 (select (arr!17000 a!3118) j!142) a!3118 mask!3119) (Found!5449 j!142)))))

(assert (= (and start!51534 res!355008) b!563861))

(assert (= (and b!563861 res!355009) b!563858))

(assert (= (and b!563858 res!355012) b!563862))

(assert (= (and b!563862 res!355010) b!563855))

(assert (= (and b!563855 res!355016) b!563860))

(assert (= (and b!563860 res!355013) b!563863))

(assert (= (and b!563863 res!355014) b!563856))

(assert (= (and b!563856 res!355011) b!563857))

(assert (= (and b!563857 res!355007) b!563859))

(assert (= (and b!563859 res!355015) b!563864))

(declare-fun m!542283 () Bool)

(assert (=> b!563859 m!542283))

(declare-fun m!542285 () Bool)

(assert (=> b!563859 m!542285))

(declare-fun m!542287 () Bool)

(assert (=> b!563857 m!542287))

(declare-fun m!542289 () Bool)

(assert (=> b!563857 m!542289))

(assert (=> b!563857 m!542287))

(declare-fun m!542291 () Bool)

(assert (=> b!563857 m!542291))

(declare-fun m!542293 () Bool)

(assert (=> b!563857 m!542293))

(assert (=> b!563857 m!542291))

(declare-fun m!542295 () Bool)

(assert (=> b!563857 m!542295))

(assert (=> b!563857 m!542289))

(assert (=> b!563857 m!542287))

(declare-fun m!542297 () Bool)

(assert (=> b!563857 m!542297))

(declare-fun m!542299 () Bool)

(assert (=> b!563857 m!542299))

(assert (=> b!563857 m!542291))

(assert (=> b!563857 m!542293))

(declare-fun m!542301 () Bool)

(assert (=> b!563862 m!542301))

(declare-fun m!542303 () Bool)

(assert (=> b!563856 m!542303))

(declare-fun m!542305 () Bool)

(assert (=> b!563860 m!542305))

(declare-fun m!542307 () Bool)

(assert (=> b!563855 m!542307))

(declare-fun m!542309 () Bool)

(assert (=> start!51534 m!542309))

(declare-fun m!542311 () Bool)

(assert (=> start!51534 m!542311))

(assert (=> b!563864 m!542287))

(assert (=> b!563864 m!542287))

(declare-fun m!542313 () Bool)

(assert (=> b!563864 m!542313))

(declare-fun m!542315 () Bool)

(assert (=> b!563863 m!542315))

(assert (=> b!563858 m!542287))

(assert (=> b!563858 m!542287))

(declare-fun m!542317 () Bool)

(assert (=> b!563858 m!542317))

(push 1)

