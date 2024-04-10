; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51618 () Bool)

(assert start!51618)

(declare-fun res!356051 () Bool)

(declare-fun e!325283 () Bool)

(assert (=> start!51618 (=> (not res!356051) (not e!325283))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51618 (= res!356051 (validMask!0 mask!3119))))

(assert (=> start!51618 e!325283))

(assert (=> start!51618 true))

(declare-datatypes ((array!35483 0))(
  ( (array!35484 (arr!17042 (Array (_ BitVec 32) (_ BitVec 64))) (size!17406 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35483)

(declare-fun array_inv!12838 (array!35483) Bool)

(assert (=> start!51618 (array_inv!12838 a!3118)))

(declare-fun b!564892 () Bool)

(declare-fun res!356046 () Bool)

(declare-fun e!325282 () Bool)

(assert (=> b!564892 (=> (not res!356046) (not e!325282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35483 (_ BitVec 32)) Bool)

(assert (=> b!564892 (= res!356046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564893 () Bool)

(declare-fun res!356045 () Bool)

(assert (=> b!564893 (=> (not res!356045) (not e!325283))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564893 (= res!356045 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564894 () Bool)

(declare-fun res!356044 () Bool)

(assert (=> b!564894 (=> (not res!356044) (not e!325283))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564894 (= res!356044 (and (= (size!17406 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17406 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17406 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564895 () Bool)

(declare-fun res!356047 () Bool)

(assert (=> b!564895 (=> (not res!356047) (not e!325282))))

(declare-datatypes ((List!11122 0))(
  ( (Nil!11119) (Cons!11118 (h!12121 (_ BitVec 64)) (t!17350 List!11122)) )
))
(declare-fun arrayNoDuplicates!0 (array!35483 (_ BitVec 32) List!11122) Bool)

(assert (=> b!564895 (= res!356047 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11119))))

(declare-fun b!564896 () Bool)

(declare-fun res!356050 () Bool)

(assert (=> b!564896 (=> (not res!356050) (not e!325283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564896 (= res!356050 (validKeyInArray!0 (select (arr!17042 a!3118) j!142)))))

(declare-fun b!564897 () Bool)

(assert (=> b!564897 (= e!325282 false)))

(declare-datatypes ((SeekEntryResult!5491 0))(
  ( (MissingZero!5491 (index!24191 (_ BitVec 32))) (Found!5491 (index!24192 (_ BitVec 32))) (Intermediate!5491 (undefined!6303 Bool) (index!24193 (_ BitVec 32)) (x!53058 (_ BitVec 32))) (Undefined!5491) (MissingVacant!5491 (index!24194 (_ BitVec 32))) )
))
(declare-fun lt!257704 () SeekEntryResult!5491)

(declare-fun lt!257702 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35483 (_ BitVec 32)) SeekEntryResult!5491)

(assert (=> b!564897 (= lt!257704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257702 (select (store (arr!17042 a!3118) i!1132 k!1914) j!142) (array!35484 (store (arr!17042 a!3118) i!1132 k!1914) (size!17406 a!3118)) mask!3119))))

(declare-fun lt!257700 () SeekEntryResult!5491)

(declare-fun lt!257703 () (_ BitVec 32))

(assert (=> b!564897 (= lt!257700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257703 (select (arr!17042 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564897 (= lt!257702 (toIndex!0 (select (store (arr!17042 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564897 (= lt!257703 (toIndex!0 (select (arr!17042 a!3118) j!142) mask!3119))))

(declare-fun b!564898 () Bool)

(declare-fun res!356049 () Bool)

(assert (=> b!564898 (=> (not res!356049) (not e!325283))))

(assert (=> b!564898 (= res!356049 (validKeyInArray!0 k!1914))))

(declare-fun b!564899 () Bool)

(assert (=> b!564899 (= e!325283 e!325282)))

(declare-fun res!356048 () Bool)

(assert (=> b!564899 (=> (not res!356048) (not e!325282))))

(declare-fun lt!257701 () SeekEntryResult!5491)

(assert (=> b!564899 (= res!356048 (or (= lt!257701 (MissingZero!5491 i!1132)) (= lt!257701 (MissingVacant!5491 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35483 (_ BitVec 32)) SeekEntryResult!5491)

(assert (=> b!564899 (= lt!257701 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51618 res!356051) b!564894))

(assert (= (and b!564894 res!356044) b!564896))

(assert (= (and b!564896 res!356050) b!564898))

(assert (= (and b!564898 res!356049) b!564893))

(assert (= (and b!564893 res!356045) b!564899))

(assert (= (and b!564899 res!356048) b!564892))

(assert (= (and b!564892 res!356046) b!564895))

(assert (= (and b!564895 res!356047) b!564897))

(declare-fun m!543381 () Bool)

(assert (=> start!51618 m!543381))

(declare-fun m!543383 () Bool)

(assert (=> start!51618 m!543383))

(declare-fun m!543385 () Bool)

(assert (=> b!564896 m!543385))

(assert (=> b!564896 m!543385))

(declare-fun m!543387 () Bool)

(assert (=> b!564896 m!543387))

(declare-fun m!543389 () Bool)

(assert (=> b!564895 m!543389))

(assert (=> b!564897 m!543385))

(declare-fun m!543391 () Bool)

(assert (=> b!564897 m!543391))

(assert (=> b!564897 m!543385))

(declare-fun m!543393 () Bool)

(assert (=> b!564897 m!543393))

(assert (=> b!564897 m!543385))

(declare-fun m!543395 () Bool)

(assert (=> b!564897 m!543395))

(declare-fun m!543397 () Bool)

(assert (=> b!564897 m!543397))

(assert (=> b!564897 m!543393))

(declare-fun m!543399 () Bool)

(assert (=> b!564897 m!543399))

(assert (=> b!564897 m!543393))

(declare-fun m!543401 () Bool)

(assert (=> b!564897 m!543401))

(declare-fun m!543403 () Bool)

(assert (=> b!564898 m!543403))

(declare-fun m!543405 () Bool)

(assert (=> b!564892 m!543405))

(declare-fun m!543407 () Bool)

(assert (=> b!564893 m!543407))

(declare-fun m!543409 () Bool)

(assert (=> b!564899 m!543409))

(push 1)

(assert (not b!564893))

