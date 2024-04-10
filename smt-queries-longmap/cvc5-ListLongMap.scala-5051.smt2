; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68816 () Bool)

(assert start!68816)

(declare-fun b!802145 () Bool)

(declare-fun res!546668 () Bool)

(declare-fun e!444574 () Bool)

(assert (=> b!802145 (=> (not res!546668) (not e!444574))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802145 (= res!546668 (validKeyInArray!0 k!2044))))

(declare-fun b!802146 () Bool)

(declare-fun res!546673 () Bool)

(assert (=> b!802146 (=> (not res!546673) (not e!444574))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43606 0))(
  ( (array!43607 (arr!20883 (Array (_ BitVec 32) (_ BitVec 64))) (size!21304 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43606)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802146 (= res!546673 (and (= (size!21304 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21304 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21304 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802147 () Bool)

(declare-fun res!546674 () Bool)

(assert (=> b!802147 (=> (not res!546674) (not e!444574))))

(assert (=> b!802147 (= res!546674 (validKeyInArray!0 (select (arr!20883 a!3170) j!153)))))

(declare-fun b!802149 () Bool)

(declare-fun res!546665 () Bool)

(declare-fun e!444578 () Bool)

(assert (=> b!802149 (=> (not res!546665) (not e!444578))))

(declare-datatypes ((List!14846 0))(
  ( (Nil!14843) (Cons!14842 (h!15971 (_ BitVec 64)) (t!21161 List!14846)) )
))
(declare-fun arrayNoDuplicates!0 (array!43606 (_ BitVec 32) List!14846) Bool)

(assert (=> b!802149 (= res!546665 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14843))))

(declare-fun b!802150 () Bool)

(declare-fun res!546664 () Bool)

(assert (=> b!802150 (=> (not res!546664) (not e!444578))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802150 (= res!546664 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21304 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20883 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21304 a!3170)) (= (select (arr!20883 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun e!444575 () Bool)

(declare-fun b!802151 () Bool)

(assert (=> b!802151 (= e!444575 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358669 () (_ BitVec 64))

(declare-fun lt!358672 () array!43606)

(declare-fun lt!358667 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8474 0))(
  ( (MissingZero!8474 (index!36264 (_ BitVec 32))) (Found!8474 (index!36265 (_ BitVec 32))) (Intermediate!8474 (undefined!9286 Bool) (index!36266 (_ BitVec 32)) (x!67120 (_ BitVec 32))) (Undefined!8474) (MissingVacant!8474 (index!36267 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43606 (_ BitVec 32)) SeekEntryResult!8474)

(assert (=> b!802151 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358667 vacantAfter!23 lt!358669 lt!358672 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358667 vacantBefore!23 (select (arr!20883 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27488 0))(
  ( (Unit!27489) )
))
(declare-fun lt!358673 () Unit!27488)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43606 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27488)

(assert (=> b!802151 (= lt!358673 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358667 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802151 (= lt!358667 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802152 () Bool)

(declare-fun res!546669 () Bool)

(assert (=> b!802152 (=> (not res!546669) (not e!444574))))

(declare-fun arrayContainsKey!0 (array!43606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802152 (= res!546669 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802153 () Bool)

(declare-fun res!546670 () Bool)

(assert (=> b!802153 (=> (not res!546670) (not e!444578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43606 (_ BitVec 32)) Bool)

(assert (=> b!802153 (= res!546670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802148 () Bool)

(declare-fun e!444577 () Bool)

(assert (=> b!802148 (= e!444578 e!444577)))

(declare-fun res!546671 () Bool)

(assert (=> b!802148 (=> (not res!546671) (not e!444577))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43606 (_ BitVec 32)) SeekEntryResult!8474)

(assert (=> b!802148 (= res!546671 (= (seekEntryOrOpen!0 lt!358669 lt!358672 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358669 lt!358672 mask!3266)))))

(assert (=> b!802148 (= lt!358669 (select (store (arr!20883 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802148 (= lt!358672 (array!43607 (store (arr!20883 a!3170) i!1163 k!2044) (size!21304 a!3170)))))

(declare-fun res!546667 () Bool)

(assert (=> start!68816 (=> (not res!546667) (not e!444574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68816 (= res!546667 (validMask!0 mask!3266))))

(assert (=> start!68816 e!444574))

(assert (=> start!68816 true))

(declare-fun array_inv!16679 (array!43606) Bool)

(assert (=> start!68816 (array_inv!16679 a!3170)))

(declare-fun b!802154 () Bool)

(assert (=> b!802154 (= e!444577 e!444575)))

(declare-fun res!546666 () Bool)

(assert (=> b!802154 (=> (not res!546666) (not e!444575))))

(declare-fun lt!358668 () SeekEntryResult!8474)

(declare-fun lt!358671 () SeekEntryResult!8474)

(assert (=> b!802154 (= res!546666 (and (= lt!358671 lt!358668) (= lt!358668 (Found!8474 j!153)) (not (= (select (arr!20883 a!3170) index!1236) (select (arr!20883 a!3170) j!153)))))))

(assert (=> b!802154 (= lt!358668 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20883 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802154 (= lt!358671 (seekEntryOrOpen!0 (select (arr!20883 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802155 () Bool)

(assert (=> b!802155 (= e!444574 e!444578)))

(declare-fun res!546672 () Bool)

(assert (=> b!802155 (=> (not res!546672) (not e!444578))))

(declare-fun lt!358670 () SeekEntryResult!8474)

(assert (=> b!802155 (= res!546672 (or (= lt!358670 (MissingZero!8474 i!1163)) (= lt!358670 (MissingVacant!8474 i!1163))))))

(assert (=> b!802155 (= lt!358670 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68816 res!546667) b!802146))

(assert (= (and b!802146 res!546673) b!802147))

(assert (= (and b!802147 res!546674) b!802145))

(assert (= (and b!802145 res!546668) b!802152))

(assert (= (and b!802152 res!546669) b!802155))

(assert (= (and b!802155 res!546672) b!802153))

(assert (= (and b!802153 res!546670) b!802149))

(assert (= (and b!802149 res!546665) b!802150))

(assert (= (and b!802150 res!546664) b!802148))

(assert (= (and b!802148 res!546671) b!802154))

(assert (= (and b!802154 res!546666) b!802151))

(declare-fun m!743495 () Bool)

(assert (=> b!802150 m!743495))

(declare-fun m!743497 () Bool)

(assert (=> b!802150 m!743497))

(declare-fun m!743499 () Bool)

(assert (=> b!802151 m!743499))

(declare-fun m!743501 () Bool)

(assert (=> b!802151 m!743501))

(declare-fun m!743503 () Bool)

(assert (=> b!802151 m!743503))

(declare-fun m!743505 () Bool)

(assert (=> b!802151 m!743505))

(assert (=> b!802151 m!743499))

(declare-fun m!743507 () Bool)

(assert (=> b!802151 m!743507))

(declare-fun m!743509 () Bool)

(assert (=> start!68816 m!743509))

(declare-fun m!743511 () Bool)

(assert (=> start!68816 m!743511))

(declare-fun m!743513 () Bool)

(assert (=> b!802154 m!743513))

(assert (=> b!802154 m!743499))

(assert (=> b!802154 m!743499))

(declare-fun m!743515 () Bool)

(assert (=> b!802154 m!743515))

(assert (=> b!802154 m!743499))

(declare-fun m!743517 () Bool)

(assert (=> b!802154 m!743517))

(declare-fun m!743519 () Bool)

(assert (=> b!802145 m!743519))

(declare-fun m!743521 () Bool)

(assert (=> b!802155 m!743521))

(declare-fun m!743523 () Bool)

(assert (=> b!802148 m!743523))

(declare-fun m!743525 () Bool)

(assert (=> b!802148 m!743525))

(declare-fun m!743527 () Bool)

(assert (=> b!802148 m!743527))

(declare-fun m!743529 () Bool)

(assert (=> b!802148 m!743529))

(declare-fun m!743531 () Bool)

(assert (=> b!802149 m!743531))

(declare-fun m!743533 () Bool)

(assert (=> b!802152 m!743533))

(declare-fun m!743535 () Bool)

(assert (=> b!802153 m!743535))

(assert (=> b!802147 m!743499))

(assert (=> b!802147 m!743499))

(declare-fun m!743537 () Bool)

(assert (=> b!802147 m!743537))

(push 1)

(assert (not b!802145))

(assert (not b!802149))

(assert (not start!68816))

(assert (not b!802154))

(assert (not b!802151))

(assert (not b!802155))

(assert (not b!802153))

(assert (not b!802147))

(assert (not b!802152))

(assert (not b!802148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

