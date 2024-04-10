; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68976 () Bool)

(assert start!68976)

(declare-fun b!804600 () Bool)

(declare-fun res!549119 () Bool)

(declare-fun e!445723 () Bool)

(assert (=> b!804600 (=> (not res!549119) (not e!445723))))

(declare-datatypes ((array!43766 0))(
  ( (array!43767 (arr!20963 (Array (_ BitVec 32) (_ BitVec 64))) (size!21384 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43766)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43766 (_ BitVec 32)) Bool)

(assert (=> b!804600 (= res!549119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804601 () Bool)

(assert (=> b!804601 (= e!445723 false)))

(declare-fun lt!360199 () Bool)

(declare-datatypes ((List!14926 0))(
  ( (Nil!14923) (Cons!14922 (h!16051 (_ BitVec 64)) (t!21241 List!14926)) )
))
(declare-fun arrayNoDuplicates!0 (array!43766 (_ BitVec 32) List!14926) Bool)

(assert (=> b!804601 (= lt!360199 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14923))))

(declare-fun b!804602 () Bool)

(declare-fun e!445722 () Bool)

(assert (=> b!804602 (= e!445722 e!445723)))

(declare-fun res!549121 () Bool)

(assert (=> b!804602 (=> (not res!549121) (not e!445723))))

(declare-datatypes ((SeekEntryResult!8554 0))(
  ( (MissingZero!8554 (index!36584 (_ BitVec 32))) (Found!8554 (index!36585 (_ BitVec 32))) (Intermediate!8554 (undefined!9366 Bool) (index!36586 (_ BitVec 32)) (x!67408 (_ BitVec 32))) (Undefined!8554) (MissingVacant!8554 (index!36587 (_ BitVec 32))) )
))
(declare-fun lt!360200 () SeekEntryResult!8554)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804602 (= res!549121 (or (= lt!360200 (MissingZero!8554 i!1163)) (= lt!360200 (MissingVacant!8554 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43766 (_ BitVec 32)) SeekEntryResult!8554)

(assert (=> b!804602 (= lt!360200 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804603 () Bool)

(declare-fun res!549123 () Bool)

(assert (=> b!804603 (=> (not res!549123) (not e!445722))))

(declare-fun arrayContainsKey!0 (array!43766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804603 (= res!549123 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804604 () Bool)

(declare-fun res!549122 () Bool)

(assert (=> b!804604 (=> (not res!549122) (not e!445722))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804604 (= res!549122 (validKeyInArray!0 (select (arr!20963 a!3170) j!153)))))

(declare-fun b!804606 () Bool)

(declare-fun res!549125 () Bool)

(assert (=> b!804606 (=> (not res!549125) (not e!445722))))

(assert (=> b!804606 (= res!549125 (validKeyInArray!0 k!2044))))

(declare-fun b!804605 () Bool)

(declare-fun res!549124 () Bool)

(assert (=> b!804605 (=> (not res!549124) (not e!445722))))

(assert (=> b!804605 (= res!549124 (and (= (size!21384 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21384 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21384 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!549120 () Bool)

(assert (=> start!68976 (=> (not res!549120) (not e!445722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68976 (= res!549120 (validMask!0 mask!3266))))

(assert (=> start!68976 e!445722))

(assert (=> start!68976 true))

(declare-fun array_inv!16759 (array!43766) Bool)

(assert (=> start!68976 (array_inv!16759 a!3170)))

(assert (= (and start!68976 res!549120) b!804605))

(assert (= (and b!804605 res!549124) b!804604))

(assert (= (and b!804604 res!549122) b!804606))

(assert (= (and b!804606 res!549125) b!804603))

(assert (= (and b!804603 res!549123) b!804602))

(assert (= (and b!804602 res!549121) b!804600))

(assert (= (and b!804600 res!549119) b!804601))

(declare-fun m!746453 () Bool)

(assert (=> b!804601 m!746453))

(declare-fun m!746455 () Bool)

(assert (=> b!804600 m!746455))

(declare-fun m!746457 () Bool)

(assert (=> b!804603 m!746457))

(declare-fun m!746459 () Bool)

(assert (=> b!804604 m!746459))

(assert (=> b!804604 m!746459))

(declare-fun m!746461 () Bool)

(assert (=> b!804604 m!746461))

(declare-fun m!746463 () Bool)

(assert (=> b!804606 m!746463))

(declare-fun m!746465 () Bool)

(assert (=> b!804602 m!746465))

(declare-fun m!746467 () Bool)

(assert (=> start!68976 m!746467))

(declare-fun m!746469 () Bool)

(assert (=> start!68976 m!746469))

(push 1)

(assert (not b!804604))

(assert (not b!804600))

(assert (not b!804603))

(assert (not start!68976))

(assert (not b!804602))

