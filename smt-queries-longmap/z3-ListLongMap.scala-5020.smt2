; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68754 () Bool)

(assert start!68754)

(declare-fun b!799312 () Bool)

(declare-fun e!443402 () Bool)

(declare-fun e!443401 () Bool)

(assert (=> b!799312 (= e!443402 e!443401)))

(declare-fun res!543462 () Bool)

(assert (=> b!799312 (=> (not res!543462) (not e!443401))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356804 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43418 0))(
  ( (array!43419 (arr!20785 (Array (_ BitVec 32) (_ BitVec 64))) (size!21205 (_ BitVec 32))) )
))
(declare-fun lt!356803 () array!43418)

(declare-datatypes ((SeekEntryResult!8332 0))(
  ( (MissingZero!8332 (index!35696 (_ BitVec 32))) (Found!8332 (index!35697 (_ BitVec 32))) (Intermediate!8332 (undefined!9144 Bool) (index!35698 (_ BitVec 32)) (x!66741 (_ BitVec 32))) (Undefined!8332) (MissingVacant!8332 (index!35699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43418 (_ BitVec 32)) SeekEntryResult!8332)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43418 (_ BitVec 32)) SeekEntryResult!8332)

(assert (=> b!799312 (= res!543462 (= (seekEntryOrOpen!0 lt!356804 lt!356803 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356804 lt!356803 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43418)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799312 (= lt!356804 (select (store (arr!20785 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799312 (= lt!356803 (array!43419 (store (arr!20785 a!3170) i!1163 k0!2044) (size!21205 a!3170)))))

(declare-fun b!799313 () Bool)

(declare-fun res!543460 () Bool)

(declare-fun e!443404 () Bool)

(assert (=> b!799313 (=> (not res!543460) (not e!443404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799313 (= res!543460 (validKeyInArray!0 (select (arr!20785 a!3170) j!153)))))

(declare-fun b!799314 () Bool)

(declare-fun res!543461 () Bool)

(assert (=> b!799314 (=> (not res!543461) (not e!443404))))

(assert (=> b!799314 (= res!543461 (and (= (size!21205 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21205 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21205 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799315 () Bool)

(declare-fun res!543464 () Bool)

(assert (=> b!799315 (=> (not res!543464) (not e!443402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43418 (_ BitVec 32)) Bool)

(assert (=> b!799315 (= res!543464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799316 () Bool)

(declare-fun res!543465 () Bool)

(assert (=> b!799316 (=> (not res!543465) (not e!443404))))

(assert (=> b!799316 (= res!543465 (validKeyInArray!0 k0!2044))))

(declare-fun b!799317 () Bool)

(assert (=> b!799317 (= e!443404 e!443402)))

(declare-fun res!543463 () Bool)

(assert (=> b!799317 (=> (not res!543463) (not e!443402))))

(declare-fun lt!356802 () SeekEntryResult!8332)

(assert (=> b!799317 (= res!543463 (or (= lt!356802 (MissingZero!8332 i!1163)) (= lt!356802 (MissingVacant!8332 i!1163))))))

(assert (=> b!799317 (= lt!356802 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun lt!356806 () SeekEntryResult!8332)

(declare-fun b!799318 () Bool)

(declare-fun lt!356805 () SeekEntryResult!8332)

(assert (=> b!799318 (= e!443401 (and (= lt!356806 lt!356805) (= lt!356805 (Found!8332 j!153)) (not (= (select (arr!20785 a!3170) index!1236) (select (arr!20785 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799318 (= lt!356805 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20785 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799318 (= lt!356806 (seekEntryOrOpen!0 (select (arr!20785 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799319 () Bool)

(declare-fun res!543457 () Bool)

(assert (=> b!799319 (=> (not res!543457) (not e!443402))))

(assert (=> b!799319 (= res!543457 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21205 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20785 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21205 a!3170)) (= (select (arr!20785 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799320 () Bool)

(declare-fun res!543456 () Bool)

(assert (=> b!799320 (=> (not res!543456) (not e!443404))))

(declare-fun arrayContainsKey!0 (array!43418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799320 (= res!543456 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!543458 () Bool)

(assert (=> start!68754 (=> (not res!543458) (not e!443404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68754 (= res!543458 (validMask!0 mask!3266))))

(assert (=> start!68754 e!443404))

(assert (=> start!68754 true))

(declare-fun array_inv!16644 (array!43418) Bool)

(assert (=> start!68754 (array_inv!16644 a!3170)))

(declare-fun b!799311 () Bool)

(declare-fun res!543459 () Bool)

(assert (=> b!799311 (=> (not res!543459) (not e!443402))))

(declare-datatypes ((List!14655 0))(
  ( (Nil!14652) (Cons!14651 (h!15786 (_ BitVec 64)) (t!20962 List!14655)) )
))
(declare-fun arrayNoDuplicates!0 (array!43418 (_ BitVec 32) List!14655) Bool)

(assert (=> b!799311 (= res!543459 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14652))))

(assert (= (and start!68754 res!543458) b!799314))

(assert (= (and b!799314 res!543461) b!799313))

(assert (= (and b!799313 res!543460) b!799316))

(assert (= (and b!799316 res!543465) b!799320))

(assert (= (and b!799320 res!543456) b!799317))

(assert (= (and b!799317 res!543463) b!799315))

(assert (= (and b!799315 res!543464) b!799311))

(assert (= (and b!799311 res!543459) b!799319))

(assert (= (and b!799319 res!543457) b!799312))

(assert (= (and b!799312 res!543462) b!799318))

(declare-fun m!740681 () Bool)

(assert (=> b!799311 m!740681))

(declare-fun m!740683 () Bool)

(assert (=> b!799316 m!740683))

(declare-fun m!740685 () Bool)

(assert (=> b!799312 m!740685))

(declare-fun m!740687 () Bool)

(assert (=> b!799312 m!740687))

(declare-fun m!740689 () Bool)

(assert (=> b!799312 m!740689))

(declare-fun m!740691 () Bool)

(assert (=> b!799312 m!740691))

(declare-fun m!740693 () Bool)

(assert (=> b!799317 m!740693))

(declare-fun m!740695 () Bool)

(assert (=> b!799319 m!740695))

(declare-fun m!740697 () Bool)

(assert (=> b!799319 m!740697))

(declare-fun m!740699 () Bool)

(assert (=> b!799313 m!740699))

(assert (=> b!799313 m!740699))

(declare-fun m!740701 () Bool)

(assert (=> b!799313 m!740701))

(declare-fun m!740703 () Bool)

(assert (=> b!799320 m!740703))

(declare-fun m!740705 () Bool)

(assert (=> b!799318 m!740705))

(assert (=> b!799318 m!740699))

(assert (=> b!799318 m!740699))

(declare-fun m!740707 () Bool)

(assert (=> b!799318 m!740707))

(assert (=> b!799318 m!740699))

(declare-fun m!740709 () Bool)

(assert (=> b!799318 m!740709))

(declare-fun m!740711 () Bool)

(assert (=> start!68754 m!740711))

(declare-fun m!740713 () Bool)

(assert (=> start!68754 m!740713))

(declare-fun m!740715 () Bool)

(assert (=> b!799315 m!740715))

(check-sat (not b!799320) (not b!799315) (not b!799317) (not start!68754) (not b!799313) (not b!799311) (not b!799318) (not b!799312) (not b!799316))
(check-sat)
