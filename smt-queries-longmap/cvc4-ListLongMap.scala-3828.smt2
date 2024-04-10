; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52458 () Bool)

(assert start!52458)

(declare-fun b!572894 () Bool)

(declare-fun res!362405 () Bool)

(declare-fun e!329556 () Bool)

(assert (=> b!572894 (=> (not res!362405) (not e!329556))))

(declare-datatypes ((array!35855 0))(
  ( (array!35856 (arr!17216 (Array (_ BitVec 32) (_ BitVec 64))) (size!17580 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35855)

(declare-datatypes ((List!11296 0))(
  ( (Nil!11293) (Cons!11292 (h!12319 (_ BitVec 64)) (t!17524 List!11296)) )
))
(declare-fun arrayNoDuplicates!0 (array!35855 (_ BitVec 32) List!11296) Bool)

(assert (=> b!572894 (= res!362405 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11293))))

(declare-fun b!572895 () Bool)

(declare-fun e!329561 () Bool)

(assert (=> b!572895 (= e!329561 (not true))))

(declare-fun e!329559 () Bool)

(assert (=> b!572895 e!329559))

(declare-fun res!362402 () Bool)

(assert (=> b!572895 (=> (not res!362402) (not e!329559))))

(declare-datatypes ((SeekEntryResult!5665 0))(
  ( (MissingZero!5665 (index!24887 (_ BitVec 32))) (Found!5665 (index!24888 (_ BitVec 32))) (Intermediate!5665 (undefined!6477 Bool) (index!24889 (_ BitVec 32)) (x!53750 (_ BitVec 32))) (Undefined!5665) (MissingVacant!5665 (index!24890 (_ BitVec 32))) )
))
(declare-fun lt!261551 () SeekEntryResult!5665)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572895 (= res!362402 (= lt!261551 (Found!5665 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35855 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572895 (= lt!261551 (seekEntryOrOpen!0 (select (arr!17216 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35855 (_ BitVec 32)) Bool)

(assert (=> b!572895 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18032 0))(
  ( (Unit!18033) )
))
(declare-fun lt!261556 () Unit!18032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18032)

(assert (=> b!572895 (= lt!261556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!362407 () Bool)

(declare-fun e!329557 () Bool)

(assert (=> start!52458 (=> (not res!362407) (not e!329557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52458 (= res!362407 (validMask!0 mask!3119))))

(assert (=> start!52458 e!329557))

(assert (=> start!52458 true))

(declare-fun array_inv!13012 (array!35855) Bool)

(assert (=> start!52458 (array_inv!13012 a!3118)))

(declare-fun b!572896 () Bool)

(declare-fun res!362413 () Bool)

(assert (=> b!572896 (=> (not res!362413) (not e!329557))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572896 (= res!362413 (and (= (size!17580 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17580 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17580 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572897 () Bool)

(declare-fun e!329558 () Bool)

(declare-fun e!329555 () Bool)

(assert (=> b!572897 (= e!329558 e!329555)))

(declare-fun res!362411 () Bool)

(assert (=> b!572897 (=> res!362411 e!329555)))

(declare-fun lt!261552 () (_ BitVec 64))

(assert (=> b!572897 (= res!362411 (or (= lt!261552 (select (arr!17216 a!3118) j!142)) (= lt!261552 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!261557 () SeekEntryResult!5665)

(assert (=> b!572897 (= lt!261552 (select (arr!17216 a!3118) (index!24889 lt!261557)))))

(declare-fun lt!261555 () (_ BitVec 64))

(declare-fun b!572898 () Bool)

(declare-fun lt!261553 () array!35855)

(declare-fun e!329562 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35855 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572898 (= e!329562 (= (seekEntryOrOpen!0 lt!261555 lt!261553 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53750 lt!261557) (index!24889 lt!261557) (index!24889 lt!261557) lt!261555 lt!261553 mask!3119)))))

(declare-fun b!572899 () Bool)

(assert (=> b!572899 (= e!329557 e!329556)))

(declare-fun res!362410 () Bool)

(assert (=> b!572899 (=> (not res!362410) (not e!329556))))

(declare-fun lt!261559 () SeekEntryResult!5665)

(assert (=> b!572899 (= res!362410 (or (= lt!261559 (MissingZero!5665 i!1132)) (= lt!261559 (MissingVacant!5665 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!572899 (= lt!261559 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572900 () Bool)

(assert (=> b!572900 (= e!329556 e!329561)))

(declare-fun res!362409 () Bool)

(assert (=> b!572900 (=> (not res!362409) (not e!329561))))

(declare-fun lt!261554 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35855 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572900 (= res!362409 (= lt!261557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261554 lt!261555 lt!261553 mask!3119)))))

(declare-fun lt!261558 () (_ BitVec 32))

(assert (=> b!572900 (= lt!261557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261558 (select (arr!17216 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572900 (= lt!261554 (toIndex!0 lt!261555 mask!3119))))

(assert (=> b!572900 (= lt!261555 (select (store (arr!17216 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572900 (= lt!261558 (toIndex!0 (select (arr!17216 a!3118) j!142) mask!3119))))

(assert (=> b!572900 (= lt!261553 (array!35856 (store (arr!17216 a!3118) i!1132 k!1914) (size!17580 a!3118)))))

(declare-fun b!572901 () Bool)

(declare-fun res!362408 () Bool)

(assert (=> b!572901 (=> (not res!362408) (not e!329556))))

(assert (=> b!572901 (= res!362408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572902 () Bool)

(declare-fun res!362404 () Bool)

(assert (=> b!572902 (=> (not res!362404) (not e!329557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572902 (= res!362404 (validKeyInArray!0 (select (arr!17216 a!3118) j!142)))))

(declare-fun b!572903 () Bool)

(assert (=> b!572903 (= e!329559 e!329558)))

(declare-fun res!362414 () Bool)

(assert (=> b!572903 (=> res!362414 e!329558)))

(assert (=> b!572903 (= res!362414 (or (undefined!6477 lt!261557) (not (is-Intermediate!5665 lt!261557))))))

(declare-fun b!572904 () Bool)

(assert (=> b!572904 (= e!329555 e!329562)))

(declare-fun res!362412 () Bool)

(assert (=> b!572904 (=> (not res!362412) (not e!329562))))

(assert (=> b!572904 (= res!362412 (= lt!261551 (seekKeyOrZeroReturnVacant!0 (x!53750 lt!261557) (index!24889 lt!261557) (index!24889 lt!261557) (select (arr!17216 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572905 () Bool)

(declare-fun res!362403 () Bool)

(assert (=> b!572905 (=> (not res!362403) (not e!329557))))

(declare-fun arrayContainsKey!0 (array!35855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572905 (= res!362403 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572906 () Bool)

(declare-fun res!362406 () Bool)

(assert (=> b!572906 (=> (not res!362406) (not e!329557))))

(assert (=> b!572906 (= res!362406 (validKeyInArray!0 k!1914))))

(assert (= (and start!52458 res!362407) b!572896))

(assert (= (and b!572896 res!362413) b!572902))

(assert (= (and b!572902 res!362404) b!572906))

(assert (= (and b!572906 res!362406) b!572905))

(assert (= (and b!572905 res!362403) b!572899))

(assert (= (and b!572899 res!362410) b!572901))

(assert (= (and b!572901 res!362408) b!572894))

(assert (= (and b!572894 res!362405) b!572900))

(assert (= (and b!572900 res!362409) b!572895))

(assert (= (and b!572895 res!362402) b!572903))

(assert (= (and b!572903 (not res!362414)) b!572897))

(assert (= (and b!572897 (not res!362411)) b!572904))

(assert (= (and b!572904 res!362412) b!572898))

(declare-fun m!551929 () Bool)

(assert (=> b!572902 m!551929))

(assert (=> b!572902 m!551929))

(declare-fun m!551931 () Bool)

(assert (=> b!572902 m!551931))

(assert (=> b!572897 m!551929))

(declare-fun m!551933 () Bool)

(assert (=> b!572897 m!551933))

(declare-fun m!551935 () Bool)

(assert (=> b!572906 m!551935))

(declare-fun m!551937 () Bool)

(assert (=> b!572905 m!551937))

(assert (=> b!572904 m!551929))

(assert (=> b!572904 m!551929))

(declare-fun m!551939 () Bool)

(assert (=> b!572904 m!551939))

(assert (=> b!572900 m!551929))

(declare-fun m!551941 () Bool)

(assert (=> b!572900 m!551941))

(assert (=> b!572900 m!551929))

(declare-fun m!551943 () Bool)

(assert (=> b!572900 m!551943))

(assert (=> b!572900 m!551929))

(declare-fun m!551945 () Bool)

(assert (=> b!572900 m!551945))

(declare-fun m!551947 () Bool)

(assert (=> b!572900 m!551947))

(declare-fun m!551949 () Bool)

(assert (=> b!572900 m!551949))

(declare-fun m!551951 () Bool)

(assert (=> b!572900 m!551951))

(declare-fun m!551953 () Bool)

(assert (=> b!572899 m!551953))

(declare-fun m!551955 () Bool)

(assert (=> b!572898 m!551955))

(declare-fun m!551957 () Bool)

(assert (=> b!572898 m!551957))

(declare-fun m!551959 () Bool)

(assert (=> b!572901 m!551959))

(declare-fun m!551961 () Bool)

(assert (=> b!572894 m!551961))

(declare-fun m!551963 () Bool)

(assert (=> start!52458 m!551963))

(declare-fun m!551965 () Bool)

(assert (=> start!52458 m!551965))

(assert (=> b!572895 m!551929))

(assert (=> b!572895 m!551929))

(declare-fun m!551967 () Bool)

(assert (=> b!572895 m!551967))

(declare-fun m!551969 () Bool)

(assert (=> b!572895 m!551969))

(declare-fun m!551971 () Bool)

(assert (=> b!572895 m!551971))

(push 1)

