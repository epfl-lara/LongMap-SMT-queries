; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69260 () Bool)

(assert start!69260)

(declare-fun b!806759 () Bool)

(declare-fun res!550533 () Bool)

(declare-fun e!446859 () Bool)

(assert (=> b!806759 (=> (not res!550533) (not e!446859))))

(declare-datatypes ((array!43837 0))(
  ( (array!43838 (arr!20992 (Array (_ BitVec 32) (_ BitVec 64))) (size!21412 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43837)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806759 (= res!550533 (validKeyInArray!0 (select (arr!20992 a!3170) j!153)))))

(declare-fun b!806760 () Bool)

(declare-fun res!550538 () Bool)

(assert (=> b!806760 (=> (not res!550538) (not e!446859))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806760 (= res!550538 (validKeyInArray!0 k0!2044))))

(declare-fun b!806761 () Bool)

(declare-fun res!550532 () Bool)

(assert (=> b!806761 (=> (not res!550532) (not e!446859))))

(declare-fun arrayContainsKey!0 (array!43837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806761 (= res!550532 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806762 () Bool)

(declare-fun res!550535 () Bool)

(declare-fun e!446858 () Bool)

(assert (=> b!806762 (=> (not res!550535) (not e!446858))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43837 (_ BitVec 32)) Bool)

(assert (=> b!806762 (= res!550535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806763 () Bool)

(declare-fun e!446856 () Bool)

(assert (=> b!806763 (= e!446856 (not true))))

(declare-datatypes ((SeekEntryResult!8539 0))(
  ( (MissingZero!8539 (index!36524 (_ BitVec 32))) (Found!8539 (index!36525 (_ BitVec 32))) (Intermediate!8539 (undefined!9351 Bool) (index!36526 (_ BitVec 32)) (x!67506 (_ BitVec 32))) (Undefined!8539) (MissingVacant!8539 (index!36527 (_ BitVec 32))) )
))
(declare-fun lt!361200 () SeekEntryResult!8539)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806763 (= lt!361200 (Found!8539 index!1236))))

(declare-fun b!806764 () Bool)

(declare-fun res!550534 () Bool)

(assert (=> b!806764 (=> (not res!550534) (not e!446858))))

(declare-datatypes ((List!14862 0))(
  ( (Nil!14859) (Cons!14858 (h!15993 (_ BitVec 64)) (t!21169 List!14862)) )
))
(declare-fun arrayNoDuplicates!0 (array!43837 (_ BitVec 32) List!14862) Bool)

(assert (=> b!806764 (= res!550534 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14859))))

(declare-fun b!806765 () Bool)

(declare-fun res!550541 () Bool)

(assert (=> b!806765 (=> (not res!550541) (not e!446859))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806765 (= res!550541 (and (= (size!21412 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21412 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21412 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806766 () Bool)

(declare-fun res!550540 () Bool)

(assert (=> b!806766 (=> (not res!550540) (not e!446858))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806766 (= res!550540 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21412 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20992 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21412 a!3170)) (= (select (arr!20992 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806767 () Bool)

(assert (=> b!806767 (= e!446859 e!446858)))

(declare-fun res!550537 () Bool)

(assert (=> b!806767 (=> (not res!550537) (not e!446858))))

(declare-fun lt!361204 () SeekEntryResult!8539)

(assert (=> b!806767 (= res!550537 (or (= lt!361204 (MissingZero!8539 i!1163)) (= lt!361204 (MissingVacant!8539 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43837 (_ BitVec 32)) SeekEntryResult!8539)

(assert (=> b!806767 (= lt!361204 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550542 () Bool)

(assert (=> start!69260 (=> (not res!550542) (not e!446859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69260 (= res!550542 (validMask!0 mask!3266))))

(assert (=> start!69260 e!446859))

(assert (=> start!69260 true))

(declare-fun array_inv!16851 (array!43837) Bool)

(assert (=> start!69260 (array_inv!16851 a!3170)))

(declare-fun b!806768 () Bool)

(declare-fun e!446860 () Bool)

(assert (=> b!806768 (= e!446860 e!446856)))

(declare-fun res!550539 () Bool)

(assert (=> b!806768 (=> (not res!550539) (not e!446856))))

(declare-fun lt!361201 () SeekEntryResult!8539)

(declare-fun lt!361199 () SeekEntryResult!8539)

(assert (=> b!806768 (= res!550539 (and (= lt!361199 lt!361201) (= lt!361201 (Found!8539 j!153)) (= (select (arr!20992 a!3170) index!1236) (select (arr!20992 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43837 (_ BitVec 32)) SeekEntryResult!8539)

(assert (=> b!806768 (= lt!361201 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806768 (= lt!361199 (seekEntryOrOpen!0 (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806769 () Bool)

(assert (=> b!806769 (= e!446858 e!446860)))

(declare-fun res!550536 () Bool)

(assert (=> b!806769 (=> (not res!550536) (not e!446860))))

(declare-fun lt!361205 () SeekEntryResult!8539)

(assert (=> b!806769 (= res!550536 (= lt!361205 lt!361200))))

(declare-fun lt!361203 () (_ BitVec 64))

(declare-fun lt!361202 () array!43837)

(assert (=> b!806769 (= lt!361200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361203 lt!361202 mask!3266))))

(assert (=> b!806769 (= lt!361205 (seekEntryOrOpen!0 lt!361203 lt!361202 mask!3266))))

(assert (=> b!806769 (= lt!361203 (select (store (arr!20992 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806769 (= lt!361202 (array!43838 (store (arr!20992 a!3170) i!1163 k0!2044) (size!21412 a!3170)))))

(assert (= (and start!69260 res!550542) b!806765))

(assert (= (and b!806765 res!550541) b!806759))

(assert (= (and b!806759 res!550533) b!806760))

(assert (= (and b!806760 res!550538) b!806761))

(assert (= (and b!806761 res!550532) b!806767))

(assert (= (and b!806767 res!550537) b!806762))

(assert (= (and b!806762 res!550535) b!806764))

(assert (= (and b!806764 res!550534) b!806766))

(assert (= (and b!806766 res!550540) b!806769))

(assert (= (and b!806769 res!550536) b!806768))

(assert (= (and b!806768 res!550539) b!806763))

(declare-fun m!749065 () Bool)

(assert (=> b!806767 m!749065))

(declare-fun m!749067 () Bool)

(assert (=> b!806762 m!749067))

(declare-fun m!749069 () Bool)

(assert (=> b!806764 m!749069))

(declare-fun m!749071 () Bool)

(assert (=> b!806768 m!749071))

(declare-fun m!749073 () Bool)

(assert (=> b!806768 m!749073))

(assert (=> b!806768 m!749073))

(declare-fun m!749075 () Bool)

(assert (=> b!806768 m!749075))

(assert (=> b!806768 m!749073))

(declare-fun m!749077 () Bool)

(assert (=> b!806768 m!749077))

(declare-fun m!749079 () Bool)

(assert (=> b!806769 m!749079))

(declare-fun m!749081 () Bool)

(assert (=> b!806769 m!749081))

(declare-fun m!749083 () Bool)

(assert (=> b!806769 m!749083))

(declare-fun m!749085 () Bool)

(assert (=> b!806769 m!749085))

(declare-fun m!749087 () Bool)

(assert (=> b!806761 m!749087))

(declare-fun m!749089 () Bool)

(assert (=> start!69260 m!749089))

(declare-fun m!749091 () Bool)

(assert (=> start!69260 m!749091))

(declare-fun m!749093 () Bool)

(assert (=> b!806760 m!749093))

(declare-fun m!749095 () Bool)

(assert (=> b!806766 m!749095))

(declare-fun m!749097 () Bool)

(assert (=> b!806766 m!749097))

(assert (=> b!806759 m!749073))

(assert (=> b!806759 m!749073))

(declare-fun m!749099 () Bool)

(assert (=> b!806759 m!749099))

(check-sat (not b!806759) (not b!806768) (not b!806764) (not b!806760) (not b!806762) (not start!69260) (not b!806761) (not b!806769) (not b!806767))
(check-sat)
