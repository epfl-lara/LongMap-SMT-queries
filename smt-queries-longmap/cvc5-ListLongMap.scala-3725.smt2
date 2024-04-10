; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51344 () Bool)

(assert start!51344)

(declare-fun b!560399 () Bool)

(declare-fun e!322886 () Bool)

(declare-fun e!322885 () Bool)

(assert (=> b!560399 (= e!322886 e!322885)))

(declare-fun res!351554 () Bool)

(assert (=> b!560399 (=> res!351554 e!322885)))

(declare-datatypes ((SeekEntryResult!5354 0))(
  ( (MissingZero!5354 (index!23643 (_ BitVec 32))) (Found!5354 (index!23644 (_ BitVec 32))) (Intermediate!5354 (undefined!6166 Bool) (index!23645 (_ BitVec 32)) (x!52561 (_ BitVec 32))) (Undefined!5354) (MissingVacant!5354 (index!23646 (_ BitVec 32))) )
))
(declare-fun lt!254793 () SeekEntryResult!5354)

(assert (=> b!560399 (= res!351554 (or (undefined!6166 lt!254793) (not (is-Intermediate!5354 lt!254793))))))

(declare-fun b!560401 () Bool)

(declare-fun e!322884 () Bool)

(assert (=> b!560401 (= e!322884 (not true))))

(assert (=> b!560401 e!322886))

(declare-fun res!351559 () Bool)

(assert (=> b!560401 (=> (not res!351559) (not e!322886))))

(declare-fun lt!254795 () SeekEntryResult!5354)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560401 (= res!351559 (= lt!254795 (Found!5354 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35209 0))(
  ( (array!35210 (arr!16905 (Array (_ BitVec 32) (_ BitVec 64))) (size!17269 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35209)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35209 (_ BitVec 32)) SeekEntryResult!5354)

(assert (=> b!560401 (= lt!254795 (seekEntryOrOpen!0 (select (arr!16905 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35209 (_ BitVec 32)) Bool)

(assert (=> b!560401 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17482 0))(
  ( (Unit!17483) )
))
(declare-fun lt!254790 () Unit!17482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17482)

(assert (=> b!560401 (= lt!254790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560402 () Bool)

(declare-fun e!322881 () Bool)

(assert (=> b!560402 (= e!322885 e!322881)))

(declare-fun res!351560 () Bool)

(assert (=> b!560402 (=> res!351560 e!322881)))

(declare-fun lt!254797 () (_ BitVec 64))

(assert (=> b!560402 (= res!351560 (or (= lt!254797 (select (arr!16905 a!3118) j!142)) (= lt!254797 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560402 (= lt!254797 (select (arr!16905 a!3118) (index!23645 lt!254793)))))

(declare-fun b!560403 () Bool)

(declare-fun res!351552 () Bool)

(declare-fun e!322883 () Bool)

(assert (=> b!560403 (=> (not res!351552) (not e!322883))))

(assert (=> b!560403 (= res!351552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560404 () Bool)

(declare-fun res!351553 () Bool)

(declare-fun e!322882 () Bool)

(assert (=> b!560404 (=> (not res!351553) (not e!322882))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560404 (= res!351553 (and (= (size!17269 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17269 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17269 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560405 () Bool)

(declare-fun res!351563 () Bool)

(assert (=> b!560405 (=> (not res!351563) (not e!322883))))

(declare-datatypes ((List!10985 0))(
  ( (Nil!10982) (Cons!10981 (h!11984 (_ BitVec 64)) (t!17213 List!10985)) )
))
(declare-fun arrayNoDuplicates!0 (array!35209 (_ BitVec 32) List!10985) Bool)

(assert (=> b!560405 (= res!351563 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10982))))

(declare-fun b!560406 () Bool)

(declare-fun res!351556 () Bool)

(assert (=> b!560406 (=> (not res!351556) (not e!322882))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560406 (= res!351556 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560407 () Bool)

(declare-fun res!351551 () Bool)

(assert (=> b!560407 (=> (not res!351551) (not e!322882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560407 (= res!351551 (validKeyInArray!0 (select (arr!16905 a!3118) j!142)))))

(declare-fun b!560400 () Bool)

(declare-fun e!322887 () Bool)

(assert (=> b!560400 (= e!322881 e!322887)))

(declare-fun res!351562 () Bool)

(assert (=> b!560400 (=> (not res!351562) (not e!322887))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35209 (_ BitVec 32)) SeekEntryResult!5354)

(assert (=> b!560400 (= res!351562 (= lt!254795 (seekKeyOrZeroReturnVacant!0 (x!52561 lt!254793) (index!23645 lt!254793) (index!23645 lt!254793) (select (arr!16905 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351558 () Bool)

(assert (=> start!51344 (=> (not res!351558) (not e!322882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51344 (= res!351558 (validMask!0 mask!3119))))

(assert (=> start!51344 e!322882))

(assert (=> start!51344 true))

(declare-fun array_inv!12701 (array!35209) Bool)

(assert (=> start!51344 (array_inv!12701 a!3118)))

(declare-fun b!560408 () Bool)

(assert (=> b!560408 (= e!322883 e!322884)))

(declare-fun res!351557 () Bool)

(assert (=> b!560408 (=> (not res!351557) (not e!322884))))

(declare-fun lt!254794 () (_ BitVec 32))

(declare-fun lt!254789 () (_ BitVec 64))

(declare-fun lt!254792 () array!35209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35209 (_ BitVec 32)) SeekEntryResult!5354)

(assert (=> b!560408 (= res!351557 (= lt!254793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254794 lt!254789 lt!254792 mask!3119)))))

(declare-fun lt!254796 () (_ BitVec 32))

(assert (=> b!560408 (= lt!254793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254796 (select (arr!16905 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560408 (= lt!254794 (toIndex!0 lt!254789 mask!3119))))

(assert (=> b!560408 (= lt!254789 (select (store (arr!16905 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560408 (= lt!254796 (toIndex!0 (select (arr!16905 a!3118) j!142) mask!3119))))

(assert (=> b!560408 (= lt!254792 (array!35210 (store (arr!16905 a!3118) i!1132 k!1914) (size!17269 a!3118)))))

(declare-fun b!560409 () Bool)

(assert (=> b!560409 (= e!322887 (= (seekEntryOrOpen!0 lt!254789 lt!254792 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52561 lt!254793) (index!23645 lt!254793) (index!23645 lt!254793) lt!254789 lt!254792 mask!3119)))))

(declare-fun b!560410 () Bool)

(assert (=> b!560410 (= e!322882 e!322883)))

(declare-fun res!351561 () Bool)

(assert (=> b!560410 (=> (not res!351561) (not e!322883))))

(declare-fun lt!254791 () SeekEntryResult!5354)

(assert (=> b!560410 (= res!351561 (or (= lt!254791 (MissingZero!5354 i!1132)) (= lt!254791 (MissingVacant!5354 i!1132))))))

(assert (=> b!560410 (= lt!254791 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560411 () Bool)

(declare-fun res!351555 () Bool)

(assert (=> b!560411 (=> (not res!351555) (not e!322882))))

(assert (=> b!560411 (= res!351555 (validKeyInArray!0 k!1914))))

(assert (= (and start!51344 res!351558) b!560404))

(assert (= (and b!560404 res!351553) b!560407))

(assert (= (and b!560407 res!351551) b!560411))

(assert (= (and b!560411 res!351555) b!560406))

(assert (= (and b!560406 res!351556) b!560410))

(assert (= (and b!560410 res!351561) b!560403))

(assert (= (and b!560403 res!351552) b!560405))

(assert (= (and b!560405 res!351563) b!560408))

(assert (= (and b!560408 res!351557) b!560401))

(assert (= (and b!560401 res!351559) b!560399))

(assert (= (and b!560399 (not res!351554)) b!560402))

(assert (= (and b!560402 (not res!351560)) b!560400))

(assert (= (and b!560400 res!351562) b!560409))

(declare-fun m!538161 () Bool)

(assert (=> b!560406 m!538161))

(declare-fun m!538163 () Bool)

(assert (=> b!560401 m!538163))

(assert (=> b!560401 m!538163))

(declare-fun m!538165 () Bool)

(assert (=> b!560401 m!538165))

(declare-fun m!538167 () Bool)

(assert (=> b!560401 m!538167))

(declare-fun m!538169 () Bool)

(assert (=> b!560401 m!538169))

(declare-fun m!538171 () Bool)

(assert (=> b!560408 m!538171))

(assert (=> b!560408 m!538163))

(declare-fun m!538173 () Bool)

(assert (=> b!560408 m!538173))

(assert (=> b!560408 m!538163))

(assert (=> b!560408 m!538163))

(declare-fun m!538175 () Bool)

(assert (=> b!560408 m!538175))

(declare-fun m!538177 () Bool)

(assert (=> b!560408 m!538177))

(declare-fun m!538179 () Bool)

(assert (=> b!560408 m!538179))

(declare-fun m!538181 () Bool)

(assert (=> b!560408 m!538181))

(assert (=> b!560402 m!538163))

(declare-fun m!538183 () Bool)

(assert (=> b!560402 m!538183))

(declare-fun m!538185 () Bool)

(assert (=> b!560405 m!538185))

(declare-fun m!538187 () Bool)

(assert (=> b!560403 m!538187))

(declare-fun m!538189 () Bool)

(assert (=> b!560409 m!538189))

(declare-fun m!538191 () Bool)

(assert (=> b!560409 m!538191))

(assert (=> b!560407 m!538163))

(assert (=> b!560407 m!538163))

(declare-fun m!538193 () Bool)

(assert (=> b!560407 m!538193))

(declare-fun m!538195 () Bool)

(assert (=> b!560411 m!538195))

(declare-fun m!538197 () Bool)

(assert (=> start!51344 m!538197))

(declare-fun m!538199 () Bool)

(assert (=> start!51344 m!538199))

(assert (=> b!560400 m!538163))

(assert (=> b!560400 m!538163))

(declare-fun m!538201 () Bool)

(assert (=> b!560400 m!538201))

(declare-fun m!538203 () Bool)

(assert (=> b!560410 m!538203))

(push 1)

