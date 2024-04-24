; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44732 () Bool)

(assert start!44732)

(declare-fun b!491057 () Bool)

(declare-fun e!288573 () Bool)

(assert (=> b!491057 (= e!288573 true)))

(declare-datatypes ((SeekEntryResult!3706 0))(
  ( (MissingZero!3706 (index!17003 (_ BitVec 32))) (Found!3706 (index!17004 (_ BitVec 32))) (Intermediate!3706 (undefined!4518 Bool) (index!17005 (_ BitVec 32)) (x!46241 (_ BitVec 32))) (Undefined!3706) (MissingVacant!3706 (index!17006 (_ BitVec 32))) )
))
(declare-fun lt!221952 () SeekEntryResult!3706)

(declare-datatypes ((array!31792 0))(
  ( (array!31793 (arr!15283 (Array (_ BitVec 32) (_ BitVec 64))) (size!15647 (_ BitVec 32))) )
))
(declare-fun lt!221953 () array!31792)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221951 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31792 (_ BitVec 32)) SeekEntryResult!3706)

(assert (=> b!491057 (= lt!221952 (seekEntryOrOpen!0 lt!221951 lt!221953 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14419 0))(
  ( (Unit!14420) )
))
(declare-fun lt!221956 () Unit!14419)

(declare-fun a!3235 () array!31792)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31792 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14419)

(assert (=> b!491057 (= lt!221956 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491058 () Bool)

(declare-fun res!294052 () Bool)

(declare-fun e!288576 () Bool)

(assert (=> b!491058 (=> (not res!294052) (not e!288576))))

(assert (=> b!491058 (= res!294052 (and (= (size!15647 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15647 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15647 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491059 () Bool)

(declare-fun res!294049 () Bool)

(declare-fun e!288574 () Bool)

(assert (=> b!491059 (=> (not res!294049) (not e!288574))))

(declare-datatypes ((List!9348 0))(
  ( (Nil!9345) (Cons!9344 (h!10206 (_ BitVec 64)) (t!15568 List!9348)) )
))
(declare-fun arrayNoDuplicates!0 (array!31792 (_ BitVec 32) List!9348) Bool)

(assert (=> b!491059 (= res!294049 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9345))))

(declare-fun b!491060 () Bool)

(assert (=> b!491060 (= e!288574 (not e!288573))))

(declare-fun res!294051 () Bool)

(assert (=> b!491060 (=> res!294051 e!288573)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31792 (_ BitVec 32)) SeekEntryResult!3706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491060 (= res!294051 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15283 a!3235) j!176) mask!3524) (select (arr!15283 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221951 mask!3524) lt!221951 lt!221953 mask!3524))))))

(assert (=> b!491060 (= lt!221951 (select (store (arr!15283 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491060 (= lt!221953 (array!31793 (store (arr!15283 a!3235) i!1204 k0!2280) (size!15647 a!3235)))))

(assert (=> b!491060 (= lt!221952 (Found!3706 j!176))))

(assert (=> b!491060 (= lt!221952 (seekEntryOrOpen!0 (select (arr!15283 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31792 (_ BitVec 32)) Bool)

(assert (=> b!491060 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221955 () Unit!14419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14419)

(assert (=> b!491060 (= lt!221955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491061 () Bool)

(assert (=> b!491061 (= e!288576 e!288574)))

(declare-fun res!294054 () Bool)

(assert (=> b!491061 (=> (not res!294054) (not e!288574))))

(declare-fun lt!221954 () SeekEntryResult!3706)

(assert (=> b!491061 (= res!294054 (or (= lt!221954 (MissingZero!3706 i!1204)) (= lt!221954 (MissingVacant!3706 i!1204))))))

(assert (=> b!491061 (= lt!221954 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491062 () Bool)

(declare-fun res!294055 () Bool)

(assert (=> b!491062 (=> (not res!294055) (not e!288576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491062 (= res!294055 (validKeyInArray!0 k0!2280))))

(declare-fun res!294053 () Bool)

(assert (=> start!44732 (=> (not res!294053) (not e!288576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44732 (= res!294053 (validMask!0 mask!3524))))

(assert (=> start!44732 e!288576))

(assert (=> start!44732 true))

(declare-fun array_inv!11142 (array!31792) Bool)

(assert (=> start!44732 (array_inv!11142 a!3235)))

(declare-fun b!491063 () Bool)

(declare-fun res!294048 () Bool)

(assert (=> b!491063 (=> (not res!294048) (not e!288576))))

(assert (=> b!491063 (= res!294048 (validKeyInArray!0 (select (arr!15283 a!3235) j!176)))))

(declare-fun b!491064 () Bool)

(declare-fun res!294050 () Bool)

(assert (=> b!491064 (=> (not res!294050) (not e!288574))))

(assert (=> b!491064 (= res!294050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491065 () Bool)

(declare-fun res!294047 () Bool)

(assert (=> b!491065 (=> (not res!294047) (not e!288576))))

(declare-fun arrayContainsKey!0 (array!31792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491065 (= res!294047 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44732 res!294053) b!491058))

(assert (= (and b!491058 res!294052) b!491063))

(assert (= (and b!491063 res!294048) b!491062))

(assert (= (and b!491062 res!294055) b!491065))

(assert (= (and b!491065 res!294047) b!491061))

(assert (= (and b!491061 res!294054) b!491064))

(assert (= (and b!491064 res!294050) b!491059))

(assert (= (and b!491059 res!294049) b!491060))

(assert (= (and b!491060 (not res!294051)) b!491057))

(declare-fun m!471727 () Bool)

(assert (=> b!491063 m!471727))

(assert (=> b!491063 m!471727))

(declare-fun m!471729 () Bool)

(assert (=> b!491063 m!471729))

(declare-fun m!471731 () Bool)

(assert (=> b!491061 m!471731))

(declare-fun m!471733 () Bool)

(assert (=> b!491065 m!471733))

(declare-fun m!471735 () Bool)

(assert (=> b!491064 m!471735))

(declare-fun m!471737 () Bool)

(assert (=> b!491060 m!471737))

(declare-fun m!471739 () Bool)

(assert (=> b!491060 m!471739))

(declare-fun m!471741 () Bool)

(assert (=> b!491060 m!471741))

(declare-fun m!471743 () Bool)

(assert (=> b!491060 m!471743))

(assert (=> b!491060 m!471727))

(declare-fun m!471745 () Bool)

(assert (=> b!491060 m!471745))

(declare-fun m!471747 () Bool)

(assert (=> b!491060 m!471747))

(assert (=> b!491060 m!471727))

(declare-fun m!471749 () Bool)

(assert (=> b!491060 m!471749))

(assert (=> b!491060 m!471727))

(declare-fun m!471751 () Bool)

(assert (=> b!491060 m!471751))

(assert (=> b!491060 m!471747))

(declare-fun m!471753 () Bool)

(assert (=> b!491060 m!471753))

(assert (=> b!491060 m!471727))

(assert (=> b!491060 m!471743))

(declare-fun m!471755 () Bool)

(assert (=> b!491057 m!471755))

(declare-fun m!471757 () Bool)

(assert (=> b!491057 m!471757))

(declare-fun m!471759 () Bool)

(assert (=> start!44732 m!471759))

(declare-fun m!471761 () Bool)

(assert (=> start!44732 m!471761))

(declare-fun m!471763 () Bool)

(assert (=> b!491062 m!471763))

(declare-fun m!471765 () Bool)

(assert (=> b!491059 m!471765))

(check-sat (not b!491060) (not b!491057) (not start!44732) (not b!491063) (not b!491061) (not b!491062) (not b!491065) (not b!491059) (not b!491064))
(check-sat)
