; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44956 () Bool)

(assert start!44956)

(declare-fun b!493014 () Bool)

(declare-fun e!289595 () Bool)

(assert (=> b!493014 (= e!289595 (not true))))

(declare-datatypes ((SeekEntryResult!3802 0))(
  ( (MissingZero!3802 (index!17387 (_ BitVec 32))) (Found!3802 (index!17388 (_ BitVec 32))) (Intermediate!3802 (undefined!4614 Bool) (index!17389 (_ BitVec 32)) (x!46472 (_ BitVec 32))) (Undefined!3802) (MissingVacant!3802 (index!17390 (_ BitVec 32))) )
))
(declare-fun lt!222909 () SeekEntryResult!3802)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31901 0))(
  ( (array!31902 (arr!15335 (Array (_ BitVec 32) (_ BitVec 64))) (size!15699 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31901)

(declare-fun lt!222913 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31901 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!493014 (= lt!222909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222913 (select (store (arr!15335 a!3235) i!1204 k!2280) j!176) (array!31902 (store (arr!15335 a!3235) i!1204 k!2280) (size!15699 a!3235)) mask!3524))))

(declare-fun lt!222910 () (_ BitVec 32))

(declare-fun lt!222912 () SeekEntryResult!3802)

(assert (=> b!493014 (= lt!222912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222910 (select (arr!15335 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493014 (= lt!222913 (toIndex!0 (select (store (arr!15335 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493014 (= lt!222910 (toIndex!0 (select (arr!15335 a!3235) j!176) mask!3524))))

(declare-fun e!289594 () Bool)

(assert (=> b!493014 e!289594))

(declare-fun res!295591 () Bool)

(assert (=> b!493014 (=> (not res!295591) (not e!289594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31901 (_ BitVec 32)) Bool)

(assert (=> b!493014 (= res!295591 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14550 0))(
  ( (Unit!14551) )
))
(declare-fun lt!222908 () Unit!14550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14550)

(assert (=> b!493014 (= lt!222908 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493015 () Bool)

(declare-fun res!295585 () Bool)

(assert (=> b!493015 (=> (not res!295585) (not e!289595))))

(declare-datatypes ((List!9493 0))(
  ( (Nil!9490) (Cons!9489 (h!10357 (_ BitVec 64)) (t!15721 List!9493)) )
))
(declare-fun arrayNoDuplicates!0 (array!31901 (_ BitVec 32) List!9493) Bool)

(assert (=> b!493015 (= res!295585 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9490))))

(declare-fun b!493016 () Bool)

(declare-fun res!295592 () Bool)

(declare-fun e!289593 () Bool)

(assert (=> b!493016 (=> (not res!295592) (not e!289593))))

(declare-fun arrayContainsKey!0 (array!31901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493016 (= res!295592 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493017 () Bool)

(declare-fun res!295590 () Bool)

(assert (=> b!493017 (=> (not res!295590) (not e!289595))))

(assert (=> b!493017 (= res!295590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493018 () Bool)

(declare-fun res!295588 () Bool)

(assert (=> b!493018 (=> (not res!295588) (not e!289593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493018 (= res!295588 (validKeyInArray!0 (select (arr!15335 a!3235) j!176)))))

(declare-fun b!493019 () Bool)

(declare-fun res!295584 () Bool)

(assert (=> b!493019 (=> (not res!295584) (not e!289593))))

(assert (=> b!493019 (= res!295584 (and (= (size!15699 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15699 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15699 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!295587 () Bool)

(assert (=> start!44956 (=> (not res!295587) (not e!289593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44956 (= res!295587 (validMask!0 mask!3524))))

(assert (=> start!44956 e!289593))

(assert (=> start!44956 true))

(declare-fun array_inv!11131 (array!31901) Bool)

(assert (=> start!44956 (array_inv!11131 a!3235)))

(declare-fun b!493020 () Bool)

(assert (=> b!493020 (= e!289593 e!289595)))

(declare-fun res!295589 () Bool)

(assert (=> b!493020 (=> (not res!295589) (not e!289595))))

(declare-fun lt!222911 () SeekEntryResult!3802)

(assert (=> b!493020 (= res!295589 (or (= lt!222911 (MissingZero!3802 i!1204)) (= lt!222911 (MissingVacant!3802 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31901 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!493020 (= lt!222911 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493021 () Bool)

(declare-fun res!295586 () Bool)

(assert (=> b!493021 (=> (not res!295586) (not e!289593))))

(assert (=> b!493021 (= res!295586 (validKeyInArray!0 k!2280))))

(declare-fun b!493022 () Bool)

(assert (=> b!493022 (= e!289594 (= (seekEntryOrOpen!0 (select (arr!15335 a!3235) j!176) a!3235 mask!3524) (Found!3802 j!176)))))

(assert (= (and start!44956 res!295587) b!493019))

(assert (= (and b!493019 res!295584) b!493018))

(assert (= (and b!493018 res!295588) b!493021))

(assert (= (and b!493021 res!295586) b!493016))

(assert (= (and b!493016 res!295592) b!493020))

(assert (= (and b!493020 res!295589) b!493017))

(assert (= (and b!493017 res!295590) b!493015))

(assert (= (and b!493015 res!295585) b!493014))

(assert (= (and b!493014 res!295591) b!493022))

(declare-fun m!473739 () Bool)

(assert (=> b!493021 m!473739))

(declare-fun m!473741 () Bool)

(assert (=> b!493018 m!473741))

(assert (=> b!493018 m!473741))

(declare-fun m!473743 () Bool)

(assert (=> b!493018 m!473743))

(assert (=> b!493022 m!473741))

(assert (=> b!493022 m!473741))

(declare-fun m!473745 () Bool)

(assert (=> b!493022 m!473745))

(declare-fun m!473747 () Bool)

(assert (=> b!493020 m!473747))

(declare-fun m!473749 () Bool)

(assert (=> b!493016 m!473749))

(declare-fun m!473751 () Bool)

(assert (=> start!44956 m!473751))

(declare-fun m!473753 () Bool)

(assert (=> start!44956 m!473753))

(declare-fun m!473755 () Bool)

(assert (=> b!493014 m!473755))

(declare-fun m!473757 () Bool)

(assert (=> b!493014 m!473757))

(declare-fun m!473759 () Bool)

(assert (=> b!493014 m!473759))

(assert (=> b!493014 m!473759))

(declare-fun m!473761 () Bool)

(assert (=> b!493014 m!473761))

(assert (=> b!493014 m!473741))

(declare-fun m!473763 () Bool)

(assert (=> b!493014 m!473763))

(assert (=> b!493014 m!473741))

(declare-fun m!473765 () Bool)

(assert (=> b!493014 m!473765))

(assert (=> b!493014 m!473741))

(declare-fun m!473767 () Bool)

(assert (=> b!493014 m!473767))

(assert (=> b!493014 m!473759))

(declare-fun m!473769 () Bool)

(assert (=> b!493014 m!473769))

(declare-fun m!473771 () Bool)

(assert (=> b!493015 m!473771))

(declare-fun m!473773 () Bool)

(assert (=> b!493017 m!473773))

(push 1)

