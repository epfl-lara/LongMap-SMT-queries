; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68876 () Bool)

(assert start!68876)

(declare-fun b!801021 () Bool)

(declare-fun e!444221 () Bool)

(declare-fun e!444226 () Bool)

(assert (=> b!801021 (= e!444221 e!444226)))

(declare-fun res!545004 () Bool)

(assert (=> b!801021 (=> (not res!545004) (not e!444226))))

(declare-datatypes ((array!43498 0))(
  ( (array!43499 (arr!20824 (Array (_ BitVec 32) (_ BitVec 64))) (size!21244 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43498)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8371 0))(
  ( (MissingZero!8371 (index!35852 (_ BitVec 32))) (Found!8371 (index!35853 (_ BitVec 32))) (Intermediate!8371 (undefined!9183 Bool) (index!35854 (_ BitVec 32)) (x!66887 (_ BitVec 32))) (Undefined!8371) (MissingVacant!8371 (index!35855 (_ BitVec 32))) )
))
(declare-fun lt!357778 () SeekEntryResult!8371)

(declare-fun lt!357782 () SeekEntryResult!8371)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801021 (= res!545004 (and (= lt!357778 lt!357782) (= lt!357782 (Found!8371 j!153)) (not (= (select (arr!20824 a!3170) index!1236) (select (arr!20824 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43498 (_ BitVec 32)) SeekEntryResult!8371)

(assert (=> b!801021 (= lt!357782 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43498 (_ BitVec 32)) SeekEntryResult!8371)

(assert (=> b!801021 (= lt!357778 (seekEntryOrOpen!0 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801022 () Bool)

(declare-fun res!544998 () Bool)

(declare-fun e!444222 () Bool)

(assert (=> b!801022 (=> (not res!544998) (not e!444222))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801022 (= res!544998 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!545001 () Bool)

(assert (=> start!68876 (=> (not res!545001) (not e!444222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68876 (= res!545001 (validMask!0 mask!3266))))

(assert (=> start!68876 e!444222))

(assert (=> start!68876 true))

(declare-fun array_inv!16683 (array!43498) Bool)

(assert (=> start!68876 (array_inv!16683 a!3170)))

(declare-fun b!801023 () Bool)

(declare-fun res!544996 () Bool)

(declare-fun e!444225 () Bool)

(assert (=> b!801023 (=> (not res!544996) (not e!444225))))

(declare-datatypes ((List!14694 0))(
  ( (Nil!14691) (Cons!14690 (h!15825 (_ BitVec 64)) (t!21001 List!14694)) )
))
(declare-fun arrayNoDuplicates!0 (array!43498 (_ BitVec 32) List!14694) Bool)

(assert (=> b!801023 (= res!544996 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14691))))

(declare-fun b!801024 () Bool)

(declare-fun res!544993 () Bool)

(assert (=> b!801024 (=> (not res!544993) (not e!444222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801024 (= res!544993 (validKeyInArray!0 (select (arr!20824 a!3170) j!153)))))

(declare-fun b!801025 () Bool)

(assert (=> b!801025 (= e!444222 e!444225)))

(declare-fun res!544999 () Bool)

(assert (=> b!801025 (=> (not res!544999) (not e!444225))))

(declare-fun lt!357777 () SeekEntryResult!8371)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801025 (= res!544999 (or (= lt!357777 (MissingZero!8371 i!1163)) (= lt!357777 (MissingVacant!8371 i!1163))))))

(assert (=> b!801025 (= lt!357777 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801026 () Bool)

(declare-fun res!544994 () Bool)

(assert (=> b!801026 (=> (not res!544994) (not e!444225))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!801026 (= res!544994 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21244 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20824 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21244 a!3170)) (= (select (arr!20824 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801027 () Bool)

(declare-fun res!544997 () Bool)

(declare-fun e!444224 () Bool)

(assert (=> b!801027 (=> (not res!544997) (not e!444224))))

(declare-fun lt!357775 () array!43498)

(declare-fun lt!357776 () (_ BitVec 32))

(declare-fun lt!357780 () (_ BitVec 64))

(declare-fun lt!357781 () SeekEntryResult!8371)

(assert (=> b!801027 (= res!544997 (= lt!357781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357776 vacantAfter!23 lt!357780 lt!357775 mask!3266)))))

(declare-fun b!801028 () Bool)

(assert (=> b!801028 (= e!444226 e!444224)))

(declare-fun res!544992 () Bool)

(assert (=> b!801028 (=> (not res!544992) (not e!444224))))

(assert (=> b!801028 (= res!544992 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357776 #b00000000000000000000000000000000) (bvslt lt!357776 (size!21244 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801028 (= lt!357776 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801029 () Bool)

(assert (=> b!801029 (= e!444224 false)))

(declare-fun lt!357779 () SeekEntryResult!8371)

(assert (=> b!801029 (= lt!357779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357776 vacantBefore!23 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801030 () Bool)

(declare-fun res!544995 () Bool)

(assert (=> b!801030 (=> (not res!544995) (not e!444225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43498 (_ BitVec 32)) Bool)

(assert (=> b!801030 (= res!544995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801031 () Bool)

(assert (=> b!801031 (= e!444225 e!444221)))

(declare-fun res!545002 () Bool)

(assert (=> b!801031 (=> (not res!545002) (not e!444221))))

(assert (=> b!801031 (= res!545002 (= lt!357781 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357780 lt!357775 mask!3266)))))

(assert (=> b!801031 (= lt!357781 (seekEntryOrOpen!0 lt!357780 lt!357775 mask!3266))))

(assert (=> b!801031 (= lt!357780 (select (store (arr!20824 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801031 (= lt!357775 (array!43499 (store (arr!20824 a!3170) i!1163 k0!2044) (size!21244 a!3170)))))

(declare-fun b!801032 () Bool)

(declare-fun res!545003 () Bool)

(assert (=> b!801032 (=> (not res!545003) (not e!444222))))

(assert (=> b!801032 (= res!545003 (validKeyInArray!0 k0!2044))))

(declare-fun b!801033 () Bool)

(declare-fun res!545000 () Bool)

(assert (=> b!801033 (=> (not res!545000) (not e!444222))))

(assert (=> b!801033 (= res!545000 (and (= (size!21244 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21244 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21244 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68876 res!545001) b!801033))

(assert (= (and b!801033 res!545000) b!801024))

(assert (= (and b!801024 res!544993) b!801032))

(assert (= (and b!801032 res!545003) b!801022))

(assert (= (and b!801022 res!544998) b!801025))

(assert (= (and b!801025 res!544999) b!801030))

(assert (= (and b!801030 res!544995) b!801023))

(assert (= (and b!801023 res!544996) b!801026))

(assert (= (and b!801026 res!544994) b!801031))

(assert (= (and b!801031 res!545002) b!801021))

(assert (= (and b!801021 res!545004) b!801028))

(assert (= (and b!801028 res!544992) b!801027))

(assert (= (and b!801027 res!544997) b!801029))

(declare-fun m!742453 () Bool)

(assert (=> b!801021 m!742453))

(declare-fun m!742455 () Bool)

(assert (=> b!801021 m!742455))

(assert (=> b!801021 m!742455))

(declare-fun m!742457 () Bool)

(assert (=> b!801021 m!742457))

(assert (=> b!801021 m!742455))

(declare-fun m!742459 () Bool)

(assert (=> b!801021 m!742459))

(assert (=> b!801029 m!742455))

(assert (=> b!801029 m!742455))

(declare-fun m!742461 () Bool)

(assert (=> b!801029 m!742461))

(declare-fun m!742463 () Bool)

(assert (=> start!68876 m!742463))

(declare-fun m!742465 () Bool)

(assert (=> start!68876 m!742465))

(declare-fun m!742467 () Bool)

(assert (=> b!801022 m!742467))

(declare-fun m!742469 () Bool)

(assert (=> b!801025 m!742469))

(declare-fun m!742471 () Bool)

(assert (=> b!801031 m!742471))

(declare-fun m!742473 () Bool)

(assert (=> b!801031 m!742473))

(declare-fun m!742475 () Bool)

(assert (=> b!801031 m!742475))

(declare-fun m!742477 () Bool)

(assert (=> b!801031 m!742477))

(assert (=> b!801024 m!742455))

(assert (=> b!801024 m!742455))

(declare-fun m!742479 () Bool)

(assert (=> b!801024 m!742479))

(declare-fun m!742481 () Bool)

(assert (=> b!801026 m!742481))

(declare-fun m!742483 () Bool)

(assert (=> b!801026 m!742483))

(declare-fun m!742485 () Bool)

(assert (=> b!801023 m!742485))

(declare-fun m!742487 () Bool)

(assert (=> b!801030 m!742487))

(declare-fun m!742489 () Bool)

(assert (=> b!801028 m!742489))

(declare-fun m!742491 () Bool)

(assert (=> b!801032 m!742491))

(declare-fun m!742493 () Bool)

(assert (=> b!801027 m!742493))

(check-sat (not b!801022) (not start!68876) (not b!801032) (not b!801027) (not b!801025) (not b!801021) (not b!801023) (not b!801031) (not b!801028) (not b!801029) (not b!801030) (not b!801024))
(check-sat)
