; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69830 () Bool)

(assert start!69830)

(declare-fun b!812593 () Bool)

(declare-fun res!555092 () Bool)

(declare-fun e!449813 () Bool)

(assert (=> b!812593 (=> (not res!555092) (not e!449813))))

(declare-datatypes ((array!44101 0))(
  ( (array!44102 (arr!21115 (Array (_ BitVec 32) (_ BitVec 64))) (size!21535 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44101)

(declare-datatypes ((List!14985 0))(
  ( (Nil!14982) (Cons!14981 (h!16116 (_ BitVec 64)) (t!21292 List!14985)) )
))
(declare-fun arrayNoDuplicates!0 (array!44101 (_ BitVec 32) List!14985) Bool)

(assert (=> b!812593 (= res!555092 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14982))))

(declare-fun b!812594 () Bool)

(declare-fun res!555096 () Bool)

(declare-fun e!449815 () Bool)

(assert (=> b!812594 (=> (not res!555096) (not e!449815))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812594 (= res!555096 (validKeyInArray!0 k0!2044))))

(declare-fun b!812595 () Bool)

(declare-fun e!449810 () Bool)

(declare-fun e!449811 () Bool)

(assert (=> b!812595 (= e!449810 e!449811)))

(declare-fun res!555091 () Bool)

(assert (=> b!812595 (=> (not res!555091) (not e!449811))))

(declare-datatypes ((SeekEntryResult!8662 0))(
  ( (MissingZero!8662 (index!37019 (_ BitVec 32))) (Found!8662 (index!37020 (_ BitVec 32))) (Intermediate!8662 (undefined!9474 Bool) (index!37021 (_ BitVec 32)) (x!67993 (_ BitVec 32))) (Undefined!8662) (MissingVacant!8662 (index!37022 (_ BitVec 32))) )
))
(declare-fun lt!364343 () SeekEntryResult!8662)

(declare-fun lt!364341 () SeekEntryResult!8662)

(assert (=> b!812595 (= res!555091 (= lt!364343 lt!364341))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44101 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!812595 (= lt!364341 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44101 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!812595 (= lt!364343 (seekEntryOrOpen!0 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!555094 () Bool)

(assert (=> start!69830 (=> (not res!555094) (not e!449815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69830 (= res!555094 (validMask!0 mask!3266))))

(assert (=> start!69830 e!449815))

(assert (=> start!69830 true))

(declare-fun array_inv!16974 (array!44101) Bool)

(assert (=> start!69830 (array_inv!16974 a!3170)))

(declare-fun b!812596 () Bool)

(declare-fun e!449812 () Bool)

(assert (=> b!812596 (= e!449811 e!449812)))

(declare-fun res!555099 () Bool)

(assert (=> b!812596 (=> (not res!555099) (not e!449812))))

(declare-fun lt!364349 () SeekEntryResult!8662)

(assert (=> b!812596 (= res!555099 (and (= lt!364341 lt!364349) (not (= (select (arr!21115 a!3170) index!1236) (select (arr!21115 a!3170) j!153)))))))

(assert (=> b!812596 (= lt!364349 (Found!8662 j!153))))

(declare-fun b!812597 () Bool)

(assert (=> b!812597 (= e!449813 e!449810)))

(declare-fun res!555095 () Bool)

(assert (=> b!812597 (=> (not res!555095) (not e!449810))))

(declare-fun lt!364346 () SeekEntryResult!8662)

(declare-fun lt!364342 () SeekEntryResult!8662)

(assert (=> b!812597 (= res!555095 (= lt!364346 lt!364342))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!364340 () array!44101)

(declare-fun lt!364347 () (_ BitVec 64))

(assert (=> b!812597 (= lt!364342 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364347 lt!364340 mask!3266))))

(assert (=> b!812597 (= lt!364346 (seekEntryOrOpen!0 lt!364347 lt!364340 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!812597 (= lt!364347 (select (store (arr!21115 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!812597 (= lt!364340 (array!44102 (store (arr!21115 a!3170) i!1163 k0!2044) (size!21535 a!3170)))))

(declare-fun b!812598 () Bool)

(declare-fun res!555090 () Bool)

(assert (=> b!812598 (=> (not res!555090) (not e!449813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44101 (_ BitVec 32)) Bool)

(assert (=> b!812598 (= res!555090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!812599 () Bool)

(declare-fun res!555093 () Bool)

(assert (=> b!812599 (=> (not res!555093) (not e!449815))))

(declare-fun arrayContainsKey!0 (array!44101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812599 (= res!555093 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!812600 () Bool)

(declare-fun res!555097 () Bool)

(assert (=> b!812600 (=> (not res!555097) (not e!449815))))

(assert (=> b!812600 (= res!555097 (and (= (size!21535 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21535 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21535 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!812601 () Bool)

(declare-fun res!555088 () Bool)

(assert (=> b!812601 (=> (not res!555088) (not e!449815))))

(assert (=> b!812601 (= res!555088 (validKeyInArray!0 (select (arr!21115 a!3170) j!153)))))

(declare-fun b!812602 () Bool)

(declare-fun res!555098 () Bool)

(assert (=> b!812602 (=> (not res!555098) (not e!449813))))

(assert (=> b!812602 (= res!555098 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21535 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21115 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21535 a!3170)) (= (select (arr!21115 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!812603 () Bool)

(assert (=> b!812603 (= e!449815 e!449813)))

(declare-fun res!555089 () Bool)

(assert (=> b!812603 (=> (not res!555089) (not e!449813))))

(declare-fun lt!364345 () SeekEntryResult!8662)

(assert (=> b!812603 (= res!555089 (or (= lt!364345 (MissingZero!8662 i!1163)) (= lt!364345 (MissingVacant!8662 i!1163))))))

(assert (=> b!812603 (= lt!364345 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!812604 () Bool)

(assert (=> b!812604 (= e!449812 (not (or (not (= lt!364342 lt!364349)) (= lt!364342 lt!364341))))))

(declare-fun lt!364348 () (_ BitVec 32))

(assert (=> b!812604 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364348 vacantAfter!23 lt!364347 lt!364340 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364348 vacantBefore!23 (select (arr!21115 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27669 0))(
  ( (Unit!27670) )
))
(declare-fun lt!364344 () Unit!27669)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27669)

(assert (=> b!812604 (= lt!364344 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364348 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!812604 (= lt!364348 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!69830 res!555094) b!812600))

(assert (= (and b!812600 res!555097) b!812601))

(assert (= (and b!812601 res!555088) b!812594))

(assert (= (and b!812594 res!555096) b!812599))

(assert (= (and b!812599 res!555093) b!812603))

(assert (= (and b!812603 res!555089) b!812598))

(assert (= (and b!812598 res!555090) b!812593))

(assert (= (and b!812593 res!555092) b!812602))

(assert (= (and b!812602 res!555098) b!812597))

(assert (= (and b!812597 res!555095) b!812595))

(assert (= (and b!812595 res!555091) b!812596))

(assert (= (and b!812596 res!555099) b!812604))

(declare-fun m!755425 () Bool)

(assert (=> b!812599 m!755425))

(declare-fun m!755427 () Bool)

(assert (=> b!812598 m!755427))

(declare-fun m!755429 () Bool)

(assert (=> b!812602 m!755429))

(declare-fun m!755431 () Bool)

(assert (=> b!812602 m!755431))

(declare-fun m!755433 () Bool)

(assert (=> b!812595 m!755433))

(assert (=> b!812595 m!755433))

(declare-fun m!755435 () Bool)

(assert (=> b!812595 m!755435))

(assert (=> b!812595 m!755433))

(declare-fun m!755437 () Bool)

(assert (=> b!812595 m!755437))

(assert (=> b!812601 m!755433))

(assert (=> b!812601 m!755433))

(declare-fun m!755439 () Bool)

(assert (=> b!812601 m!755439))

(declare-fun m!755441 () Bool)

(assert (=> b!812597 m!755441))

(declare-fun m!755443 () Bool)

(assert (=> b!812597 m!755443))

(declare-fun m!755445 () Bool)

(assert (=> b!812597 m!755445))

(declare-fun m!755447 () Bool)

(assert (=> b!812597 m!755447))

(declare-fun m!755449 () Bool)

(assert (=> start!69830 m!755449))

(declare-fun m!755451 () Bool)

(assert (=> start!69830 m!755451))

(assert (=> b!812604 m!755433))

(declare-fun m!755453 () Bool)

(assert (=> b!812604 m!755453))

(assert (=> b!812604 m!755433))

(declare-fun m!755455 () Bool)

(assert (=> b!812604 m!755455))

(declare-fun m!755457 () Bool)

(assert (=> b!812604 m!755457))

(declare-fun m!755459 () Bool)

(assert (=> b!812604 m!755459))

(declare-fun m!755461 () Bool)

(assert (=> b!812596 m!755461))

(assert (=> b!812596 m!755433))

(declare-fun m!755463 () Bool)

(assert (=> b!812594 m!755463))

(declare-fun m!755465 () Bool)

(assert (=> b!812603 m!755465))

(declare-fun m!755467 () Bool)

(assert (=> b!812593 m!755467))

(check-sat (not b!812604) (not b!812599) (not b!812593) (not start!69830) (not b!812597) (not b!812601) (not b!812594) (not b!812603) (not b!812598) (not b!812595))
(check-sat)
