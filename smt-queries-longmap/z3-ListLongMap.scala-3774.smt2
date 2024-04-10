; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51700 () Bool)

(assert start!51700)

(declare-fun b!565493 () Bool)

(declare-fun res!356463 () Bool)

(declare-fun e!325582 () Bool)

(assert (=> b!565493 (=> (not res!356463) (not e!325582))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35508 0))(
  ( (array!35509 (arr!17053 (Array (_ BitVec 32) (_ BitVec 64))) (size!17417 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35508)

(declare-datatypes ((SeekEntryResult!5502 0))(
  ( (MissingZero!5502 (index!24235 (_ BitVec 32))) (Found!5502 (index!24236 (_ BitVec 32))) (Intermediate!5502 (undefined!6314 Bool) (index!24237 (_ BitVec 32)) (x!53107 (_ BitVec 32))) (Undefined!5502) (MissingVacant!5502 (index!24238 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35508 (_ BitVec 32)) SeekEntryResult!5502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565493 (= res!356463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17053 a!3118) j!142) mask!3119) (select (arr!17053 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17053 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17053 a!3118) i!1132 k0!1914) j!142) (array!35509 (store (arr!17053 a!3118) i!1132 k0!1914) (size!17417 a!3118)) mask!3119)))))

(declare-fun b!565494 () Bool)

(declare-fun res!356470 () Bool)

(declare-fun e!325584 () Bool)

(assert (=> b!565494 (=> (not res!356470) (not e!325584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565494 (= res!356470 (validKeyInArray!0 k0!1914))))

(declare-fun b!565495 () Bool)

(declare-fun res!356469 () Bool)

(assert (=> b!565495 (=> (not res!356469) (not e!325582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35508 (_ BitVec 32)) Bool)

(assert (=> b!565495 (= res!356469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565496 () Bool)

(declare-fun res!356466 () Bool)

(assert (=> b!565496 (=> (not res!356466) (not e!325582))))

(declare-datatypes ((List!11133 0))(
  ( (Nil!11130) (Cons!11129 (h!12135 (_ BitVec 64)) (t!17361 List!11133)) )
))
(declare-fun arrayNoDuplicates!0 (array!35508 (_ BitVec 32) List!11133) Bool)

(assert (=> b!565496 (= res!356466 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11130))))

(declare-fun b!565497 () Bool)

(declare-fun e!325581 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35508 (_ BitVec 32)) SeekEntryResult!5502)

(assert (=> b!565497 (= e!325581 (= (seekEntryOrOpen!0 (select (arr!17053 a!3118) j!142) a!3118 mask!3119) (Found!5502 j!142)))))

(declare-fun b!565498 () Bool)

(assert (=> b!565498 (= e!325584 e!325582)))

(declare-fun res!356471 () Bool)

(assert (=> b!565498 (=> (not res!356471) (not e!325582))))

(declare-fun lt!257898 () SeekEntryResult!5502)

(assert (=> b!565498 (= res!356471 (or (= lt!257898 (MissingZero!5502 i!1132)) (= lt!257898 (MissingVacant!5502 i!1132))))))

(assert (=> b!565498 (= lt!257898 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565499 () Bool)

(declare-fun res!356468 () Bool)

(assert (=> b!565499 (=> (not res!356468) (not e!325584))))

(assert (=> b!565499 (= res!356468 (and (= (size!17417 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17417 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17417 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565500 () Bool)

(declare-fun res!356462 () Bool)

(assert (=> b!565500 (=> (not res!356462) (not e!325584))))

(assert (=> b!565500 (= res!356462 (validKeyInArray!0 (select (arr!17053 a!3118) j!142)))))

(declare-fun res!356467 () Bool)

(assert (=> start!51700 (=> (not res!356467) (not e!325584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51700 (= res!356467 (validMask!0 mask!3119))))

(assert (=> start!51700 e!325584))

(assert (=> start!51700 true))

(declare-fun array_inv!12849 (array!35508) Bool)

(assert (=> start!51700 (array_inv!12849 a!3118)))

(declare-fun b!565501 () Bool)

(declare-fun res!356464 () Bool)

(assert (=> b!565501 (=> (not res!356464) (not e!325584))))

(declare-fun arrayContainsKey!0 (array!35508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565501 (= res!356464 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565502 () Bool)

(assert (=> b!565502 (= e!325582 (not true))))

(assert (=> b!565502 e!325581))

(declare-fun res!356465 () Bool)

(assert (=> b!565502 (=> (not res!356465) (not e!325581))))

(assert (=> b!565502 (= res!356465 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17706 0))(
  ( (Unit!17707) )
))
(declare-fun lt!257899 () Unit!17706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17706)

(assert (=> b!565502 (= lt!257899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51700 res!356467) b!565499))

(assert (= (and b!565499 res!356468) b!565500))

(assert (= (and b!565500 res!356462) b!565494))

(assert (= (and b!565494 res!356470) b!565501))

(assert (= (and b!565501 res!356464) b!565498))

(assert (= (and b!565498 res!356471) b!565495))

(assert (= (and b!565495 res!356469) b!565496))

(assert (= (and b!565496 res!356466) b!565493))

(assert (= (and b!565493 res!356463) b!565502))

(assert (= (and b!565502 res!356465) b!565497))

(declare-fun m!543963 () Bool)

(assert (=> b!565493 m!543963))

(declare-fun m!543965 () Bool)

(assert (=> b!565493 m!543965))

(assert (=> b!565493 m!543963))

(declare-fun m!543967 () Bool)

(assert (=> b!565493 m!543967))

(declare-fun m!543969 () Bool)

(assert (=> b!565493 m!543969))

(assert (=> b!565493 m!543967))

(declare-fun m!543971 () Bool)

(assert (=> b!565493 m!543971))

(assert (=> b!565493 m!543965))

(assert (=> b!565493 m!543963))

(declare-fun m!543973 () Bool)

(assert (=> b!565493 m!543973))

(declare-fun m!543975 () Bool)

(assert (=> b!565493 m!543975))

(assert (=> b!565493 m!543967))

(assert (=> b!565493 m!543969))

(declare-fun m!543977 () Bool)

(assert (=> b!565494 m!543977))

(assert (=> b!565497 m!543963))

(assert (=> b!565497 m!543963))

(declare-fun m!543979 () Bool)

(assert (=> b!565497 m!543979))

(assert (=> b!565500 m!543963))

(assert (=> b!565500 m!543963))

(declare-fun m!543981 () Bool)

(assert (=> b!565500 m!543981))

(declare-fun m!543983 () Bool)

(assert (=> b!565501 m!543983))

(declare-fun m!543985 () Bool)

(assert (=> b!565502 m!543985))

(declare-fun m!543987 () Bool)

(assert (=> b!565502 m!543987))

(declare-fun m!543989 () Bool)

(assert (=> b!565496 m!543989))

(declare-fun m!543991 () Bool)

(assert (=> start!51700 m!543991))

(declare-fun m!543993 () Bool)

(assert (=> start!51700 m!543993))

(declare-fun m!543995 () Bool)

(assert (=> b!565495 m!543995))

(declare-fun m!543997 () Bool)

(assert (=> b!565498 m!543997))

(check-sat (not b!565501) (not b!565494) (not b!565500) (not b!565502) (not b!565493) (not b!565497) (not b!565495) (not b!565498) (not b!565496) (not start!51700))
(check-sat)
