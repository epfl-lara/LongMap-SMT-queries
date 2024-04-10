; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69166 () Bool)

(assert start!69166)

(declare-fun b!806570 () Bool)

(declare-fun res!550698 () Bool)

(declare-fun e!446652 () Bool)

(assert (=> b!806570 (=> (not res!550698) (not e!446652))))

(declare-datatypes ((array!43866 0))(
  ( (array!43867 (arr!21010 (Array (_ BitVec 32) (_ BitVec 64))) (size!21431 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43866)

(declare-datatypes ((List!14973 0))(
  ( (Nil!14970) (Cons!14969 (h!16098 (_ BitVec 64)) (t!21288 List!14973)) )
))
(declare-fun arrayNoDuplicates!0 (array!43866 (_ BitVec 32) List!14973) Bool)

(assert (=> b!806570 (= res!550698 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14970))))

(declare-fun b!806571 () Bool)

(declare-fun res!550703 () Bool)

(assert (=> b!806571 (=> (not res!550703) (not e!446652))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43866 (_ BitVec 32)) Bool)

(assert (=> b!806571 (= res!550703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806573 () Bool)

(declare-fun e!446653 () Bool)

(assert (=> b!806573 (= e!446652 e!446653)))

(declare-fun res!550702 () Bool)

(assert (=> b!806573 (=> (not res!550702) (not e!446653))))

(declare-datatypes ((SeekEntryResult!8601 0))(
  ( (MissingZero!8601 (index!36772 (_ BitVec 32))) (Found!8601 (index!36773 (_ BitVec 32))) (Intermediate!8601 (undefined!9413 Bool) (index!36774 (_ BitVec 32)) (x!67589 (_ BitVec 32))) (Undefined!8601) (MissingVacant!8601 (index!36775 (_ BitVec 32))) )
))
(declare-fun lt!361220 () SeekEntryResult!8601)

(declare-fun lt!361224 () SeekEntryResult!8601)

(assert (=> b!806573 (= res!550702 (= lt!361220 lt!361224))))

(declare-fun lt!361222 () array!43866)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361226 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43866 (_ BitVec 32)) SeekEntryResult!8601)

(assert (=> b!806573 (= lt!361224 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361226 lt!361222 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43866 (_ BitVec 32)) SeekEntryResult!8601)

(assert (=> b!806573 (= lt!361220 (seekEntryOrOpen!0 lt!361226 lt!361222 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806573 (= lt!361226 (select (store (arr!21010 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806573 (= lt!361222 (array!43867 (store (arr!21010 a!3170) i!1163 k0!2044) (size!21431 a!3170)))))

(declare-fun b!806574 () Bool)

(declare-fun res!550695 () Bool)

(declare-fun e!446650 () Bool)

(assert (=> b!806574 (=> (not res!550695) (not e!446650))))

(declare-fun arrayContainsKey!0 (array!43866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806574 (= res!550695 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806575 () Bool)

(declare-fun res!550693 () Bool)

(assert (=> b!806575 (=> (not res!550693) (not e!446652))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806575 (= res!550693 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21431 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21010 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21431 a!3170)) (= (select (arr!21010 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806576 () Bool)

(assert (=> b!806576 (= e!446650 e!446652)))

(declare-fun res!550699 () Bool)

(assert (=> b!806576 (=> (not res!550699) (not e!446652))))

(declare-fun lt!361225 () SeekEntryResult!8601)

(assert (=> b!806576 (= res!550699 (or (= lt!361225 (MissingZero!8601 i!1163)) (= lt!361225 (MissingVacant!8601 i!1163))))))

(assert (=> b!806576 (= lt!361225 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806572 () Bool)

(declare-fun res!550694 () Bool)

(assert (=> b!806572 (=> (not res!550694) (not e!446650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806572 (= res!550694 (validKeyInArray!0 (select (arr!21010 a!3170) j!153)))))

(declare-fun res!550697 () Bool)

(assert (=> start!69166 (=> (not res!550697) (not e!446650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69166 (= res!550697 (validMask!0 mask!3266))))

(assert (=> start!69166 e!446650))

(assert (=> start!69166 true))

(declare-fun array_inv!16806 (array!43866) Bool)

(assert (=> start!69166 (array_inv!16806 a!3170)))

(declare-fun b!806577 () Bool)

(declare-fun e!446654 () Bool)

(assert (=> b!806577 (= e!446654 (not true))))

(assert (=> b!806577 (= lt!361224 (Found!8601 index!1236))))

(declare-fun b!806578 () Bool)

(assert (=> b!806578 (= e!446653 e!446654)))

(declare-fun res!550700 () Bool)

(assert (=> b!806578 (=> (not res!550700) (not e!446654))))

(declare-fun lt!361223 () SeekEntryResult!8601)

(declare-fun lt!361221 () SeekEntryResult!8601)

(assert (=> b!806578 (= res!550700 (and (= lt!361223 lt!361221) (= lt!361221 (Found!8601 j!153)) (= (select (arr!21010 a!3170) index!1236) (select (arr!21010 a!3170) j!153))))))

(assert (=> b!806578 (= lt!361221 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21010 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806578 (= lt!361223 (seekEntryOrOpen!0 (select (arr!21010 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806579 () Bool)

(declare-fun res!550696 () Bool)

(assert (=> b!806579 (=> (not res!550696) (not e!446650))))

(assert (=> b!806579 (= res!550696 (validKeyInArray!0 k0!2044))))

(declare-fun b!806580 () Bool)

(declare-fun res!550701 () Bool)

(assert (=> b!806580 (=> (not res!550701) (not e!446650))))

(assert (=> b!806580 (= res!550701 (and (= (size!21431 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21431 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21431 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69166 res!550697) b!806580))

(assert (= (and b!806580 res!550701) b!806572))

(assert (= (and b!806572 res!550694) b!806579))

(assert (= (and b!806579 res!550696) b!806574))

(assert (= (and b!806574 res!550695) b!806576))

(assert (= (and b!806576 res!550699) b!806571))

(assert (= (and b!806571 res!550703) b!806570))

(assert (= (and b!806570 res!550698) b!806575))

(assert (= (and b!806575 res!550693) b!806573))

(assert (= (and b!806573 res!550702) b!806578))

(assert (= (and b!806578 res!550700) b!806577))

(declare-fun m!748505 () Bool)

(assert (=> start!69166 m!748505))

(declare-fun m!748507 () Bool)

(assert (=> start!69166 m!748507))

(declare-fun m!748509 () Bool)

(assert (=> b!806579 m!748509))

(declare-fun m!748511 () Bool)

(assert (=> b!806571 m!748511))

(declare-fun m!748513 () Bool)

(assert (=> b!806570 m!748513))

(declare-fun m!748515 () Bool)

(assert (=> b!806576 m!748515))

(declare-fun m!748517 () Bool)

(assert (=> b!806575 m!748517))

(declare-fun m!748519 () Bool)

(assert (=> b!806575 m!748519))

(declare-fun m!748521 () Bool)

(assert (=> b!806573 m!748521))

(declare-fun m!748523 () Bool)

(assert (=> b!806573 m!748523))

(declare-fun m!748525 () Bool)

(assert (=> b!806573 m!748525))

(declare-fun m!748527 () Bool)

(assert (=> b!806573 m!748527))

(declare-fun m!748529 () Bool)

(assert (=> b!806578 m!748529))

(declare-fun m!748531 () Bool)

(assert (=> b!806578 m!748531))

(assert (=> b!806578 m!748531))

(declare-fun m!748533 () Bool)

(assert (=> b!806578 m!748533))

(assert (=> b!806578 m!748531))

(declare-fun m!748535 () Bool)

(assert (=> b!806578 m!748535))

(declare-fun m!748537 () Bool)

(assert (=> b!806574 m!748537))

(assert (=> b!806572 m!748531))

(assert (=> b!806572 m!748531))

(declare-fun m!748539 () Bool)

(assert (=> b!806572 m!748539))

(check-sat (not b!806574) (not b!806576) (not b!806579) (not b!806570) (not b!806572) (not b!806571) (not b!806578) (not start!69166) (not b!806573))
(check-sat)
