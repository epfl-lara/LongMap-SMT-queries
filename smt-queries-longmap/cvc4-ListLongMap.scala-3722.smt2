; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51330 () Bool)

(assert start!51330)

(declare-fun b!560125 () Bool)

(declare-fun e!322716 () Bool)

(declare-fun e!322713 () Bool)

(assert (=> b!560125 (= e!322716 (not e!322713))))

(declare-fun res!351279 () Bool)

(assert (=> b!560125 (=> res!351279 e!322713)))

(declare-datatypes ((SeekEntryResult!5347 0))(
  ( (MissingZero!5347 (index!23615 (_ BitVec 32))) (Found!5347 (index!23616 (_ BitVec 32))) (Intermediate!5347 (undefined!6159 Bool) (index!23617 (_ BitVec 32)) (x!52530 (_ BitVec 32))) (Undefined!5347) (MissingVacant!5347 (index!23618 (_ BitVec 32))) )
))
(declare-fun lt!254602 () SeekEntryResult!5347)

(assert (=> b!560125 (= res!351279 (or (undefined!6159 lt!254602) (not (is-Intermediate!5347 lt!254602))))))

(declare-fun e!322717 () Bool)

(assert (=> b!560125 e!322717))

(declare-fun res!351286 () Bool)

(assert (=> b!560125 (=> (not res!351286) (not e!322717))))

(declare-fun lt!254607 () SeekEntryResult!5347)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560125 (= res!351286 (= lt!254607 (Found!5347 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35195 0))(
  ( (array!35196 (arr!16898 (Array (_ BitVec 32) (_ BitVec 64))) (size!17262 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35195)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35195 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560125 (= lt!254607 (seekEntryOrOpen!0 (select (arr!16898 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35195 (_ BitVec 32)) Bool)

(assert (=> b!560125 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17468 0))(
  ( (Unit!17469) )
))
(declare-fun lt!254606 () Unit!17468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17468)

(assert (=> b!560125 (= lt!254606 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560126 () Bool)

(declare-fun e!322719 () Bool)

(assert (=> b!560126 (= e!322717 e!322719)))

(declare-fun res!351280 () Bool)

(assert (=> b!560126 (=> res!351280 e!322719)))

(assert (=> b!560126 (= res!351280 (or (undefined!6159 lt!254602) (not (is-Intermediate!5347 lt!254602))))))

(declare-fun b!560128 () Bool)

(declare-fun e!322714 () Bool)

(assert (=> b!560128 (= e!322713 e!322714)))

(declare-fun res!351281 () Bool)

(assert (=> b!560128 (=> res!351281 e!322714)))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!254608 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560128 (= res!351281 (or (= lt!254608 (select (arr!16898 a!3118) j!142)) (= lt!254608 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23617 lt!254602) #b00000000000000000000000000000000) (bvsge (index!23617 lt!254602) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52530 lt!254602) #b01111111111111111111111111111110) (bvslt (x!52530 lt!254602) #b00000000000000000000000000000000) (not (= (select (store (arr!16898 a!3118) i!1132 k!1914) (index!23617 lt!254602)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!560128 (= lt!254608 (select (arr!16898 a!3118) (index!23617 lt!254602)))))

(declare-fun b!560129 () Bool)

(declare-fun e!322718 () Bool)

(declare-fun e!322712 () Bool)

(assert (=> b!560129 (= e!322718 e!322712)))

(declare-fun res!351288 () Bool)

(assert (=> b!560129 (=> (not res!351288) (not e!322712))))

(declare-fun lt!254604 () SeekEntryResult!5347)

(assert (=> b!560129 (= res!351288 (or (= lt!254604 (MissingZero!5347 i!1132)) (= lt!254604 (MissingVacant!5347 i!1132))))))

(assert (=> b!560129 (= lt!254604 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560130 () Bool)

(declare-fun res!351285 () Bool)

(assert (=> b!560130 (=> (not res!351285) (not e!322712))))

(declare-datatypes ((List!10978 0))(
  ( (Nil!10975) (Cons!10974 (h!11977 (_ BitVec 64)) (t!17206 List!10978)) )
))
(declare-fun arrayNoDuplicates!0 (array!35195 (_ BitVec 32) List!10978) Bool)

(assert (=> b!560130 (= res!351285 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10975))))

(declare-fun b!560131 () Bool)

(declare-fun e!322711 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35195 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560131 (= e!322711 (= lt!254607 (seekKeyOrZeroReturnVacant!0 (x!52530 lt!254602) (index!23617 lt!254602) (index!23617 lt!254602) (select (arr!16898 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560132 () Bool)

(declare-fun res!351290 () Bool)

(assert (=> b!560132 (=> (not res!351290) (not e!322718))))

(declare-fun arrayContainsKey!0 (array!35195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560132 (= res!351290 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560133 () Bool)

(declare-fun res!351278 () Bool)

(assert (=> b!560133 (=> (not res!351278) (not e!322718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560133 (= res!351278 (validKeyInArray!0 (select (arr!16898 a!3118) j!142)))))

(declare-fun b!560134 () Bool)

(assert (=> b!560134 (= e!322719 e!322711)))

(declare-fun res!351283 () Bool)

(assert (=> b!560134 (=> res!351283 e!322711)))

(declare-fun lt!254601 () (_ BitVec 64))

(assert (=> b!560134 (= res!351283 (or (= lt!254601 (select (arr!16898 a!3118) j!142)) (= lt!254601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560134 (= lt!254601 (select (arr!16898 a!3118) (index!23617 lt!254602)))))

(declare-fun b!560135 () Bool)

(declare-fun res!351284 () Bool)

(assert (=> b!560135 (=> (not res!351284) (not e!322718))))

(assert (=> b!560135 (= res!351284 (validKeyInArray!0 k!1914))))

(declare-fun b!560136 () Bool)

(declare-fun lt!254600 () (_ BitVec 64))

(assert (=> b!560136 (= e!322714 (validKeyInArray!0 lt!254600))))

(declare-fun res!351289 () Bool)

(assert (=> start!51330 (=> (not res!351289) (not e!322718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51330 (= res!351289 (validMask!0 mask!3119))))

(assert (=> start!51330 e!322718))

(assert (=> start!51330 true))

(declare-fun array_inv!12694 (array!35195) Bool)

(assert (=> start!51330 (array_inv!12694 a!3118)))

(declare-fun b!560127 () Bool)

(declare-fun res!351282 () Bool)

(assert (=> b!560127 (=> (not res!351282) (not e!322712))))

(assert (=> b!560127 (= res!351282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560137 () Bool)

(declare-fun res!351277 () Bool)

(assert (=> b!560137 (=> (not res!351277) (not e!322718))))

(assert (=> b!560137 (= res!351277 (and (= (size!17262 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17262 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17262 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560138 () Bool)

(assert (=> b!560138 (= e!322712 e!322716)))

(declare-fun res!351287 () Bool)

(assert (=> b!560138 (=> (not res!351287) (not e!322716))))

(declare-fun lt!254605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35195 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560138 (= res!351287 (= lt!254602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254605 lt!254600 (array!35196 (store (arr!16898 a!3118) i!1132 k!1914) (size!17262 a!3118)) mask!3119)))))

(declare-fun lt!254603 () (_ BitVec 32))

(assert (=> b!560138 (= lt!254602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254603 (select (arr!16898 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560138 (= lt!254605 (toIndex!0 lt!254600 mask!3119))))

(assert (=> b!560138 (= lt!254600 (select (store (arr!16898 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560138 (= lt!254603 (toIndex!0 (select (arr!16898 a!3118) j!142) mask!3119))))

(assert (= (and start!51330 res!351289) b!560137))

(assert (= (and b!560137 res!351277) b!560133))

(assert (= (and b!560133 res!351278) b!560135))

(assert (= (and b!560135 res!351284) b!560132))

(assert (= (and b!560132 res!351290) b!560129))

(assert (= (and b!560129 res!351288) b!560127))

(assert (= (and b!560127 res!351282) b!560130))

(assert (= (and b!560130 res!351285) b!560138))

(assert (= (and b!560138 res!351287) b!560125))

(assert (= (and b!560125 res!351286) b!560126))

(assert (= (and b!560126 (not res!351280)) b!560134))

(assert (= (and b!560134 (not res!351283)) b!560131))

(assert (= (and b!560125 (not res!351279)) b!560128))

(assert (= (and b!560128 (not res!351281)) b!560136))

(declare-fun m!537853 () Bool)

(assert (=> b!560130 m!537853))

(declare-fun m!537855 () Bool)

(assert (=> b!560127 m!537855))

(declare-fun m!537857 () Bool)

(assert (=> b!560136 m!537857))

(declare-fun m!537859 () Bool)

(assert (=> b!560129 m!537859))

(declare-fun m!537861 () Bool)

(assert (=> start!51330 m!537861))

(declare-fun m!537863 () Bool)

(assert (=> start!51330 m!537863))

(declare-fun m!537865 () Bool)

(assert (=> b!560128 m!537865))

(declare-fun m!537867 () Bool)

(assert (=> b!560128 m!537867))

(declare-fun m!537869 () Bool)

(assert (=> b!560128 m!537869))

(declare-fun m!537871 () Bool)

(assert (=> b!560128 m!537871))

(assert (=> b!560131 m!537865))

(assert (=> b!560131 m!537865))

(declare-fun m!537873 () Bool)

(assert (=> b!560131 m!537873))

(assert (=> b!560125 m!537865))

(assert (=> b!560125 m!537865))

(declare-fun m!537875 () Bool)

(assert (=> b!560125 m!537875))

(declare-fun m!537877 () Bool)

(assert (=> b!560125 m!537877))

(declare-fun m!537879 () Bool)

(assert (=> b!560125 m!537879))

(assert (=> b!560138 m!537865))

(declare-fun m!537881 () Bool)

(assert (=> b!560138 m!537881))

(declare-fun m!537883 () Bool)

(assert (=> b!560138 m!537883))

(declare-fun m!537885 () Bool)

(assert (=> b!560138 m!537885))

(assert (=> b!560138 m!537865))

(declare-fun m!537887 () Bool)

(assert (=> b!560138 m!537887))

(assert (=> b!560138 m!537865))

(declare-fun m!537889 () Bool)

(assert (=> b!560138 m!537889))

(assert (=> b!560138 m!537867))

(assert (=> b!560134 m!537865))

(assert (=> b!560134 m!537871))

(declare-fun m!537891 () Bool)

(assert (=> b!560132 m!537891))

(assert (=> b!560133 m!537865))

(assert (=> b!560133 m!537865))

(declare-fun m!537893 () Bool)

(assert (=> b!560133 m!537893))

(declare-fun m!537895 () Bool)

(assert (=> b!560135 m!537895))

(push 1)

