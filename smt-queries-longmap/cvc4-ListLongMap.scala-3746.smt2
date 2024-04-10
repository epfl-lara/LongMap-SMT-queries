; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51474 () Bool)

(assert start!51474)

(declare-fun b!562890 () Bool)

(declare-fun res!354047 () Bool)

(declare-fun e!324400 () Bool)

(assert (=> b!562890 (=> (not res!354047) (not e!324400))))

(declare-datatypes ((array!35339 0))(
  ( (array!35340 (arr!16970 (Array (_ BitVec 32) (_ BitVec 64))) (size!17334 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35339)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562890 (= res!354047 (validKeyInArray!0 (select (arr!16970 a!3118) j!142)))))

(declare-fun b!562891 () Bool)

(declare-fun res!354048 () Bool)

(declare-fun e!324396 () Bool)

(assert (=> b!562891 (=> (not res!354048) (not e!324396))))

(declare-datatypes ((List!11050 0))(
  ( (Nil!11047) (Cons!11046 (h!12049 (_ BitVec 64)) (t!17278 List!11050)) )
))
(declare-fun arrayNoDuplicates!0 (array!35339 (_ BitVec 32) List!11050) Bool)

(assert (=> b!562891 (= res!354048 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11047))))

(declare-fun b!562892 () Bool)

(declare-fun e!324399 () Bool)

(declare-fun e!324402 () Bool)

(assert (=> b!562892 (= e!324399 e!324402)))

(declare-fun res!354043 () Bool)

(assert (=> b!562892 (=> res!354043 e!324402)))

(declare-fun lt!256769 () (_ BitVec 64))

(assert (=> b!562892 (= res!354043 (or (= lt!256769 (select (arr!16970 a!3118) j!142)) (= lt!256769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5419 0))(
  ( (MissingZero!5419 (index!23903 (_ BitVec 32))) (Found!5419 (index!23904 (_ BitVec 32))) (Intermediate!5419 (undefined!6231 Bool) (index!23905 (_ BitVec 32)) (x!52794 (_ BitVec 32))) (Undefined!5419) (MissingVacant!5419 (index!23906 (_ BitVec 32))) )
))
(declare-fun lt!256772 () SeekEntryResult!5419)

(assert (=> b!562892 (= lt!256769 (select (arr!16970 a!3118) (index!23905 lt!256772)))))

(declare-fun b!562893 () Bool)

(declare-fun e!324398 () Bool)

(assert (=> b!562893 (= e!324398 true)))

(declare-fun lt!256770 () SeekEntryResult!5419)

(declare-fun lt!256774 () SeekEntryResult!5419)

(assert (=> b!562893 (= lt!256770 lt!256774)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((Unit!17612 0))(
  ( (Unit!17613) )
))
(declare-fun lt!256768 () Unit!17612)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17612)

(assert (=> b!562893 (= lt!256768 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52794 lt!256772) (index!23905 lt!256772) (index!23905 lt!256772) mask!3119))))

(declare-fun b!562894 () Bool)

(assert (=> b!562894 (= e!324402 e!324398)))

(declare-fun res!354052 () Bool)

(assert (=> b!562894 (=> res!354052 e!324398)))

(declare-fun lt!256766 () SeekEntryResult!5419)

(assert (=> b!562894 (= res!354052 (or (bvslt (index!23905 lt!256772) #b00000000000000000000000000000000) (bvsge (index!23905 lt!256772) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52794 lt!256772) #b01111111111111111111111111111110) (bvslt (x!52794 lt!256772) #b00000000000000000000000000000000) (not (= lt!256769 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16970 a!3118) i!1132 k!1914) (index!23905 lt!256772)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256770 lt!256766))))))

(declare-fun lt!256773 () SeekEntryResult!5419)

(assert (=> b!562894 (= lt!256773 lt!256774)))

(declare-fun lt!256775 () array!35339)

(declare-fun lt!256767 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35339 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562894 (= lt!256774 (seekKeyOrZeroReturnVacant!0 (x!52794 lt!256772) (index!23905 lt!256772) (index!23905 lt!256772) lt!256767 lt!256775 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35339 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562894 (= lt!256773 (seekEntryOrOpen!0 lt!256767 lt!256775 mask!3119))))

(declare-fun lt!256765 () SeekEntryResult!5419)

(assert (=> b!562894 (= lt!256765 lt!256770)))

(assert (=> b!562894 (= lt!256770 (seekKeyOrZeroReturnVacant!0 (x!52794 lt!256772) (index!23905 lt!256772) (index!23905 lt!256772) (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562895 () Bool)

(declare-fun res!354046 () Bool)

(assert (=> b!562895 (=> (not res!354046) (not e!324400))))

(assert (=> b!562895 (= res!354046 (and (= (size!17334 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17334 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17334 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562896 () Bool)

(declare-fun res!354050 () Bool)

(assert (=> b!562896 (=> (not res!354050) (not e!324400))))

(declare-fun arrayContainsKey!0 (array!35339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562896 (= res!354050 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!354042 () Bool)

(assert (=> start!51474 (=> (not res!354042) (not e!324400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51474 (= res!354042 (validMask!0 mask!3119))))

(assert (=> start!51474 e!324400))

(assert (=> start!51474 true))

(declare-fun array_inv!12766 (array!35339) Bool)

(assert (=> start!51474 (array_inv!12766 a!3118)))

(declare-fun b!562897 () Bool)

(declare-fun e!324397 () Bool)

(assert (=> b!562897 (= e!324397 (not e!324399))))

(declare-fun res!354053 () Bool)

(assert (=> b!562897 (=> res!354053 e!324399)))

(assert (=> b!562897 (= res!354053 (or (undefined!6231 lt!256772) (not (is-Intermediate!5419 lt!256772))))))

(assert (=> b!562897 (= lt!256765 lt!256766)))

(assert (=> b!562897 (= lt!256766 (Found!5419 j!142))))

(assert (=> b!562897 (= lt!256765 (seekEntryOrOpen!0 (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35339 (_ BitVec 32)) Bool)

(assert (=> b!562897 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256777 () Unit!17612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17612)

(assert (=> b!562897 (= lt!256777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562898 () Bool)

(assert (=> b!562898 (= e!324400 e!324396)))

(declare-fun res!354049 () Bool)

(assert (=> b!562898 (=> (not res!354049) (not e!324396))))

(declare-fun lt!256776 () SeekEntryResult!5419)

(assert (=> b!562898 (= res!354049 (or (= lt!256776 (MissingZero!5419 i!1132)) (= lt!256776 (MissingVacant!5419 i!1132))))))

(assert (=> b!562898 (= lt!256776 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562899 () Bool)

(declare-fun res!354051 () Bool)

(assert (=> b!562899 (=> (not res!354051) (not e!324400))))

(assert (=> b!562899 (= res!354051 (validKeyInArray!0 k!1914))))

(declare-fun b!562900 () Bool)

(declare-fun res!354044 () Bool)

(assert (=> b!562900 (=> (not res!354044) (not e!324396))))

(assert (=> b!562900 (= res!354044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562901 () Bool)

(assert (=> b!562901 (= e!324396 e!324397)))

(declare-fun res!354045 () Bool)

(assert (=> b!562901 (=> (not res!354045) (not e!324397))))

(declare-fun lt!256764 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35339 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562901 (= res!354045 (= lt!256772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256764 lt!256767 lt!256775 mask!3119)))))

(declare-fun lt!256771 () (_ BitVec 32))

(assert (=> b!562901 (= lt!256772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256771 (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562901 (= lt!256764 (toIndex!0 lt!256767 mask!3119))))

(assert (=> b!562901 (= lt!256767 (select (store (arr!16970 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562901 (= lt!256771 (toIndex!0 (select (arr!16970 a!3118) j!142) mask!3119))))

(assert (=> b!562901 (= lt!256775 (array!35340 (store (arr!16970 a!3118) i!1132 k!1914) (size!17334 a!3118)))))

(assert (= (and start!51474 res!354042) b!562895))

(assert (= (and b!562895 res!354046) b!562890))

(assert (= (and b!562890 res!354047) b!562899))

(assert (= (and b!562899 res!354051) b!562896))

(assert (= (and b!562896 res!354050) b!562898))

(assert (= (and b!562898 res!354049) b!562900))

(assert (= (and b!562900 res!354044) b!562891))

(assert (= (and b!562891 res!354048) b!562901))

(assert (= (and b!562901 res!354045) b!562897))

(assert (= (and b!562897 (not res!354053)) b!562892))

(assert (= (and b!562892 (not res!354043)) b!562894))

(assert (= (and b!562894 (not res!354052)) b!562893))

(declare-fun m!541077 () Bool)

(assert (=> b!562890 m!541077))

(assert (=> b!562890 m!541077))

(declare-fun m!541079 () Bool)

(assert (=> b!562890 m!541079))

(assert (=> b!562892 m!541077))

(declare-fun m!541081 () Bool)

(assert (=> b!562892 m!541081))

(declare-fun m!541083 () Bool)

(assert (=> b!562900 m!541083))

(declare-fun m!541085 () Bool)

(assert (=> b!562898 m!541085))

(declare-fun m!541087 () Bool)

(assert (=> b!562893 m!541087))

(declare-fun m!541089 () Bool)

(assert (=> b!562896 m!541089))

(assert (=> b!562901 m!541077))

(declare-fun m!541091 () Bool)

(assert (=> b!562901 m!541091))

(assert (=> b!562901 m!541077))

(assert (=> b!562901 m!541077))

(declare-fun m!541093 () Bool)

(assert (=> b!562901 m!541093))

(declare-fun m!541095 () Bool)

(assert (=> b!562901 m!541095))

(declare-fun m!541097 () Bool)

(assert (=> b!562901 m!541097))

(declare-fun m!541099 () Bool)

(assert (=> b!562901 m!541099))

(declare-fun m!541101 () Bool)

(assert (=> b!562901 m!541101))

(declare-fun m!541103 () Bool)

(assert (=> start!51474 m!541103))

(declare-fun m!541105 () Bool)

(assert (=> start!51474 m!541105))

(declare-fun m!541107 () Bool)

(assert (=> b!562894 m!541107))

(declare-fun m!541109 () Bool)

(assert (=> b!562894 m!541109))

(assert (=> b!562894 m!541077))

(assert (=> b!562894 m!541077))

(declare-fun m!541111 () Bool)

(assert (=> b!562894 m!541111))

(assert (=> b!562894 m!541095))

(declare-fun m!541113 () Bool)

(assert (=> b!562894 m!541113))

(assert (=> b!562897 m!541077))

(assert (=> b!562897 m!541077))

(declare-fun m!541115 () Bool)

(assert (=> b!562897 m!541115))

(declare-fun m!541117 () Bool)

(assert (=> b!562897 m!541117))

(declare-fun m!541119 () Bool)

(assert (=> b!562897 m!541119))

(declare-fun m!541121 () Bool)

(assert (=> b!562891 m!541121))

(declare-fun m!541123 () Bool)

(assert (=> b!562899 m!541123))

(push 1)

