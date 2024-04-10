; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68720 () Bool)

(assert start!68720)

(declare-fun b!800367 () Bool)

(declare-fun e!443759 () Bool)

(declare-fun e!443761 () Bool)

(assert (=> b!800367 (= e!443759 e!443761)))

(declare-fun res!544888 () Bool)

(assert (=> b!800367 (=> (not res!544888) (not e!443761))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43510 0))(
  ( (array!43511 (arr!20835 (Array (_ BitVec 32) (_ BitVec 64))) (size!21256 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43510)

(declare-fun lt!357564 () (_ BitVec 32))

(assert (=> b!800367 (= res!544888 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357564 #b00000000000000000000000000000000) (bvslt lt!357564 (size!21256 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800367 (= lt!357564 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800368 () Bool)

(declare-fun res!544887 () Bool)

(declare-fun e!443757 () Bool)

(assert (=> b!800368 (=> (not res!544887) (not e!443757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43510 (_ BitVec 32)) Bool)

(assert (=> b!800368 (= res!544887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!544895 () Bool)

(declare-fun e!443760 () Bool)

(assert (=> start!68720 (=> (not res!544895) (not e!443760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68720 (= res!544895 (validMask!0 mask!3266))))

(assert (=> start!68720 e!443760))

(assert (=> start!68720 true))

(declare-fun array_inv!16631 (array!43510) Bool)

(assert (=> start!68720 (array_inv!16631 a!3170)))

(declare-fun b!800369 () Bool)

(declare-fun res!544896 () Bool)

(assert (=> b!800369 (=> (not res!544896) (not e!443760))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800369 (= res!544896 (and (= (size!21256 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21256 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21256 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800370 () Bool)

(declare-fun res!544890 () Bool)

(assert (=> b!800370 (=> (not res!544890) (not e!443760))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800370 (= res!544890 (validKeyInArray!0 k!2044))))

(declare-fun b!800371 () Bool)

(declare-fun res!544889 () Bool)

(assert (=> b!800371 (=> (not res!544889) (not e!443760))))

(assert (=> b!800371 (= res!544889 (validKeyInArray!0 (select (arr!20835 a!3170) j!153)))))

(declare-fun b!800372 () Bool)

(assert (=> b!800372 (= e!443761 false)))

(declare-datatypes ((SeekEntryResult!8426 0))(
  ( (MissingZero!8426 (index!36072 (_ BitVec 32))) (Found!8426 (index!36073 (_ BitVec 32))) (Intermediate!8426 (undefined!9238 Bool) (index!36074 (_ BitVec 32)) (x!66944 (_ BitVec 32))) (Undefined!8426) (MissingVacant!8426 (index!36075 (_ BitVec 32))) )
))
(declare-fun lt!357569 () SeekEntryResult!8426)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43510 (_ BitVec 32)) SeekEntryResult!8426)

(assert (=> b!800372 (= lt!357569 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357564 vacantBefore!23 (select (arr!20835 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800373 () Bool)

(declare-fun e!443758 () Bool)

(assert (=> b!800373 (= e!443757 e!443758)))

(declare-fun res!544886 () Bool)

(assert (=> b!800373 (=> (not res!544886) (not e!443758))))

(declare-fun lt!357565 () array!43510)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357563 () (_ BitVec 64))

(declare-fun lt!357562 () SeekEntryResult!8426)

(assert (=> b!800373 (= res!544886 (= lt!357562 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357563 lt!357565 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43510 (_ BitVec 32)) SeekEntryResult!8426)

(assert (=> b!800373 (= lt!357562 (seekEntryOrOpen!0 lt!357563 lt!357565 mask!3266))))

(assert (=> b!800373 (= lt!357563 (select (store (arr!20835 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800373 (= lt!357565 (array!43511 (store (arr!20835 a!3170) i!1163 k!2044) (size!21256 a!3170)))))

(declare-fun b!800374 () Bool)

(declare-fun res!544892 () Bool)

(assert (=> b!800374 (=> (not res!544892) (not e!443757))))

(assert (=> b!800374 (= res!544892 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21256 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20835 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21256 a!3170)) (= (select (arr!20835 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800375 () Bool)

(declare-fun res!544893 () Bool)

(assert (=> b!800375 (=> (not res!544893) (not e!443761))))

(assert (=> b!800375 (= res!544893 (= lt!357562 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357564 vacantAfter!23 lt!357563 lt!357565 mask!3266)))))

(declare-fun b!800376 () Bool)

(assert (=> b!800376 (= e!443758 e!443759)))

(declare-fun res!544891 () Bool)

(assert (=> b!800376 (=> (not res!544891) (not e!443759))))

(declare-fun lt!357567 () SeekEntryResult!8426)

(declare-fun lt!357568 () SeekEntryResult!8426)

(assert (=> b!800376 (= res!544891 (and (= lt!357567 lt!357568) (= lt!357568 (Found!8426 j!153)) (not (= (select (arr!20835 a!3170) index!1236) (select (arr!20835 a!3170) j!153)))))))

(assert (=> b!800376 (= lt!357568 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20835 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800376 (= lt!357567 (seekEntryOrOpen!0 (select (arr!20835 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800377 () Bool)

(declare-fun res!544897 () Bool)

(assert (=> b!800377 (=> (not res!544897) (not e!443760))))

(declare-fun arrayContainsKey!0 (array!43510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800377 (= res!544897 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800378 () Bool)

(declare-fun res!544898 () Bool)

(assert (=> b!800378 (=> (not res!544898) (not e!443757))))

(declare-datatypes ((List!14798 0))(
  ( (Nil!14795) (Cons!14794 (h!15923 (_ BitVec 64)) (t!21113 List!14798)) )
))
(declare-fun arrayNoDuplicates!0 (array!43510 (_ BitVec 32) List!14798) Bool)

(assert (=> b!800378 (= res!544898 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14795))))

(declare-fun b!800379 () Bool)

(assert (=> b!800379 (= e!443760 e!443757)))

(declare-fun res!544894 () Bool)

(assert (=> b!800379 (=> (not res!544894) (not e!443757))))

(declare-fun lt!357566 () SeekEntryResult!8426)

(assert (=> b!800379 (= res!544894 (or (= lt!357566 (MissingZero!8426 i!1163)) (= lt!357566 (MissingVacant!8426 i!1163))))))

(assert (=> b!800379 (= lt!357566 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68720 res!544895) b!800369))

(assert (= (and b!800369 res!544896) b!800371))

(assert (= (and b!800371 res!544889) b!800370))

(assert (= (and b!800370 res!544890) b!800377))

(assert (= (and b!800377 res!544897) b!800379))

(assert (= (and b!800379 res!544894) b!800368))

(assert (= (and b!800368 res!544887) b!800378))

(assert (= (and b!800378 res!544898) b!800374))

(assert (= (and b!800374 res!544892) b!800373))

(assert (= (and b!800373 res!544886) b!800376))

(assert (= (and b!800376 res!544891) b!800367))

(assert (= (and b!800367 res!544888) b!800375))

(assert (= (and b!800375 res!544893) b!800372))

(declare-fun m!741449 () Bool)

(assert (=> b!800373 m!741449))

(declare-fun m!741451 () Bool)

(assert (=> b!800373 m!741451))

(declare-fun m!741453 () Bool)

(assert (=> b!800373 m!741453))

(declare-fun m!741455 () Bool)

(assert (=> b!800373 m!741455))

(declare-fun m!741457 () Bool)

(assert (=> start!68720 m!741457))

(declare-fun m!741459 () Bool)

(assert (=> start!68720 m!741459))

(declare-fun m!741461 () Bool)

(assert (=> b!800368 m!741461))

(declare-fun m!741463 () Bool)

(assert (=> b!800372 m!741463))

(assert (=> b!800372 m!741463))

(declare-fun m!741465 () Bool)

(assert (=> b!800372 m!741465))

(declare-fun m!741467 () Bool)

(assert (=> b!800374 m!741467))

(declare-fun m!741469 () Bool)

(assert (=> b!800374 m!741469))

(declare-fun m!741471 () Bool)

(assert (=> b!800377 m!741471))

(declare-fun m!741473 () Bool)

(assert (=> b!800367 m!741473))

(declare-fun m!741475 () Bool)

(assert (=> b!800378 m!741475))

(declare-fun m!741477 () Bool)

(assert (=> b!800379 m!741477))

(declare-fun m!741479 () Bool)

(assert (=> b!800370 m!741479))

(declare-fun m!741481 () Bool)

(assert (=> b!800375 m!741481))

(declare-fun m!741483 () Bool)

(assert (=> b!800376 m!741483))

(assert (=> b!800376 m!741463))

(assert (=> b!800376 m!741463))

(declare-fun m!741485 () Bool)

(assert (=> b!800376 m!741485))

(assert (=> b!800376 m!741463))

(declare-fun m!741487 () Bool)

(assert (=> b!800376 m!741487))

(assert (=> b!800371 m!741463))

(assert (=> b!800371 m!741463))

(declare-fun m!741489 () Bool)

(assert (=> b!800371 m!741489))

(push 1)

