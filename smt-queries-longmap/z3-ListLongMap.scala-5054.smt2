; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68814 () Bool)

(assert start!68814)

(declare-fun b!802201 () Bool)

(declare-fun e!444568 () Bool)

(assert (=> b!802201 (= e!444568 (not true))))

(declare-fun lt!358621 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43621 0))(
  ( (array!43622 (arr!20891 (Array (_ BitVec 32) (_ BitVec 64))) (size!21312 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43621)

(declare-fun lt!358620 () array!43621)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358617 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8479 0))(
  ( (MissingZero!8479 (index!36284 (_ BitVec 32))) (Found!8479 (index!36285 (_ BitVec 32))) (Intermediate!8479 (undefined!9291 Bool) (index!36286 (_ BitVec 32)) (x!67144 (_ BitVec 32))) (Undefined!8479) (MissingVacant!8479 (index!36287 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43621 (_ BitVec 32)) SeekEntryResult!8479)

(assert (=> b!802201 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358621 vacantAfter!23 lt!358617 lt!358620 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358621 vacantBefore!23 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27472 0))(
  ( (Unit!27473) )
))
(declare-fun lt!358616 () Unit!27472)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43621 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27472)

(assert (=> b!802201 (= lt!358616 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358621 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802201 (= lt!358621 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802202 () Bool)

(declare-fun e!444565 () Bool)

(declare-fun e!444567 () Bool)

(assert (=> b!802202 (= e!444565 e!444567)))

(declare-fun res!546866 () Bool)

(assert (=> b!802202 (=> (not res!546866) (not e!444567))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43621 (_ BitVec 32)) SeekEntryResult!8479)

(assert (=> b!802202 (= res!546866 (= (seekEntryOrOpen!0 lt!358617 lt!358620 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358617 lt!358620 mask!3266)))))

(assert (=> b!802202 (= lt!358617 (select (store (arr!20891 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802202 (= lt!358620 (array!43622 (store (arr!20891 a!3170) i!1163 k0!2044) (size!21312 a!3170)))))

(declare-fun b!802203 () Bool)

(declare-fun res!546868 () Bool)

(assert (=> b!802203 (=> (not res!546868) (not e!444565))))

(assert (=> b!802203 (= res!546868 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21312 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20891 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21312 a!3170)) (= (select (arr!20891 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!546867 () Bool)

(declare-fun e!444566 () Bool)

(assert (=> start!68814 (=> (not res!546867) (not e!444566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68814 (= res!546867 (validMask!0 mask!3266))))

(assert (=> start!68814 e!444566))

(assert (=> start!68814 true))

(declare-fun array_inv!16774 (array!43621) Bool)

(assert (=> start!68814 (array_inv!16774 a!3170)))

(declare-fun b!802204 () Bool)

(declare-fun res!546869 () Bool)

(assert (=> b!802204 (=> (not res!546869) (not e!444566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802204 (= res!546869 (validKeyInArray!0 k0!2044))))

(declare-fun b!802205 () Bool)

(declare-fun res!546860 () Bool)

(assert (=> b!802205 (=> (not res!546860) (not e!444565))))

(declare-datatypes ((List!14893 0))(
  ( (Nil!14890) (Cons!14889 (h!16018 (_ BitVec 64)) (t!21199 List!14893)) )
))
(declare-fun arrayNoDuplicates!0 (array!43621 (_ BitVec 32) List!14893) Bool)

(assert (=> b!802205 (= res!546860 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14890))))

(declare-fun b!802206 () Bool)

(declare-fun res!546865 () Bool)

(assert (=> b!802206 (=> (not res!546865) (not e!444566))))

(assert (=> b!802206 (= res!546865 (and (= (size!21312 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21312 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21312 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802207 () Bool)

(assert (=> b!802207 (= e!444567 e!444568)))

(declare-fun res!546864 () Bool)

(assert (=> b!802207 (=> (not res!546864) (not e!444568))))

(declare-fun lt!358618 () SeekEntryResult!8479)

(declare-fun lt!358622 () SeekEntryResult!8479)

(assert (=> b!802207 (= res!546864 (and (= lt!358622 lt!358618) (= lt!358618 (Found!8479 j!153)) (not (= (select (arr!20891 a!3170) index!1236) (select (arr!20891 a!3170) j!153)))))))

(assert (=> b!802207 (= lt!358618 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802207 (= lt!358622 (seekEntryOrOpen!0 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802208 () Bool)

(assert (=> b!802208 (= e!444566 e!444565)))

(declare-fun res!546861 () Bool)

(assert (=> b!802208 (=> (not res!546861) (not e!444565))))

(declare-fun lt!358619 () SeekEntryResult!8479)

(assert (=> b!802208 (= res!546861 (or (= lt!358619 (MissingZero!8479 i!1163)) (= lt!358619 (MissingVacant!8479 i!1163))))))

(assert (=> b!802208 (= lt!358619 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802209 () Bool)

(declare-fun res!546870 () Bool)

(assert (=> b!802209 (=> (not res!546870) (not e!444565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43621 (_ BitVec 32)) Bool)

(assert (=> b!802209 (= res!546870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802210 () Bool)

(declare-fun res!546863 () Bool)

(assert (=> b!802210 (=> (not res!546863) (not e!444566))))

(assert (=> b!802210 (= res!546863 (validKeyInArray!0 (select (arr!20891 a!3170) j!153)))))

(declare-fun b!802211 () Bool)

(declare-fun res!546862 () Bool)

(assert (=> b!802211 (=> (not res!546862) (not e!444566))))

(declare-fun arrayContainsKey!0 (array!43621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802211 (= res!546862 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68814 res!546867) b!802206))

(assert (= (and b!802206 res!546865) b!802210))

(assert (= (and b!802210 res!546863) b!802204))

(assert (= (and b!802204 res!546869) b!802211))

(assert (= (and b!802211 res!546862) b!802208))

(assert (= (and b!802208 res!546861) b!802209))

(assert (= (and b!802209 res!546870) b!802205))

(assert (= (and b!802205 res!546860) b!802203))

(assert (= (and b!802203 res!546868) b!802202))

(assert (= (and b!802202 res!546866) b!802207))

(assert (= (and b!802207 res!546864) b!802201))

(declare-fun m!743167 () Bool)

(assert (=> b!802205 m!743167))

(declare-fun m!743169 () Bool)

(assert (=> start!68814 m!743169))

(declare-fun m!743171 () Bool)

(assert (=> start!68814 m!743171))

(declare-fun m!743173 () Bool)

(assert (=> b!802211 m!743173))

(declare-fun m!743175 () Bool)

(assert (=> b!802210 m!743175))

(assert (=> b!802210 m!743175))

(declare-fun m!743177 () Bool)

(assert (=> b!802210 m!743177))

(declare-fun m!743179 () Bool)

(assert (=> b!802209 m!743179))

(declare-fun m!743181 () Bool)

(assert (=> b!802203 m!743181))

(declare-fun m!743183 () Bool)

(assert (=> b!802203 m!743183))

(declare-fun m!743185 () Bool)

(assert (=> b!802202 m!743185))

(declare-fun m!743187 () Bool)

(assert (=> b!802202 m!743187))

(declare-fun m!743189 () Bool)

(assert (=> b!802202 m!743189))

(declare-fun m!743191 () Bool)

(assert (=> b!802202 m!743191))

(declare-fun m!743193 () Bool)

(assert (=> b!802204 m!743193))

(assert (=> b!802201 m!743175))

(declare-fun m!743195 () Bool)

(assert (=> b!802201 m!743195))

(declare-fun m!743197 () Bool)

(assert (=> b!802201 m!743197))

(declare-fun m!743199 () Bool)

(assert (=> b!802201 m!743199))

(assert (=> b!802201 m!743175))

(declare-fun m!743201 () Bool)

(assert (=> b!802201 m!743201))

(declare-fun m!743203 () Bool)

(assert (=> b!802207 m!743203))

(assert (=> b!802207 m!743175))

(assert (=> b!802207 m!743175))

(declare-fun m!743205 () Bool)

(assert (=> b!802207 m!743205))

(assert (=> b!802207 m!743175))

(declare-fun m!743207 () Bool)

(assert (=> b!802207 m!743207))

(declare-fun m!743209 () Bool)

(assert (=> b!802208 m!743209))

(check-sat (not start!68814) (not b!802211) (not b!802205) (not b!802210) (not b!802208) (not b!802204) (not b!802202) (not b!802207) (not b!802209) (not b!802201))
(check-sat)
