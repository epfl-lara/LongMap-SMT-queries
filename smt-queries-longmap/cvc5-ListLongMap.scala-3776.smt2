; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51710 () Bool)

(assert start!51710)

(declare-fun res!356620 () Bool)

(declare-fun e!325642 () Bool)

(assert (=> start!51710 (=> (not res!356620) (not e!325642))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51710 (= res!356620 (validMask!0 mask!3119))))

(assert (=> start!51710 e!325642))

(assert (=> start!51710 true))

(declare-datatypes ((array!35518 0))(
  ( (array!35519 (arr!17058 (Array (_ BitVec 32) (_ BitVec 64))) (size!17422 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35518)

(declare-fun array_inv!12854 (array!35518) Bool)

(assert (=> start!51710 (array_inv!12854 a!3118)))

(declare-fun b!565643 () Bool)

(declare-fun e!325643 () Bool)

(assert (=> b!565643 (= e!325642 e!325643)))

(declare-fun res!356619 () Bool)

(assert (=> b!565643 (=> (not res!356619) (not e!325643))))

(declare-datatypes ((SeekEntryResult!5507 0))(
  ( (MissingZero!5507 (index!24255 (_ BitVec 32))) (Found!5507 (index!24256 (_ BitVec 32))) (Intermediate!5507 (undefined!6319 Bool) (index!24257 (_ BitVec 32)) (x!53128 (_ BitVec 32))) (Undefined!5507) (MissingVacant!5507 (index!24258 (_ BitVec 32))) )
))
(declare-fun lt!257929 () SeekEntryResult!5507)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565643 (= res!356619 (or (= lt!257929 (MissingZero!5507 i!1132)) (= lt!257929 (MissingVacant!5507 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35518 (_ BitVec 32)) SeekEntryResult!5507)

(assert (=> b!565643 (= lt!257929 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565644 () Bool)

(declare-fun res!356614 () Bool)

(assert (=> b!565644 (=> (not res!356614) (not e!325643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35518 (_ BitVec 32)) Bool)

(assert (=> b!565644 (= res!356614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565645 () Bool)

(declare-fun res!356612 () Bool)

(assert (=> b!565645 (=> (not res!356612) (not e!325642))))

(declare-fun arrayContainsKey!0 (array!35518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565645 (= res!356612 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565646 () Bool)

(declare-fun res!356615 () Bool)

(assert (=> b!565646 (=> (not res!356615) (not e!325642))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565646 (= res!356615 (validKeyInArray!0 (select (arr!17058 a!3118) j!142)))))

(declare-fun b!565647 () Bool)

(declare-fun res!356616 () Bool)

(assert (=> b!565647 (=> (not res!356616) (not e!325643))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35518 (_ BitVec 32)) SeekEntryResult!5507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565647 (= res!356616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17058 a!3118) j!142) mask!3119) (select (arr!17058 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17058 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17058 a!3118) i!1132 k!1914) j!142) (array!35519 (store (arr!17058 a!3118) i!1132 k!1914) (size!17422 a!3118)) mask!3119)))))

(declare-fun b!565648 () Bool)

(assert (=> b!565648 (= e!325643 (not true))))

(declare-fun e!325641 () Bool)

(assert (=> b!565648 e!325641))

(declare-fun res!356613 () Bool)

(assert (=> b!565648 (=> (not res!356613) (not e!325641))))

(assert (=> b!565648 (= res!356613 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17716 0))(
  ( (Unit!17717) )
))
(declare-fun lt!257928 () Unit!17716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17716)

(assert (=> b!565648 (= lt!257928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565649 () Bool)

(assert (=> b!565649 (= e!325641 (= (seekEntryOrOpen!0 (select (arr!17058 a!3118) j!142) a!3118 mask!3119) (Found!5507 j!142)))))

(declare-fun b!565650 () Bool)

(declare-fun res!356618 () Bool)

(assert (=> b!565650 (=> (not res!356618) (not e!325643))))

(declare-datatypes ((List!11138 0))(
  ( (Nil!11135) (Cons!11134 (h!12140 (_ BitVec 64)) (t!17366 List!11138)) )
))
(declare-fun arrayNoDuplicates!0 (array!35518 (_ BitVec 32) List!11138) Bool)

(assert (=> b!565650 (= res!356618 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11135))))

(declare-fun b!565651 () Bool)

(declare-fun res!356617 () Bool)

(assert (=> b!565651 (=> (not res!356617) (not e!325642))))

(assert (=> b!565651 (= res!356617 (and (= (size!17422 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17422 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17422 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565652 () Bool)

(declare-fun res!356621 () Bool)

(assert (=> b!565652 (=> (not res!356621) (not e!325642))))

(assert (=> b!565652 (= res!356621 (validKeyInArray!0 k!1914))))

(assert (= (and start!51710 res!356620) b!565651))

(assert (= (and b!565651 res!356617) b!565646))

(assert (= (and b!565646 res!356615) b!565652))

(assert (= (and b!565652 res!356621) b!565645))

(assert (= (and b!565645 res!356612) b!565643))

(assert (= (and b!565643 res!356619) b!565644))

(assert (= (and b!565644 res!356614) b!565650))

(assert (= (and b!565650 res!356618) b!565647))

(assert (= (and b!565647 res!356616) b!565648))

(assert (= (and b!565648 res!356613) b!565649))

(declare-fun m!544143 () Bool)

(assert (=> b!565643 m!544143))

(declare-fun m!544145 () Bool)

(assert (=> b!565647 m!544145))

(declare-fun m!544147 () Bool)

(assert (=> b!565647 m!544147))

(assert (=> b!565647 m!544145))

(declare-fun m!544149 () Bool)

(assert (=> b!565647 m!544149))

(declare-fun m!544151 () Bool)

(assert (=> b!565647 m!544151))

(assert (=> b!565647 m!544149))

(declare-fun m!544153 () Bool)

(assert (=> b!565647 m!544153))

(assert (=> b!565647 m!544147))

(assert (=> b!565647 m!544145))

(declare-fun m!544155 () Bool)

(assert (=> b!565647 m!544155))

(declare-fun m!544157 () Bool)

(assert (=> b!565647 m!544157))

(assert (=> b!565647 m!544149))

(assert (=> b!565647 m!544151))

(assert (=> b!565646 m!544145))

(assert (=> b!565646 m!544145))

(declare-fun m!544159 () Bool)

(assert (=> b!565646 m!544159))

(declare-fun m!544161 () Bool)

(assert (=> b!565652 m!544161))

(declare-fun m!544163 () Bool)

(assert (=> b!565648 m!544163))

(declare-fun m!544165 () Bool)

(assert (=> b!565648 m!544165))

(declare-fun m!544167 () Bool)

(assert (=> b!565644 m!544167))

(declare-fun m!544169 () Bool)

(assert (=> start!51710 m!544169))

(declare-fun m!544171 () Bool)

(assert (=> start!51710 m!544171))

(assert (=> b!565649 m!544145))

(assert (=> b!565649 m!544145))

(declare-fun m!544173 () Bool)

(assert (=> b!565649 m!544173))

(declare-fun m!544175 () Bool)

(assert (=> b!565650 m!544175))

(declare-fun m!544177 () Bool)

(assert (=> b!565645 m!544177))

(push 1)

