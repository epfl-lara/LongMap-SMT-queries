; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69014 () Bool)

(assert start!69014)

(declare-fun b!803546 () Bool)

(declare-fun res!547522 () Bool)

(declare-fun e!445393 () Bool)

(assert (=> b!803546 (=> (not res!547522) (not e!445393))))

(declare-datatypes ((array!43636 0))(
  ( (array!43637 (arr!20893 (Array (_ BitVec 32) (_ BitVec 64))) (size!21313 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43636)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43636 (_ BitVec 32)) Bool)

(assert (=> b!803546 (= res!547522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803547 () Bool)

(declare-fun e!445391 () Bool)

(declare-fun e!445392 () Bool)

(assert (=> b!803547 (= e!445391 e!445392)))

(declare-fun res!547517 () Bool)

(assert (=> b!803547 (=> (not res!547517) (not e!445392))))

(declare-datatypes ((SeekEntryResult!8440 0))(
  ( (MissingZero!8440 (index!36128 (_ BitVec 32))) (Found!8440 (index!36129 (_ BitVec 32))) (Intermediate!8440 (undefined!9252 Bool) (index!36130 (_ BitVec 32)) (x!67140 (_ BitVec 32))) (Undefined!8440) (MissingVacant!8440 (index!36131 (_ BitVec 32))) )
))
(declare-fun lt!359370 () SeekEntryResult!8440)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359366 () SeekEntryResult!8440)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803547 (= res!547517 (and (= lt!359366 lt!359370) (= lt!359370 (Found!8440 j!153)) (not (= (select (arr!20893 a!3170) index!1236) (select (arr!20893 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43636 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!803547 (= lt!359370 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43636 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!803547 (= lt!359366 (seekEntryOrOpen!0 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803548 () Bool)

(declare-fun res!547524 () Bool)

(declare-fun e!445390 () Bool)

(assert (=> b!803548 (=> (not res!547524) (not e!445390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803548 (= res!547524 (validKeyInArray!0 (select (arr!20893 a!3170) j!153)))))

(declare-fun b!803549 () Bool)

(declare-fun res!547527 () Bool)

(assert (=> b!803549 (=> (not res!547527) (not e!445390))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803549 (= res!547527 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803550 () Bool)

(declare-fun res!547525 () Bool)

(assert (=> b!803550 (=> (not res!547525) (not e!445393))))

(declare-datatypes ((List!14763 0))(
  ( (Nil!14760) (Cons!14759 (h!15894 (_ BitVec 64)) (t!21070 List!14763)) )
))
(declare-fun arrayNoDuplicates!0 (array!43636 (_ BitVec 32) List!14763) Bool)

(assert (=> b!803550 (= res!547525 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14760))))

(declare-fun res!547518 () Bool)

(assert (=> start!69014 (=> (not res!547518) (not e!445390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69014 (= res!547518 (validMask!0 mask!3266))))

(assert (=> start!69014 e!445390))

(assert (=> start!69014 true))

(declare-fun array_inv!16752 (array!43636) Bool)

(assert (=> start!69014 (array_inv!16752 a!3170)))

(declare-fun b!803551 () Bool)

(assert (=> b!803551 (= e!445390 e!445393)))

(declare-fun res!547521 () Bool)

(assert (=> b!803551 (=> (not res!547521) (not e!445393))))

(declare-fun lt!359367 () SeekEntryResult!8440)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803551 (= res!547521 (or (= lt!359367 (MissingZero!8440 i!1163)) (= lt!359367 (MissingVacant!8440 i!1163))))))

(assert (=> b!803551 (= lt!359367 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803552 () Bool)

(assert (=> b!803552 (= e!445393 e!445391)))

(declare-fun res!547519 () Bool)

(assert (=> b!803552 (=> (not res!547519) (not e!445391))))

(declare-fun lt!359372 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359369 () array!43636)

(assert (=> b!803552 (= res!547519 (= (seekEntryOrOpen!0 lt!359372 lt!359369 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359372 lt!359369 mask!3266)))))

(assert (=> b!803552 (= lt!359372 (select (store (arr!20893 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803552 (= lt!359369 (array!43637 (store (arr!20893 a!3170) i!1163 k0!2044) (size!21313 a!3170)))))

(declare-fun b!803553 () Bool)

(declare-fun res!547523 () Bool)

(assert (=> b!803553 (=> (not res!547523) (not e!445393))))

(assert (=> b!803553 (= res!547523 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21313 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20893 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21313 a!3170)) (= (select (arr!20893 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803554 () Bool)

(declare-fun res!547520 () Bool)

(assert (=> b!803554 (=> (not res!547520) (not e!445390))))

(assert (=> b!803554 (= res!547520 (validKeyInArray!0 k0!2044))))

(declare-fun b!803555 () Bool)

(assert (=> b!803555 (= e!445392 (not true))))

(declare-fun lt!359371 () (_ BitVec 32))

(assert (=> b!803555 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359371 vacantAfter!23 lt!359372 lt!359369 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359371 vacantBefore!23 (select (arr!20893 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27505 0))(
  ( (Unit!27506) )
))
(declare-fun lt!359368 () Unit!27505)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43636 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27505)

(assert (=> b!803555 (= lt!359368 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359371 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803555 (= lt!359371 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803556 () Bool)

(declare-fun res!547526 () Bool)

(assert (=> b!803556 (=> (not res!547526) (not e!445390))))

(assert (=> b!803556 (= res!547526 (and (= (size!21313 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21313 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21313 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69014 res!547518) b!803556))

(assert (= (and b!803556 res!547526) b!803548))

(assert (= (and b!803548 res!547524) b!803554))

(assert (= (and b!803554 res!547520) b!803549))

(assert (= (and b!803549 res!547527) b!803551))

(assert (= (and b!803551 res!547521) b!803546))

(assert (= (and b!803546 res!547522) b!803550))

(assert (= (and b!803550 res!547525) b!803553))

(assert (= (and b!803553 res!547523) b!803552))

(assert (= (and b!803552 res!547519) b!803547))

(assert (= (and b!803547 res!547517) b!803555))

(declare-fun m!745429 () Bool)

(assert (=> b!803549 m!745429))

(declare-fun m!745431 () Bool)

(assert (=> b!803548 m!745431))

(assert (=> b!803548 m!745431))

(declare-fun m!745433 () Bool)

(assert (=> b!803548 m!745433))

(declare-fun m!745435 () Bool)

(assert (=> b!803551 m!745435))

(declare-fun m!745437 () Bool)

(assert (=> b!803550 m!745437))

(declare-fun m!745439 () Bool)

(assert (=> b!803552 m!745439))

(declare-fun m!745441 () Bool)

(assert (=> b!803552 m!745441))

(declare-fun m!745443 () Bool)

(assert (=> b!803552 m!745443))

(declare-fun m!745445 () Bool)

(assert (=> b!803552 m!745445))

(declare-fun m!745447 () Bool)

(assert (=> b!803546 m!745447))

(declare-fun m!745449 () Bool)

(assert (=> start!69014 m!745449))

(declare-fun m!745451 () Bool)

(assert (=> start!69014 m!745451))

(declare-fun m!745453 () Bool)

(assert (=> b!803554 m!745453))

(declare-fun m!745455 () Bool)

(assert (=> b!803547 m!745455))

(assert (=> b!803547 m!745431))

(assert (=> b!803547 m!745431))

(declare-fun m!745457 () Bool)

(assert (=> b!803547 m!745457))

(assert (=> b!803547 m!745431))

(declare-fun m!745459 () Bool)

(assert (=> b!803547 m!745459))

(assert (=> b!803555 m!745431))

(declare-fun m!745461 () Bool)

(assert (=> b!803555 m!745461))

(declare-fun m!745463 () Bool)

(assert (=> b!803555 m!745463))

(declare-fun m!745465 () Bool)

(assert (=> b!803555 m!745465))

(assert (=> b!803555 m!745431))

(declare-fun m!745467 () Bool)

(assert (=> b!803555 m!745467))

(declare-fun m!745469 () Bool)

(assert (=> b!803553 m!745469))

(declare-fun m!745471 () Bool)

(assert (=> b!803553 m!745471))

(check-sat (not b!803551) (not b!803546) (not b!803552) (not start!69014) (not b!803554) (not b!803547) (not b!803550) (not b!803549) (not b!803548) (not b!803555))
(check-sat)
