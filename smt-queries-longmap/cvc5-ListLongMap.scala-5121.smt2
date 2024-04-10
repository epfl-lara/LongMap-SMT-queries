; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69548 () Bool)

(assert start!69548)

(declare-fun b!810476 () Bool)

(declare-fun res!553765 () Bool)

(declare-fun e!448620 () Bool)

(assert (=> b!810476 (=> (not res!553765) (not e!448620))))

(declare-datatypes ((array!44044 0))(
  ( (array!44045 (arr!21093 (Array (_ BitVec 32) (_ BitVec 64))) (size!21514 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44044)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810476 (= res!553765 (validKeyInArray!0 (select (arr!21093 a!3170) j!153)))))

(declare-fun b!810477 () Bool)

(declare-fun e!448625 () Bool)

(declare-fun e!448623 () Bool)

(assert (=> b!810477 (= e!448625 e!448623)))

(declare-fun res!553755 () Bool)

(assert (=> b!810477 (=> (not res!553755) (not e!448623))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363251 () array!44044)

(declare-fun lt!363243 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8684 0))(
  ( (MissingZero!8684 (index!37104 (_ BitVec 32))) (Found!8684 (index!37105 (_ BitVec 32))) (Intermediate!8684 (undefined!9496 Bool) (index!37106 (_ BitVec 32)) (x!67920 (_ BitVec 32))) (Undefined!8684) (MissingVacant!8684 (index!37107 (_ BitVec 32))) )
))
(declare-fun lt!363247 () SeekEntryResult!8684)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44044 (_ BitVec 32)) SeekEntryResult!8684)

(assert (=> b!810477 (= res!553755 (= lt!363247 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363243 lt!363251 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44044 (_ BitVec 32)) SeekEntryResult!8684)

(assert (=> b!810477 (= lt!363247 (seekEntryOrOpen!0 lt!363243 lt!363251 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810477 (= lt!363243 (select (store (arr!21093 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810477 (= lt!363251 (array!44045 (store (arr!21093 a!3170) i!1163 k!2044) (size!21514 a!3170)))))

(declare-fun b!810478 () Bool)

(declare-fun res!553753 () Bool)

(assert (=> b!810478 (=> (not res!553753) (not e!448620))))

(declare-fun arrayContainsKey!0 (array!44044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810478 (= res!553753 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!553766 () Bool)

(assert (=> start!69548 (=> (not res!553766) (not e!448620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69548 (= res!553766 (validMask!0 mask!3266))))

(assert (=> start!69548 e!448620))

(assert (=> start!69548 true))

(declare-fun array_inv!16889 (array!44044) Bool)

(assert (=> start!69548 (array_inv!16889 a!3170)))

(declare-fun b!810479 () Bool)

(declare-fun e!448619 () Bool)

(assert (=> b!810479 (= e!448623 e!448619)))

(declare-fun res!553758 () Bool)

(assert (=> b!810479 (=> (not res!553758) (not e!448619))))

(declare-fun lt!363245 () SeekEntryResult!8684)

(declare-fun lt!363249 () SeekEntryResult!8684)

(assert (=> b!810479 (= res!553758 (= lt!363245 lt!363249))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810479 (= lt!363249 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21093 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810479 (= lt!363245 (seekEntryOrOpen!0 (select (arr!21093 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810480 () Bool)

(declare-fun e!448622 () Bool)

(assert (=> b!810480 (= e!448619 e!448622)))

(declare-fun res!553761 () Bool)

(assert (=> b!810480 (=> (not res!553761) (not e!448622))))

(declare-fun lt!363250 () SeekEntryResult!8684)

(assert (=> b!810480 (= res!553761 (and (= lt!363249 lt!363250) (not (= (select (arr!21093 a!3170) index!1236) (select (arr!21093 a!3170) j!153)))))))

(assert (=> b!810480 (= lt!363250 (Found!8684 j!153))))

(declare-fun b!810481 () Bool)

(declare-fun res!553763 () Bool)

(assert (=> b!810481 (=> (not res!553763) (not e!448625))))

(declare-datatypes ((List!15056 0))(
  ( (Nil!15053) (Cons!15052 (h!16181 (_ BitVec 64)) (t!21371 List!15056)) )
))
(declare-fun arrayNoDuplicates!0 (array!44044 (_ BitVec 32) List!15056) Bool)

(assert (=> b!810481 (= res!553763 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15053))))

(declare-fun b!810482 () Bool)

(declare-fun res!553757 () Bool)

(assert (=> b!810482 (=> (not res!553757) (not e!448625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44044 (_ BitVec 32)) Bool)

(assert (=> b!810482 (= res!553757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810483 () Bool)

(declare-fun e!448624 () Bool)

(assert (=> b!810483 (= e!448622 e!448624)))

(declare-fun res!553754 () Bool)

(assert (=> b!810483 (=> (not res!553754) (not e!448624))))

(declare-fun lt!363244 () (_ BitVec 32))

(assert (=> b!810483 (= res!553754 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363244 #b00000000000000000000000000000000) (bvslt lt!363244 (size!21514 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810483 (= lt!363244 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810484 () Bool)

(declare-fun res!553756 () Bool)

(assert (=> b!810484 (=> (not res!553756) (not e!448620))))

(assert (=> b!810484 (= res!553756 (and (= (size!21514 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21514 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21514 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810485 () Bool)

(declare-fun res!553760 () Bool)

(assert (=> b!810485 (=> (not res!553760) (not e!448625))))

(assert (=> b!810485 (= res!553760 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21514 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21093 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21514 a!3170)) (= (select (arr!21093 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810486 () Bool)

(assert (=> b!810486 (= e!448620 e!448625)))

(declare-fun res!553764 () Bool)

(assert (=> b!810486 (=> (not res!553764) (not e!448625))))

(declare-fun lt!363248 () SeekEntryResult!8684)

(assert (=> b!810486 (= res!553764 (or (= lt!363248 (MissingZero!8684 i!1163)) (= lt!363248 (MissingVacant!8684 i!1163))))))

(assert (=> b!810486 (= lt!363248 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810487 () Bool)

(declare-fun lt!363246 () SeekEntryResult!8684)

(assert (=> b!810487 (= e!448624 (and (= lt!363245 lt!363246) (= lt!363246 lt!363250) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1077)) (bvsub #b01111111111111111111111111111110 x!1077))))))

(assert (=> b!810487 (= lt!363246 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363244 vacantBefore!23 (select (arr!21093 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810488 () Bool)

(declare-fun res!553759 () Bool)

(assert (=> b!810488 (=> (not res!553759) (not e!448620))))

(assert (=> b!810488 (= res!553759 (validKeyInArray!0 k!2044))))

(declare-fun b!810489 () Bool)

(declare-fun res!553762 () Bool)

(assert (=> b!810489 (=> (not res!553762) (not e!448624))))

(assert (=> b!810489 (= res!553762 (= lt!363247 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363244 vacantAfter!23 lt!363243 lt!363251 mask!3266)))))

(assert (= (and start!69548 res!553766) b!810484))

(assert (= (and b!810484 res!553756) b!810476))

(assert (= (and b!810476 res!553765) b!810488))

(assert (= (and b!810488 res!553759) b!810478))

(assert (= (and b!810478 res!553753) b!810486))

(assert (= (and b!810486 res!553764) b!810482))

(assert (= (and b!810482 res!553757) b!810481))

(assert (= (and b!810481 res!553763) b!810485))

(assert (= (and b!810485 res!553760) b!810477))

(assert (= (and b!810477 res!553755) b!810479))

(assert (= (and b!810479 res!553758) b!810480))

(assert (= (and b!810480 res!553761) b!810483))

(assert (= (and b!810483 res!553754) b!810489))

(assert (= (and b!810489 res!553762) b!810487))

(declare-fun m!752663 () Bool)

(assert (=> b!810479 m!752663))

(assert (=> b!810479 m!752663))

(declare-fun m!752665 () Bool)

(assert (=> b!810479 m!752665))

(assert (=> b!810479 m!752663))

(declare-fun m!752667 () Bool)

(assert (=> b!810479 m!752667))

(declare-fun m!752669 () Bool)

(assert (=> b!810478 m!752669))

(declare-fun m!752671 () Bool)

(assert (=> b!810483 m!752671))

(declare-fun m!752673 () Bool)

(assert (=> b!810477 m!752673))

(declare-fun m!752675 () Bool)

(assert (=> b!810477 m!752675))

(declare-fun m!752677 () Bool)

(assert (=> b!810477 m!752677))

(declare-fun m!752679 () Bool)

(assert (=> b!810477 m!752679))

(declare-fun m!752681 () Bool)

(assert (=> b!810486 m!752681))

(declare-fun m!752683 () Bool)

(assert (=> b!810489 m!752683))

(declare-fun m!752685 () Bool)

(assert (=> b!810488 m!752685))

(declare-fun m!752687 () Bool)

(assert (=> b!810485 m!752687))

(declare-fun m!752689 () Bool)

(assert (=> b!810485 m!752689))

(declare-fun m!752691 () Bool)

(assert (=> b!810482 m!752691))

(declare-fun m!752693 () Bool)

(assert (=> start!69548 m!752693))

(declare-fun m!752695 () Bool)

(assert (=> start!69548 m!752695))

(assert (=> b!810476 m!752663))

(assert (=> b!810476 m!752663))

(declare-fun m!752697 () Bool)

(assert (=> b!810476 m!752697))

(assert (=> b!810487 m!752663))

(assert (=> b!810487 m!752663))

(declare-fun m!752699 () Bool)

(assert (=> b!810487 m!752699))

(declare-fun m!752701 () Bool)

(assert (=> b!810481 m!752701))

(declare-fun m!752703 () Bool)

(assert (=> b!810480 m!752703))

(assert (=> b!810480 m!752663))

(push 1)

(assert (not b!810482))

(assert (not b!810478))

(assert (not b!810483))

(assert (not b!810477))

(assert (not b!810481))

(assert (not start!69548))

(assert (not b!810476))

(assert (not b!810489))

(assert (not b!810487))

(assert (not b!810479))

(assert (not b!810488))

(assert (not b!810486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

