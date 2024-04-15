; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69138 () Bool)

(assert start!69138)

(declare-fun b!806188 () Bool)

(declare-fun e!446440 () Bool)

(assert (=> b!806188 (= e!446440 (not true))))

(declare-datatypes ((SeekEntryResult!8593 0))(
  ( (MissingZero!8593 (index!36740 (_ BitVec 32))) (Found!8593 (index!36741 (_ BitVec 32))) (Intermediate!8593 (undefined!9405 Bool) (index!36742 (_ BitVec 32)) (x!67568 (_ BitVec 32))) (Undefined!8593) (MissingVacant!8593 (index!36743 (_ BitVec 32))) )
))
(declare-fun lt!360902 () SeekEntryResult!8593)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806188 (= lt!360902 (Found!8593 index!1236))))

(declare-fun b!806189 () Bool)

(declare-fun res!550458 () Bool)

(declare-fun e!446439 () Bool)

(assert (=> b!806189 (=> (not res!550458) (not e!446439))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43855 0))(
  ( (array!43856 (arr!21005 (Array (_ BitVec 32) (_ BitVec 64))) (size!21426 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43855)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806189 (= res!550458 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21426 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21005 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21426 a!3170)) (= (select (arr!21005 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806190 () Bool)

(declare-fun e!446438 () Bool)

(assert (=> b!806190 (= e!446438 e!446440)))

(declare-fun res!550461 () Bool)

(assert (=> b!806190 (=> (not res!550461) (not e!446440))))

(declare-fun lt!360901 () SeekEntryResult!8593)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!360896 () SeekEntryResult!8593)

(assert (=> b!806190 (= res!550461 (and (= lt!360896 lt!360901) (= lt!360901 (Found!8593 j!153)) (= (select (arr!21005 a!3170) index!1236) (select (arr!21005 a!3170) j!153))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43855 (_ BitVec 32)) SeekEntryResult!8593)

(assert (=> b!806190 (= lt!360901 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43855 (_ BitVec 32)) SeekEntryResult!8593)

(assert (=> b!806190 (= lt!360896 (seekEntryOrOpen!0 (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806191 () Bool)

(declare-fun res!550451 () Bool)

(assert (=> b!806191 (=> (not res!550451) (not e!446439))))

(declare-datatypes ((List!15007 0))(
  ( (Nil!15004) (Cons!15003 (h!16132 (_ BitVec 64)) (t!21313 List!15007)) )
))
(declare-fun arrayNoDuplicates!0 (array!43855 (_ BitVec 32) List!15007) Bool)

(assert (=> b!806191 (= res!550451 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15004))))

(declare-fun b!806192 () Bool)

(assert (=> b!806192 (= e!446439 e!446438)))

(declare-fun res!550455 () Bool)

(assert (=> b!806192 (=> (not res!550455) (not e!446438))))

(declare-fun lt!360900 () SeekEntryResult!8593)

(assert (=> b!806192 (= res!550455 (= lt!360900 lt!360902))))

(declare-fun lt!360897 () array!43855)

(declare-fun lt!360898 () (_ BitVec 64))

(assert (=> b!806192 (= lt!360902 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360898 lt!360897 mask!3266))))

(assert (=> b!806192 (= lt!360900 (seekEntryOrOpen!0 lt!360898 lt!360897 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806192 (= lt!360898 (select (store (arr!21005 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806192 (= lt!360897 (array!43856 (store (arr!21005 a!3170) i!1163 k0!2044) (size!21426 a!3170)))))

(declare-fun b!806193 () Bool)

(declare-fun e!446437 () Bool)

(assert (=> b!806193 (= e!446437 e!446439)))

(declare-fun res!550459 () Bool)

(assert (=> b!806193 (=> (not res!550459) (not e!446439))))

(declare-fun lt!360899 () SeekEntryResult!8593)

(assert (=> b!806193 (= res!550459 (or (= lt!360899 (MissingZero!8593 i!1163)) (= lt!360899 (MissingVacant!8593 i!1163))))))

(assert (=> b!806193 (= lt!360899 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806195 () Bool)

(declare-fun res!550460 () Bool)

(assert (=> b!806195 (=> (not res!550460) (not e!446437))))

(declare-fun arrayContainsKey!0 (array!43855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806195 (= res!550460 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806196 () Bool)

(declare-fun res!550456 () Bool)

(assert (=> b!806196 (=> (not res!550456) (not e!446437))))

(assert (=> b!806196 (= res!550456 (and (= (size!21426 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21426 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21426 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806197 () Bool)

(declare-fun res!550452 () Bool)

(assert (=> b!806197 (=> (not res!550452) (not e!446437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806197 (= res!550452 (validKeyInArray!0 k0!2044))))

(declare-fun b!806198 () Bool)

(declare-fun res!550454 () Bool)

(assert (=> b!806198 (=> (not res!550454) (not e!446439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43855 (_ BitVec 32)) Bool)

(assert (=> b!806198 (= res!550454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!550457 () Bool)

(assert (=> start!69138 (=> (not res!550457) (not e!446437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69138 (= res!550457 (validMask!0 mask!3266))))

(assert (=> start!69138 e!446437))

(assert (=> start!69138 true))

(declare-fun array_inv!16888 (array!43855) Bool)

(assert (=> start!69138 (array_inv!16888 a!3170)))

(declare-fun b!806194 () Bool)

(declare-fun res!550453 () Bool)

(assert (=> b!806194 (=> (not res!550453) (not e!446437))))

(assert (=> b!806194 (= res!550453 (validKeyInArray!0 (select (arr!21005 a!3170) j!153)))))

(assert (= (and start!69138 res!550457) b!806196))

(assert (= (and b!806196 res!550456) b!806194))

(assert (= (and b!806194 res!550453) b!806197))

(assert (= (and b!806197 res!550452) b!806195))

(assert (= (and b!806195 res!550460) b!806193))

(assert (= (and b!806193 res!550459) b!806198))

(assert (= (and b!806198 res!550454) b!806191))

(assert (= (and b!806191 res!550451) b!806189))

(assert (= (and b!806189 res!550458) b!806192))

(assert (= (and b!806192 res!550455) b!806190))

(assert (= (and b!806190 res!550461) b!806188))

(declare-fun m!747619 () Bool)

(assert (=> b!806198 m!747619))

(declare-fun m!747621 () Bool)

(assert (=> b!806189 m!747621))

(declare-fun m!747623 () Bool)

(assert (=> b!806189 m!747623))

(declare-fun m!747625 () Bool)

(assert (=> b!806190 m!747625))

(declare-fun m!747627 () Bool)

(assert (=> b!806190 m!747627))

(assert (=> b!806190 m!747627))

(declare-fun m!747629 () Bool)

(assert (=> b!806190 m!747629))

(assert (=> b!806190 m!747627))

(declare-fun m!747631 () Bool)

(assert (=> b!806190 m!747631))

(declare-fun m!747633 () Bool)

(assert (=> b!806193 m!747633))

(declare-fun m!747635 () Bool)

(assert (=> b!806191 m!747635))

(declare-fun m!747637 () Bool)

(assert (=> b!806192 m!747637))

(declare-fun m!747639 () Bool)

(assert (=> b!806192 m!747639))

(declare-fun m!747641 () Bool)

(assert (=> b!806192 m!747641))

(declare-fun m!747643 () Bool)

(assert (=> b!806192 m!747643))

(declare-fun m!747645 () Bool)

(assert (=> b!806195 m!747645))

(assert (=> b!806194 m!747627))

(assert (=> b!806194 m!747627))

(declare-fun m!747647 () Bool)

(assert (=> b!806194 m!747647))

(declare-fun m!747649 () Bool)

(assert (=> b!806197 m!747649))

(declare-fun m!747651 () Bool)

(assert (=> start!69138 m!747651))

(declare-fun m!747653 () Bool)

(assert (=> start!69138 m!747653))

(check-sat (not b!806197) (not b!806193) (not b!806192) (not b!806198) (not start!69138) (not b!806191) (not b!806190) (not b!806194) (not b!806195))
(check-sat)
