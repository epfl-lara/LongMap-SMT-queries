; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46722 () Bool)

(assert start!46722)

(declare-fun b!515703 () Bool)

(declare-fun res!315414 () Bool)

(declare-fun e!301019 () Bool)

(assert (=> b!515703 (=> (not res!315414) (not e!301019))))

(declare-datatypes ((array!33044 0))(
  ( (array!33045 (arr!15890 (Array (_ BitVec 32) (_ BitVec 64))) (size!16255 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33044)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515703 (= res!315414 (validKeyInArray!0 (select (arr!15890 a!3235) j!176)))))

(declare-fun b!515704 () Bool)

(declare-fun res!315418 () Bool)

(declare-fun e!301017 () Bool)

(assert (=> b!515704 (=> res!315418 e!301017)))

(declare-datatypes ((SeekEntryResult!4354 0))(
  ( (MissingZero!4354 (index!19604 (_ BitVec 32))) (Found!4354 (index!19605 (_ BitVec 32))) (Intermediate!4354 (undefined!5166 Bool) (index!19606 (_ BitVec 32)) (x!48576 (_ BitVec 32))) (Undefined!4354) (MissingVacant!4354 (index!19607 (_ BitVec 32))) )
))
(declare-fun lt!235975 () SeekEntryResult!4354)

(get-info :version)

(assert (=> b!515704 (= res!315418 (or (undefined!5166 lt!235975) (not ((_ is Intermediate!4354) lt!235975))))))

(declare-fun b!515705 () Bool)

(declare-fun res!315416 () Bool)

(assert (=> b!515705 (=> (not res!315416) (not e!301019))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515705 (= res!315416 (and (= (size!16255 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16255 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16255 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!301020 () Bool)

(declare-fun b!515706 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33044 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!515706 (= e!301020 (= (seekEntryOrOpen!0 (select (arr!15890 a!3235) j!176) a!3235 mask!3524) (Found!4354 j!176)))))

(declare-fun b!515707 () Bool)

(declare-fun res!315410 () Bool)

(assert (=> b!515707 (=> (not res!315410) (not e!301019))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!515707 (= res!315410 (validKeyInArray!0 k0!2280))))

(declare-fun b!515708 () Bool)

(declare-fun res!315413 () Bool)

(declare-fun e!301018 () Bool)

(assert (=> b!515708 (=> (not res!315413) (not e!301018))))

(declare-datatypes ((List!10087 0))(
  ( (Nil!10084) (Cons!10083 (h!10981 (_ BitVec 64)) (t!16306 List!10087)) )
))
(declare-fun arrayNoDuplicates!0 (array!33044 (_ BitVec 32) List!10087) Bool)

(assert (=> b!515708 (= res!315413 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10084))))

(declare-fun b!515709 () Bool)

(assert (=> b!515709 (= e!301019 e!301018)))

(declare-fun res!315409 () Bool)

(assert (=> b!515709 (=> (not res!315409) (not e!301018))))

(declare-fun lt!235973 () SeekEntryResult!4354)

(assert (=> b!515709 (= res!315409 (or (= lt!235973 (MissingZero!4354 i!1204)) (= lt!235973 (MissingVacant!4354 i!1204))))))

(assert (=> b!515709 (= lt!235973 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!315415 () Bool)

(assert (=> start!46722 (=> (not res!315415) (not e!301019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46722 (= res!315415 (validMask!0 mask!3524))))

(assert (=> start!46722 e!301019))

(assert (=> start!46722 true))

(declare-fun array_inv!11773 (array!33044) Bool)

(assert (=> start!46722 (array_inv!11773 a!3235)))

(declare-fun b!515710 () Bool)

(assert (=> b!515710 (= e!301017 true)))

(assert (=> b!515710 (and (bvslt (x!48576 lt!235975) #b01111111111111111111111111111110) (or (= (select (arr!15890 a!3235) (index!19606 lt!235975)) (select (arr!15890 a!3235) j!176)) (= (select (arr!15890 a!3235) (index!19606 lt!235975)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15890 a!3235) (index!19606 lt!235975)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515711 () Bool)

(assert (=> b!515711 (= e!301018 (not e!301017))))

(declare-fun res!315411 () Bool)

(assert (=> b!515711 (=> res!315411 e!301017)))

(declare-fun lt!235972 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33044 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!515711 (= res!315411 (= lt!235975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235972 (select (store (arr!15890 a!3235) i!1204 k0!2280) j!176) (array!33045 (store (arr!15890 a!3235) i!1204 k0!2280) (size!16255 a!3235)) mask!3524)))))

(declare-fun lt!235971 () (_ BitVec 32))

(assert (=> b!515711 (= lt!235975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235971 (select (arr!15890 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515711 (= lt!235972 (toIndex!0 (select (store (arr!15890 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515711 (= lt!235971 (toIndex!0 (select (arr!15890 a!3235) j!176) mask!3524))))

(assert (=> b!515711 e!301020))

(declare-fun res!315412 () Bool)

(assert (=> b!515711 (=> (not res!315412) (not e!301020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33044 (_ BitVec 32)) Bool)

(assert (=> b!515711 (= res!315412 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15952 0))(
  ( (Unit!15953) )
))
(declare-fun lt!235974 () Unit!15952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15952)

(assert (=> b!515711 (= lt!235974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515712 () Bool)

(declare-fun res!315417 () Bool)

(assert (=> b!515712 (=> (not res!315417) (not e!301019))))

(declare-fun arrayContainsKey!0 (array!33044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515712 (= res!315417 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515713 () Bool)

(declare-fun res!315419 () Bool)

(assert (=> b!515713 (=> (not res!315419) (not e!301018))))

(assert (=> b!515713 (= res!315419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46722 res!315415) b!515705))

(assert (= (and b!515705 res!315416) b!515703))

(assert (= (and b!515703 res!315414) b!515707))

(assert (= (and b!515707 res!315410) b!515712))

(assert (= (and b!515712 res!315417) b!515709))

(assert (= (and b!515709 res!315409) b!515713))

(assert (= (and b!515713 res!315419) b!515708))

(assert (= (and b!515708 res!315413) b!515711))

(assert (= (and b!515711 res!315412) b!515706))

(assert (= (and b!515711 (not res!315411)) b!515704))

(assert (= (and b!515704 (not res!315418)) b!515710))

(declare-fun m!496639 () Bool)

(assert (=> b!515709 m!496639))

(declare-fun m!496641 () Bool)

(assert (=> start!46722 m!496641))

(declare-fun m!496643 () Bool)

(assert (=> start!46722 m!496643))

(declare-fun m!496645 () Bool)

(assert (=> b!515710 m!496645))

(declare-fun m!496647 () Bool)

(assert (=> b!515710 m!496647))

(declare-fun m!496649 () Bool)

(assert (=> b!515711 m!496649))

(declare-fun m!496651 () Bool)

(assert (=> b!515711 m!496651))

(declare-fun m!496653 () Bool)

(assert (=> b!515711 m!496653))

(assert (=> b!515711 m!496653))

(declare-fun m!496655 () Bool)

(assert (=> b!515711 m!496655))

(assert (=> b!515711 m!496647))

(declare-fun m!496657 () Bool)

(assert (=> b!515711 m!496657))

(assert (=> b!515711 m!496647))

(declare-fun m!496659 () Bool)

(assert (=> b!515711 m!496659))

(assert (=> b!515711 m!496653))

(declare-fun m!496661 () Bool)

(assert (=> b!515711 m!496661))

(assert (=> b!515711 m!496647))

(declare-fun m!496663 () Bool)

(assert (=> b!515711 m!496663))

(declare-fun m!496665 () Bool)

(assert (=> b!515708 m!496665))

(assert (=> b!515703 m!496647))

(assert (=> b!515703 m!496647))

(declare-fun m!496667 () Bool)

(assert (=> b!515703 m!496667))

(declare-fun m!496669 () Bool)

(assert (=> b!515707 m!496669))

(declare-fun m!496671 () Bool)

(assert (=> b!515713 m!496671))

(assert (=> b!515706 m!496647))

(assert (=> b!515706 m!496647))

(declare-fun m!496673 () Bool)

(assert (=> b!515706 m!496673))

(declare-fun m!496675 () Bool)

(assert (=> b!515712 m!496675))

(check-sat (not b!515706) (not b!515713) (not b!515712) (not b!515708) (not b!515711) (not start!46722) (not b!515707) (not b!515703) (not b!515709))
(check-sat)
