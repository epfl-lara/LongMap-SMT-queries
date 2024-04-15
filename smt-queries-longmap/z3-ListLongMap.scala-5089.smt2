; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69072 () Bool)

(assert start!69072)

(declare-fun b!805621 () Bool)

(declare-fun e!446130 () Bool)

(declare-fun e!446131 () Bool)

(assert (=> b!805621 (= e!446130 e!446131)))

(declare-fun res!550088 () Bool)

(assert (=> b!805621 (=> (not res!550088) (not e!446131))))

(declare-datatypes ((SeekEntryResult!8584 0))(
  ( (MissingZero!8584 (index!36704 (_ BitVec 32))) (Found!8584 (index!36705 (_ BitVec 32))) (Intermediate!8584 (undefined!9396 Bool) (index!36706 (_ BitVec 32)) (x!67532 (_ BitVec 32))) (Undefined!8584) (MissingVacant!8584 (index!36707 (_ BitVec 32))) )
))
(declare-fun lt!360604 () SeekEntryResult!8584)

(declare-datatypes ((array!43834 0))(
  ( (array!43835 (arr!20996 (Array (_ BitVec 32) (_ BitVec 64))) (size!21417 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43834)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!360603 () SeekEntryResult!8584)

(assert (=> b!805621 (= res!550088 (and (= lt!360603 lt!360604) (= lt!360604 (Found!8584 j!153)) (= (select (arr!20996 a!3170) index!1236) (select (arr!20996 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43834 (_ BitVec 32)) SeekEntryResult!8584)

(assert (=> b!805621 (= lt!360604 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20996 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43834 (_ BitVec 32)) SeekEntryResult!8584)

(assert (=> b!805621 (= lt!360603 (seekEntryOrOpen!0 (select (arr!20996 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805622 () Bool)

(declare-fun res!550089 () Bool)

(declare-fun e!446134 () Bool)

(assert (=> b!805622 (=> (not res!550089) (not e!446134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43834 (_ BitVec 32)) Bool)

(assert (=> b!805622 (= res!550089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805623 () Bool)

(declare-fun res!550084 () Bool)

(declare-fun e!446133 () Bool)

(assert (=> b!805623 (=> (not res!550084) (not e!446133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805623 (= res!550084 (validKeyInArray!0 (select (arr!20996 a!3170) j!153)))))

(declare-fun b!805624 () Bool)

(declare-fun res!550082 () Bool)

(assert (=> b!805624 (=> (not res!550082) (not e!446134))))

(declare-datatypes ((List!14998 0))(
  ( (Nil!14995) (Cons!14994 (h!16123 (_ BitVec 64)) (t!21304 List!14998)) )
))
(declare-fun arrayNoDuplicates!0 (array!43834 (_ BitVec 32) List!14998) Bool)

(assert (=> b!805624 (= res!550082 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14995))))

(declare-fun b!805625 () Bool)

(declare-fun res!550087 () Bool)

(assert (=> b!805625 (=> (not res!550087) (not e!446133))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805625 (= res!550087 (and (= (size!21417 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21417 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21417 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805626 () Bool)

(assert (=> b!805626 (= e!446134 e!446130)))

(declare-fun res!550090 () Bool)

(assert (=> b!805626 (=> (not res!550090) (not e!446130))))

(declare-fun lt!360605 () SeekEntryResult!8584)

(declare-fun lt!360608 () SeekEntryResult!8584)

(assert (=> b!805626 (= res!550090 (= lt!360605 lt!360608))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360607 () array!43834)

(declare-fun lt!360606 () (_ BitVec 64))

(assert (=> b!805626 (= lt!360608 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360606 lt!360607 mask!3266))))

(assert (=> b!805626 (= lt!360605 (seekEntryOrOpen!0 lt!360606 lt!360607 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805626 (= lt!360606 (select (store (arr!20996 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805626 (= lt!360607 (array!43835 (store (arr!20996 a!3170) i!1163 k0!2044) (size!21417 a!3170)))))

(declare-fun b!805627 () Bool)

(declare-fun res!550086 () Bool)

(assert (=> b!805627 (=> (not res!550086) (not e!446133))))

(assert (=> b!805627 (= res!550086 (validKeyInArray!0 k0!2044))))

(declare-fun b!805628 () Bool)

(declare-fun res!550092 () Bool)

(assert (=> b!805628 (=> (not res!550092) (not e!446133))))

(declare-fun arrayContainsKey!0 (array!43834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805628 (= res!550092 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!550083 () Bool)

(assert (=> start!69072 (=> (not res!550083) (not e!446133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69072 (= res!550083 (validMask!0 mask!3266))))

(assert (=> start!69072 e!446133))

(assert (=> start!69072 true))

(declare-fun array_inv!16879 (array!43834) Bool)

(assert (=> start!69072 (array_inv!16879 a!3170)))

(declare-fun b!805629 () Bool)

(declare-fun res!550085 () Bool)

(assert (=> b!805629 (=> (not res!550085) (not e!446134))))

(assert (=> b!805629 (= res!550085 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21417 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20996 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21417 a!3170)) (= (select (arr!20996 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805630 () Bool)

(assert (=> b!805630 (= e!446131 (not true))))

(assert (=> b!805630 (= lt!360608 (Found!8584 index!1236))))

(declare-fun b!805631 () Bool)

(assert (=> b!805631 (= e!446133 e!446134)))

(declare-fun res!550091 () Bool)

(assert (=> b!805631 (=> (not res!550091) (not e!446134))))

(declare-fun lt!360602 () SeekEntryResult!8584)

(assert (=> b!805631 (= res!550091 (or (= lt!360602 (MissingZero!8584 i!1163)) (= lt!360602 (MissingVacant!8584 i!1163))))))

(assert (=> b!805631 (= lt!360602 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69072 res!550083) b!805625))

(assert (= (and b!805625 res!550087) b!805623))

(assert (= (and b!805623 res!550084) b!805627))

(assert (= (and b!805627 res!550086) b!805628))

(assert (= (and b!805628 res!550092) b!805631))

(assert (= (and b!805631 res!550091) b!805622))

(assert (= (and b!805622 res!550089) b!805624))

(assert (= (and b!805624 res!550082) b!805629))

(assert (= (and b!805629 res!550085) b!805626))

(assert (= (and b!805626 res!550090) b!805621))

(assert (= (and b!805621 res!550088) b!805630))

(declare-fun m!747067 () Bool)

(assert (=> b!805623 m!747067))

(assert (=> b!805623 m!747067))

(declare-fun m!747069 () Bool)

(assert (=> b!805623 m!747069))

(declare-fun m!747071 () Bool)

(assert (=> b!805621 m!747071))

(assert (=> b!805621 m!747067))

(assert (=> b!805621 m!747067))

(declare-fun m!747073 () Bool)

(assert (=> b!805621 m!747073))

(assert (=> b!805621 m!747067))

(declare-fun m!747075 () Bool)

(assert (=> b!805621 m!747075))

(declare-fun m!747077 () Bool)

(assert (=> start!69072 m!747077))

(declare-fun m!747079 () Bool)

(assert (=> start!69072 m!747079))

(declare-fun m!747081 () Bool)

(assert (=> b!805629 m!747081))

(declare-fun m!747083 () Bool)

(assert (=> b!805629 m!747083))

(declare-fun m!747085 () Bool)

(assert (=> b!805631 m!747085))

(declare-fun m!747087 () Bool)

(assert (=> b!805626 m!747087))

(declare-fun m!747089 () Bool)

(assert (=> b!805626 m!747089))

(declare-fun m!747091 () Bool)

(assert (=> b!805626 m!747091))

(declare-fun m!747093 () Bool)

(assert (=> b!805626 m!747093))

(declare-fun m!747095 () Bool)

(assert (=> b!805624 m!747095))

(declare-fun m!747097 () Bool)

(assert (=> b!805628 m!747097))

(declare-fun m!747099 () Bool)

(assert (=> b!805627 m!747099))

(declare-fun m!747101 () Bool)

(assert (=> b!805622 m!747101))

(check-sat (not start!69072) (not b!805624) (not b!805627) (not b!805621) (not b!805631) (not b!805628) (not b!805626) (not b!805622) (not b!805623))
(check-sat)
