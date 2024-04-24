; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69254 () Bool)

(assert start!69254)

(declare-fun b!806660 () Bool)

(declare-fun e!446812 () Bool)

(assert (=> b!806660 (= e!446812 (not true))))

(declare-datatypes ((SeekEntryResult!8536 0))(
  ( (MissingZero!8536 (index!36512 (_ BitVec 32))) (Found!8536 (index!36513 (_ BitVec 32))) (Intermediate!8536 (undefined!9348 Bool) (index!36514 (_ BitVec 32)) (x!67495 (_ BitVec 32))) (Undefined!8536) (MissingVacant!8536 (index!36515 (_ BitVec 32))) )
))
(declare-fun lt!361141 () SeekEntryResult!8536)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806660 (= lt!361141 (Found!8536 index!1236))))

(declare-fun b!806661 () Bool)

(declare-fun res!550433 () Bool)

(declare-fun e!446814 () Bool)

(assert (=> b!806661 (=> (not res!550433) (not e!446814))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43831 0))(
  ( (array!43832 (arr!20989 (Array (_ BitVec 32) (_ BitVec 64))) (size!21409 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43831)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!806661 (= res!550433 (and (= (size!21409 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21409 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21409 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806662 () Bool)

(declare-fun res!550439 () Bool)

(assert (=> b!806662 (=> (not res!550439) (not e!446814))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806662 (= res!550439 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806663 () Bool)

(declare-fun res!550435 () Bool)

(assert (=> b!806663 (=> (not res!550435) (not e!446814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806663 (= res!550435 (validKeyInArray!0 k0!2044))))

(declare-fun b!806664 () Bool)

(declare-fun res!550437 () Bool)

(declare-fun e!446811 () Bool)

(assert (=> b!806664 (=> (not res!550437) (not e!446811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43831 (_ BitVec 32)) Bool)

(assert (=> b!806664 (= res!550437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!550438 () Bool)

(assert (=> start!69254 (=> (not res!550438) (not e!446814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69254 (= res!550438 (validMask!0 mask!3266))))

(assert (=> start!69254 e!446814))

(assert (=> start!69254 true))

(declare-fun array_inv!16848 (array!43831) Bool)

(assert (=> start!69254 (array_inv!16848 a!3170)))

(declare-fun b!806665 () Bool)

(declare-fun e!446813 () Bool)

(assert (=> b!806665 (= e!446813 e!446812)))

(declare-fun res!550436 () Bool)

(assert (=> b!806665 (=> (not res!550436) (not e!446812))))

(declare-fun lt!361139 () SeekEntryResult!8536)

(declare-fun lt!361137 () SeekEntryResult!8536)

(assert (=> b!806665 (= res!550436 (and (= lt!361137 lt!361139) (= lt!361139 (Found!8536 j!153)) (= (select (arr!20989 a!3170) index!1236) (select (arr!20989 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43831 (_ BitVec 32)) SeekEntryResult!8536)

(assert (=> b!806665 (= lt!361139 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20989 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43831 (_ BitVec 32)) SeekEntryResult!8536)

(assert (=> b!806665 (= lt!361137 (seekEntryOrOpen!0 (select (arr!20989 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806666 () Bool)

(assert (=> b!806666 (= e!446814 e!446811)))

(declare-fun res!550442 () Bool)

(assert (=> b!806666 (=> (not res!550442) (not e!446811))))

(declare-fun lt!361138 () SeekEntryResult!8536)

(assert (=> b!806666 (= res!550442 (or (= lt!361138 (MissingZero!8536 i!1163)) (= lt!361138 (MissingVacant!8536 i!1163))))))

(assert (=> b!806666 (= lt!361138 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806667 () Bool)

(declare-fun res!550443 () Bool)

(assert (=> b!806667 (=> (not res!550443) (not e!446811))))

(declare-datatypes ((List!14859 0))(
  ( (Nil!14856) (Cons!14855 (h!15990 (_ BitVec 64)) (t!21166 List!14859)) )
))
(declare-fun arrayNoDuplicates!0 (array!43831 (_ BitVec 32) List!14859) Bool)

(assert (=> b!806667 (= res!550443 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14856))))

(declare-fun b!806668 () Bool)

(assert (=> b!806668 (= e!446811 e!446813)))

(declare-fun res!550441 () Bool)

(assert (=> b!806668 (=> (not res!550441) (not e!446813))))

(declare-fun lt!361136 () SeekEntryResult!8536)

(assert (=> b!806668 (= res!550441 (= lt!361136 lt!361141))))

(declare-fun lt!361140 () array!43831)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361142 () (_ BitVec 64))

(assert (=> b!806668 (= lt!361141 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361142 lt!361140 mask!3266))))

(assert (=> b!806668 (= lt!361136 (seekEntryOrOpen!0 lt!361142 lt!361140 mask!3266))))

(assert (=> b!806668 (= lt!361142 (select (store (arr!20989 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806668 (= lt!361140 (array!43832 (store (arr!20989 a!3170) i!1163 k0!2044) (size!21409 a!3170)))))

(declare-fun b!806669 () Bool)

(declare-fun res!550440 () Bool)

(assert (=> b!806669 (=> (not res!550440) (not e!446814))))

(assert (=> b!806669 (= res!550440 (validKeyInArray!0 (select (arr!20989 a!3170) j!153)))))

(declare-fun b!806670 () Bool)

(declare-fun res!550434 () Bool)

(assert (=> b!806670 (=> (not res!550434) (not e!446811))))

(assert (=> b!806670 (= res!550434 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21409 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20989 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21409 a!3170)) (= (select (arr!20989 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69254 res!550438) b!806661))

(assert (= (and b!806661 res!550433) b!806669))

(assert (= (and b!806669 res!550440) b!806663))

(assert (= (and b!806663 res!550435) b!806662))

(assert (= (and b!806662 res!550439) b!806666))

(assert (= (and b!806666 res!550442) b!806664))

(assert (= (and b!806664 res!550437) b!806667))

(assert (= (and b!806667 res!550443) b!806670))

(assert (= (and b!806670 res!550434) b!806668))

(assert (= (and b!806668 res!550441) b!806665))

(assert (= (and b!806665 res!550436) b!806660))

(declare-fun m!748957 () Bool)

(assert (=> b!806663 m!748957))

(declare-fun m!748959 () Bool)

(assert (=> start!69254 m!748959))

(declare-fun m!748961 () Bool)

(assert (=> start!69254 m!748961))

(declare-fun m!748963 () Bool)

(assert (=> b!806665 m!748963))

(declare-fun m!748965 () Bool)

(assert (=> b!806665 m!748965))

(assert (=> b!806665 m!748965))

(declare-fun m!748967 () Bool)

(assert (=> b!806665 m!748967))

(assert (=> b!806665 m!748965))

(declare-fun m!748969 () Bool)

(assert (=> b!806665 m!748969))

(declare-fun m!748971 () Bool)

(assert (=> b!806662 m!748971))

(assert (=> b!806669 m!748965))

(assert (=> b!806669 m!748965))

(declare-fun m!748973 () Bool)

(assert (=> b!806669 m!748973))

(declare-fun m!748975 () Bool)

(assert (=> b!806670 m!748975))

(declare-fun m!748977 () Bool)

(assert (=> b!806670 m!748977))

(declare-fun m!748979 () Bool)

(assert (=> b!806664 m!748979))

(declare-fun m!748981 () Bool)

(assert (=> b!806666 m!748981))

(declare-fun m!748983 () Bool)

(assert (=> b!806667 m!748983))

(declare-fun m!748985 () Bool)

(assert (=> b!806668 m!748985))

(declare-fun m!748987 () Bool)

(assert (=> b!806668 m!748987))

(declare-fun m!748989 () Bool)

(assert (=> b!806668 m!748989))

(declare-fun m!748991 () Bool)

(assert (=> b!806668 m!748991))

(check-sat (not b!806664) (not b!806665) (not b!806667) (not b!806669) (not b!806662) (not b!806668) (not b!806663) (not start!69254) (not b!806666))
(check-sat)
