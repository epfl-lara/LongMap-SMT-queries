; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69264 () Bool)

(assert start!69264)

(declare-fun b!808196 () Bool)

(declare-fun res!552325 () Bool)

(declare-fun e!447396 () Bool)

(assert (=> b!808196 (=> (not res!552325) (not e!447396))))

(declare-datatypes ((array!43964 0))(
  ( (array!43965 (arr!21059 (Array (_ BitVec 32) (_ BitVec 64))) (size!21480 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43964)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43964 (_ BitVec 32)) Bool)

(assert (=> b!808196 (= res!552325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808198 () Bool)

(declare-fun e!447394 () Bool)

(assert (=> b!808198 (= e!447396 e!447394)))

(declare-fun res!552327 () Bool)

(assert (=> b!808198 (=> (not res!552327) (not e!447394))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362145 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!362143 () array!43964)

(declare-datatypes ((SeekEntryResult!8650 0))(
  ( (MissingZero!8650 (index!36968 (_ BitVec 32))) (Found!8650 (index!36969 (_ BitVec 32))) (Intermediate!8650 (undefined!9462 Bool) (index!36970 (_ BitVec 32)) (x!67766 (_ BitVec 32))) (Undefined!8650) (MissingVacant!8650 (index!36971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43964 (_ BitVec 32)) SeekEntryResult!8650)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43964 (_ BitVec 32)) SeekEntryResult!8650)

(assert (=> b!808198 (= res!552327 (= (seekEntryOrOpen!0 lt!362145 lt!362143 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362145 lt!362143 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808198 (= lt!362145 (select (store (arr!21059 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808198 (= lt!362143 (array!43965 (store (arr!21059 a!3170) i!1163 k!2044) (size!21480 a!3170)))))

(declare-fun b!808199 () Bool)

(declare-fun res!552322 () Bool)

(assert (=> b!808199 (=> (not res!552322) (not e!447396))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808199 (= res!552322 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21480 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21059 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21480 a!3170)) (= (select (arr!21059 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808200 () Bool)

(declare-fun res!552320 () Bool)

(declare-fun e!447398 () Bool)

(assert (=> b!808200 (=> (not res!552320) (not e!447398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808200 (= res!552320 (validKeyInArray!0 k!2044))))

(declare-fun b!808201 () Bool)

(declare-fun res!552323 () Bool)

(assert (=> b!808201 (=> (not res!552323) (not e!447396))))

(declare-datatypes ((List!15022 0))(
  ( (Nil!15019) (Cons!15018 (h!16147 (_ BitVec 64)) (t!21337 List!15022)) )
))
(declare-fun arrayNoDuplicates!0 (array!43964 (_ BitVec 32) List!15022) Bool)

(assert (=> b!808201 (= res!552323 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15019))))

(declare-fun b!808202 () Bool)

(declare-fun res!552321 () Bool)

(assert (=> b!808202 (=> (not res!552321) (not e!447398))))

(assert (=> b!808202 (= res!552321 (and (= (size!21480 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21480 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21480 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808203 () Bool)

(assert (=> b!808203 (= e!447398 e!447396)))

(declare-fun res!552324 () Bool)

(assert (=> b!808203 (=> (not res!552324) (not e!447396))))

(declare-fun lt!362144 () SeekEntryResult!8650)

(assert (=> b!808203 (= res!552324 (or (= lt!362144 (MissingZero!8650 i!1163)) (= lt!362144 (MissingVacant!8650 i!1163))))))

(assert (=> b!808203 (= lt!362144 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808204 () Bool)

(declare-fun e!447395 () Bool)

(assert (=> b!808204 (= e!447394 e!447395)))

(declare-fun res!552328 () Bool)

(assert (=> b!808204 (=> (not res!552328) (not e!447395))))

(declare-fun lt!362142 () SeekEntryResult!8650)

(declare-fun lt!362146 () SeekEntryResult!8650)

(assert (=> b!808204 (= res!552328 (and (= lt!362146 lt!362142) (= lt!362142 (Found!8650 j!153)) (not (= (select (arr!21059 a!3170) index!1236) (select (arr!21059 a!3170) j!153)))))))

(assert (=> b!808204 (= lt!362142 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808204 (= lt!362146 (seekEntryOrOpen!0 (select (arr!21059 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!552329 () Bool)

(assert (=> start!69264 (=> (not res!552329) (not e!447398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69264 (= res!552329 (validMask!0 mask!3266))))

(assert (=> start!69264 e!447398))

(assert (=> start!69264 true))

(declare-fun array_inv!16855 (array!43964) Bool)

(assert (=> start!69264 (array_inv!16855 a!3170)))

(declare-fun b!808197 () Bool)

(assert (=> b!808197 (= e!447395 false)))

(declare-fun lt!362147 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808197 (= lt!362147 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808205 () Bool)

(declare-fun res!552319 () Bool)

(assert (=> b!808205 (=> (not res!552319) (not e!447398))))

(declare-fun arrayContainsKey!0 (array!43964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808205 (= res!552319 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808206 () Bool)

(declare-fun res!552326 () Bool)

(assert (=> b!808206 (=> (not res!552326) (not e!447398))))

(assert (=> b!808206 (= res!552326 (validKeyInArray!0 (select (arr!21059 a!3170) j!153)))))

(assert (= (and start!69264 res!552329) b!808202))

(assert (= (and b!808202 res!552321) b!808206))

(assert (= (and b!808206 res!552326) b!808200))

(assert (= (and b!808200 res!552320) b!808205))

(assert (= (and b!808205 res!552319) b!808203))

(assert (= (and b!808203 res!552324) b!808196))

(assert (= (and b!808196 res!552325) b!808201))

(assert (= (and b!808201 res!552323) b!808199))

(assert (= (and b!808199 res!552322) b!808198))

(assert (= (and b!808198 res!552327) b!808204))

(assert (= (and b!808204 res!552328) b!808197))

(declare-fun m!750345 () Bool)

(assert (=> start!69264 m!750345))

(declare-fun m!750347 () Bool)

(assert (=> start!69264 m!750347))

(declare-fun m!750349 () Bool)

(assert (=> b!808203 m!750349))

(declare-fun m!750351 () Bool)

(assert (=> b!808199 m!750351))

(declare-fun m!750353 () Bool)

(assert (=> b!808199 m!750353))

(declare-fun m!750355 () Bool)

(assert (=> b!808197 m!750355))

(declare-fun m!750357 () Bool)

(assert (=> b!808206 m!750357))

(assert (=> b!808206 m!750357))

(declare-fun m!750359 () Bool)

(assert (=> b!808206 m!750359))

(declare-fun m!750361 () Bool)

(assert (=> b!808196 m!750361))

(declare-fun m!750363 () Bool)

(assert (=> b!808200 m!750363))

(declare-fun m!750365 () Bool)

(assert (=> b!808201 m!750365))

(declare-fun m!750367 () Bool)

(assert (=> b!808205 m!750367))

(declare-fun m!750369 () Bool)

(assert (=> b!808198 m!750369))

(declare-fun m!750371 () Bool)

(assert (=> b!808198 m!750371))

(declare-fun m!750373 () Bool)

(assert (=> b!808198 m!750373))

(declare-fun m!750375 () Bool)

(assert (=> b!808198 m!750375))

(declare-fun m!750377 () Bool)

(assert (=> b!808204 m!750377))

(assert (=> b!808204 m!750357))

(assert (=> b!808204 m!750357))

(declare-fun m!750379 () Bool)

(assert (=> b!808204 m!750379))

(assert (=> b!808204 m!750357))

(declare-fun m!750381 () Bool)

(assert (=> b!808204 m!750381))

(push 1)

(assert (not b!808203))

(assert (not b!808204))

(assert (not b!808200))

(assert (not b!808201))

(assert (not b!808205))

