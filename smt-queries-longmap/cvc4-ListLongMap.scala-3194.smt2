; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44794 () Bool)

(assert start!44794)

(declare-fun b!491837 () Bool)

(declare-fun res!294776 () Bool)

(declare-fun e!288941 () Bool)

(assert (=> b!491837 (=> (not res!294776) (not e!288941))))

(declare-datatypes ((array!31853 0))(
  ( (array!31854 (arr!15314 (Array (_ BitVec 32) (_ BitVec 64))) (size!15678 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31853)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491837 (= res!294776 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491838 () Bool)

(declare-fun res!294780 () Bool)

(declare-fun e!288942 () Bool)

(assert (=> b!491838 (=> (not res!294780) (not e!288942))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31853 (_ BitVec 32)) Bool)

(assert (=> b!491838 (= res!294780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491839 () Bool)

(declare-fun res!294778 () Bool)

(assert (=> b!491839 (=> (not res!294778) (not e!288942))))

(declare-datatypes ((List!9472 0))(
  ( (Nil!9469) (Cons!9468 (h!10330 (_ BitVec 64)) (t!15700 List!9472)) )
))
(declare-fun arrayNoDuplicates!0 (array!31853 (_ BitVec 32) List!9472) Bool)

(assert (=> b!491839 (= res!294778 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9469))))

(declare-fun res!294777 () Bool)

(assert (=> start!44794 (=> (not res!294777) (not e!288941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44794 (= res!294777 (validMask!0 mask!3524))))

(assert (=> start!44794 e!288941))

(assert (=> start!44794 true))

(declare-fun array_inv!11110 (array!31853) Bool)

(assert (=> start!44794 (array_inv!11110 a!3235)))

(declare-fun b!491840 () Bool)

(declare-fun res!294774 () Bool)

(assert (=> b!491840 (=> (not res!294774) (not e!288941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491840 (= res!294774 (validKeyInArray!0 k!2280))))

(declare-fun b!491841 () Bool)

(assert (=> b!491841 (= e!288941 e!288942)))

(declare-fun res!294781 () Bool)

(assert (=> b!491841 (=> (not res!294781) (not e!288942))))

(declare-datatypes ((SeekEntryResult!3781 0))(
  ( (MissingZero!3781 (index!17303 (_ BitVec 32))) (Found!3781 (index!17304 (_ BitVec 32))) (Intermediate!3781 (undefined!4593 Bool) (index!17305 (_ BitVec 32)) (x!46383 (_ BitVec 32))) (Undefined!3781) (MissingVacant!3781 (index!17306 (_ BitVec 32))) )
))
(declare-fun lt!222376 () SeekEntryResult!3781)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491841 (= res!294781 (or (= lt!222376 (MissingZero!3781 i!1204)) (= lt!222376 (MissingVacant!3781 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31853 (_ BitVec 32)) SeekEntryResult!3781)

(assert (=> b!491841 (= lt!222376 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491842 () Bool)

(declare-fun e!288945 () Bool)

(assert (=> b!491842 (= e!288945 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun e!288944 () Bool)

(declare-fun b!491843 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491843 (= e!288944 (= (seekEntryOrOpen!0 (select (arr!15314 a!3235) j!176) a!3235 mask!3524) (Found!3781 j!176)))))

(declare-fun b!491844 () Bool)

(declare-fun res!294782 () Bool)

(assert (=> b!491844 (=> (not res!294782) (not e!288941))))

(assert (=> b!491844 (= res!294782 (validKeyInArray!0 (select (arr!15314 a!3235) j!176)))))

(declare-fun b!491845 () Bool)

(assert (=> b!491845 (= e!288942 (not e!288945))))

(declare-fun res!294773 () Bool)

(assert (=> b!491845 (=> res!294773 e!288945)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31853 (_ BitVec 32)) SeekEntryResult!3781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491845 (= res!294773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) (select (arr!15314 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15314 a!3235) i!1204 k!2280) j!176) (array!31854 (store (arr!15314 a!3235) i!1204 k!2280) (size!15678 a!3235)) mask!3524)))))

(assert (=> b!491845 e!288944))

(declare-fun res!294775 () Bool)

(assert (=> b!491845 (=> (not res!294775) (not e!288944))))

(assert (=> b!491845 (= res!294775 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14508 0))(
  ( (Unit!14509) )
))
(declare-fun lt!222375 () Unit!14508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14508)

(assert (=> b!491845 (= lt!222375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491846 () Bool)

(declare-fun res!294779 () Bool)

(assert (=> b!491846 (=> (not res!294779) (not e!288941))))

(assert (=> b!491846 (= res!294779 (and (= (size!15678 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15678 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15678 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44794 res!294777) b!491846))

(assert (= (and b!491846 res!294779) b!491844))

(assert (= (and b!491844 res!294782) b!491840))

(assert (= (and b!491840 res!294774) b!491837))

(assert (= (and b!491837 res!294776) b!491841))

(assert (= (and b!491841 res!294781) b!491838))

(assert (= (and b!491838 res!294780) b!491839))

(assert (= (and b!491839 res!294778) b!491845))

(assert (= (and b!491845 res!294775) b!491843))

(assert (= (and b!491845 (not res!294773)) b!491842))

(declare-fun m!472581 () Bool)

(assert (=> b!491845 m!472581))

(declare-fun m!472583 () Bool)

(assert (=> b!491845 m!472583))

(declare-fun m!472585 () Bool)

(assert (=> b!491845 m!472585))

(declare-fun m!472587 () Bool)

(assert (=> b!491845 m!472587))

(declare-fun m!472589 () Bool)

(assert (=> b!491845 m!472589))

(declare-fun m!472591 () Bool)

(assert (=> b!491845 m!472591))

(assert (=> b!491845 m!472589))

(assert (=> b!491845 m!472587))

(declare-fun m!472593 () Bool)

(assert (=> b!491845 m!472593))

(assert (=> b!491845 m!472585))

(declare-fun m!472595 () Bool)

(assert (=> b!491845 m!472595))

(assert (=> b!491845 m!472589))

(declare-fun m!472597 () Bool)

(assert (=> b!491845 m!472597))

(assert (=> b!491845 m!472585))

(assert (=> b!491845 m!472593))

(assert (=> b!491843 m!472589))

(assert (=> b!491843 m!472589))

(declare-fun m!472599 () Bool)

(assert (=> b!491843 m!472599))

(declare-fun m!472601 () Bool)

(assert (=> b!491837 m!472601))

(assert (=> b!491844 m!472589))

(assert (=> b!491844 m!472589))

(declare-fun m!472603 () Bool)

(assert (=> b!491844 m!472603))

(declare-fun m!472605 () Bool)

(assert (=> b!491841 m!472605))

(declare-fun m!472607 () Bool)

(assert (=> b!491840 m!472607))

(declare-fun m!472609 () Bool)

(assert (=> b!491839 m!472609))

(declare-fun m!472611 () Bool)

(assert (=> start!44794 m!472611))

(declare-fun m!472613 () Bool)

(assert (=> start!44794 m!472613))

(declare-fun m!472615 () Bool)

(assert (=> b!491838 m!472615))

(push 1)

(assert (not start!44794))

(assert (not b!491844))

(assert (not b!491839))

(assert (not b!491837))

(assert (not b!491840))

(assert (not b!491838))

(assert (not b!491843))

(assert (not b!491841))

(assert (not b!491845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

