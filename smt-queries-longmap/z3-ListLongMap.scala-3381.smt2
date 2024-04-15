; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46686 () Bool)

(assert start!46686)

(declare-fun b!515109 () Bool)

(declare-fun res!314817 () Bool)

(declare-fun e!300749 () Bool)

(assert (=> b!515109 (=> (not res!314817) (not e!300749))))

(declare-datatypes ((array!33008 0))(
  ( (array!33009 (arr!15872 (Array (_ BitVec 32) (_ BitVec 64))) (size!16237 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33008)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515109 (= res!314817 (validKeyInArray!0 (select (arr!15872 a!3235) j!176)))))

(declare-fun b!515110 () Bool)

(declare-fun res!314824 () Bool)

(declare-fun e!300750 () Bool)

(assert (=> b!515110 (=> (not res!314824) (not e!300750))))

(declare-datatypes ((List!10069 0))(
  ( (Nil!10066) (Cons!10065 (h!10963 (_ BitVec 64)) (t!16288 List!10069)) )
))
(declare-fun arrayNoDuplicates!0 (array!33008 (_ BitVec 32) List!10069) Bool)

(assert (=> b!515110 (= res!314824 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10066))))

(declare-fun b!515111 () Bool)

(declare-fun e!300746 () Bool)

(assert (=> b!515111 (= e!300750 (not e!300746))))

(declare-fun res!314823 () Bool)

(assert (=> b!515111 (=> res!314823 e!300746)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4336 0))(
  ( (MissingZero!4336 (index!19532 (_ BitVec 32))) (Found!4336 (index!19533 (_ BitVec 32))) (Intermediate!4336 (undefined!5148 Bool) (index!19534 (_ BitVec 32)) (x!48510 (_ BitVec 32))) (Undefined!4336) (MissingVacant!4336 (index!19535 (_ BitVec 32))) )
))
(declare-fun lt!235703 () SeekEntryResult!4336)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235705 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33008 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!515111 (= res!314823 (= lt!235703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235705 (select (store (arr!15872 a!3235) i!1204 k0!2280) j!176) (array!33009 (store (arr!15872 a!3235) i!1204 k0!2280) (size!16237 a!3235)) mask!3524)))))

(declare-fun lt!235701 () (_ BitVec 32))

(assert (=> b!515111 (= lt!235703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235701 (select (arr!15872 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515111 (= lt!235705 (toIndex!0 (select (store (arr!15872 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515111 (= lt!235701 (toIndex!0 (select (arr!15872 a!3235) j!176) mask!3524))))

(declare-fun e!300748 () Bool)

(assert (=> b!515111 e!300748))

(declare-fun res!314818 () Bool)

(assert (=> b!515111 (=> (not res!314818) (not e!300748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33008 (_ BitVec 32)) Bool)

(assert (=> b!515111 (= res!314818 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15916 0))(
  ( (Unit!15917) )
))
(declare-fun lt!235702 () Unit!15916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15916)

(assert (=> b!515111 (= lt!235702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515112 () Bool)

(declare-fun res!314820 () Bool)

(assert (=> b!515112 (=> (not res!314820) (not e!300749))))

(declare-fun arrayContainsKey!0 (array!33008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515112 (= res!314820 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515113 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33008 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!515113 (= e!300748 (= (seekEntryOrOpen!0 (select (arr!15872 a!3235) j!176) a!3235 mask!3524) (Found!4336 j!176)))))

(declare-fun b!515115 () Bool)

(assert (=> b!515115 (= e!300746 true)))

(assert (=> b!515115 (and (bvslt (x!48510 lt!235703) #b01111111111111111111111111111110) (or (= (select (arr!15872 a!3235) (index!19534 lt!235703)) (select (arr!15872 a!3235) j!176)) (= (select (arr!15872 a!3235) (index!19534 lt!235703)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15872 a!3235) (index!19534 lt!235703)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515116 () Bool)

(declare-fun res!314825 () Bool)

(assert (=> b!515116 (=> (not res!314825) (not e!300749))))

(assert (=> b!515116 (= res!314825 (and (= (size!16237 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16237 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16237 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515117 () Bool)

(declare-fun res!314815 () Bool)

(assert (=> b!515117 (=> (not res!314815) (not e!300749))))

(assert (=> b!515117 (= res!314815 (validKeyInArray!0 k0!2280))))

(declare-fun b!515114 () Bool)

(declare-fun res!314821 () Bool)

(assert (=> b!515114 (=> res!314821 e!300746)))

(get-info :version)

(assert (=> b!515114 (= res!314821 (or (undefined!5148 lt!235703) (not ((_ is Intermediate!4336) lt!235703))))))

(declare-fun res!314816 () Bool)

(assert (=> start!46686 (=> (not res!314816) (not e!300749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46686 (= res!314816 (validMask!0 mask!3524))))

(assert (=> start!46686 e!300749))

(assert (=> start!46686 true))

(declare-fun array_inv!11755 (array!33008) Bool)

(assert (=> start!46686 (array_inv!11755 a!3235)))

(declare-fun b!515118 () Bool)

(declare-fun res!314822 () Bool)

(assert (=> b!515118 (=> (not res!314822) (not e!300750))))

(assert (=> b!515118 (= res!314822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515119 () Bool)

(assert (=> b!515119 (= e!300749 e!300750)))

(declare-fun res!314819 () Bool)

(assert (=> b!515119 (=> (not res!314819) (not e!300750))))

(declare-fun lt!235704 () SeekEntryResult!4336)

(assert (=> b!515119 (= res!314819 (or (= lt!235704 (MissingZero!4336 i!1204)) (= lt!235704 (MissingVacant!4336 i!1204))))))

(assert (=> b!515119 (= lt!235704 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46686 res!314816) b!515116))

(assert (= (and b!515116 res!314825) b!515109))

(assert (= (and b!515109 res!314817) b!515117))

(assert (= (and b!515117 res!314815) b!515112))

(assert (= (and b!515112 res!314820) b!515119))

(assert (= (and b!515119 res!314819) b!515118))

(assert (= (and b!515118 res!314822) b!515110))

(assert (= (and b!515110 res!314824) b!515111))

(assert (= (and b!515111 res!314818) b!515113))

(assert (= (and b!515111 (not res!314823)) b!515114))

(assert (= (and b!515114 (not res!314821)) b!515115))

(declare-fun m!495955 () Bool)

(assert (=> b!515118 m!495955))

(declare-fun m!495957 () Bool)

(assert (=> b!515111 m!495957))

(declare-fun m!495959 () Bool)

(assert (=> b!515111 m!495959))

(declare-fun m!495961 () Bool)

(assert (=> b!515111 m!495961))

(declare-fun m!495963 () Bool)

(assert (=> b!515111 m!495963))

(declare-fun m!495965 () Bool)

(assert (=> b!515111 m!495965))

(assert (=> b!515111 m!495965))

(declare-fun m!495967 () Bool)

(assert (=> b!515111 m!495967))

(assert (=> b!515111 m!495959))

(declare-fun m!495969 () Bool)

(assert (=> b!515111 m!495969))

(assert (=> b!515111 m!495959))

(declare-fun m!495971 () Bool)

(assert (=> b!515111 m!495971))

(assert (=> b!515111 m!495965))

(declare-fun m!495973 () Bool)

(assert (=> b!515111 m!495973))

(assert (=> b!515109 m!495959))

(assert (=> b!515109 m!495959))

(declare-fun m!495975 () Bool)

(assert (=> b!515109 m!495975))

(declare-fun m!495977 () Bool)

(assert (=> b!515112 m!495977))

(assert (=> b!515113 m!495959))

(assert (=> b!515113 m!495959))

(declare-fun m!495979 () Bool)

(assert (=> b!515113 m!495979))

(declare-fun m!495981 () Bool)

(assert (=> start!46686 m!495981))

(declare-fun m!495983 () Bool)

(assert (=> start!46686 m!495983))

(declare-fun m!495985 () Bool)

(assert (=> b!515110 m!495985))

(declare-fun m!495987 () Bool)

(assert (=> b!515115 m!495987))

(assert (=> b!515115 m!495959))

(declare-fun m!495989 () Bool)

(assert (=> b!515119 m!495989))

(declare-fun m!495991 () Bool)

(assert (=> b!515117 m!495991))

(check-sat (not b!515111) (not b!515112) (not b!515119) (not b!515109) (not b!515118) (not b!515113) (not b!515117) (not start!46686) (not b!515110))
(check-sat)
