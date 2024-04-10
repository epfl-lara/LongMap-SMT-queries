; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45952 () Bool)

(assert start!45952)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32663 0))(
  ( (array!32664 (arr!15710 (Array (_ BitVec 32) (_ BitVec 64))) (size!16074 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32663)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297571 () Bool)

(declare-fun b!508650 () Bool)

(declare-datatypes ((SeekEntryResult!4177 0))(
  ( (MissingZero!4177 (index!18896 (_ BitVec 32))) (Found!4177 (index!18897 (_ BitVec 32))) (Intermediate!4177 (undefined!4989 Bool) (index!18898 (_ BitVec 32)) (x!47874 (_ BitVec 32))) (Undefined!4177) (MissingVacant!4177 (index!18899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32663 (_ BitVec 32)) SeekEntryResult!4177)

(assert (=> b!508650 (= e!297571 (= (seekEntryOrOpen!0 (select (arr!15710 a!3235) j!176) a!3235 mask!3524) (Found!4177 j!176)))))

(declare-fun b!508651 () Bool)

(declare-fun res!309499 () Bool)

(declare-fun e!297573 () Bool)

(assert (=> b!508651 (=> (not res!309499) (not e!297573))))

(declare-datatypes ((List!9868 0))(
  ( (Nil!9865) (Cons!9864 (h!10741 (_ BitVec 64)) (t!16096 List!9868)) )
))
(declare-fun arrayNoDuplicates!0 (array!32663 (_ BitVec 32) List!9868) Bool)

(assert (=> b!508651 (= res!309499 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9865))))

(declare-fun b!508652 () Bool)

(declare-fun res!309496 () Bool)

(declare-fun e!297570 () Bool)

(assert (=> b!508652 (=> (not res!309496) (not e!297570))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508652 (= res!309496 (validKeyInArray!0 k!2280))))

(declare-fun res!309495 () Bool)

(assert (=> start!45952 (=> (not res!309495) (not e!297570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45952 (= res!309495 (validMask!0 mask!3524))))

(assert (=> start!45952 e!297570))

(assert (=> start!45952 true))

(declare-fun array_inv!11506 (array!32663) Bool)

(assert (=> start!45952 (array_inv!11506 a!3235)))

(declare-fun b!508653 () Bool)

(declare-fun res!309497 () Bool)

(assert (=> b!508653 (=> (not res!309497) (not e!297570))))

(declare-fun arrayContainsKey!0 (array!32663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508653 (= res!309497 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508654 () Bool)

(declare-fun res!309501 () Bool)

(assert (=> b!508654 (=> (not res!309501) (not e!297570))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508654 (= res!309501 (and (= (size!16074 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16074 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16074 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508655 () Bool)

(assert (=> b!508655 (= e!297570 e!297573)))

(declare-fun res!309503 () Bool)

(assert (=> b!508655 (=> (not res!309503) (not e!297573))))

(declare-fun lt!232320 () SeekEntryResult!4177)

(assert (=> b!508655 (= res!309503 (or (= lt!232320 (MissingZero!4177 i!1204)) (= lt!232320 (MissingVacant!4177 i!1204))))))

(assert (=> b!508655 (= lt!232320 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508656 () Bool)

(assert (=> b!508656 (= e!297573 (not true))))

(assert (=> b!508656 e!297571))

(declare-fun res!309498 () Bool)

(assert (=> b!508656 (=> (not res!309498) (not e!297571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32663 (_ BitVec 32)) Bool)

(assert (=> b!508656 (= res!309498 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15612 0))(
  ( (Unit!15613) )
))
(declare-fun lt!232321 () Unit!15612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15612)

(assert (=> b!508656 (= lt!232321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508657 () Bool)

(declare-fun res!309502 () Bool)

(assert (=> b!508657 (=> (not res!309502) (not e!297573))))

(assert (=> b!508657 (= res!309502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508658 () Bool)

(declare-fun res!309500 () Bool)

(assert (=> b!508658 (=> (not res!309500) (not e!297570))))

(assert (=> b!508658 (= res!309500 (validKeyInArray!0 (select (arr!15710 a!3235) j!176)))))

(assert (= (and start!45952 res!309495) b!508654))

(assert (= (and b!508654 res!309501) b!508658))

(assert (= (and b!508658 res!309500) b!508652))

(assert (= (and b!508652 res!309496) b!508653))

(assert (= (and b!508653 res!309497) b!508655))

(assert (= (and b!508655 res!309503) b!508657))

(assert (= (and b!508657 res!309502) b!508651))

(assert (= (and b!508651 res!309499) b!508656))

(assert (= (and b!508656 res!309498) b!508650))

(declare-fun m!489405 () Bool)

(assert (=> b!508650 m!489405))

(assert (=> b!508650 m!489405))

(declare-fun m!489407 () Bool)

(assert (=> b!508650 m!489407))

(declare-fun m!489409 () Bool)

(assert (=> b!508652 m!489409))

(declare-fun m!489411 () Bool)

(assert (=> b!508655 m!489411))

(declare-fun m!489413 () Bool)

(assert (=> b!508653 m!489413))

(declare-fun m!489415 () Bool)

(assert (=> start!45952 m!489415))

(declare-fun m!489417 () Bool)

(assert (=> start!45952 m!489417))

(assert (=> b!508658 m!489405))

(assert (=> b!508658 m!489405))

(declare-fun m!489419 () Bool)

(assert (=> b!508658 m!489419))

(declare-fun m!489421 () Bool)

(assert (=> b!508651 m!489421))

(declare-fun m!489423 () Bool)

(assert (=> b!508656 m!489423))

(declare-fun m!489425 () Bool)

(assert (=> b!508656 m!489425))

(declare-fun m!489427 () Bool)

(assert (=> b!508657 m!489427))

(push 1)

(assert (not b!508650))

(assert (not b!508658))

