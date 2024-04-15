; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68964 () Bool)

(assert start!68964)

(declare-fun b!804456 () Bool)

(declare-fun res!549119 () Bool)

(declare-fun e!445606 () Bool)

(assert (=> b!804456 (=> (not res!549119) (not e!445606))))

(declare-datatypes ((array!43771 0))(
  ( (array!43772 (arr!20966 (Array (_ BitVec 32) (_ BitVec 64))) (size!21387 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43771)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804456 (= res!549119 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804457 () Bool)

(declare-fun res!549116 () Bool)

(assert (=> b!804457 (=> (not res!549116) (not e!445606))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804457 (= res!549116 (and (= (size!21387 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21387 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21387 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804458 () Bool)

(declare-fun e!445605 () Bool)

(assert (=> b!804458 (= e!445606 e!445605)))

(declare-fun res!549115 () Bool)

(assert (=> b!804458 (=> (not res!549115) (not e!445605))))

(declare-datatypes ((SeekEntryResult!8554 0))(
  ( (MissingZero!8554 (index!36584 (_ BitVec 32))) (Found!8554 (index!36585 (_ BitVec 32))) (Intermediate!8554 (undefined!9366 Bool) (index!36586 (_ BitVec 32)) (x!67419 (_ BitVec 32))) (Undefined!8554) (MissingVacant!8554 (index!36587 (_ BitVec 32))) )
))
(declare-fun lt!360018 () SeekEntryResult!8554)

(assert (=> b!804458 (= res!549115 (or (= lt!360018 (MissingZero!8554 i!1163)) (= lt!360018 (MissingVacant!8554 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43771 (_ BitVec 32)) SeekEntryResult!8554)

(assert (=> b!804458 (= lt!360018 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804459 () Bool)

(declare-fun res!549122 () Bool)

(assert (=> b!804459 (=> (not res!549122) (not e!445605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43771 (_ BitVec 32)) Bool)

(assert (=> b!804459 (= res!549122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804460 () Bool)

(declare-fun res!549117 () Bool)

(assert (=> b!804460 (=> (not res!549117) (not e!445606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804460 (= res!549117 (validKeyInArray!0 (select (arr!20966 a!3170) j!153)))))

(declare-fun b!804461 () Bool)

(assert (=> b!804461 (= e!445605 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360020 () array!43771)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360016 () (_ BitVec 64))

(declare-fun lt!360019 () SeekEntryResult!8554)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43771 (_ BitVec 32)) SeekEntryResult!8554)

(assert (=> b!804461 (= lt!360019 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360016 lt!360020 mask!3266))))

(declare-fun lt!360017 () SeekEntryResult!8554)

(assert (=> b!804461 (= lt!360017 (seekEntryOrOpen!0 lt!360016 lt!360020 mask!3266))))

(assert (=> b!804461 (= lt!360016 (select (store (arr!20966 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804461 (= lt!360020 (array!43772 (store (arr!20966 a!3170) i!1163 k0!2044) (size!21387 a!3170)))))

(declare-fun b!804462 () Bool)

(declare-fun res!549118 () Bool)

(assert (=> b!804462 (=> (not res!549118) (not e!445605))))

(declare-datatypes ((List!14968 0))(
  ( (Nil!14965) (Cons!14964 (h!16093 (_ BitVec 64)) (t!21274 List!14968)) )
))
(declare-fun arrayNoDuplicates!0 (array!43771 (_ BitVec 32) List!14968) Bool)

(assert (=> b!804462 (= res!549118 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14965))))

(declare-fun b!804463 () Bool)

(declare-fun res!549123 () Bool)

(assert (=> b!804463 (=> (not res!549123) (not e!445605))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804463 (= res!549123 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21387 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20966 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21387 a!3170)) (= (select (arr!20966 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549121 () Bool)

(assert (=> start!68964 (=> (not res!549121) (not e!445606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68964 (= res!549121 (validMask!0 mask!3266))))

(assert (=> start!68964 e!445606))

(assert (=> start!68964 true))

(declare-fun array_inv!16849 (array!43771) Bool)

(assert (=> start!68964 (array_inv!16849 a!3170)))

(declare-fun b!804464 () Bool)

(declare-fun res!549120 () Bool)

(assert (=> b!804464 (=> (not res!549120) (not e!445606))))

(assert (=> b!804464 (= res!549120 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68964 res!549121) b!804457))

(assert (= (and b!804457 res!549116) b!804460))

(assert (= (and b!804460 res!549117) b!804464))

(assert (= (and b!804464 res!549120) b!804456))

(assert (= (and b!804456 res!549119) b!804458))

(assert (= (and b!804458 res!549115) b!804459))

(assert (= (and b!804459 res!549122) b!804462))

(assert (= (and b!804462 res!549118) b!804463))

(assert (= (and b!804463 res!549123) b!804461))

(declare-fun m!745819 () Bool)

(assert (=> b!804463 m!745819))

(declare-fun m!745821 () Bool)

(assert (=> b!804463 m!745821))

(declare-fun m!745823 () Bool)

(assert (=> b!804459 m!745823))

(declare-fun m!745825 () Bool)

(assert (=> b!804464 m!745825))

(declare-fun m!745827 () Bool)

(assert (=> b!804461 m!745827))

(declare-fun m!745829 () Bool)

(assert (=> b!804461 m!745829))

(declare-fun m!745831 () Bool)

(assert (=> b!804461 m!745831))

(declare-fun m!745833 () Bool)

(assert (=> b!804461 m!745833))

(declare-fun m!745835 () Bool)

(assert (=> b!804456 m!745835))

(declare-fun m!745837 () Bool)

(assert (=> start!68964 m!745837))

(declare-fun m!745839 () Bool)

(assert (=> start!68964 m!745839))

(declare-fun m!745841 () Bool)

(assert (=> b!804462 m!745841))

(declare-fun m!745843 () Bool)

(assert (=> b!804460 m!745843))

(assert (=> b!804460 m!745843))

(declare-fun m!745845 () Bool)

(assert (=> b!804460 m!745845))

(declare-fun m!745847 () Bool)

(assert (=> b!804458 m!745847))

(check-sat (not b!804456) (not b!804462) (not b!804459) (not b!804458) (not b!804461) (not start!68964) (not b!804460) (not b!804464))
(check-sat)
