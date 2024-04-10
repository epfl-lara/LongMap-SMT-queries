; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68374 () Bool)

(assert start!68374)

(declare-fun b!794482 () Bool)

(declare-fun res!539007 () Bool)

(declare-fun e!441133 () Bool)

(assert (=> b!794482 (=> (not res!539007) (not e!441133))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43164 0))(
  ( (array!43165 (arr!20662 (Array (_ BitVec 32) (_ BitVec 64))) (size!21083 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43164)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794482 (= res!539007 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21083 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20662 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21083 a!3170)) (= (select (arr!20662 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794483 () Bool)

(declare-fun res!539001 () Bool)

(declare-fun e!441134 () Bool)

(assert (=> b!794483 (=> (not res!539001) (not e!441134))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794483 (= res!539001 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794484 () Bool)

(declare-fun res!539004 () Bool)

(assert (=> b!794484 (=> (not res!539004) (not e!441134))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794484 (= res!539004 (and (= (size!21083 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21083 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21083 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794485 () Bool)

(declare-fun res!539008 () Bool)

(assert (=> b!794485 (=> (not res!539008) (not e!441133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43164 (_ BitVec 32)) Bool)

(assert (=> b!794485 (= res!539008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794486 () Bool)

(assert (=> b!794486 (= e!441133 false)))

(declare-fun lt!354162 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8253 0))(
  ( (MissingZero!8253 (index!35380 (_ BitVec 32))) (Found!8253 (index!35381 (_ BitVec 32))) (Intermediate!8253 (undefined!9065 Bool) (index!35382 (_ BitVec 32)) (x!66307 (_ BitVec 32))) (Undefined!8253) (MissingVacant!8253 (index!35383 (_ BitVec 32))) )
))
(declare-fun lt!354160 () SeekEntryResult!8253)

(declare-fun lt!354163 () array!43164)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43164 (_ BitVec 32)) SeekEntryResult!8253)

(assert (=> b!794486 (= lt!354160 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354162 lt!354163 mask!3266))))

(declare-fun lt!354164 () SeekEntryResult!8253)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43164 (_ BitVec 32)) SeekEntryResult!8253)

(assert (=> b!794486 (= lt!354164 (seekEntryOrOpen!0 lt!354162 lt!354163 mask!3266))))

(assert (=> b!794486 (= lt!354162 (select (store (arr!20662 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794486 (= lt!354163 (array!43165 (store (arr!20662 a!3170) i!1163 k0!2044) (size!21083 a!3170)))))

(declare-fun b!794487 () Bool)

(declare-fun res!539002 () Bool)

(assert (=> b!794487 (=> (not res!539002) (not e!441134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794487 (= res!539002 (validKeyInArray!0 (select (arr!20662 a!3170) j!153)))))

(declare-fun b!794488 () Bool)

(declare-fun res!539005 () Bool)

(assert (=> b!794488 (=> (not res!539005) (not e!441134))))

(assert (=> b!794488 (= res!539005 (validKeyInArray!0 k0!2044))))

(declare-fun b!794490 () Bool)

(assert (=> b!794490 (= e!441134 e!441133)))

(declare-fun res!539003 () Bool)

(assert (=> b!794490 (=> (not res!539003) (not e!441133))))

(declare-fun lt!354161 () SeekEntryResult!8253)

(assert (=> b!794490 (= res!539003 (or (= lt!354161 (MissingZero!8253 i!1163)) (= lt!354161 (MissingVacant!8253 i!1163))))))

(assert (=> b!794490 (= lt!354161 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794489 () Bool)

(declare-fun res!539006 () Bool)

(assert (=> b!794489 (=> (not res!539006) (not e!441133))))

(declare-datatypes ((List!14625 0))(
  ( (Nil!14622) (Cons!14621 (h!15750 (_ BitVec 64)) (t!20940 List!14625)) )
))
(declare-fun arrayNoDuplicates!0 (array!43164 (_ BitVec 32) List!14625) Bool)

(assert (=> b!794489 (= res!539006 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14622))))

(declare-fun res!539009 () Bool)

(assert (=> start!68374 (=> (not res!539009) (not e!441134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68374 (= res!539009 (validMask!0 mask!3266))))

(assert (=> start!68374 e!441134))

(assert (=> start!68374 true))

(declare-fun array_inv!16458 (array!43164) Bool)

(assert (=> start!68374 (array_inv!16458 a!3170)))

(assert (= (and start!68374 res!539009) b!794484))

(assert (= (and b!794484 res!539004) b!794487))

(assert (= (and b!794487 res!539002) b!794488))

(assert (= (and b!794488 res!539005) b!794483))

(assert (= (and b!794483 res!539001) b!794490))

(assert (= (and b!794490 res!539003) b!794485))

(assert (= (and b!794485 res!539008) b!794489))

(assert (= (and b!794489 res!539006) b!794482))

(assert (= (and b!794482 res!539007) b!794486))

(declare-fun m!735023 () Bool)

(assert (=> b!794486 m!735023))

(declare-fun m!735025 () Bool)

(assert (=> b!794486 m!735025))

(declare-fun m!735027 () Bool)

(assert (=> b!794486 m!735027))

(declare-fun m!735029 () Bool)

(assert (=> b!794486 m!735029))

(declare-fun m!735031 () Bool)

(assert (=> b!794483 m!735031))

(declare-fun m!735033 () Bool)

(assert (=> b!794489 m!735033))

(declare-fun m!735035 () Bool)

(assert (=> b!794488 m!735035))

(declare-fun m!735037 () Bool)

(assert (=> b!794487 m!735037))

(assert (=> b!794487 m!735037))

(declare-fun m!735039 () Bool)

(assert (=> b!794487 m!735039))

(declare-fun m!735041 () Bool)

(assert (=> start!68374 m!735041))

(declare-fun m!735043 () Bool)

(assert (=> start!68374 m!735043))

(declare-fun m!735045 () Bool)

(assert (=> b!794485 m!735045))

(declare-fun m!735047 () Bool)

(assert (=> b!794490 m!735047))

(declare-fun m!735049 () Bool)

(assert (=> b!794482 m!735049))

(declare-fun m!735051 () Bool)

(assert (=> b!794482 m!735051))

(check-sat (not b!794487) (not b!794483) (not b!794488) (not b!794490) (not b!794485) (not b!794489) (not start!68374) (not b!794486))
(check-sat)
