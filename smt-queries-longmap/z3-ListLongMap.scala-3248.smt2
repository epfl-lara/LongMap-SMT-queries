; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45350 () Bool)

(assert start!45350)

(declare-fun b!498003 () Bool)

(declare-fun res!300209 () Bool)

(declare-fun e!291899 () Bool)

(assert (=> b!498003 (=> (not res!300209) (not e!291899))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498003 (= res!300209 (validKeyInArray!0 k0!2280))))

(declare-fun b!498004 () Bool)

(declare-datatypes ((Unit!14803 0))(
  ( (Unit!14804) )
))
(declare-fun e!291898 () Unit!14803)

(declare-fun Unit!14805 () Unit!14803)

(assert (=> b!498004 (= e!291898 Unit!14805)))

(declare-fun lt!225550 () Unit!14803)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225545 () (_ BitVec 32))

(declare-datatypes ((array!32176 0))(
  ( (array!32177 (arr!15469 (Array (_ BitVec 32) (_ BitVec 64))) (size!15833 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32176)

(declare-datatypes ((SeekEntryResult!3892 0))(
  ( (MissingZero!3892 (index!17750 (_ BitVec 32))) (Found!3892 (index!17751 (_ BitVec 32))) (Intermediate!3892 (undefined!4704 Bool) (index!17752 (_ BitVec 32)) (x!46950 (_ BitVec 32))) (Undefined!3892) (MissingVacant!3892 (index!17753 (_ BitVec 32))) )
))
(declare-fun lt!225548 () SeekEntryResult!3892)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14803)

(assert (=> b!498004 (= lt!225550 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225545 #b00000000000000000000000000000000 (index!17752 lt!225548) (x!46950 lt!225548) mask!3524))))

(declare-fun lt!225541 () array!32176)

(declare-fun res!300211 () Bool)

(declare-fun lt!225542 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32176 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!498004 (= res!300211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225545 lt!225542 lt!225541 mask!3524) (Intermediate!3892 false (index!17752 lt!225548) (x!46950 lt!225548))))))

(declare-fun e!291897 () Bool)

(assert (=> b!498004 (=> (not res!300211) (not e!291897))))

(assert (=> b!498004 e!291897))

(declare-fun e!291900 () Bool)

(declare-fun b!498005 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32176 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!498005 (= e!291900 (= (seekEntryOrOpen!0 (select (arr!15469 a!3235) j!176) a!3235 mask!3524) (Found!3892 j!176)))))

(declare-fun b!498006 () Bool)

(declare-fun res!300205 () Bool)

(assert (=> b!498006 (=> (not res!300205) (not e!291899))))

(assert (=> b!498006 (= res!300205 (validKeyInArray!0 (select (arr!15469 a!3235) j!176)))))

(declare-fun b!498007 () Bool)

(declare-fun e!291903 () Bool)

(declare-fun e!291896 () Bool)

(assert (=> b!498007 (= e!291903 (not e!291896))))

(declare-fun res!300202 () Bool)

(assert (=> b!498007 (=> res!300202 e!291896)))

(declare-fun lt!225543 () (_ BitVec 32))

(assert (=> b!498007 (= res!300202 (= lt!225548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225543 lt!225542 lt!225541 mask!3524)))))

(assert (=> b!498007 (= lt!225548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225545 (select (arr!15469 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498007 (= lt!225543 (toIndex!0 lt!225542 mask!3524))))

(assert (=> b!498007 (= lt!225542 (select (store (arr!15469 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498007 (= lt!225545 (toIndex!0 (select (arr!15469 a!3235) j!176) mask!3524))))

(assert (=> b!498007 (= lt!225541 (array!32177 (store (arr!15469 a!3235) i!1204 k0!2280) (size!15833 a!3235)))))

(assert (=> b!498007 e!291900))

(declare-fun res!300214 () Bool)

(assert (=> b!498007 (=> (not res!300214) (not e!291900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32176 (_ BitVec 32)) Bool)

(assert (=> b!498007 (= res!300214 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225546 () Unit!14803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14803)

(assert (=> b!498007 (= lt!225546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498008 () Bool)

(declare-fun e!291901 () Bool)

(assert (=> b!498008 (= e!291901 true)))

(declare-fun lt!225547 () SeekEntryResult!3892)

(assert (=> b!498008 (= lt!225547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225545 lt!225542 lt!225541 mask!3524))))

(declare-fun b!498009 () Bool)

(declare-fun Unit!14806 () Unit!14803)

(assert (=> b!498009 (= e!291898 Unit!14806)))

(declare-fun b!498010 () Bool)

(declare-fun res!300203 () Bool)

(assert (=> b!498010 (=> (not res!300203) (not e!291899))))

(declare-fun arrayContainsKey!0 (array!32176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498010 (= res!300203 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498011 () Bool)

(declare-fun res!300206 () Bool)

(assert (=> b!498011 (=> (not res!300206) (not e!291903))))

(declare-datatypes ((List!9534 0))(
  ( (Nil!9531) (Cons!9530 (h!10404 (_ BitVec 64)) (t!15754 List!9534)) )
))
(declare-fun arrayNoDuplicates!0 (array!32176 (_ BitVec 32) List!9534) Bool)

(assert (=> b!498011 (= res!300206 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9531))))

(declare-fun b!498012 () Bool)

(assert (=> b!498012 (= e!291899 e!291903)))

(declare-fun res!300212 () Bool)

(assert (=> b!498012 (=> (not res!300212) (not e!291903))))

(declare-fun lt!225549 () SeekEntryResult!3892)

(assert (=> b!498012 (= res!300212 (or (= lt!225549 (MissingZero!3892 i!1204)) (= lt!225549 (MissingVacant!3892 i!1204))))))

(assert (=> b!498012 (= lt!225549 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498013 () Bool)

(declare-fun res!300207 () Bool)

(assert (=> b!498013 (=> (not res!300207) (not e!291899))))

(assert (=> b!498013 (= res!300207 (and (= (size!15833 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15833 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15833 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!300204 () Bool)

(assert (=> start!45350 (=> (not res!300204) (not e!291899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45350 (= res!300204 (validMask!0 mask!3524))))

(assert (=> start!45350 e!291899))

(assert (=> start!45350 true))

(declare-fun array_inv!11328 (array!32176) Bool)

(assert (=> start!45350 (array_inv!11328 a!3235)))

(declare-fun b!498002 () Bool)

(declare-fun res!300210 () Bool)

(assert (=> b!498002 (=> (not res!300210) (not e!291903))))

(assert (=> b!498002 (= res!300210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498014 () Bool)

(declare-fun res!300208 () Bool)

(assert (=> b!498014 (=> res!300208 e!291896)))

(get-info :version)

(assert (=> b!498014 (= res!300208 (or (undefined!4704 lt!225548) (not ((_ is Intermediate!3892) lt!225548))))))

(declare-fun b!498015 () Bool)

(assert (=> b!498015 (= e!291897 false)))

(declare-fun b!498016 () Bool)

(assert (=> b!498016 (= e!291896 e!291901)))

(declare-fun res!300213 () Bool)

(assert (=> b!498016 (=> res!300213 e!291901)))

(assert (=> b!498016 (= res!300213 (or (bvsgt #b00000000000000000000000000000000 (x!46950 lt!225548)) (bvsgt (x!46950 lt!225548) #b01111111111111111111111111111110) (bvslt lt!225545 #b00000000000000000000000000000000) (bvsge lt!225545 (size!15833 a!3235)) (bvslt (index!17752 lt!225548) #b00000000000000000000000000000000) (bvsge (index!17752 lt!225548) (size!15833 a!3235)) (not (= lt!225548 (Intermediate!3892 false (index!17752 lt!225548) (x!46950 lt!225548))))))))

(assert (=> b!498016 (and (or (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225544 () Unit!14803)

(assert (=> b!498016 (= lt!225544 e!291898)))

(declare-fun c!59177 () Bool)

(assert (=> b!498016 (= c!59177 (= (select (arr!15469 a!3235) (index!17752 lt!225548)) (select (arr!15469 a!3235) j!176)))))

(assert (=> b!498016 (and (bvslt (x!46950 lt!225548) #b01111111111111111111111111111110) (or (= (select (arr!15469 a!3235) (index!17752 lt!225548)) (select (arr!15469 a!3235) j!176)) (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15469 a!3235) (index!17752 lt!225548)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45350 res!300204) b!498013))

(assert (= (and b!498013 res!300207) b!498006))

(assert (= (and b!498006 res!300205) b!498003))

(assert (= (and b!498003 res!300209) b!498010))

(assert (= (and b!498010 res!300203) b!498012))

(assert (= (and b!498012 res!300212) b!498002))

(assert (= (and b!498002 res!300210) b!498011))

(assert (= (and b!498011 res!300206) b!498007))

(assert (= (and b!498007 res!300214) b!498005))

(assert (= (and b!498007 (not res!300202)) b!498014))

(assert (= (and b!498014 (not res!300208)) b!498016))

(assert (= (and b!498016 c!59177) b!498004))

(assert (= (and b!498016 (not c!59177)) b!498009))

(assert (= (and b!498004 res!300211) b!498015))

(assert (= (and b!498016 (not res!300213)) b!498008))

(declare-fun m!479539 () Bool)

(assert (=> b!498006 m!479539))

(assert (=> b!498006 m!479539))

(declare-fun m!479541 () Bool)

(assert (=> b!498006 m!479541))

(declare-fun m!479543 () Bool)

(assert (=> b!498016 m!479543))

(assert (=> b!498016 m!479539))

(declare-fun m!479545 () Bool)

(assert (=> b!498007 m!479545))

(declare-fun m!479547 () Bool)

(assert (=> b!498007 m!479547))

(assert (=> b!498007 m!479539))

(declare-fun m!479549 () Bool)

(assert (=> b!498007 m!479549))

(declare-fun m!479551 () Bool)

(assert (=> b!498007 m!479551))

(declare-fun m!479553 () Bool)

(assert (=> b!498007 m!479553))

(declare-fun m!479555 () Bool)

(assert (=> b!498007 m!479555))

(declare-fun m!479557 () Bool)

(assert (=> b!498007 m!479557))

(assert (=> b!498007 m!479539))

(declare-fun m!479559 () Bool)

(assert (=> b!498007 m!479559))

(assert (=> b!498007 m!479539))

(declare-fun m!479561 () Bool)

(assert (=> b!498004 m!479561))

(declare-fun m!479563 () Bool)

(assert (=> b!498004 m!479563))

(declare-fun m!479565 () Bool)

(assert (=> b!498011 m!479565))

(assert (=> b!498008 m!479563))

(declare-fun m!479567 () Bool)

(assert (=> b!498012 m!479567))

(assert (=> b!498005 m!479539))

(assert (=> b!498005 m!479539))

(declare-fun m!479569 () Bool)

(assert (=> b!498005 m!479569))

(declare-fun m!479571 () Bool)

(assert (=> b!498002 m!479571))

(declare-fun m!479573 () Bool)

(assert (=> b!498010 m!479573))

(declare-fun m!479575 () Bool)

(assert (=> start!45350 m!479575))

(declare-fun m!479577 () Bool)

(assert (=> start!45350 m!479577))

(declare-fun m!479579 () Bool)

(assert (=> b!498003 m!479579))

(check-sat (not b!498012) (not b!498004) (not b!498005) (not b!498007) (not b!498010) (not start!45350) (not b!498008) (not b!498002) (not b!498006) (not b!498011) (not b!498003))
(check-sat)
