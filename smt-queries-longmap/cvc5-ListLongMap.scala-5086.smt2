; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69026 () Bool)

(assert start!69026)

(declare-fun b!805330 () Bool)

(declare-fun res!549854 () Bool)

(declare-fun e!446004 () Bool)

(assert (=> b!805330 (=> (not res!549854) (not e!446004))))

(declare-datatypes ((array!43816 0))(
  ( (array!43817 (arr!20988 (Array (_ BitVec 32) (_ BitVec 64))) (size!21409 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43816)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805330 (= res!549854 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805331 () Bool)

(declare-fun res!549849 () Bool)

(declare-fun e!446005 () Bool)

(assert (=> b!805331 (=> (not res!549849) (not e!446005))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43816 (_ BitVec 32)) Bool)

(assert (=> b!805331 (= res!549849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805332 () Bool)

(declare-fun res!549853 () Bool)

(assert (=> b!805332 (=> (not res!549853) (not e!446005))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805332 (= res!549853 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21409 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20988 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21409 a!3170)) (= (select (arr!20988 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805333 () Bool)

(declare-fun res!549851 () Bool)

(assert (=> b!805333 (=> (not res!549851) (not e!446004))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805333 (= res!549851 (validKeyInArray!0 (select (arr!20988 a!3170) j!153)))))

(declare-fun b!805334 () Bool)

(assert (=> b!805334 (= e!446004 e!446005)))

(declare-fun res!549852 () Bool)

(assert (=> b!805334 (=> (not res!549852) (not e!446005))))

(declare-datatypes ((SeekEntryResult!8579 0))(
  ( (MissingZero!8579 (index!36684 (_ BitVec 32))) (Found!8579 (index!36685 (_ BitVec 32))) (Intermediate!8579 (undefined!9391 Bool) (index!36686 (_ BitVec 32)) (x!67505 (_ BitVec 32))) (Undefined!8579) (MissingVacant!8579 (index!36687 (_ BitVec 32))) )
))
(declare-fun lt!360573 () SeekEntryResult!8579)

(assert (=> b!805334 (= res!549852 (or (= lt!360573 (MissingZero!8579 i!1163)) (= lt!360573 (MissingVacant!8579 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43816 (_ BitVec 32)) SeekEntryResult!8579)

(assert (=> b!805334 (= lt!360573 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805335 () Bool)

(declare-fun res!549857 () Bool)

(assert (=> b!805335 (=> (not res!549857) (not e!446004))))

(assert (=> b!805335 (= res!549857 (validKeyInArray!0 k!2044))))

(declare-fun b!805336 () Bool)

(declare-fun e!446003 () Bool)

(assert (=> b!805336 (= e!446003 false)))

(declare-fun lt!360574 () SeekEntryResult!8579)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43816 (_ BitVec 32)) SeekEntryResult!8579)

(assert (=> b!805336 (= lt!360574 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20988 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360575 () SeekEntryResult!8579)

(assert (=> b!805336 (= lt!360575 (seekEntryOrOpen!0 (select (arr!20988 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805329 () Bool)

(declare-fun res!549848 () Bool)

(assert (=> b!805329 (=> (not res!549848) (not e!446004))))

(assert (=> b!805329 (= res!549848 (and (= (size!21409 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21409 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21409 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!549850 () Bool)

(assert (=> start!69026 (=> (not res!549850) (not e!446004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69026 (= res!549850 (validMask!0 mask!3266))))

(assert (=> start!69026 e!446004))

(assert (=> start!69026 true))

(declare-fun array_inv!16784 (array!43816) Bool)

(assert (=> start!69026 (array_inv!16784 a!3170)))

(declare-fun b!805337 () Bool)

(assert (=> b!805337 (= e!446005 e!446003)))

(declare-fun res!549856 () Bool)

(assert (=> b!805337 (=> (not res!549856) (not e!446003))))

(declare-fun lt!360571 () array!43816)

(declare-fun lt!360572 () (_ BitVec 64))

(assert (=> b!805337 (= res!549856 (= (seekEntryOrOpen!0 lt!360572 lt!360571 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360572 lt!360571 mask!3266)))))

(assert (=> b!805337 (= lt!360572 (select (store (arr!20988 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805337 (= lt!360571 (array!43817 (store (arr!20988 a!3170) i!1163 k!2044) (size!21409 a!3170)))))

(declare-fun b!805338 () Bool)

(declare-fun res!549855 () Bool)

(assert (=> b!805338 (=> (not res!549855) (not e!446005))))

(declare-datatypes ((List!14951 0))(
  ( (Nil!14948) (Cons!14947 (h!16076 (_ BitVec 64)) (t!21266 List!14951)) )
))
(declare-fun arrayNoDuplicates!0 (array!43816 (_ BitVec 32) List!14951) Bool)

(assert (=> b!805338 (= res!549855 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14948))))

(assert (= (and start!69026 res!549850) b!805329))

(assert (= (and b!805329 res!549848) b!805333))

(assert (= (and b!805333 res!549851) b!805335))

(assert (= (and b!805335 res!549857) b!805330))

(assert (= (and b!805330 res!549854) b!805334))

(assert (= (and b!805334 res!549852) b!805331))

(assert (= (and b!805331 res!549849) b!805338))

(assert (= (and b!805338 res!549855) b!805332))

(assert (= (and b!805332 res!549853) b!805337))

(assert (= (and b!805337 res!549856) b!805336))

(declare-fun m!747263 () Bool)

(assert (=> b!805330 m!747263))

(declare-fun m!747265 () Bool)

(assert (=> b!805331 m!747265))

(declare-fun m!747267 () Bool)

(assert (=> b!805333 m!747267))

(assert (=> b!805333 m!747267))

(declare-fun m!747269 () Bool)

(assert (=> b!805333 m!747269))

(declare-fun m!747271 () Bool)

(assert (=> b!805334 m!747271))

(declare-fun m!747273 () Bool)

(assert (=> b!805332 m!747273))

(declare-fun m!747275 () Bool)

(assert (=> b!805332 m!747275))

(declare-fun m!747277 () Bool)

(assert (=> b!805335 m!747277))

(declare-fun m!747279 () Bool)

(assert (=> b!805337 m!747279))

(declare-fun m!747281 () Bool)

(assert (=> b!805337 m!747281))

(declare-fun m!747283 () Bool)

(assert (=> b!805337 m!747283))

(declare-fun m!747285 () Bool)

(assert (=> b!805337 m!747285))

(declare-fun m!747287 () Bool)

(assert (=> b!805338 m!747287))

(assert (=> b!805336 m!747267))

(assert (=> b!805336 m!747267))

(declare-fun m!747289 () Bool)

(assert (=> b!805336 m!747289))

(assert (=> b!805336 m!747267))

(declare-fun m!747291 () Bool)

(assert (=> b!805336 m!747291))

(declare-fun m!747293 () Bool)

(assert (=> start!69026 m!747293))

(declare-fun m!747295 () Bool)

(assert (=> start!69026 m!747295))

(push 1)

(assert (not b!805333))

(assert (not b!805335))

