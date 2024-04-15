; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69546 () Bool)

(assert start!69546)

(declare-fun b!810544 () Bool)

(declare-fun res!553961 () Bool)

(declare-fun e!448614 () Bool)

(assert (=> b!810544 (=> (not res!553961) (not e!448614))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44059 0))(
  ( (array!44060 (arr!21101 (Array (_ BitVec 32) (_ BitVec 64))) (size!21522 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44059)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810544 (= res!553961 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21522 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21101 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21522 a!3170)) (= (select (arr!21101 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810545 () Bool)

(declare-fun e!448615 () Bool)

(assert (=> b!810545 (= e!448615 (not true))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363209 () (_ BitVec 32))

(declare-fun lt!363208 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!363207 () array!44059)

(declare-datatypes ((SeekEntryResult!8689 0))(
  ( (MissingZero!8689 (index!37124 (_ BitVec 32))) (Found!8689 (index!37125 (_ BitVec 32))) (Intermediate!8689 (undefined!9501 Bool) (index!37126 (_ BitVec 32)) (x!67944 (_ BitVec 32))) (Undefined!8689) (MissingVacant!8689 (index!37127 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44059 (_ BitVec 32)) SeekEntryResult!8689)

(assert (=> b!810545 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363209 vacantAfter!23 lt!363208 lt!363207 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363209 vacantBefore!23 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27606 0))(
  ( (Unit!27607) )
))
(declare-fun lt!363211 () Unit!27606)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27606)

(assert (=> b!810545 (= lt!363211 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363209 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810545 (= lt!363209 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810546 () Bool)

(declare-fun e!448617 () Bool)

(assert (=> b!810546 (= e!448614 e!448617)))

(declare-fun res!553968 () Bool)

(assert (=> b!810546 (=> (not res!553968) (not e!448617))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44059 (_ BitVec 32)) SeekEntryResult!8689)

(assert (=> b!810546 (= res!553968 (= (seekEntryOrOpen!0 lt!363208 lt!363207 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363208 lt!363207 mask!3266)))))

(assert (=> b!810546 (= lt!363208 (select (store (arr!21101 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810546 (= lt!363207 (array!44060 (store (arr!21101 a!3170) i!1163 k0!2044) (size!21522 a!3170)))))

(declare-fun res!553966 () Bool)

(declare-fun e!448616 () Bool)

(assert (=> start!69546 (=> (not res!553966) (not e!448616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69546 (= res!553966 (validMask!0 mask!3266))))

(assert (=> start!69546 e!448616))

(assert (=> start!69546 true))

(declare-fun array_inv!16984 (array!44059) Bool)

(assert (=> start!69546 (array_inv!16984 a!3170)))

(declare-fun b!810547 () Bool)

(declare-fun res!553964 () Bool)

(assert (=> b!810547 (=> (not res!553964) (not e!448614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44059 (_ BitVec 32)) Bool)

(assert (=> b!810547 (= res!553964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810548 () Bool)

(declare-fun res!553971 () Bool)

(assert (=> b!810548 (=> (not res!553971) (not e!448616))))

(assert (=> b!810548 (= res!553971 (and (= (size!21522 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21522 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21522 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810549 () Bool)

(declare-fun res!553963 () Bool)

(assert (=> b!810549 (=> (not res!553963) (not e!448614))))

(declare-datatypes ((List!15103 0))(
  ( (Nil!15100) (Cons!15099 (h!16228 (_ BitVec 64)) (t!21409 List!15103)) )
))
(declare-fun arrayNoDuplicates!0 (array!44059 (_ BitVec 32) List!15103) Bool)

(assert (=> b!810549 (= res!553963 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15100))))

(declare-fun b!810550 () Bool)

(assert (=> b!810550 (= e!448616 e!448614)))

(declare-fun res!553967 () Bool)

(assert (=> b!810550 (=> (not res!553967) (not e!448614))))

(declare-fun lt!363212 () SeekEntryResult!8689)

(assert (=> b!810550 (= res!553967 (or (= lt!363212 (MissingZero!8689 i!1163)) (= lt!363212 (MissingVacant!8689 i!1163))))))

(assert (=> b!810550 (= lt!363212 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810551 () Bool)

(declare-fun res!553962 () Bool)

(assert (=> b!810551 (=> (not res!553962) (not e!448616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810551 (= res!553962 (validKeyInArray!0 (select (arr!21101 a!3170) j!153)))))

(declare-fun b!810552 () Bool)

(assert (=> b!810552 (= e!448617 e!448615)))

(declare-fun res!553969 () Bool)

(assert (=> b!810552 (=> (not res!553969) (not e!448615))))

(declare-fun lt!363210 () SeekEntryResult!8689)

(declare-fun lt!363206 () SeekEntryResult!8689)

(assert (=> b!810552 (= res!553969 (and (= lt!363210 lt!363206) (= lt!363206 (Found!8689 j!153)) (not (= (select (arr!21101 a!3170) index!1236) (select (arr!21101 a!3170) j!153)))))))

(assert (=> b!810552 (= lt!363206 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810552 (= lt!363210 (seekEntryOrOpen!0 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810553 () Bool)

(declare-fun res!553970 () Bool)

(assert (=> b!810553 (=> (not res!553970) (not e!448616))))

(assert (=> b!810553 (= res!553970 (validKeyInArray!0 k0!2044))))

(declare-fun b!810554 () Bool)

(declare-fun res!553965 () Bool)

(assert (=> b!810554 (=> (not res!553965) (not e!448616))))

(declare-fun arrayContainsKey!0 (array!44059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810554 (= res!553965 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69546 res!553966) b!810548))

(assert (= (and b!810548 res!553971) b!810551))

(assert (= (and b!810551 res!553962) b!810553))

(assert (= (and b!810553 res!553970) b!810554))

(assert (= (and b!810554 res!553965) b!810550))

(assert (= (and b!810550 res!553967) b!810547))

(assert (= (and b!810547 res!553964) b!810549))

(assert (= (and b!810549 res!553963) b!810544))

(assert (= (and b!810544 res!553961) b!810546))

(assert (= (and b!810546 res!553968) b!810552))

(assert (= (and b!810552 res!553969) b!810545))

(declare-fun m!752311 () Bool)

(assert (=> b!810545 m!752311))

(declare-fun m!752313 () Bool)

(assert (=> b!810545 m!752313))

(assert (=> b!810545 m!752311))

(declare-fun m!752315 () Bool)

(assert (=> b!810545 m!752315))

(declare-fun m!752317 () Bool)

(assert (=> b!810545 m!752317))

(declare-fun m!752319 () Bool)

(assert (=> b!810545 m!752319))

(declare-fun m!752321 () Bool)

(assert (=> start!69546 m!752321))

(declare-fun m!752323 () Bool)

(assert (=> start!69546 m!752323))

(declare-fun m!752325 () Bool)

(assert (=> b!810546 m!752325))

(declare-fun m!752327 () Bool)

(assert (=> b!810546 m!752327))

(declare-fun m!752329 () Bool)

(assert (=> b!810546 m!752329))

(declare-fun m!752331 () Bool)

(assert (=> b!810546 m!752331))

(declare-fun m!752333 () Bool)

(assert (=> b!810554 m!752333))

(declare-fun m!752335 () Bool)

(assert (=> b!810552 m!752335))

(assert (=> b!810552 m!752311))

(assert (=> b!810552 m!752311))

(declare-fun m!752337 () Bool)

(assert (=> b!810552 m!752337))

(assert (=> b!810552 m!752311))

(declare-fun m!752339 () Bool)

(assert (=> b!810552 m!752339))

(declare-fun m!752341 () Bool)

(assert (=> b!810549 m!752341))

(declare-fun m!752343 () Bool)

(assert (=> b!810544 m!752343))

(declare-fun m!752345 () Bool)

(assert (=> b!810544 m!752345))

(assert (=> b!810551 m!752311))

(assert (=> b!810551 m!752311))

(declare-fun m!752347 () Bool)

(assert (=> b!810551 m!752347))

(declare-fun m!752349 () Bool)

(assert (=> b!810550 m!752349))

(declare-fun m!752351 () Bool)

(assert (=> b!810547 m!752351))

(declare-fun m!752353 () Bool)

(assert (=> b!810553 m!752353))

(check-sat (not b!810547) (not b!810554) (not b!810549) (not b!810546) (not b!810551) (not b!810552) (not b!810550) (not start!69546) (not b!810553) (not b!810545))
(check-sat)
