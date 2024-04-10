; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50124 () Bool)

(assert start!50124)

(declare-fun b!548959 () Bool)

(declare-fun res!342197 () Bool)

(declare-fun e!317105 () Bool)

(assert (=> b!548959 (=> (not res!342197) (not e!317105))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548959 (= res!342197 (validKeyInArray!0 k!1914))))

(declare-fun res!342191 () Bool)

(assert (=> start!50124 (=> (not res!342191) (not e!317105))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50124 (= res!342191 (validMask!0 mask!3119))))

(assert (=> start!50124 e!317105))

(assert (=> start!50124 true))

(declare-datatypes ((array!34622 0))(
  ( (array!34623 (arr!16628 (Array (_ BitVec 32) (_ BitVec 64))) (size!16992 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34622)

(declare-fun array_inv!12424 (array!34622) Bool)

(assert (=> start!50124 (array_inv!12424 a!3118)))

(declare-fun b!548960 () Bool)

(declare-fun res!342196 () Bool)

(assert (=> b!548960 (=> (not res!342196) (not e!317105))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548960 (= res!342196 (validKeyInArray!0 (select (arr!16628 a!3118) j!142)))))

(declare-fun b!548961 () Bool)

(declare-fun e!317104 () Bool)

(assert (=> b!548961 (= e!317105 e!317104)))

(declare-fun res!342195 () Bool)

(assert (=> b!548961 (=> (not res!342195) (not e!317104))))

(declare-datatypes ((SeekEntryResult!5077 0))(
  ( (MissingZero!5077 (index!22535 (_ BitVec 32))) (Found!5077 (index!22536 (_ BitVec 32))) (Intermediate!5077 (undefined!5889 Bool) (index!22537 (_ BitVec 32)) (x!51468 (_ BitVec 32))) (Undefined!5077) (MissingVacant!5077 (index!22538 (_ BitVec 32))) )
))
(declare-fun lt!249970 () SeekEntryResult!5077)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548961 (= res!342195 (or (= lt!249970 (MissingZero!5077 i!1132)) (= lt!249970 (MissingVacant!5077 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34622 (_ BitVec 32)) SeekEntryResult!5077)

(assert (=> b!548961 (= lt!249970 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548962 () Bool)

(declare-fun res!342193 () Bool)

(assert (=> b!548962 (=> (not res!342193) (not e!317104))))

(declare-datatypes ((List!10708 0))(
  ( (Nil!10705) (Cons!10704 (h!11674 (_ BitVec 64)) (t!16936 List!10708)) )
))
(declare-fun arrayNoDuplicates!0 (array!34622 (_ BitVec 32) List!10708) Bool)

(assert (=> b!548962 (= res!342193 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10705))))

(declare-fun b!548963 () Bool)

(assert (=> b!548963 (= e!317104 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249969 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548963 (= lt!249969 (toIndex!0 (select (store (arr!16628 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!548964 () Bool)

(declare-fun res!342192 () Bool)

(assert (=> b!548964 (=> (not res!342192) (not e!317105))))

(declare-fun arrayContainsKey!0 (array!34622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548964 (= res!342192 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548965 () Bool)

(declare-fun res!342194 () Bool)

(assert (=> b!548965 (=> (not res!342194) (not e!317105))))

(assert (=> b!548965 (= res!342194 (and (= (size!16992 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16992 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16992 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548966 () Bool)

(declare-fun res!342190 () Bool)

(assert (=> b!548966 (=> (not res!342190) (not e!317104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34622 (_ BitVec 32)) Bool)

(assert (=> b!548966 (= res!342190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50124 res!342191) b!548965))

(assert (= (and b!548965 res!342194) b!548960))

(assert (= (and b!548960 res!342196) b!548959))

(assert (= (and b!548959 res!342197) b!548964))

(assert (= (and b!548964 res!342192) b!548961))

(assert (= (and b!548961 res!342195) b!548966))

(assert (= (and b!548966 res!342190) b!548962))

(assert (= (and b!548962 res!342193) b!548963))

(declare-fun m!525867 () Bool)

(assert (=> b!548959 m!525867))

(declare-fun m!525869 () Bool)

(assert (=> b!548961 m!525869))

(declare-fun m!525871 () Bool)

(assert (=> start!50124 m!525871))

(declare-fun m!525873 () Bool)

(assert (=> start!50124 m!525873))

(declare-fun m!525875 () Bool)

(assert (=> b!548963 m!525875))

(declare-fun m!525877 () Bool)

(assert (=> b!548963 m!525877))

(assert (=> b!548963 m!525877))

(declare-fun m!525879 () Bool)

(assert (=> b!548963 m!525879))

(declare-fun m!525881 () Bool)

(assert (=> b!548960 m!525881))

(assert (=> b!548960 m!525881))

(declare-fun m!525883 () Bool)

(assert (=> b!548960 m!525883))

(declare-fun m!525885 () Bool)

(assert (=> b!548966 m!525885))

(declare-fun m!525887 () Bool)

(assert (=> b!548964 m!525887))

(declare-fun m!525889 () Bool)

(assert (=> b!548962 m!525889))

(push 1)

(assert (not b!548960))

(assert (not b!548961))

(assert (not start!50124))

(assert (not b!548966))

(assert (not b!548964))

(assert (not b!548962))

(assert (not b!548959))

(assert (not b!548963))

