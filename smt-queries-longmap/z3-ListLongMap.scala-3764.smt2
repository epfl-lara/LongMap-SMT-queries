; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51624 () Bool)

(assert start!51624)

(declare-fun b!564594 () Bool)

(declare-fun res!355641 () Bool)

(declare-fun e!325233 () Bool)

(assert (=> b!564594 (=> (not res!355641) (not e!325233))))

(declare-datatypes ((array!35436 0))(
  ( (array!35437 (arr!17017 (Array (_ BitVec 32) (_ BitVec 64))) (size!17381 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35436)

(declare-datatypes ((List!11004 0))(
  ( (Nil!11001) (Cons!11000 (h!12006 (_ BitVec 64)) (t!17224 List!11004)) )
))
(declare-fun arrayNoDuplicates!0 (array!35436 (_ BitVec 32) List!11004) Bool)

(assert (=> b!564594 (= res!355641 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11001))))

(declare-fun b!564595 () Bool)

(declare-fun res!355648 () Bool)

(declare-fun e!325231 () Bool)

(assert (=> b!564595 (=> (not res!355648) (not e!325231))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564595 (= res!355648 (validKeyInArray!0 (select (arr!17017 a!3118) j!142)))))

(declare-fun b!564596 () Bool)

(declare-fun res!355647 () Bool)

(assert (=> b!564596 (=> (not res!355647) (not e!325233))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35436 (_ BitVec 32)) Bool)

(assert (=> b!564596 (= res!355647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355642 () Bool)

(assert (=> start!51624 (=> (not res!355642) (not e!325231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51624 (= res!355642 (validMask!0 mask!3119))))

(assert (=> start!51624 e!325231))

(assert (=> start!51624 true))

(declare-fun array_inv!12876 (array!35436) Bool)

(assert (=> start!51624 (array_inv!12876 a!3118)))

(declare-fun b!564597 () Bool)

(declare-fun res!355644 () Bool)

(assert (=> b!564597 (=> (not res!355644) (not e!325231))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564597 (= res!355644 (and (= (size!17381 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17381 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17381 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564598 () Bool)

(declare-fun res!355643 () Bool)

(assert (=> b!564598 (=> (not res!355643) (not e!325231))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!564598 (= res!355643 (validKeyInArray!0 k0!1914))))

(declare-fun b!564599 () Bool)

(assert (=> b!564599 (= e!325233 false)))

(declare-fun lt!257632 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564599 (= lt!257632 (toIndex!0 (select (store (arr!17017 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!564600 () Bool)

(declare-fun res!355646 () Bool)

(assert (=> b!564600 (=> (not res!355646) (not e!325231))))

(declare-fun arrayContainsKey!0 (array!35436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564600 (= res!355646 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564601 () Bool)

(assert (=> b!564601 (= e!325231 e!325233)))

(declare-fun res!355645 () Bool)

(assert (=> b!564601 (=> (not res!355645) (not e!325233))))

(declare-datatypes ((SeekEntryResult!5422 0))(
  ( (MissingZero!5422 (index!23915 (_ BitVec 32))) (Found!5422 (index!23916 (_ BitVec 32))) (Intermediate!5422 (undefined!6234 Bool) (index!23917 (_ BitVec 32)) (x!52944 (_ BitVec 32))) (Undefined!5422) (MissingVacant!5422 (index!23918 (_ BitVec 32))) )
))
(declare-fun lt!257631 () SeekEntryResult!5422)

(assert (=> b!564601 (= res!355645 (or (= lt!257631 (MissingZero!5422 i!1132)) (= lt!257631 (MissingVacant!5422 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35436 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!564601 (= lt!257631 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51624 res!355642) b!564597))

(assert (= (and b!564597 res!355644) b!564595))

(assert (= (and b!564595 res!355648) b!564598))

(assert (= (and b!564598 res!355643) b!564600))

(assert (= (and b!564600 res!355646) b!564601))

(assert (= (and b!564601 res!355645) b!564596))

(assert (= (and b!564596 res!355647) b!564594))

(assert (= (and b!564594 res!355641) b!564599))

(declare-fun m!543155 () Bool)

(assert (=> b!564596 m!543155))

(declare-fun m!543157 () Bool)

(assert (=> start!51624 m!543157))

(declare-fun m!543159 () Bool)

(assert (=> start!51624 m!543159))

(declare-fun m!543161 () Bool)

(assert (=> b!564601 m!543161))

(declare-fun m!543163 () Bool)

(assert (=> b!564594 m!543163))

(declare-fun m!543165 () Bool)

(assert (=> b!564598 m!543165))

(declare-fun m!543167 () Bool)

(assert (=> b!564595 m!543167))

(assert (=> b!564595 m!543167))

(declare-fun m!543169 () Bool)

(assert (=> b!564595 m!543169))

(declare-fun m!543171 () Bool)

(assert (=> b!564600 m!543171))

(declare-fun m!543173 () Bool)

(assert (=> b!564599 m!543173))

(declare-fun m!543175 () Bool)

(assert (=> b!564599 m!543175))

(assert (=> b!564599 m!543175))

(declare-fun m!543177 () Bool)

(assert (=> b!564599 m!543177))

(check-sat (not b!564598) (not b!564599) (not b!564601) (not b!564596) (not b!564600) (not b!564594) (not b!564595) (not start!51624))
(check-sat)
