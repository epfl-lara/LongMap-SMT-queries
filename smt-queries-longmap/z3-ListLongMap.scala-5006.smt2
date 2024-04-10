; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68548 () Bool)

(assert start!68548)

(declare-fun b!797264 () Bool)

(declare-fun res!541786 () Bool)

(declare-fun e!442324 () Bool)

(assert (=> b!797264 (=> (not res!541786) (not e!442324))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43338 0))(
  ( (array!43339 (arr!20749 (Array (_ BitVec 32) (_ BitVec 64))) (size!21170 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43338)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797264 (= res!541786 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21170 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20749 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21170 a!3170)) (= (select (arr!20749 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797265 () Bool)

(declare-fun res!541791 () Bool)

(assert (=> b!797265 (=> (not res!541791) (not e!442324))))

(declare-datatypes ((List!14712 0))(
  ( (Nil!14709) (Cons!14708 (h!15837 (_ BitVec 64)) (t!21027 List!14712)) )
))
(declare-fun arrayNoDuplicates!0 (array!43338 (_ BitVec 32) List!14712) Bool)

(assert (=> b!797265 (= res!541791 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14709))))

(declare-fun b!797266 () Bool)

(declare-fun e!442325 () Bool)

(assert (=> b!797266 (= e!442325 (not true))))

(declare-datatypes ((SeekEntryResult!8340 0))(
  ( (MissingZero!8340 (index!35728 (_ BitVec 32))) (Found!8340 (index!35729 (_ BitVec 32))) (Intermediate!8340 (undefined!9152 Bool) (index!35730 (_ BitVec 32)) (x!66626 (_ BitVec 32))) (Undefined!8340) (MissingVacant!8340 (index!35731 (_ BitVec 32))) )
))
(declare-fun lt!355655 () SeekEntryResult!8340)

(assert (=> b!797266 (= lt!355655 (Found!8340 index!1236))))

(declare-fun b!797267 () Bool)

(declare-fun res!541788 () Bool)

(declare-fun e!442323 () Bool)

(assert (=> b!797267 (=> (not res!541788) (not e!442323))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797267 (= res!541788 (validKeyInArray!0 k0!2044))))

(declare-fun b!797268 () Bool)

(declare-fun res!541783 () Bool)

(assert (=> b!797268 (=> (not res!541783) (not e!442323))))

(declare-fun arrayContainsKey!0 (array!43338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797268 (= res!541783 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797269 () Bool)

(declare-fun res!541789 () Bool)

(assert (=> b!797269 (=> (not res!541789) (not e!442323))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797269 (= res!541789 (validKeyInArray!0 (select (arr!20749 a!3170) j!153)))))

(declare-fun res!541790 () Bool)

(assert (=> start!68548 (=> (not res!541790) (not e!442323))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68548 (= res!541790 (validMask!0 mask!3266))))

(assert (=> start!68548 e!442323))

(assert (=> start!68548 true))

(declare-fun array_inv!16545 (array!43338) Bool)

(assert (=> start!68548 (array_inv!16545 a!3170)))

(declare-fun b!797270 () Bool)

(declare-fun e!442322 () Bool)

(assert (=> b!797270 (= e!442324 e!442322)))

(declare-fun res!541787 () Bool)

(assert (=> b!797270 (=> (not res!541787) (not e!442322))))

(declare-fun lt!355656 () SeekEntryResult!8340)

(assert (=> b!797270 (= res!541787 (= lt!355656 lt!355655))))

(declare-fun lt!355658 () array!43338)

(declare-fun lt!355660 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43338 (_ BitVec 32)) SeekEntryResult!8340)

(assert (=> b!797270 (= lt!355655 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355660 lt!355658 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43338 (_ BitVec 32)) SeekEntryResult!8340)

(assert (=> b!797270 (= lt!355656 (seekEntryOrOpen!0 lt!355660 lt!355658 mask!3266))))

(assert (=> b!797270 (= lt!355660 (select (store (arr!20749 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797270 (= lt!355658 (array!43339 (store (arr!20749 a!3170) i!1163 k0!2044) (size!21170 a!3170)))))

(declare-fun b!797271 () Bool)

(declare-fun res!541784 () Bool)

(assert (=> b!797271 (=> (not res!541784) (not e!442323))))

(assert (=> b!797271 (= res!541784 (and (= (size!21170 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21170 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21170 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797272 () Bool)

(assert (=> b!797272 (= e!442323 e!442324)))

(declare-fun res!541785 () Bool)

(assert (=> b!797272 (=> (not res!541785) (not e!442324))))

(declare-fun lt!355661 () SeekEntryResult!8340)

(assert (=> b!797272 (= res!541785 (or (= lt!355661 (MissingZero!8340 i!1163)) (= lt!355661 (MissingVacant!8340 i!1163))))))

(assert (=> b!797272 (= lt!355661 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797273 () Bool)

(declare-fun res!541792 () Bool)

(assert (=> b!797273 (=> (not res!541792) (not e!442324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43338 (_ BitVec 32)) Bool)

(assert (=> b!797273 (= res!541792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797274 () Bool)

(assert (=> b!797274 (= e!442322 e!442325)))

(declare-fun res!541793 () Bool)

(assert (=> b!797274 (=> (not res!541793) (not e!442325))))

(declare-fun lt!355657 () SeekEntryResult!8340)

(declare-fun lt!355659 () SeekEntryResult!8340)

(assert (=> b!797274 (= res!541793 (and (= lt!355659 lt!355657) (= lt!355657 (Found!8340 j!153)) (= (select (arr!20749 a!3170) index!1236) (select (arr!20749 a!3170) j!153))))))

(assert (=> b!797274 (= lt!355657 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20749 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797274 (= lt!355659 (seekEntryOrOpen!0 (select (arr!20749 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68548 res!541790) b!797271))

(assert (= (and b!797271 res!541784) b!797269))

(assert (= (and b!797269 res!541789) b!797267))

(assert (= (and b!797267 res!541788) b!797268))

(assert (= (and b!797268 res!541783) b!797272))

(assert (= (and b!797272 res!541785) b!797273))

(assert (= (and b!797273 res!541792) b!797265))

(assert (= (and b!797265 res!541791) b!797264))

(assert (= (and b!797264 res!541786) b!797270))

(assert (= (and b!797270 res!541787) b!797274))

(assert (= (and b!797274 res!541793) b!797266))

(declare-fun m!738113 () Bool)

(assert (=> b!797265 m!738113))

(declare-fun m!738115 () Bool)

(assert (=> b!797264 m!738115))

(declare-fun m!738117 () Bool)

(assert (=> b!797264 m!738117))

(declare-fun m!738119 () Bool)

(assert (=> b!797273 m!738119))

(declare-fun m!738121 () Bool)

(assert (=> b!797272 m!738121))

(declare-fun m!738123 () Bool)

(assert (=> b!797274 m!738123))

(declare-fun m!738125 () Bool)

(assert (=> b!797274 m!738125))

(assert (=> b!797274 m!738125))

(declare-fun m!738127 () Bool)

(assert (=> b!797274 m!738127))

(assert (=> b!797274 m!738125))

(declare-fun m!738129 () Bool)

(assert (=> b!797274 m!738129))

(declare-fun m!738131 () Bool)

(assert (=> start!68548 m!738131))

(declare-fun m!738133 () Bool)

(assert (=> start!68548 m!738133))

(declare-fun m!738135 () Bool)

(assert (=> b!797267 m!738135))

(assert (=> b!797269 m!738125))

(assert (=> b!797269 m!738125))

(declare-fun m!738137 () Bool)

(assert (=> b!797269 m!738137))

(declare-fun m!738139 () Bool)

(assert (=> b!797268 m!738139))

(declare-fun m!738141 () Bool)

(assert (=> b!797270 m!738141))

(declare-fun m!738143 () Bool)

(assert (=> b!797270 m!738143))

(declare-fun m!738145 () Bool)

(assert (=> b!797270 m!738145))

(declare-fun m!738147 () Bool)

(assert (=> b!797270 m!738147))

(check-sat (not b!797274) (not b!797268) (not b!797269) (not start!68548) (not b!797273) (not b!797272) (not b!797267) (not b!797265) (not b!797270))
(check-sat)
