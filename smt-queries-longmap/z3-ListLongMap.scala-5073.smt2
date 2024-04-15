; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68928 () Bool)

(assert start!68928)

(declare-fun b!804056 () Bool)

(declare-fun res!548715 () Bool)

(declare-fun e!445442 () Bool)

(assert (=> b!804056 (=> (not res!548715) (not e!445442))))

(declare-datatypes ((array!43735 0))(
  ( (array!43736 (arr!20948 (Array (_ BitVec 32) (_ BitVec 64))) (size!21369 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43735)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804056 (= res!548715 (validKeyInArray!0 (select (arr!20948 a!3170) j!153)))))

(declare-fun b!804057 () Bool)

(declare-fun e!445444 () Bool)

(assert (=> b!804057 (= e!445442 e!445444)))

(declare-fun res!548717 () Bool)

(assert (=> b!804057 (=> (not res!548717) (not e!445444))))

(declare-datatypes ((SeekEntryResult!8536 0))(
  ( (MissingZero!8536 (index!36512 (_ BitVec 32))) (Found!8536 (index!36513 (_ BitVec 32))) (Intermediate!8536 (undefined!9348 Bool) (index!36514 (_ BitVec 32)) (x!67353 (_ BitVec 32))) (Undefined!8536) (MissingVacant!8536 (index!36515 (_ BitVec 32))) )
))
(declare-fun lt!359876 () SeekEntryResult!8536)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804057 (= res!548717 (or (= lt!359876 (MissingZero!8536 i!1163)) (= lt!359876 (MissingVacant!8536 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43735 (_ BitVec 32)) SeekEntryResult!8536)

(assert (=> b!804057 (= lt!359876 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804058 () Bool)

(assert (=> b!804058 (= e!445444 false)))

(declare-fun lt!359875 () Bool)

(declare-datatypes ((List!14950 0))(
  ( (Nil!14947) (Cons!14946 (h!16075 (_ BitVec 64)) (t!21256 List!14950)) )
))
(declare-fun arrayNoDuplicates!0 (array!43735 (_ BitVec 32) List!14950) Bool)

(assert (=> b!804058 (= lt!359875 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14947))))

(declare-fun b!804059 () Bool)

(declare-fun res!548720 () Bool)

(assert (=> b!804059 (=> (not res!548720) (not e!445444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43735 (_ BitVec 32)) Bool)

(assert (=> b!804059 (= res!548720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804060 () Bool)

(declare-fun res!548719 () Bool)

(assert (=> b!804060 (=> (not res!548719) (not e!445442))))

(declare-fun arrayContainsKey!0 (array!43735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804060 (= res!548719 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548721 () Bool)

(assert (=> start!68928 (=> (not res!548721) (not e!445442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68928 (= res!548721 (validMask!0 mask!3266))))

(assert (=> start!68928 e!445442))

(assert (=> start!68928 true))

(declare-fun array_inv!16831 (array!43735) Bool)

(assert (=> start!68928 (array_inv!16831 a!3170)))

(declare-fun b!804061 () Bool)

(declare-fun res!548718 () Bool)

(assert (=> b!804061 (=> (not res!548718) (not e!445442))))

(assert (=> b!804061 (= res!548718 (validKeyInArray!0 k0!2044))))

(declare-fun b!804062 () Bool)

(declare-fun res!548716 () Bool)

(assert (=> b!804062 (=> (not res!548716) (not e!445442))))

(assert (=> b!804062 (= res!548716 (and (= (size!21369 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21369 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21369 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68928 res!548721) b!804062))

(assert (= (and b!804062 res!548716) b!804056))

(assert (= (and b!804056 res!548715) b!804061))

(assert (= (and b!804061 res!548718) b!804060))

(assert (= (and b!804060 res!548719) b!804057))

(assert (= (and b!804057 res!548717) b!804059))

(assert (= (and b!804059 res!548720) b!804058))

(declare-fun m!745459 () Bool)

(assert (=> b!804060 m!745459))

(declare-fun m!745461 () Bool)

(assert (=> b!804058 m!745461))

(declare-fun m!745463 () Bool)

(assert (=> b!804059 m!745463))

(declare-fun m!745465 () Bool)

(assert (=> b!804057 m!745465))

(declare-fun m!745467 () Bool)

(assert (=> b!804061 m!745467))

(declare-fun m!745469 () Bool)

(assert (=> b!804056 m!745469))

(assert (=> b!804056 m!745469))

(declare-fun m!745471 () Bool)

(assert (=> b!804056 m!745471))

(declare-fun m!745473 () Bool)

(assert (=> start!68928 m!745473))

(declare-fun m!745475 () Bool)

(assert (=> start!68928 m!745475))

(check-sat (not b!804059) (not b!804060) (not b!804056) (not b!804061) (not start!68928) (not b!804057) (not b!804058))
(check-sat)
