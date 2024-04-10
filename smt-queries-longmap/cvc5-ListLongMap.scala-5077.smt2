; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68972 () Bool)

(assert start!68972)

(declare-fun b!804558 () Bool)

(declare-fun res!549077 () Bool)

(declare-fun e!445705 () Bool)

(assert (=> b!804558 (=> (not res!549077) (not e!445705))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804558 (= res!549077 (validKeyInArray!0 k!2044))))

(declare-fun b!804559 () Bool)

(declare-fun res!549082 () Bool)

(assert (=> b!804559 (=> (not res!549082) (not e!445705))))

(declare-datatypes ((array!43762 0))(
  ( (array!43763 (arr!20961 (Array (_ BitVec 32) (_ BitVec 64))) (size!21382 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43762)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804559 (= res!549082 (validKeyInArray!0 (select (arr!20961 a!3170) j!153)))))

(declare-fun b!804560 () Bool)

(declare-fun e!445704 () Bool)

(assert (=> b!804560 (= e!445705 e!445704)))

(declare-fun res!549080 () Bool)

(assert (=> b!804560 (=> (not res!549080) (not e!445704))))

(declare-datatypes ((SeekEntryResult!8552 0))(
  ( (MissingZero!8552 (index!36576 (_ BitVec 32))) (Found!8552 (index!36577 (_ BitVec 32))) (Intermediate!8552 (undefined!9364 Bool) (index!36578 (_ BitVec 32)) (x!67406 (_ BitVec 32))) (Undefined!8552) (MissingVacant!8552 (index!36579 (_ BitVec 32))) )
))
(declare-fun lt!360188 () SeekEntryResult!8552)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804560 (= res!549080 (or (= lt!360188 (MissingZero!8552 i!1163)) (= lt!360188 (MissingVacant!8552 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43762 (_ BitVec 32)) SeekEntryResult!8552)

(assert (=> b!804560 (= lt!360188 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804562 () Bool)

(declare-fun res!549078 () Bool)

(assert (=> b!804562 (=> (not res!549078) (not e!445704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43762 (_ BitVec 32)) Bool)

(assert (=> b!804562 (= res!549078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549079 () Bool)

(assert (=> start!68972 (=> (not res!549079) (not e!445705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68972 (= res!549079 (validMask!0 mask!3266))))

(assert (=> start!68972 e!445705))

(assert (=> start!68972 true))

(declare-fun array_inv!16757 (array!43762) Bool)

(assert (=> start!68972 (array_inv!16757 a!3170)))

(declare-fun b!804561 () Bool)

(assert (=> b!804561 (= e!445704 false)))

(declare-fun lt!360187 () Bool)

(declare-datatypes ((List!14924 0))(
  ( (Nil!14921) (Cons!14920 (h!16049 (_ BitVec 64)) (t!21239 List!14924)) )
))
(declare-fun arrayNoDuplicates!0 (array!43762 (_ BitVec 32) List!14924) Bool)

(assert (=> b!804561 (= lt!360187 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14921))))

(declare-fun b!804563 () Bool)

(declare-fun res!549081 () Bool)

(assert (=> b!804563 (=> (not res!549081) (not e!445705))))

(assert (=> b!804563 (= res!549081 (and (= (size!21382 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21382 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21382 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804564 () Bool)

(declare-fun res!549083 () Bool)

(assert (=> b!804564 (=> (not res!549083) (not e!445705))))

(declare-fun arrayContainsKey!0 (array!43762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804564 (= res!549083 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68972 res!549079) b!804563))

(assert (= (and b!804563 res!549081) b!804559))

(assert (= (and b!804559 res!549082) b!804558))

(assert (= (and b!804558 res!549077) b!804564))

(assert (= (and b!804564 res!549083) b!804560))

(assert (= (and b!804560 res!549080) b!804562))

(assert (= (and b!804562 res!549078) b!804561))

(declare-fun m!746417 () Bool)

(assert (=> start!68972 m!746417))

(declare-fun m!746419 () Bool)

(assert (=> start!68972 m!746419))

(declare-fun m!746421 () Bool)

(assert (=> b!804561 m!746421))

(declare-fun m!746423 () Bool)

(assert (=> b!804559 m!746423))

(assert (=> b!804559 m!746423))

(declare-fun m!746425 () Bool)

(assert (=> b!804559 m!746425))

(declare-fun m!746427 () Bool)

(assert (=> b!804564 m!746427))

(declare-fun m!746429 () Bool)

(assert (=> b!804562 m!746429))

(declare-fun m!746431 () Bool)

(assert (=> b!804558 m!746431))

(declare-fun m!746433 () Bool)

(assert (=> b!804560 m!746433))

(push 1)

