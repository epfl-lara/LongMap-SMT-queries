; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68452 () Bool)

(assert start!68452)

(declare-fun b!795675 () Bool)

(declare-fun res!540196 () Bool)

(declare-fun e!441599 () Bool)

(assert (=> b!795675 (=> (not res!540196) (not e!441599))))

(declare-datatypes ((array!43242 0))(
  ( (array!43243 (arr!20701 (Array (_ BitVec 32) (_ BitVec 64))) (size!21122 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43242)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795675 (= res!540196 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795676 () Bool)

(declare-fun res!540198 () Bool)

(declare-fun e!441597 () Bool)

(assert (=> b!795676 (=> (not res!540198) (not e!441597))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43242 (_ BitVec 32)) Bool)

(assert (=> b!795676 (= res!540198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795677 () Bool)

(declare-fun res!540199 () Bool)

(assert (=> b!795677 (=> (not res!540199) (not e!441597))))

(declare-datatypes ((List!14664 0))(
  ( (Nil!14661) (Cons!14660 (h!15789 (_ BitVec 64)) (t!20979 List!14664)) )
))
(declare-fun arrayNoDuplicates!0 (array!43242 (_ BitVec 32) List!14664) Bool)

(assert (=> b!795677 (= res!540199 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14661))))

(declare-fun b!795678 () Bool)

(declare-fun res!540201 () Bool)

(assert (=> b!795678 (=> (not res!540201) (not e!441599))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795678 (= res!540201 (and (= (size!21122 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21122 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21122 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795679 () Bool)

(declare-fun res!540202 () Bool)

(assert (=> b!795679 (=> (not res!540202) (not e!441597))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795679 (= res!540202 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21122 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20701 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21122 a!3170)) (= (select (arr!20701 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795680 () Bool)

(declare-fun e!441596 () Bool)

(assert (=> b!795680 (= e!441596 false)))

(declare-datatypes ((SeekEntryResult!8292 0))(
  ( (MissingZero!8292 (index!35536 (_ BitVec 32))) (Found!8292 (index!35537 (_ BitVec 32))) (Intermediate!8292 (undefined!9104 Bool) (index!35538 (_ BitVec 32)) (x!66450 (_ BitVec 32))) (Undefined!8292) (MissingVacant!8292 (index!35539 (_ BitVec 32))) )
))
(declare-fun lt!354691 () SeekEntryResult!8292)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43242 (_ BitVec 32)) SeekEntryResult!8292)

(assert (=> b!795680 (= lt!354691 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20701 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354693 () SeekEntryResult!8292)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43242 (_ BitVec 32)) SeekEntryResult!8292)

(assert (=> b!795680 (= lt!354693 (seekEntryOrOpen!0 (select (arr!20701 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795681 () Bool)

(assert (=> b!795681 (= e!441599 e!441597)))

(declare-fun res!540200 () Bool)

(assert (=> b!795681 (=> (not res!540200) (not e!441597))))

(declare-fun lt!354694 () SeekEntryResult!8292)

(assert (=> b!795681 (= res!540200 (or (= lt!354694 (MissingZero!8292 i!1163)) (= lt!354694 (MissingVacant!8292 i!1163))))))

(assert (=> b!795681 (= lt!354694 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795683 () Bool)

(assert (=> b!795683 (= e!441597 e!441596)))

(declare-fun res!540197 () Bool)

(assert (=> b!795683 (=> (not res!540197) (not e!441596))))

(declare-fun lt!354692 () array!43242)

(declare-fun lt!354695 () (_ BitVec 64))

(assert (=> b!795683 (= res!540197 (= (seekEntryOrOpen!0 lt!354695 lt!354692 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354695 lt!354692 mask!3266)))))

(assert (=> b!795683 (= lt!354695 (select (store (arr!20701 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795683 (= lt!354692 (array!43243 (store (arr!20701 a!3170) i!1163 k0!2044) (size!21122 a!3170)))))

(declare-fun b!795684 () Bool)

(declare-fun res!540195 () Bool)

(assert (=> b!795684 (=> (not res!540195) (not e!441599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795684 (= res!540195 (validKeyInArray!0 (select (arr!20701 a!3170) j!153)))))

(declare-fun b!795682 () Bool)

(declare-fun res!540203 () Bool)

(assert (=> b!795682 (=> (not res!540203) (not e!441599))))

(assert (=> b!795682 (= res!540203 (validKeyInArray!0 k0!2044))))

(declare-fun res!540194 () Bool)

(assert (=> start!68452 (=> (not res!540194) (not e!441599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68452 (= res!540194 (validMask!0 mask!3266))))

(assert (=> start!68452 e!441599))

(assert (=> start!68452 true))

(declare-fun array_inv!16497 (array!43242) Bool)

(assert (=> start!68452 (array_inv!16497 a!3170)))

(assert (= (and start!68452 res!540194) b!795678))

(assert (= (and b!795678 res!540201) b!795684))

(assert (= (and b!795684 res!540195) b!795682))

(assert (= (and b!795682 res!540203) b!795675))

(assert (= (and b!795675 res!540196) b!795681))

(assert (= (and b!795681 res!540200) b!795676))

(assert (= (and b!795676 res!540198) b!795677))

(assert (= (and b!795677 res!540199) b!795679))

(assert (= (and b!795679 res!540202) b!795683))

(assert (= (and b!795683 res!540197) b!795680))

(declare-fun m!736353 () Bool)

(assert (=> b!795681 m!736353))

(declare-fun m!736355 () Bool)

(assert (=> b!795684 m!736355))

(assert (=> b!795684 m!736355))

(declare-fun m!736357 () Bool)

(assert (=> b!795684 m!736357))

(declare-fun m!736359 () Bool)

(assert (=> b!795679 m!736359))

(declare-fun m!736361 () Bool)

(assert (=> b!795679 m!736361))

(declare-fun m!736363 () Bool)

(assert (=> b!795682 m!736363))

(declare-fun m!736365 () Bool)

(assert (=> b!795677 m!736365))

(declare-fun m!736367 () Bool)

(assert (=> b!795675 m!736367))

(declare-fun m!736369 () Bool)

(assert (=> b!795676 m!736369))

(declare-fun m!736371 () Bool)

(assert (=> b!795683 m!736371))

(declare-fun m!736373 () Bool)

(assert (=> b!795683 m!736373))

(declare-fun m!736375 () Bool)

(assert (=> b!795683 m!736375))

(declare-fun m!736377 () Bool)

(assert (=> b!795683 m!736377))

(assert (=> b!795680 m!736355))

(assert (=> b!795680 m!736355))

(declare-fun m!736379 () Bool)

(assert (=> b!795680 m!736379))

(assert (=> b!795680 m!736355))

(declare-fun m!736381 () Bool)

(assert (=> b!795680 m!736381))

(declare-fun m!736383 () Bool)

(assert (=> start!68452 m!736383))

(declare-fun m!736385 () Bool)

(assert (=> start!68452 m!736385))

(check-sat (not b!795675) (not b!795684) (not b!795681) (not b!795680) (not b!795683) (not b!795677) (not start!68452) (not b!795676) (not b!795682))
(check-sat)
