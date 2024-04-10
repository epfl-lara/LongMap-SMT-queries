; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68952 () Bool)

(assert start!68952)

(declare-fun b!804348 () Bool)

(declare-fun e!445616 () Bool)

(declare-fun e!445615 () Bool)

(assert (=> b!804348 (= e!445616 e!445615)))

(declare-fun res!548870 () Bool)

(assert (=> b!804348 (=> (not res!548870) (not e!445615))))

(declare-datatypes ((SeekEntryResult!8542 0))(
  ( (MissingZero!8542 (index!36536 (_ BitVec 32))) (Found!8542 (index!36537 (_ BitVec 32))) (Intermediate!8542 (undefined!9354 Bool) (index!36538 (_ BitVec 32)) (x!67364 (_ BitVec 32))) (Undefined!8542) (MissingVacant!8542 (index!36539 (_ BitVec 32))) )
))
(declare-fun lt!360128 () SeekEntryResult!8542)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804348 (= res!548870 (or (= lt!360128 (MissingZero!8542 i!1163)) (= lt!360128 (MissingVacant!8542 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43742 0))(
  ( (array!43743 (arr!20951 (Array (_ BitVec 32) (_ BitVec 64))) (size!21372 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43742)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43742 (_ BitVec 32)) SeekEntryResult!8542)

(assert (=> b!804348 (= lt!360128 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804349 () Bool)

(declare-fun res!548867 () Bool)

(assert (=> b!804349 (=> (not res!548867) (not e!445616))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804349 (= res!548867 (validKeyInArray!0 (select (arr!20951 a!3170) j!153)))))

(declare-fun b!804350 () Bool)

(declare-fun res!548873 () Bool)

(assert (=> b!804350 (=> (not res!548873) (not e!445616))))

(assert (=> b!804350 (= res!548873 (validKeyInArray!0 k!2044))))

(declare-fun b!804351 () Bool)

(declare-fun res!548872 () Bool)

(assert (=> b!804351 (=> (not res!548872) (not e!445616))))

(declare-fun arrayContainsKey!0 (array!43742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804351 (= res!548872 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548871 () Bool)

(assert (=> start!68952 (=> (not res!548871) (not e!445616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68952 (= res!548871 (validMask!0 mask!3266))))

(assert (=> start!68952 e!445616))

(assert (=> start!68952 true))

(declare-fun array_inv!16747 (array!43742) Bool)

(assert (=> start!68952 (array_inv!16747 a!3170)))

(declare-fun b!804352 () Bool)

(declare-fun res!548869 () Bool)

(assert (=> b!804352 (=> (not res!548869) (not e!445615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43742 (_ BitVec 32)) Bool)

(assert (=> b!804352 (= res!548869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804353 () Bool)

(assert (=> b!804353 (= e!445615 false)))

(declare-fun lt!360127 () Bool)

(declare-datatypes ((List!14914 0))(
  ( (Nil!14911) (Cons!14910 (h!16039 (_ BitVec 64)) (t!21229 List!14914)) )
))
(declare-fun arrayNoDuplicates!0 (array!43742 (_ BitVec 32) List!14914) Bool)

(assert (=> b!804353 (= lt!360127 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14911))))

(declare-fun b!804354 () Bool)

(declare-fun res!548868 () Bool)

(assert (=> b!804354 (=> (not res!548868) (not e!445616))))

(assert (=> b!804354 (= res!548868 (and (= (size!21372 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21372 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21372 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68952 res!548871) b!804354))

(assert (= (and b!804354 res!548868) b!804349))

(assert (= (and b!804349 res!548867) b!804350))

(assert (= (and b!804350 res!548873) b!804351))

(assert (= (and b!804351 res!548872) b!804348))

(assert (= (and b!804348 res!548870) b!804352))

(assert (= (and b!804352 res!548869) b!804353))

(declare-fun m!746237 () Bool)

(assert (=> b!804351 m!746237))

(declare-fun m!746239 () Bool)

(assert (=> b!804353 m!746239))

(declare-fun m!746241 () Bool)

(assert (=> b!804352 m!746241))

(declare-fun m!746243 () Bool)

(assert (=> start!68952 m!746243))

(declare-fun m!746245 () Bool)

(assert (=> start!68952 m!746245))

(declare-fun m!746247 () Bool)

(assert (=> b!804348 m!746247))

(declare-fun m!746249 () Bool)

(assert (=> b!804349 m!746249))

(assert (=> b!804349 m!746249))

(declare-fun m!746251 () Bool)

(assert (=> b!804349 m!746251))

(declare-fun m!746253 () Bool)

(assert (=> b!804350 m!746253))

(push 1)

(assert (not b!804349))

(assert (not start!68952))

(assert (not b!804353))

(assert (not b!804350))

(assert (not b!804351))

(assert (not b!804352))

(assert (not b!804348))

(check-sat)

(pop 1)

