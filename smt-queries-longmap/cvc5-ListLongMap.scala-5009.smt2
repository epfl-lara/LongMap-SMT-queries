; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68564 () Bool)

(assert start!68564)

(declare-fun b!797550 () Bool)

(declare-fun e!442465 () Bool)

(declare-fun e!442467 () Bool)

(assert (=> b!797550 (= e!442465 e!442467)))

(declare-fun res!542072 () Bool)

(assert (=> b!797550 (=> (not res!542072) (not e!442467))))

(declare-datatypes ((SeekEntryResult!8348 0))(
  ( (MissingZero!8348 (index!35760 (_ BitVec 32))) (Found!8348 (index!35761 (_ BitVec 32))) (Intermediate!8348 (undefined!9160 Bool) (index!35762 (_ BitVec 32)) (x!66658 (_ BitVec 32))) (Undefined!8348) (MissingVacant!8348 (index!35763 (_ BitVec 32))) )
))
(declare-fun lt!355846 () SeekEntryResult!8348)

(declare-datatypes ((array!43354 0))(
  ( (array!43355 (arr!20757 (Array (_ BitVec 32) (_ BitVec 64))) (size!21178 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43354)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355843 () SeekEntryResult!8348)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797550 (= res!542072 (and (= lt!355843 lt!355846) (= (select (arr!20757 a!3170) index!1236) (select (arr!20757 a!3170) j!153))))))

(assert (=> b!797550 (= lt!355846 (Found!8348 j!153))))

(declare-fun b!797551 () Bool)

(declare-fun e!442466 () Bool)

(declare-fun e!442464 () Bool)

(assert (=> b!797551 (= e!442466 e!442464)))

(declare-fun res!542069 () Bool)

(assert (=> b!797551 (=> (not res!542069) (not e!442464))))

(declare-fun lt!355848 () SeekEntryResult!8348)

(declare-fun lt!355844 () SeekEntryResult!8348)

(assert (=> b!797551 (= res!542069 (= lt!355848 lt!355844))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355850 () (_ BitVec 64))

(declare-fun lt!355845 () array!43354)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43354 (_ BitVec 32)) SeekEntryResult!8348)

(assert (=> b!797551 (= lt!355844 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355850 lt!355845 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43354 (_ BitVec 32)) SeekEntryResult!8348)

(assert (=> b!797551 (= lt!355848 (seekEntryOrOpen!0 lt!355850 lt!355845 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797551 (= lt!355850 (select (store (arr!20757 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797551 (= lt!355845 (array!43355 (store (arr!20757 a!3170) i!1163 k!2044) (size!21178 a!3170)))))

(declare-fun b!797552 () Bool)

(declare-fun res!542075 () Bool)

(declare-fun e!442469 () Bool)

(assert (=> b!797552 (=> (not res!542075) (not e!442469))))

(declare-fun arrayContainsKey!0 (array!43354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797552 (= res!542075 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797553 () Bool)

(declare-fun res!542073 () Bool)

(assert (=> b!797553 (=> (not res!542073) (not e!442469))))

(assert (=> b!797553 (= res!542073 (and (= (size!21178 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21178 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21178 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797554 () Bool)

(declare-fun e!442463 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797554 (= e!442463 (validKeyInArray!0 lt!355850))))

(declare-fun b!797555 () Bool)

(declare-fun res!542074 () Bool)

(assert (=> b!797555 (=> (not res!542074) (not e!442466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43354 (_ BitVec 32)) Bool)

(assert (=> b!797555 (= res!542074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797556 () Bool)

(assert (=> b!797556 (= e!442469 e!442466)))

(declare-fun res!542079 () Bool)

(assert (=> b!797556 (=> (not res!542079) (not e!442466))))

(declare-fun lt!355847 () SeekEntryResult!8348)

(assert (=> b!797556 (= res!542079 (or (= lt!355847 (MissingZero!8348 i!1163)) (= lt!355847 (MissingVacant!8348 i!1163))))))

(assert (=> b!797556 (= lt!355847 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!542071 () Bool)

(assert (=> start!68564 (=> (not res!542071) (not e!442469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68564 (= res!542071 (validMask!0 mask!3266))))

(assert (=> start!68564 e!442469))

(assert (=> start!68564 true))

(declare-fun array_inv!16553 (array!43354) Bool)

(assert (=> start!68564 (array_inv!16553 a!3170)))

(declare-fun b!797557 () Bool)

(declare-fun res!542078 () Bool)

(assert (=> b!797557 (=> (not res!542078) (not e!442466))))

(declare-datatypes ((List!14720 0))(
  ( (Nil!14717) (Cons!14716 (h!15845 (_ BitVec 64)) (t!21035 List!14720)) )
))
(declare-fun arrayNoDuplicates!0 (array!43354 (_ BitVec 32) List!14720) Bool)

(assert (=> b!797557 (= res!542078 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14717))))

(declare-fun b!797558 () Bool)

(assert (=> b!797558 (= e!442464 e!442465)))

(declare-fun res!542081 () Bool)

(assert (=> b!797558 (=> (not res!542081) (not e!442465))))

(declare-fun lt!355849 () SeekEntryResult!8348)

(assert (=> b!797558 (= res!542081 (= lt!355849 lt!355843))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797558 (= lt!355843 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20757 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797558 (= lt!355849 (seekEntryOrOpen!0 (select (arr!20757 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797559 () Bool)

(assert (=> b!797559 (= e!442467 (not e!442463))))

(declare-fun res!542070 () Bool)

(assert (=> b!797559 (=> res!542070 e!442463)))

(assert (=> b!797559 (= res!542070 (or (not (= lt!355844 lt!355846)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20757 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797559 (= lt!355844 (Found!8348 index!1236))))

(declare-fun b!797560 () Bool)

(declare-fun res!542076 () Bool)

(assert (=> b!797560 (=> (not res!542076) (not e!442469))))

(assert (=> b!797560 (= res!542076 (validKeyInArray!0 (select (arr!20757 a!3170) j!153)))))

(declare-fun b!797561 () Bool)

(declare-fun res!542077 () Bool)

(assert (=> b!797561 (=> (not res!542077) (not e!442466))))

(assert (=> b!797561 (= res!542077 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21178 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20757 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21178 a!3170)) (= (select (arr!20757 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797562 () Bool)

(declare-fun res!542080 () Bool)

(assert (=> b!797562 (=> (not res!542080) (not e!442469))))

(assert (=> b!797562 (= res!542080 (validKeyInArray!0 k!2044))))

(assert (= (and start!68564 res!542071) b!797553))

(assert (= (and b!797553 res!542073) b!797560))

(assert (= (and b!797560 res!542076) b!797562))

(assert (= (and b!797562 res!542080) b!797552))

(assert (= (and b!797552 res!542075) b!797556))

(assert (= (and b!797556 res!542079) b!797555))

(assert (= (and b!797555 res!542074) b!797557))

(assert (= (and b!797557 res!542078) b!797561))

(assert (= (and b!797561 res!542077) b!797551))

(assert (= (and b!797551 res!542069) b!797558))

(assert (= (and b!797558 res!542081) b!797550))

(assert (= (and b!797550 res!542072) b!797559))

(assert (= (and b!797559 (not res!542070)) b!797554))

(declare-fun m!738407 () Bool)

(assert (=> b!797560 m!738407))

(assert (=> b!797560 m!738407))

(declare-fun m!738409 () Bool)

(assert (=> b!797560 m!738409))

(declare-fun m!738411 () Bool)

(assert (=> b!797552 m!738411))

(declare-fun m!738413 () Bool)

(assert (=> b!797554 m!738413))

(declare-fun m!738415 () Bool)

(assert (=> start!68564 m!738415))

(declare-fun m!738417 () Bool)

(assert (=> start!68564 m!738417))

(declare-fun m!738419 () Bool)

(assert (=> b!797556 m!738419))

(declare-fun m!738421 () Bool)

(assert (=> b!797557 m!738421))

(declare-fun m!738423 () Bool)

(assert (=> b!797555 m!738423))

(declare-fun m!738425 () Bool)

(assert (=> b!797561 m!738425))

(declare-fun m!738427 () Bool)

(assert (=> b!797561 m!738427))

(declare-fun m!738429 () Bool)

(assert (=> b!797551 m!738429))

(declare-fun m!738431 () Bool)

(assert (=> b!797551 m!738431))

(declare-fun m!738433 () Bool)

(assert (=> b!797551 m!738433))

(declare-fun m!738435 () Bool)

(assert (=> b!797551 m!738435))

(declare-fun m!738437 () Bool)

(assert (=> b!797562 m!738437))

(assert (=> b!797559 m!738433))

(declare-fun m!738439 () Bool)

(assert (=> b!797559 m!738439))

(assert (=> b!797558 m!738407))

(assert (=> b!797558 m!738407))

(declare-fun m!738441 () Bool)

(assert (=> b!797558 m!738441))

(assert (=> b!797558 m!738407))

(declare-fun m!738443 () Bool)

(assert (=> b!797558 m!738443))

(declare-fun m!738445 () Bool)

(assert (=> b!797550 m!738445))

(assert (=> b!797550 m!738407))

(push 1)

