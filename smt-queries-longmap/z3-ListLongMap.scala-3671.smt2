; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50644 () Bool)

(assert start!50644)

(declare-fun b!553583 () Bool)

(declare-fun res!346001 () Bool)

(declare-fun e!319316 () Bool)

(assert (=> b!553583 (=> (not res!346001) (not e!319316))))

(declare-datatypes ((array!34869 0))(
  ( (array!34870 (arr!16744 (Array (_ BitVec 32) (_ BitVec 64))) (size!17108 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34869)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34869 (_ BitVec 32)) Bool)

(assert (=> b!553583 (= res!346001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553584 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319320 () Bool)

(declare-datatypes ((SeekEntryResult!5193 0))(
  ( (MissingZero!5193 (index!22999 (_ BitVec 32))) (Found!5193 (index!23000 (_ BitVec 32))) (Intermediate!5193 (undefined!6005 Bool) (index!23001 (_ BitVec 32)) (x!51923 (_ BitVec 32))) (Undefined!5193) (MissingVacant!5193 (index!23002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34869 (_ BitVec 32)) SeekEntryResult!5193)

(assert (=> b!553584 (= e!319320 (= (seekEntryOrOpen!0 (select (arr!16744 a!3118) j!142) a!3118 mask!3119) (Found!5193 j!142)))))

(declare-fun b!553585 () Bool)

(declare-fun res!345997 () Bool)

(declare-fun e!319317 () Bool)

(assert (=> b!553585 (=> (not res!345997) (not e!319317))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553585 (= res!345997 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553586 () Bool)

(declare-fun res!346004 () Bool)

(assert (=> b!553586 (=> (not res!346004) (not e!319317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553586 (= res!346004 (validKeyInArray!0 k0!1914))))

(declare-fun res!346000 () Bool)

(assert (=> start!50644 (=> (not res!346000) (not e!319317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50644 (= res!346000 (validMask!0 mask!3119))))

(assert (=> start!50644 e!319317))

(assert (=> start!50644 true))

(declare-fun array_inv!12540 (array!34869) Bool)

(assert (=> start!50644 (array_inv!12540 a!3118)))

(declare-fun b!553587 () Bool)

(declare-fun res!345995 () Bool)

(assert (=> b!553587 (=> (not res!345995) (not e!319317))))

(assert (=> b!553587 (= res!345995 (validKeyInArray!0 (select (arr!16744 a!3118) j!142)))))

(declare-fun b!553588 () Bool)

(assert (=> b!553588 (= e!319317 e!319316)))

(declare-fun res!345996 () Bool)

(assert (=> b!553588 (=> (not res!345996) (not e!319316))))

(declare-fun lt!251533 () SeekEntryResult!5193)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553588 (= res!345996 (or (= lt!251533 (MissingZero!5193 i!1132)) (= lt!251533 (MissingVacant!5193 i!1132))))))

(assert (=> b!553588 (= lt!251533 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553589 () Bool)

(declare-fun e!319319 () Bool)

(assert (=> b!553589 (= e!319316 e!319319)))

(declare-fun res!346002 () Bool)

(assert (=> b!553589 (=> (not res!346002) (not e!319319))))

(declare-fun lt!251531 () SeekEntryResult!5193)

(declare-fun lt!251530 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34869 (_ BitVec 32)) SeekEntryResult!5193)

(assert (=> b!553589 (= res!346002 (= lt!251531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251530 (select (store (arr!16744 a!3118) i!1132 k0!1914) j!142) (array!34870 (store (arr!16744 a!3118) i!1132 k0!1914) (size!17108 a!3118)) mask!3119)))))

(declare-fun lt!251529 () (_ BitVec 32))

(assert (=> b!553589 (= lt!251531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251529 (select (arr!16744 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553589 (= lt!251530 (toIndex!0 (select (store (arr!16744 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553589 (= lt!251529 (toIndex!0 (select (arr!16744 a!3118) j!142) mask!3119))))

(declare-fun b!553590 () Bool)

(declare-fun res!345999 () Bool)

(assert (=> b!553590 (=> (not res!345999) (not e!319317))))

(assert (=> b!553590 (= res!345999 (and (= (size!17108 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17108 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17108 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553591 () Bool)

(declare-fun res!346003 () Bool)

(assert (=> b!553591 (=> (not res!346003) (not e!319316))))

(declare-datatypes ((List!10824 0))(
  ( (Nil!10821) (Cons!10820 (h!11805 (_ BitVec 64)) (t!17052 List!10824)) )
))
(declare-fun arrayNoDuplicates!0 (array!34869 (_ BitVec 32) List!10824) Bool)

(assert (=> b!553591 (= res!346003 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10821))))

(declare-fun b!553592 () Bool)

(get-info :version)

(assert (=> b!553592 (= e!319319 (not (or (not ((_ is Intermediate!5193) lt!251531)) (undefined!6005 lt!251531) (not (= (select (arr!16744 a!3118) (index!23001 lt!251531)) (select (arr!16744 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553592 e!319320))

(declare-fun res!345998 () Bool)

(assert (=> b!553592 (=> (not res!345998) (not e!319320))))

(assert (=> b!553592 (= res!345998 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17160 0))(
  ( (Unit!17161) )
))
(declare-fun lt!251532 () Unit!17160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17160)

(assert (=> b!553592 (= lt!251532 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50644 res!346000) b!553590))

(assert (= (and b!553590 res!345999) b!553587))

(assert (= (and b!553587 res!345995) b!553586))

(assert (= (and b!553586 res!346004) b!553585))

(assert (= (and b!553585 res!345997) b!553588))

(assert (= (and b!553588 res!345996) b!553583))

(assert (= (and b!553583 res!346001) b!553591))

(assert (= (and b!553591 res!346003) b!553589))

(assert (= (and b!553589 res!346002) b!553592))

(assert (= (and b!553592 res!345998) b!553584))

(declare-fun m!530693 () Bool)

(assert (=> b!553584 m!530693))

(assert (=> b!553584 m!530693))

(declare-fun m!530695 () Bool)

(assert (=> b!553584 m!530695))

(declare-fun m!530697 () Bool)

(assert (=> start!50644 m!530697))

(declare-fun m!530699 () Bool)

(assert (=> start!50644 m!530699))

(declare-fun m!530701 () Bool)

(assert (=> b!553586 m!530701))

(declare-fun m!530703 () Bool)

(assert (=> b!553585 m!530703))

(declare-fun m!530705 () Bool)

(assert (=> b!553583 m!530705))

(assert (=> b!553587 m!530693))

(assert (=> b!553587 m!530693))

(declare-fun m!530707 () Bool)

(assert (=> b!553587 m!530707))

(declare-fun m!530709 () Bool)

(assert (=> b!553588 m!530709))

(declare-fun m!530711 () Bool)

(assert (=> b!553592 m!530711))

(assert (=> b!553592 m!530693))

(declare-fun m!530713 () Bool)

(assert (=> b!553592 m!530713))

(declare-fun m!530715 () Bool)

(assert (=> b!553592 m!530715))

(declare-fun m!530717 () Bool)

(assert (=> b!553591 m!530717))

(assert (=> b!553589 m!530693))

(declare-fun m!530719 () Bool)

(assert (=> b!553589 m!530719))

(assert (=> b!553589 m!530693))

(declare-fun m!530721 () Bool)

(assert (=> b!553589 m!530721))

(assert (=> b!553589 m!530693))

(declare-fun m!530723 () Bool)

(assert (=> b!553589 m!530723))

(declare-fun m!530725 () Bool)

(assert (=> b!553589 m!530725))

(assert (=> b!553589 m!530721))

(declare-fun m!530727 () Bool)

(assert (=> b!553589 m!530727))

(assert (=> b!553589 m!530721))

(declare-fun m!530729 () Bool)

(assert (=> b!553589 m!530729))

(check-sat (not b!553587) (not b!553592) (not b!553588) (not b!553591) (not b!553589) (not b!553584) (not b!553586) (not b!553585) (not b!553583) (not start!50644))
(check-sat)
