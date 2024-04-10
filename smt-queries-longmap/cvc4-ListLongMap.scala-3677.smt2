; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50682 () Bool)

(assert start!50682)

(declare-fun b!554161 () Bool)

(declare-fun res!346576 () Bool)

(declare-fun e!319578 () Bool)

(assert (=> b!554161 (=> (not res!346576) (not e!319578))))

(declare-datatypes ((array!34907 0))(
  ( (array!34908 (arr!16763 (Array (_ BitVec 32) (_ BitVec 64))) (size!17127 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34907)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554161 (= res!346576 (validKeyInArray!0 (select (arr!16763 a!3118) j!142)))))

(declare-fun b!554162 () Bool)

(declare-fun res!346578 () Bool)

(assert (=> b!554162 (=> (not res!346578) (not e!319578))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!554162 (= res!346578 (validKeyInArray!0 k!1914))))

(declare-fun res!346583 () Bool)

(assert (=> start!50682 (=> (not res!346583) (not e!319578))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50682 (= res!346583 (validMask!0 mask!3119))))

(assert (=> start!50682 e!319578))

(assert (=> start!50682 true))

(declare-fun array_inv!12559 (array!34907) Bool)

(assert (=> start!50682 (array_inv!12559 a!3118)))

(declare-fun b!554163 () Bool)

(declare-fun res!346577 () Bool)

(declare-fun e!319576 () Bool)

(assert (=> b!554163 (=> (not res!346577) (not e!319576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34907 (_ BitVec 32)) Bool)

(assert (=> b!554163 (= res!346577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554164 () Bool)

(declare-fun res!346580 () Bool)

(assert (=> b!554164 (=> (not res!346580) (not e!319578))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554164 (= res!346580 (and (= (size!17127 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17127 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17127 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554165 () Bool)

(declare-fun e!319573 () Bool)

(assert (=> b!554165 (= e!319576 e!319573)))

(declare-fun res!346574 () Bool)

(assert (=> b!554165 (=> (not res!346574) (not e!319573))))

(declare-fun lt!251708 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5212 0))(
  ( (MissingZero!5212 (index!23075 (_ BitVec 32))) (Found!5212 (index!23076 (_ BitVec 32))) (Intermediate!5212 (undefined!6024 Bool) (index!23077 (_ BitVec 32)) (x!51990 (_ BitVec 32))) (Undefined!5212) (MissingVacant!5212 (index!23078 (_ BitVec 32))) )
))
(declare-fun lt!251709 () SeekEntryResult!5212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34907 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!554165 (= res!346574 (= lt!251709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251708 (select (store (arr!16763 a!3118) i!1132 k!1914) j!142) (array!34908 (store (arr!16763 a!3118) i!1132 k!1914) (size!17127 a!3118)) mask!3119)))))

(declare-fun lt!251707 () (_ BitVec 32))

(assert (=> b!554165 (= lt!251709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251707 (select (arr!16763 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554165 (= lt!251708 (toIndex!0 (select (store (arr!16763 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554165 (= lt!251707 (toIndex!0 (select (arr!16763 a!3118) j!142) mask!3119))))

(declare-fun b!554166 () Bool)

(declare-fun res!346573 () Bool)

(assert (=> b!554166 (=> (not res!346573) (not e!319576))))

(declare-datatypes ((List!10843 0))(
  ( (Nil!10840) (Cons!10839 (h!11824 (_ BitVec 64)) (t!17071 List!10843)) )
))
(declare-fun arrayNoDuplicates!0 (array!34907 (_ BitVec 32) List!10843) Bool)

(assert (=> b!554166 (= res!346573 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10840))))

(declare-fun b!554167 () Bool)

(declare-fun e!319574 () Bool)

(assert (=> b!554167 (= e!319573 (not e!319574))))

(declare-fun res!346579 () Bool)

(assert (=> b!554167 (=> res!346579 e!319574)))

(assert (=> b!554167 (= res!346579 (or (not (is-Intermediate!5212 lt!251709)) (undefined!6024 lt!251709) (not (= (select (arr!16763 a!3118) (index!23077 lt!251709)) (select (arr!16763 a!3118) j!142))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319577 () Bool)

(assert (=> b!554167 e!319577))

(declare-fun res!346575 () Bool)

(assert (=> b!554167 (=> (not res!346575) (not e!319577))))

(assert (=> b!554167 (= res!346575 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17198 0))(
  ( (Unit!17199) )
))
(declare-fun lt!251706 () Unit!17198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17198)

(assert (=> b!554167 (= lt!251706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554168 () Bool)

(declare-fun res!346581 () Bool)

(assert (=> b!554168 (=> (not res!346581) (not e!319578))))

(declare-fun arrayContainsKey!0 (array!34907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554168 (= res!346581 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554169 () Bool)

(assert (=> b!554169 (= e!319578 e!319576)))

(declare-fun res!346582 () Bool)

(assert (=> b!554169 (=> (not res!346582) (not e!319576))))

(declare-fun lt!251710 () SeekEntryResult!5212)

(assert (=> b!554169 (= res!346582 (or (= lt!251710 (MissingZero!5212 i!1132)) (= lt!251710 (MissingVacant!5212 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34907 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!554169 (= lt!251710 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554170 () Bool)

(assert (=> b!554170 (= e!319574 (validKeyInArray!0 (select (store (arr!16763 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!554171 () Bool)

(assert (=> b!554171 (= e!319577 (= (seekEntryOrOpen!0 (select (arr!16763 a!3118) j!142) a!3118 mask!3119) (Found!5212 j!142)))))

(assert (= (and start!50682 res!346583) b!554164))

(assert (= (and b!554164 res!346580) b!554161))

(assert (= (and b!554161 res!346576) b!554162))

(assert (= (and b!554162 res!346578) b!554168))

(assert (= (and b!554168 res!346581) b!554169))

(assert (= (and b!554169 res!346582) b!554163))

(assert (= (and b!554163 res!346577) b!554166))

(assert (= (and b!554166 res!346573) b!554165))

(assert (= (and b!554165 res!346574) b!554167))

(assert (= (and b!554167 res!346575) b!554171))

(assert (= (and b!554167 (not res!346579)) b!554170))

(declare-fun m!531395 () Bool)

(assert (=> b!554163 m!531395))

(declare-fun m!531397 () Bool)

(assert (=> b!554161 m!531397))

(assert (=> b!554161 m!531397))

(declare-fun m!531399 () Bool)

(assert (=> b!554161 m!531399))

(declare-fun m!531401 () Bool)

(assert (=> b!554167 m!531401))

(assert (=> b!554167 m!531397))

(declare-fun m!531403 () Bool)

(assert (=> b!554167 m!531403))

(declare-fun m!531405 () Bool)

(assert (=> b!554167 m!531405))

(declare-fun m!531407 () Bool)

(assert (=> start!50682 m!531407))

(declare-fun m!531409 () Bool)

(assert (=> start!50682 m!531409))

(declare-fun m!531411 () Bool)

(assert (=> b!554168 m!531411))

(declare-fun m!531413 () Bool)

(assert (=> b!554165 m!531413))

(declare-fun m!531415 () Bool)

(assert (=> b!554165 m!531415))

(assert (=> b!554165 m!531397))

(declare-fun m!531417 () Bool)

(assert (=> b!554165 m!531417))

(assert (=> b!554165 m!531397))

(assert (=> b!554165 m!531413))

(assert (=> b!554165 m!531397))

(declare-fun m!531419 () Bool)

(assert (=> b!554165 m!531419))

(declare-fun m!531421 () Bool)

(assert (=> b!554165 m!531421))

(assert (=> b!554165 m!531413))

(declare-fun m!531423 () Bool)

(assert (=> b!554165 m!531423))

(declare-fun m!531425 () Bool)

(assert (=> b!554169 m!531425))

(assert (=> b!554170 m!531421))

(assert (=> b!554170 m!531413))

(assert (=> b!554170 m!531413))

(declare-fun m!531427 () Bool)

(assert (=> b!554170 m!531427))

(declare-fun m!531429 () Bool)

(assert (=> b!554166 m!531429))

(declare-fun m!531431 () Bool)

(assert (=> b!554162 m!531431))

(assert (=> b!554171 m!531397))

(assert (=> b!554171 m!531397))

(declare-fun m!531433 () Bool)

(assert (=> b!554171 m!531433))

(push 1)

