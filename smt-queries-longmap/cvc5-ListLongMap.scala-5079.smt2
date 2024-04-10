; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68984 () Bool)

(assert start!68984)

(declare-fun b!804706 () Bool)

(declare-fun res!549225 () Bool)

(declare-fun e!445760 () Bool)

(assert (=> b!804706 (=> (not res!549225) (not e!445760))))

(declare-datatypes ((array!43774 0))(
  ( (array!43775 (arr!20967 (Array (_ BitVec 32) (_ BitVec 64))) (size!21388 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43774)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804706 (= res!549225 (validKeyInArray!0 (select (arr!20967 a!3170) j!153)))))

(declare-fun b!804707 () Bool)

(declare-fun res!549231 () Bool)

(declare-fun e!445759 () Bool)

(assert (=> b!804707 (=> (not res!549231) (not e!445759))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804707 (= res!549231 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21388 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20967 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21388 a!3170)) (= (select (arr!20967 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549227 () Bool)

(assert (=> start!68984 (=> (not res!549227) (not e!445760))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68984 (= res!549227 (validMask!0 mask!3266))))

(assert (=> start!68984 e!445760))

(assert (=> start!68984 true))

(declare-fun array_inv!16763 (array!43774) Bool)

(assert (=> start!68984 (array_inv!16763 a!3170)))

(declare-fun b!804708 () Bool)

(declare-fun res!549229 () Bool)

(assert (=> b!804708 (=> (not res!549229) (not e!445760))))

(assert (=> b!804708 (= res!549229 (and (= (size!21388 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21388 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21388 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804709 () Bool)

(declare-fun res!549226 () Bool)

(assert (=> b!804709 (=> (not res!549226) (not e!445760))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!804709 (= res!549226 (validKeyInArray!0 k!2044))))

(declare-fun b!804710 () Bool)

(assert (=> b!804710 (= e!445759 false)))

(declare-datatypes ((SeekEntryResult!8558 0))(
  ( (MissingZero!8558 (index!36600 (_ BitVec 32))) (Found!8558 (index!36601 (_ BitVec 32))) (Intermediate!8558 (undefined!9370 Bool) (index!36602 (_ BitVec 32)) (x!67428 (_ BitVec 32))) (Undefined!8558) (MissingVacant!8558 (index!36603 (_ BitVec 32))) )
))
(declare-fun lt!360260 () SeekEntryResult!8558)

(declare-fun lt!360257 () array!43774)

(declare-fun lt!360256 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43774 (_ BitVec 32)) SeekEntryResult!8558)

(assert (=> b!804710 (= lt!360260 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360256 lt!360257 mask!3266))))

(declare-fun lt!360259 () SeekEntryResult!8558)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43774 (_ BitVec 32)) SeekEntryResult!8558)

(assert (=> b!804710 (= lt!360259 (seekEntryOrOpen!0 lt!360256 lt!360257 mask!3266))))

(assert (=> b!804710 (= lt!360256 (select (store (arr!20967 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804710 (= lt!360257 (array!43775 (store (arr!20967 a!3170) i!1163 k!2044) (size!21388 a!3170)))))

(declare-fun b!804711 () Bool)

(declare-fun res!549230 () Bool)

(assert (=> b!804711 (=> (not res!549230) (not e!445760))))

(declare-fun arrayContainsKey!0 (array!43774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804711 (= res!549230 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804712 () Bool)

(assert (=> b!804712 (= e!445760 e!445759)))

(declare-fun res!549232 () Bool)

(assert (=> b!804712 (=> (not res!549232) (not e!445759))))

(declare-fun lt!360258 () SeekEntryResult!8558)

(assert (=> b!804712 (= res!549232 (or (= lt!360258 (MissingZero!8558 i!1163)) (= lt!360258 (MissingVacant!8558 i!1163))))))

(assert (=> b!804712 (= lt!360258 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804713 () Bool)

(declare-fun res!549233 () Bool)

(assert (=> b!804713 (=> (not res!549233) (not e!445759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43774 (_ BitVec 32)) Bool)

(assert (=> b!804713 (= res!549233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804714 () Bool)

(declare-fun res!549228 () Bool)

(assert (=> b!804714 (=> (not res!549228) (not e!445759))))

(declare-datatypes ((List!14930 0))(
  ( (Nil!14927) (Cons!14926 (h!16055 (_ BitVec 64)) (t!21245 List!14930)) )
))
(declare-fun arrayNoDuplicates!0 (array!43774 (_ BitVec 32) List!14930) Bool)

(assert (=> b!804714 (= res!549228 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14927))))

(assert (= (and start!68984 res!549227) b!804708))

(assert (= (and b!804708 res!549229) b!804706))

(assert (= (and b!804706 res!549225) b!804709))

(assert (= (and b!804709 res!549226) b!804711))

(assert (= (and b!804711 res!549230) b!804712))

(assert (= (and b!804712 res!549232) b!804713))

(assert (= (and b!804713 res!549233) b!804714))

(assert (= (and b!804714 res!549228) b!804707))

(assert (= (and b!804707 res!549231) b!804710))

(declare-fun m!746561 () Bool)

(assert (=> b!804707 m!746561))

(declare-fun m!746563 () Bool)

(assert (=> b!804707 m!746563))

(declare-fun m!746565 () Bool)

(assert (=> b!804714 m!746565))

(declare-fun m!746567 () Bool)

(assert (=> start!68984 m!746567))

(declare-fun m!746569 () Bool)

(assert (=> start!68984 m!746569))

(declare-fun m!746571 () Bool)

(assert (=> b!804713 m!746571))

(declare-fun m!746573 () Bool)

(assert (=> b!804712 m!746573))

(declare-fun m!746575 () Bool)

(assert (=> b!804711 m!746575))

(declare-fun m!746577 () Bool)

(assert (=> b!804709 m!746577))

(declare-fun m!746579 () Bool)

(assert (=> b!804710 m!746579))

(declare-fun m!746581 () Bool)

(assert (=> b!804710 m!746581))

(declare-fun m!746583 () Bool)

(assert (=> b!804710 m!746583))

(declare-fun m!746585 () Bool)

(assert (=> b!804710 m!746585))

(declare-fun m!746587 () Bool)

(assert (=> b!804706 m!746587))

(assert (=> b!804706 m!746587))

(declare-fun m!746589 () Bool)

(assert (=> b!804706 m!746589))

(push 1)

