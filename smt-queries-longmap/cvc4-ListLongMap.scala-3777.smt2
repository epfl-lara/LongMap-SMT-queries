; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51720 () Bool)

(assert start!51720)

(declare-fun b!565793 () Bool)

(declare-fun res!356766 () Bool)

(declare-fun e!325704 () Bool)

(assert (=> b!565793 (=> (not res!356766) (not e!325704))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565793 (= res!356766 (validKeyInArray!0 k!1914))))

(declare-fun b!565794 () Bool)

(declare-fun res!356763 () Bool)

(assert (=> b!565794 (=> (not res!356763) (not e!325704))))

(declare-datatypes ((array!35528 0))(
  ( (array!35529 (arr!17063 (Array (_ BitVec 32) (_ BitVec 64))) (size!17427 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35528)

(declare-fun arrayContainsKey!0 (array!35528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565794 (= res!356763 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565796 () Bool)

(declare-fun res!356768 () Bool)

(declare-fun e!325702 () Bool)

(assert (=> b!565796 (=> (not res!356768) (not e!325702))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35528 (_ BitVec 32)) Bool)

(assert (=> b!565796 (= res!356768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565797 () Bool)

(declare-fun res!356771 () Bool)

(assert (=> b!565797 (=> (not res!356771) (not e!325704))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565797 (= res!356771 (validKeyInArray!0 (select (arr!17063 a!3118) j!142)))))

(declare-fun b!565798 () Bool)

(declare-fun res!356769 () Bool)

(assert (=> b!565798 (=> (not res!356769) (not e!325702))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5512 0))(
  ( (MissingZero!5512 (index!24275 (_ BitVec 32))) (Found!5512 (index!24276 (_ BitVec 32))) (Intermediate!5512 (undefined!6324 Bool) (index!24277 (_ BitVec 32)) (x!53141 (_ BitVec 32))) (Undefined!5512) (MissingVacant!5512 (index!24278 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35528 (_ BitVec 32)) SeekEntryResult!5512)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565798 (= res!356769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17063 a!3118) j!142) mask!3119) (select (arr!17063 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17063 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17063 a!3118) i!1132 k!1914) j!142) (array!35529 (store (arr!17063 a!3118) i!1132 k!1914) (size!17427 a!3118)) mask!3119)))))

(declare-fun b!565799 () Bool)

(declare-fun res!356765 () Bool)

(assert (=> b!565799 (=> (not res!356765) (not e!325702))))

(declare-datatypes ((List!11143 0))(
  ( (Nil!11140) (Cons!11139 (h!12145 (_ BitVec 64)) (t!17371 List!11143)) )
))
(declare-fun arrayNoDuplicates!0 (array!35528 (_ BitVec 32) List!11143) Bool)

(assert (=> b!565799 (= res!356765 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11140))))

(declare-fun b!565800 () Bool)

(declare-fun e!325701 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35528 (_ BitVec 32)) SeekEntryResult!5512)

(assert (=> b!565800 (= e!325701 (= (seekEntryOrOpen!0 (select (arr!17063 a!3118) j!142) a!3118 mask!3119) (Found!5512 j!142)))))

(declare-fun res!356767 () Bool)

(assert (=> start!51720 (=> (not res!356767) (not e!325704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51720 (= res!356767 (validMask!0 mask!3119))))

(assert (=> start!51720 e!325704))

(assert (=> start!51720 true))

(declare-fun array_inv!12859 (array!35528) Bool)

(assert (=> start!51720 (array_inv!12859 a!3118)))

(declare-fun b!565795 () Bool)

(declare-fun res!356770 () Bool)

(assert (=> b!565795 (=> (not res!356770) (not e!325704))))

(assert (=> b!565795 (= res!356770 (and (= (size!17427 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17427 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17427 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565801 () Bool)

(assert (=> b!565801 (= e!325704 e!325702)))

(declare-fun res!356764 () Bool)

(assert (=> b!565801 (=> (not res!356764) (not e!325702))))

(declare-fun lt!257959 () SeekEntryResult!5512)

(assert (=> b!565801 (= res!356764 (or (= lt!257959 (MissingZero!5512 i!1132)) (= lt!257959 (MissingVacant!5512 i!1132))))))

(assert (=> b!565801 (= lt!257959 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565802 () Bool)

(assert (=> b!565802 (= e!325702 (not true))))

(assert (=> b!565802 e!325701))

(declare-fun res!356762 () Bool)

(assert (=> b!565802 (=> (not res!356762) (not e!325701))))

(assert (=> b!565802 (= res!356762 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17726 0))(
  ( (Unit!17727) )
))
(declare-fun lt!257958 () Unit!17726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17726)

(assert (=> b!565802 (= lt!257958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51720 res!356767) b!565795))

(assert (= (and b!565795 res!356770) b!565797))

(assert (= (and b!565797 res!356771) b!565793))

(assert (= (and b!565793 res!356766) b!565794))

(assert (= (and b!565794 res!356763) b!565801))

(assert (= (and b!565801 res!356764) b!565796))

(assert (= (and b!565796 res!356768) b!565799))

(assert (= (and b!565799 res!356765) b!565798))

(assert (= (and b!565798 res!356769) b!565802))

(assert (= (and b!565802 res!356762) b!565800))

(declare-fun m!544323 () Bool)

(assert (=> b!565797 m!544323))

(assert (=> b!565797 m!544323))

(declare-fun m!544325 () Bool)

(assert (=> b!565797 m!544325))

(declare-fun m!544327 () Bool)

(assert (=> b!565796 m!544327))

(assert (=> b!565798 m!544323))

(declare-fun m!544329 () Bool)

(assert (=> b!565798 m!544329))

(assert (=> b!565798 m!544323))

(declare-fun m!544331 () Bool)

(assert (=> b!565798 m!544331))

(declare-fun m!544333 () Bool)

(assert (=> b!565798 m!544333))

(assert (=> b!565798 m!544331))

(declare-fun m!544335 () Bool)

(assert (=> b!565798 m!544335))

(assert (=> b!565798 m!544329))

(assert (=> b!565798 m!544323))

(declare-fun m!544337 () Bool)

(assert (=> b!565798 m!544337))

(declare-fun m!544339 () Bool)

(assert (=> b!565798 m!544339))

(assert (=> b!565798 m!544331))

(assert (=> b!565798 m!544333))

(declare-fun m!544341 () Bool)

(assert (=> start!51720 m!544341))

(declare-fun m!544343 () Bool)

(assert (=> start!51720 m!544343))

(declare-fun m!544345 () Bool)

(assert (=> b!565801 m!544345))

(assert (=> b!565800 m!544323))

(assert (=> b!565800 m!544323))

(declare-fun m!544347 () Bool)

(assert (=> b!565800 m!544347))

(declare-fun m!544349 () Bool)

(assert (=> b!565802 m!544349))

(declare-fun m!544351 () Bool)

(assert (=> b!565802 m!544351))

(declare-fun m!544353 () Bool)

(assert (=> b!565794 m!544353))

(declare-fun m!544355 () Bool)

(assert (=> b!565793 m!544355))

(declare-fun m!544357 () Bool)

(assert (=> b!565799 m!544357))

(push 1)

