; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52762 () Bool)

(assert start!52762)

(declare-fun lt!262755 () (_ BitVec 64))

(declare-datatypes ((array!35907 0))(
  ( (array!35908 (arr!17236 (Array (_ BitVec 32) (_ BitVec 64))) (size!17600 (_ BitVec 32))) )
))
(declare-fun lt!262751 () array!35907)

(declare-fun e!330956 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!575193 () Bool)

(declare-datatypes ((SeekEntryResult!5685 0))(
  ( (MissingZero!5685 (index!24967 (_ BitVec 32))) (Found!5685 (index!24968 (_ BitVec 32))) (Intermediate!5685 (undefined!6497 Bool) (index!24969 (_ BitVec 32)) (x!53862 (_ BitVec 32))) (Undefined!5685) (MissingVacant!5685 (index!24970 (_ BitVec 32))) )
))
(declare-fun lt!262749 () SeekEntryResult!5685)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35907 (_ BitVec 32)) SeekEntryResult!5685)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35907 (_ BitVec 32)) SeekEntryResult!5685)

(assert (=> b!575193 (= e!330956 (= (seekEntryOrOpen!0 lt!262755 lt!262751 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53862 lt!262749) (index!24969 lt!262749) (index!24969 lt!262749) lt!262755 lt!262751 mask!3119)))))

(declare-fun b!575194 () Bool)

(declare-fun res!363609 () Bool)

(declare-fun e!330958 () Bool)

(assert (=> b!575194 (=> (not res!363609) (not e!330958))))

(declare-fun a!3118 () array!35907)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575194 (= res!363609 (validKeyInArray!0 (select (arr!17236 a!3118) j!142)))))

(declare-fun b!575195 () Bool)

(declare-fun res!363619 () Bool)

(assert (=> b!575195 (=> (not res!363619) (not e!330958))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575195 (= res!363619 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575196 () Bool)

(declare-fun e!330957 () Bool)

(declare-fun e!330960 () Bool)

(assert (=> b!575196 (= e!330957 (not e!330960))))

(declare-fun res!363611 () Bool)

(assert (=> b!575196 (=> res!363611 e!330960)))

(get-info :version)

(assert (=> b!575196 (= res!363611 (or (undefined!6497 lt!262749) (not ((_ is Intermediate!5685) lt!262749))))))

(declare-fun lt!262756 () SeekEntryResult!5685)

(declare-fun lt!262758 () SeekEntryResult!5685)

(assert (=> b!575196 (= lt!262756 lt!262758)))

(assert (=> b!575196 (= lt!262758 (Found!5685 j!142))))

(assert (=> b!575196 (= lt!262756 (seekEntryOrOpen!0 (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35907 (_ BitVec 32)) Bool)

(assert (=> b!575196 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18072 0))(
  ( (Unit!18073) )
))
(declare-fun lt!262750 () Unit!18072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18072)

(assert (=> b!575196 (= lt!262750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575197 () Bool)

(declare-fun e!330955 () Bool)

(assert (=> b!575197 (= e!330960 e!330955)))

(declare-fun res!363618 () Bool)

(assert (=> b!575197 (=> res!363618 e!330955)))

(declare-fun lt!262757 () (_ BitVec 64))

(assert (=> b!575197 (= res!363618 (or (= lt!262757 (select (arr!17236 a!3118) j!142)) (= lt!262757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575197 (= lt!262757 (select (arr!17236 a!3118) (index!24969 lt!262749)))))

(declare-fun b!575198 () Bool)

(declare-fun res!363620 () Bool)

(declare-fun e!330954 () Bool)

(assert (=> b!575198 (=> (not res!363620) (not e!330954))))

(assert (=> b!575198 (= res!363620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575200 () Bool)

(declare-fun res!363616 () Bool)

(assert (=> b!575200 (=> (not res!363616) (not e!330954))))

(declare-datatypes ((List!11316 0))(
  ( (Nil!11313) (Cons!11312 (h!12351 (_ BitVec 64)) (t!17544 List!11316)) )
))
(declare-fun arrayNoDuplicates!0 (array!35907 (_ BitVec 32) List!11316) Bool)

(assert (=> b!575200 (= res!363616 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11313))))

(declare-fun b!575201 () Bool)

(declare-fun lt!262759 () SeekEntryResult!5685)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575201 (= e!330955 (or (bvslt (index!24969 lt!262749) #b00000000000000000000000000000000) (bvsge (index!24969 lt!262749) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53862 lt!262749) #b01111111111111111111111111111110) (bvslt (x!53862 lt!262749) #b00000000000000000000000000000000) (not (= lt!262757 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17236 a!3118) i!1132 k0!1914) (index!24969 lt!262749)) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!262759 lt!262758)))))

(assert (=> b!575201 e!330956))

(declare-fun res!363613 () Bool)

(assert (=> b!575201 (=> (not res!363613) (not e!330956))))

(assert (=> b!575201 (= res!363613 (= lt!262756 lt!262759))))

(assert (=> b!575201 (= lt!262759 (seekKeyOrZeroReturnVacant!0 (x!53862 lt!262749) (index!24969 lt!262749) (index!24969 lt!262749) (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575202 () Bool)

(assert (=> b!575202 (= e!330958 e!330954)))

(declare-fun res!363610 () Bool)

(assert (=> b!575202 (=> (not res!363610) (not e!330954))))

(declare-fun lt!262754 () SeekEntryResult!5685)

(assert (=> b!575202 (= res!363610 (or (= lt!262754 (MissingZero!5685 i!1132)) (= lt!262754 (MissingVacant!5685 i!1132))))))

(assert (=> b!575202 (= lt!262754 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575203 () Bool)

(assert (=> b!575203 (= e!330954 e!330957)))

(declare-fun res!363614 () Bool)

(assert (=> b!575203 (=> (not res!363614) (not e!330957))))

(declare-fun lt!262753 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35907 (_ BitVec 32)) SeekEntryResult!5685)

(assert (=> b!575203 (= res!363614 (= lt!262749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262753 lt!262755 lt!262751 mask!3119)))))

(declare-fun lt!262752 () (_ BitVec 32))

(assert (=> b!575203 (= lt!262749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262752 (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575203 (= lt!262753 (toIndex!0 lt!262755 mask!3119))))

(assert (=> b!575203 (= lt!262755 (select (store (arr!17236 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575203 (= lt!262752 (toIndex!0 (select (arr!17236 a!3118) j!142) mask!3119))))

(assert (=> b!575203 (= lt!262751 (array!35908 (store (arr!17236 a!3118) i!1132 k0!1914) (size!17600 a!3118)))))

(declare-fun b!575204 () Bool)

(declare-fun res!363615 () Bool)

(assert (=> b!575204 (=> (not res!363615) (not e!330958))))

(assert (=> b!575204 (= res!363615 (and (= (size!17600 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17600 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17600 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!363612 () Bool)

(assert (=> start!52762 (=> (not res!363612) (not e!330958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52762 (= res!363612 (validMask!0 mask!3119))))

(assert (=> start!52762 e!330958))

(assert (=> start!52762 true))

(declare-fun array_inv!13032 (array!35907) Bool)

(assert (=> start!52762 (array_inv!13032 a!3118)))

(declare-fun b!575199 () Bool)

(declare-fun res!363617 () Bool)

(assert (=> b!575199 (=> (not res!363617) (not e!330958))))

(assert (=> b!575199 (= res!363617 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52762 res!363612) b!575204))

(assert (= (and b!575204 res!363615) b!575194))

(assert (= (and b!575194 res!363609) b!575199))

(assert (= (and b!575199 res!363617) b!575195))

(assert (= (and b!575195 res!363619) b!575202))

(assert (= (and b!575202 res!363610) b!575198))

(assert (= (and b!575198 res!363620) b!575200))

(assert (= (and b!575200 res!363616) b!575203))

(assert (= (and b!575203 res!363614) b!575196))

(assert (= (and b!575196 (not res!363611)) b!575197))

(assert (= (and b!575197 (not res!363618)) b!575201))

(assert (= (and b!575201 res!363613) b!575193))

(declare-fun m!553969 () Bool)

(assert (=> b!575198 m!553969))

(declare-fun m!553971 () Bool)

(assert (=> b!575193 m!553971))

(declare-fun m!553973 () Bool)

(assert (=> b!575193 m!553973))

(declare-fun m!553975 () Bool)

(assert (=> start!52762 m!553975))

(declare-fun m!553977 () Bool)

(assert (=> start!52762 m!553977))

(declare-fun m!553979 () Bool)

(assert (=> b!575202 m!553979))

(declare-fun m!553981 () Bool)

(assert (=> b!575201 m!553981))

(declare-fun m!553983 () Bool)

(assert (=> b!575201 m!553983))

(declare-fun m!553985 () Bool)

(assert (=> b!575201 m!553985))

(assert (=> b!575201 m!553985))

(declare-fun m!553987 () Bool)

(assert (=> b!575201 m!553987))

(declare-fun m!553989 () Bool)

(assert (=> b!575195 m!553989))

(assert (=> b!575197 m!553985))

(declare-fun m!553991 () Bool)

(assert (=> b!575197 m!553991))

(declare-fun m!553993 () Bool)

(assert (=> b!575200 m!553993))

(declare-fun m!553995 () Bool)

(assert (=> b!575203 m!553995))

(declare-fun m!553997 () Bool)

(assert (=> b!575203 m!553997))

(assert (=> b!575203 m!553985))

(declare-fun m!553999 () Bool)

(assert (=> b!575203 m!553999))

(assert (=> b!575203 m!553985))

(declare-fun m!554001 () Bool)

(assert (=> b!575203 m!554001))

(assert (=> b!575203 m!553985))

(declare-fun m!554003 () Bool)

(assert (=> b!575203 m!554003))

(assert (=> b!575203 m!553981))

(declare-fun m!554005 () Bool)

(assert (=> b!575199 m!554005))

(assert (=> b!575194 m!553985))

(assert (=> b!575194 m!553985))

(declare-fun m!554007 () Bool)

(assert (=> b!575194 m!554007))

(assert (=> b!575196 m!553985))

(assert (=> b!575196 m!553985))

(declare-fun m!554009 () Bool)

(assert (=> b!575196 m!554009))

(declare-fun m!554011 () Bool)

(assert (=> b!575196 m!554011))

(declare-fun m!554013 () Bool)

(assert (=> b!575196 m!554013))

(check-sat (not b!575196) (not b!575193) (not b!575195) (not b!575203) (not start!52762) (not b!575198) (not b!575199) (not b!575201) (not b!575200) (not b!575194) (not b!575202))
(check-sat)
