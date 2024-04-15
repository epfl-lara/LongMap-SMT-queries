; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45186 () Bool)

(assert start!45186)

(declare-fun b!495819 () Bool)

(declare-fun res!298352 () Bool)

(declare-fun e!290793 () Bool)

(assert (=> b!495819 (=> (not res!298352) (not e!290793))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495819 (= res!298352 (validKeyInArray!0 k0!2280))))

(declare-fun b!495820 () Bool)

(declare-fun res!298351 () Bool)

(declare-fun e!290792 () Bool)

(assert (=> b!495820 (=> res!298351 e!290792)))

(declare-datatypes ((SeekEntryResult!3889 0))(
  ( (MissingZero!3889 (index!17735 (_ BitVec 32))) (Found!3889 (index!17736 (_ BitVec 32))) (Intermediate!3889 (undefined!4701 Bool) (index!17737 (_ BitVec 32)) (x!46808 (_ BitVec 32))) (Undefined!3889) (MissingVacant!3889 (index!17738 (_ BitVec 32))) )
))
(declare-fun lt!224351 () SeekEntryResult!3889)

(get-info :version)

(assert (=> b!495820 (= res!298351 (or (undefined!4701 lt!224351) (not ((_ is Intermediate!3889) lt!224351))))))

(declare-fun b!495822 () Bool)

(declare-fun res!298357 () Bool)

(assert (=> b!495822 (=> (not res!298357) (not e!290793))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32084 0))(
  ( (array!32085 (arr!15425 (Array (_ BitVec 32) (_ BitVec 64))) (size!15790 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32084)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495822 (= res!298357 (and (= (size!15790 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15790 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15790 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495823 () Bool)

(declare-fun e!290789 () Bool)

(assert (=> b!495823 (= e!290793 e!290789)))

(declare-fun res!298358 () Bool)

(assert (=> b!495823 (=> (not res!298358) (not e!290789))))

(declare-fun lt!224352 () SeekEntryResult!3889)

(assert (=> b!495823 (= res!298358 (or (= lt!224352 (MissingZero!3889 i!1204)) (= lt!224352 (MissingVacant!3889 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32084 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!495823 (= lt!224352 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495824 () Bool)

(declare-fun res!298354 () Bool)

(assert (=> b!495824 (=> (not res!298354) (not e!290793))))

(assert (=> b!495824 (= res!298354 (validKeyInArray!0 (select (arr!15425 a!3235) j!176)))))

(declare-fun b!495825 () Bool)

(assert (=> b!495825 (= e!290792 true)))

(assert (=> b!495825 (and (bvslt (x!46808 lt!224351) #b01111111111111111111111111111110) (or (= (select (arr!15425 a!3235) (index!17737 lt!224351)) (select (arr!15425 a!3235) j!176)) (= (select (arr!15425 a!3235) (index!17737 lt!224351)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15425 a!3235) (index!17737 lt!224351)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!290790 () Bool)

(declare-fun b!495826 () Bool)

(assert (=> b!495826 (= e!290790 (= (seekEntryOrOpen!0 (select (arr!15425 a!3235) j!176) a!3235 mask!3524) (Found!3889 j!176)))))

(declare-fun b!495827 () Bool)

(declare-fun res!298353 () Bool)

(assert (=> b!495827 (=> (not res!298353) (not e!290793))))

(declare-fun arrayContainsKey!0 (array!32084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495827 (= res!298353 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495828 () Bool)

(assert (=> b!495828 (= e!290789 (not e!290792))))

(declare-fun res!298348 () Bool)

(assert (=> b!495828 (=> res!298348 e!290792)))

(declare-fun lt!224349 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32084 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!495828 (= res!298348 (= lt!224351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224349 (select (store (arr!15425 a!3235) i!1204 k0!2280) j!176) (array!32085 (store (arr!15425 a!3235) i!1204 k0!2280) (size!15790 a!3235)) mask!3524)))))

(declare-fun lt!224350 () (_ BitVec 32))

(assert (=> b!495828 (= lt!224351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224350 (select (arr!15425 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495828 (= lt!224349 (toIndex!0 (select (store (arr!15425 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495828 (= lt!224350 (toIndex!0 (select (arr!15425 a!3235) j!176) mask!3524))))

(assert (=> b!495828 e!290790))

(declare-fun res!298349 () Bool)

(assert (=> b!495828 (=> (not res!298349) (not e!290790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32084 (_ BitVec 32)) Bool)

(assert (=> b!495828 (= res!298349 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14710 0))(
  ( (Unit!14711) )
))
(declare-fun lt!224353 () Unit!14710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14710)

(assert (=> b!495828 (= lt!224353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495829 () Bool)

(declare-fun res!298355 () Bool)

(assert (=> b!495829 (=> (not res!298355) (not e!290789))))

(declare-datatypes ((List!9622 0))(
  ( (Nil!9619) (Cons!9618 (h!10489 (_ BitVec 64)) (t!15841 List!9622)) )
))
(declare-fun arrayNoDuplicates!0 (array!32084 (_ BitVec 32) List!9622) Bool)

(assert (=> b!495829 (= res!298355 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9619))))

(declare-fun res!298356 () Bool)

(assert (=> start!45186 (=> (not res!298356) (not e!290793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45186 (= res!298356 (validMask!0 mask!3524))))

(assert (=> start!45186 e!290793))

(assert (=> start!45186 true))

(declare-fun array_inv!11308 (array!32084) Bool)

(assert (=> start!45186 (array_inv!11308 a!3235)))

(declare-fun b!495821 () Bool)

(declare-fun res!298350 () Bool)

(assert (=> b!495821 (=> (not res!298350) (not e!290789))))

(assert (=> b!495821 (= res!298350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45186 res!298356) b!495822))

(assert (= (and b!495822 res!298357) b!495824))

(assert (= (and b!495824 res!298354) b!495819))

(assert (= (and b!495819 res!298352) b!495827))

(assert (= (and b!495827 res!298353) b!495823))

(assert (= (and b!495823 res!298358) b!495821))

(assert (= (and b!495821 res!298350) b!495829))

(assert (= (and b!495829 res!298355) b!495828))

(assert (= (and b!495828 res!298349) b!495826))

(assert (= (and b!495828 (not res!298348)) b!495820))

(assert (= (and b!495820 (not res!298351)) b!495825))

(declare-fun m!476521 () Bool)

(assert (=> b!495823 m!476521))

(declare-fun m!476523 () Bool)

(assert (=> b!495826 m!476523))

(assert (=> b!495826 m!476523))

(declare-fun m!476525 () Bool)

(assert (=> b!495826 m!476525))

(declare-fun m!476527 () Bool)

(assert (=> b!495819 m!476527))

(declare-fun m!476529 () Bool)

(assert (=> b!495829 m!476529))

(assert (=> b!495824 m!476523))

(assert (=> b!495824 m!476523))

(declare-fun m!476531 () Bool)

(assert (=> b!495824 m!476531))

(declare-fun m!476533 () Bool)

(assert (=> b!495821 m!476533))

(declare-fun m!476535 () Bool)

(assert (=> b!495825 m!476535))

(assert (=> b!495825 m!476523))

(assert (=> b!495828 m!476523))

(declare-fun m!476537 () Bool)

(assert (=> b!495828 m!476537))

(declare-fun m!476539 () Bool)

(assert (=> b!495828 m!476539))

(declare-fun m!476541 () Bool)

(assert (=> b!495828 m!476541))

(assert (=> b!495828 m!476523))

(declare-fun m!476543 () Bool)

(assert (=> b!495828 m!476543))

(assert (=> b!495828 m!476523))

(declare-fun m!476545 () Bool)

(assert (=> b!495828 m!476545))

(assert (=> b!495828 m!476541))

(declare-fun m!476547 () Bool)

(assert (=> b!495828 m!476547))

(assert (=> b!495828 m!476541))

(declare-fun m!476549 () Bool)

(assert (=> b!495828 m!476549))

(declare-fun m!476551 () Bool)

(assert (=> b!495828 m!476551))

(declare-fun m!476553 () Bool)

(assert (=> b!495827 m!476553))

(declare-fun m!476555 () Bool)

(assert (=> start!45186 m!476555))

(declare-fun m!476557 () Bool)

(assert (=> start!45186 m!476557))

(check-sat (not start!45186) (not b!495824) (not b!495819) (not b!495821) (not b!495826) (not b!495823) (not b!495828) (not b!495829) (not b!495827))
(check-sat)
