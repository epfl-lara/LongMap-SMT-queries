; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69198 () Bool)

(assert start!69198)

(declare-fun b!807187 () Bool)

(declare-fun e!446899 () Bool)

(declare-fun e!446898 () Bool)

(assert (=> b!807187 (= e!446899 e!446898)))

(declare-fun res!551451 () Bool)

(assert (=> b!807187 (=> (not res!551451) (not e!446898))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43915 0))(
  ( (array!43916 (arr!21035 (Array (_ BitVec 32) (_ BitVec 64))) (size!21456 (_ BitVec 32))) )
))
(declare-fun lt!361488 () array!43915)

(declare-fun lt!361490 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8623 0))(
  ( (MissingZero!8623 (index!36860 (_ BitVec 32))) (Found!8623 (index!36861 (_ BitVec 32))) (Intermediate!8623 (undefined!9435 Bool) (index!36862 (_ BitVec 32)) (x!67678 (_ BitVec 32))) (Undefined!8623) (MissingVacant!8623 (index!36863 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43915 (_ BitVec 32)) SeekEntryResult!8623)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43915 (_ BitVec 32)) SeekEntryResult!8623)

(assert (=> b!807187 (= res!551451 (= (seekEntryOrOpen!0 lt!361490 lt!361488 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361490 lt!361488 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43915)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807187 (= lt!361490 (select (store (arr!21035 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807187 (= lt!361488 (array!43916 (store (arr!21035 a!3170) i!1163 k0!2044) (size!21456 a!3170)))))

(declare-fun b!807188 () Bool)

(declare-fun e!446897 () Bool)

(assert (=> b!807188 (= e!446897 e!446899)))

(declare-fun res!551452 () Bool)

(assert (=> b!807188 (=> (not res!551452) (not e!446899))))

(declare-fun lt!361493 () SeekEntryResult!8623)

(assert (=> b!807188 (= res!551452 (or (= lt!361493 (MissingZero!8623 i!1163)) (= lt!361493 (MissingVacant!8623 i!1163))))))

(assert (=> b!807188 (= lt!361493 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807189 () Bool)

(declare-fun e!446895 () Bool)

(assert (=> b!807189 (= e!446898 e!446895)))

(declare-fun res!551453 () Bool)

(assert (=> b!807189 (=> (not res!551453) (not e!446895))))

(declare-fun lt!361492 () SeekEntryResult!8623)

(declare-fun lt!361491 () SeekEntryResult!8623)

(assert (=> b!807189 (= res!551453 (and (= lt!361491 lt!361492) (= lt!361492 (Found!8623 j!153)) (not (= (select (arr!21035 a!3170) index!1236) (select (arr!21035 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807189 (= lt!361492 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21035 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807189 (= lt!361491 (seekEntryOrOpen!0 (select (arr!21035 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807190 () Bool)

(declare-fun res!551454 () Bool)

(assert (=> b!807190 (=> (not res!551454) (not e!446899))))

(assert (=> b!807190 (= res!551454 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21456 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21035 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21456 a!3170)) (= (select (arr!21035 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807191 () Bool)

(declare-fun res!551460 () Bool)

(assert (=> b!807191 (=> (not res!551460) (not e!446897))))

(declare-fun arrayContainsKey!0 (array!43915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807191 (= res!551460 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807192 () Bool)

(declare-fun res!551456 () Bool)

(assert (=> b!807192 (=> (not res!551456) (not e!446897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807192 (= res!551456 (validKeyInArray!0 k0!2044))))

(declare-fun b!807193 () Bool)

(declare-fun res!551457 () Bool)

(assert (=> b!807193 (=> (not res!551457) (not e!446899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43915 (_ BitVec 32)) Bool)

(assert (=> b!807193 (= res!551457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807194 () Bool)

(declare-fun res!551459 () Bool)

(assert (=> b!807194 (=> (not res!551459) (not e!446897))))

(assert (=> b!807194 (= res!551459 (and (= (size!21456 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21456 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21456 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807195 () Bool)

(assert (=> b!807195 (= e!446895 false)))

(declare-fun lt!361489 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807195 (= lt!361489 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!551455 () Bool)

(assert (=> start!69198 (=> (not res!551455) (not e!446897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69198 (= res!551455 (validMask!0 mask!3266))))

(assert (=> start!69198 e!446897))

(assert (=> start!69198 true))

(declare-fun array_inv!16918 (array!43915) Bool)

(assert (=> start!69198 (array_inv!16918 a!3170)))

(declare-fun b!807196 () Bool)

(declare-fun res!551450 () Bool)

(assert (=> b!807196 (=> (not res!551450) (not e!446899))))

(declare-datatypes ((List!15037 0))(
  ( (Nil!15034) (Cons!15033 (h!16162 (_ BitVec 64)) (t!21343 List!15037)) )
))
(declare-fun arrayNoDuplicates!0 (array!43915 (_ BitVec 32) List!15037) Bool)

(assert (=> b!807196 (= res!551450 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15034))))

(declare-fun b!807197 () Bool)

(declare-fun res!551458 () Bool)

(assert (=> b!807197 (=> (not res!551458) (not e!446897))))

(assert (=> b!807197 (= res!551458 (validKeyInArray!0 (select (arr!21035 a!3170) j!153)))))

(assert (= (and start!69198 res!551455) b!807194))

(assert (= (and b!807194 res!551459) b!807197))

(assert (= (and b!807197 res!551458) b!807192))

(assert (= (and b!807192 res!551456) b!807191))

(assert (= (and b!807191 res!551460) b!807188))

(assert (= (and b!807188 res!551452) b!807193))

(assert (= (and b!807193 res!551457) b!807196))

(assert (= (and b!807196 res!551450) b!807190))

(assert (= (and b!807190 res!551454) b!807187))

(assert (= (and b!807187 res!551451) b!807189))

(assert (= (and b!807189 res!551453) b!807195))

(declare-fun m!748729 () Bool)

(assert (=> b!807193 m!748729))

(declare-fun m!748731 () Bool)

(assert (=> b!807190 m!748731))

(declare-fun m!748733 () Bool)

(assert (=> b!807190 m!748733))

(declare-fun m!748735 () Bool)

(assert (=> b!807191 m!748735))

(declare-fun m!748737 () Bool)

(assert (=> b!807189 m!748737))

(declare-fun m!748739 () Bool)

(assert (=> b!807189 m!748739))

(assert (=> b!807189 m!748739))

(declare-fun m!748741 () Bool)

(assert (=> b!807189 m!748741))

(assert (=> b!807189 m!748739))

(declare-fun m!748743 () Bool)

(assert (=> b!807189 m!748743))

(declare-fun m!748745 () Bool)

(assert (=> b!807195 m!748745))

(declare-fun m!748747 () Bool)

(assert (=> start!69198 m!748747))

(declare-fun m!748749 () Bool)

(assert (=> start!69198 m!748749))

(declare-fun m!748751 () Bool)

(assert (=> b!807192 m!748751))

(assert (=> b!807197 m!748739))

(assert (=> b!807197 m!748739))

(declare-fun m!748753 () Bool)

(assert (=> b!807197 m!748753))

(declare-fun m!748755 () Bool)

(assert (=> b!807188 m!748755))

(declare-fun m!748757 () Bool)

(assert (=> b!807196 m!748757))

(declare-fun m!748759 () Bool)

(assert (=> b!807187 m!748759))

(declare-fun m!748761 () Bool)

(assert (=> b!807187 m!748761))

(declare-fun m!748763 () Bool)

(assert (=> b!807187 m!748763))

(declare-fun m!748765 () Bool)

(assert (=> b!807187 m!748765))

(check-sat (not b!807189) (not b!807195) (not b!807191) (not b!807193) (not b!807187) (not b!807196) (not start!69198) (not b!807188) (not b!807192) (not b!807197))
(check-sat)
