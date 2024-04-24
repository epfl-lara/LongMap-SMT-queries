; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68466 () Bool)

(assert start!68466)

(declare-fun res!538828 () Bool)

(declare-fun e!441392 () Bool)

(assert (=> start!68466 (=> (not res!538828) (not e!441392))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68466 (= res!538828 (validMask!0 mask!3266))))

(assert (=> start!68466 e!441392))

(assert (=> start!68466 true))

(declare-datatypes ((array!43130 0))(
  ( (array!43131 (arr!20641 (Array (_ BitVec 32) (_ BitVec 64))) (size!21061 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43130)

(declare-fun array_inv!16500 (array!43130) Bool)

(assert (=> start!68466 (array_inv!16500 a!3170)))

(declare-fun b!794683 () Bool)

(declare-fun res!538829 () Bool)

(assert (=> b!794683 (=> (not res!538829) (not e!441392))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794683 (= res!538829 (validKeyInArray!0 (select (arr!20641 a!3170) j!153)))))

(declare-fun b!794684 () Bool)

(declare-fun res!538832 () Bool)

(declare-fun e!441393 () Bool)

(assert (=> b!794684 (=> (not res!538832) (not e!441393))))

(declare-datatypes ((List!14511 0))(
  ( (Nil!14508) (Cons!14507 (h!15642 (_ BitVec 64)) (t!20818 List!14511)) )
))
(declare-fun arrayNoDuplicates!0 (array!43130 (_ BitVec 32) List!14511) Bool)

(assert (=> b!794684 (= res!538832 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14508))))

(declare-fun b!794685 () Bool)

(assert (=> b!794685 (= e!441392 e!441393)))

(declare-fun res!538830 () Bool)

(assert (=> b!794685 (=> (not res!538830) (not e!441393))))

(declare-datatypes ((SeekEntryResult!8188 0))(
  ( (MissingZero!8188 (index!35120 (_ BitVec 32))) (Found!8188 (index!35121 (_ BitVec 32))) (Intermediate!8188 (undefined!9000 Bool) (index!35122 (_ BitVec 32)) (x!66213 (_ BitVec 32))) (Undefined!8188) (MissingVacant!8188 (index!35123 (_ BitVec 32))) )
))
(declare-fun lt!354232 () SeekEntryResult!8188)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794685 (= res!538830 (or (= lt!354232 (MissingZero!8188 i!1163)) (= lt!354232 (MissingVacant!8188 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43130 (_ BitVec 32)) SeekEntryResult!8188)

(assert (=> b!794685 (= lt!354232 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794686 () Bool)

(declare-fun res!538835 () Bool)

(assert (=> b!794686 (=> (not res!538835) (not e!441393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43130 (_ BitVec 32)) Bool)

(assert (=> b!794686 (= res!538835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794687 () Bool)

(declare-fun res!538831 () Bool)

(assert (=> b!794687 (=> (not res!538831) (not e!441392))))

(assert (=> b!794687 (= res!538831 (and (= (size!21061 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21061 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21061 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794688 () Bool)

(declare-fun res!538834 () Bool)

(assert (=> b!794688 (=> (not res!538834) (not e!441392))))

(assert (=> b!794688 (= res!538834 (validKeyInArray!0 k0!2044))))

(declare-fun b!794689 () Bool)

(declare-fun res!538836 () Bool)

(assert (=> b!794689 (=> (not res!538836) (not e!441393))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794689 (= res!538836 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21061 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20641 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21061 a!3170)) (= (select (arr!20641 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794690 () Bool)

(assert (=> b!794690 (= e!441393 false)))

(declare-fun lt!354228 () array!43130)

(declare-fun lt!354230 () (_ BitVec 64))

(declare-fun lt!354229 () SeekEntryResult!8188)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43130 (_ BitVec 32)) SeekEntryResult!8188)

(assert (=> b!794690 (= lt!354229 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354230 lt!354228 mask!3266))))

(declare-fun lt!354231 () SeekEntryResult!8188)

(assert (=> b!794690 (= lt!354231 (seekEntryOrOpen!0 lt!354230 lt!354228 mask!3266))))

(assert (=> b!794690 (= lt!354230 (select (store (arr!20641 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794690 (= lt!354228 (array!43131 (store (arr!20641 a!3170) i!1163 k0!2044) (size!21061 a!3170)))))

(declare-fun b!794691 () Bool)

(declare-fun res!538833 () Bool)

(assert (=> b!794691 (=> (not res!538833) (not e!441392))))

(declare-fun arrayContainsKey!0 (array!43130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794691 (= res!538833 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68466 res!538828) b!794687))

(assert (= (and b!794687 res!538831) b!794683))

(assert (= (and b!794683 res!538829) b!794688))

(assert (= (and b!794688 res!538834) b!794691))

(assert (= (and b!794691 res!538833) b!794685))

(assert (= (and b!794685 res!538830) b!794686))

(assert (= (and b!794686 res!538835) b!794684))

(assert (= (and b!794684 res!538832) b!794689))

(assert (= (and b!794689 res!538836) b!794690))

(declare-fun m!735623 () Bool)

(assert (=> b!794691 m!735623))

(declare-fun m!735625 () Bool)

(assert (=> b!794685 m!735625))

(declare-fun m!735627 () Bool)

(assert (=> start!68466 m!735627))

(declare-fun m!735629 () Bool)

(assert (=> start!68466 m!735629))

(declare-fun m!735631 () Bool)

(assert (=> b!794683 m!735631))

(assert (=> b!794683 m!735631))

(declare-fun m!735633 () Bool)

(assert (=> b!794683 m!735633))

(declare-fun m!735635 () Bool)

(assert (=> b!794690 m!735635))

(declare-fun m!735637 () Bool)

(assert (=> b!794690 m!735637))

(declare-fun m!735639 () Bool)

(assert (=> b!794690 m!735639))

(declare-fun m!735641 () Bool)

(assert (=> b!794690 m!735641))

(declare-fun m!735643 () Bool)

(assert (=> b!794684 m!735643))

(declare-fun m!735645 () Bool)

(assert (=> b!794689 m!735645))

(declare-fun m!735647 () Bool)

(assert (=> b!794689 m!735647))

(declare-fun m!735649 () Bool)

(assert (=> b!794688 m!735649))

(declare-fun m!735651 () Bool)

(assert (=> b!794686 m!735651))

(check-sat (not b!794683) (not b!794688) (not b!794684) (not b!794691) (not b!794686) (not b!794685) (not start!68466) (not b!794690))
(check-sat)
