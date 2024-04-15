; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68490 () Bool)

(assert start!68490)

(declare-fun b!796360 () Bool)

(declare-fun res!541019 () Bool)

(declare-fun e!441857 () Bool)

(assert (=> b!796360 (=> (not res!541019) (not e!441857))))

(declare-datatypes ((array!43297 0))(
  ( (array!43298 (arr!20729 (Array (_ BitVec 32) (_ BitVec 64))) (size!21150 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43297)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796360 (= res!541019 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796361 () Bool)

(declare-fun res!541020 () Bool)

(declare-fun e!441859 () Bool)

(assert (=> b!796361 (=> (not res!541020) (not e!441859))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43297 (_ BitVec 32)) Bool)

(assert (=> b!796361 (= res!541020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796362 () Bool)

(assert (=> b!796362 (= e!441857 e!441859)))

(declare-fun res!541023 () Bool)

(assert (=> b!796362 (=> (not res!541023) (not e!441859))))

(declare-datatypes ((SeekEntryResult!8317 0))(
  ( (MissingZero!8317 (index!35636 (_ BitVec 32))) (Found!8317 (index!35637 (_ BitVec 32))) (Intermediate!8317 (undefined!9129 Bool) (index!35638 (_ BitVec 32)) (x!66550 (_ BitVec 32))) (Undefined!8317) (MissingVacant!8317 (index!35639 (_ BitVec 32))) )
))
(declare-fun lt!355004 () SeekEntryResult!8317)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796362 (= res!541023 (or (= lt!355004 (MissingZero!8317 i!1163)) (= lt!355004 (MissingVacant!8317 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43297 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!796362 (= lt!355004 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796363 () Bool)

(declare-fun res!541022 () Bool)

(assert (=> b!796363 (=> (not res!541022) (not e!441857))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796363 (= res!541022 (validKeyInArray!0 (select (arr!20729 a!3170) j!153)))))

(declare-fun res!541021 () Bool)

(assert (=> start!68490 (=> (not res!541021) (not e!441857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68490 (= res!541021 (validMask!0 mask!3266))))

(assert (=> start!68490 e!441857))

(assert (=> start!68490 true))

(declare-fun array_inv!16612 (array!43297) Bool)

(assert (=> start!68490 (array_inv!16612 a!3170)))

(declare-fun b!796364 () Bool)

(declare-fun e!441856 () Bool)

(assert (=> b!796364 (= e!441859 e!441856)))

(declare-fun res!541029 () Bool)

(assert (=> b!796364 (=> (not res!541029) (not e!441856))))

(declare-fun lt!355000 () SeekEntryResult!8317)

(declare-fun lt!355001 () SeekEntryResult!8317)

(assert (=> b!796364 (= res!541029 (= lt!355000 lt!355001))))

(declare-fun lt!355002 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354999 () array!43297)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43297 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!796364 (= lt!355001 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355002 lt!354999 mask!3266))))

(assert (=> b!796364 (= lt!355000 (seekEntryOrOpen!0 lt!355002 lt!354999 mask!3266))))

(assert (=> b!796364 (= lt!355002 (select (store (arr!20729 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796364 (= lt!354999 (array!43298 (store (arr!20729 a!3170) i!1163 k0!2044) (size!21150 a!3170)))))

(declare-fun e!441858 () Bool)

(declare-fun b!796365 () Bool)

(assert (=> b!796365 (= e!441858 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20729 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!796365 (= lt!355001 (Found!8317 index!1236))))

(declare-fun b!796366 () Bool)

(declare-fun res!541026 () Bool)

(assert (=> b!796366 (=> (not res!541026) (not e!441857))))

(assert (=> b!796366 (= res!541026 (validKeyInArray!0 k0!2044))))

(declare-fun b!796367 () Bool)

(declare-fun res!541025 () Bool)

(assert (=> b!796367 (=> (not res!541025) (not e!441859))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796367 (= res!541025 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21150 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20729 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21150 a!3170)) (= (select (arr!20729 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796368 () Bool)

(assert (=> b!796368 (= e!441856 e!441858)))

(declare-fun res!541024 () Bool)

(assert (=> b!796368 (=> (not res!541024) (not e!441858))))

(declare-fun lt!354998 () SeekEntryResult!8317)

(declare-fun lt!355003 () SeekEntryResult!8317)

(assert (=> b!796368 (= res!541024 (and (= lt!354998 lt!355003) (= lt!355003 (Found!8317 j!153)) (= (select (arr!20729 a!3170) index!1236) (select (arr!20729 a!3170) j!153))))))

(assert (=> b!796368 (= lt!355003 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20729 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796368 (= lt!354998 (seekEntryOrOpen!0 (select (arr!20729 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796369 () Bool)

(declare-fun res!541027 () Bool)

(assert (=> b!796369 (=> (not res!541027) (not e!441859))))

(declare-datatypes ((List!14731 0))(
  ( (Nil!14728) (Cons!14727 (h!15856 (_ BitVec 64)) (t!21037 List!14731)) )
))
(declare-fun arrayNoDuplicates!0 (array!43297 (_ BitVec 32) List!14731) Bool)

(assert (=> b!796369 (= res!541027 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14728))))

(declare-fun b!796370 () Bool)

(declare-fun res!541028 () Bool)

(assert (=> b!796370 (=> (not res!541028) (not e!441857))))

(assert (=> b!796370 (= res!541028 (and (= (size!21150 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21150 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21150 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68490 res!541021) b!796370))

(assert (= (and b!796370 res!541028) b!796363))

(assert (= (and b!796363 res!541022) b!796366))

(assert (= (and b!796366 res!541026) b!796360))

(assert (= (and b!796360 res!541019) b!796362))

(assert (= (and b!796362 res!541023) b!796361))

(assert (= (and b!796361 res!541020) b!796369))

(assert (= (and b!796369 res!541027) b!796367))

(assert (= (and b!796367 res!541025) b!796364))

(assert (= (and b!796364 res!541029) b!796368))

(assert (= (and b!796368 res!541024) b!796365))

(declare-fun m!736669 () Bool)

(assert (=> b!796365 m!736669))

(declare-fun m!736671 () Bool)

(assert (=> b!796365 m!736671))

(declare-fun m!736673 () Bool)

(assert (=> b!796363 m!736673))

(assert (=> b!796363 m!736673))

(declare-fun m!736675 () Bool)

(assert (=> b!796363 m!736675))

(declare-fun m!736677 () Bool)

(assert (=> b!796369 m!736677))

(declare-fun m!736679 () Bool)

(assert (=> start!68490 m!736679))

(declare-fun m!736681 () Bool)

(assert (=> start!68490 m!736681))

(declare-fun m!736683 () Bool)

(assert (=> b!796361 m!736683))

(declare-fun m!736685 () Bool)

(assert (=> b!796366 m!736685))

(declare-fun m!736687 () Bool)

(assert (=> b!796364 m!736687))

(declare-fun m!736689 () Bool)

(assert (=> b!796364 m!736689))

(assert (=> b!796364 m!736669))

(declare-fun m!736691 () Bool)

(assert (=> b!796364 m!736691))

(declare-fun m!736693 () Bool)

(assert (=> b!796368 m!736693))

(assert (=> b!796368 m!736673))

(assert (=> b!796368 m!736673))

(declare-fun m!736695 () Bool)

(assert (=> b!796368 m!736695))

(assert (=> b!796368 m!736673))

(declare-fun m!736697 () Bool)

(assert (=> b!796368 m!736697))

(declare-fun m!736699 () Bool)

(assert (=> b!796367 m!736699))

(declare-fun m!736701 () Bool)

(assert (=> b!796367 m!736701))

(declare-fun m!736703 () Bool)

(assert (=> b!796362 m!736703))

(declare-fun m!736705 () Bool)

(assert (=> b!796360 m!736705))

(check-sat (not b!796361) (not b!796366) (not b!796363) (not b!796368) (not b!796360) (not b!796369) (not b!796362) (not b!796364) (not start!68490))
(check-sat)
