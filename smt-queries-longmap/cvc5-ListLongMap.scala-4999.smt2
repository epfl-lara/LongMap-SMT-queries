; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68504 () Bool)

(assert start!68504)

(declare-fun b!796511 () Bool)

(declare-fun res!541036 () Bool)

(declare-fun e!441965 () Bool)

(assert (=> b!796511 (=> (not res!541036) (not e!441965))))

(declare-datatypes ((array!43294 0))(
  ( (array!43295 (arr!20727 (Array (_ BitVec 32) (_ BitVec 64))) (size!21148 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43294)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796511 (= res!541036 (validKeyInArray!0 (select (arr!20727 a!3170) j!153)))))

(declare-fun b!796512 () Bool)

(declare-fun res!541038 () Bool)

(declare-fun e!441968 () Bool)

(assert (=> b!796512 (=> (not res!541038) (not e!441968))))

(declare-datatypes ((List!14690 0))(
  ( (Nil!14687) (Cons!14686 (h!15815 (_ BitVec 64)) (t!21005 List!14690)) )
))
(declare-fun arrayNoDuplicates!0 (array!43294 (_ BitVec 32) List!14690) Bool)

(assert (=> b!796512 (= res!541038 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14687))))

(declare-fun b!796513 () Bool)

(assert (=> b!796513 (= e!441965 e!441968)))

(declare-fun res!541032 () Bool)

(assert (=> b!796513 (=> (not res!541032) (not e!441968))))

(declare-datatypes ((SeekEntryResult!8318 0))(
  ( (MissingZero!8318 (index!35640 (_ BitVec 32))) (Found!8318 (index!35641 (_ BitVec 32))) (Intermediate!8318 (undefined!9130 Bool) (index!35642 (_ BitVec 32)) (x!66548 (_ BitVec 32))) (Undefined!8318) (MissingVacant!8318 (index!35643 (_ BitVec 32))) )
))
(declare-fun lt!355176 () SeekEntryResult!8318)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796513 (= res!541032 (or (= lt!355176 (MissingZero!8318 i!1163)) (= lt!355176 (MissingVacant!8318 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43294 (_ BitVec 32)) SeekEntryResult!8318)

(assert (=> b!796513 (= lt!355176 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796514 () Bool)

(declare-fun e!441964 () Bool)

(assert (=> b!796514 (= e!441968 e!441964)))

(declare-fun res!541037 () Bool)

(assert (=> b!796514 (=> (not res!541037) (not e!441964))))

(declare-fun lt!355178 () SeekEntryResult!8318)

(declare-fun lt!355181 () SeekEntryResult!8318)

(assert (=> b!796514 (= res!541037 (= lt!355178 lt!355181))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355177 () (_ BitVec 64))

(declare-fun lt!355175 () array!43294)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43294 (_ BitVec 32)) SeekEntryResult!8318)

(assert (=> b!796514 (= lt!355181 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355177 lt!355175 mask!3266))))

(assert (=> b!796514 (= lt!355178 (seekEntryOrOpen!0 lt!355177 lt!355175 mask!3266))))

(assert (=> b!796514 (= lt!355177 (select (store (arr!20727 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796514 (= lt!355175 (array!43295 (store (arr!20727 a!3170) i!1163 k!2044) (size!21148 a!3170)))))

(declare-fun b!796515 () Bool)

(declare-fun e!441966 () Bool)

(assert (=> b!796515 (= e!441966 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!796515 (= lt!355181 (Found!8318 index!1236))))

(declare-fun b!796516 () Bool)

(declare-fun res!541035 () Bool)

(assert (=> b!796516 (=> (not res!541035) (not e!441965))))

(assert (=> b!796516 (= res!541035 (validKeyInArray!0 k!2044))))

(declare-fun b!796517 () Bool)

(declare-fun res!541034 () Bool)

(assert (=> b!796517 (=> (not res!541034) (not e!441968))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796517 (= res!541034 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21148 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20727 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21148 a!3170)) (= (select (arr!20727 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796518 () Bool)

(declare-fun res!541033 () Bool)

(assert (=> b!796518 (=> (not res!541033) (not e!441968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43294 (_ BitVec 32)) Bool)

(assert (=> b!796518 (= res!541033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541040 () Bool)

(assert (=> start!68504 (=> (not res!541040) (not e!441965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68504 (= res!541040 (validMask!0 mask!3266))))

(assert (=> start!68504 e!441965))

(assert (=> start!68504 true))

(declare-fun array_inv!16523 (array!43294) Bool)

(assert (=> start!68504 (array_inv!16523 a!3170)))

(declare-fun b!796519 () Bool)

(declare-fun res!541030 () Bool)

(assert (=> b!796519 (=> (not res!541030) (not e!441965))))

(declare-fun arrayContainsKey!0 (array!43294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796519 (= res!541030 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796520 () Bool)

(declare-fun res!541031 () Bool)

(assert (=> b!796520 (=> (not res!541031) (not e!441965))))

(assert (=> b!796520 (= res!541031 (and (= (size!21148 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21148 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21148 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796521 () Bool)

(assert (=> b!796521 (= e!441964 e!441966)))

(declare-fun res!541039 () Bool)

(assert (=> b!796521 (=> (not res!541039) (not e!441966))))

(declare-fun lt!355180 () SeekEntryResult!8318)

(declare-fun lt!355179 () SeekEntryResult!8318)

(assert (=> b!796521 (= res!541039 (and (= lt!355179 lt!355180) (= lt!355180 (Found!8318 j!153)) (= (select (arr!20727 a!3170) index!1236) (select (arr!20727 a!3170) j!153))))))

(assert (=> b!796521 (= lt!355180 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20727 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796521 (= lt!355179 (seekEntryOrOpen!0 (select (arr!20727 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68504 res!541040) b!796520))

(assert (= (and b!796520 res!541031) b!796511))

(assert (= (and b!796511 res!541036) b!796516))

(assert (= (and b!796516 res!541035) b!796519))

(assert (= (and b!796519 res!541030) b!796513))

(assert (= (and b!796513 res!541032) b!796518))

(assert (= (and b!796518 res!541033) b!796512))

(assert (= (and b!796512 res!541038) b!796517))

(assert (= (and b!796517 res!541034) b!796514))

(assert (= (and b!796514 res!541037) b!796521))

(assert (= (and b!796521 res!541039) b!796515))

(declare-fun m!737303 () Bool)

(assert (=> b!796516 m!737303))

(declare-fun m!737305 () Bool)

(assert (=> b!796511 m!737305))

(assert (=> b!796511 m!737305))

(declare-fun m!737307 () Bool)

(assert (=> b!796511 m!737307))

(declare-fun m!737309 () Bool)

(assert (=> b!796514 m!737309))

(declare-fun m!737311 () Bool)

(assert (=> b!796514 m!737311))

(declare-fun m!737313 () Bool)

(assert (=> b!796514 m!737313))

(declare-fun m!737315 () Bool)

(assert (=> b!796514 m!737315))

(declare-fun m!737317 () Bool)

(assert (=> b!796513 m!737317))

(declare-fun m!737319 () Bool)

(assert (=> start!68504 m!737319))

(declare-fun m!737321 () Bool)

(assert (=> start!68504 m!737321))

(declare-fun m!737323 () Bool)

(assert (=> b!796521 m!737323))

(assert (=> b!796521 m!737305))

(assert (=> b!796521 m!737305))

(declare-fun m!737325 () Bool)

(assert (=> b!796521 m!737325))

(assert (=> b!796521 m!737305))

(declare-fun m!737327 () Bool)

(assert (=> b!796521 m!737327))

(declare-fun m!737329 () Bool)

(assert (=> b!796518 m!737329))

(declare-fun m!737331 () Bool)

(assert (=> b!796512 m!737331))

(declare-fun m!737333 () Bool)

(assert (=> b!796519 m!737333))

(declare-fun m!737335 () Bool)

(assert (=> b!796517 m!737335))

(declare-fun m!737337 () Bool)

(assert (=> b!796517 m!737337))

(push 1)

(assert (not b!796512))

(assert (not b!796511))

(assert (not b!796521))

(assert (not b!796519))

(assert (not b!796514))

(assert (not b!796513))

(assert (not b!796518))

(assert (not start!68504))

(assert (not b!796516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

