; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68940 () Bool)

(assert start!68940)

(declare-fun b!804222 () Bool)

(declare-fun res!548744 () Bool)

(declare-fun e!445560 () Bool)

(assert (=> b!804222 (=> (not res!548744) (not e!445560))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804222 (= res!548744 (validKeyInArray!0 k!2044))))

(declare-fun b!804223 () Bool)

(declare-fun res!548741 () Bool)

(assert (=> b!804223 (=> (not res!548741) (not e!445560))))

(declare-datatypes ((array!43730 0))(
  ( (array!43731 (arr!20945 (Array (_ BitVec 32) (_ BitVec 64))) (size!21366 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43730)

(declare-fun arrayContainsKey!0 (array!43730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804223 (= res!548741 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804224 () Bool)

(declare-fun res!548743 () Bool)

(assert (=> b!804224 (=> (not res!548743) (not e!445560))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804224 (= res!548743 (validKeyInArray!0 (select (arr!20945 a!3170) j!153)))))

(declare-fun b!804225 () Bool)

(declare-fun res!548746 () Bool)

(assert (=> b!804225 (=> (not res!548746) (not e!445560))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804225 (= res!548746 (and (= (size!21366 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21366 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21366 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804226 () Bool)

(declare-fun e!445561 () Bool)

(assert (=> b!804226 (= e!445560 e!445561)))

(declare-fun res!548745 () Bool)

(assert (=> b!804226 (=> (not res!548745) (not e!445561))))

(declare-datatypes ((SeekEntryResult!8536 0))(
  ( (MissingZero!8536 (index!36512 (_ BitVec 32))) (Found!8536 (index!36513 (_ BitVec 32))) (Intermediate!8536 (undefined!9348 Bool) (index!36514 (_ BitVec 32)) (x!67342 (_ BitVec 32))) (Undefined!8536) (MissingVacant!8536 (index!36515 (_ BitVec 32))) )
))
(declare-fun lt!360091 () SeekEntryResult!8536)

(assert (=> b!804226 (= res!548745 (or (= lt!360091 (MissingZero!8536 i!1163)) (= lt!360091 (MissingVacant!8536 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43730 (_ BitVec 32)) SeekEntryResult!8536)

(assert (=> b!804226 (= lt!360091 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!548742 () Bool)

(assert (=> start!68940 (=> (not res!548742) (not e!445560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68940 (= res!548742 (validMask!0 mask!3266))))

(assert (=> start!68940 e!445560))

(assert (=> start!68940 true))

(declare-fun array_inv!16741 (array!43730) Bool)

(assert (=> start!68940 (array_inv!16741 a!3170)))

(declare-fun b!804227 () Bool)

(declare-fun res!548747 () Bool)

(assert (=> b!804227 (=> (not res!548747) (not e!445561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43730 (_ BitVec 32)) Bool)

(assert (=> b!804227 (= res!548747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804228 () Bool)

(assert (=> b!804228 (= e!445561 false)))

(declare-fun lt!360092 () Bool)

(declare-datatypes ((List!14908 0))(
  ( (Nil!14905) (Cons!14904 (h!16033 (_ BitVec 64)) (t!21223 List!14908)) )
))
(declare-fun arrayNoDuplicates!0 (array!43730 (_ BitVec 32) List!14908) Bool)

(assert (=> b!804228 (= lt!360092 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14905))))

(assert (= (and start!68940 res!548742) b!804225))

(assert (= (and b!804225 res!548746) b!804224))

(assert (= (and b!804224 res!548743) b!804222))

(assert (= (and b!804222 res!548744) b!804223))

(assert (= (and b!804223 res!548741) b!804226))

(assert (= (and b!804226 res!548745) b!804227))

(assert (= (and b!804227 res!548747) b!804228))

(declare-fun m!746129 () Bool)

(assert (=> start!68940 m!746129))

(declare-fun m!746131 () Bool)

(assert (=> start!68940 m!746131))

(declare-fun m!746133 () Bool)

(assert (=> b!804227 m!746133))

(declare-fun m!746135 () Bool)

(assert (=> b!804223 m!746135))

(declare-fun m!746137 () Bool)

(assert (=> b!804226 m!746137))

(declare-fun m!746139 () Bool)

(assert (=> b!804228 m!746139))

(declare-fun m!746141 () Bool)

(assert (=> b!804224 m!746141))

(assert (=> b!804224 m!746141))

(declare-fun m!746143 () Bool)

(assert (=> b!804224 m!746143))

(declare-fun m!746145 () Bool)

(assert (=> b!804222 m!746145))

(push 1)

(assert (not b!804223))

(assert (not b!804222))

(assert (not b!804224))

(assert (not b!804226))

(assert (not b!804228))

(assert (not b!804227))

(assert (not start!68940))

