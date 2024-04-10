; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51752 () Bool)

(assert start!51752)

(declare-fun b!566273 () Bool)

(declare-fun res!357245 () Bool)

(declare-fun e!325894 () Bool)

(assert (=> b!566273 (=> (not res!357245) (not e!325894))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35560 0))(
  ( (array!35561 (arr!17079 (Array (_ BitVec 32) (_ BitVec 64))) (size!17443 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35560)

(declare-datatypes ((SeekEntryResult!5528 0))(
  ( (MissingZero!5528 (index!24339 (_ BitVec 32))) (Found!5528 (index!24340 (_ BitVec 32))) (Intermediate!5528 (undefined!6340 Bool) (index!24341 (_ BitVec 32)) (x!53205 (_ BitVec 32))) (Undefined!5528) (MissingVacant!5528 (index!24342 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35560 (_ BitVec 32)) SeekEntryResult!5528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566273 (= res!357245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17079 a!3118) j!142) mask!3119) (select (arr!17079 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17079 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17079 a!3118) i!1132 k!1914) j!142) (array!35561 (store (arr!17079 a!3118) i!1132 k!1914) (size!17443 a!3118)) mask!3119)))))

(declare-fun e!325896 () Bool)

(declare-fun b!566274 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35560 (_ BitVec 32)) SeekEntryResult!5528)

(assert (=> b!566274 (= e!325896 (= (seekEntryOrOpen!0 (select (arr!17079 a!3118) j!142) a!3118 mask!3119) (Found!5528 j!142)))))

(declare-fun b!566275 () Bool)

(declare-fun res!357251 () Bool)

(declare-fun e!325895 () Bool)

(assert (=> b!566275 (=> (not res!357251) (not e!325895))))

(assert (=> b!566275 (= res!357251 (and (= (size!17443 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17443 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17443 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566276 () Bool)

(declare-fun res!357247 () Bool)

(assert (=> b!566276 (=> (not res!357247) (not e!325895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566276 (= res!357247 (validKeyInArray!0 (select (arr!17079 a!3118) j!142)))))

(declare-fun b!566277 () Bool)

(assert (=> b!566277 (= e!325894 (not true))))

(assert (=> b!566277 e!325896))

(declare-fun res!357250 () Bool)

(assert (=> b!566277 (=> (not res!357250) (not e!325896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35560 (_ BitVec 32)) Bool)

(assert (=> b!566277 (= res!357250 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17758 0))(
  ( (Unit!17759) )
))
(declare-fun lt!258054 () Unit!17758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17758)

(assert (=> b!566277 (= lt!258054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566278 () Bool)

(declare-fun res!357248 () Bool)

(assert (=> b!566278 (=> (not res!357248) (not e!325895))))

(declare-fun arrayContainsKey!0 (array!35560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566278 (= res!357248 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357243 () Bool)

(assert (=> start!51752 (=> (not res!357243) (not e!325895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51752 (= res!357243 (validMask!0 mask!3119))))

(assert (=> start!51752 e!325895))

(assert (=> start!51752 true))

(declare-fun array_inv!12875 (array!35560) Bool)

(assert (=> start!51752 (array_inv!12875 a!3118)))

(declare-fun b!566279 () Bool)

(declare-fun res!357249 () Bool)

(assert (=> b!566279 (=> (not res!357249) (not e!325895))))

(assert (=> b!566279 (= res!357249 (validKeyInArray!0 k!1914))))

(declare-fun b!566280 () Bool)

(assert (=> b!566280 (= e!325895 e!325894)))

(declare-fun res!357244 () Bool)

(assert (=> b!566280 (=> (not res!357244) (not e!325894))))

(declare-fun lt!258055 () SeekEntryResult!5528)

(assert (=> b!566280 (= res!357244 (or (= lt!258055 (MissingZero!5528 i!1132)) (= lt!258055 (MissingVacant!5528 i!1132))))))

(assert (=> b!566280 (= lt!258055 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566281 () Bool)

(declare-fun res!357246 () Bool)

(assert (=> b!566281 (=> (not res!357246) (not e!325894))))

(assert (=> b!566281 (= res!357246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566282 () Bool)

(declare-fun res!357242 () Bool)

(assert (=> b!566282 (=> (not res!357242) (not e!325894))))

(declare-datatypes ((List!11159 0))(
  ( (Nil!11156) (Cons!11155 (h!12161 (_ BitVec 64)) (t!17387 List!11159)) )
))
(declare-fun arrayNoDuplicates!0 (array!35560 (_ BitVec 32) List!11159) Bool)

(assert (=> b!566282 (= res!357242 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11156))))

(assert (= (and start!51752 res!357243) b!566275))

(assert (= (and b!566275 res!357251) b!566276))

(assert (= (and b!566276 res!357247) b!566279))

(assert (= (and b!566279 res!357249) b!566278))

(assert (= (and b!566278 res!357248) b!566280))

(assert (= (and b!566280 res!357244) b!566281))

(assert (= (and b!566281 res!357246) b!566282))

(assert (= (and b!566282 res!357242) b!566273))

(assert (= (and b!566273 res!357245) b!566277))

(assert (= (and b!566277 res!357250) b!566274))

(declare-fun m!544899 () Bool)

(assert (=> b!566274 m!544899))

(assert (=> b!566274 m!544899))

(declare-fun m!544901 () Bool)

(assert (=> b!566274 m!544901))

(declare-fun m!544903 () Bool)

(assert (=> b!566282 m!544903))

(assert (=> b!566273 m!544899))

(declare-fun m!544905 () Bool)

(assert (=> b!566273 m!544905))

(assert (=> b!566273 m!544899))

(declare-fun m!544907 () Bool)

(assert (=> b!566273 m!544907))

(declare-fun m!544909 () Bool)

(assert (=> b!566273 m!544909))

(assert (=> b!566273 m!544907))

(declare-fun m!544911 () Bool)

(assert (=> b!566273 m!544911))

(assert (=> b!566273 m!544905))

(assert (=> b!566273 m!544899))

(declare-fun m!544913 () Bool)

(assert (=> b!566273 m!544913))

(declare-fun m!544915 () Bool)

(assert (=> b!566273 m!544915))

(assert (=> b!566273 m!544907))

(assert (=> b!566273 m!544909))

(assert (=> b!566276 m!544899))

(assert (=> b!566276 m!544899))

(declare-fun m!544917 () Bool)

(assert (=> b!566276 m!544917))

(declare-fun m!544919 () Bool)

(assert (=> b!566280 m!544919))

(declare-fun m!544921 () Bool)

(assert (=> b!566279 m!544921))

(declare-fun m!544923 () Bool)

(assert (=> b!566277 m!544923))

(declare-fun m!544925 () Bool)

(assert (=> b!566277 m!544925))

(declare-fun m!544927 () Bool)

(assert (=> b!566278 m!544927))

(declare-fun m!544929 () Bool)

(assert (=> start!51752 m!544929))

(declare-fun m!544931 () Bool)

(assert (=> start!51752 m!544931))

(declare-fun m!544933 () Bool)

(assert (=> b!566281 m!544933))

(push 1)

