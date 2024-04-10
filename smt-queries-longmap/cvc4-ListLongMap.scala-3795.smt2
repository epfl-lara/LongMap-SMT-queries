; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52128 () Bool)

(assert start!52128)

(declare-fun b!568887 () Bool)

(declare-fun res!358913 () Bool)

(declare-fun e!327333 () Bool)

(assert (=> b!568887 (=> (not res!358913) (not e!327333))))

(declare-datatypes ((array!35651 0))(
  ( (array!35652 (arr!17117 (Array (_ BitVec 32) (_ BitVec 64))) (size!17481 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35651)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568887 (= res!358913 (validKeyInArray!0 (select (arr!17117 a!3118) j!142)))))

(declare-fun b!568888 () Bool)

(declare-fun e!327335 () Bool)

(assert (=> b!568888 (= e!327335 (not true))))

(declare-datatypes ((SeekEntryResult!5566 0))(
  ( (MissingZero!5566 (index!24491 (_ BitVec 32))) (Found!5566 (index!24492 (_ BitVec 32))) (Intermediate!5566 (undefined!6378 Bool) (index!24493 (_ BitVec 32)) (x!53369 (_ BitVec 32))) (Undefined!5566) (MissingVacant!5566 (index!24494 (_ BitVec 32))) )
))
(declare-fun lt!259178 () SeekEntryResult!5566)

(declare-fun lt!259176 () SeekEntryResult!5566)

(assert (=> b!568888 (and (= lt!259178 (Found!5566 j!142)) (or (undefined!6378 lt!259176) (not (is-Intermediate!5566 lt!259176)) (= (select (arr!17117 a!3118) (index!24493 lt!259176)) (select (arr!17117 a!3118) j!142)) (not (= (select (arr!17117 a!3118) (index!24493 lt!259176)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259178 (MissingZero!5566 (index!24493 lt!259176)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35651 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!568888 (= lt!259178 (seekEntryOrOpen!0 (select (arr!17117 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35651 (_ BitVec 32)) Bool)

(assert (=> b!568888 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17834 0))(
  ( (Unit!17835) )
))
(declare-fun lt!259180 () Unit!17834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17834)

(assert (=> b!568888 (= lt!259180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568889 () Bool)

(declare-fun res!358907 () Bool)

(assert (=> b!568889 (=> (not res!358907) (not e!327333))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568889 (= res!358907 (and (= (size!17481 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17481 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17481 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568890 () Bool)

(declare-fun res!358909 () Bool)

(assert (=> b!568890 (=> (not res!358909) (not e!327333))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568890 (= res!358909 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568891 () Bool)

(declare-fun e!327336 () Bool)

(assert (=> b!568891 (= e!327336 e!327335)))

(declare-fun res!358911 () Bool)

(assert (=> b!568891 (=> (not res!358911) (not e!327335))))

(declare-fun lt!259177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35651 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!568891 (= res!358911 (= lt!259176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259177 (select (store (arr!17117 a!3118) i!1132 k!1914) j!142) (array!35652 (store (arr!17117 a!3118) i!1132 k!1914) (size!17481 a!3118)) mask!3119)))))

(declare-fun lt!259175 () (_ BitVec 32))

(assert (=> b!568891 (= lt!259176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259175 (select (arr!17117 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568891 (= lt!259177 (toIndex!0 (select (store (arr!17117 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568891 (= lt!259175 (toIndex!0 (select (arr!17117 a!3118) j!142) mask!3119))))

(declare-fun b!568892 () Bool)

(declare-fun res!358905 () Bool)

(assert (=> b!568892 (=> (not res!358905) (not e!327336))))

(declare-datatypes ((List!11197 0))(
  ( (Nil!11194) (Cons!11193 (h!12214 (_ BitVec 64)) (t!17425 List!11197)) )
))
(declare-fun arrayNoDuplicates!0 (array!35651 (_ BitVec 32) List!11197) Bool)

(assert (=> b!568892 (= res!358905 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11194))))

(declare-fun b!568893 () Bool)

(assert (=> b!568893 (= e!327333 e!327336)))

(declare-fun res!358910 () Bool)

(assert (=> b!568893 (=> (not res!358910) (not e!327336))))

(declare-fun lt!259179 () SeekEntryResult!5566)

(assert (=> b!568893 (= res!358910 (or (= lt!259179 (MissingZero!5566 i!1132)) (= lt!259179 (MissingVacant!5566 i!1132))))))

(assert (=> b!568893 (= lt!259179 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!358908 () Bool)

(assert (=> start!52128 (=> (not res!358908) (not e!327333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52128 (= res!358908 (validMask!0 mask!3119))))

(assert (=> start!52128 e!327333))

(assert (=> start!52128 true))

(declare-fun array_inv!12913 (array!35651) Bool)

(assert (=> start!52128 (array_inv!12913 a!3118)))

(declare-fun b!568894 () Bool)

(declare-fun res!358906 () Bool)

(assert (=> b!568894 (=> (not res!358906) (not e!327333))))

(assert (=> b!568894 (= res!358906 (validKeyInArray!0 k!1914))))

(declare-fun b!568895 () Bool)

(declare-fun res!358912 () Bool)

(assert (=> b!568895 (=> (not res!358912) (not e!327336))))

(assert (=> b!568895 (= res!358912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52128 res!358908) b!568889))

(assert (= (and b!568889 res!358907) b!568887))

(assert (= (and b!568887 res!358913) b!568894))

(assert (= (and b!568894 res!358906) b!568890))

(assert (= (and b!568890 res!358909) b!568893))

(assert (= (and b!568893 res!358910) b!568895))

(assert (= (and b!568895 res!358912) b!568892))

(assert (= (and b!568892 res!358905) b!568891))

(assert (= (and b!568891 res!358911) b!568888))

(declare-fun m!547393 () Bool)

(assert (=> b!568887 m!547393))

(assert (=> b!568887 m!547393))

(declare-fun m!547395 () Bool)

(assert (=> b!568887 m!547395))

(declare-fun m!547397 () Bool)

(assert (=> b!568894 m!547397))

(declare-fun m!547399 () Bool)

(assert (=> start!52128 m!547399))

(declare-fun m!547401 () Bool)

(assert (=> start!52128 m!547401))

(declare-fun m!547403 () Bool)

(assert (=> b!568895 m!547403))

(declare-fun m!547405 () Bool)

(assert (=> b!568893 m!547405))

(assert (=> b!568888 m!547393))

(declare-fun m!547407 () Bool)

(assert (=> b!568888 m!547407))

(assert (=> b!568888 m!547393))

(declare-fun m!547409 () Bool)

(assert (=> b!568888 m!547409))

(declare-fun m!547411 () Bool)

(assert (=> b!568888 m!547411))

(declare-fun m!547413 () Bool)

(assert (=> b!568888 m!547413))

(declare-fun m!547415 () Bool)

(assert (=> b!568892 m!547415))

(assert (=> b!568891 m!547393))

(declare-fun m!547417 () Bool)

(assert (=> b!568891 m!547417))

(assert (=> b!568891 m!547393))

(declare-fun m!547419 () Bool)

(assert (=> b!568891 m!547419))

(assert (=> b!568891 m!547393))

(declare-fun m!547421 () Bool)

(assert (=> b!568891 m!547421))

(assert (=> b!568891 m!547421))

(declare-fun m!547423 () Bool)

(assert (=> b!568891 m!547423))

(declare-fun m!547425 () Bool)

(assert (=> b!568891 m!547425))

(assert (=> b!568891 m!547421))

(declare-fun m!547427 () Bool)

(assert (=> b!568891 m!547427))

(declare-fun m!547429 () Bool)

(assert (=> b!568890 m!547429))

(push 1)

