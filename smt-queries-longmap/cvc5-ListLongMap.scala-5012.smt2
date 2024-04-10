; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68582 () Bool)

(assert start!68582)

(declare-fun b!797870 () Bool)

(declare-fun res!542397 () Bool)

(declare-fun e!442623 () Bool)

(assert (=> b!797870 (=> (not res!542397) (not e!442623))))

(declare-datatypes ((array!43372 0))(
  ( (array!43373 (arr!20766 (Array (_ BitVec 32) (_ BitVec 64))) (size!21187 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43372)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797870 (= res!542397 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!542398 () Bool)

(assert (=> start!68582 (=> (not res!542398) (not e!442623))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68582 (= res!542398 (validMask!0 mask!3266))))

(assert (=> start!68582 e!442623))

(assert (=> start!68582 true))

(declare-fun array_inv!16562 (array!43372) Bool)

(assert (=> start!68582 (array_inv!16562 a!3170)))

(declare-fun b!797871 () Bool)

(declare-fun res!542389 () Bool)

(assert (=> b!797871 (=> (not res!542389) (not e!442623))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797871 (= res!542389 (and (= (size!21187 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21187 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21187 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797872 () Bool)

(declare-fun res!542393 () Bool)

(declare-fun e!442624 () Bool)

(assert (=> b!797872 (=> (not res!542393) (not e!442624))))

(declare-datatypes ((List!14729 0))(
  ( (Nil!14726) (Cons!14725 (h!15854 (_ BitVec 64)) (t!21044 List!14729)) )
))
(declare-fun arrayNoDuplicates!0 (array!43372 (_ BitVec 32) List!14729) Bool)

(assert (=> b!797872 (= res!542393 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14726))))

(declare-fun b!797873 () Bool)

(declare-fun e!442622 () Bool)

(assert (=> b!797873 (= e!442624 e!442622)))

(declare-fun res!542394 () Bool)

(assert (=> b!797873 (=> (not res!542394) (not e!442622))))

(declare-datatypes ((SeekEntryResult!8357 0))(
  ( (MissingZero!8357 (index!35796 (_ BitVec 32))) (Found!8357 (index!35797 (_ BitVec 32))) (Intermediate!8357 (undefined!9169 Bool) (index!35798 (_ BitVec 32)) (x!66691 (_ BitVec 32))) (Undefined!8357) (MissingVacant!8357 (index!35799 (_ BitVec 32))) )
))
(declare-fun lt!356051 () SeekEntryResult!8357)

(declare-fun lt!356053 () SeekEntryResult!8357)

(assert (=> b!797873 (= res!542394 (= lt!356051 lt!356053))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356054 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356048 () array!43372)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43372 (_ BitVec 32)) SeekEntryResult!8357)

(assert (=> b!797873 (= lt!356053 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356054 lt!356048 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43372 (_ BitVec 32)) SeekEntryResult!8357)

(assert (=> b!797873 (= lt!356051 (seekEntryOrOpen!0 lt!356054 lt!356048 mask!3266))))

(assert (=> b!797873 (= lt!356054 (select (store (arr!20766 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797873 (= lt!356048 (array!43373 (store (arr!20766 a!3170) i!1163 k!2044) (size!21187 a!3170)))))

(declare-fun b!797874 () Bool)

(declare-fun res!542392 () Bool)

(assert (=> b!797874 (=> (not res!542392) (not e!442624))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797874 (= res!542392 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21187 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20766 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21187 a!3170)) (= (select (arr!20766 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797875 () Bool)

(declare-fun res!542395 () Bool)

(assert (=> b!797875 (=> (not res!542395) (not e!442623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797875 (= res!542395 (validKeyInArray!0 (select (arr!20766 a!3170) j!153)))))

(declare-fun b!797876 () Bool)

(declare-fun e!442625 () Bool)

(assert (=> b!797876 (= e!442625 (not true))))

(assert (=> b!797876 (= lt!356053 (Found!8357 index!1236))))

(declare-fun b!797877 () Bool)

(declare-fun res!542396 () Bool)

(assert (=> b!797877 (=> (not res!542396) (not e!442624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43372 (_ BitVec 32)) Bool)

(assert (=> b!797877 (= res!542396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797878 () Bool)

(assert (=> b!797878 (= e!442623 e!442624)))

(declare-fun res!542399 () Bool)

(assert (=> b!797878 (=> (not res!542399) (not e!442624))))

(declare-fun lt!356052 () SeekEntryResult!8357)

(assert (=> b!797878 (= res!542399 (or (= lt!356052 (MissingZero!8357 i!1163)) (= lt!356052 (MissingVacant!8357 i!1163))))))

(assert (=> b!797878 (= lt!356052 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797879 () Bool)

(declare-fun res!542390 () Bool)

(assert (=> b!797879 (=> (not res!542390) (not e!442623))))

(assert (=> b!797879 (= res!542390 (validKeyInArray!0 k!2044))))

(declare-fun b!797880 () Bool)

(assert (=> b!797880 (= e!442622 e!442625)))

(declare-fun res!542391 () Bool)

(assert (=> b!797880 (=> (not res!542391) (not e!442625))))

(declare-fun lt!356049 () SeekEntryResult!8357)

(declare-fun lt!356050 () SeekEntryResult!8357)

(assert (=> b!797880 (= res!542391 (and (= lt!356050 lt!356049) (= lt!356049 (Found!8357 j!153)) (= (select (arr!20766 a!3170) index!1236) (select (arr!20766 a!3170) j!153))))))

(assert (=> b!797880 (= lt!356049 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20766 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797880 (= lt!356050 (seekEntryOrOpen!0 (select (arr!20766 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68582 res!542398) b!797871))

(assert (= (and b!797871 res!542389) b!797875))

(assert (= (and b!797875 res!542395) b!797879))

(assert (= (and b!797879 res!542390) b!797870))

(assert (= (and b!797870 res!542397) b!797878))

(assert (= (and b!797878 res!542399) b!797877))

(assert (= (and b!797877 res!542396) b!797872))

(assert (= (and b!797872 res!542393) b!797874))

(assert (= (and b!797874 res!542392) b!797873))

(assert (= (and b!797873 res!542394) b!797880))

(assert (= (and b!797880 res!542391) b!797876))

(declare-fun m!738743 () Bool)

(assert (=> b!797874 m!738743))

(declare-fun m!738745 () Bool)

(assert (=> b!797874 m!738745))

(declare-fun m!738747 () Bool)

(assert (=> b!797870 m!738747))

(declare-fun m!738749 () Bool)

(assert (=> b!797875 m!738749))

(assert (=> b!797875 m!738749))

(declare-fun m!738751 () Bool)

(assert (=> b!797875 m!738751))

(declare-fun m!738753 () Bool)

(assert (=> start!68582 m!738753))

(declare-fun m!738755 () Bool)

(assert (=> start!68582 m!738755))

(declare-fun m!738757 () Bool)

(assert (=> b!797873 m!738757))

(declare-fun m!738759 () Bool)

(assert (=> b!797873 m!738759))

(declare-fun m!738761 () Bool)

(assert (=> b!797873 m!738761))

(declare-fun m!738763 () Bool)

(assert (=> b!797873 m!738763))

(declare-fun m!738765 () Bool)

(assert (=> b!797879 m!738765))

(declare-fun m!738767 () Bool)

(assert (=> b!797878 m!738767))

(declare-fun m!738769 () Bool)

(assert (=> b!797877 m!738769))

(declare-fun m!738771 () Bool)

(assert (=> b!797872 m!738771))

(declare-fun m!738773 () Bool)

(assert (=> b!797880 m!738773))

(assert (=> b!797880 m!738749))

(assert (=> b!797880 m!738749))

(declare-fun m!738775 () Bool)

(assert (=> b!797880 m!738775))

(assert (=> b!797880 m!738749))

(declare-fun m!738777 () Bool)

(assert (=> b!797880 m!738777))

(push 1)

