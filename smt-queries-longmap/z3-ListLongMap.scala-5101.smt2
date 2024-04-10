; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69214 () Bool)

(assert start!69214)

(declare-fun b!807371 () Bool)

(declare-fun res!551498 () Bool)

(declare-fun e!447019 () Bool)

(assert (=> b!807371 (=> (not res!551498) (not e!447019))))

(declare-datatypes ((array!43914 0))(
  ( (array!43915 (arr!21034 (Array (_ BitVec 32) (_ BitVec 64))) (size!21455 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43914)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43914 (_ BitVec 32)) Bool)

(assert (=> b!807371 (= res!551498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807372 () Bool)

(declare-fun e!447020 () Bool)

(assert (=> b!807372 (= e!447020 e!447019)))

(declare-fun res!551499 () Bool)

(assert (=> b!807372 (=> (not res!551499) (not e!447019))))

(declare-datatypes ((SeekEntryResult!8625 0))(
  ( (MissingZero!8625 (index!36868 (_ BitVec 32))) (Found!8625 (index!36869 (_ BitVec 32))) (Intermediate!8625 (undefined!9437 Bool) (index!36870 (_ BitVec 32)) (x!67677 (_ BitVec 32))) (Undefined!8625) (MissingVacant!8625 (index!36871 (_ BitVec 32))) )
))
(declare-fun lt!361694 () SeekEntryResult!8625)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807372 (= res!551499 (or (= lt!361694 (MissingZero!8625 i!1163)) (= lt!361694 (MissingVacant!8625 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43914 (_ BitVec 32)) SeekEntryResult!8625)

(assert (=> b!807372 (= lt!361694 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807373 () Bool)

(declare-fun res!551501 () Bool)

(assert (=> b!807373 (=> (not res!551501) (not e!447019))))

(declare-datatypes ((List!14997 0))(
  ( (Nil!14994) (Cons!14993 (h!16122 (_ BitVec 64)) (t!21312 List!14997)) )
))
(declare-fun arrayNoDuplicates!0 (array!43914 (_ BitVec 32) List!14997) Bool)

(assert (=> b!807373 (= res!551501 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14994))))

(declare-fun b!807374 () Bool)

(declare-fun e!447023 () Bool)

(declare-fun e!447021 () Bool)

(assert (=> b!807374 (= e!447023 e!447021)))

(declare-fun res!551504 () Bool)

(assert (=> b!807374 (=> (not res!551504) (not e!447021))))

(declare-fun lt!361693 () SeekEntryResult!8625)

(declare-fun lt!361695 () SeekEntryResult!8625)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807374 (= res!551504 (and (= lt!361695 lt!361693) (= lt!361693 (Found!8625 j!153)) (not (= (select (arr!21034 a!3170) index!1236) (select (arr!21034 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43914 (_ BitVec 32)) SeekEntryResult!8625)

(assert (=> b!807374 (= lt!361693 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21034 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807374 (= lt!361695 (seekEntryOrOpen!0 (select (arr!21034 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807375 () Bool)

(declare-fun res!551496 () Bool)

(assert (=> b!807375 (=> (not res!551496) (not e!447020))))

(assert (=> b!807375 (= res!551496 (and (= (size!21455 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21455 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21455 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807376 () Bool)

(declare-fun res!551500 () Bool)

(assert (=> b!807376 (=> (not res!551500) (not e!447020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807376 (= res!551500 (validKeyInArray!0 (select (arr!21034 a!3170) j!153)))))

(declare-fun res!551494 () Bool)

(assert (=> start!69214 (=> (not res!551494) (not e!447020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69214 (= res!551494 (validMask!0 mask!3266))))

(assert (=> start!69214 e!447020))

(assert (=> start!69214 true))

(declare-fun array_inv!16830 (array!43914) Bool)

(assert (=> start!69214 (array_inv!16830 a!3170)))

(declare-fun b!807377 () Bool)

(declare-fun res!551495 () Bool)

(assert (=> b!807377 (=> (not res!551495) (not e!447020))))

(assert (=> b!807377 (= res!551495 (validKeyInArray!0 k0!2044))))

(declare-fun b!807378 () Bool)

(assert (=> b!807378 (= e!447019 e!447023)))

(declare-fun res!551503 () Bool)

(assert (=> b!807378 (=> (not res!551503) (not e!447023))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361697 () array!43914)

(declare-fun lt!361692 () (_ BitVec 64))

(assert (=> b!807378 (= res!551503 (= (seekEntryOrOpen!0 lt!361692 lt!361697 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361692 lt!361697 mask!3266)))))

(assert (=> b!807378 (= lt!361692 (select (store (arr!21034 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807378 (= lt!361697 (array!43915 (store (arr!21034 a!3170) i!1163 k0!2044) (size!21455 a!3170)))))

(declare-fun b!807379 () Bool)

(assert (=> b!807379 (= e!447021 false)))

(declare-fun lt!361696 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807379 (= lt!361696 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807380 () Bool)

(declare-fun res!551497 () Bool)

(assert (=> b!807380 (=> (not res!551497) (not e!447019))))

(assert (=> b!807380 (= res!551497 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21455 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21034 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21455 a!3170)) (= (select (arr!21034 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807381 () Bool)

(declare-fun res!551502 () Bool)

(assert (=> b!807381 (=> (not res!551502) (not e!447020))))

(declare-fun arrayContainsKey!0 (array!43914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807381 (= res!551502 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69214 res!551494) b!807375))

(assert (= (and b!807375 res!551496) b!807376))

(assert (= (and b!807376 res!551500) b!807377))

(assert (= (and b!807377 res!551495) b!807381))

(assert (= (and b!807381 res!551502) b!807372))

(assert (= (and b!807372 res!551499) b!807371))

(assert (= (and b!807371 res!551498) b!807373))

(assert (= (and b!807373 res!551501) b!807380))

(assert (= (and b!807380 res!551497) b!807378))

(assert (= (and b!807378 res!551503) b!807374))

(assert (= (and b!807374 res!551504) b!807379))

(declare-fun m!749395 () Bool)

(assert (=> b!807373 m!749395))

(declare-fun m!749397 () Bool)

(assert (=> b!807372 m!749397))

(declare-fun m!749399 () Bool)

(assert (=> b!807379 m!749399))

(declare-fun m!749401 () Bool)

(assert (=> b!807374 m!749401))

(declare-fun m!749403 () Bool)

(assert (=> b!807374 m!749403))

(assert (=> b!807374 m!749403))

(declare-fun m!749405 () Bool)

(assert (=> b!807374 m!749405))

(assert (=> b!807374 m!749403))

(declare-fun m!749407 () Bool)

(assert (=> b!807374 m!749407))

(declare-fun m!749409 () Bool)

(assert (=> b!807380 m!749409))

(declare-fun m!749411 () Bool)

(assert (=> b!807380 m!749411))

(assert (=> b!807376 m!749403))

(assert (=> b!807376 m!749403))

(declare-fun m!749413 () Bool)

(assert (=> b!807376 m!749413))

(declare-fun m!749415 () Bool)

(assert (=> b!807381 m!749415))

(declare-fun m!749417 () Bool)

(assert (=> b!807378 m!749417))

(declare-fun m!749419 () Bool)

(assert (=> b!807378 m!749419))

(declare-fun m!749421 () Bool)

(assert (=> b!807378 m!749421))

(declare-fun m!749423 () Bool)

(assert (=> b!807378 m!749423))

(declare-fun m!749425 () Bool)

(assert (=> start!69214 m!749425))

(declare-fun m!749427 () Bool)

(assert (=> start!69214 m!749427))

(declare-fun m!749429 () Bool)

(assert (=> b!807377 m!749429))

(declare-fun m!749431 () Bool)

(assert (=> b!807371 m!749431))

(check-sat (not b!807378) (not b!807371) (not b!807373) (not b!807377) (not b!807372) (not start!69214) (not b!807381) (not b!807374) (not b!807379) (not b!807376))
(check-sat)
