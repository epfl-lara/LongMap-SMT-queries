; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45158 () Bool)

(assert start!45158)

(declare-fun b!495431 () Bool)

(declare-fun e!290665 () Bool)

(assert (=> b!495431 (= e!290665 true)))

(declare-datatypes ((SeekEntryResult!3873 0))(
  ( (MissingZero!3873 (index!17671 (_ BitVec 32))) (Found!3873 (index!17672 (_ BitVec 32))) (Intermediate!3873 (undefined!4685 Bool) (index!17673 (_ BitVec 32)) (x!46741 (_ BitVec 32))) (Undefined!3873) (MissingVacant!3873 (index!17674 (_ BitVec 32))) )
))
(declare-fun lt!224286 () SeekEntryResult!3873)

(declare-datatypes ((array!32046 0))(
  ( (array!32047 (arr!15406 (Array (_ BitVec 32) (_ BitVec 64))) (size!15770 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32046)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495431 (and (bvslt (x!46741 lt!224286) #b01111111111111111111111111111110) (or (= (select (arr!15406 a!3235) (index!17673 lt!224286)) (select (arr!15406 a!3235) j!176)) (= (select (arr!15406 a!3235) (index!17673 lt!224286)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15406 a!3235) (index!17673 lt!224286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495432 () Bool)

(declare-fun res!297824 () Bool)

(declare-fun e!290667 () Bool)

(assert (=> b!495432 (=> (not res!297824) (not e!290667))))

(declare-datatypes ((List!9564 0))(
  ( (Nil!9561) (Cons!9560 (h!10431 (_ BitVec 64)) (t!15792 List!9564)) )
))
(declare-fun arrayNoDuplicates!0 (array!32046 (_ BitVec 32) List!9564) Bool)

(assert (=> b!495432 (= res!297824 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9561))))

(declare-fun b!495433 () Bool)

(assert (=> b!495433 (= e!290667 (not e!290665))))

(declare-fun res!297825 () Bool)

(assert (=> b!495433 (=> res!297825 e!290665)))

(declare-fun lt!224287 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32046 (_ BitVec 32)) SeekEntryResult!3873)

(assert (=> b!495433 (= res!297825 (= lt!224286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224287 (select (store (arr!15406 a!3235) i!1204 k0!2280) j!176) (array!32047 (store (arr!15406 a!3235) i!1204 k0!2280) (size!15770 a!3235)) mask!3524)))))

(declare-fun lt!224283 () (_ BitVec 32))

(assert (=> b!495433 (= lt!224286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224283 (select (arr!15406 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495433 (= lt!224287 (toIndex!0 (select (store (arr!15406 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495433 (= lt!224283 (toIndex!0 (select (arr!15406 a!3235) j!176) mask!3524))))

(declare-fun e!290663 () Bool)

(assert (=> b!495433 e!290663))

(declare-fun res!297823 () Bool)

(assert (=> b!495433 (=> (not res!297823) (not e!290663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32046 (_ BitVec 32)) Bool)

(assert (=> b!495433 (= res!297823 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14692 0))(
  ( (Unit!14693) )
))
(declare-fun lt!224285 () Unit!14692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14692)

(assert (=> b!495433 (= lt!224285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495434 () Bool)

(declare-fun res!297817 () Bool)

(declare-fun e!290664 () Bool)

(assert (=> b!495434 (=> (not res!297817) (not e!290664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495434 (= res!297817 (validKeyInArray!0 (select (arr!15406 a!3235) j!176)))))

(declare-fun b!495435 () Bool)

(declare-fun res!297822 () Bool)

(assert (=> b!495435 (=> res!297822 e!290665)))

(get-info :version)

(assert (=> b!495435 (= res!297822 (or (undefined!4685 lt!224286) (not ((_ is Intermediate!3873) lt!224286))))))

(declare-fun b!495436 () Bool)

(declare-fun res!297819 () Bool)

(assert (=> b!495436 (=> (not res!297819) (not e!290667))))

(assert (=> b!495436 (= res!297819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495437 () Bool)

(declare-fun res!297826 () Bool)

(assert (=> b!495437 (=> (not res!297826) (not e!290664))))

(assert (=> b!495437 (= res!297826 (validKeyInArray!0 k0!2280))))

(declare-fun res!297818 () Bool)

(assert (=> start!45158 (=> (not res!297818) (not e!290664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45158 (= res!297818 (validMask!0 mask!3524))))

(assert (=> start!45158 e!290664))

(assert (=> start!45158 true))

(declare-fun array_inv!11202 (array!32046) Bool)

(assert (=> start!45158 (array_inv!11202 a!3235)))

(declare-fun b!495430 () Bool)

(assert (=> b!495430 (= e!290664 e!290667)))

(declare-fun res!297827 () Bool)

(assert (=> b!495430 (=> (not res!297827) (not e!290667))))

(declare-fun lt!224284 () SeekEntryResult!3873)

(assert (=> b!495430 (= res!297827 (or (= lt!224284 (MissingZero!3873 i!1204)) (= lt!224284 (MissingVacant!3873 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32046 (_ BitVec 32)) SeekEntryResult!3873)

(assert (=> b!495430 (= lt!224284 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495438 () Bool)

(declare-fun res!297820 () Bool)

(assert (=> b!495438 (=> (not res!297820) (not e!290664))))

(declare-fun arrayContainsKey!0 (array!32046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495438 (= res!297820 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495439 () Bool)

(assert (=> b!495439 (= e!290663 (= (seekEntryOrOpen!0 (select (arr!15406 a!3235) j!176) a!3235 mask!3524) (Found!3873 j!176)))))

(declare-fun b!495440 () Bool)

(declare-fun res!297821 () Bool)

(assert (=> b!495440 (=> (not res!297821) (not e!290664))))

(assert (=> b!495440 (= res!297821 (and (= (size!15770 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15770 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15770 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45158 res!297818) b!495440))

(assert (= (and b!495440 res!297821) b!495434))

(assert (= (and b!495434 res!297817) b!495437))

(assert (= (and b!495437 res!297826) b!495438))

(assert (= (and b!495438 res!297820) b!495430))

(assert (= (and b!495430 res!297827) b!495436))

(assert (= (and b!495436 res!297819) b!495432))

(assert (= (and b!495432 res!297824) b!495433))

(assert (= (and b!495433 res!297823) b!495439))

(assert (= (and b!495433 (not res!297825)) b!495435))

(assert (= (and b!495435 (not res!297822)) b!495431))

(declare-fun m!476513 () Bool)

(assert (=> b!495434 m!476513))

(assert (=> b!495434 m!476513))

(declare-fun m!476515 () Bool)

(assert (=> b!495434 m!476515))

(declare-fun m!476517 () Bool)

(assert (=> b!495438 m!476517))

(declare-fun m!476519 () Bool)

(assert (=> start!45158 m!476519))

(declare-fun m!476521 () Bool)

(assert (=> start!45158 m!476521))

(declare-fun m!476523 () Bool)

(assert (=> b!495436 m!476523))

(declare-fun m!476525 () Bool)

(assert (=> b!495430 m!476525))

(assert (=> b!495439 m!476513))

(assert (=> b!495439 m!476513))

(declare-fun m!476527 () Bool)

(assert (=> b!495439 m!476527))

(declare-fun m!476529 () Bool)

(assert (=> b!495432 m!476529))

(declare-fun m!476531 () Bool)

(assert (=> b!495437 m!476531))

(declare-fun m!476533 () Bool)

(assert (=> b!495433 m!476533))

(declare-fun m!476535 () Bool)

(assert (=> b!495433 m!476535))

(assert (=> b!495433 m!476513))

(declare-fun m!476537 () Bool)

(assert (=> b!495433 m!476537))

(assert (=> b!495433 m!476513))

(declare-fun m!476539 () Bool)

(assert (=> b!495433 m!476539))

(declare-fun m!476541 () Bool)

(assert (=> b!495433 m!476541))

(declare-fun m!476543 () Bool)

(assert (=> b!495433 m!476543))

(assert (=> b!495433 m!476541))

(declare-fun m!476545 () Bool)

(assert (=> b!495433 m!476545))

(assert (=> b!495433 m!476513))

(declare-fun m!476547 () Bool)

(assert (=> b!495433 m!476547))

(assert (=> b!495433 m!476541))

(declare-fun m!476549 () Bool)

(assert (=> b!495431 m!476549))

(assert (=> b!495431 m!476513))

(check-sat (not b!495433) (not b!495434) (not b!495438) (not b!495432) (not b!495439) (not b!495430) (not b!495436) (not start!45158) (not b!495437))
(check-sat)
