; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69186 () Bool)

(assert start!69186)

(declare-fun b!806989 () Bool)

(declare-fun res!551252 () Bool)

(declare-fun e!446807 () Bool)

(assert (=> b!806989 (=> (not res!551252) (not e!446807))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43903 0))(
  ( (array!43904 (arr!21029 (Array (_ BitVec 32) (_ BitVec 64))) (size!21450 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43903)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806989 (= res!551252 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21450 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21029 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21450 a!3170)) (= (select (arr!21029 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806990 () Bool)

(declare-fun res!551262 () Bool)

(assert (=> b!806990 (=> (not res!551262) (not e!446807))))

(declare-datatypes ((List!15031 0))(
  ( (Nil!15028) (Cons!15027 (h!16156 (_ BitVec 64)) (t!21337 List!15031)) )
))
(declare-fun arrayNoDuplicates!0 (array!43903 (_ BitVec 32) List!15031) Bool)

(assert (=> b!806990 (= res!551262 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15028))))

(declare-fun b!806991 () Bool)

(declare-fun res!551255 () Bool)

(assert (=> b!806991 (=> (not res!551255) (not e!446807))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43903 (_ BitVec 32)) Bool)

(assert (=> b!806991 (= res!551255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806992 () Bool)

(declare-fun e!446809 () Bool)

(declare-fun e!446808 () Bool)

(assert (=> b!806992 (= e!446809 e!446808)))

(declare-fun res!551254 () Bool)

(assert (=> b!806992 (=> (not res!551254) (not e!446808))))

(declare-datatypes ((SeekEntryResult!8617 0))(
  ( (MissingZero!8617 (index!36836 (_ BitVec 32))) (Found!8617 (index!36837 (_ BitVec 32))) (Intermediate!8617 (undefined!9429 Bool) (index!36838 (_ BitVec 32)) (x!67656 (_ BitVec 32))) (Undefined!8617) (MissingVacant!8617 (index!36839 (_ BitVec 32))) )
))
(declare-fun lt!361383 () SeekEntryResult!8617)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361381 () SeekEntryResult!8617)

(assert (=> b!806992 (= res!551254 (and (= lt!361381 lt!361383) (= lt!361383 (Found!8617 j!153)) (not (= (select (arr!21029 a!3170) index!1236) (select (arr!21029 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43903 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!806992 (= lt!361383 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21029 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43903 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!806992 (= lt!361381 (seekEntryOrOpen!0 (select (arr!21029 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806993 () Bool)

(declare-fun res!551256 () Bool)

(declare-fun e!446806 () Bool)

(assert (=> b!806993 (=> (not res!551256) (not e!446806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806993 (= res!551256 (validKeyInArray!0 (select (arr!21029 a!3170) j!153)))))

(declare-fun res!551258 () Bool)

(assert (=> start!69186 (=> (not res!551258) (not e!446806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69186 (= res!551258 (validMask!0 mask!3266))))

(assert (=> start!69186 e!446806))

(assert (=> start!69186 true))

(declare-fun array_inv!16912 (array!43903) Bool)

(assert (=> start!69186 (array_inv!16912 a!3170)))

(declare-fun b!806994 () Bool)

(declare-fun res!551261 () Bool)

(assert (=> b!806994 (=> (not res!551261) (not e!446806))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806994 (= res!551261 (validKeyInArray!0 k0!2044))))

(declare-fun b!806995 () Bool)

(assert (=> b!806995 (= e!446806 e!446807)))

(declare-fun res!551259 () Bool)

(assert (=> b!806995 (=> (not res!551259) (not e!446807))))

(declare-fun lt!361384 () SeekEntryResult!8617)

(assert (=> b!806995 (= res!551259 (or (= lt!361384 (MissingZero!8617 i!1163)) (= lt!361384 (MissingVacant!8617 i!1163))))))

(assert (=> b!806995 (= lt!361384 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806996 () Bool)

(declare-fun res!551253 () Bool)

(assert (=> b!806996 (=> (not res!551253) (not e!446806))))

(declare-fun arrayContainsKey!0 (array!43903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806996 (= res!551253 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806997 () Bool)

(declare-fun res!551257 () Bool)

(assert (=> b!806997 (=> (not res!551257) (not e!446806))))

(assert (=> b!806997 (= res!551257 (and (= (size!21450 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21450 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21450 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806998 () Bool)

(assert (=> b!806998 (= e!446807 e!446809)))

(declare-fun res!551260 () Bool)

(assert (=> b!806998 (=> (not res!551260) (not e!446809))))

(declare-fun lt!361382 () (_ BitVec 64))

(declare-fun lt!361380 () array!43903)

(assert (=> b!806998 (= res!551260 (= (seekEntryOrOpen!0 lt!361382 lt!361380 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361382 lt!361380 mask!3266)))))

(assert (=> b!806998 (= lt!361382 (select (store (arr!21029 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806998 (= lt!361380 (array!43904 (store (arr!21029 a!3170) i!1163 k0!2044) (size!21450 a!3170)))))

(declare-fun b!806999 () Bool)

(assert (=> b!806999 (= e!446808 false)))

(declare-fun lt!361385 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806999 (= lt!361385 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69186 res!551258) b!806997))

(assert (= (and b!806997 res!551257) b!806993))

(assert (= (and b!806993 res!551256) b!806994))

(assert (= (and b!806994 res!551261) b!806996))

(assert (= (and b!806996 res!551253) b!806995))

(assert (= (and b!806995 res!551259) b!806991))

(assert (= (and b!806991 res!551255) b!806990))

(assert (= (and b!806990 res!551262) b!806989))

(assert (= (and b!806989 res!551252) b!806998))

(assert (= (and b!806998 res!551260) b!806992))

(assert (= (and b!806992 res!551254) b!806999))

(declare-fun m!748501 () Bool)

(assert (=> b!806994 m!748501))

(declare-fun m!748503 () Bool)

(assert (=> b!806990 m!748503))

(declare-fun m!748505 () Bool)

(assert (=> b!806999 m!748505))

(declare-fun m!748507 () Bool)

(assert (=> b!806992 m!748507))

(declare-fun m!748509 () Bool)

(assert (=> b!806992 m!748509))

(assert (=> b!806992 m!748509))

(declare-fun m!748511 () Bool)

(assert (=> b!806992 m!748511))

(assert (=> b!806992 m!748509))

(declare-fun m!748513 () Bool)

(assert (=> b!806992 m!748513))

(declare-fun m!748515 () Bool)

(assert (=> b!806991 m!748515))

(declare-fun m!748517 () Bool)

(assert (=> b!806989 m!748517))

(declare-fun m!748519 () Bool)

(assert (=> b!806989 m!748519))

(declare-fun m!748521 () Bool)

(assert (=> b!806996 m!748521))

(declare-fun m!748523 () Bool)

(assert (=> start!69186 m!748523))

(declare-fun m!748525 () Bool)

(assert (=> start!69186 m!748525))

(declare-fun m!748527 () Bool)

(assert (=> b!806998 m!748527))

(declare-fun m!748529 () Bool)

(assert (=> b!806998 m!748529))

(declare-fun m!748531 () Bool)

(assert (=> b!806998 m!748531))

(declare-fun m!748533 () Bool)

(assert (=> b!806998 m!748533))

(assert (=> b!806993 m!748509))

(assert (=> b!806993 m!748509))

(declare-fun m!748535 () Bool)

(assert (=> b!806993 m!748535))

(declare-fun m!748537 () Bool)

(assert (=> b!806995 m!748537))

(check-sat (not b!806992) (not b!806999) (not start!69186) (not b!806994) (not b!806998) (not b!806990) (not b!806996) (not b!806991) (not b!806993) (not b!806995))
(check-sat)
