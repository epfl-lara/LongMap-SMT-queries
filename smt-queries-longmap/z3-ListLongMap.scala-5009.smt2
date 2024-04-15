; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68544 () Bool)

(assert start!68544)

(declare-fun b!797300 () Bool)

(declare-fun res!541971 () Bool)

(declare-fun e!442315 () Bool)

(assert (=> b!797300 (=> (not res!541971) (not e!442315))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43351 0))(
  ( (array!43352 (arr!20756 (Array (_ BitVec 32) (_ BitVec 64))) (size!21177 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43351)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797300 (= res!541971 (and (= (size!21177 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21177 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21177 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797301 () Bool)

(declare-fun e!442313 () Bool)

(declare-fun e!442312 () Bool)

(assert (=> b!797301 (= e!442313 e!442312)))

(declare-fun res!541967 () Bool)

(assert (=> b!797301 (=> (not res!541967) (not e!442312))))

(declare-datatypes ((SeekEntryResult!8344 0))(
  ( (MissingZero!8344 (index!35744 (_ BitVec 32))) (Found!8344 (index!35745 (_ BitVec 32))) (Intermediate!8344 (undefined!9156 Bool) (index!35746 (_ BitVec 32)) (x!66649 (_ BitVec 32))) (Undefined!8344) (MissingVacant!8344 (index!35747 (_ BitVec 32))) )
))
(declare-fun lt!355607 () SeekEntryResult!8344)

(declare-fun lt!355606 () SeekEntryResult!8344)

(assert (=> b!797301 (= res!541967 (= lt!355607 lt!355606))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355603 () array!43351)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355610 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43351 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!797301 (= lt!355606 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355610 lt!355603 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43351 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!797301 (= lt!355607 (seekEntryOrOpen!0 lt!355610 lt!355603 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!797301 (= lt!355610 (select (store (arr!20756 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797301 (= lt!355603 (array!43352 (store (arr!20756 a!3170) i!1163 k0!2044) (size!21177 a!3170)))))

(declare-fun b!797302 () Bool)

(declare-fun res!541962 () Bool)

(assert (=> b!797302 (=> (not res!541962) (not e!442313))))

(declare-datatypes ((List!14758 0))(
  ( (Nil!14755) (Cons!14754 (h!15883 (_ BitVec 64)) (t!21064 List!14758)) )
))
(declare-fun arrayNoDuplicates!0 (array!43351 (_ BitVec 32) List!14758) Bool)

(assert (=> b!797302 (= res!541962 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14755))))

(declare-fun b!797303 () Bool)

(declare-fun e!442314 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797303 (= e!442314 (validKeyInArray!0 lt!355610))))

(declare-fun b!797304 () Bool)

(declare-fun e!442310 () Bool)

(assert (=> b!797304 (= e!442312 e!442310)))

(declare-fun res!541959 () Bool)

(assert (=> b!797304 (=> (not res!541959) (not e!442310))))

(declare-fun lt!355609 () SeekEntryResult!8344)

(declare-fun lt!355608 () SeekEntryResult!8344)

(assert (=> b!797304 (= res!541959 (= lt!355609 lt!355608))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797304 (= lt!355608 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20756 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797304 (= lt!355609 (seekEntryOrOpen!0 (select (arr!20756 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!541965 () Bool)

(assert (=> start!68544 (=> (not res!541965) (not e!442315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68544 (= res!541965 (validMask!0 mask!3266))))

(assert (=> start!68544 e!442315))

(assert (=> start!68544 true))

(declare-fun array_inv!16639 (array!43351) Bool)

(assert (=> start!68544 (array_inv!16639 a!3170)))

(declare-fun b!797305 () Bool)

(declare-fun res!541963 () Bool)

(assert (=> b!797305 (=> (not res!541963) (not e!442313))))

(assert (=> b!797305 (= res!541963 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21177 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20756 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21177 a!3170)) (= (select (arr!20756 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797306 () Bool)

(declare-fun res!541961 () Bool)

(assert (=> b!797306 (=> (not res!541961) (not e!442313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43351 (_ BitVec 32)) Bool)

(assert (=> b!797306 (= res!541961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797307 () Bool)

(declare-fun res!541966 () Bool)

(assert (=> b!797307 (=> (not res!541966) (not e!442315))))

(declare-fun arrayContainsKey!0 (array!43351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797307 (= res!541966 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797308 () Bool)

(declare-fun res!541969 () Bool)

(assert (=> b!797308 (=> (not res!541969) (not e!442315))))

(assert (=> b!797308 (= res!541969 (validKeyInArray!0 k0!2044))))

(declare-fun b!797309 () Bool)

(assert (=> b!797309 (= e!442315 e!442313)))

(declare-fun res!541960 () Bool)

(assert (=> b!797309 (=> (not res!541960) (not e!442313))))

(declare-fun lt!355605 () SeekEntryResult!8344)

(assert (=> b!797309 (= res!541960 (or (= lt!355605 (MissingZero!8344 i!1163)) (= lt!355605 (MissingVacant!8344 i!1163))))))

(assert (=> b!797309 (= lt!355605 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797310 () Bool)

(declare-fun e!442309 () Bool)

(assert (=> b!797310 (= e!442309 (not e!442314))))

(declare-fun res!541964 () Bool)

(assert (=> b!797310 (=> res!541964 e!442314)))

(declare-fun lt!355604 () SeekEntryResult!8344)

(assert (=> b!797310 (= res!541964 (or (not (= lt!355606 lt!355604)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20756 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797310 (= lt!355606 (Found!8344 index!1236))))

(declare-fun b!797311 () Bool)

(declare-fun res!541968 () Bool)

(assert (=> b!797311 (=> (not res!541968) (not e!442315))))

(assert (=> b!797311 (= res!541968 (validKeyInArray!0 (select (arr!20756 a!3170) j!153)))))

(declare-fun b!797312 () Bool)

(assert (=> b!797312 (= e!442310 e!442309)))

(declare-fun res!541970 () Bool)

(assert (=> b!797312 (=> (not res!541970) (not e!442309))))

(assert (=> b!797312 (= res!541970 (and (= lt!355608 lt!355604) (= (select (arr!20756 a!3170) index!1236) (select (arr!20756 a!3170) j!153))))))

(assert (=> b!797312 (= lt!355604 (Found!8344 j!153))))

(assert (= (and start!68544 res!541965) b!797300))

(assert (= (and b!797300 res!541971) b!797311))

(assert (= (and b!797311 res!541968) b!797308))

(assert (= (and b!797308 res!541969) b!797307))

(assert (= (and b!797307 res!541966) b!797309))

(assert (= (and b!797309 res!541960) b!797306))

(assert (= (and b!797306 res!541961) b!797302))

(assert (= (and b!797302 res!541962) b!797305))

(assert (= (and b!797305 res!541963) b!797301))

(assert (= (and b!797301 res!541967) b!797304))

(assert (= (and b!797304 res!541959) b!797312))

(assert (= (and b!797312 res!541970) b!797310))

(assert (= (and b!797310 (not res!541964)) b!797303))

(declare-fun m!737665 () Bool)

(assert (=> b!797308 m!737665))

(declare-fun m!737667 () Bool)

(assert (=> b!797306 m!737667))

(declare-fun m!737669 () Bool)

(assert (=> b!797304 m!737669))

(assert (=> b!797304 m!737669))

(declare-fun m!737671 () Bool)

(assert (=> b!797304 m!737671))

(assert (=> b!797304 m!737669))

(declare-fun m!737673 () Bool)

(assert (=> b!797304 m!737673))

(assert (=> b!797311 m!737669))

(assert (=> b!797311 m!737669))

(declare-fun m!737675 () Bool)

(assert (=> b!797311 m!737675))

(declare-fun m!737677 () Bool)

(assert (=> b!797307 m!737677))

(declare-fun m!737679 () Bool)

(assert (=> b!797309 m!737679))

(declare-fun m!737681 () Bool)

(assert (=> b!797301 m!737681))

(declare-fun m!737683 () Bool)

(assert (=> b!797301 m!737683))

(declare-fun m!737685 () Bool)

(assert (=> b!797301 m!737685))

(declare-fun m!737687 () Bool)

(assert (=> b!797301 m!737687))

(declare-fun m!737689 () Bool)

(assert (=> b!797305 m!737689))

(declare-fun m!737691 () Bool)

(assert (=> b!797305 m!737691))

(declare-fun m!737693 () Bool)

(assert (=> b!797303 m!737693))

(declare-fun m!737695 () Bool)

(assert (=> b!797302 m!737695))

(declare-fun m!737697 () Bool)

(assert (=> b!797312 m!737697))

(assert (=> b!797312 m!737669))

(assert (=> b!797310 m!737685))

(declare-fun m!737699 () Bool)

(assert (=> b!797310 m!737699))

(declare-fun m!737701 () Bool)

(assert (=> start!68544 m!737701))

(declare-fun m!737703 () Bool)

(assert (=> start!68544 m!737703))

(check-sat (not start!68544) (not b!797301) (not b!797304) (not b!797302) (not b!797309) (not b!797308) (not b!797303) (not b!797307) (not b!797311) (not b!797306))
(check-sat)
