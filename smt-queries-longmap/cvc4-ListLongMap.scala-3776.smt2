; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51714 () Bool)

(assert start!51714)

(declare-fun b!565703 () Bool)

(declare-fun res!356681 () Bool)

(declare-fun e!325667 () Bool)

(assert (=> b!565703 (=> (not res!356681) (not e!325667))))

(declare-datatypes ((array!35522 0))(
  ( (array!35523 (arr!17060 (Array (_ BitVec 32) (_ BitVec 64))) (size!17424 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35522)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35522 (_ BitVec 32)) Bool)

(assert (=> b!565703 (= res!356681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565704 () Bool)

(declare-fun res!356673 () Bool)

(assert (=> b!565704 (=> (not res!356673) (not e!325667))))

(declare-datatypes ((List!11140 0))(
  ( (Nil!11137) (Cons!11136 (h!12142 (_ BitVec 64)) (t!17368 List!11140)) )
))
(declare-fun arrayNoDuplicates!0 (array!35522 (_ BitVec 32) List!11140) Bool)

(assert (=> b!565704 (= res!356673 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11137))))

(declare-fun b!565705 () Bool)

(declare-fun res!356672 () Bool)

(declare-fun e!325666 () Bool)

(assert (=> b!565705 (=> (not res!356672) (not e!325666))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565705 (= res!356672 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565706 () Bool)

(declare-fun res!356680 () Bool)

(assert (=> b!565706 (=> (not res!356680) (not e!325666))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565706 (= res!356680 (and (= (size!17424 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17424 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17424 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565708 () Bool)

(declare-fun res!356674 () Bool)

(assert (=> b!565708 (=> (not res!356674) (not e!325666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565708 (= res!356674 (validKeyInArray!0 k!1914))))

(declare-fun b!565709 () Bool)

(declare-fun res!356679 () Bool)

(assert (=> b!565709 (=> (not res!356679) (not e!325667))))

(declare-datatypes ((SeekEntryResult!5509 0))(
  ( (MissingZero!5509 (index!24263 (_ BitVec 32))) (Found!5509 (index!24264 (_ BitVec 32))) (Intermediate!5509 (undefined!6321 Bool) (index!24265 (_ BitVec 32)) (x!53130 (_ BitVec 32))) (Undefined!5509) (MissingVacant!5509 (index!24266 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35522 (_ BitVec 32)) SeekEntryResult!5509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565709 (= res!356679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17060 a!3118) j!142) mask!3119) (select (arr!17060 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17060 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17060 a!3118) i!1132 k!1914) j!142) (array!35523 (store (arr!17060 a!3118) i!1132 k!1914) (size!17424 a!3118)) mask!3119)))))

(declare-fun b!565710 () Bool)

(declare-fun res!356675 () Bool)

(assert (=> b!565710 (=> (not res!356675) (not e!325666))))

(assert (=> b!565710 (= res!356675 (validKeyInArray!0 (select (arr!17060 a!3118) j!142)))))

(declare-fun b!565711 () Bool)

(assert (=> b!565711 (= e!325667 (not true))))

(declare-fun e!325668 () Bool)

(assert (=> b!565711 e!325668))

(declare-fun res!356676 () Bool)

(assert (=> b!565711 (=> (not res!356676) (not e!325668))))

(assert (=> b!565711 (= res!356676 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17720 0))(
  ( (Unit!17721) )
))
(declare-fun lt!257940 () Unit!17720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17720)

(assert (=> b!565711 (= lt!257940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565712 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35522 (_ BitVec 32)) SeekEntryResult!5509)

(assert (=> b!565712 (= e!325668 (= (seekEntryOrOpen!0 (select (arr!17060 a!3118) j!142) a!3118 mask!3119) (Found!5509 j!142)))))

(declare-fun res!356678 () Bool)

(assert (=> start!51714 (=> (not res!356678) (not e!325666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51714 (= res!356678 (validMask!0 mask!3119))))

(assert (=> start!51714 e!325666))

(assert (=> start!51714 true))

(declare-fun array_inv!12856 (array!35522) Bool)

(assert (=> start!51714 (array_inv!12856 a!3118)))

(declare-fun b!565707 () Bool)

(assert (=> b!565707 (= e!325666 e!325667)))

(declare-fun res!356677 () Bool)

(assert (=> b!565707 (=> (not res!356677) (not e!325667))))

(declare-fun lt!257941 () SeekEntryResult!5509)

(assert (=> b!565707 (= res!356677 (or (= lt!257941 (MissingZero!5509 i!1132)) (= lt!257941 (MissingVacant!5509 i!1132))))))

(assert (=> b!565707 (= lt!257941 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51714 res!356678) b!565706))

(assert (= (and b!565706 res!356680) b!565710))

(assert (= (and b!565710 res!356675) b!565708))

(assert (= (and b!565708 res!356674) b!565705))

(assert (= (and b!565705 res!356672) b!565707))

(assert (= (and b!565707 res!356677) b!565703))

(assert (= (and b!565703 res!356681) b!565704))

(assert (= (and b!565704 res!356673) b!565709))

(assert (= (and b!565709 res!356679) b!565711))

(assert (= (and b!565711 res!356676) b!565712))

(declare-fun m!544215 () Bool)

(assert (=> b!565703 m!544215))

(declare-fun m!544217 () Bool)

(assert (=> b!565711 m!544217))

(declare-fun m!544219 () Bool)

(assert (=> b!565711 m!544219))

(declare-fun m!544221 () Bool)

(assert (=> b!565707 m!544221))

(declare-fun m!544223 () Bool)

(assert (=> b!565708 m!544223))

(declare-fun m!544225 () Bool)

(assert (=> start!51714 m!544225))

(declare-fun m!544227 () Bool)

(assert (=> start!51714 m!544227))

(declare-fun m!544229 () Bool)

(assert (=> b!565712 m!544229))

(assert (=> b!565712 m!544229))

(declare-fun m!544231 () Bool)

(assert (=> b!565712 m!544231))

(assert (=> b!565710 m!544229))

(assert (=> b!565710 m!544229))

(declare-fun m!544233 () Bool)

(assert (=> b!565710 m!544233))

(declare-fun m!544235 () Bool)

(assert (=> b!565704 m!544235))

(declare-fun m!544237 () Bool)

(assert (=> b!565705 m!544237))

(assert (=> b!565709 m!544229))

(declare-fun m!544239 () Bool)

(assert (=> b!565709 m!544239))

(assert (=> b!565709 m!544229))

(declare-fun m!544241 () Bool)

(assert (=> b!565709 m!544241))

(declare-fun m!544243 () Bool)

(assert (=> b!565709 m!544243))

(assert (=> b!565709 m!544241))

(declare-fun m!544245 () Bool)

(assert (=> b!565709 m!544245))

(assert (=> b!565709 m!544239))

(assert (=> b!565709 m!544229))

(declare-fun m!544247 () Bool)

(assert (=> b!565709 m!544247))

(declare-fun m!544249 () Bool)

(assert (=> b!565709 m!544249))

(assert (=> b!565709 m!544241))

(assert (=> b!565709 m!544243))

(push 1)

