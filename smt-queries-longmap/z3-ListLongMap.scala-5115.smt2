; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69572 () Bool)

(assert start!69572)

(declare-fun b!810134 () Bool)

(declare-fun res!553322 () Bool)

(declare-fun e!448530 () Bool)

(assert (=> b!810134 (=> (not res!553322) (not e!448530))))

(declare-datatypes ((array!44002 0))(
  ( (array!44003 (arr!21070 (Array (_ BitVec 32) (_ BitVec 64))) (size!21490 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44002)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810134 (= res!553322 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810135 () Bool)

(declare-fun res!553318 () Bool)

(declare-fun e!448531 () Bool)

(assert (=> b!810135 (=> (not res!553318) (not e!448531))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810135 (= res!553318 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21490 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21070 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21490 a!3170)) (= (select (arr!21070 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810136 () Bool)

(declare-fun res!553314 () Bool)

(assert (=> b!810136 (=> (not res!553314) (not e!448531))))

(declare-datatypes ((List!14940 0))(
  ( (Nil!14937) (Cons!14936 (h!16071 (_ BitVec 64)) (t!21247 List!14940)) )
))
(declare-fun arrayNoDuplicates!0 (array!44002 (_ BitVec 32) List!14940) Bool)

(assert (=> b!810136 (= res!553314 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14937))))

(declare-fun b!810137 () Bool)

(declare-fun res!553315 () Bool)

(assert (=> b!810137 (=> (not res!553315) (not e!448530))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!810137 (= res!553315 (and (= (size!21490 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21490 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21490 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810138 () Bool)

(declare-fun e!448533 () Bool)

(assert (=> b!810138 (= e!448533 false)))

(declare-fun lt!362998 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810138 (= lt!362998 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!810139 () Bool)

(declare-fun e!448534 () Bool)

(assert (=> b!810139 (= e!448534 e!448533)))

(declare-fun res!553323 () Bool)

(assert (=> b!810139 (=> (not res!553323) (not e!448533))))

(declare-datatypes ((SeekEntryResult!8617 0))(
  ( (MissingZero!8617 (index!36836 (_ BitVec 32))) (Found!8617 (index!36837 (_ BitVec 32))) (Intermediate!8617 (undefined!9429 Bool) (index!36838 (_ BitVec 32)) (x!67807 (_ BitVec 32))) (Undefined!8617) (MissingVacant!8617 (index!36839 (_ BitVec 32))) )
))
(declare-fun lt!363000 () SeekEntryResult!8617)

(declare-fun lt!363002 () SeekEntryResult!8617)

(assert (=> b!810139 (= res!553323 (and (= lt!363002 lt!363000) (= lt!363000 (Found!8617 j!153)) (not (= (select (arr!21070 a!3170) index!1236) (select (arr!21070 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44002 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!810139 (= lt!363000 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21070 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44002 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!810139 (= lt!363002 (seekEntryOrOpen!0 (select (arr!21070 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810140 () Bool)

(assert (=> b!810140 (= e!448530 e!448531)))

(declare-fun res!553313 () Bool)

(assert (=> b!810140 (=> (not res!553313) (not e!448531))))

(declare-fun lt!362999 () SeekEntryResult!8617)

(assert (=> b!810140 (= res!553313 (or (= lt!362999 (MissingZero!8617 i!1163)) (= lt!362999 (MissingVacant!8617 i!1163))))))

(assert (=> b!810140 (= lt!362999 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810141 () Bool)

(assert (=> b!810141 (= e!448531 e!448534)))

(declare-fun res!553319 () Bool)

(assert (=> b!810141 (=> (not res!553319) (not e!448534))))

(declare-fun lt!362997 () array!44002)

(declare-fun lt!363001 () (_ BitVec 64))

(assert (=> b!810141 (= res!553319 (= (seekEntryOrOpen!0 lt!363001 lt!362997 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363001 lt!362997 mask!3266)))))

(assert (=> b!810141 (= lt!363001 (select (store (arr!21070 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810141 (= lt!362997 (array!44003 (store (arr!21070 a!3170) i!1163 k0!2044) (size!21490 a!3170)))))

(declare-fun b!810142 () Bool)

(declare-fun res!553317 () Bool)

(assert (=> b!810142 (=> (not res!553317) (not e!448530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810142 (= res!553317 (validKeyInArray!0 (select (arr!21070 a!3170) j!153)))))

(declare-fun b!810143 () Bool)

(declare-fun res!553321 () Bool)

(assert (=> b!810143 (=> (not res!553321) (not e!448530))))

(assert (=> b!810143 (= res!553321 (validKeyInArray!0 k0!2044))))

(declare-fun res!553320 () Bool)

(assert (=> start!69572 (=> (not res!553320) (not e!448530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69572 (= res!553320 (validMask!0 mask!3266))))

(assert (=> start!69572 e!448530))

(assert (=> start!69572 true))

(declare-fun array_inv!16929 (array!44002) Bool)

(assert (=> start!69572 (array_inv!16929 a!3170)))

(declare-fun b!810144 () Bool)

(declare-fun res!553316 () Bool)

(assert (=> b!810144 (=> (not res!553316) (not e!448531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44002 (_ BitVec 32)) Bool)

(assert (=> b!810144 (= res!553316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69572 res!553320) b!810137))

(assert (= (and b!810137 res!553315) b!810142))

(assert (= (and b!810142 res!553317) b!810143))

(assert (= (and b!810143 res!553321) b!810134))

(assert (= (and b!810134 res!553322) b!810140))

(assert (= (and b!810140 res!553313) b!810144))

(assert (= (and b!810144 res!553316) b!810136))

(assert (= (and b!810136 res!553314) b!810135))

(assert (= (and b!810135 res!553318) b!810141))

(assert (= (and b!810141 res!553319) b!810139))

(assert (= (and b!810139 res!553323) b!810138))

(declare-fun m!752677 () Bool)

(assert (=> b!810142 m!752677))

(assert (=> b!810142 m!752677))

(declare-fun m!752679 () Bool)

(assert (=> b!810142 m!752679))

(declare-fun m!752681 () Bool)

(assert (=> b!810141 m!752681))

(declare-fun m!752683 () Bool)

(assert (=> b!810141 m!752683))

(declare-fun m!752685 () Bool)

(assert (=> b!810141 m!752685))

(declare-fun m!752687 () Bool)

(assert (=> b!810141 m!752687))

(declare-fun m!752689 () Bool)

(assert (=> b!810134 m!752689))

(declare-fun m!752691 () Bool)

(assert (=> b!810143 m!752691))

(declare-fun m!752693 () Bool)

(assert (=> b!810144 m!752693))

(declare-fun m!752695 () Bool)

(assert (=> b!810138 m!752695))

(declare-fun m!752697 () Bool)

(assert (=> b!810139 m!752697))

(assert (=> b!810139 m!752677))

(assert (=> b!810139 m!752677))

(declare-fun m!752699 () Bool)

(assert (=> b!810139 m!752699))

(assert (=> b!810139 m!752677))

(declare-fun m!752701 () Bool)

(assert (=> b!810139 m!752701))

(declare-fun m!752703 () Bool)

(assert (=> start!69572 m!752703))

(declare-fun m!752705 () Bool)

(assert (=> start!69572 m!752705))

(declare-fun m!752707 () Bool)

(assert (=> b!810135 m!752707))

(declare-fun m!752709 () Bool)

(assert (=> b!810135 m!752709))

(declare-fun m!752711 () Bool)

(assert (=> b!810136 m!752711))

(declare-fun m!752713 () Bool)

(assert (=> b!810140 m!752713))

(check-sat (not b!810144) (not b!810136) (not start!69572) (not b!810139) (not b!810142) (not b!810141) (not b!810143) (not b!810138) (not b!810140) (not b!810134))
(check-sat)
