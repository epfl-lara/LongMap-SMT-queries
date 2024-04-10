; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68960 () Bool)

(assert start!68960)

(declare-fun b!804432 () Bool)

(declare-fun res!548957 () Bool)

(declare-fun e!445652 () Bool)

(assert (=> b!804432 (=> (not res!548957) (not e!445652))))

(declare-datatypes ((array!43750 0))(
  ( (array!43751 (arr!20955 (Array (_ BitVec 32) (_ BitVec 64))) (size!21376 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43750)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804432 (= res!548957 (validKeyInArray!0 (select (arr!20955 a!3170) j!153)))))

(declare-fun b!804433 () Bool)

(declare-fun res!548952 () Bool)

(declare-fun e!445651 () Bool)

(assert (=> b!804433 (=> (not res!548952) (not e!445651))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43750 (_ BitVec 32)) Bool)

(assert (=> b!804433 (= res!548952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804434 () Bool)

(declare-fun res!548955 () Bool)

(assert (=> b!804434 (=> (not res!548955) (not e!445652))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804434 (= res!548955 (and (= (size!21376 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21376 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21376 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804435 () Bool)

(assert (=> b!804435 (= e!445652 e!445651)))

(declare-fun res!548953 () Bool)

(assert (=> b!804435 (=> (not res!548953) (not e!445651))))

(declare-datatypes ((SeekEntryResult!8546 0))(
  ( (MissingZero!8546 (index!36552 (_ BitVec 32))) (Found!8546 (index!36553 (_ BitVec 32))) (Intermediate!8546 (undefined!9358 Bool) (index!36554 (_ BitVec 32)) (x!67384 (_ BitVec 32))) (Undefined!8546) (MissingVacant!8546 (index!36555 (_ BitVec 32))) )
))
(declare-fun lt!360152 () SeekEntryResult!8546)

(assert (=> b!804435 (= res!548953 (or (= lt!360152 (MissingZero!8546 i!1163)) (= lt!360152 (MissingVacant!8546 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43750 (_ BitVec 32)) SeekEntryResult!8546)

(assert (=> b!804435 (= lt!360152 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!548951 () Bool)

(assert (=> start!68960 (=> (not res!548951) (not e!445652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68960 (= res!548951 (validMask!0 mask!3266))))

(assert (=> start!68960 e!445652))

(assert (=> start!68960 true))

(declare-fun array_inv!16751 (array!43750) Bool)

(assert (=> start!68960 (array_inv!16751 a!3170)))

(declare-fun b!804436 () Bool)

(assert (=> b!804436 (= e!445651 false)))

(declare-fun lt!360151 () Bool)

(declare-datatypes ((List!14918 0))(
  ( (Nil!14915) (Cons!14914 (h!16043 (_ BitVec 64)) (t!21233 List!14918)) )
))
(declare-fun arrayNoDuplicates!0 (array!43750 (_ BitVec 32) List!14918) Bool)

(assert (=> b!804436 (= lt!360151 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14915))))

(declare-fun b!804437 () Bool)

(declare-fun res!548956 () Bool)

(assert (=> b!804437 (=> (not res!548956) (not e!445652))))

(declare-fun arrayContainsKey!0 (array!43750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804437 (= res!548956 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804438 () Bool)

(declare-fun res!548954 () Bool)

(assert (=> b!804438 (=> (not res!548954) (not e!445652))))

(assert (=> b!804438 (= res!548954 (validKeyInArray!0 k!2044))))

(assert (= (and start!68960 res!548951) b!804434))

(assert (= (and b!804434 res!548955) b!804432))

(assert (= (and b!804432 res!548957) b!804438))

(assert (= (and b!804438 res!548954) b!804437))

(assert (= (and b!804437 res!548956) b!804435))

(assert (= (and b!804435 res!548953) b!804433))

(assert (= (and b!804433 res!548952) b!804436))

(declare-fun m!746309 () Bool)

(assert (=> b!804433 m!746309))

(declare-fun m!746311 () Bool)

(assert (=> start!68960 m!746311))

(declare-fun m!746313 () Bool)

(assert (=> start!68960 m!746313))

(declare-fun m!746315 () Bool)

(assert (=> b!804436 m!746315))

(declare-fun m!746317 () Bool)

(assert (=> b!804438 m!746317))

(declare-fun m!746319 () Bool)

(assert (=> b!804437 m!746319))

(declare-fun m!746321 () Bool)

(assert (=> b!804432 m!746321))

(assert (=> b!804432 m!746321))

(declare-fun m!746323 () Bool)

(assert (=> b!804432 m!746323))

(declare-fun m!746325 () Bool)

(assert (=> b!804435 m!746325))

(push 1)

(assert (not b!804438))

(assert (not b!804437))

(assert (not b!804433))

(assert (not b!804432))

(assert (not b!804435))

(assert (not b!804436))

(assert (not start!68960))

(check-sat)

(pop 1)

