; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68718 () Bool)

(assert start!68718)

(declare-fun b!800328 () Bool)

(declare-fun res!544847 () Bool)

(declare-fun e!443739 () Bool)

(assert (=> b!800328 (=> (not res!544847) (not e!443739))))

(declare-fun lt!357541 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8425 0))(
  ( (MissingZero!8425 (index!36068 (_ BitVec 32))) (Found!8425 (index!36069 (_ BitVec 32))) (Intermediate!8425 (undefined!9237 Bool) (index!36070 (_ BitVec 32)) (x!66935 (_ BitVec 32))) (Undefined!8425) (MissingVacant!8425 (index!36071 (_ BitVec 32))) )
))
(declare-fun lt!357542 () SeekEntryResult!8425)

(declare-datatypes ((array!43508 0))(
  ( (array!43509 (arr!20834 (Array (_ BitVec 32) (_ BitVec 64))) (size!21255 (_ BitVec 32))) )
))
(declare-fun lt!357538 () array!43508)

(declare-fun lt!357540 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43508 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!800328 (= res!544847 (= lt!357542 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357541 vacantAfter!23 lt!357540 lt!357538 mask!3266)))))

(declare-fun b!800329 () Bool)

(assert (=> b!800329 (= e!443739 false)))

(declare-fun lt!357545 () SeekEntryResult!8425)

(declare-fun a!3170 () array!43508)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800329 (= lt!357545 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357541 vacantBefore!23 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800330 () Bool)

(declare-fun res!544850 () Bool)

(declare-fun e!443741 () Bool)

(assert (=> b!800330 (=> (not res!544850) (not e!443741))))

(declare-datatypes ((List!14797 0))(
  ( (Nil!14794) (Cons!14793 (h!15922 (_ BitVec 64)) (t!21112 List!14797)) )
))
(declare-fun arrayNoDuplicates!0 (array!43508 (_ BitVec 32) List!14797) Bool)

(assert (=> b!800330 (= res!544850 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14794))))

(declare-fun b!800331 () Bool)

(declare-fun res!544855 () Bool)

(declare-fun e!443743 () Bool)

(assert (=> b!800331 (=> (not res!544855) (not e!443743))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800331 (= res!544855 (validKeyInArray!0 k!2044))))

(declare-fun b!800332 () Bool)

(declare-fun e!443744 () Bool)

(assert (=> b!800332 (= e!443744 e!443739)))

(declare-fun res!544859 () Bool)

(assert (=> b!800332 (=> (not res!544859) (not e!443739))))

(assert (=> b!800332 (= res!544859 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357541 #b00000000000000000000000000000000) (bvslt lt!357541 (size!21255 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800332 (= lt!357541 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800333 () Bool)

(declare-fun res!544848 () Bool)

(assert (=> b!800333 (=> (not res!544848) (not e!443743))))

(declare-fun arrayContainsKey!0 (array!43508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800333 (= res!544848 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800334 () Bool)

(declare-fun res!544854 () Bool)

(assert (=> b!800334 (=> (not res!544854) (not e!443743))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800334 (= res!544854 (and (= (size!21255 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21255 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21255 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800335 () Bool)

(declare-fun e!443740 () Bool)

(assert (=> b!800335 (= e!443741 e!443740)))

(declare-fun res!544856 () Bool)

(assert (=> b!800335 (=> (not res!544856) (not e!443740))))

(assert (=> b!800335 (= res!544856 (= lt!357542 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357540 lt!357538 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43508 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!800335 (= lt!357542 (seekEntryOrOpen!0 lt!357540 lt!357538 mask!3266))))

(assert (=> b!800335 (= lt!357540 (select (store (arr!20834 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800335 (= lt!357538 (array!43509 (store (arr!20834 a!3170) i!1163 k!2044) (size!21255 a!3170)))))

(declare-fun b!800336 () Bool)

(declare-fun res!544858 () Bool)

(assert (=> b!800336 (=> (not res!544858) (not e!443741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43508 (_ BitVec 32)) Bool)

(assert (=> b!800336 (= res!544858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800337 () Bool)

(declare-fun res!544853 () Bool)

(assert (=> b!800337 (=> (not res!544853) (not e!443741))))

(assert (=> b!800337 (= res!544853 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21255 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20834 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21255 a!3170)) (= (select (arr!20834 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!544852 () Bool)

(assert (=> start!68718 (=> (not res!544852) (not e!443743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68718 (= res!544852 (validMask!0 mask!3266))))

(assert (=> start!68718 e!443743))

(assert (=> start!68718 true))

(declare-fun array_inv!16630 (array!43508) Bool)

(assert (=> start!68718 (array_inv!16630 a!3170)))

(declare-fun b!800338 () Bool)

(assert (=> b!800338 (= e!443743 e!443741)))

(declare-fun res!544851 () Bool)

(assert (=> b!800338 (=> (not res!544851) (not e!443741))))

(declare-fun lt!357544 () SeekEntryResult!8425)

(assert (=> b!800338 (= res!544851 (or (= lt!357544 (MissingZero!8425 i!1163)) (= lt!357544 (MissingVacant!8425 i!1163))))))

(assert (=> b!800338 (= lt!357544 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800339 () Bool)

(assert (=> b!800339 (= e!443740 e!443744)))

(declare-fun res!544857 () Bool)

(assert (=> b!800339 (=> (not res!544857) (not e!443744))))

(declare-fun lt!357543 () SeekEntryResult!8425)

(declare-fun lt!357539 () SeekEntryResult!8425)

(assert (=> b!800339 (= res!544857 (and (= lt!357539 lt!357543) (= lt!357543 (Found!8425 j!153)) (not (= (select (arr!20834 a!3170) index!1236) (select (arr!20834 a!3170) j!153)))))))

(assert (=> b!800339 (= lt!357543 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800339 (= lt!357539 (seekEntryOrOpen!0 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800340 () Bool)

(declare-fun res!544849 () Bool)

(assert (=> b!800340 (=> (not res!544849) (not e!443743))))

(assert (=> b!800340 (= res!544849 (validKeyInArray!0 (select (arr!20834 a!3170) j!153)))))

(assert (= (and start!68718 res!544852) b!800334))

(assert (= (and b!800334 res!544854) b!800340))

(assert (= (and b!800340 res!544849) b!800331))

(assert (= (and b!800331 res!544855) b!800333))

(assert (= (and b!800333 res!544848) b!800338))

(assert (= (and b!800338 res!544851) b!800336))

(assert (= (and b!800336 res!544858) b!800330))

(assert (= (and b!800330 res!544850) b!800337))

(assert (= (and b!800337 res!544853) b!800335))

(assert (= (and b!800335 res!544856) b!800339))

(assert (= (and b!800339 res!544857) b!800332))

(assert (= (and b!800332 res!544859) b!800328))

(assert (= (and b!800328 res!544847) b!800329))

(declare-fun m!741407 () Bool)

(assert (=> b!800331 m!741407))

(declare-fun m!741409 () Bool)

(assert (=> b!800339 m!741409))

(declare-fun m!741411 () Bool)

(assert (=> b!800339 m!741411))

(assert (=> b!800339 m!741411))

(declare-fun m!741413 () Bool)

(assert (=> b!800339 m!741413))

(assert (=> b!800339 m!741411))

(declare-fun m!741415 () Bool)

(assert (=> b!800339 m!741415))

(declare-fun m!741417 () Bool)

(assert (=> b!800333 m!741417))

(declare-fun m!741419 () Bool)

(assert (=> b!800338 m!741419))

(declare-fun m!741421 () Bool)

(assert (=> start!68718 m!741421))

(declare-fun m!741423 () Bool)

(assert (=> start!68718 m!741423))

(declare-fun m!741425 () Bool)

(assert (=> b!800337 m!741425))

(declare-fun m!741427 () Bool)

(assert (=> b!800337 m!741427))

(declare-fun m!741429 () Bool)

(assert (=> b!800328 m!741429))

(declare-fun m!741431 () Bool)

(assert (=> b!800332 m!741431))

(declare-fun m!741433 () Bool)

(assert (=> b!800336 m!741433))

(declare-fun m!741435 () Bool)

(assert (=> b!800330 m!741435))

(assert (=> b!800329 m!741411))

(assert (=> b!800329 m!741411))

(declare-fun m!741437 () Bool)

(assert (=> b!800329 m!741437))

(declare-fun m!741439 () Bool)

(assert (=> b!800335 m!741439))

(declare-fun m!741441 () Bool)

(assert (=> b!800335 m!741441))

(declare-fun m!741443 () Bool)

(assert (=> b!800335 m!741443))

(declare-fun m!741445 () Bool)

(assert (=> b!800335 m!741445))

(assert (=> b!800340 m!741411))

(assert (=> b!800340 m!741411))

(declare-fun m!741447 () Bool)

(assert (=> b!800340 m!741447))

(push 1)

(assert (not b!800328))

