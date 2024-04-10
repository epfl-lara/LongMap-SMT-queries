; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50740 () Bool)

(assert start!50740)

(declare-fun b!554982 () Bool)

(declare-fun e!319933 () Bool)

(declare-fun e!319935 () Bool)

(assert (=> b!554982 (= e!319933 e!319935)))

(declare-fun res!347398 () Bool)

(assert (=> b!554982 (=> (not res!347398) (not e!319935))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252113 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5241 0))(
  ( (MissingZero!5241 (index!23191 (_ BitVec 32))) (Found!5241 (index!23192 (_ BitVec 32))) (Intermediate!5241 (undefined!6053 Bool) (index!23193 (_ BitVec 32)) (x!52099 (_ BitVec 32))) (Undefined!5241) (MissingVacant!5241 (index!23194 (_ BitVec 32))) )
))
(declare-fun lt!252115 () SeekEntryResult!5241)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34965 0))(
  ( (array!34966 (arr!16792 (Array (_ BitVec 32) (_ BitVec 64))) (size!17156 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34965)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34965 (_ BitVec 32)) SeekEntryResult!5241)

(assert (=> b!554982 (= res!347398 (= lt!252115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252113 (select (store (arr!16792 a!3118) i!1132 k0!1914) j!142) (array!34966 (store (arr!16792 a!3118) i!1132 k0!1914) (size!17156 a!3118)) mask!3119)))))

(declare-fun lt!252110 () (_ BitVec 32))

(assert (=> b!554982 (= lt!252115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252110 (select (arr!16792 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554982 (= lt!252113 (toIndex!0 (select (store (arr!16792 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554982 (= lt!252110 (toIndex!0 (select (arr!16792 a!3118) j!142) mask!3119))))

(declare-fun b!554983 () Bool)

(assert (=> b!554983 (= e!319935 (not true))))

(declare-fun lt!252112 () SeekEntryResult!5241)

(get-info :version)

(assert (=> b!554983 (and (= lt!252112 (Found!5241 j!142)) (or (undefined!6053 lt!252115) (not ((_ is Intermediate!5241) lt!252115)) (= (select (arr!16792 a!3118) (index!23193 lt!252115)) (select (arr!16792 a!3118) j!142)) (not (= (select (arr!16792 a!3118) (index!23193 lt!252115)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252112 (MissingZero!5241 (index!23193 lt!252115)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34965 (_ BitVec 32)) SeekEntryResult!5241)

(assert (=> b!554983 (= lt!252112 (seekEntryOrOpen!0 (select (arr!16792 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34965 (_ BitVec 32)) Bool)

(assert (=> b!554983 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17256 0))(
  ( (Unit!17257) )
))
(declare-fun lt!252114 () Unit!17256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17256)

(assert (=> b!554983 (= lt!252114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554984 () Bool)

(declare-fun res!347395 () Bool)

(declare-fun e!319932 () Bool)

(assert (=> b!554984 (=> (not res!347395) (not e!319932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554984 (= res!347395 (validKeyInArray!0 k0!1914))))

(declare-fun b!554985 () Bool)

(declare-fun res!347396 () Bool)

(assert (=> b!554985 (=> (not res!347396) (not e!319933))))

(declare-datatypes ((List!10872 0))(
  ( (Nil!10869) (Cons!10868 (h!11853 (_ BitVec 64)) (t!17100 List!10872)) )
))
(declare-fun arrayNoDuplicates!0 (array!34965 (_ BitVec 32) List!10872) Bool)

(assert (=> b!554985 (= res!347396 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10869))))

(declare-fun res!347394 () Bool)

(assert (=> start!50740 (=> (not res!347394) (not e!319932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50740 (= res!347394 (validMask!0 mask!3119))))

(assert (=> start!50740 e!319932))

(assert (=> start!50740 true))

(declare-fun array_inv!12588 (array!34965) Bool)

(assert (=> start!50740 (array_inv!12588 a!3118)))

(declare-fun b!554986 () Bool)

(declare-fun res!347402 () Bool)

(assert (=> b!554986 (=> (not res!347402) (not e!319932))))

(declare-fun arrayContainsKey!0 (array!34965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554986 (= res!347402 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554987 () Bool)

(declare-fun res!347400 () Bool)

(assert (=> b!554987 (=> (not res!347400) (not e!319932))))

(assert (=> b!554987 (= res!347400 (validKeyInArray!0 (select (arr!16792 a!3118) j!142)))))

(declare-fun b!554988 () Bool)

(declare-fun res!347401 () Bool)

(assert (=> b!554988 (=> (not res!347401) (not e!319932))))

(assert (=> b!554988 (= res!347401 (and (= (size!17156 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17156 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17156 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554989 () Bool)

(declare-fun res!347397 () Bool)

(assert (=> b!554989 (=> (not res!347397) (not e!319933))))

(assert (=> b!554989 (= res!347397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554990 () Bool)

(assert (=> b!554990 (= e!319932 e!319933)))

(declare-fun res!347399 () Bool)

(assert (=> b!554990 (=> (not res!347399) (not e!319933))))

(declare-fun lt!252111 () SeekEntryResult!5241)

(assert (=> b!554990 (= res!347399 (or (= lt!252111 (MissingZero!5241 i!1132)) (= lt!252111 (MissingVacant!5241 i!1132))))))

(assert (=> b!554990 (= lt!252111 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50740 res!347394) b!554988))

(assert (= (and b!554988 res!347401) b!554987))

(assert (= (and b!554987 res!347400) b!554984))

(assert (= (and b!554984 res!347395) b!554986))

(assert (= (and b!554986 res!347402) b!554990))

(assert (= (and b!554990 res!347399) b!554989))

(assert (= (and b!554989 res!347397) b!554985))

(assert (= (and b!554985 res!347396) b!554982))

(assert (= (and b!554982 res!347398) b!554983))

(declare-fun m!532481 () Bool)

(assert (=> b!554990 m!532481))

(declare-fun m!532483 () Bool)

(assert (=> start!50740 m!532483))

(declare-fun m!532485 () Bool)

(assert (=> start!50740 m!532485))

(declare-fun m!532487 () Bool)

(assert (=> b!554989 m!532487))

(declare-fun m!532489 () Bool)

(assert (=> b!554987 m!532489))

(assert (=> b!554987 m!532489))

(declare-fun m!532491 () Bool)

(assert (=> b!554987 m!532491))

(declare-fun m!532493 () Bool)

(assert (=> b!554985 m!532493))

(declare-fun m!532495 () Bool)

(assert (=> b!554984 m!532495))

(assert (=> b!554982 m!532489))

(declare-fun m!532497 () Bool)

(assert (=> b!554982 m!532497))

(assert (=> b!554982 m!532489))

(declare-fun m!532499 () Bool)

(assert (=> b!554982 m!532499))

(assert (=> b!554982 m!532489))

(declare-fun m!532501 () Bool)

(assert (=> b!554982 m!532501))

(assert (=> b!554982 m!532499))

(declare-fun m!532503 () Bool)

(assert (=> b!554982 m!532503))

(declare-fun m!532505 () Bool)

(assert (=> b!554982 m!532505))

(assert (=> b!554982 m!532499))

(declare-fun m!532507 () Bool)

(assert (=> b!554982 m!532507))

(declare-fun m!532509 () Bool)

(assert (=> b!554983 m!532509))

(assert (=> b!554983 m!532489))

(declare-fun m!532511 () Bool)

(assert (=> b!554983 m!532511))

(declare-fun m!532513 () Bool)

(assert (=> b!554983 m!532513))

(assert (=> b!554983 m!532489))

(declare-fun m!532515 () Bool)

(assert (=> b!554983 m!532515))

(declare-fun m!532517 () Bool)

(assert (=> b!554986 m!532517))

(check-sat (not b!554984) (not b!554989) (not b!554987) (not b!554986) (not b!554985) (not b!554982) (not start!50740) (not b!554990) (not b!554983))
(check-sat)
