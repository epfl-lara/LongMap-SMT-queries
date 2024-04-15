; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68988 () Bool)

(assert start!68988)

(declare-fun b!804809 () Bool)

(declare-fun res!549474 () Bool)

(declare-fun e!445744 () Bool)

(assert (=> b!804809 (=> (not res!549474) (not e!445744))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43795 0))(
  ( (array!43796 (arr!20978 (Array (_ BitVec 32) (_ BitVec 64))) (size!21399 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43795)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804809 (= res!549474 (and (= (size!21399 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21399 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21399 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804810 () Bool)

(declare-fun res!549477 () Bool)

(declare-fun e!445743 () Bool)

(assert (=> b!804810 (=> (not res!549477) (not e!445743))))

(declare-datatypes ((List!14980 0))(
  ( (Nil!14977) (Cons!14976 (h!16105 (_ BitVec 64)) (t!21286 List!14980)) )
))
(declare-fun arrayNoDuplicates!0 (array!43795 (_ BitVec 32) List!14980) Bool)

(assert (=> b!804810 (= res!549477 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14977))))

(declare-fun b!804811 () Bool)

(declare-fun res!549471 () Bool)

(assert (=> b!804811 (=> (not res!549471) (not e!445744))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804811 (= res!549471 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804812 () Bool)

(assert (=> b!804812 (= e!445744 e!445743)))

(declare-fun res!549468 () Bool)

(assert (=> b!804812 (=> (not res!549468) (not e!445743))))

(declare-datatypes ((SeekEntryResult!8566 0))(
  ( (MissingZero!8566 (index!36632 (_ BitVec 32))) (Found!8566 (index!36633 (_ BitVec 32))) (Intermediate!8566 (undefined!9378 Bool) (index!36634 (_ BitVec 32)) (x!67463 (_ BitVec 32))) (Undefined!8566) (MissingVacant!8566 (index!36635 (_ BitVec 32))) )
))
(declare-fun lt!360199 () SeekEntryResult!8566)

(assert (=> b!804812 (= res!549468 (or (= lt!360199 (MissingZero!8566 i!1163)) (= lt!360199 (MissingVacant!8566 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43795 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!804812 (= lt!360199 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!549473 () Bool)

(assert (=> start!68988 (=> (not res!549473) (not e!445744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68988 (= res!549473 (validMask!0 mask!3266))))

(assert (=> start!68988 e!445744))

(assert (=> start!68988 true))

(declare-fun array_inv!16861 (array!43795) Bool)

(assert (=> start!68988 (array_inv!16861 a!3170)))

(declare-fun b!804813 () Bool)

(declare-fun res!549475 () Bool)

(assert (=> b!804813 (=> (not res!549475) (not e!445744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804813 (= res!549475 (validKeyInArray!0 (select (arr!20978 a!3170) j!153)))))

(declare-fun b!804814 () Bool)

(declare-fun res!549476 () Bool)

(assert (=> b!804814 (=> (not res!549476) (not e!445743))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804814 (= res!549476 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21399 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20978 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21399 a!3170)) (= (select (arr!20978 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804815 () Bool)

(declare-fun e!445742 () Bool)

(assert (=> b!804815 (= e!445743 e!445742)))

(declare-fun res!549470 () Bool)

(assert (=> b!804815 (=> (not res!549470) (not e!445742))))

(declare-fun lt!360196 () (_ BitVec 64))

(declare-fun lt!360197 () array!43795)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43795 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!804815 (= res!549470 (= (seekEntryOrOpen!0 lt!360196 lt!360197 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360196 lt!360197 mask!3266)))))

(assert (=> b!804815 (= lt!360196 (select (store (arr!20978 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804815 (= lt!360197 (array!43796 (store (arr!20978 a!3170) i!1163 k0!2044) (size!21399 a!3170)))))

(declare-fun b!804816 () Bool)

(assert (=> b!804816 (= e!445742 false)))

(declare-fun lt!360198 () SeekEntryResult!8566)

(assert (=> b!804816 (= lt!360198 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20978 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360200 () SeekEntryResult!8566)

(assert (=> b!804816 (= lt!360200 (seekEntryOrOpen!0 (select (arr!20978 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804817 () Bool)

(declare-fun res!549472 () Bool)

(assert (=> b!804817 (=> (not res!549472) (not e!445743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43795 (_ BitVec 32)) Bool)

(assert (=> b!804817 (= res!549472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804818 () Bool)

(declare-fun res!549469 () Bool)

(assert (=> b!804818 (=> (not res!549469) (not e!445744))))

(assert (=> b!804818 (= res!549469 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68988 res!549473) b!804809))

(assert (= (and b!804809 res!549474) b!804813))

(assert (= (and b!804813 res!549475) b!804818))

(assert (= (and b!804818 res!549469) b!804811))

(assert (= (and b!804811 res!549471) b!804812))

(assert (= (and b!804812 res!549468) b!804817))

(assert (= (and b!804817 res!549472) b!804810))

(assert (= (and b!804810 res!549477) b!804814))

(assert (= (and b!804814 res!549476) b!804815))

(assert (= (and b!804815 res!549470) b!804816))

(declare-fun m!746215 () Bool)

(assert (=> b!804813 m!746215))

(assert (=> b!804813 m!746215))

(declare-fun m!746217 () Bool)

(assert (=> b!804813 m!746217))

(declare-fun m!746219 () Bool)

(assert (=> b!804810 m!746219))

(declare-fun m!746221 () Bool)

(assert (=> b!804811 m!746221))

(declare-fun m!746223 () Bool)

(assert (=> b!804812 m!746223))

(assert (=> b!804816 m!746215))

(assert (=> b!804816 m!746215))

(declare-fun m!746225 () Bool)

(assert (=> b!804816 m!746225))

(assert (=> b!804816 m!746215))

(declare-fun m!746227 () Bool)

(assert (=> b!804816 m!746227))

(declare-fun m!746229 () Bool)

(assert (=> start!68988 m!746229))

(declare-fun m!746231 () Bool)

(assert (=> start!68988 m!746231))

(declare-fun m!746233 () Bool)

(assert (=> b!804818 m!746233))

(declare-fun m!746235 () Bool)

(assert (=> b!804815 m!746235))

(declare-fun m!746237 () Bool)

(assert (=> b!804815 m!746237))

(declare-fun m!746239 () Bool)

(assert (=> b!804815 m!746239))

(declare-fun m!746241 () Bool)

(assert (=> b!804815 m!746241))

(declare-fun m!746243 () Bool)

(assert (=> b!804814 m!746243))

(declare-fun m!746245 () Bool)

(assert (=> b!804814 m!746245))

(declare-fun m!746247 () Bool)

(assert (=> b!804817 m!746247))

(check-sat (not b!804813) (not b!804816) (not b!804811) (not b!804812) (not b!804817) (not b!804815) (not start!68988) (not b!804818) (not b!804810))
(check-sat)
