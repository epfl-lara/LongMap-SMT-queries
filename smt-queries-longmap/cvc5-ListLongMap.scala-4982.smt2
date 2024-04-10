; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68402 () Bool)

(assert start!68402)

(declare-fun b!794916 () Bool)

(declare-fun res!539444 () Bool)

(declare-fun e!441297 () Bool)

(assert (=> b!794916 (=> (not res!539444) (not e!441297))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43192 0))(
  ( (array!43193 (arr!20676 (Array (_ BitVec 32) (_ BitVec 64))) (size!21097 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43192)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794916 (= res!539444 (and (= (size!21097 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21097 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21097 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794917 () Bool)

(declare-fun res!539439 () Bool)

(declare-fun e!441299 () Bool)

(assert (=> b!794917 (=> (not res!539439) (not e!441299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43192 (_ BitVec 32)) Bool)

(assert (=> b!794917 (= res!539439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794918 () Bool)

(declare-fun res!539440 () Bool)

(assert (=> b!794918 (=> (not res!539440) (not e!441299))))

(declare-datatypes ((List!14639 0))(
  ( (Nil!14636) (Cons!14635 (h!15764 (_ BitVec 64)) (t!20954 List!14639)) )
))
(declare-fun arrayNoDuplicates!0 (array!43192 (_ BitVec 32) List!14639) Bool)

(assert (=> b!794918 (= res!539440 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14636))))

(declare-fun b!794919 () Bool)

(declare-fun res!539435 () Bool)

(assert (=> b!794919 (=> (not res!539435) (not e!441299))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794919 (= res!539435 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21097 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20676 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21097 a!3170)) (= (select (arr!20676 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794920 () Bool)

(declare-fun res!539437 () Bool)

(assert (=> b!794920 (=> (not res!539437) (not e!441297))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794920 (= res!539437 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794921 () Bool)

(declare-fun res!539441 () Bool)

(assert (=> b!794921 (=> (not res!539441) (not e!441297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794921 (= res!539441 (validKeyInArray!0 k!2044))))

(declare-fun res!539436 () Bool)

(assert (=> start!68402 (=> (not res!539436) (not e!441297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68402 (= res!539436 (validMask!0 mask!3266))))

(assert (=> start!68402 e!441297))

(assert (=> start!68402 true))

(declare-fun array_inv!16472 (array!43192) Bool)

(assert (=> start!68402 (array_inv!16472 a!3170)))

(declare-fun b!794922 () Bool)

(declare-fun e!441298 () Bool)

(assert (=> b!794922 (= e!441298 false)))

(declare-datatypes ((SeekEntryResult!8267 0))(
  ( (MissingZero!8267 (index!35436 (_ BitVec 32))) (Found!8267 (index!35437 (_ BitVec 32))) (Intermediate!8267 (undefined!9079 Bool) (index!35438 (_ BitVec 32)) (x!66361 (_ BitVec 32))) (Undefined!8267) (MissingVacant!8267 (index!35439 (_ BitVec 32))) )
))
(declare-fun lt!354337 () SeekEntryResult!8267)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43192 (_ BitVec 32)) SeekEntryResult!8267)

(assert (=> b!794922 (= lt!354337 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20676 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354335 () SeekEntryResult!8267)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43192 (_ BitVec 32)) SeekEntryResult!8267)

(assert (=> b!794922 (= lt!354335 (seekEntryOrOpen!0 (select (arr!20676 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794923 () Bool)

(declare-fun res!539443 () Bool)

(assert (=> b!794923 (=> (not res!539443) (not e!441297))))

(assert (=> b!794923 (= res!539443 (validKeyInArray!0 (select (arr!20676 a!3170) j!153)))))

(declare-fun b!794924 () Bool)

(assert (=> b!794924 (= e!441297 e!441299)))

(declare-fun res!539438 () Bool)

(assert (=> b!794924 (=> (not res!539438) (not e!441299))))

(declare-fun lt!354338 () SeekEntryResult!8267)

(assert (=> b!794924 (= res!539438 (or (= lt!354338 (MissingZero!8267 i!1163)) (= lt!354338 (MissingVacant!8267 i!1163))))))

(assert (=> b!794924 (= lt!354338 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794925 () Bool)

(assert (=> b!794925 (= e!441299 e!441298)))

(declare-fun res!539442 () Bool)

(assert (=> b!794925 (=> (not res!539442) (not e!441298))))

(declare-fun lt!354336 () array!43192)

(declare-fun lt!354334 () (_ BitVec 64))

(assert (=> b!794925 (= res!539442 (= (seekEntryOrOpen!0 lt!354334 lt!354336 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354334 lt!354336 mask!3266)))))

(assert (=> b!794925 (= lt!354334 (select (store (arr!20676 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794925 (= lt!354336 (array!43193 (store (arr!20676 a!3170) i!1163 k!2044) (size!21097 a!3170)))))

(assert (= (and start!68402 res!539436) b!794916))

(assert (= (and b!794916 res!539444) b!794923))

(assert (= (and b!794923 res!539443) b!794921))

(assert (= (and b!794921 res!539441) b!794920))

(assert (= (and b!794920 res!539437) b!794924))

(assert (= (and b!794924 res!539438) b!794917))

(assert (= (and b!794917 res!539439) b!794918))

(assert (= (and b!794918 res!539440) b!794919))

(assert (= (and b!794919 res!539435) b!794925))

(assert (= (and b!794925 res!539442) b!794922))

(declare-fun m!735491 () Bool)

(assert (=> b!794918 m!735491))

(declare-fun m!735493 () Bool)

(assert (=> b!794923 m!735493))

(assert (=> b!794923 m!735493))

(declare-fun m!735495 () Bool)

(assert (=> b!794923 m!735495))

(declare-fun m!735497 () Bool)

(assert (=> start!68402 m!735497))

(declare-fun m!735499 () Bool)

(assert (=> start!68402 m!735499))

(declare-fun m!735501 () Bool)

(assert (=> b!794919 m!735501))

(declare-fun m!735503 () Bool)

(assert (=> b!794919 m!735503))

(declare-fun m!735505 () Bool)

(assert (=> b!794921 m!735505))

(declare-fun m!735507 () Bool)

(assert (=> b!794924 m!735507))

(declare-fun m!735509 () Bool)

(assert (=> b!794917 m!735509))

(declare-fun m!735511 () Bool)

(assert (=> b!794925 m!735511))

(declare-fun m!735513 () Bool)

(assert (=> b!794925 m!735513))

(declare-fun m!735515 () Bool)

(assert (=> b!794925 m!735515))

(declare-fun m!735517 () Bool)

(assert (=> b!794925 m!735517))

(assert (=> b!794922 m!735493))

(assert (=> b!794922 m!735493))

(declare-fun m!735519 () Bool)

(assert (=> b!794922 m!735519))

(assert (=> b!794922 m!735493))

(declare-fun m!735521 () Bool)

(assert (=> b!794922 m!735521))

(declare-fun m!735523 () Bool)

(assert (=> b!794920 m!735523))

(push 1)

(assert (not b!794920))

(assert (not b!794923))

(assert (not b!794921))

(assert (not b!794925))

(assert (not b!794922))

(assert (not start!68402))

(assert (not b!794918))

(assert (not b!794924))

(assert (not b!794917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

