; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51056 () Bool)

(assert start!51056)

(declare-fun b!557712 () Bool)

(declare-fun res!349719 () Bool)

(declare-fun e!321271 () Bool)

(assert (=> b!557712 (=> (not res!349719) (not e!321271))))

(declare-datatypes ((array!35119 0))(
  ( (array!35120 (arr!16865 (Array (_ BitVec 32) (_ BitVec 64))) (size!17230 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35119)

(declare-datatypes ((List!10984 0))(
  ( (Nil!10981) (Cons!10980 (h!11974 (_ BitVec 64)) (t!17203 List!10984)) )
))
(declare-fun arrayNoDuplicates!0 (array!35119 (_ BitVec 32) List!10984) Bool)

(assert (=> b!557712 (= res!349719 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10981))))

(declare-fun b!557713 () Bool)

(declare-fun res!349724 () Bool)

(declare-fun e!321273 () Bool)

(assert (=> b!557713 (=> (not res!349724) (not e!321273))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557713 (= res!349724 (and (= (size!17230 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17230 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17230 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557714 () Bool)

(declare-fun res!349727 () Bool)

(assert (=> b!557714 (=> (not res!349727) (not e!321273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557714 (= res!349727 (validKeyInArray!0 (select (arr!16865 a!3118) j!142)))))

(declare-fun b!557715 () Bool)

(declare-fun e!321275 () Bool)

(declare-fun e!321272 () Bool)

(assert (=> b!557715 (= e!321275 e!321272)))

(declare-fun res!349723 () Bool)

(assert (=> b!557715 (=> res!349723 e!321272)))

(declare-datatypes ((SeekEntryResult!5311 0))(
  ( (MissingZero!5311 (index!23471 (_ BitVec 32))) (Found!5311 (index!23472 (_ BitVec 32))) (Intermediate!5311 (undefined!6123 Bool) (index!23473 (_ BitVec 32)) (x!52382 (_ BitVec 32))) (Undefined!5311) (MissingVacant!5311 (index!23474 (_ BitVec 32))) )
))
(declare-fun lt!253300 () SeekEntryResult!5311)

(get-info :version)

(assert (=> b!557715 (= res!349723 (or (undefined!6123 lt!253300) (not ((_ is Intermediate!5311) lt!253300)) (= (select (arr!16865 a!3118) (index!23473 lt!253300)) (select (arr!16865 a!3118) j!142)) (= (select (arr!16865 a!3118) (index!23473 lt!253300)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!349726 () Bool)

(assert (=> start!51056 (=> (not res!349726) (not e!321273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51056 (= res!349726 (validMask!0 mask!3119))))

(assert (=> start!51056 e!321273))

(assert (=> start!51056 true))

(declare-fun array_inv!12748 (array!35119) Bool)

(assert (=> start!51056 (array_inv!12748 a!3118)))

(declare-fun lt!253298 () SeekEntryResult!5311)

(declare-fun b!557716 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35119 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!557716 (= e!321272 (= lt!253298 (seekKeyOrZeroReturnVacant!0 (x!52382 lt!253300) (index!23473 lt!253300) (index!23473 lt!253300) (select (arr!16865 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557717 () Bool)

(assert (=> b!557717 (= e!321273 e!321271)))

(declare-fun res!349725 () Bool)

(assert (=> b!557717 (=> (not res!349725) (not e!321271))))

(declare-fun lt!253302 () SeekEntryResult!5311)

(assert (=> b!557717 (= res!349725 (or (= lt!253302 (MissingZero!5311 i!1132)) (= lt!253302 (MissingVacant!5311 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35119 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!557717 (= lt!253302 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557718 () Bool)

(declare-fun res!349721 () Bool)

(assert (=> b!557718 (=> (not res!349721) (not e!321271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35119 (_ BitVec 32)) Bool)

(assert (=> b!557718 (= res!349721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557719 () Bool)

(declare-fun e!321274 () Bool)

(assert (=> b!557719 (= e!321274 (not (or (undefined!6123 lt!253300) (not ((_ is Intermediate!5311) lt!253300)) (= (select (arr!16865 a!3118) (index!23473 lt!253300)) (select (arr!16865 a!3118) j!142)) (= (select (arr!16865 a!3118) (index!23473 lt!253300)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!557719 e!321275))

(declare-fun res!349720 () Bool)

(assert (=> b!557719 (=> (not res!349720) (not e!321275))))

(assert (=> b!557719 (= res!349720 (= lt!253298 (Found!5311 j!142)))))

(assert (=> b!557719 (= lt!253298 (seekEntryOrOpen!0 (select (arr!16865 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!557719 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17382 0))(
  ( (Unit!17383) )
))
(declare-fun lt!253299 () Unit!17382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17382)

(assert (=> b!557719 (= lt!253299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557720 () Bool)

(assert (=> b!557720 (= e!321271 e!321274)))

(declare-fun res!349718 () Bool)

(assert (=> b!557720 (=> (not res!349718) (not e!321274))))

(declare-fun lt!253303 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35119 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!557720 (= res!349718 (= lt!253300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253303 (select (store (arr!16865 a!3118) i!1132 k0!1914) j!142) (array!35120 (store (arr!16865 a!3118) i!1132 k0!1914) (size!17230 a!3118)) mask!3119)))))

(declare-fun lt!253301 () (_ BitVec 32))

(assert (=> b!557720 (= lt!253300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253301 (select (arr!16865 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557720 (= lt!253303 (toIndex!0 (select (store (arr!16865 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557720 (= lt!253301 (toIndex!0 (select (arr!16865 a!3118) j!142) mask!3119))))

(declare-fun b!557721 () Bool)

(declare-fun res!349717 () Bool)

(assert (=> b!557721 (=> (not res!349717) (not e!321273))))

(declare-fun arrayContainsKey!0 (array!35119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557721 (= res!349717 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557722 () Bool)

(declare-fun res!349722 () Bool)

(assert (=> b!557722 (=> (not res!349722) (not e!321273))))

(assert (=> b!557722 (= res!349722 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51056 res!349726) b!557713))

(assert (= (and b!557713 res!349724) b!557714))

(assert (= (and b!557714 res!349727) b!557722))

(assert (= (and b!557722 res!349722) b!557721))

(assert (= (and b!557721 res!349717) b!557717))

(assert (= (and b!557717 res!349725) b!557718))

(assert (= (and b!557718 res!349721) b!557712))

(assert (= (and b!557712 res!349719) b!557720))

(assert (= (and b!557720 res!349718) b!557719))

(assert (= (and b!557719 res!349720) b!557715))

(assert (= (and b!557715 (not res!349723)) b!557716))

(declare-fun m!535097 () Bool)

(assert (=> b!557715 m!535097))

(declare-fun m!535099 () Bool)

(assert (=> b!557715 m!535099))

(declare-fun m!535101 () Bool)

(assert (=> b!557722 m!535101))

(declare-fun m!535103 () Bool)

(assert (=> b!557717 m!535103))

(assert (=> b!557716 m!535099))

(assert (=> b!557716 m!535099))

(declare-fun m!535105 () Bool)

(assert (=> b!557716 m!535105))

(declare-fun m!535107 () Bool)

(assert (=> start!51056 m!535107))

(declare-fun m!535109 () Bool)

(assert (=> start!51056 m!535109))

(assert (=> b!557714 m!535099))

(assert (=> b!557714 m!535099))

(declare-fun m!535111 () Bool)

(assert (=> b!557714 m!535111))

(declare-fun m!535113 () Bool)

(assert (=> b!557712 m!535113))

(assert (=> b!557719 m!535097))

(assert (=> b!557719 m!535099))

(declare-fun m!535115 () Bool)

(assert (=> b!557719 m!535115))

(declare-fun m!535117 () Bool)

(assert (=> b!557719 m!535117))

(assert (=> b!557719 m!535099))

(declare-fun m!535119 () Bool)

(assert (=> b!557719 m!535119))

(declare-fun m!535121 () Bool)

(assert (=> b!557721 m!535121))

(declare-fun m!535123 () Bool)

(assert (=> b!557718 m!535123))

(assert (=> b!557720 m!535099))

(declare-fun m!535125 () Bool)

(assert (=> b!557720 m!535125))

(assert (=> b!557720 m!535099))

(declare-fun m!535127 () Bool)

(assert (=> b!557720 m!535127))

(assert (=> b!557720 m!535099))

(declare-fun m!535129 () Bool)

(assert (=> b!557720 m!535129))

(assert (=> b!557720 m!535127))

(declare-fun m!535131 () Bool)

(assert (=> b!557720 m!535131))

(declare-fun m!535133 () Bool)

(assert (=> b!557720 m!535133))

(assert (=> b!557720 m!535127))

(declare-fun m!535135 () Bool)

(assert (=> b!557720 m!535135))

(check-sat (not b!557716) (not b!557720) (not b!557721) (not b!557722) (not b!557712) (not b!557717) (not b!557719) (not start!51056) (not b!557718) (not b!557714))
(check-sat)
