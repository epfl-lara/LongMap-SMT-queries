; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50496 () Bool)

(assert start!50496)

(declare-fun b!551954 () Bool)

(declare-fun res!344557 () Bool)

(declare-fun e!318534 () Bool)

(assert (=> b!551954 (=> (not res!344557) (not e!318534))))

(declare-datatypes ((array!34778 0))(
  ( (array!34779 (arr!16700 (Array (_ BitVec 32) (_ BitVec 64))) (size!17064 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34778)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551954 (= res!344557 (validKeyInArray!0 (select (arr!16700 a!3118) j!142)))))

(declare-fun res!344549 () Bool)

(assert (=> start!50496 (=> (not res!344549) (not e!318534))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50496 (= res!344549 (validMask!0 mask!3119))))

(assert (=> start!50496 e!318534))

(assert (=> start!50496 true))

(declare-fun array_inv!12496 (array!34778) Bool)

(assert (=> start!50496 (array_inv!12496 a!3118)))

(declare-fun b!551955 () Bool)

(declare-fun e!318536 () Bool)

(declare-datatypes ((SeekEntryResult!5149 0))(
  ( (MissingZero!5149 (index!22823 (_ BitVec 32))) (Found!5149 (index!22824 (_ BitVec 32))) (Intermediate!5149 (undefined!5961 Bool) (index!22825 (_ BitVec 32)) (x!51753 (_ BitVec 32))) (Undefined!5149) (MissingVacant!5149 (index!22826 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34778 (_ BitVec 32)) SeekEntryResult!5149)

(assert (=> b!551955 (= e!318536 (= (seekEntryOrOpen!0 (select (arr!16700 a!3118) j!142) a!3118 mask!3119) (Found!5149 j!142)))))

(declare-fun b!551956 () Bool)

(declare-fun res!344554 () Bool)

(declare-fun e!318537 () Bool)

(assert (=> b!551956 (=> (not res!344554) (not e!318537))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34778 (_ BitVec 32)) SeekEntryResult!5149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551956 (= res!344554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16700 a!3118) j!142) mask!3119) (select (arr!16700 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16700 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16700 a!3118) i!1132 k!1914) j!142) (array!34779 (store (arr!16700 a!3118) i!1132 k!1914) (size!17064 a!3118)) mask!3119)))))

(declare-fun b!551957 () Bool)

(assert (=> b!551957 (= e!318537 (not true))))

(assert (=> b!551957 e!318536))

(declare-fun res!344555 () Bool)

(assert (=> b!551957 (=> (not res!344555) (not e!318536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34778 (_ BitVec 32)) Bool)

(assert (=> b!551957 (= res!344555 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17072 0))(
  ( (Unit!17073) )
))
(declare-fun lt!251005 () Unit!17072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17072)

(assert (=> b!551957 (= lt!251005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551958 () Bool)

(declare-fun res!344558 () Bool)

(assert (=> b!551958 (=> (not res!344558) (not e!318534))))

(assert (=> b!551958 (= res!344558 (and (= (size!17064 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17064 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17064 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551959 () Bool)

(declare-fun res!344551 () Bool)

(assert (=> b!551959 (=> (not res!344551) (not e!318537))))

(assert (=> b!551959 (= res!344551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551960 () Bool)

(declare-fun res!344550 () Bool)

(assert (=> b!551960 (=> (not res!344550) (not e!318534))))

(declare-fun arrayContainsKey!0 (array!34778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551960 (= res!344550 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551961 () Bool)

(declare-fun res!344553 () Bool)

(assert (=> b!551961 (=> (not res!344553) (not e!318537))))

(declare-datatypes ((List!10780 0))(
  ( (Nil!10777) (Cons!10776 (h!11758 (_ BitVec 64)) (t!17008 List!10780)) )
))
(declare-fun arrayNoDuplicates!0 (array!34778 (_ BitVec 32) List!10780) Bool)

(assert (=> b!551961 (= res!344553 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10777))))

(declare-fun b!551962 () Bool)

(assert (=> b!551962 (= e!318534 e!318537)))

(declare-fun res!344552 () Bool)

(assert (=> b!551962 (=> (not res!344552) (not e!318537))))

(declare-fun lt!251004 () SeekEntryResult!5149)

(assert (=> b!551962 (= res!344552 (or (= lt!251004 (MissingZero!5149 i!1132)) (= lt!251004 (MissingVacant!5149 i!1132))))))

(assert (=> b!551962 (= lt!251004 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551963 () Bool)

(declare-fun res!344556 () Bool)

(assert (=> b!551963 (=> (not res!344556) (not e!318534))))

(assert (=> b!551963 (= res!344556 (validKeyInArray!0 k!1914))))

(assert (= (and start!50496 res!344549) b!551958))

(assert (= (and b!551958 res!344558) b!551954))

(assert (= (and b!551954 res!344557) b!551963))

(assert (= (and b!551963 res!344556) b!551960))

(assert (= (and b!551960 res!344550) b!551962))

(assert (= (and b!551962 res!344552) b!551959))

(assert (= (and b!551959 res!344551) b!551961))

(assert (= (and b!551961 res!344553) b!551956))

(assert (= (and b!551956 res!344554) b!551957))

(assert (= (and b!551957 res!344555) b!551955))

(declare-fun m!528891 () Bool)

(assert (=> b!551955 m!528891))

(assert (=> b!551955 m!528891))

(declare-fun m!528893 () Bool)

(assert (=> b!551955 m!528893))

(declare-fun m!528895 () Bool)

(assert (=> b!551959 m!528895))

(declare-fun m!528897 () Bool)

(assert (=> b!551957 m!528897))

(declare-fun m!528899 () Bool)

(assert (=> b!551957 m!528899))

(declare-fun m!528901 () Bool)

(assert (=> start!50496 m!528901))

(declare-fun m!528903 () Bool)

(assert (=> start!50496 m!528903))

(assert (=> b!551956 m!528891))

(declare-fun m!528905 () Bool)

(assert (=> b!551956 m!528905))

(assert (=> b!551956 m!528891))

(declare-fun m!528907 () Bool)

(assert (=> b!551956 m!528907))

(declare-fun m!528909 () Bool)

(assert (=> b!551956 m!528909))

(assert (=> b!551956 m!528907))

(declare-fun m!528911 () Bool)

(assert (=> b!551956 m!528911))

(assert (=> b!551956 m!528905))

(assert (=> b!551956 m!528891))

(declare-fun m!528913 () Bool)

(assert (=> b!551956 m!528913))

(declare-fun m!528915 () Bool)

(assert (=> b!551956 m!528915))

(assert (=> b!551956 m!528907))

(assert (=> b!551956 m!528909))

(declare-fun m!528917 () Bool)

(assert (=> b!551963 m!528917))

(declare-fun m!528919 () Bool)

(assert (=> b!551960 m!528919))

(declare-fun m!528921 () Bool)

(assert (=> b!551961 m!528921))

(assert (=> b!551954 m!528891))

(assert (=> b!551954 m!528891))

(declare-fun m!528923 () Bool)

(assert (=> b!551954 m!528923))

(declare-fun m!528925 () Bool)

(assert (=> b!551962 m!528925))

(push 1)

