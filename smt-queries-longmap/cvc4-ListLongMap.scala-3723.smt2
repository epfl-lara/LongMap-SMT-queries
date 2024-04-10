; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51336 () Bool)

(assert start!51336)

(declare-fun b!560243 () Bool)

(declare-fun res!351399 () Bool)

(declare-fun e!322785 () Bool)

(assert (=> b!560243 (=> (not res!351399) (not e!322785))))

(declare-datatypes ((array!35201 0))(
  ( (array!35202 (arr!16901 (Array (_ BitVec 32) (_ BitVec 64))) (size!17265 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35201)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560243 (= res!351399 (validKeyInArray!0 (select (arr!16901 a!3118) j!142)))))

(declare-fun b!560244 () Bool)

(declare-fun lt!254685 () array!35201)

(declare-datatypes ((SeekEntryResult!5350 0))(
  ( (MissingZero!5350 (index!23627 (_ BitVec 32))) (Found!5350 (index!23628 (_ BitVec 32))) (Intermediate!5350 (undefined!6162 Bool) (index!23629 (_ BitVec 32)) (x!52541 (_ BitVec 32))) (Undefined!5350) (MissingVacant!5350 (index!23630 (_ BitVec 32))) )
))
(declare-fun lt!254683 () SeekEntryResult!5350)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!322784 () Bool)

(declare-fun lt!254687 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35201 (_ BitVec 32)) SeekEntryResult!5350)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35201 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!560244 (= e!322784 (= (seekEntryOrOpen!0 lt!254687 lt!254685 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52541 lt!254683) (index!23629 lt!254683) (index!23629 lt!254683) lt!254687 lt!254685 mask!3119)))))

(declare-fun b!560245 () Bool)

(declare-fun e!322791 () Bool)

(declare-fun e!322786 () Bool)

(assert (=> b!560245 (= e!322791 e!322786)))

(declare-fun res!351397 () Bool)

(assert (=> b!560245 (=> res!351397 e!322786)))

(assert (=> b!560245 (= res!351397 (or (undefined!6162 lt!254683) (not (is-Intermediate!5350 lt!254683))))))

(declare-fun b!560246 () Bool)

(declare-fun res!351400 () Bool)

(assert (=> b!560246 (=> (not res!351400) (not e!322785))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560246 (= res!351400 (and (= (size!17265 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17265 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17265 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!351402 () Bool)

(assert (=> start!51336 (=> (not res!351402) (not e!322785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51336 (= res!351402 (validMask!0 mask!3119))))

(assert (=> start!51336 e!322785))

(assert (=> start!51336 true))

(declare-fun array_inv!12697 (array!35201) Bool)

(assert (=> start!51336 (array_inv!12697 a!3118)))

(declare-fun b!560247 () Bool)

(declare-fun res!351396 () Bool)

(declare-fun e!322790 () Bool)

(assert (=> b!560247 (=> (not res!351396) (not e!322790))))

(declare-datatypes ((List!10981 0))(
  ( (Nil!10978) (Cons!10977 (h!11980 (_ BitVec 64)) (t!17209 List!10981)) )
))
(declare-fun arrayNoDuplicates!0 (array!35201 (_ BitVec 32) List!10981) Bool)

(assert (=> b!560247 (= res!351396 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10978))))

(declare-fun b!560248 () Bool)

(declare-fun e!322787 () Bool)

(assert (=> b!560248 (= e!322786 e!322787)))

(declare-fun res!351407 () Bool)

(assert (=> b!560248 (=> res!351407 e!322787)))

(declare-fun lt!254682 () (_ BitVec 64))

(assert (=> b!560248 (= res!351407 (or (= lt!254682 (select (arr!16901 a!3118) j!142)) (= lt!254682 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560248 (= lt!254682 (select (arr!16901 a!3118) (index!23629 lt!254683)))))

(declare-fun b!560249 () Bool)

(declare-fun res!351398 () Bool)

(assert (=> b!560249 (=> (not res!351398) (not e!322790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35201 (_ BitVec 32)) Bool)

(assert (=> b!560249 (= res!351398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560250 () Bool)

(declare-fun e!322789 () Bool)

(assert (=> b!560250 (= e!322789 (not true))))

(assert (=> b!560250 e!322791))

(declare-fun res!351406 () Bool)

(assert (=> b!560250 (=> (not res!351406) (not e!322791))))

(declare-fun lt!254688 () SeekEntryResult!5350)

(assert (=> b!560250 (= res!351406 (= lt!254688 (Found!5350 j!142)))))

(assert (=> b!560250 (= lt!254688 (seekEntryOrOpen!0 (select (arr!16901 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560250 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17474 0))(
  ( (Unit!17475) )
))
(declare-fun lt!254681 () Unit!17474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17474)

(assert (=> b!560250 (= lt!254681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560251 () Bool)

(assert (=> b!560251 (= e!322787 e!322784)))

(declare-fun res!351404 () Bool)

(assert (=> b!560251 (=> (not res!351404) (not e!322784))))

(assert (=> b!560251 (= res!351404 (= lt!254688 (seekKeyOrZeroReturnVacant!0 (x!52541 lt!254683) (index!23629 lt!254683) (index!23629 lt!254683) (select (arr!16901 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560252 () Bool)

(declare-fun res!351403 () Bool)

(assert (=> b!560252 (=> (not res!351403) (not e!322785))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560252 (= res!351403 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560253 () Bool)

(assert (=> b!560253 (= e!322790 e!322789)))

(declare-fun res!351405 () Bool)

(assert (=> b!560253 (=> (not res!351405) (not e!322789))))

(declare-fun lt!254686 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35201 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!560253 (= res!351405 (= lt!254683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254686 lt!254687 lt!254685 mask!3119)))))

(declare-fun lt!254684 () (_ BitVec 32))

(assert (=> b!560253 (= lt!254683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254684 (select (arr!16901 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560253 (= lt!254686 (toIndex!0 lt!254687 mask!3119))))

(assert (=> b!560253 (= lt!254687 (select (store (arr!16901 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560253 (= lt!254684 (toIndex!0 (select (arr!16901 a!3118) j!142) mask!3119))))

(assert (=> b!560253 (= lt!254685 (array!35202 (store (arr!16901 a!3118) i!1132 k!1914) (size!17265 a!3118)))))

(declare-fun b!560254 () Bool)

(declare-fun res!351395 () Bool)

(assert (=> b!560254 (=> (not res!351395) (not e!322785))))

(assert (=> b!560254 (= res!351395 (validKeyInArray!0 k!1914))))

(declare-fun b!560255 () Bool)

(assert (=> b!560255 (= e!322785 e!322790)))

(declare-fun res!351401 () Bool)

(assert (=> b!560255 (=> (not res!351401) (not e!322790))))

(declare-fun lt!254689 () SeekEntryResult!5350)

(assert (=> b!560255 (= res!351401 (or (= lt!254689 (MissingZero!5350 i!1132)) (= lt!254689 (MissingVacant!5350 i!1132))))))

(assert (=> b!560255 (= lt!254689 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51336 res!351402) b!560246))

(assert (= (and b!560246 res!351400) b!560243))

(assert (= (and b!560243 res!351399) b!560254))

(assert (= (and b!560254 res!351395) b!560252))

(assert (= (and b!560252 res!351403) b!560255))

(assert (= (and b!560255 res!351401) b!560249))

(assert (= (and b!560249 res!351398) b!560247))

(assert (= (and b!560247 res!351396) b!560253))

(assert (= (and b!560253 res!351405) b!560250))

(assert (= (and b!560250 res!351406) b!560245))

(assert (= (and b!560245 (not res!351397)) b!560248))

(assert (= (and b!560248 (not res!351407)) b!560251))

(assert (= (and b!560251 res!351404) b!560244))

(declare-fun m!537985 () Bool)

(assert (=> b!560255 m!537985))

(declare-fun m!537987 () Bool)

(assert (=> b!560249 m!537987))

(declare-fun m!537989 () Bool)

(assert (=> b!560243 m!537989))

(assert (=> b!560243 m!537989))

(declare-fun m!537991 () Bool)

(assert (=> b!560243 m!537991))

(declare-fun m!537993 () Bool)

(assert (=> b!560252 m!537993))

(assert (=> b!560250 m!537989))

(assert (=> b!560250 m!537989))

(declare-fun m!537995 () Bool)

(assert (=> b!560250 m!537995))

(declare-fun m!537997 () Bool)

(assert (=> b!560250 m!537997))

(declare-fun m!537999 () Bool)

(assert (=> b!560250 m!537999))

(declare-fun m!538001 () Bool)

(assert (=> b!560247 m!538001))

(assert (=> b!560253 m!537989))

(declare-fun m!538003 () Bool)

(assert (=> b!560253 m!538003))

(assert (=> b!560253 m!537989))

(declare-fun m!538005 () Bool)

(assert (=> b!560253 m!538005))

(assert (=> b!560253 m!537989))

(declare-fun m!538007 () Bool)

(assert (=> b!560253 m!538007))

(declare-fun m!538009 () Bool)

(assert (=> b!560253 m!538009))

(declare-fun m!538011 () Bool)

(assert (=> b!560253 m!538011))

(declare-fun m!538013 () Bool)

(assert (=> b!560253 m!538013))

(declare-fun m!538015 () Bool)

(assert (=> start!51336 m!538015))

(declare-fun m!538017 () Bool)

(assert (=> start!51336 m!538017))

(declare-fun m!538019 () Bool)

(assert (=> b!560244 m!538019))

(declare-fun m!538021 () Bool)

(assert (=> b!560244 m!538021))

(assert (=> b!560248 m!537989))

(declare-fun m!538023 () Bool)

(assert (=> b!560248 m!538023))

(declare-fun m!538025 () Bool)

(assert (=> b!560254 m!538025))

(assert (=> b!560251 m!537989))

(assert (=> b!560251 m!537989))

(declare-fun m!538027 () Bool)

(assert (=> b!560251 m!538027))

(push 1)

