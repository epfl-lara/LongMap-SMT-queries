; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45212 () Bool)

(assert start!45212)

(declare-fun b!496425 () Bool)

(declare-fun res!298867 () Bool)

(declare-fun e!291106 () Bool)

(assert (=> b!496425 (=> (not res!298867) (not e!291106))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496425 (= res!298867 (validKeyInArray!0 k0!2280))))

(declare-fun b!496426 () Bool)

(declare-fun e!291104 () Bool)

(declare-fun e!291108 () Bool)

(assert (=> b!496426 (= e!291104 (not e!291108))))

(declare-fun res!298868 () Bool)

(assert (=> b!496426 (=> res!298868 e!291108)))

(declare-fun lt!224779 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32101 0))(
  ( (array!32102 (arr!15433 (Array (_ BitVec 32) (_ BitVec 64))) (size!15797 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32101)

(declare-datatypes ((SeekEntryResult!3856 0))(
  ( (MissingZero!3856 (index!17603 (_ BitVec 32))) (Found!3856 (index!17604 (_ BitVec 32))) (Intermediate!3856 (undefined!4668 Bool) (index!17605 (_ BitVec 32)) (x!46809 (_ BitVec 32))) (Undefined!3856) (MissingVacant!3856 (index!17606 (_ BitVec 32))) )
))
(declare-fun lt!224777 () SeekEntryResult!3856)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32101 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!496426 (= res!298868 (= lt!224777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224779 (select (store (arr!15433 a!3235) i!1204 k0!2280) j!176) (array!32102 (store (arr!15433 a!3235) i!1204 k0!2280) (size!15797 a!3235)) mask!3524)))))

(declare-fun lt!224776 () (_ BitVec 32))

(assert (=> b!496426 (= lt!224777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224776 (select (arr!15433 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496426 (= lt!224779 (toIndex!0 (select (store (arr!15433 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496426 (= lt!224776 (toIndex!0 (select (arr!15433 a!3235) j!176) mask!3524))))

(declare-fun e!291105 () Bool)

(assert (=> b!496426 e!291105))

(declare-fun res!298871 () Bool)

(assert (=> b!496426 (=> (not res!298871) (not e!291105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32101 (_ BitVec 32)) Bool)

(assert (=> b!496426 (= res!298871 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14719 0))(
  ( (Unit!14720) )
))
(declare-fun lt!224778 () Unit!14719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14719)

(assert (=> b!496426 (= lt!224778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496427 () Bool)

(declare-fun res!298876 () Bool)

(assert (=> b!496427 (=> (not res!298876) (not e!291104))))

(declare-datatypes ((List!9498 0))(
  ( (Nil!9495) (Cons!9494 (h!10365 (_ BitVec 64)) (t!15718 List!9498)) )
))
(declare-fun arrayNoDuplicates!0 (array!32101 (_ BitVec 32) List!9498) Bool)

(assert (=> b!496427 (= res!298876 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9495))))

(declare-fun b!496429 () Bool)

(assert (=> b!496429 (= e!291108 true)))

(assert (=> b!496429 (and (bvslt (x!46809 lt!224777) #b01111111111111111111111111111110) (or (= (select (arr!15433 a!3235) (index!17605 lt!224777)) (select (arr!15433 a!3235) j!176)) (= (select (arr!15433 a!3235) (index!17605 lt!224777)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15433 a!3235) (index!17605 lt!224777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496430 () Bool)

(declare-fun res!298869 () Bool)

(assert (=> b!496430 (=> (not res!298869) (not e!291104))))

(assert (=> b!496430 (= res!298869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496431 () Bool)

(declare-fun res!298872 () Bool)

(assert (=> b!496431 (=> (not res!298872) (not e!291106))))

(assert (=> b!496431 (= res!298872 (validKeyInArray!0 (select (arr!15433 a!3235) j!176)))))

(declare-fun b!496432 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32101 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!496432 (= e!291105 (= (seekEntryOrOpen!0 (select (arr!15433 a!3235) j!176) a!3235 mask!3524) (Found!3856 j!176)))))

(declare-fun b!496433 () Bool)

(declare-fun res!298874 () Bool)

(assert (=> b!496433 (=> (not res!298874) (not e!291106))))

(declare-fun arrayContainsKey!0 (array!32101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496433 (= res!298874 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496434 () Bool)

(declare-fun res!298866 () Bool)

(assert (=> b!496434 (=> res!298866 e!291108)))

(get-info :version)

(assert (=> b!496434 (= res!298866 (or (undefined!4668 lt!224777) (not ((_ is Intermediate!3856) lt!224777))))))

(declare-fun b!496435 () Bool)

(declare-fun res!298873 () Bool)

(assert (=> b!496435 (=> (not res!298873) (not e!291106))))

(assert (=> b!496435 (= res!298873 (and (= (size!15797 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15797 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15797 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496428 () Bool)

(assert (=> b!496428 (= e!291106 e!291104)))

(declare-fun res!298875 () Bool)

(assert (=> b!496428 (=> (not res!298875) (not e!291104))))

(declare-fun lt!224775 () SeekEntryResult!3856)

(assert (=> b!496428 (= res!298875 (or (= lt!224775 (MissingZero!3856 i!1204)) (= lt!224775 (MissingVacant!3856 i!1204))))))

(assert (=> b!496428 (= lt!224775 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298870 () Bool)

(assert (=> start!45212 (=> (not res!298870) (not e!291106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45212 (= res!298870 (validMask!0 mask!3524))))

(assert (=> start!45212 e!291106))

(assert (=> start!45212 true))

(declare-fun array_inv!11292 (array!32101) Bool)

(assert (=> start!45212 (array_inv!11292 a!3235)))

(assert (= (and start!45212 res!298870) b!496435))

(assert (= (and b!496435 res!298873) b!496431))

(assert (= (and b!496431 res!298872) b!496425))

(assert (= (and b!496425 res!298867) b!496433))

(assert (= (and b!496433 res!298874) b!496428))

(assert (= (and b!496428 res!298875) b!496430))

(assert (= (and b!496430 res!298869) b!496427))

(assert (= (and b!496427 res!298876) b!496426))

(assert (= (and b!496426 res!298871) b!496432))

(assert (= (and b!496426 (not res!298868)) b!496434))

(assert (= (and b!496434 (not res!298866)) b!496429))

(declare-fun m!477913 () Bool)

(assert (=> start!45212 m!477913))

(declare-fun m!477915 () Bool)

(assert (=> start!45212 m!477915))

(declare-fun m!477917 () Bool)

(assert (=> b!496426 m!477917))

(declare-fun m!477919 () Bool)

(assert (=> b!496426 m!477919))

(declare-fun m!477921 () Bool)

(assert (=> b!496426 m!477921))

(declare-fun m!477923 () Bool)

(assert (=> b!496426 m!477923))

(declare-fun m!477925 () Bool)

(assert (=> b!496426 m!477925))

(assert (=> b!496426 m!477919))

(declare-fun m!477927 () Bool)

(assert (=> b!496426 m!477927))

(assert (=> b!496426 m!477919))

(assert (=> b!496426 m!477925))

(declare-fun m!477929 () Bool)

(assert (=> b!496426 m!477929))

(declare-fun m!477931 () Bool)

(assert (=> b!496426 m!477931))

(assert (=> b!496426 m!477925))

(declare-fun m!477933 () Bool)

(assert (=> b!496426 m!477933))

(assert (=> b!496432 m!477919))

(assert (=> b!496432 m!477919))

(declare-fun m!477935 () Bool)

(assert (=> b!496432 m!477935))

(declare-fun m!477937 () Bool)

(assert (=> b!496429 m!477937))

(assert (=> b!496429 m!477919))

(declare-fun m!477939 () Bool)

(assert (=> b!496427 m!477939))

(declare-fun m!477941 () Bool)

(assert (=> b!496428 m!477941))

(assert (=> b!496431 m!477919))

(assert (=> b!496431 m!477919))

(declare-fun m!477943 () Bool)

(assert (=> b!496431 m!477943))

(declare-fun m!477945 () Bool)

(assert (=> b!496430 m!477945))

(declare-fun m!477947 () Bool)

(assert (=> b!496425 m!477947))

(declare-fun m!477949 () Bool)

(assert (=> b!496433 m!477949))

(check-sat (not b!496432) (not b!496428) (not b!496433) (not b!496427) (not b!496431) (not b!496426) (not start!45212) (not b!496425) (not b!496430))
(check-sat)
