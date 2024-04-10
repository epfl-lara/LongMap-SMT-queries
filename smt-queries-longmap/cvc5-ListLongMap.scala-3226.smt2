; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45162 () Bool)

(assert start!45162)

(declare-fun b!495496 () Bool)

(declare-fun res!297885 () Bool)

(declare-fun e!290697 () Bool)

(assert (=> b!495496 (=> res!297885 e!290697)))

(declare-datatypes ((SeekEntryResult!3875 0))(
  ( (MissingZero!3875 (index!17679 (_ BitVec 32))) (Found!3875 (index!17680 (_ BitVec 32))) (Intermediate!3875 (undefined!4687 Bool) (index!17681 (_ BitVec 32)) (x!46751 (_ BitVec 32))) (Undefined!3875) (MissingVacant!3875 (index!17682 (_ BitVec 32))) )
))
(declare-fun lt!224316 () SeekEntryResult!3875)

(assert (=> b!495496 (= res!297885 (or (undefined!4687 lt!224316) (not (is-Intermediate!3875 lt!224316))))))

(declare-fun b!495497 () Bool)

(declare-fun res!297887 () Bool)

(declare-fun e!290693 () Bool)

(assert (=> b!495497 (=> (not res!297887) (not e!290693))))

(declare-datatypes ((array!32050 0))(
  ( (array!32051 (arr!15408 (Array (_ BitVec 32) (_ BitVec 64))) (size!15772 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32050)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495497 (= res!297887 (validKeyInArray!0 (select (arr!15408 a!3235) j!176)))))

(declare-fun b!495499 () Bool)

(declare-fun res!297892 () Bool)

(assert (=> b!495499 (=> (not res!297892) (not e!290693))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!495499 (= res!297892 (validKeyInArray!0 k!2280))))

(declare-fun b!495500 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!290695 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32050 (_ BitVec 32)) SeekEntryResult!3875)

(assert (=> b!495500 (= e!290695 (= (seekEntryOrOpen!0 (select (arr!15408 a!3235) j!176) a!3235 mask!3524) (Found!3875 j!176)))))

(declare-fun b!495501 () Bool)

(declare-fun res!297893 () Bool)

(declare-fun e!290696 () Bool)

(assert (=> b!495501 (=> (not res!297893) (not e!290696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32050 (_ BitVec 32)) Bool)

(assert (=> b!495501 (= res!297893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495502 () Bool)

(declare-fun res!297890 () Bool)

(assert (=> b!495502 (=> (not res!297890) (not e!290696))))

(declare-datatypes ((List!9566 0))(
  ( (Nil!9563) (Cons!9562 (h!10433 (_ BitVec 64)) (t!15794 List!9566)) )
))
(declare-fun arrayNoDuplicates!0 (array!32050 (_ BitVec 32) List!9566) Bool)

(assert (=> b!495502 (= res!297890 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9563))))

(declare-fun b!495503 () Bool)

(assert (=> b!495503 (= e!290693 e!290696)))

(declare-fun res!297889 () Bool)

(assert (=> b!495503 (=> (not res!297889) (not e!290696))))

(declare-fun lt!224317 () SeekEntryResult!3875)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495503 (= res!297889 (or (= lt!224317 (MissingZero!3875 i!1204)) (= lt!224317 (MissingVacant!3875 i!1204))))))

(assert (=> b!495503 (= lt!224317 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495504 () Bool)

(declare-fun res!297886 () Bool)

(assert (=> b!495504 (=> (not res!297886) (not e!290693))))

(assert (=> b!495504 (= res!297886 (and (= (size!15772 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15772 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15772 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495505 () Bool)

(assert (=> b!495505 (= e!290697 true)))

(assert (=> b!495505 (and (bvslt (x!46751 lt!224316) #b01111111111111111111111111111110) (or (= (select (arr!15408 a!3235) (index!17681 lt!224316)) (select (arr!15408 a!3235) j!176)) (= (select (arr!15408 a!3235) (index!17681 lt!224316)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15408 a!3235) (index!17681 lt!224316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495506 () Bool)

(assert (=> b!495506 (= e!290696 (not e!290697))))

(declare-fun res!297891 () Bool)

(assert (=> b!495506 (=> res!297891 e!290697)))

(declare-fun lt!224315 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32050 (_ BitVec 32)) SeekEntryResult!3875)

(assert (=> b!495506 (= res!297891 (= lt!224316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224315 (select (store (arr!15408 a!3235) i!1204 k!2280) j!176) (array!32051 (store (arr!15408 a!3235) i!1204 k!2280) (size!15772 a!3235)) mask!3524)))))

(declare-fun lt!224314 () (_ BitVec 32))

(assert (=> b!495506 (= lt!224316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224314 (select (arr!15408 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495506 (= lt!224315 (toIndex!0 (select (store (arr!15408 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495506 (= lt!224314 (toIndex!0 (select (arr!15408 a!3235) j!176) mask!3524))))

(assert (=> b!495506 e!290695))

(declare-fun res!297883 () Bool)

(assert (=> b!495506 (=> (not res!297883) (not e!290695))))

(assert (=> b!495506 (= res!297883 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14696 0))(
  ( (Unit!14697) )
))
(declare-fun lt!224313 () Unit!14696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14696)

(assert (=> b!495506 (= lt!224313 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!297884 () Bool)

(assert (=> start!45162 (=> (not res!297884) (not e!290693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45162 (= res!297884 (validMask!0 mask!3524))))

(assert (=> start!45162 e!290693))

(assert (=> start!45162 true))

(declare-fun array_inv!11204 (array!32050) Bool)

(assert (=> start!45162 (array_inv!11204 a!3235)))

(declare-fun b!495498 () Bool)

(declare-fun res!297888 () Bool)

(assert (=> b!495498 (=> (not res!297888) (not e!290693))))

(declare-fun arrayContainsKey!0 (array!32050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495498 (= res!297888 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45162 res!297884) b!495504))

(assert (= (and b!495504 res!297886) b!495497))

(assert (= (and b!495497 res!297887) b!495499))

(assert (= (and b!495499 res!297892) b!495498))

(assert (= (and b!495498 res!297888) b!495503))

(assert (= (and b!495503 res!297889) b!495501))

(assert (= (and b!495501 res!297893) b!495502))

(assert (= (and b!495502 res!297890) b!495506))

(assert (= (and b!495506 res!297883) b!495500))

(assert (= (and b!495506 (not res!297891)) b!495496))

(assert (= (and b!495496 (not res!297885)) b!495505))

(declare-fun m!476589 () Bool)

(assert (=> b!495501 m!476589))

(declare-fun m!476591 () Bool)

(assert (=> b!495503 m!476591))

(declare-fun m!476593 () Bool)

(assert (=> b!495499 m!476593))

(declare-fun m!476595 () Bool)

(assert (=> b!495506 m!476595))

(declare-fun m!476597 () Bool)

(assert (=> b!495506 m!476597))

(declare-fun m!476599 () Bool)

(assert (=> b!495506 m!476599))

(declare-fun m!476601 () Bool)

(assert (=> b!495506 m!476601))

(declare-fun m!476603 () Bool)

(assert (=> b!495506 m!476603))

(assert (=> b!495506 m!476599))

(declare-fun m!476605 () Bool)

(assert (=> b!495506 m!476605))

(assert (=> b!495506 m!476601))

(declare-fun m!476607 () Bool)

(assert (=> b!495506 m!476607))

(assert (=> b!495506 m!476601))

(declare-fun m!476609 () Bool)

(assert (=> b!495506 m!476609))

(assert (=> b!495506 m!476599))

(declare-fun m!476611 () Bool)

(assert (=> b!495506 m!476611))

(assert (=> b!495497 m!476601))

(assert (=> b!495497 m!476601))

(declare-fun m!476613 () Bool)

(assert (=> b!495497 m!476613))

(declare-fun m!476615 () Bool)

(assert (=> start!45162 m!476615))

(declare-fun m!476617 () Bool)

(assert (=> start!45162 m!476617))

(declare-fun m!476619 () Bool)

(assert (=> b!495498 m!476619))

(declare-fun m!476621 () Bool)

(assert (=> b!495502 m!476621))

(assert (=> b!495500 m!476601))

(assert (=> b!495500 m!476601))

(declare-fun m!476623 () Bool)

(assert (=> b!495500 m!476623))

(declare-fun m!476625 () Bool)

(assert (=> b!495505 m!476625))

(assert (=> b!495505 m!476601))

(push 1)

(assert (not b!495500))

(assert (not b!495498))

(assert (not b!495503))

(assert (not b!495506))

(assert (not b!495502))

(assert (not b!495497))

(assert (not start!45162))

(assert (not b!495499))

(assert (not b!495501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

