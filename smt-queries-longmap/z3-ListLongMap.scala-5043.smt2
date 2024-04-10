; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68770 () Bool)

(assert start!68770)

(declare-fun b!801342 () Bool)

(declare-fun e!444211 () Bool)

(declare-fun e!444210 () Bool)

(assert (=> b!801342 (= e!444211 e!444210)))

(declare-fun res!545873 () Bool)

(assert (=> b!801342 (=> (not res!545873) (not e!444210))))

(declare-datatypes ((SeekEntryResult!8451 0))(
  ( (MissingZero!8451 (index!36172 (_ BitVec 32))) (Found!8451 (index!36173 (_ BitVec 32))) (Intermediate!8451 (undefined!9263 Bool) (index!36174 (_ BitVec 32)) (x!67033 (_ BitVec 32))) (Undefined!8451) (MissingVacant!8451 (index!36175 (_ BitVec 32))) )
))
(declare-fun lt!358169 () SeekEntryResult!8451)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801342 (= res!545873 (or (= lt!358169 (MissingZero!8451 i!1163)) (= lt!358169 (MissingVacant!8451 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43560 0))(
  ( (array!43561 (arr!20860 (Array (_ BitVec 32) (_ BitVec 64))) (size!21281 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43560)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43560 (_ BitVec 32)) SeekEntryResult!8451)

(assert (=> b!801342 (= lt!358169 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801343 () Bool)

(declare-fun res!545863 () Bool)

(assert (=> b!801343 (=> (not res!545863) (not e!444211))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801343 (= res!545863 (and (= (size!21281 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21281 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21281 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801344 () Bool)

(declare-fun res!545867 () Bool)

(assert (=> b!801344 (=> (not res!545867) (not e!444211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801344 (= res!545867 (validKeyInArray!0 k0!2044))))

(declare-fun b!801345 () Bool)

(declare-fun e!444212 () Bool)

(assert (=> b!801345 (= e!444210 e!444212)))

(declare-fun res!545864 () Bool)

(assert (=> b!801345 (=> (not res!545864) (not e!444212))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358162 () SeekEntryResult!8451)

(declare-fun lt!358168 () (_ BitVec 64))

(declare-fun lt!358166 () array!43560)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43560 (_ BitVec 32)) SeekEntryResult!8451)

(assert (=> b!801345 (= res!545864 (= lt!358162 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358168 lt!358166 mask!3266)))))

(assert (=> b!801345 (= lt!358162 (seekEntryOrOpen!0 lt!358168 lt!358166 mask!3266))))

(assert (=> b!801345 (= lt!358168 (select (store (arr!20860 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801345 (= lt!358166 (array!43561 (store (arr!20860 a!3170) i!1163 k0!2044) (size!21281 a!3170)))))

(declare-fun b!801346 () Bool)

(declare-fun res!545861 () Bool)

(assert (=> b!801346 (=> (not res!545861) (not e!444211))))

(declare-fun arrayContainsKey!0 (array!43560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801346 (= res!545861 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801347 () Bool)

(declare-fun res!545870 () Bool)

(assert (=> b!801347 (=> (not res!545870) (not e!444210))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801347 (= res!545870 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21281 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20860 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21281 a!3170)) (= (select (arr!20860 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!545866 () Bool)

(assert (=> start!68770 (=> (not res!545866) (not e!444211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68770 (= res!545866 (validMask!0 mask!3266))))

(assert (=> start!68770 e!444211))

(assert (=> start!68770 true))

(declare-fun array_inv!16656 (array!43560) Bool)

(assert (=> start!68770 (array_inv!16656 a!3170)))

(declare-fun b!801348 () Bool)

(declare-fun res!545869 () Bool)

(assert (=> b!801348 (=> (not res!545869) (not e!444210))))

(declare-datatypes ((List!14823 0))(
  ( (Nil!14820) (Cons!14819 (h!15948 (_ BitVec 64)) (t!21138 List!14823)) )
))
(declare-fun arrayNoDuplicates!0 (array!43560 (_ BitVec 32) List!14823) Bool)

(assert (=> b!801348 (= res!545869 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14820))))

(declare-fun b!801349 () Bool)

(declare-fun res!545872 () Bool)

(assert (=> b!801349 (=> (not res!545872) (not e!444210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43560 (_ BitVec 32)) Bool)

(assert (=> b!801349 (= res!545872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801350 () Bool)

(declare-fun res!545868 () Bool)

(assert (=> b!801350 (=> (not res!545868) (not e!444211))))

(assert (=> b!801350 (= res!545868 (validKeyInArray!0 (select (arr!20860 a!3170) j!153)))))

(declare-fun b!801351 () Bool)

(declare-fun res!545871 () Bool)

(declare-fun e!444209 () Bool)

(assert (=> b!801351 (=> (not res!545871) (not e!444209))))

(declare-fun lt!358164 () (_ BitVec 32))

(assert (=> b!801351 (= res!545871 (= lt!358162 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358164 vacantAfter!23 lt!358168 lt!358166 mask!3266)))))

(declare-fun b!801352 () Bool)

(assert (=> b!801352 (= e!444209 false)))

(declare-fun lt!358165 () SeekEntryResult!8451)

(assert (=> b!801352 (= lt!358165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358164 vacantBefore!23 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801353 () Bool)

(declare-fun e!444207 () Bool)

(assert (=> b!801353 (= e!444207 e!444209)))

(declare-fun res!545865 () Bool)

(assert (=> b!801353 (=> (not res!545865) (not e!444209))))

(assert (=> b!801353 (= res!545865 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358164 #b00000000000000000000000000000000) (bvslt lt!358164 (size!21281 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801353 (= lt!358164 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801354 () Bool)

(assert (=> b!801354 (= e!444212 e!444207)))

(declare-fun res!545862 () Bool)

(assert (=> b!801354 (=> (not res!545862) (not e!444207))))

(declare-fun lt!358163 () SeekEntryResult!8451)

(declare-fun lt!358167 () SeekEntryResult!8451)

(assert (=> b!801354 (= res!545862 (and (= lt!358167 lt!358163) (= lt!358163 (Found!8451 j!153)) (not (= (select (arr!20860 a!3170) index!1236) (select (arr!20860 a!3170) j!153)))))))

(assert (=> b!801354 (= lt!358163 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801354 (= lt!358167 (seekEntryOrOpen!0 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68770 res!545866) b!801343))

(assert (= (and b!801343 res!545863) b!801350))

(assert (= (and b!801350 res!545868) b!801344))

(assert (= (and b!801344 res!545867) b!801346))

(assert (= (and b!801346 res!545861) b!801342))

(assert (= (and b!801342 res!545873) b!801349))

(assert (= (and b!801349 res!545872) b!801348))

(assert (= (and b!801348 res!545869) b!801347))

(assert (= (and b!801347 res!545870) b!801345))

(assert (= (and b!801345 res!545864) b!801354))

(assert (= (and b!801354 res!545862) b!801353))

(assert (= (and b!801353 res!545865) b!801351))

(assert (= (and b!801351 res!545871) b!801352))

(declare-fun m!742499 () Bool)

(assert (=> b!801347 m!742499))

(declare-fun m!742501 () Bool)

(assert (=> b!801347 m!742501))

(declare-fun m!742503 () Bool)

(assert (=> b!801354 m!742503))

(declare-fun m!742505 () Bool)

(assert (=> b!801354 m!742505))

(assert (=> b!801354 m!742505))

(declare-fun m!742507 () Bool)

(assert (=> b!801354 m!742507))

(assert (=> b!801354 m!742505))

(declare-fun m!742509 () Bool)

(assert (=> b!801354 m!742509))

(declare-fun m!742511 () Bool)

(assert (=> b!801344 m!742511))

(assert (=> b!801352 m!742505))

(assert (=> b!801352 m!742505))

(declare-fun m!742513 () Bool)

(assert (=> b!801352 m!742513))

(declare-fun m!742515 () Bool)

(assert (=> b!801348 m!742515))

(declare-fun m!742517 () Bool)

(assert (=> b!801346 m!742517))

(declare-fun m!742519 () Bool)

(assert (=> b!801342 m!742519))

(assert (=> b!801350 m!742505))

(assert (=> b!801350 m!742505))

(declare-fun m!742521 () Bool)

(assert (=> b!801350 m!742521))

(declare-fun m!742523 () Bool)

(assert (=> start!68770 m!742523))

(declare-fun m!742525 () Bool)

(assert (=> start!68770 m!742525))

(declare-fun m!742527 () Bool)

(assert (=> b!801353 m!742527))

(declare-fun m!742529 () Bool)

(assert (=> b!801345 m!742529))

(declare-fun m!742531 () Bool)

(assert (=> b!801345 m!742531))

(declare-fun m!742533 () Bool)

(assert (=> b!801345 m!742533))

(declare-fun m!742535 () Bool)

(assert (=> b!801345 m!742535))

(declare-fun m!742537 () Bool)

(assert (=> b!801351 m!742537))

(declare-fun m!742539 () Bool)

(assert (=> b!801349 m!742539))

(check-sat (not b!801344) (not b!801350) (not b!801345) (not b!801353) (not b!801348) (not b!801346) (not b!801351) (not b!801354) (not start!68770) (not b!801342) (not b!801352) (not b!801349))
(check-sat)
