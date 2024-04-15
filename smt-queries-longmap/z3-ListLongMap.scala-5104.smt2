; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69210 () Bool)

(assert start!69210)

(declare-fun b!807385 () Bool)

(declare-fun res!551648 () Bool)

(declare-fun e!446989 () Bool)

(assert (=> b!807385 (=> (not res!551648) (not e!446989))))

(declare-datatypes ((array!43927 0))(
  ( (array!43928 (arr!21041 (Array (_ BitVec 32) (_ BitVec 64))) (size!21462 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43927)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807385 (= res!551648 (validKeyInArray!0 (select (arr!21041 a!3170) j!153)))))

(declare-fun b!807386 () Bool)

(declare-fun e!446985 () Bool)

(declare-fun e!446987 () Bool)

(assert (=> b!807386 (= e!446985 e!446987)))

(declare-fun res!551655 () Bool)

(assert (=> b!807386 (=> (not res!551655) (not e!446987))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361596 () array!43927)

(declare-fun lt!361600 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8629 0))(
  ( (MissingZero!8629 (index!36884 (_ BitVec 32))) (Found!8629 (index!36885 (_ BitVec 32))) (Intermediate!8629 (undefined!9441 Bool) (index!36886 (_ BitVec 32)) (x!67700 (_ BitVec 32))) (Undefined!8629) (MissingVacant!8629 (index!36887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43927 (_ BitVec 32)) SeekEntryResult!8629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43927 (_ BitVec 32)) SeekEntryResult!8629)

(assert (=> b!807386 (= res!551655 (= (seekEntryOrOpen!0 lt!361600 lt!361596 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361600 lt!361596 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807386 (= lt!361600 (select (store (arr!21041 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807386 (= lt!361596 (array!43928 (store (arr!21041 a!3170) i!1163 k0!2044) (size!21462 a!3170)))))

(declare-fun b!807387 () Bool)

(assert (=> b!807387 (= e!446989 e!446985)))

(declare-fun res!551651 () Bool)

(assert (=> b!807387 (=> (not res!551651) (not e!446985))))

(declare-fun lt!361601 () SeekEntryResult!8629)

(assert (=> b!807387 (= res!551651 (or (= lt!361601 (MissingZero!8629 i!1163)) (= lt!361601 (MissingVacant!8629 i!1163))))))

(assert (=> b!807387 (= lt!361601 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807388 () Bool)

(declare-fun res!551657 () Bool)

(assert (=> b!807388 (=> (not res!551657) (not e!446985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43927 (_ BitVec 32)) Bool)

(assert (=> b!807388 (= res!551657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807389 () Bool)

(declare-fun e!446988 () Bool)

(assert (=> b!807389 (= e!446987 e!446988)))

(declare-fun res!551658 () Bool)

(assert (=> b!807389 (=> (not res!551658) (not e!446988))))

(declare-fun lt!361597 () SeekEntryResult!8629)

(declare-fun lt!361599 () SeekEntryResult!8629)

(assert (=> b!807389 (= res!551658 (and (= lt!361597 lt!361599) (= lt!361599 (Found!8629 j!153)) (not (= (select (arr!21041 a!3170) index!1236) (select (arr!21041 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807389 (= lt!361599 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21041 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807389 (= lt!361597 (seekEntryOrOpen!0 (select (arr!21041 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807390 () Bool)

(declare-fun res!551653 () Bool)

(assert (=> b!807390 (=> (not res!551653) (not e!446985))))

(assert (=> b!807390 (= res!551653 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21462 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21041 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21462 a!3170)) (= (select (arr!21041 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807391 () Bool)

(declare-fun res!551650 () Bool)

(assert (=> b!807391 (=> (not res!551650) (not e!446989))))

(assert (=> b!807391 (= res!551650 (validKeyInArray!0 k0!2044))))

(declare-fun b!807392 () Bool)

(declare-fun res!551652 () Bool)

(assert (=> b!807392 (=> (not res!551652) (not e!446985))))

(declare-datatypes ((List!15043 0))(
  ( (Nil!15040) (Cons!15039 (h!16168 (_ BitVec 64)) (t!21349 List!15043)) )
))
(declare-fun arrayNoDuplicates!0 (array!43927 (_ BitVec 32) List!15043) Bool)

(assert (=> b!807392 (= res!551652 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15040))))

(declare-fun b!807393 () Bool)

(declare-fun res!551654 () Bool)

(assert (=> b!807393 (=> (not res!551654) (not e!446989))))

(declare-fun arrayContainsKey!0 (array!43927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807393 (= res!551654 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551656 () Bool)

(assert (=> start!69210 (=> (not res!551656) (not e!446989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69210 (= res!551656 (validMask!0 mask!3266))))

(assert (=> start!69210 e!446989))

(assert (=> start!69210 true))

(declare-fun array_inv!16924 (array!43927) Bool)

(assert (=> start!69210 (array_inv!16924 a!3170)))

(declare-fun b!807394 () Bool)

(assert (=> b!807394 (= e!446988 false)))

(declare-fun lt!361598 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807394 (= lt!361598 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807395 () Bool)

(declare-fun res!551649 () Bool)

(assert (=> b!807395 (=> (not res!551649) (not e!446989))))

(assert (=> b!807395 (= res!551649 (and (= (size!21462 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21462 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21462 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69210 res!551656) b!807395))

(assert (= (and b!807395 res!551649) b!807385))

(assert (= (and b!807385 res!551648) b!807391))

(assert (= (and b!807391 res!551650) b!807393))

(assert (= (and b!807393 res!551654) b!807387))

(assert (= (and b!807387 res!551651) b!807388))

(assert (= (and b!807388 res!551657) b!807392))

(assert (= (and b!807392 res!551652) b!807390))

(assert (= (and b!807390 res!551653) b!807386))

(assert (= (and b!807386 res!551655) b!807389))

(assert (= (and b!807389 res!551658) b!807394))

(declare-fun m!748957 () Bool)

(assert (=> start!69210 m!748957))

(declare-fun m!748959 () Bool)

(assert (=> start!69210 m!748959))

(declare-fun m!748961 () Bool)

(assert (=> b!807394 m!748961))

(declare-fun m!748963 () Bool)

(assert (=> b!807386 m!748963))

(declare-fun m!748965 () Bool)

(assert (=> b!807386 m!748965))

(declare-fun m!748967 () Bool)

(assert (=> b!807386 m!748967))

(declare-fun m!748969 () Bool)

(assert (=> b!807386 m!748969))

(declare-fun m!748971 () Bool)

(assert (=> b!807388 m!748971))

(declare-fun m!748973 () Bool)

(assert (=> b!807390 m!748973))

(declare-fun m!748975 () Bool)

(assert (=> b!807390 m!748975))

(declare-fun m!748977 () Bool)

(assert (=> b!807391 m!748977))

(declare-fun m!748979 () Bool)

(assert (=> b!807387 m!748979))

(declare-fun m!748981 () Bool)

(assert (=> b!807385 m!748981))

(assert (=> b!807385 m!748981))

(declare-fun m!748983 () Bool)

(assert (=> b!807385 m!748983))

(declare-fun m!748985 () Bool)

(assert (=> b!807389 m!748985))

(assert (=> b!807389 m!748981))

(assert (=> b!807389 m!748981))

(declare-fun m!748987 () Bool)

(assert (=> b!807389 m!748987))

(assert (=> b!807389 m!748981))

(declare-fun m!748989 () Bool)

(assert (=> b!807389 m!748989))

(declare-fun m!748991 () Bool)

(assert (=> b!807393 m!748991))

(declare-fun m!748993 () Bool)

(assert (=> b!807392 m!748993))

(check-sat (not b!807392) (not b!807385) (not b!807393) (not b!807389) (not b!807386) (not b!807391) (not b!807387) (not start!69210) (not b!807394) (not b!807388))
(check-sat)
