; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51732 () Bool)

(assert start!51732)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!325773 () Bool)

(declare-datatypes ((array!35540 0))(
  ( (array!35541 (arr!17069 (Array (_ BitVec 32) (_ BitVec 64))) (size!17433 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35540)

(declare-fun b!565973 () Bool)

(declare-datatypes ((SeekEntryResult!5518 0))(
  ( (MissingZero!5518 (index!24299 (_ BitVec 32))) (Found!5518 (index!24300 (_ BitVec 32))) (Intermediate!5518 (undefined!6330 Bool) (index!24301 (_ BitVec 32)) (x!53163 (_ BitVec 32))) (Undefined!5518) (MissingVacant!5518 (index!24302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35540 (_ BitVec 32)) SeekEntryResult!5518)

(assert (=> b!565973 (= e!325773 (= (seekEntryOrOpen!0 (select (arr!17069 a!3118) j!142) a!3118 mask!3119) (Found!5518 j!142)))))

(declare-fun b!565974 () Bool)

(declare-fun e!325776 () Bool)

(declare-fun e!325774 () Bool)

(assert (=> b!565974 (= e!325776 e!325774)))

(declare-fun res!356949 () Bool)

(assert (=> b!565974 (=> (not res!356949) (not e!325774))))

(declare-fun lt!257994 () SeekEntryResult!5518)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565974 (= res!356949 (or (= lt!257994 (MissingZero!5518 i!1132)) (= lt!257994 (MissingVacant!5518 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!565974 (= lt!257994 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565975 () Bool)

(declare-fun res!356945 () Bool)

(assert (=> b!565975 (=> (not res!356945) (not e!325774))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35540 (_ BitVec 32)) SeekEntryResult!5518)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565975 (= res!356945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17069 a!3118) j!142) mask!3119) (select (arr!17069 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17069 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17069 a!3118) i!1132 k!1914) j!142) (array!35541 (store (arr!17069 a!3118) i!1132 k!1914) (size!17433 a!3118)) mask!3119)))))

(declare-fun b!565976 () Bool)

(declare-fun res!356943 () Bool)

(assert (=> b!565976 (=> (not res!356943) (not e!325776))))

(declare-fun arrayContainsKey!0 (array!35540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565976 (= res!356943 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565977 () Bool)

(declare-fun res!356946 () Bool)

(assert (=> b!565977 (=> (not res!356946) (not e!325776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565977 (= res!356946 (validKeyInArray!0 k!1914))))

(declare-fun res!356951 () Bool)

(assert (=> start!51732 (=> (not res!356951) (not e!325776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51732 (= res!356951 (validMask!0 mask!3119))))

(assert (=> start!51732 e!325776))

(assert (=> start!51732 true))

(declare-fun array_inv!12865 (array!35540) Bool)

(assert (=> start!51732 (array_inv!12865 a!3118)))

(declare-fun b!565978 () Bool)

(declare-fun res!356948 () Bool)

(assert (=> b!565978 (=> (not res!356948) (not e!325774))))

(declare-datatypes ((List!11149 0))(
  ( (Nil!11146) (Cons!11145 (h!12151 (_ BitVec 64)) (t!17377 List!11149)) )
))
(declare-fun arrayNoDuplicates!0 (array!35540 (_ BitVec 32) List!11149) Bool)

(assert (=> b!565978 (= res!356948 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11146))))

(declare-fun b!565979 () Bool)

(assert (=> b!565979 (= e!325774 (not true))))

(assert (=> b!565979 e!325773))

(declare-fun res!356942 () Bool)

(assert (=> b!565979 (=> (not res!356942) (not e!325773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35540 (_ BitVec 32)) Bool)

(assert (=> b!565979 (= res!356942 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17738 0))(
  ( (Unit!17739) )
))
(declare-fun lt!257995 () Unit!17738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17738)

(assert (=> b!565979 (= lt!257995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565980 () Bool)

(declare-fun res!356947 () Bool)

(assert (=> b!565980 (=> (not res!356947) (not e!325776))))

(assert (=> b!565980 (= res!356947 (and (= (size!17433 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17433 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17433 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565981 () Bool)

(declare-fun res!356950 () Bool)

(assert (=> b!565981 (=> (not res!356950) (not e!325776))))

(assert (=> b!565981 (= res!356950 (validKeyInArray!0 (select (arr!17069 a!3118) j!142)))))

(declare-fun b!565982 () Bool)

(declare-fun res!356944 () Bool)

(assert (=> b!565982 (=> (not res!356944) (not e!325774))))

(assert (=> b!565982 (= res!356944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51732 res!356951) b!565980))

(assert (= (and b!565980 res!356947) b!565981))

(assert (= (and b!565981 res!356950) b!565977))

(assert (= (and b!565977 res!356946) b!565976))

(assert (= (and b!565976 res!356943) b!565974))

(assert (= (and b!565974 res!356949) b!565982))

(assert (= (and b!565982 res!356944) b!565978))

(assert (= (and b!565978 res!356948) b!565975))

(assert (= (and b!565975 res!356945) b!565979))

(assert (= (and b!565979 res!356942) b!565973))

(declare-fun m!544539 () Bool)

(assert (=> b!565978 m!544539))

(declare-fun m!544541 () Bool)

(assert (=> b!565977 m!544541))

(declare-fun m!544543 () Bool)

(assert (=> b!565982 m!544543))

(declare-fun m!544545 () Bool)

(assert (=> b!565974 m!544545))

(declare-fun m!544547 () Bool)

(assert (=> b!565976 m!544547))

(declare-fun m!544549 () Bool)

(assert (=> b!565981 m!544549))

(assert (=> b!565981 m!544549))

(declare-fun m!544551 () Bool)

(assert (=> b!565981 m!544551))

(declare-fun m!544553 () Bool)

(assert (=> start!51732 m!544553))

(declare-fun m!544555 () Bool)

(assert (=> start!51732 m!544555))

(assert (=> b!565973 m!544549))

(assert (=> b!565973 m!544549))

(declare-fun m!544557 () Bool)

(assert (=> b!565973 m!544557))

(declare-fun m!544559 () Bool)

(assert (=> b!565979 m!544559))

(declare-fun m!544561 () Bool)

(assert (=> b!565979 m!544561))

(assert (=> b!565975 m!544549))

(declare-fun m!544563 () Bool)

(assert (=> b!565975 m!544563))

(assert (=> b!565975 m!544549))

(declare-fun m!544565 () Bool)

(assert (=> b!565975 m!544565))

(declare-fun m!544567 () Bool)

(assert (=> b!565975 m!544567))

(assert (=> b!565975 m!544565))

(declare-fun m!544569 () Bool)

(assert (=> b!565975 m!544569))

(assert (=> b!565975 m!544563))

(assert (=> b!565975 m!544549))

(declare-fun m!544571 () Bool)

(assert (=> b!565975 m!544571))

(declare-fun m!544573 () Bool)

(assert (=> b!565975 m!544573))

(assert (=> b!565975 m!544565))

(assert (=> b!565975 m!544567))

(push 1)

