; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51590 () Bool)

(assert start!51590)

(declare-fun b!564538 () Bool)

(declare-fun e!325158 () Bool)

(assert (=> b!564538 (= e!325158 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!257563 () (_ BitVec 32))

(declare-datatypes ((array!35455 0))(
  ( (array!35456 (arr!17028 (Array (_ BitVec 32) (_ BitVec 64))) (size!17392 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35455)

(declare-datatypes ((SeekEntryResult!5477 0))(
  ( (MissingZero!5477 (index!24135 (_ BitVec 32))) (Found!5477 (index!24136 (_ BitVec 32))) (Intermediate!5477 (undefined!6289 Bool) (index!24137 (_ BitVec 32)) (x!53012 (_ BitVec 32))) (Undefined!5477) (MissingVacant!5477 (index!24138 (_ BitVec 32))) )
))
(declare-fun lt!257566 () SeekEntryResult!5477)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35455 (_ BitVec 32)) SeekEntryResult!5477)

(assert (=> b!564538 (= lt!257566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257563 (select (store (arr!17028 a!3118) i!1132 k!1914) j!142) (array!35456 (store (arr!17028 a!3118) i!1132 k!1914) (size!17392 a!3118)) mask!3119))))

(declare-fun lt!257562 () (_ BitVec 32))

(declare-fun lt!257565 () SeekEntryResult!5477)

(assert (=> b!564538 (= lt!257565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257562 (select (arr!17028 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564538 (= lt!257563 (toIndex!0 (select (store (arr!17028 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564538 (= lt!257562 (toIndex!0 (select (arr!17028 a!3118) j!142) mask!3119))))

(declare-fun b!564539 () Bool)

(declare-fun e!325157 () Bool)

(assert (=> b!564539 (= e!325157 e!325158)))

(declare-fun res!355695 () Bool)

(assert (=> b!564539 (=> (not res!355695) (not e!325158))))

(declare-fun lt!257564 () SeekEntryResult!5477)

(assert (=> b!564539 (= res!355695 (or (= lt!257564 (MissingZero!5477 i!1132)) (= lt!257564 (MissingVacant!5477 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35455 (_ BitVec 32)) SeekEntryResult!5477)

(assert (=> b!564539 (= lt!257564 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564540 () Bool)

(declare-fun res!355693 () Bool)

(assert (=> b!564540 (=> (not res!355693) (not e!325158))))

(declare-datatypes ((List!11108 0))(
  ( (Nil!11105) (Cons!11104 (h!12107 (_ BitVec 64)) (t!17336 List!11108)) )
))
(declare-fun arrayNoDuplicates!0 (array!35455 (_ BitVec 32) List!11108) Bool)

(assert (=> b!564540 (= res!355693 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11105))))

(declare-fun b!564541 () Bool)

(declare-fun res!355691 () Bool)

(assert (=> b!564541 (=> (not res!355691) (not e!325157))))

(declare-fun arrayContainsKey!0 (array!35455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564541 (= res!355691 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564542 () Bool)

(declare-fun res!355696 () Bool)

(assert (=> b!564542 (=> (not res!355696) (not e!325157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564542 (= res!355696 (validKeyInArray!0 (select (arr!17028 a!3118) j!142)))))

(declare-fun b!564543 () Bool)

(declare-fun res!355694 () Bool)

(assert (=> b!564543 (=> (not res!355694) (not e!325158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35455 (_ BitVec 32)) Bool)

(assert (=> b!564543 (= res!355694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355692 () Bool)

(assert (=> start!51590 (=> (not res!355692) (not e!325157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51590 (= res!355692 (validMask!0 mask!3119))))

(assert (=> start!51590 e!325157))

(assert (=> start!51590 true))

(declare-fun array_inv!12824 (array!35455) Bool)

(assert (=> start!51590 (array_inv!12824 a!3118)))

(declare-fun b!564544 () Bool)

(declare-fun res!355697 () Bool)

(assert (=> b!564544 (=> (not res!355697) (not e!325157))))

(assert (=> b!564544 (= res!355697 (and (= (size!17392 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17392 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17392 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564545 () Bool)

(declare-fun res!355690 () Bool)

(assert (=> b!564545 (=> (not res!355690) (not e!325157))))

(assert (=> b!564545 (= res!355690 (validKeyInArray!0 k!1914))))

(assert (= (and start!51590 res!355692) b!564544))

(assert (= (and b!564544 res!355697) b!564542))

(assert (= (and b!564542 res!355696) b!564545))

(assert (= (and b!564545 res!355690) b!564541))

(assert (= (and b!564541 res!355691) b!564539))

(assert (= (and b!564539 res!355695) b!564543))

(assert (= (and b!564543 res!355694) b!564540))

(assert (= (and b!564540 res!355693) b!564538))

(declare-fun m!542961 () Bool)

(assert (=> b!564538 m!542961))

(declare-fun m!542963 () Bool)

(assert (=> b!564538 m!542963))

(assert (=> b!564538 m!542961))

(declare-fun m!542965 () Bool)

(assert (=> b!564538 m!542965))

(declare-fun m!542967 () Bool)

(assert (=> b!564538 m!542967))

(assert (=> b!564538 m!542965))

(declare-fun m!542969 () Bool)

(assert (=> b!564538 m!542969))

(assert (=> b!564538 m!542961))

(declare-fun m!542971 () Bool)

(assert (=> b!564538 m!542971))

(assert (=> b!564538 m!542965))

(declare-fun m!542973 () Bool)

(assert (=> b!564538 m!542973))

(assert (=> b!564542 m!542961))

(assert (=> b!564542 m!542961))

(declare-fun m!542975 () Bool)

(assert (=> b!564542 m!542975))

(declare-fun m!542977 () Bool)

(assert (=> b!564545 m!542977))

(declare-fun m!542979 () Bool)

(assert (=> b!564539 m!542979))

(declare-fun m!542981 () Bool)

(assert (=> b!564540 m!542981))

(declare-fun m!542983 () Bool)

(assert (=> b!564541 m!542983))

(declare-fun m!542985 () Bool)

(assert (=> b!564543 m!542985))

(declare-fun m!542987 () Bool)

(assert (=> start!51590 m!542987))

(declare-fun m!542989 () Bool)

(assert (=> start!51590 m!542989))

(push 1)

