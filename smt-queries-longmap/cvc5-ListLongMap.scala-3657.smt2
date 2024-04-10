; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50498 () Bool)

(assert start!50498)

(declare-fun b!551984 () Bool)

(declare-fun e!318548 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!551984 (= e!318548 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318546 () Bool)

(assert (=> b!551984 e!318546))

(declare-fun res!344585 () Bool)

(assert (=> b!551984 (=> (not res!344585) (not e!318546))))

(declare-datatypes ((array!34780 0))(
  ( (array!34781 (arr!16701 (Array (_ BitVec 32) (_ BitVec 64))) (size!17065 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34780)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34780 (_ BitVec 32)) Bool)

(assert (=> b!551984 (= res!344585 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17074 0))(
  ( (Unit!17075) )
))
(declare-fun lt!251011 () Unit!17074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17074)

(assert (=> b!551984 (= lt!251011 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551985 () Bool)

(declare-fun res!344587 () Bool)

(assert (=> b!551985 (=> (not res!344587) (not e!318548))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5150 0))(
  ( (MissingZero!5150 (index!22827 (_ BitVec 32))) (Found!5150 (index!22828 (_ BitVec 32))) (Intermediate!5150 (undefined!5962 Bool) (index!22829 (_ BitVec 32)) (x!51762 (_ BitVec 32))) (Undefined!5150) (MissingVacant!5150 (index!22830 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34780 (_ BitVec 32)) SeekEntryResult!5150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551985 (= res!344587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16701 a!3118) j!142) mask!3119) (select (arr!16701 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16701 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16701 a!3118) i!1132 k!1914) j!142) (array!34781 (store (arr!16701 a!3118) i!1132 k!1914) (size!17065 a!3118)) mask!3119)))))

(declare-fun b!551986 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34780 (_ BitVec 32)) SeekEntryResult!5150)

(assert (=> b!551986 (= e!318546 (= (seekEntryOrOpen!0 (select (arr!16701 a!3118) j!142) a!3118 mask!3119) (Found!5150 j!142)))))

(declare-fun b!551987 () Bool)

(declare-fun res!344580 () Bool)

(declare-fun e!318547 () Bool)

(assert (=> b!551987 (=> (not res!344580) (not e!318547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551987 (= res!344580 (validKeyInArray!0 (select (arr!16701 a!3118) j!142)))))

(declare-fun b!551988 () Bool)

(declare-fun res!344586 () Bool)

(assert (=> b!551988 (=> (not res!344586) (not e!318548))))

(declare-datatypes ((List!10781 0))(
  ( (Nil!10778) (Cons!10777 (h!11759 (_ BitVec 64)) (t!17009 List!10781)) )
))
(declare-fun arrayNoDuplicates!0 (array!34780 (_ BitVec 32) List!10781) Bool)

(assert (=> b!551988 (= res!344586 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10778))))

(declare-fun b!551989 () Bool)

(declare-fun res!344579 () Bool)

(assert (=> b!551989 (=> (not res!344579) (not e!318548))))

(assert (=> b!551989 (= res!344579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551990 () Bool)

(declare-fun res!344583 () Bool)

(assert (=> b!551990 (=> (not res!344583) (not e!318547))))

(assert (=> b!551990 (= res!344583 (validKeyInArray!0 k!1914))))

(declare-fun res!344581 () Bool)

(assert (=> start!50498 (=> (not res!344581) (not e!318547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50498 (= res!344581 (validMask!0 mask!3119))))

(assert (=> start!50498 e!318547))

(assert (=> start!50498 true))

(declare-fun array_inv!12497 (array!34780) Bool)

(assert (=> start!50498 (array_inv!12497 a!3118)))

(declare-fun b!551991 () Bool)

(assert (=> b!551991 (= e!318547 e!318548)))

(declare-fun res!344582 () Bool)

(assert (=> b!551991 (=> (not res!344582) (not e!318548))))

(declare-fun lt!251010 () SeekEntryResult!5150)

(assert (=> b!551991 (= res!344582 (or (= lt!251010 (MissingZero!5150 i!1132)) (= lt!251010 (MissingVacant!5150 i!1132))))))

(assert (=> b!551991 (= lt!251010 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551992 () Bool)

(declare-fun res!344584 () Bool)

(assert (=> b!551992 (=> (not res!344584) (not e!318547))))

(declare-fun arrayContainsKey!0 (array!34780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551992 (= res!344584 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551993 () Bool)

(declare-fun res!344588 () Bool)

(assert (=> b!551993 (=> (not res!344588) (not e!318547))))

(assert (=> b!551993 (= res!344588 (and (= (size!17065 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17065 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17065 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50498 res!344581) b!551993))

(assert (= (and b!551993 res!344588) b!551987))

(assert (= (and b!551987 res!344580) b!551990))

(assert (= (and b!551990 res!344583) b!551992))

(assert (= (and b!551992 res!344584) b!551991))

(assert (= (and b!551991 res!344582) b!551989))

(assert (= (and b!551989 res!344579) b!551988))

(assert (= (and b!551988 res!344586) b!551985))

(assert (= (and b!551985 res!344587) b!551984))

(assert (= (and b!551984 res!344585) b!551986))

(declare-fun m!528927 () Bool)

(assert (=> b!551984 m!528927))

(declare-fun m!528929 () Bool)

(assert (=> b!551984 m!528929))

(declare-fun m!528931 () Bool)

(assert (=> b!551986 m!528931))

(assert (=> b!551986 m!528931))

(declare-fun m!528933 () Bool)

(assert (=> b!551986 m!528933))

(declare-fun m!528935 () Bool)

(assert (=> b!551991 m!528935))

(assert (=> b!551987 m!528931))

(assert (=> b!551987 m!528931))

(declare-fun m!528937 () Bool)

(assert (=> b!551987 m!528937))

(declare-fun m!528939 () Bool)

(assert (=> b!551988 m!528939))

(declare-fun m!528941 () Bool)

(assert (=> b!551990 m!528941))

(assert (=> b!551985 m!528931))

(declare-fun m!528943 () Bool)

(assert (=> b!551985 m!528943))

(assert (=> b!551985 m!528931))

(declare-fun m!528945 () Bool)

(assert (=> b!551985 m!528945))

(declare-fun m!528947 () Bool)

(assert (=> b!551985 m!528947))

(assert (=> b!551985 m!528945))

(declare-fun m!528949 () Bool)

(assert (=> b!551985 m!528949))

(assert (=> b!551985 m!528943))

(assert (=> b!551985 m!528931))

(declare-fun m!528951 () Bool)

(assert (=> b!551985 m!528951))

(declare-fun m!528953 () Bool)

(assert (=> b!551985 m!528953))

(assert (=> b!551985 m!528945))

(assert (=> b!551985 m!528947))

(declare-fun m!528955 () Bool)

(assert (=> b!551989 m!528955))

(declare-fun m!528957 () Bool)

(assert (=> start!50498 m!528957))

(declare-fun m!528959 () Bool)

(assert (=> start!50498 m!528959))

(declare-fun m!528961 () Bool)

(assert (=> b!551992 m!528961))

(push 1)

