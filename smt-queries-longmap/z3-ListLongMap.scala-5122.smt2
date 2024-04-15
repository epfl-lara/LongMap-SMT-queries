; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69534 () Bool)

(assert start!69534)

(declare-fun b!810346 () Bool)

(declare-fun res!553763 () Bool)

(declare-fun e!448524 () Bool)

(assert (=> b!810346 (=> (not res!553763) (not e!448524))))

(declare-datatypes ((array!44047 0))(
  ( (array!44048 (arr!21095 (Array (_ BitVec 32) (_ BitVec 64))) (size!21516 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44047)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44047 (_ BitVec 32)) Bool)

(assert (=> b!810346 (= res!553763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810347 () Bool)

(declare-fun res!553769 () Bool)

(assert (=> b!810347 (=> (not res!553769) (not e!448524))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810347 (= res!553769 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21516 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21095 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21516 a!3170)) (= (select (arr!21095 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810348 () Bool)

(declare-fun e!448526 () Bool)

(declare-fun e!448525 () Bool)

(assert (=> b!810348 (= e!448526 e!448525)))

(declare-fun res!553764 () Bool)

(assert (=> b!810348 (=> (not res!553764) (not e!448525))))

(declare-datatypes ((SeekEntryResult!8683 0))(
  ( (MissingZero!8683 (index!37100 (_ BitVec 32))) (Found!8683 (index!37101 (_ BitVec 32))) (Intermediate!8683 (undefined!9495 Bool) (index!37102 (_ BitVec 32)) (x!67922 (_ BitVec 32))) (Undefined!8683) (MissingVacant!8683 (index!37103 (_ BitVec 32))) )
))
(declare-fun lt!363080 () SeekEntryResult!8683)

(declare-fun lt!363085 () SeekEntryResult!8683)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810348 (= res!553764 (and (= lt!363080 lt!363085) (= lt!363085 (Found!8683 j!153)) (not (= (select (arr!21095 a!3170) index!1236) (select (arr!21095 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44047 (_ BitVec 32)) SeekEntryResult!8683)

(assert (=> b!810348 (= lt!363085 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44047 (_ BitVec 32)) SeekEntryResult!8683)

(assert (=> b!810348 (= lt!363080 (seekEntryOrOpen!0 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810349 () Bool)

(declare-fun res!553772 () Bool)

(declare-fun e!448527 () Bool)

(assert (=> b!810349 (=> (not res!553772) (not e!448527))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810349 (= res!553772 (validKeyInArray!0 k0!2044))))

(declare-fun b!810350 () Bool)

(declare-fun res!553765 () Bool)

(assert (=> b!810350 (=> (not res!553765) (not e!448527))))

(assert (=> b!810350 (= res!553765 (validKeyInArray!0 (select (arr!21095 a!3170) j!153)))))

(declare-fun b!810351 () Bool)

(declare-fun res!553766 () Bool)

(assert (=> b!810351 (=> (not res!553766) (not e!448527))))

(assert (=> b!810351 (= res!553766 (and (= (size!21516 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21516 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21516 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810352 () Bool)

(assert (=> b!810352 (= e!448524 e!448526)))

(declare-fun res!553767 () Bool)

(assert (=> b!810352 (=> (not res!553767) (not e!448526))))

(declare-fun lt!363082 () (_ BitVec 64))

(declare-fun lt!363081 () array!44047)

(assert (=> b!810352 (= res!553767 (= (seekEntryOrOpen!0 lt!363082 lt!363081 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363082 lt!363081 mask!3266)))))

(assert (=> b!810352 (= lt!363082 (select (store (arr!21095 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810352 (= lt!363081 (array!44048 (store (arr!21095 a!3170) i!1163 k0!2044) (size!21516 a!3170)))))

(declare-fun b!810353 () Bool)

(declare-fun res!553773 () Bool)

(assert (=> b!810353 (=> (not res!553773) (not e!448527))))

(declare-fun arrayContainsKey!0 (array!44047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810353 (= res!553773 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810354 () Bool)

(assert (=> b!810354 (= e!448525 (not true))))

(declare-fun lt!363084 () (_ BitVec 32))

(assert (=> b!810354 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363084 vacantAfter!23 lt!363082 lt!363081 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363084 vacantBefore!23 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27594 0))(
  ( (Unit!27595) )
))
(declare-fun lt!363083 () Unit!27594)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44047 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27594)

(assert (=> b!810354 (= lt!363083 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363084 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810354 (= lt!363084 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810356 () Bool)

(assert (=> b!810356 (= e!448527 e!448524)))

(declare-fun res!553768 () Bool)

(assert (=> b!810356 (=> (not res!553768) (not e!448524))))

(declare-fun lt!363086 () SeekEntryResult!8683)

(assert (=> b!810356 (= res!553768 (or (= lt!363086 (MissingZero!8683 i!1163)) (= lt!363086 (MissingVacant!8683 i!1163))))))

(assert (=> b!810356 (= lt!363086 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810355 () Bool)

(declare-fun res!553770 () Bool)

(assert (=> b!810355 (=> (not res!553770) (not e!448524))))

(declare-datatypes ((List!15097 0))(
  ( (Nil!15094) (Cons!15093 (h!16222 (_ BitVec 64)) (t!21403 List!15097)) )
))
(declare-fun arrayNoDuplicates!0 (array!44047 (_ BitVec 32) List!15097) Bool)

(assert (=> b!810355 (= res!553770 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15094))))

(declare-fun res!553771 () Bool)

(assert (=> start!69534 (=> (not res!553771) (not e!448527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69534 (= res!553771 (validMask!0 mask!3266))))

(assert (=> start!69534 e!448527))

(assert (=> start!69534 true))

(declare-fun array_inv!16978 (array!44047) Bool)

(assert (=> start!69534 (array_inv!16978 a!3170)))

(assert (= (and start!69534 res!553771) b!810351))

(assert (= (and b!810351 res!553766) b!810350))

(assert (= (and b!810350 res!553765) b!810349))

(assert (= (and b!810349 res!553772) b!810353))

(assert (= (and b!810353 res!553773) b!810356))

(assert (= (and b!810356 res!553768) b!810346))

(assert (= (and b!810346 res!553763) b!810355))

(assert (= (and b!810355 res!553770) b!810347))

(assert (= (and b!810347 res!553769) b!810352))

(assert (= (and b!810352 res!553767) b!810348))

(assert (= (and b!810348 res!553764) b!810354))

(declare-fun m!752047 () Bool)

(assert (=> b!810353 m!752047))

(declare-fun m!752049 () Bool)

(assert (=> b!810355 m!752049))

(declare-fun m!752051 () Bool)

(assert (=> b!810354 m!752051))

(declare-fun m!752053 () Bool)

(assert (=> b!810354 m!752053))

(declare-fun m!752055 () Bool)

(assert (=> b!810354 m!752055))

(assert (=> b!810354 m!752051))

(declare-fun m!752057 () Bool)

(assert (=> b!810354 m!752057))

(declare-fun m!752059 () Bool)

(assert (=> b!810354 m!752059))

(declare-fun m!752061 () Bool)

(assert (=> b!810348 m!752061))

(assert (=> b!810348 m!752051))

(assert (=> b!810348 m!752051))

(declare-fun m!752063 () Bool)

(assert (=> b!810348 m!752063))

(assert (=> b!810348 m!752051))

(declare-fun m!752065 () Bool)

(assert (=> b!810348 m!752065))

(declare-fun m!752067 () Bool)

(assert (=> start!69534 m!752067))

(declare-fun m!752069 () Bool)

(assert (=> start!69534 m!752069))

(assert (=> b!810350 m!752051))

(assert (=> b!810350 m!752051))

(declare-fun m!752071 () Bool)

(assert (=> b!810350 m!752071))

(declare-fun m!752073 () Bool)

(assert (=> b!810356 m!752073))

(declare-fun m!752075 () Bool)

(assert (=> b!810352 m!752075))

(declare-fun m!752077 () Bool)

(assert (=> b!810352 m!752077))

(declare-fun m!752079 () Bool)

(assert (=> b!810352 m!752079))

(declare-fun m!752081 () Bool)

(assert (=> b!810352 m!752081))

(declare-fun m!752083 () Bool)

(assert (=> b!810347 m!752083))

(declare-fun m!752085 () Bool)

(assert (=> b!810347 m!752085))

(declare-fun m!752087 () Bool)

(assert (=> b!810349 m!752087))

(declare-fun m!752089 () Bool)

(assert (=> b!810346 m!752089))

(check-sat (not b!810354) (not b!810348) (not b!810346) (not b!810353) (not b!810355) (not b!810352) (not start!69534) (not b!810350) (not b!810349) (not b!810356))
(check-sat)
