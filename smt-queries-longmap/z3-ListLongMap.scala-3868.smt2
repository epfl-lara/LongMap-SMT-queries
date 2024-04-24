; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53268 () Bool)

(assert start!53268)

(declare-fun b!578681 () Bool)

(declare-fun e!332800 () Bool)

(assert (=> b!578681 (= e!332800 false)))

(declare-fun lt!264385 () Bool)

(declare-datatypes ((array!36114 0))(
  ( (array!36115 (arr!17329 (Array (_ BitVec 32) (_ BitVec 64))) (size!17693 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36114)

(declare-datatypes ((List!11277 0))(
  ( (Nil!11274) (Cons!11273 (h!12321 (_ BitVec 64)) (t!17497 List!11277)) )
))
(declare-fun arrayNoDuplicates!0 (array!36114 (_ BitVec 32) List!11277) Bool)

(assert (=> b!578681 (= lt!264385 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11274))))

(declare-fun b!578682 () Bool)

(declare-fun res!366394 () Bool)

(assert (=> b!578682 (=> (not res!366394) (not e!332800))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36114 (_ BitVec 32)) Bool)

(assert (=> b!578682 (= res!366394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578683 () Bool)

(declare-fun e!332802 () Bool)

(assert (=> b!578683 (= e!332802 e!332800)))

(declare-fun res!366395 () Bool)

(assert (=> b!578683 (=> (not res!366395) (not e!332800))))

(declare-datatypes ((SeekEntryResult!5725 0))(
  ( (MissingZero!5725 (index!25127 (_ BitVec 32))) (Found!5725 (index!25128 (_ BitVec 32))) (Intermediate!5725 (undefined!6537 Bool) (index!25129 (_ BitVec 32)) (x!54181 (_ BitVec 32))) (Undefined!5725) (MissingVacant!5725 (index!25130 (_ BitVec 32))) )
))
(declare-fun lt!264384 () SeekEntryResult!5725)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578683 (= res!366395 (or (= lt!264384 (MissingZero!5725 i!1108)) (= lt!264384 (MissingVacant!5725 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36114 (_ BitVec 32)) SeekEntryResult!5725)

(assert (=> b!578683 (= lt!264384 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578684 () Bool)

(declare-fun res!366397 () Bool)

(assert (=> b!578684 (=> (not res!366397) (not e!332802))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578684 (= res!366397 (and (= (size!17693 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17693 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17693 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578685 () Bool)

(declare-fun res!366396 () Bool)

(assert (=> b!578685 (=> (not res!366396) (not e!332802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578685 (= res!366396 (validKeyInArray!0 k0!1786))))

(declare-fun b!578686 () Bool)

(declare-fun res!366393 () Bool)

(assert (=> b!578686 (=> (not res!366393) (not e!332802))))

(declare-fun arrayContainsKey!0 (array!36114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578686 (= res!366393 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!366392 () Bool)

(assert (=> start!53268 (=> (not res!366392) (not e!332802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53268 (= res!366392 (validMask!0 mask!3053))))

(assert (=> start!53268 e!332802))

(assert (=> start!53268 true))

(declare-fun array_inv!13188 (array!36114) Bool)

(assert (=> start!53268 (array_inv!13188 a!2986)))

(declare-fun b!578680 () Bool)

(declare-fun res!366391 () Bool)

(assert (=> b!578680 (=> (not res!366391) (not e!332802))))

(assert (=> b!578680 (= res!366391 (validKeyInArray!0 (select (arr!17329 a!2986) j!136)))))

(assert (= (and start!53268 res!366392) b!578684))

(assert (= (and b!578684 res!366397) b!578680))

(assert (= (and b!578680 res!366391) b!578685))

(assert (= (and b!578685 res!366396) b!578686))

(assert (= (and b!578686 res!366393) b!578683))

(assert (= (and b!578683 res!366395) b!578682))

(assert (= (and b!578682 res!366394) b!578681))

(declare-fun m!557513 () Bool)

(assert (=> b!578683 m!557513))

(declare-fun m!557515 () Bool)

(assert (=> b!578680 m!557515))

(assert (=> b!578680 m!557515))

(declare-fun m!557517 () Bool)

(assert (=> b!578680 m!557517))

(declare-fun m!557519 () Bool)

(assert (=> start!53268 m!557519))

(declare-fun m!557521 () Bool)

(assert (=> start!53268 m!557521))

(declare-fun m!557523 () Bool)

(assert (=> b!578681 m!557523))

(declare-fun m!557525 () Bool)

(assert (=> b!578686 m!557525))

(declare-fun m!557527 () Bool)

(assert (=> b!578685 m!557527))

(declare-fun m!557529 () Bool)

(assert (=> b!578682 m!557529))

(check-sat (not b!578686) (not b!578685) (not b!578680) (not b!578683) (not b!578681) (not start!53268) (not b!578682))
(check-sat)
