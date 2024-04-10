; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51070 () Bool)

(assert start!51070)

(declare-fun b!558016 () Bool)

(declare-fun res!349884 () Bool)

(declare-fun e!321464 () Bool)

(assert (=> b!558016 (=> (not res!349884) (not e!321464))))

(declare-datatypes ((array!35124 0))(
  ( (array!35125 (arr!16867 (Array (_ BitVec 32) (_ BitVec 64))) (size!17231 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35124)

(declare-datatypes ((List!10947 0))(
  ( (Nil!10944) (Cons!10943 (h!11937 (_ BitVec 64)) (t!17175 List!10947)) )
))
(declare-fun arrayNoDuplicates!0 (array!35124 (_ BitVec 32) List!10947) Bool)

(assert (=> b!558016 (= res!349884 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10944))))

(declare-fun b!558017 () Bool)

(declare-fun res!349887 () Bool)

(declare-fun e!321466 () Bool)

(assert (=> b!558017 (=> (not res!349887) (not e!321466))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558017 (= res!349887 (and (= (size!17231 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17231 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17231 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558018 () Bool)

(declare-fun res!349886 () Bool)

(assert (=> b!558018 (=> (not res!349886) (not e!321466))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558018 (= res!349886 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5316 0))(
  ( (MissingZero!5316 (index!23491 (_ BitVec 32))) (Found!5316 (index!23492 (_ BitVec 32))) (Intermediate!5316 (undefined!6128 Bool) (index!23493 (_ BitVec 32)) (x!52392 (_ BitVec 32))) (Undefined!5316) (MissingVacant!5316 (index!23494 (_ BitVec 32))) )
))
(declare-fun lt!253550 () SeekEntryResult!5316)

(declare-fun e!321463 () Bool)

(declare-fun b!558020 () Bool)

(get-info :version)

(assert (=> b!558020 (= e!321463 (not (or (undefined!6128 lt!253550) (not ((_ is Intermediate!5316) lt!253550)) (= (select (arr!16867 a!3118) (index!23493 lt!253550)) (select (arr!16867 a!3118) j!142)) (= (select (arr!16867 a!3118) (index!23493 lt!253550)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!321465 () Bool)

(assert (=> b!558020 e!321465))

(declare-fun res!349889 () Bool)

(assert (=> b!558020 (=> (not res!349889) (not e!321465))))

(declare-fun lt!253554 () SeekEntryResult!5316)

(assert (=> b!558020 (= res!349889 (= lt!253554 (Found!5316 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35124 (_ BitVec 32)) SeekEntryResult!5316)

(assert (=> b!558020 (= lt!253554 (seekEntryOrOpen!0 (select (arr!16867 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35124 (_ BitVec 32)) Bool)

(assert (=> b!558020 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17406 0))(
  ( (Unit!17407) )
))
(declare-fun lt!253552 () Unit!17406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17406)

(assert (=> b!558020 (= lt!253552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558021 () Bool)

(assert (=> b!558021 (= e!321466 e!321464)))

(declare-fun res!349883 () Bool)

(assert (=> b!558021 (=> (not res!349883) (not e!321464))))

(declare-fun lt!253551 () SeekEntryResult!5316)

(assert (=> b!558021 (= res!349883 (or (= lt!253551 (MissingZero!5316 i!1132)) (= lt!253551 (MissingVacant!5316 i!1132))))))

(assert (=> b!558021 (= lt!253551 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558022 () Bool)

(declare-fun e!321467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35124 (_ BitVec 32)) SeekEntryResult!5316)

(assert (=> b!558022 (= e!321467 (= lt!253554 (seekKeyOrZeroReturnVacant!0 (x!52392 lt!253550) (index!23493 lt!253550) (index!23493 lt!253550) (select (arr!16867 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558023 () Bool)

(declare-fun res!349888 () Bool)

(assert (=> b!558023 (=> (not res!349888) (not e!321466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558023 (= res!349888 (validKeyInArray!0 k0!1914))))

(declare-fun b!558024 () Bool)

(assert (=> b!558024 (= e!321465 e!321467)))

(declare-fun res!349885 () Bool)

(assert (=> b!558024 (=> res!349885 e!321467)))

(assert (=> b!558024 (= res!349885 (or (undefined!6128 lt!253550) (not ((_ is Intermediate!5316) lt!253550)) (= (select (arr!16867 a!3118) (index!23493 lt!253550)) (select (arr!16867 a!3118) j!142)) (= (select (arr!16867 a!3118) (index!23493 lt!253550)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558019 () Bool)

(declare-fun res!349880 () Bool)

(assert (=> b!558019 (=> (not res!349880) (not e!321466))))

(assert (=> b!558019 (= res!349880 (validKeyInArray!0 (select (arr!16867 a!3118) j!142)))))

(declare-fun res!349881 () Bool)

(assert (=> start!51070 (=> (not res!349881) (not e!321466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51070 (= res!349881 (validMask!0 mask!3119))))

(assert (=> start!51070 e!321466))

(assert (=> start!51070 true))

(declare-fun array_inv!12663 (array!35124) Bool)

(assert (=> start!51070 (array_inv!12663 a!3118)))

(declare-fun b!558025 () Bool)

(declare-fun res!349882 () Bool)

(assert (=> b!558025 (=> (not res!349882) (not e!321464))))

(assert (=> b!558025 (= res!349882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558026 () Bool)

(assert (=> b!558026 (= e!321464 e!321463)))

(declare-fun res!349879 () Bool)

(assert (=> b!558026 (=> (not res!349879) (not e!321463))))

(declare-fun lt!253555 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35124 (_ BitVec 32)) SeekEntryResult!5316)

(assert (=> b!558026 (= res!349879 (= lt!253550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253555 (select (store (arr!16867 a!3118) i!1132 k0!1914) j!142) (array!35125 (store (arr!16867 a!3118) i!1132 k0!1914) (size!17231 a!3118)) mask!3119)))))

(declare-fun lt!253553 () (_ BitVec 32))

(assert (=> b!558026 (= lt!253550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253553 (select (arr!16867 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558026 (= lt!253555 (toIndex!0 (select (store (arr!16867 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558026 (= lt!253553 (toIndex!0 (select (arr!16867 a!3118) j!142) mask!3119))))

(assert (= (and start!51070 res!349881) b!558017))

(assert (= (and b!558017 res!349887) b!558019))

(assert (= (and b!558019 res!349880) b!558023))

(assert (= (and b!558023 res!349888) b!558018))

(assert (= (and b!558018 res!349886) b!558021))

(assert (= (and b!558021 res!349883) b!558025))

(assert (= (and b!558025 res!349882) b!558016))

(assert (= (and b!558016 res!349884) b!558026))

(assert (= (and b!558026 res!349879) b!558020))

(assert (= (and b!558020 res!349889) b!558024))

(assert (= (and b!558024 (not res!349885)) b!558022))

(declare-fun m!535909 () Bool)

(assert (=> b!558026 m!535909))

(declare-fun m!535911 () Bool)

(assert (=> b!558026 m!535911))

(assert (=> b!558026 m!535909))

(declare-fun m!535913 () Bool)

(assert (=> b!558026 m!535913))

(assert (=> b!558026 m!535909))

(declare-fun m!535915 () Bool)

(assert (=> b!558026 m!535915))

(declare-fun m!535917 () Bool)

(assert (=> b!558026 m!535917))

(assert (=> b!558026 m!535913))

(declare-fun m!535919 () Bool)

(assert (=> b!558026 m!535919))

(assert (=> b!558026 m!535913))

(declare-fun m!535921 () Bool)

(assert (=> b!558026 m!535921))

(assert (=> b!558020 m!535909))

(declare-fun m!535923 () Bool)

(assert (=> b!558020 m!535923))

(assert (=> b!558020 m!535909))

(declare-fun m!535925 () Bool)

(assert (=> b!558020 m!535925))

(declare-fun m!535927 () Bool)

(assert (=> b!558020 m!535927))

(declare-fun m!535929 () Bool)

(assert (=> b!558020 m!535929))

(declare-fun m!535931 () Bool)

(assert (=> b!558021 m!535931))

(assert (=> b!558024 m!535927))

(assert (=> b!558024 m!535909))

(declare-fun m!535933 () Bool)

(assert (=> b!558018 m!535933))

(declare-fun m!535935 () Bool)

(assert (=> b!558016 m!535935))

(assert (=> b!558022 m!535909))

(assert (=> b!558022 m!535909))

(declare-fun m!535937 () Bool)

(assert (=> b!558022 m!535937))

(declare-fun m!535939 () Bool)

(assert (=> b!558025 m!535939))

(declare-fun m!535941 () Bool)

(assert (=> start!51070 m!535941))

(declare-fun m!535943 () Bool)

(assert (=> start!51070 m!535943))

(assert (=> b!558019 m!535909))

(assert (=> b!558019 m!535909))

(declare-fun m!535945 () Bool)

(assert (=> b!558019 m!535945))

(declare-fun m!535947 () Bool)

(assert (=> b!558023 m!535947))

(check-sat (not b!558021) (not b!558020) (not start!51070) (not b!558022) (not b!558026) (not b!558023) (not b!558019) (not b!558018) (not b!558025) (not b!558016))
(check-sat)
