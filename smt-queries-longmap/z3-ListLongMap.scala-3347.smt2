; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46062 () Bool)

(assert start!46062)

(declare-fun b!510026 () Bool)

(declare-fun e!298130 () Bool)

(declare-fun e!298128 () Bool)

(assert (=> b!510026 (= e!298130 e!298128)))

(declare-fun res!311016 () Bool)

(assert (=> b!510026 (=> (not res!311016) (not e!298128))))

(declare-datatypes ((SeekEntryResult!4234 0))(
  ( (MissingZero!4234 (index!19124 (_ BitVec 32))) (Found!4234 (index!19125 (_ BitVec 32))) (Intermediate!4234 (undefined!5046 Bool) (index!19126 (_ BitVec 32)) (x!48094 (_ BitVec 32))) (Undefined!4234) (MissingVacant!4234 (index!19127 (_ BitVec 32))) )
))
(declare-fun lt!233054 () SeekEntryResult!4234)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510026 (= res!311016 (or (= lt!233054 (MissingZero!4234 i!1204)) (= lt!233054 (MissingVacant!4234 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32783 0))(
  ( (array!32784 (arr!15770 (Array (_ BitVec 32) (_ BitVec 64))) (size!16135 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32783)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32783 (_ BitVec 32)) SeekEntryResult!4234)

(assert (=> b!510026 (= lt!233054 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510027 () Bool)

(declare-fun res!311017 () Bool)

(assert (=> b!510027 (=> (not res!311017) (not e!298128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32783 (_ BitVec 32)) Bool)

(assert (=> b!510027 (= res!311017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510028 () Bool)

(declare-fun e!298129 () Bool)

(assert (=> b!510028 (= e!298128 (not e!298129))))

(declare-fun res!311020 () Bool)

(assert (=> b!510028 (=> res!311020 e!298129)))

(declare-fun lt!233058 () array!32783)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233055 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32783 (_ BitVec 32)) SeekEntryResult!4234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510028 (= res!311020 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15770 a!3235) j!176) mask!3524) (select (arr!15770 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233055 mask!3524) lt!233055 lt!233058 mask!3524))))))

(assert (=> b!510028 (= lt!233055 (select (store (arr!15770 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510028 (= lt!233058 (array!32784 (store (arr!15770 a!3235) i!1204 k0!2280) (size!16135 a!3235)))))

(declare-fun lt!233057 () SeekEntryResult!4234)

(assert (=> b!510028 (= lt!233057 (Found!4234 j!176))))

(assert (=> b!510028 (= lt!233057 (seekEntryOrOpen!0 (select (arr!15770 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510028 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15712 0))(
  ( (Unit!15713) )
))
(declare-fun lt!233059 () Unit!15712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15712)

(assert (=> b!510028 (= lt!233059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510029 () Bool)

(declare-fun res!311018 () Bool)

(assert (=> b!510029 (=> (not res!311018) (not e!298130))))

(declare-fun arrayContainsKey!0 (array!32783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510029 (= res!311018 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311021 () Bool)

(assert (=> start!46062 (=> (not res!311021) (not e!298130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46062 (= res!311021 (validMask!0 mask!3524))))

(assert (=> start!46062 e!298130))

(assert (=> start!46062 true))

(declare-fun array_inv!11653 (array!32783) Bool)

(assert (=> start!46062 (array_inv!11653 a!3235)))

(declare-fun b!510030 () Bool)

(assert (=> b!510030 (= e!298129 true)))

(assert (=> b!510030 (= lt!233057 (seekEntryOrOpen!0 lt!233055 lt!233058 mask!3524))))

(declare-fun lt!233056 () Unit!15712)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32783 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15712)

(assert (=> b!510030 (= lt!233056 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510031 () Bool)

(declare-fun res!311014 () Bool)

(assert (=> b!510031 (=> (not res!311014) (not e!298130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510031 (= res!311014 (validKeyInArray!0 (select (arr!15770 a!3235) j!176)))))

(declare-fun b!510032 () Bool)

(declare-fun res!311019 () Bool)

(assert (=> b!510032 (=> (not res!311019) (not e!298130))))

(assert (=> b!510032 (= res!311019 (and (= (size!16135 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16135 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16135 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510033 () Bool)

(declare-fun res!311013 () Bool)

(assert (=> b!510033 (=> (not res!311013) (not e!298128))))

(declare-datatypes ((List!9967 0))(
  ( (Nil!9964) (Cons!9963 (h!10840 (_ BitVec 64)) (t!16186 List!9967)) )
))
(declare-fun arrayNoDuplicates!0 (array!32783 (_ BitVec 32) List!9967) Bool)

(assert (=> b!510033 (= res!311013 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9964))))

(declare-fun b!510034 () Bool)

(declare-fun res!311015 () Bool)

(assert (=> b!510034 (=> (not res!311015) (not e!298130))))

(assert (=> b!510034 (= res!311015 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46062 res!311021) b!510032))

(assert (= (and b!510032 res!311019) b!510031))

(assert (= (and b!510031 res!311014) b!510034))

(assert (= (and b!510034 res!311015) b!510029))

(assert (= (and b!510029 res!311018) b!510026))

(assert (= (and b!510026 res!311016) b!510027))

(assert (= (and b!510027 res!311017) b!510033))

(assert (= (and b!510033 res!311013) b!510028))

(assert (= (and b!510028 (not res!311020)) b!510030))

(declare-fun m!490741 () Bool)

(assert (=> b!510030 m!490741))

(declare-fun m!490743 () Bool)

(assert (=> b!510030 m!490743))

(declare-fun m!490745 () Bool)

(assert (=> b!510034 m!490745))

(declare-fun m!490747 () Bool)

(assert (=> b!510033 m!490747))

(declare-fun m!490749 () Bool)

(assert (=> b!510029 m!490749))

(declare-fun m!490751 () Bool)

(assert (=> b!510031 m!490751))

(assert (=> b!510031 m!490751))

(declare-fun m!490753 () Bool)

(assert (=> b!510031 m!490753))

(declare-fun m!490755 () Bool)

(assert (=> b!510027 m!490755))

(declare-fun m!490757 () Bool)

(assert (=> b!510028 m!490757))

(declare-fun m!490759 () Bool)

(assert (=> b!510028 m!490759))

(declare-fun m!490761 () Bool)

(assert (=> b!510028 m!490761))

(declare-fun m!490763 () Bool)

(assert (=> b!510028 m!490763))

(assert (=> b!510028 m!490751))

(declare-fun m!490765 () Bool)

(assert (=> b!510028 m!490765))

(assert (=> b!510028 m!490751))

(assert (=> b!510028 m!490763))

(assert (=> b!510028 m!490751))

(assert (=> b!510028 m!490751))

(declare-fun m!490767 () Bool)

(assert (=> b!510028 m!490767))

(declare-fun m!490769 () Bool)

(assert (=> b!510028 m!490769))

(assert (=> b!510028 m!490769))

(declare-fun m!490771 () Bool)

(assert (=> b!510028 m!490771))

(declare-fun m!490773 () Bool)

(assert (=> b!510028 m!490773))

(declare-fun m!490775 () Bool)

(assert (=> start!46062 m!490775))

(declare-fun m!490777 () Bool)

(assert (=> start!46062 m!490777))

(declare-fun m!490779 () Bool)

(assert (=> b!510026 m!490779))

(check-sat (not b!510026) (not b!510030) (not b!510034) (not b!510028) (not b!510027) (not b!510029) (not start!46062) (not b!510031) (not b!510033))
(check-sat)
