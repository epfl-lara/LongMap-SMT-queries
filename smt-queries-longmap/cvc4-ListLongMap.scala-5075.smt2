; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68964 () Bool)

(assert start!68964)

(declare-fun b!804474 () Bool)

(declare-fun res!548999 () Bool)

(declare-fun e!445670 () Bool)

(assert (=> b!804474 (=> (not res!548999) (not e!445670))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804474 (= res!548999 (validKeyInArray!0 k!2044))))

(declare-fun res!548993 () Bool)

(assert (=> start!68964 (=> (not res!548993) (not e!445670))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68964 (= res!548993 (validMask!0 mask!3266))))

(assert (=> start!68964 e!445670))

(assert (=> start!68964 true))

(declare-datatypes ((array!43754 0))(
  ( (array!43755 (arr!20957 (Array (_ BitVec 32) (_ BitVec 64))) (size!21378 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43754)

(declare-fun array_inv!16753 (array!43754) Bool)

(assert (=> start!68964 (array_inv!16753 a!3170)))

(declare-fun b!804475 () Bool)

(declare-fun res!548998 () Bool)

(assert (=> b!804475 (=> (not res!548998) (not e!445670))))

(declare-fun arrayContainsKey!0 (array!43754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804475 (= res!548998 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804476 () Bool)

(declare-fun e!445668 () Bool)

(assert (=> b!804476 (= e!445670 e!445668)))

(declare-fun res!548997 () Bool)

(assert (=> b!804476 (=> (not res!548997) (not e!445668))))

(declare-datatypes ((SeekEntryResult!8548 0))(
  ( (MissingZero!8548 (index!36560 (_ BitVec 32))) (Found!8548 (index!36561 (_ BitVec 32))) (Intermediate!8548 (undefined!9360 Bool) (index!36562 (_ BitVec 32)) (x!67386 (_ BitVec 32))) (Undefined!8548) (MissingVacant!8548 (index!36563 (_ BitVec 32))) )
))
(declare-fun lt!360164 () SeekEntryResult!8548)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804476 (= res!548997 (or (= lt!360164 (MissingZero!8548 i!1163)) (= lt!360164 (MissingVacant!8548 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43754 (_ BitVec 32)) SeekEntryResult!8548)

(assert (=> b!804476 (= lt!360164 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804477 () Bool)

(declare-fun res!548996 () Bool)

(assert (=> b!804477 (=> (not res!548996) (not e!445670))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804477 (= res!548996 (and (= (size!21378 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21378 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21378 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804478 () Bool)

(declare-fun res!548994 () Bool)

(assert (=> b!804478 (=> (not res!548994) (not e!445670))))

(assert (=> b!804478 (= res!548994 (validKeyInArray!0 (select (arr!20957 a!3170) j!153)))))

(declare-fun b!804479 () Bool)

(declare-fun res!548995 () Bool)

(assert (=> b!804479 (=> (not res!548995) (not e!445668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43754 (_ BitVec 32)) Bool)

(assert (=> b!804479 (= res!548995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804480 () Bool)

(assert (=> b!804480 (= e!445668 false)))

(declare-fun lt!360163 () Bool)

(declare-datatypes ((List!14920 0))(
  ( (Nil!14917) (Cons!14916 (h!16045 (_ BitVec 64)) (t!21235 List!14920)) )
))
(declare-fun arrayNoDuplicates!0 (array!43754 (_ BitVec 32) List!14920) Bool)

(assert (=> b!804480 (= lt!360163 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14917))))

(assert (= (and start!68964 res!548993) b!804477))

(assert (= (and b!804477 res!548996) b!804478))

(assert (= (and b!804478 res!548994) b!804474))

(assert (= (and b!804474 res!548999) b!804475))

(assert (= (and b!804475 res!548998) b!804476))

(assert (= (and b!804476 res!548997) b!804479))

(assert (= (and b!804479 res!548995) b!804480))

(declare-fun m!746345 () Bool)

(assert (=> b!804476 m!746345))

(declare-fun m!746347 () Bool)

(assert (=> b!804478 m!746347))

(assert (=> b!804478 m!746347))

(declare-fun m!746349 () Bool)

(assert (=> b!804478 m!746349))

(declare-fun m!746351 () Bool)

(assert (=> b!804479 m!746351))

(declare-fun m!746353 () Bool)

(assert (=> b!804474 m!746353))

(declare-fun m!746355 () Bool)

(assert (=> b!804480 m!746355))

(declare-fun m!746357 () Bool)

(assert (=> b!804475 m!746357))

(declare-fun m!746359 () Bool)

(assert (=> start!68964 m!746359))

(declare-fun m!746361 () Bool)

(assert (=> start!68964 m!746361))

(push 1)

(assert (not b!804480))

