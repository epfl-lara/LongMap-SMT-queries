; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51348 () Bool)

(assert start!51348)

(declare-fun b!560477 () Bool)

(declare-fun e!322931 () Bool)

(declare-fun e!322929 () Bool)

(assert (=> b!560477 (= e!322931 e!322929)))

(declare-fun res!351629 () Bool)

(assert (=> b!560477 (=> (not res!351629) (not e!322929))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5356 0))(
  ( (MissingZero!5356 (index!23651 (_ BitVec 32))) (Found!5356 (index!23652 (_ BitVec 32))) (Intermediate!5356 (undefined!6168 Bool) (index!23653 (_ BitVec 32)) (x!52563 (_ BitVec 32))) (Undefined!5356) (MissingVacant!5356 (index!23654 (_ BitVec 32))) )
))
(declare-fun lt!254850 () SeekEntryResult!5356)

(declare-fun lt!254846 () SeekEntryResult!5356)

(declare-datatypes ((array!35213 0))(
  ( (array!35214 (arr!16907 (Array (_ BitVec 32) (_ BitVec 64))) (size!17271 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35213)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35213 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560477 (= res!351629 (= lt!254850 (seekKeyOrZeroReturnVacant!0 (x!52563 lt!254846) (index!23653 lt!254846) (index!23653 lt!254846) (select (arr!16907 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560478 () Bool)

(declare-fun res!351640 () Bool)

(declare-fun e!322934 () Bool)

(assert (=> b!560478 (=> (not res!351640) (not e!322934))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560478 (= res!351640 (validKeyInArray!0 k!1914))))

(declare-fun b!560479 () Bool)

(declare-fun lt!254845 () array!35213)

(declare-fun lt!254847 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35213 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560479 (= e!322929 (= (seekEntryOrOpen!0 lt!254847 lt!254845 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52563 lt!254846) (index!23653 lt!254846) (index!23653 lt!254846) lt!254847 lt!254845 mask!3119)))))

(declare-fun b!560480 () Bool)

(declare-fun e!322933 () Bool)

(assert (=> b!560480 (= e!322933 (not true))))

(declare-fun e!322932 () Bool)

(assert (=> b!560480 e!322932))

(declare-fun res!351631 () Bool)

(assert (=> b!560480 (=> (not res!351631) (not e!322932))))

(assert (=> b!560480 (= res!351631 (= lt!254850 (Found!5356 j!142)))))

(assert (=> b!560480 (= lt!254850 (seekEntryOrOpen!0 (select (arr!16907 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35213 (_ BitVec 32)) Bool)

(assert (=> b!560480 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17486 0))(
  ( (Unit!17487) )
))
(declare-fun lt!254851 () Unit!17486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17486)

(assert (=> b!560480 (= lt!254851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!351637 () Bool)

(assert (=> start!51348 (=> (not res!351637) (not e!322934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51348 (= res!351637 (validMask!0 mask!3119))))

(assert (=> start!51348 e!322934))

(assert (=> start!51348 true))

(declare-fun array_inv!12703 (array!35213) Bool)

(assert (=> start!51348 (array_inv!12703 a!3118)))

(declare-fun b!560481 () Bool)

(declare-fun res!351633 () Bool)

(assert (=> b!560481 (=> (not res!351633) (not e!322934))))

(assert (=> b!560481 (= res!351633 (validKeyInArray!0 (select (arr!16907 a!3118) j!142)))))

(declare-fun b!560482 () Bool)

(declare-fun res!351639 () Bool)

(declare-fun e!322935 () Bool)

(assert (=> b!560482 (=> (not res!351639) (not e!322935))))

(assert (=> b!560482 (= res!351639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560483 () Bool)

(assert (=> b!560483 (= e!322935 e!322933)))

(declare-fun res!351634 () Bool)

(assert (=> b!560483 (=> (not res!351634) (not e!322933))))

(declare-fun lt!254849 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35213 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560483 (= res!351634 (= lt!254846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254849 lt!254847 lt!254845 mask!3119)))))

(declare-fun lt!254843 () (_ BitVec 32))

(assert (=> b!560483 (= lt!254846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254843 (select (arr!16907 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560483 (= lt!254849 (toIndex!0 lt!254847 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560483 (= lt!254847 (select (store (arr!16907 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560483 (= lt!254843 (toIndex!0 (select (arr!16907 a!3118) j!142) mask!3119))))

(assert (=> b!560483 (= lt!254845 (array!35214 (store (arr!16907 a!3118) i!1132 k!1914) (size!17271 a!3118)))))

(declare-fun b!560484 () Bool)

(declare-fun res!351632 () Bool)

(assert (=> b!560484 (=> (not res!351632) (not e!322934))))

(declare-fun arrayContainsKey!0 (array!35213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560484 (= res!351632 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560485 () Bool)

(declare-fun e!322930 () Bool)

(assert (=> b!560485 (= e!322930 e!322931)))

(declare-fun res!351638 () Bool)

(assert (=> b!560485 (=> res!351638 e!322931)))

(declare-fun lt!254848 () (_ BitVec 64))

(assert (=> b!560485 (= res!351638 (or (= lt!254848 (select (arr!16907 a!3118) j!142)) (= lt!254848 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560485 (= lt!254848 (select (arr!16907 a!3118) (index!23653 lt!254846)))))

(declare-fun b!560486 () Bool)

(assert (=> b!560486 (= e!322934 e!322935)))

(declare-fun res!351636 () Bool)

(assert (=> b!560486 (=> (not res!351636) (not e!322935))))

(declare-fun lt!254844 () SeekEntryResult!5356)

(assert (=> b!560486 (= res!351636 (or (= lt!254844 (MissingZero!5356 i!1132)) (= lt!254844 (MissingVacant!5356 i!1132))))))

(assert (=> b!560486 (= lt!254844 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560487 () Bool)

(assert (=> b!560487 (= e!322932 e!322930)))

(declare-fun res!351641 () Bool)

(assert (=> b!560487 (=> res!351641 e!322930)))

(assert (=> b!560487 (= res!351641 (or (undefined!6168 lt!254846) (not (is-Intermediate!5356 lt!254846))))))

(declare-fun b!560488 () Bool)

(declare-fun res!351635 () Bool)

(assert (=> b!560488 (=> (not res!351635) (not e!322935))))

(declare-datatypes ((List!10987 0))(
  ( (Nil!10984) (Cons!10983 (h!11986 (_ BitVec 64)) (t!17215 List!10987)) )
))
(declare-fun arrayNoDuplicates!0 (array!35213 (_ BitVec 32) List!10987) Bool)

(assert (=> b!560488 (= res!351635 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10984))))

(declare-fun b!560489 () Bool)

(declare-fun res!351630 () Bool)

(assert (=> b!560489 (=> (not res!351630) (not e!322934))))

(assert (=> b!560489 (= res!351630 (and (= (size!17271 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17271 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17271 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51348 res!351637) b!560489))

(assert (= (and b!560489 res!351630) b!560481))

(assert (= (and b!560481 res!351633) b!560478))

(assert (= (and b!560478 res!351640) b!560484))

(assert (= (and b!560484 res!351632) b!560486))

(assert (= (and b!560486 res!351636) b!560482))

(assert (= (and b!560482 res!351639) b!560488))

(assert (= (and b!560488 res!351635) b!560483))

(assert (= (and b!560483 res!351634) b!560480))

(assert (= (and b!560480 res!351631) b!560487))

(assert (= (and b!560487 (not res!351641)) b!560485))

(assert (= (and b!560485 (not res!351638)) b!560477))

(assert (= (and b!560477 res!351629) b!560479))

(declare-fun m!538249 () Bool)

(assert (=> b!560483 m!538249))

(declare-fun m!538251 () Bool)

(assert (=> b!560483 m!538251))

(assert (=> b!560483 m!538249))

(declare-fun m!538253 () Bool)

(assert (=> b!560483 m!538253))

(declare-fun m!538255 () Bool)

(assert (=> b!560483 m!538255))

(assert (=> b!560483 m!538249))

(declare-fun m!538257 () Bool)

(assert (=> b!560483 m!538257))

(declare-fun m!538259 () Bool)

(assert (=> b!560483 m!538259))

(declare-fun m!538261 () Bool)

(assert (=> b!560483 m!538261))

(declare-fun m!538263 () Bool)

(assert (=> b!560482 m!538263))

(declare-fun m!538265 () Bool)

(assert (=> b!560488 m!538265))

(assert (=> b!560477 m!538249))

(assert (=> b!560477 m!538249))

(declare-fun m!538267 () Bool)

(assert (=> b!560477 m!538267))

(assert (=> b!560480 m!538249))

(assert (=> b!560480 m!538249))

(declare-fun m!538269 () Bool)

(assert (=> b!560480 m!538269))

(declare-fun m!538271 () Bool)

(assert (=> b!560480 m!538271))

(declare-fun m!538273 () Bool)

(assert (=> b!560480 m!538273))

(declare-fun m!538275 () Bool)

(assert (=> b!560484 m!538275))

(declare-fun m!538277 () Bool)

(assert (=> start!51348 m!538277))

(declare-fun m!538279 () Bool)

(assert (=> start!51348 m!538279))

(declare-fun m!538281 () Bool)

(assert (=> b!560486 m!538281))

(assert (=> b!560481 m!538249))

(assert (=> b!560481 m!538249))

(declare-fun m!538283 () Bool)

(assert (=> b!560481 m!538283))

(declare-fun m!538285 () Bool)

(assert (=> b!560479 m!538285))

(declare-fun m!538287 () Bool)

(assert (=> b!560479 m!538287))

(assert (=> b!560485 m!538249))

(declare-fun m!538289 () Bool)

(assert (=> b!560485 m!538289))

(declare-fun m!538291 () Bool)

(assert (=> b!560478 m!538291))

(push 1)

