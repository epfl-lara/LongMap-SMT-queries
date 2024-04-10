; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45380 () Bool)

(assert start!45380)

(declare-fun b!498513 () Bool)

(declare-fun e!292177 () Bool)

(declare-fun e!292181 () Bool)

(assert (=> b!498513 (= e!292177 e!292181)))

(declare-fun res!300608 () Bool)

(assert (=> b!498513 (=> (not res!300608) (not e!292181))))

(declare-datatypes ((SeekEntryResult!3951 0))(
  ( (MissingZero!3951 (index!17986 (_ BitVec 32))) (Found!3951 (index!17987 (_ BitVec 32))) (Intermediate!3951 (undefined!4763 Bool) (index!17988 (_ BitVec 32)) (x!47036 (_ BitVec 32))) (Undefined!3951) (MissingVacant!3951 (index!17989 (_ BitVec 32))) )
))
(declare-fun lt!225835 () SeekEntryResult!3951)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498513 (= res!300608 (or (= lt!225835 (MissingZero!3951 i!1204)) (= lt!225835 (MissingVacant!3951 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32205 0))(
  ( (array!32206 (arr!15484 (Array (_ BitVec 32) (_ BitVec 64))) (size!15848 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32205)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32205 (_ BitVec 32)) SeekEntryResult!3951)

(assert (=> b!498513 (= lt!225835 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!300601 () Bool)

(assert (=> start!45380 (=> (not res!300601) (not e!292177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45380 (= res!300601 (validMask!0 mask!3524))))

(assert (=> start!45380 e!292177))

(assert (=> start!45380 true))

(declare-fun array_inv!11280 (array!32205) Bool)

(assert (=> start!45380 (array_inv!11280 a!3235)))

(declare-fun b!498514 () Bool)

(declare-fun e!292179 () Bool)

(declare-fun e!292178 () Bool)

(assert (=> b!498514 (= e!292179 e!292178)))

(declare-fun res!300603 () Bool)

(assert (=> b!498514 (=> res!300603 e!292178)))

(declare-fun lt!225838 () SeekEntryResult!3951)

(declare-fun lt!225829 () (_ BitVec 32))

(assert (=> b!498514 (= res!300603 (or (bvsgt #b00000000000000000000000000000000 (x!47036 lt!225838)) (bvsgt (x!47036 lt!225838) #b01111111111111111111111111111110) (bvslt lt!225829 #b00000000000000000000000000000000) (bvsge lt!225829 (size!15848 a!3235)) (bvslt (index!17988 lt!225838) #b00000000000000000000000000000000) (bvsge (index!17988 lt!225838) (size!15848 a!3235)) (not (= lt!225838 (Intermediate!3951 false (index!17988 lt!225838) (x!47036 lt!225838))))))))

(assert (=> b!498514 (and (or (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14880 0))(
  ( (Unit!14881) )
))
(declare-fun lt!225830 () Unit!14880)

(declare-fun e!292180 () Unit!14880)

(assert (=> b!498514 (= lt!225830 e!292180)))

(declare-fun c!59234 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498514 (= c!59234 (= (select (arr!15484 a!3235) (index!17988 lt!225838)) (select (arr!15484 a!3235) j!176)))))

(assert (=> b!498514 (and (bvslt (x!47036 lt!225838) #b01111111111111111111111111111110) (or (= (select (arr!15484 a!3235) (index!17988 lt!225838)) (select (arr!15484 a!3235) j!176)) (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15484 a!3235) (index!17988 lt!225838)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498515 () Bool)

(declare-fun res!300610 () Bool)

(assert (=> b!498515 (=> (not res!300610) (not e!292181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32205 (_ BitVec 32)) Bool)

(assert (=> b!498515 (= res!300610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498516 () Bool)

(assert (=> b!498516 (= e!292181 (not e!292179))))

(declare-fun res!300607 () Bool)

(assert (=> b!498516 (=> res!300607 e!292179)))

(declare-fun lt!225834 () (_ BitVec 64))

(declare-fun lt!225831 () array!32205)

(declare-fun lt!225836 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32205 (_ BitVec 32)) SeekEntryResult!3951)

(assert (=> b!498516 (= res!300607 (= lt!225838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225836 lt!225834 lt!225831 mask!3524)))))

(assert (=> b!498516 (= lt!225838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225829 (select (arr!15484 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498516 (= lt!225836 (toIndex!0 lt!225834 mask!3524))))

(assert (=> b!498516 (= lt!225834 (select (store (arr!15484 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498516 (= lt!225829 (toIndex!0 (select (arr!15484 a!3235) j!176) mask!3524))))

(assert (=> b!498516 (= lt!225831 (array!32206 (store (arr!15484 a!3235) i!1204 k0!2280) (size!15848 a!3235)))))

(declare-fun e!292176 () Bool)

(assert (=> b!498516 e!292176))

(declare-fun res!300602 () Bool)

(assert (=> b!498516 (=> (not res!300602) (not e!292176))))

(assert (=> b!498516 (= res!300602 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225837 () Unit!14880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14880)

(assert (=> b!498516 (= lt!225837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498517 () Bool)

(declare-fun e!292182 () Bool)

(assert (=> b!498517 (= e!292182 false)))

(declare-fun b!498518 () Bool)

(declare-fun Unit!14882 () Unit!14880)

(assert (=> b!498518 (= e!292180 Unit!14882)))

(declare-fun b!498519 () Bool)

(declare-fun Unit!14883 () Unit!14880)

(assert (=> b!498519 (= e!292180 Unit!14883)))

(declare-fun lt!225833 () Unit!14880)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14880)

(assert (=> b!498519 (= lt!225833 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225829 #b00000000000000000000000000000000 (index!17988 lt!225838) (x!47036 lt!225838) mask!3524))))

(declare-fun res!300604 () Bool)

(assert (=> b!498519 (= res!300604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225829 lt!225834 lt!225831 mask!3524) (Intermediate!3951 false (index!17988 lt!225838) (x!47036 lt!225838))))))

(assert (=> b!498519 (=> (not res!300604) (not e!292182))))

(assert (=> b!498519 e!292182))

(declare-fun b!498520 () Bool)

(assert (=> b!498520 (= e!292178 true)))

(declare-fun lt!225832 () SeekEntryResult!3951)

(assert (=> b!498520 (= lt!225832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225829 lt!225834 lt!225831 mask!3524))))

(declare-fun b!498521 () Bool)

(declare-fun res!300605 () Bool)

(assert (=> b!498521 (=> (not res!300605) (not e!292181))))

(declare-datatypes ((List!9642 0))(
  ( (Nil!9639) (Cons!9638 (h!10512 (_ BitVec 64)) (t!15870 List!9642)) )
))
(declare-fun arrayNoDuplicates!0 (array!32205 (_ BitVec 32) List!9642) Bool)

(assert (=> b!498521 (= res!300605 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9639))))

(declare-fun b!498522 () Bool)

(declare-fun res!300600 () Bool)

(assert (=> b!498522 (=> (not res!300600) (not e!292177))))

(declare-fun arrayContainsKey!0 (array!32205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498522 (= res!300600 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498523 () Bool)

(declare-fun res!300609 () Bool)

(assert (=> b!498523 (=> (not res!300609) (not e!292177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498523 (= res!300609 (validKeyInArray!0 (select (arr!15484 a!3235) j!176)))))

(declare-fun b!498524 () Bool)

(declare-fun res!300599 () Bool)

(assert (=> b!498524 (=> (not res!300599) (not e!292177))))

(assert (=> b!498524 (= res!300599 (and (= (size!15848 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15848 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15848 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498525 () Bool)

(declare-fun res!300611 () Bool)

(assert (=> b!498525 (=> res!300611 e!292179)))

(get-info :version)

(assert (=> b!498525 (= res!300611 (or (undefined!4763 lt!225838) (not ((_ is Intermediate!3951) lt!225838))))))

(declare-fun b!498526 () Bool)

(assert (=> b!498526 (= e!292176 (= (seekEntryOrOpen!0 (select (arr!15484 a!3235) j!176) a!3235 mask!3524) (Found!3951 j!176)))))

(declare-fun b!498527 () Bool)

(declare-fun res!300606 () Bool)

(assert (=> b!498527 (=> (not res!300606) (not e!292177))))

(assert (=> b!498527 (= res!300606 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45380 res!300601) b!498524))

(assert (= (and b!498524 res!300599) b!498523))

(assert (= (and b!498523 res!300609) b!498527))

(assert (= (and b!498527 res!300606) b!498522))

(assert (= (and b!498522 res!300600) b!498513))

(assert (= (and b!498513 res!300608) b!498515))

(assert (= (and b!498515 res!300610) b!498521))

(assert (= (and b!498521 res!300605) b!498516))

(assert (= (and b!498516 res!300602) b!498526))

(assert (= (and b!498516 (not res!300607)) b!498525))

(assert (= (and b!498525 (not res!300611)) b!498514))

(assert (= (and b!498514 c!59234) b!498519))

(assert (= (and b!498514 (not c!59234)) b!498518))

(assert (= (and b!498519 res!300604) b!498517))

(assert (= (and b!498514 (not res!300603)) b!498520))

(declare-fun m!479775 () Bool)

(assert (=> b!498515 m!479775))

(declare-fun m!479777 () Bool)

(assert (=> b!498527 m!479777))

(declare-fun m!479779 () Bool)

(assert (=> b!498519 m!479779))

(declare-fun m!479781 () Bool)

(assert (=> b!498519 m!479781))

(declare-fun m!479783 () Bool)

(assert (=> b!498523 m!479783))

(assert (=> b!498523 m!479783))

(declare-fun m!479785 () Bool)

(assert (=> b!498523 m!479785))

(assert (=> b!498520 m!479781))

(assert (=> b!498526 m!479783))

(assert (=> b!498526 m!479783))

(declare-fun m!479787 () Bool)

(assert (=> b!498526 m!479787))

(declare-fun m!479789 () Bool)

(assert (=> start!45380 m!479789))

(declare-fun m!479791 () Bool)

(assert (=> start!45380 m!479791))

(declare-fun m!479793 () Bool)

(assert (=> b!498514 m!479793))

(assert (=> b!498514 m!479783))

(declare-fun m!479795 () Bool)

(assert (=> b!498522 m!479795))

(declare-fun m!479797 () Bool)

(assert (=> b!498513 m!479797))

(declare-fun m!479799 () Bool)

(assert (=> b!498516 m!479799))

(declare-fun m!479801 () Bool)

(assert (=> b!498516 m!479801))

(declare-fun m!479803 () Bool)

(assert (=> b!498516 m!479803))

(assert (=> b!498516 m!479783))

(declare-fun m!479805 () Bool)

(assert (=> b!498516 m!479805))

(assert (=> b!498516 m!479783))

(declare-fun m!479807 () Bool)

(assert (=> b!498516 m!479807))

(assert (=> b!498516 m!479783))

(declare-fun m!479809 () Bool)

(assert (=> b!498516 m!479809))

(declare-fun m!479811 () Bool)

(assert (=> b!498516 m!479811))

(declare-fun m!479813 () Bool)

(assert (=> b!498516 m!479813))

(declare-fun m!479815 () Bool)

(assert (=> b!498521 m!479815))

(check-sat (not b!498526) (not b!498519) (not b!498520) (not b!498516) (not b!498515) (not b!498523) (not b!498522) (not b!498521) (not b!498513) (not start!45380) (not b!498527))
(check-sat)
