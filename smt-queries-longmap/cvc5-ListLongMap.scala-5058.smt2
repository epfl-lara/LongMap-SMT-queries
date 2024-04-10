; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68858 () Bool)

(assert start!68858)

(declare-fun b!802866 () Bool)

(declare-fun res!547384 () Bool)

(declare-fun e!444918 () Bool)

(assert (=> b!802866 (=> (not res!547384) (not e!444918))))

(declare-datatypes ((array!43648 0))(
  ( (array!43649 (arr!20904 (Array (_ BitVec 32) (_ BitVec 64))) (size!21325 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43648)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43648 (_ BitVec 32)) Bool)

(assert (=> b!802866 (= res!547384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802867 () Bool)

(declare-fun res!547385 () Bool)

(declare-fun e!444916 () Bool)

(assert (=> b!802867 (=> (not res!547385) (not e!444916))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802867 (= res!547385 (validKeyInArray!0 (select (arr!20904 a!3170) j!153)))))

(declare-fun b!802868 () Bool)

(declare-fun res!547389 () Bool)

(assert (=> b!802868 (=> (not res!547389) (not e!444916))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802868 (= res!547389 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802869 () Bool)

(declare-fun e!444917 () Bool)

(assert (=> b!802869 (= e!444917 (not true))))

(declare-fun lt!359164 () array!43648)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359165 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359167 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8495 0))(
  ( (MissingZero!8495 (index!36348 (_ BitVec 32))) (Found!8495 (index!36349 (_ BitVec 32))) (Intermediate!8495 (undefined!9307 Bool) (index!36350 (_ BitVec 32)) (x!67197 (_ BitVec 32))) (Undefined!8495) (MissingVacant!8495 (index!36351 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43648 (_ BitVec 32)) SeekEntryResult!8495)

(assert (=> b!802869 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359165 vacantAfter!23 lt!359167 lt!359164 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359165 vacantBefore!23 (select (arr!20904 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27530 0))(
  ( (Unit!27531) )
))
(declare-fun lt!359163 () Unit!27530)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27530)

(assert (=> b!802869 (= lt!359163 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359165 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802869 (= lt!359165 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802870 () Bool)

(declare-fun res!547394 () Bool)

(assert (=> b!802870 (=> (not res!547394) (not e!444918))))

(declare-datatypes ((List!14867 0))(
  ( (Nil!14864) (Cons!14863 (h!15992 (_ BitVec 64)) (t!21182 List!14867)) )
))
(declare-fun arrayNoDuplicates!0 (array!43648 (_ BitVec 32) List!14867) Bool)

(assert (=> b!802870 (= res!547394 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14864))))

(declare-fun b!802871 () Bool)

(declare-fun res!547386 () Bool)

(assert (=> b!802871 (=> (not res!547386) (not e!444916))))

(assert (=> b!802871 (= res!547386 (validKeyInArray!0 k!2044))))

(declare-fun b!802872 () Bool)

(assert (=> b!802872 (= e!444916 e!444918)))

(declare-fun res!547392 () Bool)

(assert (=> b!802872 (=> (not res!547392) (not e!444918))))

(declare-fun lt!359166 () SeekEntryResult!8495)

(assert (=> b!802872 (= res!547392 (or (= lt!359166 (MissingZero!8495 i!1163)) (= lt!359166 (MissingVacant!8495 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43648 (_ BitVec 32)) SeekEntryResult!8495)

(assert (=> b!802872 (= lt!359166 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802873 () Bool)

(declare-fun res!547388 () Bool)

(assert (=> b!802873 (=> (not res!547388) (not e!444916))))

(assert (=> b!802873 (= res!547388 (and (= (size!21325 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21325 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21325 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!547391 () Bool)

(assert (=> start!68858 (=> (not res!547391) (not e!444916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68858 (= res!547391 (validMask!0 mask!3266))))

(assert (=> start!68858 e!444916))

(assert (=> start!68858 true))

(declare-fun array_inv!16700 (array!43648) Bool)

(assert (=> start!68858 (array_inv!16700 a!3170)))

(declare-fun b!802865 () Bool)

(declare-fun e!444919 () Bool)

(assert (=> b!802865 (= e!444918 e!444919)))

(declare-fun res!547387 () Bool)

(assert (=> b!802865 (=> (not res!547387) (not e!444919))))

(assert (=> b!802865 (= res!547387 (= (seekEntryOrOpen!0 lt!359167 lt!359164 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359167 lt!359164 mask!3266)))))

(assert (=> b!802865 (= lt!359167 (select (store (arr!20904 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802865 (= lt!359164 (array!43649 (store (arr!20904 a!3170) i!1163 k!2044) (size!21325 a!3170)))))

(declare-fun b!802874 () Bool)

(assert (=> b!802874 (= e!444919 e!444917)))

(declare-fun res!547390 () Bool)

(assert (=> b!802874 (=> (not res!547390) (not e!444917))))

(declare-fun lt!359168 () SeekEntryResult!8495)

(declare-fun lt!359162 () SeekEntryResult!8495)

(assert (=> b!802874 (= res!547390 (and (= lt!359162 lt!359168) (= lt!359168 (Found!8495 j!153)) (not (= (select (arr!20904 a!3170) index!1236) (select (arr!20904 a!3170) j!153)))))))

(assert (=> b!802874 (= lt!359168 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20904 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802874 (= lt!359162 (seekEntryOrOpen!0 (select (arr!20904 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802875 () Bool)

(declare-fun res!547393 () Bool)

(assert (=> b!802875 (=> (not res!547393) (not e!444918))))

(assert (=> b!802875 (= res!547393 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21325 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20904 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21325 a!3170)) (= (select (arr!20904 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68858 res!547391) b!802873))

(assert (= (and b!802873 res!547388) b!802867))

(assert (= (and b!802867 res!547385) b!802871))

(assert (= (and b!802871 res!547386) b!802868))

(assert (= (and b!802868 res!547389) b!802872))

(assert (= (and b!802872 res!547392) b!802866))

(assert (= (and b!802866 res!547384) b!802870))

(assert (= (and b!802870 res!547394) b!802875))

(assert (= (and b!802875 res!547393) b!802865))

(assert (= (and b!802865 res!547387) b!802874))

(assert (= (and b!802874 res!547390) b!802869))

(declare-fun m!744437 () Bool)

(assert (=> b!802872 m!744437))

(declare-fun m!744439 () Bool)

(assert (=> b!802865 m!744439))

(declare-fun m!744441 () Bool)

(assert (=> b!802865 m!744441))

(declare-fun m!744443 () Bool)

(assert (=> b!802865 m!744443))

(declare-fun m!744445 () Bool)

(assert (=> b!802865 m!744445))

(declare-fun m!744447 () Bool)

(assert (=> b!802868 m!744447))

(declare-fun m!744449 () Bool)

(assert (=> b!802866 m!744449))

(declare-fun m!744451 () Bool)

(assert (=> b!802867 m!744451))

(assert (=> b!802867 m!744451))

(declare-fun m!744453 () Bool)

(assert (=> b!802867 m!744453))

(declare-fun m!744455 () Bool)

(assert (=> b!802875 m!744455))

(declare-fun m!744457 () Bool)

(assert (=> b!802875 m!744457))

(declare-fun m!744459 () Bool)

(assert (=> b!802874 m!744459))

(assert (=> b!802874 m!744451))

(assert (=> b!802874 m!744451))

(declare-fun m!744461 () Bool)

(assert (=> b!802874 m!744461))

(assert (=> b!802874 m!744451))

(declare-fun m!744463 () Bool)

(assert (=> b!802874 m!744463))

(assert (=> b!802869 m!744451))

(declare-fun m!744465 () Bool)

(assert (=> b!802869 m!744465))

(declare-fun m!744467 () Bool)

(assert (=> b!802869 m!744467))

(declare-fun m!744469 () Bool)

(assert (=> b!802869 m!744469))

(assert (=> b!802869 m!744451))

(declare-fun m!744471 () Bool)

(assert (=> b!802869 m!744471))

(declare-fun m!744473 () Bool)

(assert (=> b!802870 m!744473))

(declare-fun m!744475 () Bool)

(assert (=> start!68858 m!744475))

(declare-fun m!744477 () Bool)

(assert (=> start!68858 m!744477))

(declare-fun m!744479 () Bool)

(assert (=> b!802871 m!744479))

(push 1)

