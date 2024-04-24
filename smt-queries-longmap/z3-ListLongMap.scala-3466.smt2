; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48116 () Bool)

(assert start!48116)

(declare-fun b!529977 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!308803 () Bool)

(declare-datatypes ((array!33553 0))(
  ( (array!33554 (arr!16123 (Array (_ BitVec 32) (_ BitVec 64))) (size!16487 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33553)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4546 0))(
  ( (MissingZero!4546 (index!20408 (_ BitVec 32))) (Found!4546 (index!20409 (_ BitVec 32))) (Intermediate!4546 (undefined!5358 Bool) (index!20410 (_ BitVec 32)) (x!49525 (_ BitVec 32))) (Undefined!4546) (MissingVacant!4546 (index!20411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33553 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!529977 (= e!308803 (= (seekEntryOrOpen!0 (select (arr!16123 a!3235) j!176) a!3235 mask!3524) (Found!4546 j!176)))))

(declare-fun b!529978 () Bool)

(declare-fun res!325740 () Bool)

(declare-fun e!308804 () Bool)

(assert (=> b!529978 (=> (not res!325740) (not e!308804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529978 (= res!325740 (validKeyInArray!0 (select (arr!16123 a!3235) j!176)))))

(declare-fun b!529979 () Bool)

(declare-fun res!325747 () Bool)

(declare-fun e!308807 () Bool)

(assert (=> b!529979 (=> (not res!325747) (not e!308807))))

(declare-datatypes ((List!10188 0))(
  ( (Nil!10185) (Cons!10184 (h!11124 (_ BitVec 64)) (t!16408 List!10188)) )
))
(declare-fun arrayNoDuplicates!0 (array!33553 (_ BitVec 32) List!10188) Bool)

(assert (=> b!529979 (= res!325747 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10185))))

(declare-fun res!325744 () Bool)

(assert (=> start!48116 (=> (not res!325744) (not e!308804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48116 (= res!325744 (validMask!0 mask!3524))))

(assert (=> start!48116 e!308804))

(assert (=> start!48116 true))

(declare-fun array_inv!11982 (array!33553) Bool)

(assert (=> start!48116 (array_inv!11982 a!3235)))

(declare-fun b!529980 () Bool)

(declare-fun res!325742 () Bool)

(assert (=> b!529980 (=> (not res!325742) (not e!308807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33553 (_ BitVec 32)) Bool)

(assert (=> b!529980 (= res!325742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529981 () Bool)

(assert (=> b!529981 (= e!308804 e!308807)))

(declare-fun res!325743 () Bool)

(assert (=> b!529981 (=> (not res!325743) (not e!308807))))

(declare-fun lt!244471 () SeekEntryResult!4546)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529981 (= res!325743 (or (= lt!244471 (MissingZero!4546 i!1204)) (= lt!244471 (MissingVacant!4546 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!529981 (= lt!244471 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529982 () Bool)

(declare-fun res!325738 () Bool)

(assert (=> b!529982 (=> (not res!325738) (not e!308804))))

(assert (=> b!529982 (= res!325738 (and (= (size!16487 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16487 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16487 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529983 () Bool)

(declare-fun e!308808 () Bool)

(declare-fun e!308805 () Bool)

(assert (=> b!529983 (= e!308808 e!308805)))

(declare-fun res!325737 () Bool)

(assert (=> b!529983 (=> res!325737 e!308805)))

(declare-fun lt!244464 () Bool)

(declare-fun lt!244468 () SeekEntryResult!4546)

(assert (=> b!529983 (= res!325737 (or (and (not lt!244464) (undefined!5358 lt!244468)) (and (not lt!244464) (not (undefined!5358 lt!244468)))))))

(get-info :version)

(assert (=> b!529983 (= lt!244464 (not ((_ is Intermediate!4546) lt!244468)))))

(declare-fun b!529984 () Bool)

(assert (=> b!529984 (= e!308805 true)))

(declare-fun lt!244470 () SeekEntryResult!4546)

(declare-fun lt!244466 () array!33553)

(declare-fun lt!244469 () (_ BitVec 64))

(assert (=> b!529984 (= lt!244470 (seekEntryOrOpen!0 lt!244469 lt!244466 mask!3524))))

(assert (=> b!529984 false))

(declare-fun b!529985 () Bool)

(declare-fun res!325746 () Bool)

(assert (=> b!529985 (=> (not res!325746) (not e!308804))))

(assert (=> b!529985 (= res!325746 (validKeyInArray!0 k0!2280))))

(declare-fun b!529986 () Bool)

(assert (=> b!529986 (= e!308807 (not e!308808))))

(declare-fun res!325745 () Bool)

(assert (=> b!529986 (=> res!325745 e!308808)))

(declare-fun lt!244467 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33553 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!529986 (= res!325745 (= lt!244468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244467 lt!244469 lt!244466 mask!3524)))))

(declare-fun lt!244465 () (_ BitVec 32))

(assert (=> b!529986 (= lt!244468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244465 (select (arr!16123 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529986 (= lt!244467 (toIndex!0 lt!244469 mask!3524))))

(assert (=> b!529986 (= lt!244469 (select (store (arr!16123 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529986 (= lt!244465 (toIndex!0 (select (arr!16123 a!3235) j!176) mask!3524))))

(assert (=> b!529986 (= lt!244466 (array!33554 (store (arr!16123 a!3235) i!1204 k0!2280) (size!16487 a!3235)))))

(assert (=> b!529986 e!308803))

(declare-fun res!325739 () Bool)

(assert (=> b!529986 (=> (not res!325739) (not e!308803))))

(assert (=> b!529986 (= res!325739 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16765 0))(
  ( (Unit!16766) )
))
(declare-fun lt!244463 () Unit!16765)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16765)

(assert (=> b!529986 (= lt!244463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529987 () Bool)

(declare-fun res!325741 () Bool)

(assert (=> b!529987 (=> (not res!325741) (not e!308804))))

(declare-fun arrayContainsKey!0 (array!33553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529987 (= res!325741 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48116 res!325744) b!529982))

(assert (= (and b!529982 res!325738) b!529978))

(assert (= (and b!529978 res!325740) b!529985))

(assert (= (and b!529985 res!325746) b!529987))

(assert (= (and b!529987 res!325741) b!529981))

(assert (= (and b!529981 res!325743) b!529980))

(assert (= (and b!529980 res!325742) b!529979))

(assert (= (and b!529979 res!325747) b!529986))

(assert (= (and b!529986 res!325739) b!529977))

(assert (= (and b!529986 (not res!325745)) b!529983))

(assert (= (and b!529983 (not res!325737)) b!529984))

(declare-fun m!510745 () Bool)

(assert (=> start!48116 m!510745))

(declare-fun m!510747 () Bool)

(assert (=> start!48116 m!510747))

(declare-fun m!510749 () Bool)

(assert (=> b!529980 m!510749))

(declare-fun m!510751 () Bool)

(assert (=> b!529977 m!510751))

(assert (=> b!529977 m!510751))

(declare-fun m!510753 () Bool)

(assert (=> b!529977 m!510753))

(assert (=> b!529978 m!510751))

(assert (=> b!529978 m!510751))

(declare-fun m!510755 () Bool)

(assert (=> b!529978 m!510755))

(declare-fun m!510757 () Bool)

(assert (=> b!529985 m!510757))

(declare-fun m!510759 () Bool)

(assert (=> b!529986 m!510759))

(declare-fun m!510761 () Bool)

(assert (=> b!529986 m!510761))

(declare-fun m!510763 () Bool)

(assert (=> b!529986 m!510763))

(declare-fun m!510765 () Bool)

(assert (=> b!529986 m!510765))

(assert (=> b!529986 m!510751))

(declare-fun m!510767 () Bool)

(assert (=> b!529986 m!510767))

(assert (=> b!529986 m!510751))

(declare-fun m!510769 () Bool)

(assert (=> b!529986 m!510769))

(assert (=> b!529986 m!510751))

(declare-fun m!510771 () Bool)

(assert (=> b!529986 m!510771))

(declare-fun m!510773 () Bool)

(assert (=> b!529986 m!510773))

(declare-fun m!510775 () Bool)

(assert (=> b!529987 m!510775))

(declare-fun m!510777 () Bool)

(assert (=> b!529981 m!510777))

(declare-fun m!510779 () Bool)

(assert (=> b!529984 m!510779))

(declare-fun m!510781 () Bool)

(assert (=> b!529979 m!510781))

(check-sat (not b!529981) (not b!529987) (not b!529985) (not b!529978) (not b!529984) (not b!529979) (not b!529980) (not b!529986) (not start!48116) (not b!529977))
(check-sat)
