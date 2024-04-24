; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50634 () Bool)

(assert start!50634)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!552934 () Bool)

(declare-fun e!319070 () Bool)

(declare-datatypes ((array!34806 0))(
  ( (array!34807 (arr!16711 (Array (_ BitVec 32) (_ BitVec 64))) (size!17075 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34806)

(declare-datatypes ((SeekEntryResult!5116 0))(
  ( (MissingZero!5116 (index!22691 (_ BitVec 32))) (Found!5116 (index!22692 (_ BitVec 32))) (Intermediate!5116 (undefined!5928 Bool) (index!22693 (_ BitVec 32)) (x!51777 (_ BitVec 32))) (Undefined!5116) (MissingVacant!5116 (index!22694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34806 (_ BitVec 32)) SeekEntryResult!5116)

(assert (=> b!552934 (= e!319070 (= (seekEntryOrOpen!0 (select (arr!16711 a!3118) j!142) a!3118 mask!3119) (Found!5116 j!142)))))

(declare-fun b!552935 () Bool)

(declare-fun res!345242 () Bool)

(declare-fun e!319071 () Bool)

(assert (=> b!552935 (=> (not res!345242) (not e!319071))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552935 (= res!345242 (and (= (size!17075 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17075 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17075 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552936 () Bool)

(declare-fun res!345246 () Bool)

(declare-fun e!319069 () Bool)

(assert (=> b!552936 (=> (not res!345246) (not e!319069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34806 (_ BitVec 32)) Bool)

(assert (=> b!552936 (= res!345246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552937 () Bool)

(declare-fun res!345245 () Bool)

(assert (=> b!552937 (=> (not res!345245) (not e!319069))))

(declare-datatypes ((List!10698 0))(
  ( (Nil!10695) (Cons!10694 (h!11682 (_ BitVec 64)) (t!16918 List!10698)) )
))
(declare-fun arrayNoDuplicates!0 (array!34806 (_ BitVec 32) List!10698) Bool)

(assert (=> b!552937 (= res!345245 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10695))))

(declare-fun b!552938 () Bool)

(assert (=> b!552938 (= e!319071 e!319069)))

(declare-fun res!345248 () Bool)

(assert (=> b!552938 (=> (not res!345248) (not e!319069))))

(declare-fun lt!251377 () SeekEntryResult!5116)

(assert (=> b!552938 (= res!345248 (or (= lt!251377 (MissingZero!5116 i!1132)) (= lt!251377 (MissingVacant!5116 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!552938 (= lt!251377 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552939 () Bool)

(declare-fun res!345243 () Bool)

(assert (=> b!552939 (=> (not res!345243) (not e!319069))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34806 (_ BitVec 32)) SeekEntryResult!5116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552939 (= res!345243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16711 a!3118) j!142) mask!3119) (select (arr!16711 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16711 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16711 a!3118) i!1132 k0!1914) j!142) (array!34807 (store (arr!16711 a!3118) i!1132 k0!1914) (size!17075 a!3118)) mask!3119)))))

(declare-fun b!552940 () Bool)

(declare-fun res!345247 () Bool)

(assert (=> b!552940 (=> (not res!345247) (not e!319071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552940 (= res!345247 (validKeyInArray!0 k0!1914))))

(declare-fun res!345244 () Bool)

(assert (=> start!50634 (=> (not res!345244) (not e!319071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50634 (= res!345244 (validMask!0 mask!3119))))

(assert (=> start!50634 e!319071))

(assert (=> start!50634 true))

(declare-fun array_inv!12570 (array!34806) Bool)

(assert (=> start!50634 (array_inv!12570 a!3118)))

(declare-fun b!552941 () Bool)

(assert (=> b!552941 (= e!319069 (not true))))

(assert (=> b!552941 e!319070))

(declare-fun res!345250 () Bool)

(assert (=> b!552941 (=> (not res!345250) (not e!319070))))

(assert (=> b!552941 (= res!345250 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17077 0))(
  ( (Unit!17078) )
))
(declare-fun lt!251376 () Unit!17077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17077)

(assert (=> b!552941 (= lt!251376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552942 () Bool)

(declare-fun res!345249 () Bool)

(assert (=> b!552942 (=> (not res!345249) (not e!319071))))

(assert (=> b!552942 (= res!345249 (validKeyInArray!0 (select (arr!16711 a!3118) j!142)))))

(declare-fun b!552943 () Bool)

(declare-fun res!345241 () Bool)

(assert (=> b!552943 (=> (not res!345241) (not e!319071))))

(declare-fun arrayContainsKey!0 (array!34806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552943 (= res!345241 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50634 res!345244) b!552935))

(assert (= (and b!552935 res!345242) b!552942))

(assert (= (and b!552942 res!345249) b!552940))

(assert (= (and b!552940 res!345247) b!552943))

(assert (= (and b!552943 res!345241) b!552938))

(assert (= (and b!552938 res!345248) b!552936))

(assert (= (and b!552936 res!345246) b!552937))

(assert (= (and b!552937 res!345245) b!552939))

(assert (= (and b!552939 res!345243) b!552941))

(assert (= (and b!552941 res!345250) b!552934))

(declare-fun m!530015 () Bool)

(assert (=> start!50634 m!530015))

(declare-fun m!530017 () Bool)

(assert (=> start!50634 m!530017))

(declare-fun m!530019 () Bool)

(assert (=> b!552937 m!530019))

(declare-fun m!530021 () Bool)

(assert (=> b!552936 m!530021))

(declare-fun m!530023 () Bool)

(assert (=> b!552940 m!530023))

(declare-fun m!530025 () Bool)

(assert (=> b!552942 m!530025))

(assert (=> b!552942 m!530025))

(declare-fun m!530027 () Bool)

(assert (=> b!552942 m!530027))

(assert (=> b!552939 m!530025))

(declare-fun m!530029 () Bool)

(assert (=> b!552939 m!530029))

(assert (=> b!552939 m!530025))

(declare-fun m!530031 () Bool)

(assert (=> b!552939 m!530031))

(declare-fun m!530033 () Bool)

(assert (=> b!552939 m!530033))

(assert (=> b!552939 m!530031))

(declare-fun m!530035 () Bool)

(assert (=> b!552939 m!530035))

(assert (=> b!552939 m!530029))

(assert (=> b!552939 m!530025))

(declare-fun m!530037 () Bool)

(assert (=> b!552939 m!530037))

(declare-fun m!530039 () Bool)

(assert (=> b!552939 m!530039))

(assert (=> b!552939 m!530031))

(assert (=> b!552939 m!530033))

(declare-fun m!530041 () Bool)

(assert (=> b!552938 m!530041))

(declare-fun m!530043 () Bool)

(assert (=> b!552941 m!530043))

(declare-fun m!530045 () Bool)

(assert (=> b!552941 m!530045))

(declare-fun m!530047 () Bool)

(assert (=> b!552943 m!530047))

(assert (=> b!552934 m!530025))

(assert (=> b!552934 m!530025))

(declare-fun m!530049 () Bool)

(assert (=> b!552934 m!530049))

(check-sat (not b!552939) (not b!552942) (not b!552937) (not b!552938) (not b!552943) (not b!552940) (not b!552936) (not b!552941) (not b!552934) (not start!50634))
(check-sat)
