; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46766 () Bool)

(assert start!46766)

(declare-fun b!516502 () Bool)

(declare-fun res!316074 () Bool)

(declare-fun e!301434 () Bool)

(assert (=> b!516502 (=> res!316074 e!301434)))

(declare-datatypes ((SeekEntryResult!4374 0))(
  ( (MissingZero!4374 (index!19684 (_ BitVec 32))) (Found!4374 (index!19685 (_ BitVec 32))) (Intermediate!4374 (undefined!5186 Bool) (index!19686 (_ BitVec 32)) (x!48641 (_ BitVec 32))) (Undefined!4374) (MissingVacant!4374 (index!19687 (_ BitVec 32))) )
))
(declare-fun lt!236448 () SeekEntryResult!4374)

(get-info :version)

(assert (=> b!516502 (= res!316074 (or (undefined!5186 lt!236448) (not ((_ is Intermediate!4374) lt!236448))))))

(declare-fun b!516503 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!301431 () Bool)

(declare-datatypes ((array!33078 0))(
  ( (array!33079 (arr!15907 (Array (_ BitVec 32) (_ BitVec 64))) (size!16271 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33078)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33078 (_ BitVec 32)) SeekEntryResult!4374)

(assert (=> b!516503 (= e!301431 (= (seekEntryOrOpen!0 (select (arr!15907 a!3235) j!176) a!3235 mask!3524) (Found!4374 j!176)))))

(declare-fun b!516504 () Bool)

(declare-fun res!316067 () Bool)

(declare-fun e!301432 () Bool)

(assert (=> b!516504 (=> (not res!316067) (not e!301432))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516504 (= res!316067 (and (= (size!16271 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16271 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16271 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516505 () Bool)

(declare-fun res!316070 () Bool)

(assert (=> b!516505 (=> (not res!316070) (not e!301432))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516505 (= res!316070 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516506 () Bool)

(declare-fun res!316075 () Bool)

(declare-fun e!301430 () Bool)

(assert (=> b!516506 (=> (not res!316075) (not e!301430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33078 (_ BitVec 32)) Bool)

(assert (=> b!516506 (= res!316075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!316069 () Bool)

(assert (=> start!46766 (=> (not res!316069) (not e!301432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46766 (= res!316069 (validMask!0 mask!3524))))

(assert (=> start!46766 e!301432))

(assert (=> start!46766 true))

(declare-fun array_inv!11703 (array!33078) Bool)

(assert (=> start!46766 (array_inv!11703 a!3235)))

(declare-fun b!516507 () Bool)

(declare-fun res!316073 () Bool)

(assert (=> b!516507 (=> (not res!316073) (not e!301432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516507 (= res!316073 (validKeyInArray!0 (select (arr!15907 a!3235) j!176)))))

(declare-fun b!516508 () Bool)

(declare-fun res!316071 () Bool)

(assert (=> b!516508 (=> (not res!316071) (not e!301430))))

(declare-datatypes ((List!10065 0))(
  ( (Nil!10062) (Cons!10061 (h!10959 (_ BitVec 64)) (t!16293 List!10065)) )
))
(declare-fun arrayNoDuplicates!0 (array!33078 (_ BitVec 32) List!10065) Bool)

(assert (=> b!516508 (= res!316071 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10062))))

(declare-fun b!516509 () Bool)

(declare-fun res!316072 () Bool)

(assert (=> b!516509 (=> (not res!316072) (not e!301432))))

(assert (=> b!516509 (= res!316072 (validKeyInArray!0 k0!2280))))

(declare-fun b!516510 () Bool)

(assert (=> b!516510 (= e!301430 (not e!301434))))

(declare-fun res!316068 () Bool)

(assert (=> b!516510 (=> res!316068 e!301434)))

(declare-fun lt!236447 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33078 (_ BitVec 32)) SeekEntryResult!4374)

(assert (=> b!516510 (= res!316068 (= lt!236448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236447 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (array!33079 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)) mask!3524)))))

(declare-fun lt!236446 () (_ BitVec 32))

(assert (=> b!516510 (= lt!236448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236446 (select (arr!15907 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516510 (= lt!236447 (toIndex!0 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516510 (= lt!236446 (toIndex!0 (select (arr!15907 a!3235) j!176) mask!3524))))

(assert (=> b!516510 e!301431))

(declare-fun res!316076 () Bool)

(assert (=> b!516510 (=> (not res!316076) (not e!301431))))

(assert (=> b!516510 (= res!316076 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16006 0))(
  ( (Unit!16007) )
))
(declare-fun lt!236445 () Unit!16006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16006)

(assert (=> b!516510 (= lt!236445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516511 () Bool)

(assert (=> b!516511 (= e!301432 e!301430)))

(declare-fun res!316066 () Bool)

(assert (=> b!516511 (=> (not res!316066) (not e!301430))))

(declare-fun lt!236449 () SeekEntryResult!4374)

(assert (=> b!516511 (= res!316066 (or (= lt!236449 (MissingZero!4374 i!1204)) (= lt!236449 (MissingVacant!4374 i!1204))))))

(assert (=> b!516511 (= lt!236449 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516512 () Bool)

(assert (=> b!516512 (= e!301434 true)))

(assert (=> b!516512 (and (bvslt (x!48641 lt!236448) #b01111111111111111111111111111110) (or (= (select (arr!15907 a!3235) (index!19686 lt!236448)) (select (arr!15907 a!3235) j!176)) (= (select (arr!15907 a!3235) (index!19686 lt!236448)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15907 a!3235) (index!19686 lt!236448)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46766 res!316069) b!516504))

(assert (= (and b!516504 res!316067) b!516507))

(assert (= (and b!516507 res!316073) b!516509))

(assert (= (and b!516509 res!316072) b!516505))

(assert (= (and b!516505 res!316070) b!516511))

(assert (= (and b!516511 res!316066) b!516506))

(assert (= (and b!516506 res!316075) b!516508))

(assert (= (and b!516508 res!316071) b!516510))

(assert (= (and b!516510 res!316076) b!516503))

(assert (= (and b!516510 (not res!316068)) b!516502))

(assert (= (and b!516502 (not res!316074)) b!516512))

(declare-fun m!497999 () Bool)

(assert (=> b!516511 m!497999))

(declare-fun m!498001 () Bool)

(assert (=> b!516503 m!498001))

(assert (=> b!516503 m!498001))

(declare-fun m!498003 () Bool)

(assert (=> b!516503 m!498003))

(declare-fun m!498005 () Bool)

(assert (=> b!516512 m!498005))

(assert (=> b!516512 m!498001))

(declare-fun m!498007 () Bool)

(assert (=> b!516506 m!498007))

(declare-fun m!498009 () Bool)

(assert (=> b!516510 m!498009))

(declare-fun m!498011 () Bool)

(assert (=> b!516510 m!498011))

(assert (=> b!516510 m!498001))

(declare-fun m!498013 () Bool)

(assert (=> b!516510 m!498013))

(assert (=> b!516510 m!498001))

(declare-fun m!498015 () Bool)

(assert (=> b!516510 m!498015))

(assert (=> b!516510 m!498001))

(declare-fun m!498017 () Bool)

(assert (=> b!516510 m!498017))

(declare-fun m!498019 () Bool)

(assert (=> b!516510 m!498019))

(assert (=> b!516510 m!498011))

(declare-fun m!498021 () Bool)

(assert (=> b!516510 m!498021))

(assert (=> b!516510 m!498011))

(declare-fun m!498023 () Bool)

(assert (=> b!516510 m!498023))

(declare-fun m!498025 () Bool)

(assert (=> start!46766 m!498025))

(declare-fun m!498027 () Bool)

(assert (=> start!46766 m!498027))

(assert (=> b!516507 m!498001))

(assert (=> b!516507 m!498001))

(declare-fun m!498029 () Bool)

(assert (=> b!516507 m!498029))

(declare-fun m!498031 () Bool)

(assert (=> b!516509 m!498031))

(declare-fun m!498033 () Bool)

(assert (=> b!516508 m!498033))

(declare-fun m!498035 () Bool)

(assert (=> b!516505 m!498035))

(check-sat (not b!516508) (not b!516506) (not b!516503) (not start!46766) (not b!516507) (not b!516505) (not b!516511) (not b!516510) (not b!516509))
(check-sat)
