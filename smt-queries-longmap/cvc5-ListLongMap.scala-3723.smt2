; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51332 () Bool)

(assert start!51332)

(declare-fun b!560165 () Bool)

(declare-fun res!351322 () Bool)

(declare-fun e!322736 () Bool)

(assert (=> b!560165 (=> (not res!351322) (not e!322736))))

(declare-datatypes ((array!35197 0))(
  ( (array!35198 (arr!16899 (Array (_ BitVec 32) (_ BitVec 64))) (size!17263 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35197)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35197 (_ BitVec 32)) Bool)

(assert (=> b!560165 (= res!351322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560166 () Bool)

(declare-fun res!351327 () Bool)

(declare-fun e!322743 () Bool)

(assert (=> b!560166 (=> (not res!351327) (not e!322743))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560166 (= res!351327 (validKeyInArray!0 k!1914))))

(declare-fun b!560167 () Bool)

(declare-fun res!351320 () Bool)

(assert (=> b!560167 (=> (not res!351320) (not e!322743))))

(declare-fun arrayContainsKey!0 (array!35197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560167 (= res!351320 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560169 () Bool)

(declare-fun e!322740 () Bool)

(assert (=> b!560169 (= e!322736 e!322740)))

(declare-fun res!351325 () Bool)

(assert (=> b!560169 (=> (not res!351325) (not e!322740))))

(declare-fun lt!254634 () array!35197)

(declare-fun lt!254632 () (_ BitVec 32))

(declare-fun lt!254630 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5348 0))(
  ( (MissingZero!5348 (index!23619 (_ BitVec 32))) (Found!5348 (index!23620 (_ BitVec 32))) (Intermediate!5348 (undefined!6160 Bool) (index!23621 (_ BitVec 32)) (x!52539 (_ BitVec 32))) (Undefined!5348) (MissingVacant!5348 (index!23622 (_ BitVec 32))) )
))
(declare-fun lt!254628 () SeekEntryResult!5348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35197 (_ BitVec 32)) SeekEntryResult!5348)

(assert (=> b!560169 (= res!351325 (= lt!254628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254632 lt!254630 lt!254634 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254629 () (_ BitVec 32))

(assert (=> b!560169 (= lt!254628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254629 (select (arr!16899 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560169 (= lt!254632 (toIndex!0 lt!254630 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560169 (= lt!254630 (select (store (arr!16899 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560169 (= lt!254629 (toIndex!0 (select (arr!16899 a!3118) j!142) mask!3119))))

(assert (=> b!560169 (= lt!254634 (array!35198 (store (arr!16899 a!3118) i!1132 k!1914) (size!17263 a!3118)))))

(declare-fun b!560170 () Bool)

(declare-fun res!351319 () Bool)

(assert (=> b!560170 (=> (not res!351319) (not e!322743))))

(assert (=> b!560170 (= res!351319 (validKeyInArray!0 (select (arr!16899 a!3118) j!142)))))

(declare-fun b!560171 () Bool)

(declare-fun e!322742 () Bool)

(declare-fun e!322739 () Bool)

(assert (=> b!560171 (= e!322742 e!322739)))

(declare-fun res!351317 () Bool)

(assert (=> b!560171 (=> (not res!351317) (not e!322739))))

(declare-fun lt!254627 () SeekEntryResult!5348)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35197 (_ BitVec 32)) SeekEntryResult!5348)

(assert (=> b!560171 (= res!351317 (= lt!254627 (seekKeyOrZeroReturnVacant!0 (x!52539 lt!254628) (index!23621 lt!254628) (index!23621 lt!254628) (select (arr!16899 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560168 () Bool)

(declare-fun e!322738 () Bool)

(declare-fun e!322741 () Bool)

(assert (=> b!560168 (= e!322738 e!322741)))

(declare-fun res!351329 () Bool)

(assert (=> b!560168 (=> res!351329 e!322741)))

(assert (=> b!560168 (= res!351329 (or (undefined!6160 lt!254628) (not (is-Intermediate!5348 lt!254628))))))

(declare-fun res!351318 () Bool)

(assert (=> start!51332 (=> (not res!351318) (not e!322743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51332 (= res!351318 (validMask!0 mask!3119))))

(assert (=> start!51332 e!322743))

(assert (=> start!51332 true))

(declare-fun array_inv!12695 (array!35197) Bool)

(assert (=> start!51332 (array_inv!12695 a!3118)))

(declare-fun b!560172 () Bool)

(declare-fun res!351326 () Bool)

(assert (=> b!560172 (=> (not res!351326) (not e!322743))))

(assert (=> b!560172 (= res!351326 (and (= (size!17263 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17263 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17263 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560173 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35197 (_ BitVec 32)) SeekEntryResult!5348)

(assert (=> b!560173 (= e!322739 (= (seekEntryOrOpen!0 lt!254630 lt!254634 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52539 lt!254628) (index!23621 lt!254628) (index!23621 lt!254628) lt!254630 lt!254634 mask!3119)))))

(declare-fun b!560174 () Bool)

(assert (=> b!560174 (= e!322743 e!322736)))

(declare-fun res!351323 () Bool)

(assert (=> b!560174 (=> (not res!351323) (not e!322736))))

(declare-fun lt!254633 () SeekEntryResult!5348)

(assert (=> b!560174 (= res!351323 (or (= lt!254633 (MissingZero!5348 i!1132)) (= lt!254633 (MissingVacant!5348 i!1132))))))

(assert (=> b!560174 (= lt!254633 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560175 () Bool)

(assert (=> b!560175 (= e!322741 e!322742)))

(declare-fun res!351324 () Bool)

(assert (=> b!560175 (=> res!351324 e!322742)))

(declare-fun lt!254635 () (_ BitVec 64))

(assert (=> b!560175 (= res!351324 (or (= lt!254635 (select (arr!16899 a!3118) j!142)) (= lt!254635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560175 (= lt!254635 (select (arr!16899 a!3118) (index!23621 lt!254628)))))

(declare-fun b!560176 () Bool)

(declare-fun res!351321 () Bool)

(assert (=> b!560176 (=> (not res!351321) (not e!322736))))

(declare-datatypes ((List!10979 0))(
  ( (Nil!10976) (Cons!10975 (h!11978 (_ BitVec 64)) (t!17207 List!10979)) )
))
(declare-fun arrayNoDuplicates!0 (array!35197 (_ BitVec 32) List!10979) Bool)

(assert (=> b!560176 (= res!351321 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10976))))

(declare-fun b!560177 () Bool)

(assert (=> b!560177 (= e!322740 (not true))))

(assert (=> b!560177 e!322738))

(declare-fun res!351328 () Bool)

(assert (=> b!560177 (=> (not res!351328) (not e!322738))))

(assert (=> b!560177 (= res!351328 (= lt!254627 (Found!5348 j!142)))))

(assert (=> b!560177 (= lt!254627 (seekEntryOrOpen!0 (select (arr!16899 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560177 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17470 0))(
  ( (Unit!17471) )
))
(declare-fun lt!254631 () Unit!17470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17470)

(assert (=> b!560177 (= lt!254631 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51332 res!351318) b!560172))

(assert (= (and b!560172 res!351326) b!560170))

(assert (= (and b!560170 res!351319) b!560166))

(assert (= (and b!560166 res!351327) b!560167))

(assert (= (and b!560167 res!351320) b!560174))

(assert (= (and b!560174 res!351323) b!560165))

(assert (= (and b!560165 res!351322) b!560176))

(assert (= (and b!560176 res!351321) b!560169))

(assert (= (and b!560169 res!351325) b!560177))

(assert (= (and b!560177 res!351328) b!560168))

(assert (= (and b!560168 (not res!351329)) b!560175))

(assert (= (and b!560175 (not res!351324)) b!560171))

(assert (= (and b!560171 res!351317) b!560173))

(declare-fun m!537897 () Bool)

(assert (=> start!51332 m!537897))

(declare-fun m!537899 () Bool)

(assert (=> start!51332 m!537899))

(declare-fun m!537901 () Bool)

(assert (=> b!560169 m!537901))

(declare-fun m!537903 () Bool)

(assert (=> b!560169 m!537903))

(declare-fun m!537905 () Bool)

(assert (=> b!560169 m!537905))

(assert (=> b!560169 m!537903))

(declare-fun m!537907 () Bool)

(assert (=> b!560169 m!537907))

(assert (=> b!560169 m!537903))

(declare-fun m!537909 () Bool)

(assert (=> b!560169 m!537909))

(declare-fun m!537911 () Bool)

(assert (=> b!560169 m!537911))

(declare-fun m!537913 () Bool)

(assert (=> b!560169 m!537913))

(assert (=> b!560171 m!537903))

(assert (=> b!560171 m!537903))

(declare-fun m!537915 () Bool)

(assert (=> b!560171 m!537915))

(declare-fun m!537917 () Bool)

(assert (=> b!560173 m!537917))

(declare-fun m!537919 () Bool)

(assert (=> b!560173 m!537919))

(declare-fun m!537921 () Bool)

(assert (=> b!560174 m!537921))

(declare-fun m!537923 () Bool)

(assert (=> b!560167 m!537923))

(declare-fun m!537925 () Bool)

(assert (=> b!560165 m!537925))

(assert (=> b!560177 m!537903))

(assert (=> b!560177 m!537903))

(declare-fun m!537927 () Bool)

(assert (=> b!560177 m!537927))

(declare-fun m!537929 () Bool)

(assert (=> b!560177 m!537929))

(declare-fun m!537931 () Bool)

(assert (=> b!560177 m!537931))

(assert (=> b!560175 m!537903))

(declare-fun m!537933 () Bool)

(assert (=> b!560175 m!537933))

(declare-fun m!537935 () Bool)

(assert (=> b!560176 m!537935))

(declare-fun m!537937 () Bool)

(assert (=> b!560166 m!537937))

(assert (=> b!560170 m!537903))

(assert (=> b!560170 m!537903))

(declare-fun m!537939 () Bool)

(assert (=> b!560170 m!537939))

(push 1)

