; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69546 () Bool)

(assert start!69546)

(declare-fun b!810434 () Bool)

(declare-fun e!448602 () Bool)

(declare-fun e!448604 () Bool)

(assert (=> b!810434 (= e!448602 e!448604)))

(declare-fun res!553716 () Bool)

(assert (=> b!810434 (=> (not res!553716) (not e!448604))))

(declare-datatypes ((SeekEntryResult!8683 0))(
  ( (MissingZero!8683 (index!37100 (_ BitVec 32))) (Found!8683 (index!37101 (_ BitVec 32))) (Intermediate!8683 (undefined!9495 Bool) (index!37102 (_ BitVec 32)) (x!67911 (_ BitVec 32))) (Undefined!8683) (MissingVacant!8683 (index!37103 (_ BitVec 32))) )
))
(declare-fun lt!363224 () SeekEntryResult!8683)

(declare-datatypes ((array!44042 0))(
  ( (array!44043 (arr!21092 (Array (_ BitVec 32) (_ BitVec 64))) (size!21513 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44042)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363220 () SeekEntryResult!8683)

(assert (=> b!810434 (= res!553716 (and (= lt!363224 lt!363220) (not (= (select (arr!21092 a!3170) index!1236) (select (arr!21092 a!3170) j!153)))))))

(assert (=> b!810434 (= lt!363220 (Found!8683 j!153))))

(declare-fun e!448600 () Bool)

(declare-fun lt!363218 () SeekEntryResult!8683)

(declare-fun lt!363216 () SeekEntryResult!8683)

(declare-fun b!810435 () Bool)

(assert (=> b!810435 (= e!448600 (and (= lt!363218 lt!363216) (not (= lt!363216 lt!363220))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!363221 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44042 (_ BitVec 32)) SeekEntryResult!8683)

(assert (=> b!810435 (= lt!363216 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363221 vacantBefore!23 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810436 () Bool)

(declare-fun res!553711 () Bool)

(declare-fun e!448598 () Bool)

(assert (=> b!810436 (=> (not res!553711) (not e!448598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810436 (= res!553711 (validKeyInArray!0 (select (arr!21092 a!3170) j!153)))))

(declare-fun b!810437 () Bool)

(declare-fun res!553720 () Bool)

(declare-fun e!448603 () Bool)

(assert (=> b!810437 (=> (not res!553720) (not e!448603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44042 (_ BitVec 32)) Bool)

(assert (=> b!810437 (= res!553720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810438 () Bool)

(declare-fun res!553714 () Bool)

(assert (=> b!810438 (=> (not res!553714) (not e!448598))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810438 (= res!553714 (and (= (size!21513 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21513 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21513 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810439 () Bool)

(declare-fun res!553723 () Bool)

(assert (=> b!810439 (=> (not res!553723) (not e!448598))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810439 (= res!553723 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!553712 () Bool)

(assert (=> start!69546 (=> (not res!553712) (not e!448598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69546 (= res!553712 (validMask!0 mask!3266))))

(assert (=> start!69546 e!448598))

(assert (=> start!69546 true))

(declare-fun array_inv!16888 (array!44042) Bool)

(assert (=> start!69546 (array_inv!16888 a!3170)))

(declare-fun b!810440 () Bool)

(declare-fun res!553724 () Bool)

(assert (=> b!810440 (=> (not res!553724) (not e!448600))))

(declare-fun lt!363222 () SeekEntryResult!8683)

(declare-fun lt!363217 () (_ BitVec 64))

(declare-fun lt!363223 () array!44042)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!810440 (= res!553724 (= lt!363222 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363221 vacantAfter!23 lt!363217 lt!363223 mask!3266)))))

(declare-fun b!810441 () Bool)

(declare-fun res!553719 () Bool)

(assert (=> b!810441 (=> (not res!553719) (not e!448603))))

(declare-datatypes ((List!15055 0))(
  ( (Nil!15052) (Cons!15051 (h!16180 (_ BitVec 64)) (t!21370 List!15055)) )
))
(declare-fun arrayNoDuplicates!0 (array!44042 (_ BitVec 32) List!15055) Bool)

(assert (=> b!810441 (= res!553719 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15052))))

(declare-fun b!810442 () Bool)

(declare-fun res!553715 () Bool)

(assert (=> b!810442 (=> (not res!553715) (not e!448603))))

(assert (=> b!810442 (= res!553715 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21513 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21092 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21513 a!3170)) (= (select (arr!21092 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810443 () Bool)

(declare-fun e!448599 () Bool)

(assert (=> b!810443 (= e!448599 e!448602)))

(declare-fun res!553721 () Bool)

(assert (=> b!810443 (=> (not res!553721) (not e!448602))))

(assert (=> b!810443 (= res!553721 (= lt!363218 lt!363224))))

(assert (=> b!810443 (= lt!363224 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44042 (_ BitVec 32)) SeekEntryResult!8683)

(assert (=> b!810443 (= lt!363218 (seekEntryOrOpen!0 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810444 () Bool)

(assert (=> b!810444 (= e!448598 e!448603)))

(declare-fun res!553713 () Bool)

(assert (=> b!810444 (=> (not res!553713) (not e!448603))))

(declare-fun lt!363219 () SeekEntryResult!8683)

(assert (=> b!810444 (= res!553713 (or (= lt!363219 (MissingZero!8683 i!1163)) (= lt!363219 (MissingVacant!8683 i!1163))))))

(assert (=> b!810444 (= lt!363219 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810445 () Bool)

(assert (=> b!810445 (= e!448604 e!448600)))

(declare-fun res!553722 () Bool)

(assert (=> b!810445 (=> (not res!553722) (not e!448600))))

(assert (=> b!810445 (= res!553722 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363221 #b00000000000000000000000000000000) (bvslt lt!363221 (size!21513 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810445 (= lt!363221 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810446 () Bool)

(declare-fun res!553717 () Bool)

(assert (=> b!810446 (=> (not res!553717) (not e!448598))))

(assert (=> b!810446 (= res!553717 (validKeyInArray!0 k!2044))))

(declare-fun b!810447 () Bool)

(assert (=> b!810447 (= e!448603 e!448599)))

(declare-fun res!553718 () Bool)

(assert (=> b!810447 (=> (not res!553718) (not e!448599))))

(assert (=> b!810447 (= res!553718 (= lt!363222 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363217 lt!363223 mask!3266)))))

(assert (=> b!810447 (= lt!363222 (seekEntryOrOpen!0 lt!363217 lt!363223 mask!3266))))

(assert (=> b!810447 (= lt!363217 (select (store (arr!21092 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810447 (= lt!363223 (array!44043 (store (arr!21092 a!3170) i!1163 k!2044) (size!21513 a!3170)))))

(assert (= (and start!69546 res!553712) b!810438))

(assert (= (and b!810438 res!553714) b!810436))

(assert (= (and b!810436 res!553711) b!810446))

(assert (= (and b!810446 res!553717) b!810439))

(assert (= (and b!810439 res!553723) b!810444))

(assert (= (and b!810444 res!553713) b!810437))

(assert (= (and b!810437 res!553720) b!810441))

(assert (= (and b!810441 res!553719) b!810442))

(assert (= (and b!810442 res!553715) b!810447))

(assert (= (and b!810447 res!553718) b!810443))

(assert (= (and b!810443 res!553721) b!810434))

(assert (= (and b!810434 res!553716) b!810445))

(assert (= (and b!810445 res!553722) b!810440))

(assert (= (and b!810440 res!553724) b!810435))

(declare-fun m!752621 () Bool)

(assert (=> b!810447 m!752621))

(declare-fun m!752623 () Bool)

(assert (=> b!810447 m!752623))

(declare-fun m!752625 () Bool)

(assert (=> b!810447 m!752625))

(declare-fun m!752627 () Bool)

(assert (=> b!810447 m!752627))

(declare-fun m!752629 () Bool)

(assert (=> b!810446 m!752629))

(declare-fun m!752631 () Bool)

(assert (=> b!810443 m!752631))

(assert (=> b!810443 m!752631))

(declare-fun m!752633 () Bool)

(assert (=> b!810443 m!752633))

(assert (=> b!810443 m!752631))

(declare-fun m!752635 () Bool)

(assert (=> b!810443 m!752635))

(declare-fun m!752637 () Bool)

(assert (=> b!810442 m!752637))

(declare-fun m!752639 () Bool)

(assert (=> b!810442 m!752639))

(declare-fun m!752641 () Bool)

(assert (=> b!810444 m!752641))

(declare-fun m!752643 () Bool)

(assert (=> b!810437 m!752643))

(declare-fun m!752645 () Bool)

(assert (=> start!69546 m!752645))

(declare-fun m!752647 () Bool)

(assert (=> start!69546 m!752647))

(declare-fun m!752649 () Bool)

(assert (=> b!810439 m!752649))

(assert (=> b!810436 m!752631))

(assert (=> b!810436 m!752631))

(declare-fun m!752651 () Bool)

(assert (=> b!810436 m!752651))

(declare-fun m!752653 () Bool)

(assert (=> b!810445 m!752653))

(assert (=> b!810435 m!752631))

(assert (=> b!810435 m!752631))

(declare-fun m!752655 () Bool)

(assert (=> b!810435 m!752655))

(declare-fun m!752657 () Bool)

(assert (=> b!810434 m!752657))

(assert (=> b!810434 m!752631))

(declare-fun m!752659 () Bool)

(assert (=> b!810440 m!752659))

(declare-fun m!752661 () Bool)

(assert (=> b!810441 m!752661))

(push 1)

