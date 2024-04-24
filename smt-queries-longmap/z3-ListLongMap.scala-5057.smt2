; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69020 () Bool)

(assert start!69020)

(declare-fun b!803647 () Bool)

(declare-fun res!547622 () Bool)

(declare-fun e!445436 () Bool)

(assert (=> b!803647 (=> (not res!547622) (not e!445436))))

(declare-datatypes ((array!43642 0))(
  ( (array!43643 (arr!20896 (Array (_ BitVec 32) (_ BitVec 64))) (size!21316 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43642)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803647 (= res!547622 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!8443 0))(
  ( (MissingZero!8443 (index!36140 (_ BitVec 32))) (Found!8443 (index!36141 (_ BitVec 32))) (Intermediate!8443 (undefined!9255 Bool) (index!36142 (_ BitVec 32)) (x!67151 (_ BitVec 32))) (Undefined!8443) (MissingVacant!8443 (index!36143 (_ BitVec 32))) )
))
(declare-fun lt!359442 () SeekEntryResult!8443)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun e!445439 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun b!803648 () Bool)

(declare-fun lt!359439 () SeekEntryResult!8443)

(assert (=> b!803648 (= e!445439 (not (or (not (= lt!359442 lt!359439)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359443 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359435 () array!43642)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359440 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43642 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!803648 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359443 vacantAfter!23 lt!359440 lt!359435 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359443 vacantBefore!23 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27511 0))(
  ( (Unit!27512) )
))
(declare-fun lt!359436 () Unit!27511)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43642 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27511)

(assert (=> b!803648 (= lt!359436 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359443 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803648 (= lt!359443 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803649 () Bool)

(declare-fun res!547627 () Bool)

(declare-fun e!445440 () Bool)

(assert (=> b!803649 (=> (not res!547627) (not e!445440))))

(declare-datatypes ((List!14766 0))(
  ( (Nil!14763) (Cons!14762 (h!15897 (_ BitVec 64)) (t!21073 List!14766)) )
))
(declare-fun arrayNoDuplicates!0 (array!43642 (_ BitVec 32) List!14766) Bool)

(assert (=> b!803649 (= res!547627 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14763))))

(declare-fun b!803650 () Bool)

(declare-fun res!547618 () Bool)

(assert (=> b!803650 (=> (not res!547618) (not e!445440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43642 (_ BitVec 32)) Bool)

(assert (=> b!803650 (= res!547618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803651 () Bool)

(declare-fun res!547628 () Bool)

(assert (=> b!803651 (=> (not res!547628) (not e!445440))))

(assert (=> b!803651 (= res!547628 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21316 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20896 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21316 a!3170)) (= (select (arr!20896 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803652 () Bool)

(declare-fun e!445441 () Bool)

(assert (=> b!803652 (= e!445441 e!445439)))

(declare-fun res!547619 () Bool)

(assert (=> b!803652 (=> (not res!547619) (not e!445439))))

(declare-fun lt!359441 () SeekEntryResult!8443)

(assert (=> b!803652 (= res!547619 (and (= lt!359441 lt!359439) (not (= (select (arr!20896 a!3170) index!1236) (select (arr!20896 a!3170) j!153)))))))

(assert (=> b!803652 (= lt!359439 (Found!8443 j!153))))

(declare-fun b!803653 () Bool)

(declare-fun e!445437 () Bool)

(assert (=> b!803653 (= e!445440 e!445437)))

(declare-fun res!547621 () Bool)

(assert (=> b!803653 (=> (not res!547621) (not e!445437))))

(declare-fun lt!359438 () SeekEntryResult!8443)

(assert (=> b!803653 (= res!547621 (= lt!359438 lt!359442))))

(assert (=> b!803653 (= lt!359442 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359440 lt!359435 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43642 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!803653 (= lt!359438 (seekEntryOrOpen!0 lt!359440 lt!359435 mask!3266))))

(assert (=> b!803653 (= lt!359440 (select (store (arr!20896 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803653 (= lt!359435 (array!43643 (store (arr!20896 a!3170) i!1163 k0!2044) (size!21316 a!3170)))))

(declare-fun b!803654 () Bool)

(declare-fun res!547629 () Bool)

(assert (=> b!803654 (=> (not res!547629) (not e!445436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803654 (= res!547629 (validKeyInArray!0 (select (arr!20896 a!3170) j!153)))))

(declare-fun res!547625 () Bool)

(assert (=> start!69020 (=> (not res!547625) (not e!445436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69020 (= res!547625 (validMask!0 mask!3266))))

(assert (=> start!69020 e!445436))

(assert (=> start!69020 true))

(declare-fun array_inv!16755 (array!43642) Bool)

(assert (=> start!69020 (array_inv!16755 a!3170)))

(declare-fun b!803655 () Bool)

(declare-fun res!547624 () Bool)

(assert (=> b!803655 (=> (not res!547624) (not e!445436))))

(assert (=> b!803655 (= res!547624 (validKeyInArray!0 k0!2044))))

(declare-fun b!803656 () Bool)

(assert (=> b!803656 (= e!445437 e!445441)))

(declare-fun res!547623 () Bool)

(assert (=> b!803656 (=> (not res!547623) (not e!445441))))

(declare-fun lt!359444 () SeekEntryResult!8443)

(assert (=> b!803656 (= res!547623 (= lt!359444 lt!359441))))

(assert (=> b!803656 (= lt!359441 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803656 (= lt!359444 (seekEntryOrOpen!0 (select (arr!20896 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803657 () Bool)

(declare-fun res!547626 () Bool)

(assert (=> b!803657 (=> (not res!547626) (not e!445436))))

(assert (=> b!803657 (= res!547626 (and (= (size!21316 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21316 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21316 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803658 () Bool)

(assert (=> b!803658 (= e!445436 e!445440)))

(declare-fun res!547620 () Bool)

(assert (=> b!803658 (=> (not res!547620) (not e!445440))))

(declare-fun lt!359437 () SeekEntryResult!8443)

(assert (=> b!803658 (= res!547620 (or (= lt!359437 (MissingZero!8443 i!1163)) (= lt!359437 (MissingVacant!8443 i!1163))))))

(assert (=> b!803658 (= lt!359437 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69020 res!547625) b!803657))

(assert (= (and b!803657 res!547626) b!803654))

(assert (= (and b!803654 res!547629) b!803655))

(assert (= (and b!803655 res!547624) b!803647))

(assert (= (and b!803647 res!547622) b!803658))

(assert (= (and b!803658 res!547620) b!803650))

(assert (= (and b!803650 res!547618) b!803649))

(assert (= (and b!803649 res!547627) b!803651))

(assert (= (and b!803651 res!547628) b!803653))

(assert (= (and b!803653 res!547621) b!803656))

(assert (= (and b!803656 res!547623) b!803652))

(assert (= (and b!803652 res!547619) b!803648))

(declare-fun m!745561 () Bool)

(assert (=> b!803652 m!745561))

(declare-fun m!745563 () Bool)

(assert (=> b!803652 m!745563))

(assert (=> b!803648 m!745563))

(assert (=> b!803648 m!745563))

(declare-fun m!745565 () Bool)

(assert (=> b!803648 m!745565))

(declare-fun m!745567 () Bool)

(assert (=> b!803648 m!745567))

(declare-fun m!745569 () Bool)

(assert (=> b!803648 m!745569))

(declare-fun m!745571 () Bool)

(assert (=> b!803648 m!745571))

(declare-fun m!745573 () Bool)

(assert (=> b!803655 m!745573))

(declare-fun m!745575 () Bool)

(assert (=> b!803647 m!745575))

(declare-fun m!745577 () Bool)

(assert (=> b!803651 m!745577))

(declare-fun m!745579 () Bool)

(assert (=> b!803651 m!745579))

(declare-fun m!745581 () Bool)

(assert (=> b!803649 m!745581))

(assert (=> b!803656 m!745563))

(assert (=> b!803656 m!745563))

(declare-fun m!745583 () Bool)

(assert (=> b!803656 m!745583))

(assert (=> b!803656 m!745563))

(declare-fun m!745585 () Bool)

(assert (=> b!803656 m!745585))

(declare-fun m!745587 () Bool)

(assert (=> b!803653 m!745587))

(declare-fun m!745589 () Bool)

(assert (=> b!803653 m!745589))

(declare-fun m!745591 () Bool)

(assert (=> b!803653 m!745591))

(declare-fun m!745593 () Bool)

(assert (=> b!803653 m!745593))

(declare-fun m!745595 () Bool)

(assert (=> b!803658 m!745595))

(assert (=> b!803654 m!745563))

(assert (=> b!803654 m!745563))

(declare-fun m!745597 () Bool)

(assert (=> b!803654 m!745597))

(declare-fun m!745599 () Bool)

(assert (=> start!69020 m!745599))

(declare-fun m!745601 () Bool)

(assert (=> start!69020 m!745601))

(declare-fun m!745603 () Bool)

(assert (=> b!803650 m!745603))

(check-sat (not b!803647) (not b!803656) (not b!803658) (not b!803653) (not b!803648) (not b!803649) (not b!803650) (not b!803655) (not start!69020) (not b!803654))
(check-sat)
