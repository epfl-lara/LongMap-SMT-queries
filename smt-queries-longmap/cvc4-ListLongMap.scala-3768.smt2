; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51606 () Bool)

(assert start!51606)

(declare-fun b!564738 () Bool)

(declare-fun res!355895 () Bool)

(declare-fun e!325230 () Bool)

(assert (=> b!564738 (=> (not res!355895) (not e!325230))))

(declare-datatypes ((array!35471 0))(
  ( (array!35472 (arr!17036 (Array (_ BitVec 32) (_ BitVec 64))) (size!17400 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35471)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35471 (_ BitVec 32)) Bool)

(assert (=> b!564738 (= res!355895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355897 () Bool)

(declare-fun e!325229 () Bool)

(assert (=> start!51606 (=> (not res!355897) (not e!325229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51606 (= res!355897 (validMask!0 mask!3119))))

(assert (=> start!51606 e!325229))

(assert (=> start!51606 true))

(declare-fun array_inv!12832 (array!35471) Bool)

(assert (=> start!51606 (array_inv!12832 a!3118)))

(declare-fun b!564739 () Bool)

(declare-fun res!355890 () Bool)

(assert (=> b!564739 (=> (not res!355890) (not e!325229))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564739 (= res!355890 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564740 () Bool)

(assert (=> b!564740 (= e!325230 (bvsgt #b00000000000000000000000000000000 (size!17400 a!3118)))))

(declare-fun b!564741 () Bool)

(declare-fun res!355896 () Bool)

(assert (=> b!564741 (=> (not res!355896) (not e!325229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564741 (= res!355896 (validKeyInArray!0 k!1914))))

(declare-fun b!564742 () Bool)

(declare-fun res!355891 () Bool)

(assert (=> b!564742 (=> (not res!355891) (not e!325230))))

(declare-datatypes ((List!11116 0))(
  ( (Nil!11113) (Cons!11112 (h!12115 (_ BitVec 64)) (t!17344 List!11116)) )
))
(declare-fun arrayNoDuplicates!0 (array!35471 (_ BitVec 32) List!11116) Bool)

(assert (=> b!564742 (= res!355891 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11113))))

(declare-fun b!564743 () Bool)

(declare-fun res!355893 () Bool)

(assert (=> b!564743 (=> (not res!355893) (not e!325229))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564743 (= res!355893 (and (= (size!17400 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17400 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17400 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564744 () Bool)

(assert (=> b!564744 (= e!325229 e!325230)))

(declare-fun res!355894 () Bool)

(assert (=> b!564744 (=> (not res!355894) (not e!325230))))

(declare-datatypes ((SeekEntryResult!5485 0))(
  ( (MissingZero!5485 (index!24167 (_ BitVec 32))) (Found!5485 (index!24168 (_ BitVec 32))) (Intermediate!5485 (undefined!6297 Bool) (index!24169 (_ BitVec 32)) (x!53036 (_ BitVec 32))) (Undefined!5485) (MissingVacant!5485 (index!24170 (_ BitVec 32))) )
))
(declare-fun lt!257650 () SeekEntryResult!5485)

(assert (=> b!564744 (= res!355894 (or (= lt!257650 (MissingZero!5485 i!1132)) (= lt!257650 (MissingVacant!5485 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35471 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!564744 (= lt!257650 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564745 () Bool)

(declare-fun res!355898 () Bool)

(assert (=> b!564745 (=> (not res!355898) (not e!325230))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35471 (_ BitVec 32)) SeekEntryResult!5485)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564745 (= res!355898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17036 a!3118) j!142) mask!3119) (select (arr!17036 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17036 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17036 a!3118) i!1132 k!1914) j!142) (array!35472 (store (arr!17036 a!3118) i!1132 k!1914) (size!17400 a!3118)) mask!3119)))))

(declare-fun b!564746 () Bool)

(declare-fun res!355892 () Bool)

(assert (=> b!564746 (=> (not res!355892) (not e!325229))))

(assert (=> b!564746 (= res!355892 (validKeyInArray!0 (select (arr!17036 a!3118) j!142)))))

(assert (= (and start!51606 res!355897) b!564743))

(assert (= (and b!564743 res!355893) b!564746))

(assert (= (and b!564746 res!355892) b!564741))

(assert (= (and b!564741 res!355896) b!564739))

(assert (= (and b!564739 res!355890) b!564744))

(assert (= (and b!564744 res!355894) b!564738))

(assert (= (and b!564738 res!355895) b!564742))

(assert (= (and b!564742 res!355891) b!564745))

(assert (= (and b!564745 res!355898) b!564740))

(declare-fun m!543201 () Bool)

(assert (=> b!564738 m!543201))

(declare-fun m!543203 () Bool)

(assert (=> b!564739 m!543203))

(declare-fun m!543205 () Bool)

(assert (=> b!564746 m!543205))

(assert (=> b!564746 m!543205))

(declare-fun m!543207 () Bool)

(assert (=> b!564746 m!543207))

(declare-fun m!543209 () Bool)

(assert (=> b!564744 m!543209))

(declare-fun m!543211 () Bool)

(assert (=> b!564741 m!543211))

(declare-fun m!543213 () Bool)

(assert (=> start!51606 m!543213))

(declare-fun m!543215 () Bool)

(assert (=> start!51606 m!543215))

(assert (=> b!564745 m!543205))

(declare-fun m!543217 () Bool)

(assert (=> b!564745 m!543217))

(assert (=> b!564745 m!543205))

(declare-fun m!543219 () Bool)

(assert (=> b!564745 m!543219))

(declare-fun m!543221 () Bool)

(assert (=> b!564745 m!543221))

(assert (=> b!564745 m!543219))

(declare-fun m!543223 () Bool)

(assert (=> b!564745 m!543223))

(assert (=> b!564745 m!543217))

(assert (=> b!564745 m!543205))

(declare-fun m!543225 () Bool)

(assert (=> b!564745 m!543225))

(declare-fun m!543227 () Bool)

(assert (=> b!564745 m!543227))

(assert (=> b!564745 m!543219))

(assert (=> b!564745 m!543221))

(declare-fun m!543229 () Bool)

(assert (=> b!564742 m!543229))

(push 1)

(assert (not b!564745))

(assert (not b!564741))

(assert (not b!564738))

