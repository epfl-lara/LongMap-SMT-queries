; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68898 () Bool)

(assert start!68898)

(declare-fun b!803570 () Bool)

(declare-fun res!548092 () Bool)

(declare-fun e!445263 () Bool)

(assert (=> b!803570 (=> (not res!548092) (not e!445263))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43688 0))(
  ( (array!43689 (arr!20924 (Array (_ BitVec 32) (_ BitVec 64))) (size!21345 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43688)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803570 (= res!548092 (and (= (size!21345 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21345 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21345 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803572 () Bool)

(declare-fun e!445262 () Bool)

(declare-fun e!445265 () Bool)

(assert (=> b!803572 (= e!445262 e!445265)))

(declare-fun res!548096 () Bool)

(assert (=> b!803572 (=> (not res!548096) (not e!445265))))

(declare-datatypes ((SeekEntryResult!8515 0))(
  ( (MissingZero!8515 (index!36428 (_ BitVec 32))) (Found!8515 (index!36429 (_ BitVec 32))) (Intermediate!8515 (undefined!9327 Bool) (index!36430 (_ BitVec 32)) (x!67265 (_ BitVec 32))) (Undefined!8515) (MissingVacant!8515 (index!36431 (_ BitVec 32))) )
))
(declare-fun lt!359695 () SeekEntryResult!8515)

(declare-fun lt!359692 () SeekEntryResult!8515)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803572 (= res!548096 (and (= lt!359692 lt!359695) (= lt!359695 (Found!8515 j!153)) (not (= (select (arr!20924 a!3170) index!1236) (select (arr!20924 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43688 (_ BitVec 32)) SeekEntryResult!8515)

(assert (=> b!803572 (= lt!359695 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43688 (_ BitVec 32)) SeekEntryResult!8515)

(assert (=> b!803572 (= lt!359692 (seekEntryOrOpen!0 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803573 () Bool)

(declare-fun e!445264 () Bool)

(assert (=> b!803573 (= e!445264 e!445262)))

(declare-fun res!548097 () Bool)

(assert (=> b!803573 (=> (not res!548097) (not e!445262))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359696 () array!43688)

(declare-fun lt!359693 () (_ BitVec 64))

(assert (=> b!803573 (= res!548097 (= (seekEntryOrOpen!0 lt!359693 lt!359696 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359693 lt!359696 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!803573 (= lt!359693 (select (store (arr!20924 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803573 (= lt!359696 (array!43689 (store (arr!20924 a!3170) i!1163 k!2044) (size!21345 a!3170)))))

(declare-fun b!803574 () Bool)

(declare-fun res!548093 () Bool)

(assert (=> b!803574 (=> (not res!548093) (not e!445264))))

(assert (=> b!803574 (= res!548093 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21345 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20924 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21345 a!3170)) (= (select (arr!20924 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803575 () Bool)

(declare-fun res!548091 () Bool)

(assert (=> b!803575 (=> (not res!548091) (not e!445263))))

(declare-fun arrayContainsKey!0 (array!43688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803575 (= res!548091 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803576 () Bool)

(assert (=> b!803576 (= e!445263 e!445264)))

(declare-fun res!548090 () Bool)

(assert (=> b!803576 (=> (not res!548090) (not e!445264))))

(declare-fun lt!359691 () SeekEntryResult!8515)

(assert (=> b!803576 (= res!548090 (or (= lt!359691 (MissingZero!8515 i!1163)) (= lt!359691 (MissingVacant!8515 i!1163))))))

(assert (=> b!803576 (= lt!359691 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!548098 () Bool)

(assert (=> start!68898 (=> (not res!548098) (not e!445263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68898 (= res!548098 (validMask!0 mask!3266))))

(assert (=> start!68898 e!445263))

(assert (=> start!68898 true))

(declare-fun array_inv!16720 (array!43688) Bool)

(assert (=> start!68898 (array_inv!16720 a!3170)))

(declare-fun b!803571 () Bool)

(declare-fun res!548095 () Bool)

(assert (=> b!803571 (=> (not res!548095) (not e!445263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803571 (= res!548095 (validKeyInArray!0 k!2044))))

(declare-fun b!803577 () Bool)

(declare-fun res!548099 () Bool)

(assert (=> b!803577 (=> (not res!548099) (not e!445263))))

(assert (=> b!803577 (= res!548099 (validKeyInArray!0 (select (arr!20924 a!3170) j!153)))))

(declare-fun b!803578 () Bool)

(declare-fun res!548089 () Bool)

(assert (=> b!803578 (=> (not res!548089) (not e!445264))))

(declare-datatypes ((List!14887 0))(
  ( (Nil!14884) (Cons!14883 (h!16012 (_ BitVec 64)) (t!21202 List!14887)) )
))
(declare-fun arrayNoDuplicates!0 (array!43688 (_ BitVec 32) List!14887) Bool)

(assert (=> b!803578 (= res!548089 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14884))))

(declare-fun b!803579 () Bool)

(declare-fun res!548094 () Bool)

(assert (=> b!803579 (=> (not res!548094) (not e!445264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43688 (_ BitVec 32)) Bool)

(assert (=> b!803579 (= res!548094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803580 () Bool)

(assert (=> b!803580 (= e!445265 (not true))))

(declare-fun lt!359694 () (_ BitVec 32))

(assert (=> b!803580 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359694 vacantAfter!23 lt!359693 lt!359696 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359694 vacantBefore!23 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27570 0))(
  ( (Unit!27571) )
))
(declare-fun lt!359690 () Unit!27570)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43688 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27570)

(assert (=> b!803580 (= lt!359690 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359694 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803580 (= lt!359694 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68898 res!548098) b!803570))

(assert (= (and b!803570 res!548092) b!803577))

(assert (= (and b!803577 res!548099) b!803571))

(assert (= (and b!803571 res!548095) b!803575))

(assert (= (and b!803575 res!548091) b!803576))

(assert (= (and b!803576 res!548090) b!803579))

(assert (= (and b!803579 res!548094) b!803578))

(assert (= (and b!803578 res!548089) b!803574))

(assert (= (and b!803574 res!548093) b!803573))

(assert (= (and b!803573 res!548097) b!803572))

(assert (= (and b!803572 res!548096) b!803580))

(declare-fun m!745335 () Bool)

(assert (=> b!803571 m!745335))

(declare-fun m!745337 () Bool)

(assert (=> start!68898 m!745337))

(declare-fun m!745339 () Bool)

(assert (=> start!68898 m!745339))

(declare-fun m!745341 () Bool)

(assert (=> b!803577 m!745341))

(assert (=> b!803577 m!745341))

(declare-fun m!745343 () Bool)

(assert (=> b!803577 m!745343))

(declare-fun m!745345 () Bool)

(assert (=> b!803574 m!745345))

(declare-fun m!745347 () Bool)

(assert (=> b!803574 m!745347))

(declare-fun m!745349 () Bool)

(assert (=> b!803578 m!745349))

(declare-fun m!745351 () Bool)

(assert (=> b!803576 m!745351))

(declare-fun m!745353 () Bool)

(assert (=> b!803575 m!745353))

(assert (=> b!803580 m!745341))

(declare-fun m!745355 () Bool)

(assert (=> b!803580 m!745355))

(assert (=> b!803580 m!745341))

(declare-fun m!745357 () Bool)

(assert (=> b!803580 m!745357))

(declare-fun m!745359 () Bool)

(assert (=> b!803580 m!745359))

(declare-fun m!745361 () Bool)

(assert (=> b!803580 m!745361))

(declare-fun m!745363 () Bool)

(assert (=> b!803579 m!745363))

(declare-fun m!745365 () Bool)

(assert (=> b!803573 m!745365))

(declare-fun m!745367 () Bool)

(assert (=> b!803573 m!745367))

(declare-fun m!745369 () Bool)

(assert (=> b!803573 m!745369))

(declare-fun m!745371 () Bool)

(assert (=> b!803573 m!745371))

(declare-fun m!745373 () Bool)

(assert (=> b!803572 m!745373))

(assert (=> b!803572 m!745341))

(assert (=> b!803572 m!745341))

(declare-fun m!745375 () Bool)

(assert (=> b!803572 m!745375))

(assert (=> b!803572 m!745341))

(declare-fun m!745377 () Bool)

(assert (=> b!803572 m!745377))

(push 1)

(assert (not b!803572))

(assert (not b!803578))

(assert (not b!803580))

