; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69542 () Bool)

(assert start!69542)

(declare-fun b!810350 () Bool)

(declare-fun res!553640 () Bool)

(declare-fun e!448556 () Bool)

(assert (=> b!810350 (=> (not res!553640) (not e!448556))))

(declare-datatypes ((array!44038 0))(
  ( (array!44039 (arr!21090 (Array (_ BitVec 32) (_ BitVec 64))) (size!21511 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44038)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44038 (_ BitVec 32)) Bool)

(assert (=> b!810350 (= res!553640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810351 () Bool)

(declare-fun res!553635 () Bool)

(declare-fun e!448558 () Bool)

(assert (=> b!810351 (=> (not res!553635) (not e!448558))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810351 (= res!553635 (validKeyInArray!0 (select (arr!21090 a!3170) j!153)))))

(declare-fun b!810352 () Bool)

(declare-fun e!448559 () Bool)

(assert (=> b!810352 (= e!448556 e!448559)))

(declare-fun res!553629 () Bool)

(assert (=> b!810352 (=> (not res!553629) (not e!448559))))

(declare-fun lt!363163 () array!44038)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363167 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8681 0))(
  ( (MissingZero!8681 (index!37092 (_ BitVec 32))) (Found!8681 (index!37093 (_ BitVec 32))) (Intermediate!8681 (undefined!9493 Bool) (index!37094 (_ BitVec 32)) (x!67909 (_ BitVec 32))) (Undefined!8681) (MissingVacant!8681 (index!37095 (_ BitVec 32))) )
))
(declare-fun lt!363165 () SeekEntryResult!8681)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44038 (_ BitVec 32)) SeekEntryResult!8681)

(assert (=> b!810352 (= res!553629 (= lt!363165 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363167 lt!363163 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44038 (_ BitVec 32)) SeekEntryResult!8681)

(assert (=> b!810352 (= lt!363165 (seekEntryOrOpen!0 lt!363167 lt!363163 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810352 (= lt!363167 (select (store (arr!21090 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810352 (= lt!363163 (array!44039 (store (arr!21090 a!3170) i!1163 k!2044) (size!21511 a!3170)))))

(declare-fun res!553633 () Bool)

(assert (=> start!69542 (=> (not res!553633) (not e!448558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69542 (= res!553633 (validMask!0 mask!3266))))

(assert (=> start!69542 e!448558))

(assert (=> start!69542 true))

(declare-fun array_inv!16886 (array!44038) Bool)

(assert (=> start!69542 (array_inv!16886 a!3170)))

(declare-fun b!810353 () Bool)

(declare-fun e!448561 () Bool)

(assert (=> b!810353 (= e!448559 e!448561)))

(declare-fun res!553627 () Bool)

(assert (=> b!810353 (=> (not res!553627) (not e!448561))))

(declare-fun lt!363170 () SeekEntryResult!8681)

(declare-fun lt!363162 () SeekEntryResult!8681)

(assert (=> b!810353 (= res!553627 (= lt!363170 lt!363162))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810353 (= lt!363162 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21090 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810353 (= lt!363170 (seekEntryOrOpen!0 (select (arr!21090 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810354 () Bool)

(declare-fun res!553631 () Bool)

(declare-fun e!448560 () Bool)

(assert (=> b!810354 (=> (not res!553631) (not e!448560))))

(declare-fun lt!363168 () (_ BitVec 32))

(assert (=> b!810354 (= res!553631 (= lt!363165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363168 vacantAfter!23 lt!363167 lt!363163 mask!3266)))))

(declare-fun b!810355 () Bool)

(declare-fun res!553630 () Bool)

(assert (=> b!810355 (=> (not res!553630) (not e!448558))))

(assert (=> b!810355 (= res!553630 (validKeyInArray!0 k!2044))))

(declare-fun b!810356 () Bool)

(declare-fun res!553639 () Bool)

(assert (=> b!810356 (=> (not res!553639) (not e!448556))))

(declare-datatypes ((List!15053 0))(
  ( (Nil!15050) (Cons!15049 (h!16178 (_ BitVec 64)) (t!21368 List!15053)) )
))
(declare-fun arrayNoDuplicates!0 (array!44038 (_ BitVec 32) List!15053) Bool)

(assert (=> b!810356 (= res!553639 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15050))))

(declare-fun b!810357 () Bool)

(declare-fun e!448557 () Bool)

(assert (=> b!810357 (= e!448557 e!448560)))

(declare-fun res!553637 () Bool)

(assert (=> b!810357 (=> (not res!553637) (not e!448560))))

(assert (=> b!810357 (= res!553637 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363168 #b00000000000000000000000000000000) (bvslt lt!363168 (size!21511 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810357 (= lt!363168 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810358 () Bool)

(assert (=> b!810358 (= e!448558 e!448556)))

(declare-fun res!553634 () Bool)

(assert (=> b!810358 (=> (not res!553634) (not e!448556))))

(declare-fun lt!363169 () SeekEntryResult!8681)

(assert (=> b!810358 (= res!553634 (or (= lt!363169 (MissingZero!8681 i!1163)) (= lt!363169 (MissingVacant!8681 i!1163))))))

(assert (=> b!810358 (= lt!363169 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810359 () Bool)

(declare-fun res!553636 () Bool)

(assert (=> b!810359 (=> (not res!553636) (not e!448558))))

(declare-fun arrayContainsKey!0 (array!44038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810359 (= res!553636 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810360 () Bool)

(declare-fun lt!363164 () SeekEntryResult!8681)

(declare-fun lt!363166 () SeekEntryResult!8681)

(assert (=> b!810360 (= e!448560 (and (= lt!363170 lt!363166) (not (= lt!363166 lt!363164))))))

(assert (=> b!810360 (= lt!363166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363168 vacantBefore!23 (select (arr!21090 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810361 () Bool)

(declare-fun res!553638 () Bool)

(assert (=> b!810361 (=> (not res!553638) (not e!448558))))

(assert (=> b!810361 (= res!553638 (and (= (size!21511 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21511 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21511 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810362 () Bool)

(assert (=> b!810362 (= e!448561 e!448557)))

(declare-fun res!553628 () Bool)

(assert (=> b!810362 (=> (not res!553628) (not e!448557))))

(assert (=> b!810362 (= res!553628 (and (= lt!363162 lt!363164) (not (= (select (arr!21090 a!3170) index!1236) (select (arr!21090 a!3170) j!153)))))))

(assert (=> b!810362 (= lt!363164 (Found!8681 j!153))))

(declare-fun b!810363 () Bool)

(declare-fun res!553632 () Bool)

(assert (=> b!810363 (=> (not res!553632) (not e!448556))))

(assert (=> b!810363 (= res!553632 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21511 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21090 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21511 a!3170)) (= (select (arr!21090 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69542 res!553633) b!810361))

(assert (= (and b!810361 res!553638) b!810351))

(assert (= (and b!810351 res!553635) b!810355))

(assert (= (and b!810355 res!553630) b!810359))

(assert (= (and b!810359 res!553636) b!810358))

(assert (= (and b!810358 res!553634) b!810350))

(assert (= (and b!810350 res!553640) b!810356))

(assert (= (and b!810356 res!553639) b!810363))

(assert (= (and b!810363 res!553632) b!810352))

(assert (= (and b!810352 res!553629) b!810353))

(assert (= (and b!810353 res!553627) b!810362))

(assert (= (and b!810362 res!553628) b!810357))

(assert (= (and b!810357 res!553637) b!810354))

(assert (= (and b!810354 res!553631) b!810360))

(declare-fun m!752537 () Bool)

(assert (=> b!810354 m!752537))

(declare-fun m!752539 () Bool)

(assert (=> b!810353 m!752539))

(assert (=> b!810353 m!752539))

(declare-fun m!752541 () Bool)

(assert (=> b!810353 m!752541))

(assert (=> b!810353 m!752539))

(declare-fun m!752543 () Bool)

(assert (=> b!810353 m!752543))

(declare-fun m!752545 () Bool)

(assert (=> b!810359 m!752545))

(declare-fun m!752547 () Bool)

(assert (=> b!810352 m!752547))

(declare-fun m!752549 () Bool)

(assert (=> b!810352 m!752549))

(declare-fun m!752551 () Bool)

(assert (=> b!810352 m!752551))

(declare-fun m!752553 () Bool)

(assert (=> b!810352 m!752553))

(assert (=> b!810351 m!752539))

(assert (=> b!810351 m!752539))

(declare-fun m!752555 () Bool)

(assert (=> b!810351 m!752555))

(declare-fun m!752557 () Bool)

(assert (=> b!810357 m!752557))

(declare-fun m!752559 () Bool)

(assert (=> b!810356 m!752559))

(declare-fun m!752561 () Bool)

(assert (=> b!810355 m!752561))

(declare-fun m!752563 () Bool)

(assert (=> start!69542 m!752563))

(declare-fun m!752565 () Bool)

(assert (=> start!69542 m!752565))

(declare-fun m!752567 () Bool)

(assert (=> b!810362 m!752567))

(assert (=> b!810362 m!752539))

(declare-fun m!752569 () Bool)

(assert (=> b!810363 m!752569))

(declare-fun m!752571 () Bool)

(assert (=> b!810363 m!752571))

(assert (=> b!810360 m!752539))

(assert (=> b!810360 m!752539))

(declare-fun m!752573 () Bool)

(assert (=> b!810360 m!752573))

(declare-fun m!752575 () Bool)

(assert (=> b!810350 m!752575))

(declare-fun m!752577 () Bool)

(assert (=> b!810358 m!752577))

(push 1)

