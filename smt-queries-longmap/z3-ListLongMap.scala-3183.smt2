; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44726 () Bool)

(assert start!44726)

(declare-fun b!490893 () Bool)

(declare-fun e!288510 () Bool)

(declare-fun e!288509 () Bool)

(assert (=> b!490893 (= e!288510 (not e!288509))))

(declare-fun res!293832 () Bool)

(assert (=> b!490893 (=> res!293832 e!288509)))

(declare-datatypes ((array!31785 0))(
  ( (array!31786 (arr!15280 (Array (_ BitVec 32) (_ BitVec 64))) (size!15644 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31785)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221797 () array!31785)

(declare-fun lt!221796 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3747 0))(
  ( (MissingZero!3747 (index!17167 (_ BitVec 32))) (Found!3747 (index!17168 (_ BitVec 32))) (Intermediate!3747 (undefined!4559 Bool) (index!17169 (_ BitVec 32)) (x!46261 (_ BitVec 32))) (Undefined!3747) (MissingVacant!3747 (index!17170 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31785 (_ BitVec 32)) SeekEntryResult!3747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490893 (= res!293832 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15280 a!3235) j!176) mask!3524) (select (arr!15280 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221796 mask!3524) lt!221796 lt!221797 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490893 (= lt!221796 (select (store (arr!15280 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490893 (= lt!221797 (array!31786 (store (arr!15280 a!3235) i!1204 k0!2280) (size!15644 a!3235)))))

(declare-fun lt!221795 () SeekEntryResult!3747)

(assert (=> b!490893 (= lt!221795 (Found!3747 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31785 (_ BitVec 32)) SeekEntryResult!3747)

(assert (=> b!490893 (= lt!221795 (seekEntryOrOpen!0 (select (arr!15280 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31785 (_ BitVec 32)) Bool)

(assert (=> b!490893 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14440 0))(
  ( (Unit!14441) )
))
(declare-fun lt!221798 () Unit!14440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14440)

(assert (=> b!490893 (= lt!221798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490894 () Bool)

(declare-fun res!293833 () Bool)

(assert (=> b!490894 (=> (not res!293833) (not e!288510))))

(assert (=> b!490894 (= res!293833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490895 () Bool)

(declare-fun res!293831 () Bool)

(declare-fun e!288508 () Bool)

(assert (=> b!490895 (=> (not res!293831) (not e!288508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490895 (= res!293831 (validKeyInArray!0 (select (arr!15280 a!3235) j!176)))))

(declare-fun b!490896 () Bool)

(declare-fun res!293830 () Bool)

(assert (=> b!490896 (=> (not res!293830) (not e!288510))))

(declare-datatypes ((List!9438 0))(
  ( (Nil!9435) (Cons!9434 (h!10296 (_ BitVec 64)) (t!15666 List!9438)) )
))
(declare-fun arrayNoDuplicates!0 (array!31785 (_ BitVec 32) List!9438) Bool)

(assert (=> b!490896 (= res!293830 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9435))))

(declare-fun res!293829 () Bool)

(assert (=> start!44726 (=> (not res!293829) (not e!288508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44726 (= res!293829 (validMask!0 mask!3524))))

(assert (=> start!44726 e!288508))

(assert (=> start!44726 true))

(declare-fun array_inv!11076 (array!31785) Bool)

(assert (=> start!44726 (array_inv!11076 a!3235)))

(declare-fun b!490897 () Bool)

(assert (=> b!490897 (= e!288508 e!288510)))

(declare-fun res!293837 () Bool)

(assert (=> b!490897 (=> (not res!293837) (not e!288510))))

(declare-fun lt!221799 () SeekEntryResult!3747)

(assert (=> b!490897 (= res!293837 (or (= lt!221799 (MissingZero!3747 i!1204)) (= lt!221799 (MissingVacant!3747 i!1204))))))

(assert (=> b!490897 (= lt!221799 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490898 () Bool)

(declare-fun res!293836 () Bool)

(assert (=> b!490898 (=> (not res!293836) (not e!288508))))

(declare-fun arrayContainsKey!0 (array!31785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490898 (= res!293836 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490899 () Bool)

(declare-fun res!293835 () Bool)

(assert (=> b!490899 (=> (not res!293835) (not e!288508))))

(assert (=> b!490899 (= res!293835 (and (= (size!15644 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15644 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15644 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490900 () Bool)

(assert (=> b!490900 (= e!288509 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490900 (= lt!221795 (seekEntryOrOpen!0 lt!221796 lt!221797 mask!3524))))

(declare-fun lt!221800 () Unit!14440)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14440)

(assert (=> b!490900 (= lt!221800 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490901 () Bool)

(declare-fun res!293834 () Bool)

(assert (=> b!490901 (=> (not res!293834) (not e!288508))))

(assert (=> b!490901 (= res!293834 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44726 res!293829) b!490899))

(assert (= (and b!490899 res!293835) b!490895))

(assert (= (and b!490895 res!293831) b!490901))

(assert (= (and b!490901 res!293834) b!490898))

(assert (= (and b!490898 res!293836) b!490897))

(assert (= (and b!490897 res!293837) b!490894))

(assert (= (and b!490894 res!293833) b!490896))

(assert (= (and b!490896 res!293830) b!490893))

(assert (= (and b!490893 (not res!293832)) b!490900))

(declare-fun m!471217 () Bool)

(assert (=> b!490897 m!471217))

(declare-fun m!471219 () Bool)

(assert (=> b!490896 m!471219))

(declare-fun m!471221 () Bool)

(assert (=> b!490895 m!471221))

(assert (=> b!490895 m!471221))

(declare-fun m!471223 () Bool)

(assert (=> b!490895 m!471223))

(declare-fun m!471225 () Bool)

(assert (=> b!490901 m!471225))

(declare-fun m!471227 () Bool)

(assert (=> b!490900 m!471227))

(declare-fun m!471229 () Bool)

(assert (=> b!490900 m!471229))

(declare-fun m!471231 () Bool)

(assert (=> b!490893 m!471231))

(declare-fun m!471233 () Bool)

(assert (=> b!490893 m!471233))

(declare-fun m!471235 () Bool)

(assert (=> b!490893 m!471235))

(declare-fun m!471237 () Bool)

(assert (=> b!490893 m!471237))

(assert (=> b!490893 m!471221))

(declare-fun m!471239 () Bool)

(assert (=> b!490893 m!471239))

(assert (=> b!490893 m!471221))

(assert (=> b!490893 m!471237))

(assert (=> b!490893 m!471221))

(declare-fun m!471241 () Bool)

(assert (=> b!490893 m!471241))

(assert (=> b!490893 m!471221))

(declare-fun m!471243 () Bool)

(assert (=> b!490893 m!471243))

(declare-fun m!471245 () Bool)

(assert (=> b!490893 m!471245))

(declare-fun m!471247 () Bool)

(assert (=> b!490893 m!471247))

(assert (=> b!490893 m!471245))

(declare-fun m!471249 () Bool)

(assert (=> b!490894 m!471249))

(declare-fun m!471251 () Bool)

(assert (=> start!44726 m!471251))

(declare-fun m!471253 () Bool)

(assert (=> start!44726 m!471253))

(declare-fun m!471255 () Bool)

(assert (=> b!490898 m!471255))

(check-sat (not start!44726) (not b!490897) (not b!490893) (not b!490895) (not b!490901) (not b!490894) (not b!490900) (not b!490898) (not b!490896))
(check-sat)
