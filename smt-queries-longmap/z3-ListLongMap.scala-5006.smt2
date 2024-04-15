; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68526 () Bool)

(assert start!68526)

(declare-fun b!796981 () Bool)

(declare-fun res!541647 () Bool)

(declare-fun e!442152 () Bool)

(assert (=> b!796981 (=> (not res!541647) (not e!442152))))

(declare-datatypes ((array!43333 0))(
  ( (array!43334 (arr!20747 (Array (_ BitVec 32) (_ BitVec 64))) (size!21168 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43333)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796981 (= res!541647 (validKeyInArray!0 (select (arr!20747 a!3170) j!153)))))

(declare-fun b!796982 () Bool)

(declare-fun res!541643 () Bool)

(declare-fun e!442155 () Bool)

(assert (=> b!796982 (=> (not res!541643) (not e!442155))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43333 (_ BitVec 32)) Bool)

(assert (=> b!796982 (= res!541643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796983 () Bool)

(declare-fun e!442156 () Bool)

(assert (=> b!796983 (= e!442156 (not true))))

(declare-datatypes ((SeekEntryResult!8335 0))(
  ( (MissingZero!8335 (index!35708 (_ BitVec 32))) (Found!8335 (index!35709 (_ BitVec 32))) (Intermediate!8335 (undefined!9147 Bool) (index!35710 (_ BitVec 32)) (x!66616 (_ BitVec 32))) (Undefined!8335) (MissingVacant!8335 (index!35711 (_ BitVec 32))) )
))
(declare-fun lt!355397 () SeekEntryResult!8335)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796983 (= lt!355397 (Found!8335 index!1236))))

(declare-fun b!796984 () Bool)

(declare-fun res!541641 () Bool)

(assert (=> b!796984 (=> (not res!541641) (not e!442152))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!796984 (= res!541641 (validKeyInArray!0 k0!2044))))

(declare-fun b!796986 () Bool)

(declare-fun res!541650 () Bool)

(assert (=> b!796986 (=> (not res!541650) (not e!442155))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796986 (= res!541650 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21168 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20747 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21168 a!3170)) (= (select (arr!20747 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796987 () Bool)

(declare-fun e!442154 () Bool)

(assert (=> b!796987 (= e!442154 e!442156)))

(declare-fun res!541640 () Bool)

(assert (=> b!796987 (=> (not res!541640) (not e!442156))))

(declare-fun lt!355395 () SeekEntryResult!8335)

(declare-fun lt!355400 () SeekEntryResult!8335)

(assert (=> b!796987 (= res!541640 (and (= lt!355395 lt!355400) (= lt!355400 (Found!8335 j!153)) (= (select (arr!20747 a!3170) index!1236) (select (arr!20747 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43333 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!796987 (= lt!355400 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20747 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43333 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!796987 (= lt!355395 (seekEntryOrOpen!0 (select (arr!20747 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796988 () Bool)

(declare-fun res!541642 () Bool)

(assert (=> b!796988 (=> (not res!541642) (not e!442155))))

(declare-datatypes ((List!14749 0))(
  ( (Nil!14746) (Cons!14745 (h!15874 (_ BitVec 64)) (t!21055 List!14749)) )
))
(declare-fun arrayNoDuplicates!0 (array!43333 (_ BitVec 32) List!14749) Bool)

(assert (=> b!796988 (= res!541642 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14746))))

(declare-fun b!796989 () Bool)

(assert (=> b!796989 (= e!442155 e!442154)))

(declare-fun res!541645 () Bool)

(assert (=> b!796989 (=> (not res!541645) (not e!442154))))

(declare-fun lt!355398 () SeekEntryResult!8335)

(assert (=> b!796989 (= res!541645 (= lt!355398 lt!355397))))

(declare-fun lt!355399 () array!43333)

(declare-fun lt!355396 () (_ BitVec 64))

(assert (=> b!796989 (= lt!355397 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355396 lt!355399 mask!3266))))

(assert (=> b!796989 (= lt!355398 (seekEntryOrOpen!0 lt!355396 lt!355399 mask!3266))))

(assert (=> b!796989 (= lt!355396 (select (store (arr!20747 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796989 (= lt!355399 (array!43334 (store (arr!20747 a!3170) i!1163 k0!2044) (size!21168 a!3170)))))

(declare-fun b!796990 () Bool)

(declare-fun res!541644 () Bool)

(assert (=> b!796990 (=> (not res!541644) (not e!442152))))

(assert (=> b!796990 (= res!541644 (and (= (size!21168 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21168 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21168 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796991 () Bool)

(declare-fun res!541648 () Bool)

(assert (=> b!796991 (=> (not res!541648) (not e!442152))))

(declare-fun arrayContainsKey!0 (array!43333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796991 (= res!541648 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796985 () Bool)

(assert (=> b!796985 (= e!442152 e!442155)))

(declare-fun res!541649 () Bool)

(assert (=> b!796985 (=> (not res!541649) (not e!442155))))

(declare-fun lt!355394 () SeekEntryResult!8335)

(assert (=> b!796985 (= res!541649 (or (= lt!355394 (MissingZero!8335 i!1163)) (= lt!355394 (MissingVacant!8335 i!1163))))))

(assert (=> b!796985 (= lt!355394 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!541646 () Bool)

(assert (=> start!68526 (=> (not res!541646) (not e!442152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68526 (= res!541646 (validMask!0 mask!3266))))

(assert (=> start!68526 e!442152))

(assert (=> start!68526 true))

(declare-fun array_inv!16630 (array!43333) Bool)

(assert (=> start!68526 (array_inv!16630 a!3170)))

(assert (= (and start!68526 res!541646) b!796990))

(assert (= (and b!796990 res!541644) b!796981))

(assert (= (and b!796981 res!541647) b!796984))

(assert (= (and b!796984 res!541641) b!796991))

(assert (= (and b!796991 res!541648) b!796985))

(assert (= (and b!796985 res!541649) b!796982))

(assert (= (and b!796982 res!541643) b!796988))

(assert (= (and b!796988 res!541642) b!796986))

(assert (= (and b!796986 res!541650) b!796989))

(assert (= (and b!796989 res!541645) b!796987))

(assert (= (and b!796987 res!541640) b!796983))

(declare-fun m!737335 () Bool)

(assert (=> b!796991 m!737335))

(declare-fun m!737337 () Bool)

(assert (=> start!68526 m!737337))

(declare-fun m!737339 () Bool)

(assert (=> start!68526 m!737339))

(declare-fun m!737341 () Bool)

(assert (=> b!796986 m!737341))

(declare-fun m!737343 () Bool)

(assert (=> b!796986 m!737343))

(declare-fun m!737345 () Bool)

(assert (=> b!796985 m!737345))

(declare-fun m!737347 () Bool)

(assert (=> b!796984 m!737347))

(declare-fun m!737349 () Bool)

(assert (=> b!796987 m!737349))

(declare-fun m!737351 () Bool)

(assert (=> b!796987 m!737351))

(assert (=> b!796987 m!737351))

(declare-fun m!737353 () Bool)

(assert (=> b!796987 m!737353))

(assert (=> b!796987 m!737351))

(declare-fun m!737355 () Bool)

(assert (=> b!796987 m!737355))

(declare-fun m!737357 () Bool)

(assert (=> b!796982 m!737357))

(declare-fun m!737359 () Bool)

(assert (=> b!796989 m!737359))

(declare-fun m!737361 () Bool)

(assert (=> b!796989 m!737361))

(declare-fun m!737363 () Bool)

(assert (=> b!796989 m!737363))

(declare-fun m!737365 () Bool)

(assert (=> b!796989 m!737365))

(assert (=> b!796981 m!737351))

(assert (=> b!796981 m!737351))

(declare-fun m!737367 () Bool)

(assert (=> b!796981 m!737367))

(declare-fun m!737369 () Bool)

(assert (=> b!796988 m!737369))

(check-sat (not b!796991) (not start!68526) (not b!796987) (not b!796985) (not b!796984) (not b!796988) (not b!796982) (not b!796989) (not b!796981))
(check-sat)
