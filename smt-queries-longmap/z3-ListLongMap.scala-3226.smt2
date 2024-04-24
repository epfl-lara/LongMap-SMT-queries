; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45152 () Bool)

(assert start!45152)

(declare-fun b!495435 () Bool)

(declare-fun res!297876 () Bool)

(declare-fun e!290656 () Bool)

(assert (=> b!495435 (=> (not res!297876) (not e!290656))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32041 0))(
  ( (array!32042 (arr!15403 (Array (_ BitVec 32) (_ BitVec 64))) (size!15767 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32041)

(assert (=> b!495435 (= res!297876 (and (= (size!15767 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15767 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15767 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297877 () Bool)

(assert (=> start!45152 (=> (not res!297877) (not e!290656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45152 (= res!297877 (validMask!0 mask!3524))))

(assert (=> start!45152 e!290656))

(assert (=> start!45152 true))

(declare-fun array_inv!11262 (array!32041) Bool)

(assert (=> start!45152 (array_inv!11262 a!3235)))

(declare-fun b!495436 () Bool)

(declare-fun res!297878 () Bool)

(assert (=> b!495436 (=> (not res!297878) (not e!290656))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495436 (= res!297878 (validKeyInArray!0 k0!2280))))

(declare-fun b!495437 () Bool)

(declare-fun res!297881 () Bool)

(declare-fun e!290654 () Bool)

(assert (=> b!495437 (=> res!297881 e!290654)))

(declare-datatypes ((SeekEntryResult!3826 0))(
  ( (MissingZero!3826 (index!17483 (_ BitVec 32))) (Found!3826 (index!17484 (_ BitVec 32))) (Intermediate!3826 (undefined!4638 Bool) (index!17485 (_ BitVec 32)) (x!46699 (_ BitVec 32))) (Undefined!3826) (MissingVacant!3826 (index!17486 (_ BitVec 32))) )
))
(declare-fun lt!224327 () SeekEntryResult!3826)

(get-info :version)

(assert (=> b!495437 (= res!297881 (or (undefined!4638 lt!224327) (not ((_ is Intermediate!3826) lt!224327))))))

(declare-fun b!495438 () Bool)

(declare-fun res!297883 () Bool)

(declare-fun e!290657 () Bool)

(assert (=> b!495438 (=> (not res!297883) (not e!290657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32041 (_ BitVec 32)) Bool)

(assert (=> b!495438 (= res!297883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495439 () Bool)

(declare-fun res!297885 () Bool)

(assert (=> b!495439 (=> (not res!297885) (not e!290656))))

(assert (=> b!495439 (= res!297885 (validKeyInArray!0 (select (arr!15403 a!3235) j!176)))))

(declare-fun b!495440 () Bool)

(assert (=> b!495440 (= e!290656 e!290657)))

(declare-fun res!297879 () Bool)

(assert (=> b!495440 (=> (not res!297879) (not e!290657))))

(declare-fun lt!224329 () SeekEntryResult!3826)

(assert (=> b!495440 (= res!297879 (or (= lt!224329 (MissingZero!3826 i!1204)) (= lt!224329 (MissingVacant!3826 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32041 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!495440 (= lt!224329 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495441 () Bool)

(assert (=> b!495441 (= e!290657 (not e!290654))))

(declare-fun res!297884 () Bool)

(assert (=> b!495441 (=> res!297884 e!290654)))

(declare-fun lt!224326 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32041 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!495441 (= res!297884 (= lt!224327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224326 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) (array!32042 (store (arr!15403 a!3235) i!1204 k0!2280) (size!15767 a!3235)) mask!3524)))))

(declare-fun lt!224325 () (_ BitVec 32))

(assert (=> b!495441 (= lt!224327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224325 (select (arr!15403 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495441 (= lt!224326 (toIndex!0 (select (store (arr!15403 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495441 (= lt!224325 (toIndex!0 (select (arr!15403 a!3235) j!176) mask!3524))))

(declare-fun e!290658 () Bool)

(assert (=> b!495441 e!290658))

(declare-fun res!297880 () Bool)

(assert (=> b!495441 (=> (not res!297880) (not e!290658))))

(assert (=> b!495441 (= res!297880 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14659 0))(
  ( (Unit!14660) )
))
(declare-fun lt!224328 () Unit!14659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14659)

(assert (=> b!495441 (= lt!224328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495442 () Bool)

(assert (=> b!495442 (= e!290654 true)))

(assert (=> b!495442 (and (bvslt (x!46699 lt!224327) #b01111111111111111111111111111110) (or (= (select (arr!15403 a!3235) (index!17485 lt!224327)) (select (arr!15403 a!3235) j!176)) (= (select (arr!15403 a!3235) (index!17485 lt!224327)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15403 a!3235) (index!17485 lt!224327)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495443 () Bool)

(declare-fun res!297882 () Bool)

(assert (=> b!495443 (=> (not res!297882) (not e!290657))))

(declare-datatypes ((List!9468 0))(
  ( (Nil!9465) (Cons!9464 (h!10335 (_ BitVec 64)) (t!15688 List!9468)) )
))
(declare-fun arrayNoDuplicates!0 (array!32041 (_ BitVec 32) List!9468) Bool)

(assert (=> b!495443 (= res!297882 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9465))))

(declare-fun b!495444 () Bool)

(declare-fun res!297886 () Bool)

(assert (=> b!495444 (=> (not res!297886) (not e!290656))))

(declare-fun arrayContainsKey!0 (array!32041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495444 (= res!297886 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495445 () Bool)

(assert (=> b!495445 (= e!290658 (= (seekEntryOrOpen!0 (select (arr!15403 a!3235) j!176) a!3235 mask!3524) (Found!3826 j!176)))))

(assert (= (and start!45152 res!297877) b!495435))

(assert (= (and b!495435 res!297876) b!495439))

(assert (= (and b!495439 res!297885) b!495436))

(assert (= (and b!495436 res!297878) b!495444))

(assert (= (and b!495444 res!297886) b!495440))

(assert (= (and b!495440 res!297879) b!495438))

(assert (= (and b!495438 res!297883) b!495443))

(assert (= (and b!495443 res!297882) b!495441))

(assert (= (and b!495441 res!297880) b!495445))

(assert (= (and b!495441 (not res!297884)) b!495437))

(assert (= (and b!495437 (not res!297881)) b!495442))

(declare-fun m!476773 () Bool)

(assert (=> b!495444 m!476773))

(declare-fun m!476775 () Bool)

(assert (=> b!495439 m!476775))

(assert (=> b!495439 m!476775))

(declare-fun m!476777 () Bool)

(assert (=> b!495439 m!476777))

(assert (=> b!495445 m!476775))

(assert (=> b!495445 m!476775))

(declare-fun m!476779 () Bool)

(assert (=> b!495445 m!476779))

(declare-fun m!476781 () Bool)

(assert (=> b!495438 m!476781))

(declare-fun m!476783 () Bool)

(assert (=> start!45152 m!476783))

(declare-fun m!476785 () Bool)

(assert (=> start!45152 m!476785))

(declare-fun m!476787 () Bool)

(assert (=> b!495443 m!476787))

(declare-fun m!476789 () Bool)

(assert (=> b!495441 m!476789))

(assert (=> b!495441 m!476775))

(declare-fun m!476791 () Bool)

(assert (=> b!495441 m!476791))

(declare-fun m!476793 () Bool)

(assert (=> b!495441 m!476793))

(declare-fun m!476795 () Bool)

(assert (=> b!495441 m!476795))

(assert (=> b!495441 m!476775))

(declare-fun m!476797 () Bool)

(assert (=> b!495441 m!476797))

(assert (=> b!495441 m!476795))

(declare-fun m!476799 () Bool)

(assert (=> b!495441 m!476799))

(assert (=> b!495441 m!476775))

(declare-fun m!476801 () Bool)

(assert (=> b!495441 m!476801))

(assert (=> b!495441 m!476795))

(declare-fun m!476803 () Bool)

(assert (=> b!495441 m!476803))

(declare-fun m!476805 () Bool)

(assert (=> b!495436 m!476805))

(declare-fun m!476807 () Bool)

(assert (=> b!495442 m!476807))

(assert (=> b!495442 m!476775))

(declare-fun m!476809 () Bool)

(assert (=> b!495440 m!476809))

(check-sat (not start!45152) (not b!495436) (not b!495439) (not b!495444) (not b!495441) (not b!495445) (not b!495438) (not b!495443) (not b!495440))
(check-sat)
