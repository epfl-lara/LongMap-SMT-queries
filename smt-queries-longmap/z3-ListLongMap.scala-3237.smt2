; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45218 () Bool)

(assert start!45218)

(declare-fun b!496524 () Bool)

(declare-fun res!298975 () Bool)

(declare-fun e!291152 () Bool)

(assert (=> b!496524 (=> (not res!298975) (not e!291152))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496524 (= res!298975 (validKeyInArray!0 k0!2280))))

(declare-fun e!291153 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32107 0))(
  ( (array!32108 (arr!15436 (Array (_ BitVec 32) (_ BitVec 64))) (size!15800 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32107)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!496525 () Bool)

(declare-datatypes ((SeekEntryResult!3859 0))(
  ( (MissingZero!3859 (index!17615 (_ BitVec 32))) (Found!3859 (index!17616 (_ BitVec 32))) (Intermediate!3859 (undefined!4671 Bool) (index!17617 (_ BitVec 32)) (x!46820 (_ BitVec 32))) (Undefined!3859) (MissingVacant!3859 (index!17618 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32107 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!496525 (= e!291153 (= (seekEntryOrOpen!0 (select (arr!15436 a!3235) j!176) a!3235 mask!3524) (Found!3859 j!176)))))

(declare-fun b!496526 () Bool)

(declare-fun res!298966 () Bool)

(declare-fun e!291151 () Bool)

(assert (=> b!496526 (=> (not res!298966) (not e!291151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32107 (_ BitVec 32)) Bool)

(assert (=> b!496526 (= res!298966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496527 () Bool)

(declare-fun e!291150 () Bool)

(assert (=> b!496527 (= e!291150 true)))

(declare-fun lt!224821 () SeekEntryResult!3859)

(assert (=> b!496527 (and (bvslt (x!46820 lt!224821) #b01111111111111111111111111111110) (or (= (select (arr!15436 a!3235) (index!17617 lt!224821)) (select (arr!15436 a!3235) j!176)) (= (select (arr!15436 a!3235) (index!17617 lt!224821)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15436 a!3235) (index!17617 lt!224821)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496528 () Bool)

(assert (=> b!496528 (= e!291152 e!291151)))

(declare-fun res!298972 () Bool)

(assert (=> b!496528 (=> (not res!298972) (not e!291151))))

(declare-fun lt!224822 () SeekEntryResult!3859)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496528 (= res!298972 (or (= lt!224822 (MissingZero!3859 i!1204)) (= lt!224822 (MissingVacant!3859 i!1204))))))

(assert (=> b!496528 (= lt!224822 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298968 () Bool)

(assert (=> start!45218 (=> (not res!298968) (not e!291152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45218 (= res!298968 (validMask!0 mask!3524))))

(assert (=> start!45218 e!291152))

(assert (=> start!45218 true))

(declare-fun array_inv!11295 (array!32107) Bool)

(assert (=> start!45218 (array_inv!11295 a!3235)))

(declare-fun b!496529 () Bool)

(declare-fun res!298970 () Bool)

(assert (=> b!496529 (=> (not res!298970) (not e!291152))))

(assert (=> b!496529 (= res!298970 (and (= (size!15800 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15800 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15800 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496530 () Bool)

(assert (=> b!496530 (= e!291151 (not e!291150))))

(declare-fun res!298965 () Bool)

(assert (=> b!496530 (=> res!298965 e!291150)))

(declare-fun lt!224820 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32107 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!496530 (= res!298965 (= lt!224821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224820 (select (store (arr!15436 a!3235) i!1204 k0!2280) j!176) (array!32108 (store (arr!15436 a!3235) i!1204 k0!2280) (size!15800 a!3235)) mask!3524)))))

(declare-fun lt!224823 () (_ BitVec 32))

(assert (=> b!496530 (= lt!224821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224823 (select (arr!15436 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496530 (= lt!224820 (toIndex!0 (select (store (arr!15436 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496530 (= lt!224823 (toIndex!0 (select (arr!15436 a!3235) j!176) mask!3524))))

(assert (=> b!496530 e!291153))

(declare-fun res!298974 () Bool)

(assert (=> b!496530 (=> (not res!298974) (not e!291153))))

(assert (=> b!496530 (= res!298974 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14725 0))(
  ( (Unit!14726) )
))
(declare-fun lt!224824 () Unit!14725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14725)

(assert (=> b!496530 (= lt!224824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496531 () Bool)

(declare-fun res!298967 () Bool)

(assert (=> b!496531 (=> (not res!298967) (not e!291151))))

(declare-datatypes ((List!9501 0))(
  ( (Nil!9498) (Cons!9497 (h!10368 (_ BitVec 64)) (t!15721 List!9501)) )
))
(declare-fun arrayNoDuplicates!0 (array!32107 (_ BitVec 32) List!9501) Bool)

(assert (=> b!496531 (= res!298967 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9498))))

(declare-fun b!496532 () Bool)

(declare-fun res!298969 () Bool)

(assert (=> b!496532 (=> (not res!298969) (not e!291152))))

(assert (=> b!496532 (= res!298969 (validKeyInArray!0 (select (arr!15436 a!3235) j!176)))))

(declare-fun b!496533 () Bool)

(declare-fun res!298971 () Bool)

(assert (=> b!496533 (=> (not res!298971) (not e!291152))))

(declare-fun arrayContainsKey!0 (array!32107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496533 (= res!298971 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496534 () Bool)

(declare-fun res!298973 () Bool)

(assert (=> b!496534 (=> res!298973 e!291150)))

(get-info :version)

(assert (=> b!496534 (= res!298973 (or (undefined!4671 lt!224821) (not ((_ is Intermediate!3859) lt!224821))))))

(assert (= (and start!45218 res!298968) b!496529))

(assert (= (and b!496529 res!298970) b!496532))

(assert (= (and b!496532 res!298969) b!496524))

(assert (= (and b!496524 res!298975) b!496533))

(assert (= (and b!496533 res!298971) b!496528))

(assert (= (and b!496528 res!298972) b!496526))

(assert (= (and b!496526 res!298966) b!496531))

(assert (= (and b!496531 res!298967) b!496530))

(assert (= (and b!496530 res!298974) b!496525))

(assert (= (and b!496530 (not res!298965)) b!496534))

(assert (= (and b!496534 (not res!298973)) b!496527))

(declare-fun m!478027 () Bool)

(assert (=> b!496532 m!478027))

(assert (=> b!496532 m!478027))

(declare-fun m!478029 () Bool)

(assert (=> b!496532 m!478029))

(assert (=> b!496530 m!478027))

(declare-fun m!478031 () Bool)

(assert (=> b!496530 m!478031))

(declare-fun m!478033 () Bool)

(assert (=> b!496530 m!478033))

(declare-fun m!478035 () Bool)

(assert (=> b!496530 m!478035))

(declare-fun m!478037 () Bool)

(assert (=> b!496530 m!478037))

(assert (=> b!496530 m!478027))

(declare-fun m!478039 () Bool)

(assert (=> b!496530 m!478039))

(assert (=> b!496530 m!478027))

(declare-fun m!478041 () Bool)

(assert (=> b!496530 m!478041))

(assert (=> b!496530 m!478037))

(declare-fun m!478043 () Bool)

(assert (=> b!496530 m!478043))

(assert (=> b!496530 m!478037))

(declare-fun m!478045 () Bool)

(assert (=> b!496530 m!478045))

(declare-fun m!478047 () Bool)

(assert (=> b!496526 m!478047))

(declare-fun m!478049 () Bool)

(assert (=> b!496528 m!478049))

(declare-fun m!478051 () Bool)

(assert (=> b!496527 m!478051))

(assert (=> b!496527 m!478027))

(declare-fun m!478053 () Bool)

(assert (=> b!496533 m!478053))

(declare-fun m!478055 () Bool)

(assert (=> b!496524 m!478055))

(declare-fun m!478057 () Bool)

(assert (=> start!45218 m!478057))

(declare-fun m!478059 () Bool)

(assert (=> start!45218 m!478059))

(assert (=> b!496525 m!478027))

(assert (=> b!496525 m!478027))

(declare-fun m!478061 () Bool)

(assert (=> b!496525 m!478061))

(declare-fun m!478063 () Bool)

(assert (=> b!496531 m!478063))

(check-sat (not b!496530) (not b!496528) (not b!496524) (not start!45218) (not b!496533) (not b!496526) (not b!496532) (not b!496531) (not b!496525))
(check-sat)
