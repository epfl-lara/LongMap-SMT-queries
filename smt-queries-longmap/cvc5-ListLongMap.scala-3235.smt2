; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45216 () Bool)

(assert start!45216)

(declare-fun b!496387 () Bool)

(declare-fun res!298784 () Bool)

(declare-fun e!291100 () Bool)

(assert (=> b!496387 (=> (not res!298784) (not e!291100))))

(declare-datatypes ((array!32104 0))(
  ( (array!32105 (arr!15435 (Array (_ BitVec 32) (_ BitVec 64))) (size!15799 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32104)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496387 (= res!298784 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496388 () Bool)

(declare-fun res!298774 () Bool)

(assert (=> b!496388 (=> (not res!298774) (not e!291100))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496388 (= res!298774 (validKeyInArray!0 (select (arr!15435 a!3235) j!176)))))

(declare-fun res!298781 () Bool)

(assert (=> start!45216 (=> (not res!298781) (not e!291100))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45216 (= res!298781 (validMask!0 mask!3524))))

(assert (=> start!45216 e!291100))

(assert (=> start!45216 true))

(declare-fun array_inv!11231 (array!32104) Bool)

(assert (=> start!45216 (array_inv!11231 a!3235)))

(declare-fun b!496389 () Bool)

(declare-fun res!298780 () Bool)

(declare-fun e!291101 () Bool)

(assert (=> b!496389 (=> (not res!298780) (not e!291101))))

(declare-datatypes ((List!9593 0))(
  ( (Nil!9590) (Cons!9589 (h!10460 (_ BitVec 64)) (t!15821 List!9593)) )
))
(declare-fun arrayNoDuplicates!0 (array!32104 (_ BitVec 32) List!9593) Bool)

(assert (=> b!496389 (= res!298780 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9590))))

(declare-fun b!496390 () Bool)

(declare-fun res!298782 () Bool)

(declare-fun e!291098 () Bool)

(assert (=> b!496390 (=> res!298782 e!291098)))

(declare-datatypes ((SeekEntryResult!3902 0))(
  ( (MissingZero!3902 (index!17787 (_ BitVec 32))) (Found!3902 (index!17788 (_ BitVec 32))) (Intermediate!3902 (undefined!4714 Bool) (index!17789 (_ BitVec 32)) (x!46850 (_ BitVec 32))) (Undefined!3902) (MissingVacant!3902 (index!17790 (_ BitVec 32))) )
))
(declare-fun lt!224720 () SeekEntryResult!3902)

(assert (=> b!496390 (= res!298782 (or (undefined!4714 lt!224720) (not (is-Intermediate!3902 lt!224720))))))

(declare-fun b!496391 () Bool)

(declare-fun res!298776 () Bool)

(assert (=> b!496391 (=> (not res!298776) (not e!291101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32104 (_ BitVec 32)) Bool)

(assert (=> b!496391 (= res!298776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496392 () Bool)

(declare-fun res!298779 () Bool)

(assert (=> b!496392 (=> (not res!298779) (not e!291100))))

(assert (=> b!496392 (= res!298779 (validKeyInArray!0 k!2280))))

(declare-fun b!496393 () Bool)

(assert (=> b!496393 (= e!291098 true)))

(assert (=> b!496393 (and (bvslt (x!46850 lt!224720) #b01111111111111111111111111111110) (or (= (select (arr!15435 a!3235) (index!17789 lt!224720)) (select (arr!15435 a!3235) j!176)) (= (select (arr!15435 a!3235) (index!17789 lt!224720)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15435 a!3235) (index!17789 lt!224720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496394 () Bool)

(assert (=> b!496394 (= e!291101 (not e!291098))))

(declare-fun res!298783 () Bool)

(assert (=> b!496394 (=> res!298783 e!291098)))

(declare-fun lt!224722 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32104 (_ BitVec 32)) SeekEntryResult!3902)

(assert (=> b!496394 (= res!298783 (= lt!224720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224722 (select (store (arr!15435 a!3235) i!1204 k!2280) j!176) (array!32105 (store (arr!15435 a!3235) i!1204 k!2280) (size!15799 a!3235)) mask!3524)))))

(declare-fun lt!224721 () (_ BitVec 32))

(assert (=> b!496394 (= lt!224720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224721 (select (arr!15435 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496394 (= lt!224722 (toIndex!0 (select (store (arr!15435 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496394 (= lt!224721 (toIndex!0 (select (arr!15435 a!3235) j!176) mask!3524))))

(declare-fun e!291102 () Bool)

(assert (=> b!496394 e!291102))

(declare-fun res!298775 () Bool)

(assert (=> b!496394 (=> (not res!298775) (not e!291102))))

(assert (=> b!496394 (= res!298775 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14750 0))(
  ( (Unit!14751) )
))
(declare-fun lt!224719 () Unit!14750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14750)

(assert (=> b!496394 (= lt!224719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496395 () Bool)

(declare-fun res!298778 () Bool)

(assert (=> b!496395 (=> (not res!298778) (not e!291100))))

(assert (=> b!496395 (= res!298778 (and (= (size!15799 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15799 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15799 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496396 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32104 (_ BitVec 32)) SeekEntryResult!3902)

(assert (=> b!496396 (= e!291102 (= (seekEntryOrOpen!0 (select (arr!15435 a!3235) j!176) a!3235 mask!3524) (Found!3902 j!176)))))

(declare-fun b!496397 () Bool)

(assert (=> b!496397 (= e!291100 e!291101)))

(declare-fun res!298777 () Bool)

(assert (=> b!496397 (=> (not res!298777) (not e!291101))))

(declare-fun lt!224718 () SeekEntryResult!3902)

(assert (=> b!496397 (= res!298777 (or (= lt!224718 (MissingZero!3902 i!1204)) (= lt!224718 (MissingVacant!3902 i!1204))))))

(assert (=> b!496397 (= lt!224718 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45216 res!298781) b!496395))

(assert (= (and b!496395 res!298778) b!496388))

(assert (= (and b!496388 res!298774) b!496392))

(assert (= (and b!496392 res!298779) b!496387))

(assert (= (and b!496387 res!298784) b!496397))

(assert (= (and b!496397 res!298777) b!496391))

(assert (= (and b!496391 res!298776) b!496389))

(assert (= (and b!496389 res!298780) b!496394))

(assert (= (and b!496394 res!298775) b!496396))

(assert (= (and b!496394 (not res!298783)) b!496390))

(assert (= (and b!496390 (not res!298782)) b!496393))

(declare-fun m!477615 () Bool)

(assert (=> b!496388 m!477615))

(assert (=> b!496388 m!477615))

(declare-fun m!477617 () Bool)

(assert (=> b!496388 m!477617))

(declare-fun m!477619 () Bool)

(assert (=> b!496394 m!477619))

(declare-fun m!477621 () Bool)

(assert (=> b!496394 m!477621))

(declare-fun m!477623 () Bool)

(assert (=> b!496394 m!477623))

(assert (=> b!496394 m!477623))

(declare-fun m!477625 () Bool)

(assert (=> b!496394 m!477625))

(assert (=> b!496394 m!477615))

(declare-fun m!477627 () Bool)

(assert (=> b!496394 m!477627))

(assert (=> b!496394 m!477615))

(declare-fun m!477629 () Bool)

(assert (=> b!496394 m!477629))

(assert (=> b!496394 m!477615))

(declare-fun m!477631 () Bool)

(assert (=> b!496394 m!477631))

(assert (=> b!496394 m!477623))

(declare-fun m!477633 () Bool)

(assert (=> b!496394 m!477633))

(declare-fun m!477635 () Bool)

(assert (=> b!496392 m!477635))

(declare-fun m!477637 () Bool)

(assert (=> start!45216 m!477637))

(declare-fun m!477639 () Bool)

(assert (=> start!45216 m!477639))

(declare-fun m!477641 () Bool)

(assert (=> b!496391 m!477641))

(declare-fun m!477643 () Bool)

(assert (=> b!496393 m!477643))

(assert (=> b!496393 m!477615))

(declare-fun m!477645 () Bool)

(assert (=> b!496397 m!477645))

(declare-fun m!477647 () Bool)

(assert (=> b!496387 m!477647))

(declare-fun m!477649 () Bool)

(assert (=> b!496389 m!477649))

(assert (=> b!496396 m!477615))

(assert (=> b!496396 m!477615))

(declare-fun m!477651 () Bool)

(assert (=> b!496396 m!477651))

(push 1)

(assert (not b!496392))

(assert (not b!496387))

(assert (not b!496394))

(assert (not b!496391))

(assert (not b!496389))

(assert (not b!496397))

(assert (not b!496388))

(assert (not b!496396))

(assert (not start!45216))

(check-sat)

(pop 1)

