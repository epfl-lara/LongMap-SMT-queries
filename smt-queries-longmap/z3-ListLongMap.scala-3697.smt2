; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50844 () Bool)

(assert start!50844)

(declare-fun b!555965 () Bool)

(declare-fun res!348278 () Bool)

(declare-fun e!320410 () Bool)

(assert (=> b!555965 (=> (not res!348278) (not e!320410))))

(declare-datatypes ((array!35016 0))(
  ( (array!35017 (arr!16816 (Array (_ BitVec 32) (_ BitVec 64))) (size!17180 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35016)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555965 (= res!348278 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555966 () Bool)

(declare-fun res!348279 () Bool)

(assert (=> b!555966 (=> (not res!348279) (not e!320410))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555966 (= res!348279 (and (= (size!17180 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17180 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17180 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555967 () Bool)

(declare-fun e!320409 () Bool)

(declare-fun e!320411 () Bool)

(assert (=> b!555967 (= e!320409 e!320411)))

(declare-fun res!348273 () Bool)

(assert (=> b!555967 (=> (not res!348273) (not e!320411))))

(declare-datatypes ((SeekEntryResult!5221 0))(
  ( (MissingZero!5221 (index!23111 (_ BitVec 32))) (Found!5221 (index!23112 (_ BitVec 32))) (Intermediate!5221 (undefined!6033 Bool) (index!23113 (_ BitVec 32)) (x!52162 (_ BitVec 32))) (Undefined!5221) (MissingVacant!5221 (index!23114 (_ BitVec 32))) )
))
(declare-fun lt!252747 () SeekEntryResult!5221)

(declare-fun lt!252748 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35016 (_ BitVec 32)) SeekEntryResult!5221)

(assert (=> b!555967 (= res!348273 (= lt!252747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252748 (select (store (arr!16816 a!3118) i!1132 k0!1914) j!142) (array!35017 (store (arr!16816 a!3118) i!1132 k0!1914) (size!17180 a!3118)) mask!3119)))))

(declare-fun lt!252746 () (_ BitVec 32))

(assert (=> b!555967 (= lt!252747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252746 (select (arr!16816 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555967 (= lt!252748 (toIndex!0 (select (store (arr!16816 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555967 (= lt!252746 (toIndex!0 (select (arr!16816 a!3118) j!142) mask!3119))))

(declare-fun b!555968 () Bool)

(declare-fun res!348276 () Bool)

(assert (=> b!555968 (=> (not res!348276) (not e!320409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35016 (_ BitVec 32)) Bool)

(assert (=> b!555968 (= res!348276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555969 () Bool)

(assert (=> b!555969 (= e!320410 e!320409)))

(declare-fun res!348274 () Bool)

(assert (=> b!555969 (=> (not res!348274) (not e!320409))))

(declare-fun lt!252744 () SeekEntryResult!5221)

(assert (=> b!555969 (= res!348274 (or (= lt!252744 (MissingZero!5221 i!1132)) (= lt!252744 (MissingVacant!5221 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35016 (_ BitVec 32)) SeekEntryResult!5221)

(assert (=> b!555969 (= lt!252744 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555970 () Bool)

(declare-fun res!348277 () Bool)

(assert (=> b!555970 (=> (not res!348277) (not e!320410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555970 (= res!348277 (validKeyInArray!0 (select (arr!16816 a!3118) j!142)))))

(declare-fun b!555971 () Bool)

(declare-fun res!348272 () Bool)

(assert (=> b!555971 (=> (not res!348272) (not e!320410))))

(assert (=> b!555971 (= res!348272 (validKeyInArray!0 k0!1914))))

(declare-fun b!555973 () Bool)

(declare-fun res!348280 () Bool)

(assert (=> b!555973 (=> (not res!348280) (not e!320409))))

(declare-datatypes ((List!10803 0))(
  ( (Nil!10800) (Cons!10799 (h!11787 (_ BitVec 64)) (t!17023 List!10803)) )
))
(declare-fun arrayNoDuplicates!0 (array!35016 (_ BitVec 32) List!10803) Bool)

(assert (=> b!555973 (= res!348280 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10800))))

(declare-fun res!348275 () Bool)

(assert (=> start!50844 (=> (not res!348275) (not e!320410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50844 (= res!348275 (validMask!0 mask!3119))))

(assert (=> start!50844 e!320410))

(assert (=> start!50844 true))

(declare-fun array_inv!12675 (array!35016) Bool)

(assert (=> start!50844 (array_inv!12675 a!3118)))

(declare-fun b!555972 () Bool)

(assert (=> b!555972 (= e!320411 (not true))))

(declare-fun lt!252743 () SeekEntryResult!5221)

(get-info :version)

(assert (=> b!555972 (and (= lt!252743 (Found!5221 j!142)) (or (undefined!6033 lt!252747) (not ((_ is Intermediate!5221) lt!252747)) (= (select (arr!16816 a!3118) (index!23113 lt!252747)) (select (arr!16816 a!3118) j!142)) (not (= (select (arr!16816 a!3118) (index!23113 lt!252747)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252743 (MissingZero!5221 (index!23113 lt!252747)))))))

(assert (=> b!555972 (= lt!252743 (seekEntryOrOpen!0 (select (arr!16816 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555972 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17287 0))(
  ( (Unit!17288) )
))
(declare-fun lt!252745 () Unit!17287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17287)

(assert (=> b!555972 (= lt!252745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50844 res!348275) b!555966))

(assert (= (and b!555966 res!348279) b!555970))

(assert (= (and b!555970 res!348277) b!555971))

(assert (= (and b!555971 res!348272) b!555965))

(assert (= (and b!555965 res!348278) b!555969))

(assert (= (and b!555969 res!348274) b!555968))

(assert (= (and b!555968 res!348276) b!555973))

(assert (= (and b!555973 res!348280) b!555967))

(assert (= (and b!555967 res!348273) b!555972))

(declare-fun m!533921 () Bool)

(assert (=> b!555968 m!533921))

(declare-fun m!533923 () Bool)

(assert (=> start!50844 m!533923))

(declare-fun m!533925 () Bool)

(assert (=> start!50844 m!533925))

(declare-fun m!533927 () Bool)

(assert (=> b!555973 m!533927))

(declare-fun m!533929 () Bool)

(assert (=> b!555969 m!533929))

(declare-fun m!533931 () Bool)

(assert (=> b!555971 m!533931))

(declare-fun m!533933 () Bool)

(assert (=> b!555972 m!533933))

(declare-fun m!533935 () Bool)

(assert (=> b!555972 m!533935))

(declare-fun m!533937 () Bool)

(assert (=> b!555972 m!533937))

(declare-fun m!533939 () Bool)

(assert (=> b!555972 m!533939))

(assert (=> b!555972 m!533933))

(declare-fun m!533941 () Bool)

(assert (=> b!555972 m!533941))

(assert (=> b!555967 m!533933))

(declare-fun m!533943 () Bool)

(assert (=> b!555967 m!533943))

(assert (=> b!555967 m!533933))

(declare-fun m!533945 () Bool)

(assert (=> b!555967 m!533945))

(declare-fun m!533947 () Bool)

(assert (=> b!555967 m!533947))

(assert (=> b!555967 m!533945))

(declare-fun m!533949 () Bool)

(assert (=> b!555967 m!533949))

(assert (=> b!555967 m!533933))

(declare-fun m!533951 () Bool)

(assert (=> b!555967 m!533951))

(assert (=> b!555967 m!533945))

(declare-fun m!533953 () Bool)

(assert (=> b!555967 m!533953))

(declare-fun m!533955 () Bool)

(assert (=> b!555965 m!533955))

(assert (=> b!555970 m!533933))

(assert (=> b!555970 m!533933))

(declare-fun m!533957 () Bool)

(assert (=> b!555970 m!533957))

(check-sat (not b!555971) (not b!555969) (not b!555972) (not b!555970) (not start!50844) (not b!555965) (not b!555968) (not b!555973) (not b!555967))
(check-sat)
