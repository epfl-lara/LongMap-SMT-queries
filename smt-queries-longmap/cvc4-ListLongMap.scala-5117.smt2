; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69420 () Bool)

(assert start!69420)

(declare-fun b!809510 () Bool)

(declare-fun res!553244 () Bool)

(declare-fun e!448082 () Bool)

(assert (=> b!809510 (=> (not res!553244) (not e!448082))))

(declare-datatypes ((array!44018 0))(
  ( (array!44019 (arr!21083 (Array (_ BitVec 32) (_ BitVec 64))) (size!21504 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44018)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809510 (= res!553244 (validKeyInArray!0 (select (arr!21083 a!3170) j!153)))))

(declare-fun b!809511 () Bool)

(declare-fun e!448078 () Bool)

(assert (=> b!809511 (= e!448082 e!448078)))

(declare-fun res!553239 () Bool)

(assert (=> b!809511 (=> (not res!553239) (not e!448078))))

(declare-datatypes ((SeekEntryResult!8674 0))(
  ( (MissingZero!8674 (index!37064 (_ BitVec 32))) (Found!8674 (index!37065 (_ BitVec 32))) (Intermediate!8674 (undefined!9486 Bool) (index!37066 (_ BitVec 32)) (x!67866 (_ BitVec 32))) (Undefined!8674) (MissingVacant!8674 (index!37067 (_ BitVec 32))) )
))
(declare-fun lt!362788 () SeekEntryResult!8674)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809511 (= res!553239 (or (= lt!362788 (MissingZero!8674 i!1163)) (= lt!362788 (MissingVacant!8674 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44018 (_ BitVec 32)) SeekEntryResult!8674)

(assert (=> b!809511 (= lt!362788 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809512 () Bool)

(declare-fun res!553238 () Bool)

(assert (=> b!809512 (=> (not res!553238) (not e!448078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44018 (_ BitVec 32)) Bool)

(assert (=> b!809512 (= res!553238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!553242 () Bool)

(assert (=> start!69420 (=> (not res!553242) (not e!448082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69420 (= res!553242 (validMask!0 mask!3266))))

(assert (=> start!69420 e!448082))

(assert (=> start!69420 true))

(declare-fun array_inv!16879 (array!44018) Bool)

(assert (=> start!69420 (array_inv!16879 a!3170)))

(declare-fun b!809513 () Bool)

(declare-fun res!553246 () Bool)

(assert (=> b!809513 (=> (not res!553246) (not e!448082))))

(assert (=> b!809513 (= res!553246 (and (= (size!21504 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21504 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21504 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809514 () Bool)

(declare-fun res!553241 () Bool)

(assert (=> b!809514 (=> (not res!553241) (not e!448078))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809514 (= res!553241 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21504 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21083 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21504 a!3170)) (= (select (arr!21083 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809515 () Bool)

(declare-fun res!553247 () Bool)

(assert (=> b!809515 (=> (not res!553247) (not e!448082))))

(declare-fun arrayContainsKey!0 (array!44018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809515 (= res!553247 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809516 () Bool)

(declare-fun e!448079 () Bool)

(declare-fun e!448081 () Bool)

(assert (=> b!809516 (= e!448079 e!448081)))

(declare-fun res!553243 () Bool)

(assert (=> b!809516 (=> (not res!553243) (not e!448081))))

(declare-fun lt!362784 () SeekEntryResult!8674)

(declare-fun lt!362789 () SeekEntryResult!8674)

(assert (=> b!809516 (= res!553243 (and (= lt!362789 lt!362784) (= lt!362784 (Found!8674 j!153)) (not (= (select (arr!21083 a!3170) index!1236) (select (arr!21083 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44018 (_ BitVec 32)) SeekEntryResult!8674)

(assert (=> b!809516 (= lt!362784 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809516 (= lt!362789 (seekEntryOrOpen!0 (select (arr!21083 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809517 () Bool)

(assert (=> b!809517 (= e!448078 e!448079)))

(declare-fun res!553237 () Bool)

(assert (=> b!809517 (=> (not res!553237) (not e!448079))))

(declare-fun lt!362787 () array!44018)

(declare-fun lt!362785 () (_ BitVec 64))

(assert (=> b!809517 (= res!553237 (= (seekEntryOrOpen!0 lt!362785 lt!362787 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362785 lt!362787 mask!3266)))))

(assert (=> b!809517 (= lt!362785 (select (store (arr!21083 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809517 (= lt!362787 (array!44019 (store (arr!21083 a!3170) i!1163 k!2044) (size!21504 a!3170)))))

(declare-fun b!809518 () Bool)

(declare-fun res!553245 () Bool)

(assert (=> b!809518 (=> (not res!553245) (not e!448078))))

(declare-datatypes ((List!15046 0))(
  ( (Nil!15043) (Cons!15042 (h!16171 (_ BitVec 64)) (t!21361 List!15046)) )
))
(declare-fun arrayNoDuplicates!0 (array!44018 (_ BitVec 32) List!15046) Bool)

(assert (=> b!809518 (= res!553245 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15043))))

(declare-fun b!809519 () Bool)

(assert (=> b!809519 (= e!448081 false)))

(declare-fun lt!362786 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809519 (= lt!362786 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809520 () Bool)

(declare-fun res!553240 () Bool)

(assert (=> b!809520 (=> (not res!553240) (not e!448082))))

(assert (=> b!809520 (= res!553240 (validKeyInArray!0 k!2044))))

(assert (= (and start!69420 res!553242) b!809513))

(assert (= (and b!809513 res!553246) b!809510))

(assert (= (and b!809510 res!553244) b!809520))

(assert (= (and b!809520 res!553240) b!809515))

(assert (= (and b!809515 res!553247) b!809511))

(assert (= (and b!809511 res!553239) b!809512))

(assert (= (and b!809512 res!553238) b!809518))

(assert (= (and b!809518 res!553245) b!809514))

(assert (= (and b!809514 res!553241) b!809517))

(assert (= (and b!809517 res!553237) b!809516))

(assert (= (and b!809516 res!553243) b!809519))

(declare-fun m!751713 () Bool)

(assert (=> b!809519 m!751713))

(declare-fun m!751715 () Bool)

(assert (=> b!809514 m!751715))

(declare-fun m!751717 () Bool)

(assert (=> b!809514 m!751717))

(declare-fun m!751719 () Bool)

(assert (=> b!809516 m!751719))

(declare-fun m!751721 () Bool)

(assert (=> b!809516 m!751721))

(assert (=> b!809516 m!751721))

(declare-fun m!751723 () Bool)

(assert (=> b!809516 m!751723))

(assert (=> b!809516 m!751721))

(declare-fun m!751725 () Bool)

(assert (=> b!809516 m!751725))

(assert (=> b!809510 m!751721))

(assert (=> b!809510 m!751721))

(declare-fun m!751727 () Bool)

(assert (=> b!809510 m!751727))

(declare-fun m!751729 () Bool)

(assert (=> b!809512 m!751729))

(declare-fun m!751731 () Bool)

(assert (=> b!809511 m!751731))

(declare-fun m!751733 () Bool)

(assert (=> b!809515 m!751733))

(declare-fun m!751735 () Bool)

(assert (=> start!69420 m!751735))

(declare-fun m!751737 () Bool)

(assert (=> start!69420 m!751737))

(declare-fun m!751739 () Bool)

(assert (=> b!809520 m!751739))

(declare-fun m!751741 () Bool)

(assert (=> b!809518 m!751741))

(declare-fun m!751743 () Bool)

(assert (=> b!809517 m!751743))

(declare-fun m!751745 () Bool)

(assert (=> b!809517 m!751745))

(declare-fun m!751747 () Bool)

(assert (=> b!809517 m!751747))

(declare-fun m!751749 () Bool)

(assert (=> b!809517 m!751749))

(push 1)

