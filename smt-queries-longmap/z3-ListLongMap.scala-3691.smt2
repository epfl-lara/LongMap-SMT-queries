; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50764 () Bool)

(assert start!50764)

(declare-fun res!347721 () Bool)

(declare-fun e!320078 () Bool)

(assert (=> start!50764 (=> (not res!347721) (not e!320078))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50764 (= res!347721 (validMask!0 mask!3119))))

(assert (=> start!50764 e!320078))

(assert (=> start!50764 true))

(declare-datatypes ((array!34989 0))(
  ( (array!34990 (arr!16804 (Array (_ BitVec 32) (_ BitVec 64))) (size!17168 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34989)

(declare-fun array_inv!12600 (array!34989) Bool)

(assert (=> start!50764 (array_inv!12600 a!3118)))

(declare-fun b!555306 () Bool)

(declare-fun res!347718 () Bool)

(declare-fun e!320079 () Bool)

(assert (=> b!555306 (=> (not res!347718) (not e!320079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34989 (_ BitVec 32)) Bool)

(assert (=> b!555306 (= res!347718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555307 () Bool)

(declare-fun res!347724 () Bool)

(assert (=> b!555307 (=> (not res!347724) (not e!320078))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555307 (= res!347724 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555308 () Bool)

(declare-fun e!320077 () Bool)

(assert (=> b!555308 (= e!320077 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5253 0))(
  ( (MissingZero!5253 (index!23239 (_ BitVec 32))) (Found!5253 (index!23240 (_ BitVec 32))) (Intermediate!5253 (undefined!6065 Bool) (index!23241 (_ BitVec 32)) (x!52143 (_ BitVec 32))) (Undefined!5253) (MissingVacant!5253 (index!23242 (_ BitVec 32))) )
))
(declare-fun lt!252328 () SeekEntryResult!5253)

(declare-fun lt!252327 () SeekEntryResult!5253)

(get-info :version)

(assert (=> b!555308 (and (= lt!252328 (Found!5253 j!142)) (or (undefined!6065 lt!252327) (not ((_ is Intermediate!5253) lt!252327)) (= (select (arr!16804 a!3118) (index!23241 lt!252327)) (select (arr!16804 a!3118) j!142)) (not (= (select (arr!16804 a!3118) (index!23241 lt!252327)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252328 (MissingZero!5253 (index!23241 lt!252327)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34989 (_ BitVec 32)) SeekEntryResult!5253)

(assert (=> b!555308 (= lt!252328 (seekEntryOrOpen!0 (select (arr!16804 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555308 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17280 0))(
  ( (Unit!17281) )
))
(declare-fun lt!252326 () Unit!17280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17280)

(assert (=> b!555308 (= lt!252326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555309 () Bool)

(declare-fun res!347720 () Bool)

(assert (=> b!555309 (=> (not res!347720) (not e!320078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555309 (= res!347720 (validKeyInArray!0 k0!1914))))

(declare-fun b!555310 () Bool)

(assert (=> b!555310 (= e!320079 e!320077)))

(declare-fun res!347723 () Bool)

(assert (=> b!555310 (=> (not res!347723) (not e!320077))))

(declare-fun lt!252329 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34989 (_ BitVec 32)) SeekEntryResult!5253)

(assert (=> b!555310 (= res!347723 (= lt!252327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252329 (select (store (arr!16804 a!3118) i!1132 k0!1914) j!142) (array!34990 (store (arr!16804 a!3118) i!1132 k0!1914) (size!17168 a!3118)) mask!3119)))))

(declare-fun lt!252330 () (_ BitVec 32))

(assert (=> b!555310 (= lt!252327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252330 (select (arr!16804 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555310 (= lt!252329 (toIndex!0 (select (store (arr!16804 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555310 (= lt!252330 (toIndex!0 (select (arr!16804 a!3118) j!142) mask!3119))))

(declare-fun b!555311 () Bool)

(declare-fun res!347725 () Bool)

(assert (=> b!555311 (=> (not res!347725) (not e!320078))))

(assert (=> b!555311 (= res!347725 (validKeyInArray!0 (select (arr!16804 a!3118) j!142)))))

(declare-fun b!555312 () Bool)

(declare-fun res!347722 () Bool)

(assert (=> b!555312 (=> (not res!347722) (not e!320078))))

(assert (=> b!555312 (= res!347722 (and (= (size!17168 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17168 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17168 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555313 () Bool)

(assert (=> b!555313 (= e!320078 e!320079)))

(declare-fun res!347726 () Bool)

(assert (=> b!555313 (=> (not res!347726) (not e!320079))))

(declare-fun lt!252331 () SeekEntryResult!5253)

(assert (=> b!555313 (= res!347726 (or (= lt!252331 (MissingZero!5253 i!1132)) (= lt!252331 (MissingVacant!5253 i!1132))))))

(assert (=> b!555313 (= lt!252331 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555314 () Bool)

(declare-fun res!347719 () Bool)

(assert (=> b!555314 (=> (not res!347719) (not e!320079))))

(declare-datatypes ((List!10884 0))(
  ( (Nil!10881) (Cons!10880 (h!11865 (_ BitVec 64)) (t!17112 List!10884)) )
))
(declare-fun arrayNoDuplicates!0 (array!34989 (_ BitVec 32) List!10884) Bool)

(assert (=> b!555314 (= res!347719 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10881))))

(assert (= (and start!50764 res!347721) b!555312))

(assert (= (and b!555312 res!347722) b!555311))

(assert (= (and b!555311 res!347725) b!555309))

(assert (= (and b!555309 res!347720) b!555307))

(assert (= (and b!555307 res!347724) b!555313))

(assert (= (and b!555313 res!347726) b!555306))

(assert (= (and b!555306 res!347718) b!555314))

(assert (= (and b!555314 res!347719) b!555310))

(assert (= (and b!555310 res!347723) b!555308))

(declare-fun m!532937 () Bool)

(assert (=> b!555311 m!532937))

(assert (=> b!555311 m!532937))

(declare-fun m!532939 () Bool)

(assert (=> b!555311 m!532939))

(declare-fun m!532941 () Bool)

(assert (=> b!555306 m!532941))

(declare-fun m!532943 () Bool)

(assert (=> b!555308 m!532943))

(assert (=> b!555308 m!532937))

(declare-fun m!532945 () Bool)

(assert (=> b!555308 m!532945))

(declare-fun m!532947 () Bool)

(assert (=> b!555308 m!532947))

(assert (=> b!555308 m!532937))

(declare-fun m!532949 () Bool)

(assert (=> b!555308 m!532949))

(declare-fun m!532951 () Bool)

(assert (=> b!555314 m!532951))

(declare-fun m!532953 () Bool)

(assert (=> b!555313 m!532953))

(declare-fun m!532955 () Bool)

(assert (=> start!50764 m!532955))

(declare-fun m!532957 () Bool)

(assert (=> start!50764 m!532957))

(assert (=> b!555310 m!532937))

(declare-fun m!532959 () Bool)

(assert (=> b!555310 m!532959))

(assert (=> b!555310 m!532937))

(declare-fun m!532961 () Bool)

(assert (=> b!555310 m!532961))

(assert (=> b!555310 m!532937))

(declare-fun m!532963 () Bool)

(assert (=> b!555310 m!532963))

(declare-fun m!532965 () Bool)

(assert (=> b!555310 m!532965))

(assert (=> b!555310 m!532961))

(declare-fun m!532967 () Bool)

(assert (=> b!555310 m!532967))

(assert (=> b!555310 m!532961))

(declare-fun m!532969 () Bool)

(assert (=> b!555310 m!532969))

(declare-fun m!532971 () Bool)

(assert (=> b!555307 m!532971))

(declare-fun m!532973 () Bool)

(assert (=> b!555309 m!532973))

(check-sat (not b!555306) (not b!555314) (not b!555310) (not b!555311) (not b!555308) (not start!50764) (not b!555309) (not b!555307) (not b!555313))
(check-sat)
