; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69306 () Bool)

(assert start!69306)

(declare-fun b!808340 () Bool)

(declare-fun e!447465 () Bool)

(declare-fun e!447466 () Bool)

(assert (=> b!808340 (= e!447465 e!447466)))

(declare-fun res!552413 () Bool)

(assert (=> b!808340 (=> (not res!552413) (not e!447466))))

(declare-datatypes ((array!43972 0))(
  ( (array!43973 (arr!21062 (Array (_ BitVec 32) (_ BitVec 64))) (size!21483 (_ BitVec 32))) )
))
(declare-fun lt!362080 () array!43972)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362079 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8650 0))(
  ( (MissingZero!8650 (index!36968 (_ BitVec 32))) (Found!8650 (index!36969 (_ BitVec 32))) (Intermediate!8650 (undefined!9462 Bool) (index!36970 (_ BitVec 32)) (x!67783 (_ BitVec 32))) (Undefined!8650) (MissingVacant!8650 (index!36971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43972 (_ BitVec 32)) SeekEntryResult!8650)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43972 (_ BitVec 32)) SeekEntryResult!8650)

(assert (=> b!808340 (= res!552413 (= (seekEntryOrOpen!0 lt!362079 lt!362080 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362079 lt!362080 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43972)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808340 (= lt!362079 (select (store (arr!21062 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808340 (= lt!362080 (array!43973 (store (arr!21062 a!3170) i!1163 k0!2044) (size!21483 a!3170)))))

(declare-fun b!808341 () Bool)

(declare-fun res!552406 () Bool)

(assert (=> b!808341 (=> (not res!552406) (not e!447465))))

(declare-datatypes ((List!15064 0))(
  ( (Nil!15061) (Cons!15060 (h!16189 (_ BitVec 64)) (t!21370 List!15064)) )
))
(declare-fun arrayNoDuplicates!0 (array!43972 (_ BitVec 32) List!15064) Bool)

(assert (=> b!808341 (= res!552406 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15061))))

(declare-fun b!808342 () Bool)

(declare-fun res!552404 () Bool)

(assert (=> b!808342 (=> (not res!552404) (not e!447465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43972 (_ BitVec 32)) Bool)

(assert (=> b!808342 (= res!552404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808343 () Bool)

(declare-fun res!552407 () Bool)

(declare-fun e!447464 () Bool)

(assert (=> b!808343 (=> (not res!552407) (not e!447464))))

(declare-fun arrayContainsKey!0 (array!43972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808343 (= res!552407 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808344 () Bool)

(declare-fun e!447463 () Bool)

(assert (=> b!808344 (= e!447466 e!447463)))

(declare-fun res!552414 () Bool)

(assert (=> b!808344 (=> (not res!552414) (not e!447463))))

(declare-fun lt!362082 () SeekEntryResult!8650)

(declare-fun lt!362081 () SeekEntryResult!8650)

(assert (=> b!808344 (= res!552414 (and (= lt!362082 lt!362081) (= lt!362081 (Found!8650 j!153)) (not (= (select (arr!21062 a!3170) index!1236) (select (arr!21062 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808344 (= lt!362081 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21062 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808344 (= lt!362082 (seekEntryOrOpen!0 (select (arr!21062 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808345 () Bool)

(assert (=> b!808345 (= e!447463 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000)))))

(declare-fun lt!362084 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808345 (= lt!362084 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808346 () Bool)

(declare-fun res!552410 () Bool)

(assert (=> b!808346 (=> (not res!552410) (not e!447464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808346 (= res!552410 (validKeyInArray!0 k0!2044))))

(declare-fun b!808347 () Bool)

(declare-fun res!552405 () Bool)

(assert (=> b!808347 (=> (not res!552405) (not e!447464))))

(assert (=> b!808347 (= res!552405 (validKeyInArray!0 (select (arr!21062 a!3170) j!153)))))

(declare-fun b!808339 () Bool)

(assert (=> b!808339 (= e!447464 e!447465)))

(declare-fun res!552408 () Bool)

(assert (=> b!808339 (=> (not res!552408) (not e!447465))))

(declare-fun lt!362083 () SeekEntryResult!8650)

(assert (=> b!808339 (= res!552408 (or (= lt!362083 (MissingZero!8650 i!1163)) (= lt!362083 (MissingVacant!8650 i!1163))))))

(assert (=> b!808339 (= lt!362083 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!552411 () Bool)

(assert (=> start!69306 (=> (not res!552411) (not e!447464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69306 (= res!552411 (validMask!0 mask!3266))))

(assert (=> start!69306 e!447464))

(assert (=> start!69306 true))

(declare-fun array_inv!16945 (array!43972) Bool)

(assert (=> start!69306 (array_inv!16945 a!3170)))

(declare-fun b!808348 () Bool)

(declare-fun res!552409 () Bool)

(assert (=> b!808348 (=> (not res!552409) (not e!447464))))

(assert (=> b!808348 (= res!552409 (and (= (size!21483 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21483 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21483 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808349 () Bool)

(declare-fun res!552412 () Bool)

(assert (=> b!808349 (=> (not res!552412) (not e!447465))))

(assert (=> b!808349 (= res!552412 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21483 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21062 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21483 a!3170)) (= (select (arr!21062 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69306 res!552411) b!808348))

(assert (= (and b!808348 res!552409) b!808347))

(assert (= (and b!808347 res!552405) b!808346))

(assert (= (and b!808346 res!552410) b!808343))

(assert (= (and b!808343 res!552407) b!808339))

(assert (= (and b!808339 res!552408) b!808342))

(assert (= (and b!808342 res!552404) b!808341))

(assert (= (and b!808341 res!552406) b!808349))

(assert (= (and b!808349 res!552412) b!808340))

(assert (= (and b!808340 res!552413) b!808344))

(assert (= (and b!808344 res!552414) b!808345))

(declare-fun m!749983 () Bool)

(assert (=> b!808346 m!749983))

(declare-fun m!749985 () Bool)

(assert (=> b!808339 m!749985))

(declare-fun m!749987 () Bool)

(assert (=> b!808341 m!749987))

(declare-fun m!749989 () Bool)

(assert (=> b!808343 m!749989))

(declare-fun m!749991 () Bool)

(assert (=> b!808342 m!749991))

(declare-fun m!749993 () Bool)

(assert (=> b!808347 m!749993))

(assert (=> b!808347 m!749993))

(declare-fun m!749995 () Bool)

(assert (=> b!808347 m!749995))

(declare-fun m!749997 () Bool)

(assert (=> b!808340 m!749997))

(declare-fun m!749999 () Bool)

(assert (=> b!808340 m!749999))

(declare-fun m!750001 () Bool)

(assert (=> b!808340 m!750001))

(declare-fun m!750003 () Bool)

(assert (=> b!808340 m!750003))

(declare-fun m!750005 () Bool)

(assert (=> start!69306 m!750005))

(declare-fun m!750007 () Bool)

(assert (=> start!69306 m!750007))

(declare-fun m!750009 () Bool)

(assert (=> b!808345 m!750009))

(declare-fun m!750011 () Bool)

(assert (=> b!808344 m!750011))

(assert (=> b!808344 m!749993))

(assert (=> b!808344 m!749993))

(declare-fun m!750013 () Bool)

(assert (=> b!808344 m!750013))

(assert (=> b!808344 m!749993))

(declare-fun m!750015 () Bool)

(assert (=> b!808344 m!750015))

(declare-fun m!750017 () Bool)

(assert (=> b!808349 m!750017))

(declare-fun m!750019 () Bool)

(assert (=> b!808349 m!750019))

(check-sat (not b!808345) (not b!808342) (not b!808346) (not b!808339) (not b!808347) (not b!808340) (not b!808341) (not b!808343) (not b!808344) (not start!69306))
(check-sat)
