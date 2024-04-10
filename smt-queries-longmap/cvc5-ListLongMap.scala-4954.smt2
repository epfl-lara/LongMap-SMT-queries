; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68234 () Bool)

(assert start!68234)

(declare-fun res!537206 () Bool)

(declare-fun e!440468 () Bool)

(assert (=> start!68234 (=> (not res!537206) (not e!440468))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68234 (= res!537206 (validMask!0 mask!3266))))

(assert (=> start!68234 e!440468))

(assert (=> start!68234 true))

(declare-datatypes ((array!43024 0))(
  ( (array!43025 (arr!20592 (Array (_ BitVec 32) (_ BitVec 64))) (size!21013 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43024)

(declare-fun array_inv!16388 (array!43024) Bool)

(assert (=> start!68234 (array_inv!16388 a!3170)))

(declare-fun b!792687 () Bool)

(declare-fun res!537210 () Bool)

(assert (=> b!792687 (=> (not res!537210) (not e!440468))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792687 (= res!537210 (validKeyInArray!0 (select (arr!20592 a!3170) j!153)))))

(declare-fun b!792688 () Bool)

(declare-fun res!537208 () Bool)

(assert (=> b!792688 (=> (not res!537208) (not e!440468))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!792688 (= res!537208 (validKeyInArray!0 k!2044))))

(declare-fun b!792689 () Bool)

(declare-fun e!440466 () Bool)

(assert (=> b!792689 (= e!440466 false)))

(declare-fun lt!353563 () Bool)

(declare-datatypes ((List!14555 0))(
  ( (Nil!14552) (Cons!14551 (h!15680 (_ BitVec 64)) (t!20870 List!14555)) )
))
(declare-fun arrayNoDuplicates!0 (array!43024 (_ BitVec 32) List!14555) Bool)

(assert (=> b!792689 (= lt!353563 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14552))))

(declare-fun b!792690 () Bool)

(declare-fun res!537211 () Bool)

(assert (=> b!792690 (=> (not res!537211) (not e!440468))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792690 (= res!537211 (and (= (size!21013 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21013 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21013 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792691 () Bool)

(assert (=> b!792691 (= e!440468 e!440466)))

(declare-fun res!537209 () Bool)

(assert (=> b!792691 (=> (not res!537209) (not e!440466))))

(declare-datatypes ((SeekEntryResult!8183 0))(
  ( (MissingZero!8183 (index!35100 (_ BitVec 32))) (Found!8183 (index!35101 (_ BitVec 32))) (Intermediate!8183 (undefined!8995 Bool) (index!35102 (_ BitVec 32)) (x!66053 (_ BitVec 32))) (Undefined!8183) (MissingVacant!8183 (index!35103 (_ BitVec 32))) )
))
(declare-fun lt!353564 () SeekEntryResult!8183)

(assert (=> b!792691 (= res!537209 (or (= lt!353564 (MissingZero!8183 i!1163)) (= lt!353564 (MissingVacant!8183 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43024 (_ BitVec 32)) SeekEntryResult!8183)

(assert (=> b!792691 (= lt!353564 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792692 () Bool)

(declare-fun res!537212 () Bool)

(assert (=> b!792692 (=> (not res!537212) (not e!440466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43024 (_ BitVec 32)) Bool)

(assert (=> b!792692 (= res!537212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792693 () Bool)

(declare-fun res!537207 () Bool)

(assert (=> b!792693 (=> (not res!537207) (not e!440468))))

(declare-fun arrayContainsKey!0 (array!43024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792693 (= res!537207 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68234 res!537206) b!792690))

(assert (= (and b!792690 res!537211) b!792687))

(assert (= (and b!792687 res!537210) b!792688))

(assert (= (and b!792688 res!537208) b!792693))

(assert (= (and b!792693 res!537207) b!792691))

(assert (= (and b!792691 res!537209) b!792692))

(assert (= (and b!792692 res!537212) b!792689))

(declare-fun m!733217 () Bool)

(assert (=> b!792692 m!733217))

(declare-fun m!733219 () Bool)

(assert (=> start!68234 m!733219))

(declare-fun m!733221 () Bool)

(assert (=> start!68234 m!733221))

(declare-fun m!733223 () Bool)

(assert (=> b!792691 m!733223))

(declare-fun m!733225 () Bool)

(assert (=> b!792693 m!733225))

(declare-fun m!733227 () Bool)

(assert (=> b!792688 m!733227))

(declare-fun m!733229 () Bool)

(assert (=> b!792689 m!733229))

(declare-fun m!733231 () Bool)

(assert (=> b!792687 m!733231))

(assert (=> b!792687 m!733231))

(declare-fun m!733233 () Bool)

(assert (=> b!792687 m!733233))

(push 1)

