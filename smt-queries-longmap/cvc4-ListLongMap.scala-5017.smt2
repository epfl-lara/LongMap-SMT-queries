; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68616 () Bool)

(assert start!68616)

(declare-fun b!798450 () Bool)

(declare-fun e!442897 () Bool)

(declare-fun e!442898 () Bool)

(assert (=> b!798450 (= e!442897 e!442898)))

(declare-fun res!542977 () Bool)

(assert (=> b!798450 (=> (not res!542977) (not e!442898))))

(declare-datatypes ((array!43406 0))(
  ( (array!43407 (arr!20783 (Array (_ BitVec 32) (_ BitVec 64))) (size!21204 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43406)

(declare-datatypes ((SeekEntryResult!8374 0))(
  ( (MissingZero!8374 (index!35864 (_ BitVec 32))) (Found!8374 (index!35865 (_ BitVec 32))) (Intermediate!8374 (undefined!9186 Bool) (index!35866 (_ BitVec 32)) (x!66748 (_ BitVec 32))) (Undefined!8374) (MissingVacant!8374 (index!35867 (_ BitVec 32))) )
))
(declare-fun lt!356427 () SeekEntryResult!8374)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!356428 () SeekEntryResult!8374)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798450 (= res!542977 (and (= lt!356428 lt!356427) (= lt!356427 (Found!8374 j!153)) (= (select (arr!20783 a!3170) index!1236) (select (arr!20783 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43406 (_ BitVec 32)) SeekEntryResult!8374)

(assert (=> b!798450 (= lt!356427 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20783 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43406 (_ BitVec 32)) SeekEntryResult!8374)

(assert (=> b!798450 (= lt!356428 (seekEntryOrOpen!0 (select (arr!20783 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798451 () Bool)

(declare-fun res!542973 () Bool)

(declare-fun e!442895 () Bool)

(assert (=> b!798451 (=> (not res!542973) (not e!442895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43406 (_ BitVec 32)) Bool)

(assert (=> b!798451 (= res!542973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798452 () Bool)

(assert (=> b!798452 (= e!442898 (not true))))

(declare-fun lt!356429 () SeekEntryResult!8374)

(assert (=> b!798452 (= lt!356429 (Found!8374 index!1236))))

(declare-fun b!798453 () Bool)

(declare-fun res!542968 () Bool)

(assert (=> b!798453 (=> (not res!542968) (not e!442895))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798453 (= res!542968 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21204 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20783 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21204 a!3170)) (= (select (arr!20783 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798454 () Bool)

(declare-fun res!542970 () Bool)

(declare-fun e!442896 () Bool)

(assert (=> b!798454 (=> (not res!542970) (not e!442896))))

(assert (=> b!798454 (= res!542970 (and (= (size!21204 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21204 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21204 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798455 () Bool)

(declare-fun res!542976 () Bool)

(assert (=> b!798455 (=> (not res!542976) (not e!442896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798455 (= res!542976 (validKeyInArray!0 (select (arr!20783 a!3170) j!153)))))

(declare-fun b!798456 () Bool)

(declare-fun res!542972 () Bool)

(assert (=> b!798456 (=> (not res!542972) (not e!442895))))

(declare-datatypes ((List!14746 0))(
  ( (Nil!14743) (Cons!14742 (h!15871 (_ BitVec 64)) (t!21061 List!14746)) )
))
(declare-fun arrayNoDuplicates!0 (array!43406 (_ BitVec 32) List!14746) Bool)

(assert (=> b!798456 (= res!542972 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14743))))

(declare-fun b!798457 () Bool)

(assert (=> b!798457 (= e!442896 e!442895)))

(declare-fun res!542974 () Bool)

(assert (=> b!798457 (=> (not res!542974) (not e!442895))))

(declare-fun lt!356423 () SeekEntryResult!8374)

(assert (=> b!798457 (= res!542974 (or (= lt!356423 (MissingZero!8374 i!1163)) (= lt!356423 (MissingVacant!8374 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!798457 (= lt!356423 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!542978 () Bool)

(assert (=> start!68616 (=> (not res!542978) (not e!442896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68616 (= res!542978 (validMask!0 mask!3266))))

(assert (=> start!68616 e!442896))

(assert (=> start!68616 true))

(declare-fun array_inv!16579 (array!43406) Bool)

(assert (=> start!68616 (array_inv!16579 a!3170)))

(declare-fun b!798449 () Bool)

(declare-fun res!542971 () Bool)

(assert (=> b!798449 (=> (not res!542971) (not e!442896))))

(declare-fun arrayContainsKey!0 (array!43406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798449 (= res!542971 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798458 () Bool)

(declare-fun res!542969 () Bool)

(assert (=> b!798458 (=> (not res!542969) (not e!442896))))

(assert (=> b!798458 (= res!542969 (validKeyInArray!0 k!2044))))

(declare-fun b!798459 () Bool)

(assert (=> b!798459 (= e!442895 e!442897)))

(declare-fun res!542975 () Bool)

(assert (=> b!798459 (=> (not res!542975) (not e!442897))))

(declare-fun lt!356426 () SeekEntryResult!8374)

(assert (=> b!798459 (= res!542975 (= lt!356426 lt!356429))))

(declare-fun lt!356424 () (_ BitVec 64))

(declare-fun lt!356425 () array!43406)

(assert (=> b!798459 (= lt!356429 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356424 lt!356425 mask!3266))))

(assert (=> b!798459 (= lt!356426 (seekEntryOrOpen!0 lt!356424 lt!356425 mask!3266))))

(assert (=> b!798459 (= lt!356424 (select (store (arr!20783 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798459 (= lt!356425 (array!43407 (store (arr!20783 a!3170) i!1163 k!2044) (size!21204 a!3170)))))

(assert (= (and start!68616 res!542978) b!798454))

(assert (= (and b!798454 res!542970) b!798455))

(assert (= (and b!798455 res!542976) b!798458))

(assert (= (and b!798458 res!542969) b!798449))

(assert (= (and b!798449 res!542971) b!798457))

(assert (= (and b!798457 res!542974) b!798451))

(assert (= (and b!798451 res!542973) b!798456))

(assert (= (and b!798456 res!542972) b!798453))

(assert (= (and b!798453 res!542968) b!798459))

(assert (= (and b!798459 res!542975) b!798450))

(assert (= (and b!798450 res!542977) b!798452))

(declare-fun m!739355 () Bool)

(assert (=> b!798449 m!739355))

(declare-fun m!739357 () Bool)

(assert (=> b!798451 m!739357))

(declare-fun m!739359 () Bool)

(assert (=> b!798455 m!739359))

(assert (=> b!798455 m!739359))

(declare-fun m!739361 () Bool)

(assert (=> b!798455 m!739361))

(declare-fun m!739363 () Bool)

(assert (=> b!798456 m!739363))

(declare-fun m!739365 () Bool)

(assert (=> b!798450 m!739365))

(assert (=> b!798450 m!739359))

(assert (=> b!798450 m!739359))

(declare-fun m!739367 () Bool)

(assert (=> b!798450 m!739367))

(assert (=> b!798450 m!739359))

(declare-fun m!739369 () Bool)

(assert (=> b!798450 m!739369))

(declare-fun m!739371 () Bool)

(assert (=> start!68616 m!739371))

(declare-fun m!739373 () Bool)

(assert (=> start!68616 m!739373))

(declare-fun m!739375 () Bool)

(assert (=> b!798459 m!739375))

(declare-fun m!739377 () Bool)

(assert (=> b!798459 m!739377))

(declare-fun m!739379 () Bool)

(assert (=> b!798459 m!739379))

(declare-fun m!739381 () Bool)

(assert (=> b!798459 m!739381))

(declare-fun m!739383 () Bool)

(assert (=> b!798458 m!739383))

(declare-fun m!739385 () Bool)

(assert (=> b!798453 m!739385))

(declare-fun m!739387 () Bool)

(assert (=> b!798453 m!739387))

(declare-fun m!739389 () Bool)

(assert (=> b!798457 m!739389))

(push 1)

