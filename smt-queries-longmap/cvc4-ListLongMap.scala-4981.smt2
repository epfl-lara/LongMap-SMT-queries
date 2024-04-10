; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68400 () Bool)

(assert start!68400)

(declare-fun b!794885 () Bool)

(declare-fun res!539405 () Bool)

(declare-fun e!441285 () Bool)

(assert (=> b!794885 (=> (not res!539405) (not e!441285))))

(declare-datatypes ((array!43190 0))(
  ( (array!43191 (arr!20675 (Array (_ BitVec 32) (_ BitVec 64))) (size!21096 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43190)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794885 (= res!539405 (validKeyInArray!0 (select (arr!20675 a!3170) j!153)))))

(declare-fun b!794886 () Bool)

(declare-fun res!539404 () Bool)

(declare-fun e!441286 () Bool)

(assert (=> b!794886 (=> (not res!539404) (not e!441286))))

(declare-datatypes ((List!14638 0))(
  ( (Nil!14635) (Cons!14634 (h!15763 (_ BitVec 64)) (t!20953 List!14638)) )
))
(declare-fun arrayNoDuplicates!0 (array!43190 (_ BitVec 32) List!14638) Bool)

(assert (=> b!794886 (= res!539404 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14635))))

(declare-fun b!794887 () Bool)

(declare-fun res!539410 () Bool)

(declare-fun e!441287 () Bool)

(assert (=> b!794887 (=> (not res!539410) (not e!441287))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8266 0))(
  ( (MissingZero!8266 (index!35432 (_ BitVec 32))) (Found!8266 (index!35433 (_ BitVec 32))) (Intermediate!8266 (undefined!9078 Bool) (index!35434 (_ BitVec 32)) (x!66352 (_ BitVec 32))) (Undefined!8266) (MissingVacant!8266 (index!35435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43190 (_ BitVec 32)) SeekEntryResult!8266)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43190 (_ BitVec 32)) SeekEntryResult!8266)

(assert (=> b!794887 (= res!539410 (= (seekEntryOrOpen!0 (select (arr!20675 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20675 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794888 () Bool)

(declare-fun res!539414 () Bool)

(assert (=> b!794888 (=> (not res!539414) (not e!441285))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!794888 (= res!539414 (validKeyInArray!0 k!2044))))

(declare-fun b!794889 () Bool)

(declare-fun res!539407 () Bool)

(assert (=> b!794889 (=> (not res!539407) (not e!441285))))

(declare-fun arrayContainsKey!0 (array!43190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794889 (= res!539407 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794890 () Bool)

(declare-fun res!539411 () Bool)

(assert (=> b!794890 (=> (not res!539411) (not e!441286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43190 (_ BitVec 32)) Bool)

(assert (=> b!794890 (= res!539411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794891 () Bool)

(assert (=> b!794891 (= e!441286 e!441287)))

(declare-fun res!539413 () Bool)

(assert (=> b!794891 (=> (not res!539413) (not e!441287))))

(declare-fun lt!354322 () array!43190)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354321 () (_ BitVec 64))

(assert (=> b!794891 (= res!539413 (= (seekEntryOrOpen!0 lt!354321 lt!354322 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354321 lt!354322 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794891 (= lt!354321 (select (store (arr!20675 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794891 (= lt!354322 (array!43191 (store (arr!20675 a!3170) i!1163 k!2044) (size!21096 a!3170)))))

(declare-fun b!794892 () Bool)

(declare-fun res!539406 () Bool)

(assert (=> b!794892 (=> (not res!539406) (not e!441286))))

(assert (=> b!794892 (= res!539406 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21096 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20675 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21096 a!3170)) (= (select (arr!20675 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794893 () Bool)

(assert (=> b!794893 (= e!441287 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun res!539412 () Bool)

(assert (=> start!68400 (=> (not res!539412) (not e!441285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68400 (= res!539412 (validMask!0 mask!3266))))

(assert (=> start!68400 e!441285))

(assert (=> start!68400 true))

(declare-fun array_inv!16471 (array!43190) Bool)

(assert (=> start!68400 (array_inv!16471 a!3170)))

(declare-fun b!794894 () Bool)

(declare-fun res!539409 () Bool)

(assert (=> b!794894 (=> (not res!539409) (not e!441285))))

(assert (=> b!794894 (= res!539409 (and (= (size!21096 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21096 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21096 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794895 () Bool)

(assert (=> b!794895 (= e!441285 e!441286)))

(declare-fun res!539408 () Bool)

(assert (=> b!794895 (=> (not res!539408) (not e!441286))))

(declare-fun lt!354323 () SeekEntryResult!8266)

(assert (=> b!794895 (= res!539408 (or (= lt!354323 (MissingZero!8266 i!1163)) (= lt!354323 (MissingVacant!8266 i!1163))))))

(assert (=> b!794895 (= lt!354323 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68400 res!539412) b!794894))

(assert (= (and b!794894 res!539409) b!794885))

(assert (= (and b!794885 res!539405) b!794888))

(assert (= (and b!794888 res!539414) b!794889))

(assert (= (and b!794889 res!539407) b!794895))

(assert (= (and b!794895 res!539408) b!794890))

(assert (= (and b!794890 res!539411) b!794886))

(assert (= (and b!794886 res!539404) b!794892))

(assert (= (and b!794892 res!539406) b!794891))

(assert (= (and b!794891 res!539413) b!794887))

(assert (= (and b!794887 res!539410) b!794893))

(declare-fun m!735457 () Bool)

(assert (=> b!794889 m!735457))

(declare-fun m!735459 () Bool)

(assert (=> b!794891 m!735459))

(declare-fun m!735461 () Bool)

(assert (=> b!794891 m!735461))

(declare-fun m!735463 () Bool)

(assert (=> b!794891 m!735463))

(declare-fun m!735465 () Bool)

(assert (=> b!794891 m!735465))

(declare-fun m!735467 () Bool)

(assert (=> start!68400 m!735467))

(declare-fun m!735469 () Bool)

(assert (=> start!68400 m!735469))

(declare-fun m!735471 () Bool)

(assert (=> b!794888 m!735471))

(declare-fun m!735473 () Bool)

(assert (=> b!794892 m!735473))

(declare-fun m!735475 () Bool)

(assert (=> b!794892 m!735475))

(declare-fun m!735477 () Bool)

(assert (=> b!794890 m!735477))

(declare-fun m!735479 () Bool)

(assert (=> b!794886 m!735479))

(declare-fun m!735481 () Bool)

(assert (=> b!794895 m!735481))

(declare-fun m!735483 () Bool)

(assert (=> b!794885 m!735483))

(assert (=> b!794885 m!735483))

(declare-fun m!735485 () Bool)

(assert (=> b!794885 m!735485))

(assert (=> b!794887 m!735483))

(assert (=> b!794887 m!735483))

(declare-fun m!735487 () Bool)

(assert (=> b!794887 m!735487))

(assert (=> b!794887 m!735483))

(declare-fun m!735489 () Bool)

(assert (=> b!794887 m!735489))

(push 1)

(assert (not b!794895))

(assert (not b!794891))

(assert (not b!794889))

(assert (not b!794885))

(assert (not start!68400))

(assert (not b!794886))

(assert (not b!794890))

(assert (not b!794888))

(assert (not b!794887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

