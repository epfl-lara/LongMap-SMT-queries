; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51894 () Bool)

(assert start!51894)

(declare-fun b!567203 () Bool)

(declare-fun res!357788 () Bool)

(declare-fun e!326427 () Bool)

(assert (=> b!567203 (=> (not res!357788) (not e!326427))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567203 (= res!357788 (validKeyInArray!0 k!1914))))

(declare-fun b!567204 () Bool)

(declare-fun res!357797 () Bool)

(declare-fun e!326426 () Bool)

(assert (=> b!567204 (=> (not res!357797) (not e!326426))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35588 0))(
  ( (array!35589 (arr!17090 (Array (_ BitVec 32) (_ BitVec 64))) (size!17454 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35588)

(declare-datatypes ((SeekEntryResult!5539 0))(
  ( (MissingZero!5539 (index!24383 (_ BitVec 32))) (Found!5539 (index!24384 (_ BitVec 32))) (Intermediate!5539 (undefined!6351 Bool) (index!24385 (_ BitVec 32)) (x!53252 (_ BitVec 32))) (Undefined!5539) (MissingVacant!5539 (index!24386 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35588 (_ BitVec 32)) SeekEntryResult!5539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567204 (= res!357797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17090 a!3118) j!142) mask!3119) (select (arr!17090 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17090 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17090 a!3118) i!1132 k!1914) j!142) (array!35589 (store (arr!17090 a!3118) i!1132 k!1914) (size!17454 a!3118)) mask!3119)))))

(declare-fun b!567205 () Bool)

(declare-fun res!357792 () Bool)

(assert (=> b!567205 (=> (not res!357792) (not e!326427))))

(declare-fun arrayContainsKey!0 (array!35588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567205 (= res!357792 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567206 () Bool)

(declare-fun e!326424 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35588 (_ BitVec 32)) SeekEntryResult!5539)

(assert (=> b!567206 (= e!326424 (= (seekEntryOrOpen!0 (select (arr!17090 a!3118) j!142) a!3118 mask!3119) (Found!5539 j!142)))))

(declare-fun b!567207 () Bool)

(declare-fun res!357794 () Bool)

(assert (=> b!567207 (=> (not res!357794) (not e!326426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35588 (_ BitVec 32)) Bool)

(assert (=> b!567207 (= res!357794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567208 () Bool)

(assert (=> b!567208 (= e!326427 e!326426)))

(declare-fun res!357796 () Bool)

(assert (=> b!567208 (=> (not res!357796) (not e!326426))))

(declare-fun lt!258469 () SeekEntryResult!5539)

(assert (=> b!567208 (= res!357796 (or (= lt!258469 (MissingZero!5539 i!1132)) (= lt!258469 (MissingVacant!5539 i!1132))))))

(assert (=> b!567208 (= lt!258469 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567209 () Bool)

(declare-fun res!357793 () Bool)

(assert (=> b!567209 (=> (not res!357793) (not e!326427))))

(assert (=> b!567209 (= res!357793 (and (= (size!17454 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17454 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17454 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567210 () Bool)

(assert (=> b!567210 (= e!326426 (not true))))

(assert (=> b!567210 e!326424))

(declare-fun res!357791 () Bool)

(assert (=> b!567210 (=> (not res!357791) (not e!326424))))

(assert (=> b!567210 (= res!357791 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17780 0))(
  ( (Unit!17781) )
))
(declare-fun lt!258468 () Unit!17780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17780)

(assert (=> b!567210 (= lt!258468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567211 () Bool)

(declare-fun res!357795 () Bool)

(assert (=> b!567211 (=> (not res!357795) (not e!326426))))

(declare-datatypes ((List!11170 0))(
  ( (Nil!11167) (Cons!11166 (h!12178 (_ BitVec 64)) (t!17398 List!11170)) )
))
(declare-fun arrayNoDuplicates!0 (array!35588 (_ BitVec 32) List!11170) Bool)

(assert (=> b!567211 (= res!357795 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11167))))

(declare-fun res!357789 () Bool)

(assert (=> start!51894 (=> (not res!357789) (not e!326427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51894 (= res!357789 (validMask!0 mask!3119))))

(assert (=> start!51894 e!326427))

(assert (=> start!51894 true))

(declare-fun array_inv!12886 (array!35588) Bool)

(assert (=> start!51894 (array_inv!12886 a!3118)))

(declare-fun b!567212 () Bool)

(declare-fun res!357790 () Bool)

(assert (=> b!567212 (=> (not res!357790) (not e!326427))))

(assert (=> b!567212 (= res!357790 (validKeyInArray!0 (select (arr!17090 a!3118) j!142)))))

(assert (= (and start!51894 res!357789) b!567209))

(assert (= (and b!567209 res!357793) b!567212))

(assert (= (and b!567212 res!357790) b!567203))

(assert (= (and b!567203 res!357788) b!567205))

(assert (= (and b!567205 res!357792) b!567208))

(assert (= (and b!567208 res!357796) b!567207))

(assert (= (and b!567207 res!357794) b!567211))

(assert (= (and b!567211 res!357795) b!567204))

(assert (= (and b!567204 res!357797) b!567210))

(assert (= (and b!567210 res!357791) b!567206))

(declare-fun m!545745 () Bool)

(assert (=> b!567206 m!545745))

(assert (=> b!567206 m!545745))

(declare-fun m!545747 () Bool)

(assert (=> b!567206 m!545747))

(declare-fun m!545749 () Bool)

(assert (=> b!567205 m!545749))

(declare-fun m!545751 () Bool)

(assert (=> b!567207 m!545751))

(declare-fun m!545753 () Bool)

(assert (=> start!51894 m!545753))

(declare-fun m!545755 () Bool)

(assert (=> start!51894 m!545755))

(assert (=> b!567204 m!545745))

(declare-fun m!545757 () Bool)

(assert (=> b!567204 m!545757))

(assert (=> b!567204 m!545745))

(declare-fun m!545759 () Bool)

(assert (=> b!567204 m!545759))

(declare-fun m!545761 () Bool)

(assert (=> b!567204 m!545761))

(assert (=> b!567204 m!545759))

(declare-fun m!545763 () Bool)

(assert (=> b!567204 m!545763))

(assert (=> b!567204 m!545757))

(assert (=> b!567204 m!545745))

(declare-fun m!545765 () Bool)

(assert (=> b!567204 m!545765))

(declare-fun m!545767 () Bool)

(assert (=> b!567204 m!545767))

(assert (=> b!567204 m!545759))

(assert (=> b!567204 m!545761))

(declare-fun m!545769 () Bool)

(assert (=> b!567208 m!545769))

(declare-fun m!545771 () Bool)

(assert (=> b!567210 m!545771))

(declare-fun m!545773 () Bool)

(assert (=> b!567210 m!545773))

(declare-fun m!545775 () Bool)

(assert (=> b!567211 m!545775))

(assert (=> b!567212 m!545745))

(assert (=> b!567212 m!545745))

(declare-fun m!545777 () Bool)

(assert (=> b!567212 m!545777))

(declare-fun m!545779 () Bool)

(assert (=> b!567203 m!545779))

(push 1)

