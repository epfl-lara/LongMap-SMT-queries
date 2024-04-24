; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51636 () Bool)

(assert start!51636)

(declare-fun b!564738 () Bool)

(declare-fun res!355787 () Bool)

(declare-fun e!325287 () Bool)

(assert (=> b!564738 (=> (not res!355787) (not e!325287))))

(declare-datatypes ((array!35448 0))(
  ( (array!35449 (arr!17023 (Array (_ BitVec 32) (_ BitVec 64))) (size!17387 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35448)

(declare-datatypes ((List!11010 0))(
  ( (Nil!11007) (Cons!11006 (h!12012 (_ BitVec 64)) (t!17230 List!11010)) )
))
(declare-fun arrayNoDuplicates!0 (array!35448 (_ BitVec 32) List!11010) Bool)

(assert (=> b!564738 (= res!355787 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11007))))

(declare-fun res!355792 () Bool)

(declare-fun e!325285 () Bool)

(assert (=> start!51636 (=> (not res!355792) (not e!325285))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51636 (= res!355792 (validMask!0 mask!3119))))

(assert (=> start!51636 e!325285))

(assert (=> start!51636 true))

(declare-fun array_inv!12882 (array!35448) Bool)

(assert (=> start!51636 (array_inv!12882 a!3118)))

(declare-fun b!564739 () Bool)

(assert (=> b!564739 (= e!325285 e!325287)))

(declare-fun res!355789 () Bool)

(assert (=> b!564739 (=> (not res!355789) (not e!325287))))

(declare-datatypes ((SeekEntryResult!5428 0))(
  ( (MissingZero!5428 (index!23939 (_ BitVec 32))) (Found!5428 (index!23940 (_ BitVec 32))) (Intermediate!5428 (undefined!6240 Bool) (index!23941 (_ BitVec 32)) (x!52966 (_ BitVec 32))) (Undefined!5428) (MissingVacant!5428 (index!23942 (_ BitVec 32))) )
))
(declare-fun lt!257674 () SeekEntryResult!5428)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564739 (= res!355789 (or (= lt!257674 (MissingZero!5428 i!1132)) (= lt!257674 (MissingVacant!5428 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35448 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!564739 (= lt!257674 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564740 () Bool)

(declare-fun res!355791 () Bool)

(assert (=> b!564740 (=> (not res!355791) (not e!325285))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564740 (= res!355791 (validKeyInArray!0 (select (arr!17023 a!3118) j!142)))))

(declare-fun b!564741 () Bool)

(declare-fun res!355788 () Bool)

(assert (=> b!564741 (=> (not res!355788) (not e!325285))))

(declare-fun arrayContainsKey!0 (array!35448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564741 (= res!355788 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564742 () Bool)

(assert (=> b!564742 (= e!325287 false)))

(declare-fun lt!257676 () SeekEntryResult!5428)

(declare-fun lt!257673 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35448 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!564742 (= lt!257676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257673 (select (store (arr!17023 a!3118) i!1132 k0!1914) j!142) (array!35449 (store (arr!17023 a!3118) i!1132 k0!1914) (size!17387 a!3118)) mask!3119))))

(declare-fun lt!257677 () SeekEntryResult!5428)

(declare-fun lt!257675 () (_ BitVec 32))

(assert (=> b!564742 (= lt!257677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257675 (select (arr!17023 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564742 (= lt!257673 (toIndex!0 (select (store (arr!17023 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564742 (= lt!257675 (toIndex!0 (select (arr!17023 a!3118) j!142) mask!3119))))

(declare-fun b!564743 () Bool)

(declare-fun res!355790 () Bool)

(assert (=> b!564743 (=> (not res!355790) (not e!325287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35448 (_ BitVec 32)) Bool)

(assert (=> b!564743 (= res!355790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564744 () Bool)

(declare-fun res!355786 () Bool)

(assert (=> b!564744 (=> (not res!355786) (not e!325285))))

(assert (=> b!564744 (= res!355786 (and (= (size!17387 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17387 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17387 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564745 () Bool)

(declare-fun res!355785 () Bool)

(assert (=> b!564745 (=> (not res!355785) (not e!325285))))

(assert (=> b!564745 (= res!355785 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51636 res!355792) b!564744))

(assert (= (and b!564744 res!355786) b!564740))

(assert (= (and b!564740 res!355791) b!564745))

(assert (= (and b!564745 res!355785) b!564741))

(assert (= (and b!564741 res!355788) b!564739))

(assert (= (and b!564739 res!355789) b!564743))

(assert (= (and b!564743 res!355790) b!564738))

(assert (= (and b!564738 res!355787) b!564742))

(declare-fun m!543299 () Bool)

(assert (=> b!564741 m!543299))

(declare-fun m!543301 () Bool)

(assert (=> b!564740 m!543301))

(assert (=> b!564740 m!543301))

(declare-fun m!543303 () Bool)

(assert (=> b!564740 m!543303))

(declare-fun m!543305 () Bool)

(assert (=> start!51636 m!543305))

(declare-fun m!543307 () Bool)

(assert (=> start!51636 m!543307))

(declare-fun m!543309 () Bool)

(assert (=> b!564738 m!543309))

(declare-fun m!543311 () Bool)

(assert (=> b!564745 m!543311))

(declare-fun m!543313 () Bool)

(assert (=> b!564743 m!543313))

(declare-fun m!543315 () Bool)

(assert (=> b!564739 m!543315))

(assert (=> b!564742 m!543301))

(declare-fun m!543317 () Bool)

(assert (=> b!564742 m!543317))

(assert (=> b!564742 m!543301))

(declare-fun m!543319 () Bool)

(assert (=> b!564742 m!543319))

(declare-fun m!543321 () Bool)

(assert (=> b!564742 m!543321))

(assert (=> b!564742 m!543301))

(declare-fun m!543323 () Bool)

(assert (=> b!564742 m!543323))

(assert (=> b!564742 m!543319))

(declare-fun m!543325 () Bool)

(assert (=> b!564742 m!543325))

(assert (=> b!564742 m!543319))

(declare-fun m!543327 () Bool)

(assert (=> b!564742 m!543327))

(check-sat (not b!564741) (not b!564740) (not b!564742) (not b!564745) (not b!564738) (not b!564743) (not start!51636) (not b!564739))
(check-sat)
