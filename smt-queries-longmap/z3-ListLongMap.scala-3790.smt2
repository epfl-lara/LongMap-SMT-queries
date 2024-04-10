; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51916 () Bool)

(assert start!51916)

(declare-fun b!567533 () Bool)

(declare-fun res!358125 () Bool)

(declare-fun e!326556 () Bool)

(assert (=> b!567533 (=> (not res!358125) (not e!326556))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35610 0))(
  ( (array!35611 (arr!17101 (Array (_ BitVec 32) (_ BitVec 64))) (size!17465 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35610)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!567533 (= res!358125 (and (= (size!17465 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17465 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17465 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567534 () Bool)

(declare-fun e!326558 () Bool)

(assert (=> b!567534 (= e!326558 (not true))))

(declare-fun e!326557 () Bool)

(assert (=> b!567534 e!326557))

(declare-fun res!358122 () Bool)

(assert (=> b!567534 (=> (not res!358122) (not e!326557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35610 (_ BitVec 32)) Bool)

(assert (=> b!567534 (= res!358122 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17802 0))(
  ( (Unit!17803) )
))
(declare-fun lt!258535 () Unit!17802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17802)

(assert (=> b!567534 (= lt!258535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567535 () Bool)

(declare-fun res!358124 () Bool)

(assert (=> b!567535 (=> (not res!358124) (not e!326558))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5550 0))(
  ( (MissingZero!5550 (index!24427 (_ BitVec 32))) (Found!5550 (index!24428 (_ BitVec 32))) (Intermediate!5550 (undefined!6362 Bool) (index!24429 (_ BitVec 32)) (x!53295 (_ BitVec 32))) (Undefined!5550) (MissingVacant!5550 (index!24430 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35610 (_ BitVec 32)) SeekEntryResult!5550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567535 (= res!358124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17101 a!3118) j!142) mask!3119) (select (arr!17101 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (array!35611 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)) mask!3119)))))

(declare-fun b!567536 () Bool)

(declare-fun res!358119 () Bool)

(assert (=> b!567536 (=> (not res!358119) (not e!326558))))

(assert (=> b!567536 (= res!358119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567537 () Bool)

(declare-fun res!358121 () Bool)

(assert (=> b!567537 (=> (not res!358121) (not e!326556))))

(declare-fun arrayContainsKey!0 (array!35610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567537 (= res!358121 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567538 () Bool)

(declare-fun res!358118 () Bool)

(assert (=> b!567538 (=> (not res!358118) (not e!326556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567538 (= res!358118 (validKeyInArray!0 (select (arr!17101 a!3118) j!142)))))

(declare-fun res!358120 () Bool)

(assert (=> start!51916 (=> (not res!358120) (not e!326556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51916 (= res!358120 (validMask!0 mask!3119))))

(assert (=> start!51916 e!326556))

(assert (=> start!51916 true))

(declare-fun array_inv!12897 (array!35610) Bool)

(assert (=> start!51916 (array_inv!12897 a!3118)))

(declare-fun b!567539 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35610 (_ BitVec 32)) SeekEntryResult!5550)

(assert (=> b!567539 (= e!326557 (= (seekEntryOrOpen!0 (select (arr!17101 a!3118) j!142) a!3118 mask!3119) (Found!5550 j!142)))))

(declare-fun b!567540 () Bool)

(declare-fun res!358127 () Bool)

(assert (=> b!567540 (=> (not res!358127) (not e!326556))))

(assert (=> b!567540 (= res!358127 (validKeyInArray!0 k0!1914))))

(declare-fun b!567541 () Bool)

(assert (=> b!567541 (= e!326556 e!326558)))

(declare-fun res!358123 () Bool)

(assert (=> b!567541 (=> (not res!358123) (not e!326558))))

(declare-fun lt!258534 () SeekEntryResult!5550)

(assert (=> b!567541 (= res!358123 (or (= lt!258534 (MissingZero!5550 i!1132)) (= lt!258534 (MissingVacant!5550 i!1132))))))

(assert (=> b!567541 (= lt!258534 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567542 () Bool)

(declare-fun res!358126 () Bool)

(assert (=> b!567542 (=> (not res!358126) (not e!326558))))

(declare-datatypes ((List!11181 0))(
  ( (Nil!11178) (Cons!11177 (h!12189 (_ BitVec 64)) (t!17409 List!11181)) )
))
(declare-fun arrayNoDuplicates!0 (array!35610 (_ BitVec 32) List!11181) Bool)

(assert (=> b!567542 (= res!358126 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11178))))

(assert (= (and start!51916 res!358120) b!567533))

(assert (= (and b!567533 res!358125) b!567538))

(assert (= (and b!567538 res!358118) b!567540))

(assert (= (and b!567540 res!358127) b!567537))

(assert (= (and b!567537 res!358121) b!567541))

(assert (= (and b!567541 res!358123) b!567536))

(assert (= (and b!567536 res!358119) b!567542))

(assert (= (and b!567542 res!358126) b!567535))

(assert (= (and b!567535 res!358124) b!567534))

(assert (= (and b!567534 res!358122) b!567539))

(declare-fun m!546141 () Bool)

(assert (=> b!567535 m!546141))

(declare-fun m!546143 () Bool)

(assert (=> b!567535 m!546143))

(assert (=> b!567535 m!546141))

(declare-fun m!546145 () Bool)

(assert (=> b!567535 m!546145))

(declare-fun m!546147 () Bool)

(assert (=> b!567535 m!546147))

(assert (=> b!567535 m!546145))

(declare-fun m!546149 () Bool)

(assert (=> b!567535 m!546149))

(assert (=> b!567535 m!546143))

(assert (=> b!567535 m!546141))

(declare-fun m!546151 () Bool)

(assert (=> b!567535 m!546151))

(declare-fun m!546153 () Bool)

(assert (=> b!567535 m!546153))

(assert (=> b!567535 m!546145))

(assert (=> b!567535 m!546147))

(declare-fun m!546155 () Bool)

(assert (=> b!567534 m!546155))

(declare-fun m!546157 () Bool)

(assert (=> b!567534 m!546157))

(declare-fun m!546159 () Bool)

(assert (=> b!567536 m!546159))

(assert (=> b!567538 m!546141))

(assert (=> b!567538 m!546141))

(declare-fun m!546161 () Bool)

(assert (=> b!567538 m!546161))

(declare-fun m!546163 () Bool)

(assert (=> start!51916 m!546163))

(declare-fun m!546165 () Bool)

(assert (=> start!51916 m!546165))

(declare-fun m!546167 () Bool)

(assert (=> b!567542 m!546167))

(declare-fun m!546169 () Bool)

(assert (=> b!567541 m!546169))

(declare-fun m!546171 () Bool)

(assert (=> b!567540 m!546171))

(assert (=> b!567539 m!546141))

(assert (=> b!567539 m!546141))

(declare-fun m!546173 () Bool)

(assert (=> b!567539 m!546173))

(declare-fun m!546175 () Bool)

(assert (=> b!567537 m!546175))

(check-sat (not b!567540) (not b!567535) (not b!567537) (not b!567539) (not b!567534) (not b!567536) (not b!567542) (not b!567538) (not start!51916) (not b!567541))
(check-sat)
