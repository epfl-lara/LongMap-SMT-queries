; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46730 () Bool)

(assert start!46730)

(declare-fun e!301198 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33043 0))(
  ( (array!33044 (arr!15889 (Array (_ BitVec 32) (_ BitVec 64))) (size!16253 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33043)

(declare-fun b!516012 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4312 0))(
  ( (MissingZero!4312 (index!19436 (_ BitVec 32))) (Found!4312 (index!19437 (_ BitVec 32))) (Intermediate!4312 (undefined!5124 Bool) (index!19438 (_ BitVec 32)) (x!48544 (_ BitVec 32))) (Undefined!4312) (MissingVacant!4312 (index!19439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33043 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!516012 (= e!301198 (= (seekEntryOrOpen!0 (select (arr!15889 a!3235) j!176) a!3235 mask!3524) (Found!4312 j!176)))))

(declare-fun b!516013 () Bool)

(declare-fun res!315639 () Bool)

(declare-fun e!301200 () Bool)

(assert (=> b!516013 (=> res!315639 e!301200)))

(declare-fun lt!236265 () SeekEntryResult!4312)

(get-info :version)

(assert (=> b!516013 (= res!315639 (or (undefined!5124 lt!236265) (not ((_ is Intermediate!4312) lt!236265))))))

(declare-fun b!516014 () Bool)

(declare-fun e!301199 () Bool)

(assert (=> b!516014 (= e!301199 (not e!301200))))

(declare-fun res!315633 () Bool)

(assert (=> b!516014 (=> res!315633 e!301200)))

(declare-fun lt!236266 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33043 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!516014 (= res!315633 (= lt!236265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236266 (select (store (arr!15889 a!3235) i!1204 k0!2280) j!176) (array!33044 (store (arr!15889 a!3235) i!1204 k0!2280) (size!16253 a!3235)) mask!3524)))))

(declare-fun lt!236262 () (_ BitVec 32))

(assert (=> b!516014 (= lt!236265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236262 (select (arr!15889 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516014 (= lt!236266 (toIndex!0 (select (store (arr!15889 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516014 (= lt!236262 (toIndex!0 (select (arr!15889 a!3235) j!176) mask!3524))))

(assert (=> b!516014 e!301198))

(declare-fun res!315632 () Bool)

(assert (=> b!516014 (=> (not res!315632) (not e!301198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33043 (_ BitVec 32)) Bool)

(assert (=> b!516014 (= res!315632 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15943 0))(
  ( (Unit!15944) )
))
(declare-fun lt!236264 () Unit!15943)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15943)

(assert (=> b!516014 (= lt!236264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516015 () Bool)

(declare-fun res!315630 () Bool)

(declare-fun e!301196 () Bool)

(assert (=> b!516015 (=> (not res!315630) (not e!301196))))

(assert (=> b!516015 (= res!315630 (and (= (size!16253 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16253 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16253 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516016 () Bool)

(declare-fun res!315637 () Bool)

(assert (=> b!516016 (=> (not res!315637) (not e!301199))))

(declare-datatypes ((List!9954 0))(
  ( (Nil!9951) (Cons!9950 (h!10848 (_ BitVec 64)) (t!16174 List!9954)) )
))
(declare-fun arrayNoDuplicates!0 (array!33043 (_ BitVec 32) List!9954) Bool)

(assert (=> b!516016 (= res!315637 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9951))))

(declare-fun b!516017 () Bool)

(assert (=> b!516017 (= e!301200 true)))

(assert (=> b!516017 (and (bvslt (x!48544 lt!236265) #b01111111111111111111111111111110) (or (= (select (arr!15889 a!3235) (index!19438 lt!236265)) (select (arr!15889 a!3235) j!176)) (= (select (arr!15889 a!3235) (index!19438 lt!236265)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15889 a!3235) (index!19438 lt!236265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516018 () Bool)

(declare-fun res!315634 () Bool)

(assert (=> b!516018 (=> (not res!315634) (not e!301196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516018 (= res!315634 (validKeyInArray!0 k0!2280))))

(declare-fun res!315636 () Bool)

(assert (=> start!46730 (=> (not res!315636) (not e!301196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46730 (= res!315636 (validMask!0 mask!3524))))

(assert (=> start!46730 e!301196))

(assert (=> start!46730 true))

(declare-fun array_inv!11748 (array!33043) Bool)

(assert (=> start!46730 (array_inv!11748 a!3235)))

(declare-fun b!516019 () Bool)

(declare-fun res!315640 () Bool)

(assert (=> b!516019 (=> (not res!315640) (not e!301196))))

(declare-fun arrayContainsKey!0 (array!33043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516019 (= res!315640 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516020 () Bool)

(assert (=> b!516020 (= e!301196 e!301199)))

(declare-fun res!315635 () Bool)

(assert (=> b!516020 (=> (not res!315635) (not e!301199))))

(declare-fun lt!236263 () SeekEntryResult!4312)

(assert (=> b!516020 (= res!315635 (or (= lt!236263 (MissingZero!4312 i!1204)) (= lt!236263 (MissingVacant!4312 i!1204))))))

(assert (=> b!516020 (= lt!236263 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516021 () Bool)

(declare-fun res!315638 () Bool)

(assert (=> b!516021 (=> (not res!315638) (not e!301196))))

(assert (=> b!516021 (= res!315638 (validKeyInArray!0 (select (arr!15889 a!3235) j!176)))))

(declare-fun b!516022 () Bool)

(declare-fun res!315631 () Bool)

(assert (=> b!516022 (=> (not res!315631) (not e!301199))))

(assert (=> b!516022 (= res!315631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46730 res!315636) b!516015))

(assert (= (and b!516015 res!315630) b!516021))

(assert (= (and b!516021 res!315638) b!516018))

(assert (= (and b!516018 res!315634) b!516019))

(assert (= (and b!516019 res!315640) b!516020))

(assert (= (and b!516020 res!315635) b!516022))

(assert (= (and b!516022 res!315631) b!516016))

(assert (= (and b!516016 res!315637) b!516014))

(assert (= (and b!516014 res!315632) b!516012))

(assert (= (and b!516014 (not res!315633)) b!516013))

(assert (= (and b!516013 (not res!315639)) b!516017))

(declare-fun m!497689 () Bool)

(assert (=> start!46730 m!497689))

(declare-fun m!497691 () Bool)

(assert (=> start!46730 m!497691))

(declare-fun m!497693 () Bool)

(assert (=> b!516019 m!497693))

(declare-fun m!497695 () Bool)

(assert (=> b!516022 m!497695))

(declare-fun m!497697 () Bool)

(assert (=> b!516017 m!497697))

(declare-fun m!497699 () Bool)

(assert (=> b!516017 m!497699))

(declare-fun m!497701 () Bool)

(assert (=> b!516020 m!497701))

(assert (=> b!516012 m!497699))

(assert (=> b!516012 m!497699))

(declare-fun m!497703 () Bool)

(assert (=> b!516012 m!497703))

(declare-fun m!497705 () Bool)

(assert (=> b!516014 m!497705))

(declare-fun m!497707 () Bool)

(assert (=> b!516014 m!497707))

(declare-fun m!497709 () Bool)

(assert (=> b!516014 m!497709))

(assert (=> b!516014 m!497699))

(declare-fun m!497711 () Bool)

(assert (=> b!516014 m!497711))

(assert (=> b!516014 m!497699))

(declare-fun m!497713 () Bool)

(assert (=> b!516014 m!497713))

(declare-fun m!497715 () Bool)

(assert (=> b!516014 m!497715))

(assert (=> b!516014 m!497709))

(declare-fun m!497717 () Bool)

(assert (=> b!516014 m!497717))

(assert (=> b!516014 m!497709))

(declare-fun m!497719 () Bool)

(assert (=> b!516014 m!497719))

(assert (=> b!516014 m!497699))

(declare-fun m!497721 () Bool)

(assert (=> b!516018 m!497721))

(assert (=> b!516021 m!497699))

(assert (=> b!516021 m!497699))

(declare-fun m!497723 () Bool)

(assert (=> b!516021 m!497723))

(declare-fun m!497725 () Bool)

(assert (=> b!516016 m!497725))

(check-sat (not b!516019) (not b!516018) (not b!516012) (not b!516022) (not b!516016) (not b!516021) (not b!516014) (not b!516020) (not start!46730))
(check-sat)
