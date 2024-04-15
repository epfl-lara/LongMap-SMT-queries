; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50576 () Bool)

(assert start!50576)

(declare-fun b!552463 () Bool)

(declare-fun res!345021 () Bool)

(declare-fun e!318765 () Bool)

(assert (=> b!552463 (=> (not res!345021) (not e!318765))))

(declare-datatypes ((array!34810 0))(
  ( (array!34811 (arr!16715 (Array (_ BitVec 32) (_ BitVec 64))) (size!17080 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34810)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552463 (= res!345021 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552464 () Bool)

(declare-fun res!345024 () Bool)

(declare-fun e!318768 () Bool)

(assert (=> b!552464 (=> (not res!345024) (not e!318768))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5161 0))(
  ( (MissingZero!5161 (index!22871 (_ BitVec 32))) (Found!5161 (index!22872 (_ BitVec 32))) (Intermediate!5161 (undefined!5973 Bool) (index!22873 (_ BitVec 32)) (x!51814 (_ BitVec 32))) (Undefined!5161) (MissingVacant!5161 (index!22874 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34810 (_ BitVec 32)) SeekEntryResult!5161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552464 (= res!345024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16715 a!3118) j!142) mask!3119) (select (arr!16715 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16715 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16715 a!3118) i!1132 k0!1914) j!142) (array!34811 (store (arr!16715 a!3118) i!1132 k0!1914) (size!17080 a!3118)) mask!3119)))))

(declare-fun b!552465 () Bool)

(assert (=> b!552465 (= e!318765 e!318768)))

(declare-fun res!345020 () Bool)

(assert (=> b!552465 (=> (not res!345020) (not e!318768))))

(declare-fun lt!251031 () SeekEntryResult!5161)

(assert (=> b!552465 (= res!345020 (or (= lt!251031 (MissingZero!5161 i!1132)) (= lt!251031 (MissingVacant!5161 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34810 (_ BitVec 32)) SeekEntryResult!5161)

(assert (=> b!552465 (= lt!251031 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552466 () Bool)

(declare-fun res!345022 () Bool)

(assert (=> b!552466 (=> (not res!345022) (not e!318765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552466 (= res!345022 (validKeyInArray!0 k0!1914))))

(declare-fun b!552467 () Bool)

(declare-fun res!345026 () Bool)

(assert (=> b!552467 (=> (not res!345026) (not e!318768))))

(declare-datatypes ((List!10834 0))(
  ( (Nil!10831) (Cons!10830 (h!11815 (_ BitVec 64)) (t!17053 List!10834)) )
))
(declare-fun arrayNoDuplicates!0 (array!34810 (_ BitVec 32) List!10834) Bool)

(assert (=> b!552467 (= res!345026 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10831))))

(declare-fun res!345023 () Bool)

(assert (=> start!50576 (=> (not res!345023) (not e!318765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50576 (= res!345023 (validMask!0 mask!3119))))

(assert (=> start!50576 e!318765))

(assert (=> start!50576 true))

(declare-fun array_inv!12598 (array!34810) Bool)

(assert (=> start!50576 (array_inv!12598 a!3118)))

(declare-fun b!552468 () Bool)

(assert (=> b!552468 (= e!318768 (not true))))

(declare-fun e!318767 () Bool)

(assert (=> b!552468 e!318767))

(declare-fun res!345018 () Bool)

(assert (=> b!552468 (=> (not res!345018) (not e!318767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34810 (_ BitVec 32)) Bool)

(assert (=> b!552468 (= res!345018 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17082 0))(
  ( (Unit!17083) )
))
(declare-fun lt!251032 () Unit!17082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17082)

(assert (=> b!552468 (= lt!251032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552469 () Bool)

(declare-fun res!345019 () Bool)

(assert (=> b!552469 (=> (not res!345019) (not e!318765))))

(assert (=> b!552469 (= res!345019 (validKeyInArray!0 (select (arr!16715 a!3118) j!142)))))

(declare-fun b!552470 () Bool)

(assert (=> b!552470 (= e!318767 (= (seekEntryOrOpen!0 (select (arr!16715 a!3118) j!142) a!3118 mask!3119) (Found!5161 j!142)))))

(declare-fun b!552471 () Bool)

(declare-fun res!345025 () Bool)

(assert (=> b!552471 (=> (not res!345025) (not e!318768))))

(assert (=> b!552471 (= res!345025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552472 () Bool)

(declare-fun res!345017 () Bool)

(assert (=> b!552472 (=> (not res!345017) (not e!318765))))

(assert (=> b!552472 (= res!345017 (and (= (size!17080 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17080 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17080 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50576 res!345023) b!552472))

(assert (= (and b!552472 res!345017) b!552469))

(assert (= (and b!552469 res!345019) b!552466))

(assert (= (and b!552466 res!345022) b!552463))

(assert (= (and b!552463 res!345021) b!552465))

(assert (= (and b!552465 res!345020) b!552471))

(assert (= (and b!552471 res!345025) b!552467))

(assert (= (and b!552467 res!345026) b!552464))

(assert (= (and b!552464 res!345024) b!552468))

(assert (= (and b!552468 res!345018) b!552470))

(declare-fun m!528905 () Bool)

(assert (=> b!552465 m!528905))

(declare-fun m!528907 () Bool)

(assert (=> b!552464 m!528907))

(declare-fun m!528909 () Bool)

(assert (=> b!552464 m!528909))

(assert (=> b!552464 m!528907))

(declare-fun m!528911 () Bool)

(assert (=> b!552464 m!528911))

(declare-fun m!528913 () Bool)

(assert (=> b!552464 m!528913))

(assert (=> b!552464 m!528911))

(declare-fun m!528915 () Bool)

(assert (=> b!552464 m!528915))

(assert (=> b!552464 m!528909))

(assert (=> b!552464 m!528907))

(declare-fun m!528917 () Bool)

(assert (=> b!552464 m!528917))

(declare-fun m!528919 () Bool)

(assert (=> b!552464 m!528919))

(assert (=> b!552464 m!528911))

(assert (=> b!552464 m!528913))

(declare-fun m!528921 () Bool)

(assert (=> b!552471 m!528921))

(declare-fun m!528923 () Bool)

(assert (=> b!552463 m!528923))

(declare-fun m!528925 () Bool)

(assert (=> start!50576 m!528925))

(declare-fun m!528927 () Bool)

(assert (=> start!50576 m!528927))

(declare-fun m!528929 () Bool)

(assert (=> b!552467 m!528929))

(declare-fun m!528931 () Bool)

(assert (=> b!552468 m!528931))

(declare-fun m!528933 () Bool)

(assert (=> b!552468 m!528933))

(assert (=> b!552470 m!528907))

(assert (=> b!552470 m!528907))

(declare-fun m!528935 () Bool)

(assert (=> b!552470 m!528935))

(declare-fun m!528937 () Bool)

(assert (=> b!552466 m!528937))

(assert (=> b!552469 m!528907))

(assert (=> b!552469 m!528907))

(declare-fun m!528939 () Bool)

(assert (=> b!552469 m!528939))

(check-sat (not b!552469) (not b!552466) (not b!552465) (not b!552471) (not b!552463) (not b!552467) (not b!552468) (not b!552470) (not b!552464) (not start!50576))
(check-sat)
