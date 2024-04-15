; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52766 () Bool)

(assert start!52766)

(declare-fun b!575210 () Bool)

(declare-fun res!363775 () Bool)

(declare-fun e!330948 () Bool)

(assert (=> b!575210 (=> (not res!363775) (not e!330948))))

(declare-datatypes ((array!35920 0))(
  ( (array!35921 (arr!17243 (Array (_ BitVec 32) (_ BitVec 64))) (size!17608 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35920)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575210 (= res!363775 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575211 () Bool)

(declare-fun res!363773 () Bool)

(declare-fun e!330952 () Bool)

(assert (=> b!575211 (=> (not res!363773) (not e!330952))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35920 (_ BitVec 32)) Bool)

(assert (=> b!575211 (= res!363773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575212 () Bool)

(declare-fun res!363776 () Bool)

(assert (=> b!575212 (=> (not res!363776) (not e!330948))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575212 (= res!363776 (and (= (size!17608 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17608 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17608 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575213 () Bool)

(declare-fun e!330949 () Bool)

(declare-fun e!330954 () Bool)

(assert (=> b!575213 (= e!330949 e!330954)))

(declare-fun res!363772 () Bool)

(assert (=> b!575213 (=> res!363772 e!330954)))

(declare-fun lt!262851 () (_ BitVec 64))

(assert (=> b!575213 (= res!363772 (or (= lt!262851 (select (arr!17243 a!3118) j!142)) (= lt!262851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5689 0))(
  ( (MissingZero!5689 (index!24983 (_ BitVec 32))) (Found!5689 (index!24984 (_ BitVec 32))) (Intermediate!5689 (undefined!6501 Bool) (index!24985 (_ BitVec 32)) (x!53885 (_ BitVec 32))) (Undefined!5689) (MissingVacant!5689 (index!24986 (_ BitVec 32))) )
))
(declare-fun lt!262849 () SeekEntryResult!5689)

(assert (=> b!575213 (= lt!262851 (select (arr!17243 a!3118) (index!24985 lt!262849)))))

(declare-fun b!575214 () Bool)

(declare-fun res!363774 () Bool)

(assert (=> b!575214 (=> (not res!363774) (not e!330948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575214 (= res!363774 (validKeyInArray!0 k0!1914))))

(declare-fun b!575215 () Bool)

(declare-fun res!363777 () Bool)

(assert (=> b!575215 (=> (not res!363777) (not e!330952))))

(declare-datatypes ((List!11362 0))(
  ( (Nil!11359) (Cons!11358 (h!12397 (_ BitVec 64)) (t!17581 List!11362)) )
))
(declare-fun arrayNoDuplicates!0 (array!35920 (_ BitVec 32) List!11362) Bool)

(assert (=> b!575215 (= res!363777 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11359))))

(declare-fun b!575216 () Bool)

(declare-fun e!330950 () Bool)

(assert (=> b!575216 (= e!330954 e!330950)))

(declare-fun res!363769 () Bool)

(assert (=> b!575216 (=> res!363769 e!330950)))

(declare-fun lt!262848 () SeekEntryResult!5689)

(declare-fun lt!262841 () SeekEntryResult!5689)

(assert (=> b!575216 (= res!363769 (or (bvslt (index!24985 lt!262849) #b00000000000000000000000000000000) (bvsge (index!24985 lt!262849) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53885 lt!262849) #b01111111111111111111111111111110) (bvslt (x!53885 lt!262849) #b00000000000000000000000000000000) (not (= lt!262851 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17243 a!3118) i!1132 k0!1914) (index!24985 lt!262849)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262848 lt!262841))))))

(declare-fun lt!262844 () SeekEntryResult!5689)

(declare-fun lt!262847 () SeekEntryResult!5689)

(assert (=> b!575216 (= lt!262844 lt!262847)))

(declare-fun lt!262846 () array!35920)

(declare-fun lt!262839 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35920 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575216 (= lt!262847 (seekKeyOrZeroReturnVacant!0 (x!53885 lt!262849) (index!24985 lt!262849) (index!24985 lt!262849) lt!262839 lt!262846 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35920 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575216 (= lt!262844 (seekEntryOrOpen!0 lt!262839 lt!262846 mask!3119))))

(declare-fun lt!262840 () SeekEntryResult!5689)

(assert (=> b!575216 (= lt!262840 lt!262848)))

(assert (=> b!575216 (= lt!262848 (seekKeyOrZeroReturnVacant!0 (x!53885 lt!262849) (index!24985 lt!262849) (index!24985 lt!262849) (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363771 () Bool)

(assert (=> start!52766 (=> (not res!363771) (not e!330948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52766 (= res!363771 (validMask!0 mask!3119))))

(assert (=> start!52766 e!330948))

(assert (=> start!52766 true))

(declare-fun array_inv!13126 (array!35920) Bool)

(assert (=> start!52766 (array_inv!13126 a!3118)))

(declare-fun b!575217 () Bool)

(declare-fun e!330951 () Bool)

(assert (=> b!575217 (= e!330952 e!330951)))

(declare-fun res!363770 () Bool)

(assert (=> b!575217 (=> (not res!363770) (not e!330951))))

(declare-fun lt!262842 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35920 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575217 (= res!363770 (= lt!262849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262842 lt!262839 lt!262846 mask!3119)))))

(declare-fun lt!262845 () (_ BitVec 32))

(assert (=> b!575217 (= lt!262849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262845 (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575217 (= lt!262842 (toIndex!0 lt!262839 mask!3119))))

(assert (=> b!575217 (= lt!262839 (select (store (arr!17243 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575217 (= lt!262845 (toIndex!0 (select (arr!17243 a!3118) j!142) mask!3119))))

(assert (=> b!575217 (= lt!262846 (array!35921 (store (arr!17243 a!3118) i!1132 k0!1914) (size!17608 a!3118)))))

(declare-fun b!575218 () Bool)

(assert (=> b!575218 (= e!330951 (not e!330949))))

(declare-fun res!363779 () Bool)

(assert (=> b!575218 (=> res!363779 e!330949)))

(get-info :version)

(assert (=> b!575218 (= res!363779 (or (undefined!6501 lt!262849) (not ((_ is Intermediate!5689) lt!262849))))))

(assert (=> b!575218 (= lt!262840 lt!262841)))

(assert (=> b!575218 (= lt!262841 (Found!5689 j!142))))

(assert (=> b!575218 (= lt!262840 (seekEntryOrOpen!0 (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575218 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18066 0))(
  ( (Unit!18067) )
))
(declare-fun lt!262850 () Unit!18066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18066)

(assert (=> b!575218 (= lt!262850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575219 () Bool)

(assert (=> b!575219 (= e!330948 e!330952)))

(declare-fun res!363768 () Bool)

(assert (=> b!575219 (=> (not res!363768) (not e!330952))))

(declare-fun lt!262843 () SeekEntryResult!5689)

(assert (=> b!575219 (= res!363768 (or (= lt!262843 (MissingZero!5689 i!1132)) (= lt!262843 (MissingVacant!5689 i!1132))))))

(assert (=> b!575219 (= lt!262843 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575220 () Bool)

(declare-fun res!363778 () Bool)

(assert (=> b!575220 (=> (not res!363778) (not e!330948))))

(assert (=> b!575220 (= res!363778 (validKeyInArray!0 (select (arr!17243 a!3118) j!142)))))

(declare-fun b!575221 () Bool)

(assert (=> b!575221 (= e!330950 true)))

(assert (=> b!575221 (= lt!262848 lt!262847)))

(declare-fun lt!262852 () Unit!18066)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35920 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18066)

(assert (=> b!575221 (= lt!262852 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53885 lt!262849) (index!24985 lt!262849) (index!24985 lt!262849) mask!3119))))

(assert (= (and start!52766 res!363771) b!575212))

(assert (= (and b!575212 res!363776) b!575220))

(assert (= (and b!575220 res!363778) b!575214))

(assert (= (and b!575214 res!363774) b!575210))

(assert (= (and b!575210 res!363775) b!575219))

(assert (= (and b!575219 res!363768) b!575211))

(assert (= (and b!575211 res!363773) b!575215))

(assert (= (and b!575215 res!363777) b!575217))

(assert (= (and b!575217 res!363770) b!575218))

(assert (= (and b!575218 (not res!363779)) b!575213))

(assert (= (and b!575213 (not res!363772)) b!575216))

(assert (= (and b!575216 (not res!363769)) b!575221))

(declare-fun m!553577 () Bool)

(assert (=> b!575221 m!553577))

(declare-fun m!553579 () Bool)

(assert (=> start!52766 m!553579))

(declare-fun m!553581 () Bool)

(assert (=> start!52766 m!553581))

(declare-fun m!553583 () Bool)

(assert (=> b!575210 m!553583))

(declare-fun m!553585 () Bool)

(assert (=> b!575220 m!553585))

(assert (=> b!575220 m!553585))

(declare-fun m!553587 () Bool)

(assert (=> b!575220 m!553587))

(declare-fun m!553589 () Bool)

(assert (=> b!575217 m!553589))

(declare-fun m!553591 () Bool)

(assert (=> b!575217 m!553591))

(assert (=> b!575217 m!553585))

(declare-fun m!553593 () Bool)

(assert (=> b!575217 m!553593))

(declare-fun m!553595 () Bool)

(assert (=> b!575217 m!553595))

(assert (=> b!575217 m!553585))

(declare-fun m!553597 () Bool)

(assert (=> b!575217 m!553597))

(declare-fun m!553599 () Bool)

(assert (=> b!575217 m!553599))

(assert (=> b!575217 m!553585))

(assert (=> b!575218 m!553585))

(assert (=> b!575218 m!553585))

(declare-fun m!553601 () Bool)

(assert (=> b!575218 m!553601))

(declare-fun m!553603 () Bool)

(assert (=> b!575218 m!553603))

(declare-fun m!553605 () Bool)

(assert (=> b!575218 m!553605))

(declare-fun m!553607 () Bool)

(assert (=> b!575219 m!553607))

(declare-fun m!553609 () Bool)

(assert (=> b!575216 m!553609))

(declare-fun m!553611 () Bool)

(assert (=> b!575216 m!553611))

(assert (=> b!575216 m!553585))

(assert (=> b!575216 m!553585))

(declare-fun m!553613 () Bool)

(assert (=> b!575216 m!553613))

(assert (=> b!575216 m!553591))

(declare-fun m!553615 () Bool)

(assert (=> b!575216 m!553615))

(declare-fun m!553617 () Bool)

(assert (=> b!575211 m!553617))

(assert (=> b!575213 m!553585))

(declare-fun m!553619 () Bool)

(assert (=> b!575213 m!553619))

(declare-fun m!553621 () Bool)

(assert (=> b!575214 m!553621))

(declare-fun m!553623 () Bool)

(assert (=> b!575215 m!553623))

(check-sat (not b!575216) (not start!52766) (not b!575217) (not b!575210) (not b!575215) (not b!575214) (not b!575219) (not b!575218) (not b!575211) (not b!575221) (not b!575220))
(check-sat)
