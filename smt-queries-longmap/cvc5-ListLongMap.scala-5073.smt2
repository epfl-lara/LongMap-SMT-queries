; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68948 () Bool)

(assert start!68948)

(declare-fun b!804306 () Bool)

(declare-fun res!548825 () Bool)

(declare-fun e!445597 () Bool)

(assert (=> b!804306 (=> (not res!548825) (not e!445597))))

(declare-datatypes ((array!43738 0))(
  ( (array!43739 (arr!20949 (Array (_ BitVec 32) (_ BitVec 64))) (size!21370 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43738)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804306 (= res!548825 (validKeyInArray!0 (select (arr!20949 a!3170) j!153)))))

(declare-fun b!804307 () Bool)

(declare-fun res!548826 () Bool)

(assert (=> b!804307 (=> (not res!548826) (not e!445597))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804307 (= res!548826 (and (= (size!21370 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21370 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21370 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804308 () Bool)

(declare-fun e!445598 () Bool)

(assert (=> b!804308 (= e!445598 false)))

(declare-fun lt!360115 () Bool)

(declare-datatypes ((List!14912 0))(
  ( (Nil!14909) (Cons!14908 (h!16037 (_ BitVec 64)) (t!21227 List!14912)) )
))
(declare-fun arrayNoDuplicates!0 (array!43738 (_ BitVec 32) List!14912) Bool)

(assert (=> b!804308 (= lt!360115 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14909))))

(declare-fun b!804309 () Bool)

(declare-fun res!548829 () Bool)

(assert (=> b!804309 (=> (not res!548829) (not e!445597))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!804309 (= res!548829 (validKeyInArray!0 k!2044))))

(declare-fun b!804310 () Bool)

(declare-fun res!548830 () Bool)

(assert (=> b!804310 (=> (not res!548830) (not e!445598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43738 (_ BitVec 32)) Bool)

(assert (=> b!804310 (= res!548830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548828 () Bool)

(assert (=> start!68948 (=> (not res!548828) (not e!445597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68948 (= res!548828 (validMask!0 mask!3266))))

(assert (=> start!68948 e!445597))

(assert (=> start!68948 true))

(declare-fun array_inv!16745 (array!43738) Bool)

(assert (=> start!68948 (array_inv!16745 a!3170)))

(declare-fun b!804311 () Bool)

(assert (=> b!804311 (= e!445597 e!445598)))

(declare-fun res!548831 () Bool)

(assert (=> b!804311 (=> (not res!548831) (not e!445598))))

(declare-datatypes ((SeekEntryResult!8540 0))(
  ( (MissingZero!8540 (index!36528 (_ BitVec 32))) (Found!8540 (index!36529 (_ BitVec 32))) (Intermediate!8540 (undefined!9352 Bool) (index!36530 (_ BitVec 32)) (x!67362 (_ BitVec 32))) (Undefined!8540) (MissingVacant!8540 (index!36531 (_ BitVec 32))) )
))
(declare-fun lt!360116 () SeekEntryResult!8540)

(assert (=> b!804311 (= res!548831 (or (= lt!360116 (MissingZero!8540 i!1163)) (= lt!360116 (MissingVacant!8540 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43738 (_ BitVec 32)) SeekEntryResult!8540)

(assert (=> b!804311 (= lt!360116 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804312 () Bool)

(declare-fun res!548827 () Bool)

(assert (=> b!804312 (=> (not res!548827) (not e!445597))))

(declare-fun arrayContainsKey!0 (array!43738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804312 (= res!548827 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68948 res!548828) b!804307))

(assert (= (and b!804307 res!548826) b!804306))

(assert (= (and b!804306 res!548825) b!804309))

(assert (= (and b!804309 res!548829) b!804312))

(assert (= (and b!804312 res!548827) b!804311))

(assert (= (and b!804311 res!548831) b!804310))

(assert (= (and b!804310 res!548830) b!804308))

(declare-fun m!746201 () Bool)

(assert (=> start!68948 m!746201))

(declare-fun m!746203 () Bool)

(assert (=> start!68948 m!746203))

(declare-fun m!746205 () Bool)

(assert (=> b!804309 m!746205))

(declare-fun m!746207 () Bool)

(assert (=> b!804308 m!746207))

(declare-fun m!746209 () Bool)

(assert (=> b!804312 m!746209))

(declare-fun m!746211 () Bool)

(assert (=> b!804310 m!746211))

(declare-fun m!746213 () Bool)

(assert (=> b!804311 m!746213))

(declare-fun m!746215 () Bool)

(assert (=> b!804306 m!746215))

(assert (=> b!804306 m!746215))

(declare-fun m!746217 () Bool)

(assert (=> b!804306 m!746217))

(push 1)

