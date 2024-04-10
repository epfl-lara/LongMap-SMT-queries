; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50708 () Bool)

(assert start!50708)

(declare-fun b!554550 () Bool)

(declare-fun res!346963 () Bool)

(declare-fun e!319741 () Bool)

(assert (=> b!554550 (=> (not res!346963) (not e!319741))))

(declare-datatypes ((array!34933 0))(
  ( (array!34934 (arr!16776 (Array (_ BitVec 32) (_ BitVec 64))) (size!17140 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34933)

(declare-datatypes ((List!10856 0))(
  ( (Nil!10853) (Cons!10852 (h!11837 (_ BitVec 64)) (t!17084 List!10856)) )
))
(declare-fun arrayNoDuplicates!0 (array!34933 (_ BitVec 32) List!10856) Bool)

(assert (=> b!554550 (= res!346963 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10853))))

(declare-fun res!346967 () Bool)

(declare-fun e!319743 () Bool)

(assert (=> start!50708 (=> (not res!346967) (not e!319743))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50708 (= res!346967 (validMask!0 mask!3119))))

(assert (=> start!50708 e!319743))

(assert (=> start!50708 true))

(declare-fun array_inv!12572 (array!34933) Bool)

(assert (=> start!50708 (array_inv!12572 a!3118)))

(declare-fun b!554551 () Bool)

(declare-fun res!346964 () Bool)

(assert (=> b!554551 (=> (not res!346964) (not e!319741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34933 (_ BitVec 32)) Bool)

(assert (=> b!554551 (= res!346964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554552 () Bool)

(declare-fun res!346966 () Bool)

(assert (=> b!554552 (=> (not res!346966) (not e!319743))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554552 (= res!346966 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554553 () Bool)

(assert (=> b!554553 (= e!319743 e!319741)))

(declare-fun res!346962 () Bool)

(assert (=> b!554553 (=> (not res!346962) (not e!319741))))

(declare-datatypes ((SeekEntryResult!5225 0))(
  ( (MissingZero!5225 (index!23127 (_ BitVec 32))) (Found!5225 (index!23128 (_ BitVec 32))) (Intermediate!5225 (undefined!6037 Bool) (index!23129 (_ BitVec 32)) (x!52043 (_ BitVec 32))) (Undefined!5225) (MissingVacant!5225 (index!23130 (_ BitVec 32))) )
))
(declare-fun lt!251823 () SeekEntryResult!5225)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554553 (= res!346962 (or (= lt!251823 (MissingZero!5225 i!1132)) (= lt!251823 (MissingVacant!5225 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34933 (_ BitVec 32)) SeekEntryResult!5225)

(assert (=> b!554553 (= lt!251823 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554554 () Bool)

(declare-fun res!346968 () Bool)

(assert (=> b!554554 (=> (not res!346968) (not e!319743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554554 (= res!346968 (validKeyInArray!0 k!1914))))

(declare-fun b!554555 () Bool)

(declare-fun e!319742 () Bool)

(assert (=> b!554555 (= e!319741 e!319742)))

(declare-fun res!346969 () Bool)

(assert (=> b!554555 (=> (not res!346969) (not e!319742))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251824 () (_ BitVec 32))

(declare-fun lt!251827 () SeekEntryResult!5225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34933 (_ BitVec 32)) SeekEntryResult!5225)

(assert (=> b!554555 (= res!346969 (= lt!251827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251824 (select (store (arr!16776 a!3118) i!1132 k!1914) j!142) (array!34934 (store (arr!16776 a!3118) i!1132 k!1914) (size!17140 a!3118)) mask!3119)))))

(declare-fun lt!251822 () (_ BitVec 32))

(assert (=> b!554555 (= lt!251827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251822 (select (arr!16776 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554555 (= lt!251824 (toIndex!0 (select (store (arr!16776 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554555 (= lt!251822 (toIndex!0 (select (arr!16776 a!3118) j!142) mask!3119))))

(declare-fun b!554556 () Bool)

(assert (=> b!554556 (= e!319742 (not true))))

(declare-fun lt!251825 () SeekEntryResult!5225)

(assert (=> b!554556 (and (= lt!251825 (Found!5225 j!142)) (or (undefined!6037 lt!251827) (not (is-Intermediate!5225 lt!251827)) (= (select (arr!16776 a!3118) (index!23129 lt!251827)) (select (arr!16776 a!3118) j!142)) (not (= (select (arr!16776 a!3118) (index!23129 lt!251827)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251825 (MissingZero!5225 (index!23129 lt!251827)))))))

(assert (=> b!554556 (= lt!251825 (seekEntryOrOpen!0 (select (arr!16776 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554556 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17224 0))(
  ( (Unit!17225) )
))
(declare-fun lt!251826 () Unit!17224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17224)

(assert (=> b!554556 (= lt!251826 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554557 () Bool)

(declare-fun res!346965 () Bool)

(assert (=> b!554557 (=> (not res!346965) (not e!319743))))

(assert (=> b!554557 (= res!346965 (validKeyInArray!0 (select (arr!16776 a!3118) j!142)))))

(declare-fun b!554558 () Bool)

(declare-fun res!346970 () Bool)

(assert (=> b!554558 (=> (not res!346970) (not e!319743))))

(assert (=> b!554558 (= res!346970 (and (= (size!17140 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17140 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17140 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50708 res!346967) b!554558))

(assert (= (and b!554558 res!346970) b!554557))

(assert (= (and b!554557 res!346965) b!554554))

(assert (= (and b!554554 res!346968) b!554552))

(assert (= (and b!554552 res!346966) b!554553))

(assert (= (and b!554553 res!346962) b!554551))

(assert (= (and b!554551 res!346964) b!554550))

(assert (= (and b!554550 res!346963) b!554555))

(assert (= (and b!554555 res!346969) b!554556))

(declare-fun m!531873 () Bool)

(assert (=> start!50708 m!531873))

(declare-fun m!531875 () Bool)

(assert (=> start!50708 m!531875))

(declare-fun m!531877 () Bool)

(assert (=> b!554556 m!531877))

(declare-fun m!531879 () Bool)

(assert (=> b!554556 m!531879))

(declare-fun m!531881 () Bool)

(assert (=> b!554556 m!531881))

(declare-fun m!531883 () Bool)

(assert (=> b!554556 m!531883))

(assert (=> b!554556 m!531879))

(declare-fun m!531885 () Bool)

(assert (=> b!554556 m!531885))

(declare-fun m!531887 () Bool)

(assert (=> b!554551 m!531887))

(declare-fun m!531889 () Bool)

(assert (=> b!554553 m!531889))

(assert (=> b!554557 m!531879))

(assert (=> b!554557 m!531879))

(declare-fun m!531891 () Bool)

(assert (=> b!554557 m!531891))

(assert (=> b!554555 m!531879))

(declare-fun m!531893 () Bool)

(assert (=> b!554555 m!531893))

(declare-fun m!531895 () Bool)

(assert (=> b!554555 m!531895))

(declare-fun m!531897 () Bool)

(assert (=> b!554555 m!531897))

(assert (=> b!554555 m!531879))

(declare-fun m!531899 () Bool)

(assert (=> b!554555 m!531899))

(assert (=> b!554555 m!531895))

(declare-fun m!531901 () Bool)

(assert (=> b!554555 m!531901))

(assert (=> b!554555 m!531895))

(declare-fun m!531903 () Bool)

(assert (=> b!554555 m!531903))

(assert (=> b!554555 m!531879))

(declare-fun m!531905 () Bool)

(assert (=> b!554550 m!531905))

(declare-fun m!531907 () Bool)

(assert (=> b!554554 m!531907))

(declare-fun m!531909 () Bool)

(assert (=> b!554552 m!531909))

(push 1)

