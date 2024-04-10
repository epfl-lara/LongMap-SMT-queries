; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68936 () Bool)

(assert start!68936)

(declare-fun b!804180 () Bool)

(declare-fun e!445542 () Bool)

(declare-fun e!445543 () Bool)

(assert (=> b!804180 (= e!445542 e!445543)))

(declare-fun res!548703 () Bool)

(assert (=> b!804180 (=> (not res!548703) (not e!445543))))

(declare-datatypes ((SeekEntryResult!8534 0))(
  ( (MissingZero!8534 (index!36504 (_ BitVec 32))) (Found!8534 (index!36505 (_ BitVec 32))) (Intermediate!8534 (undefined!9346 Bool) (index!36506 (_ BitVec 32)) (x!67340 (_ BitVec 32))) (Undefined!8534) (MissingVacant!8534 (index!36507 (_ BitVec 32))) )
))
(declare-fun lt!360079 () SeekEntryResult!8534)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804180 (= res!548703 (or (= lt!360079 (MissingZero!8534 i!1163)) (= lt!360079 (MissingVacant!8534 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43726 0))(
  ( (array!43727 (arr!20943 (Array (_ BitVec 32) (_ BitVec 64))) (size!21364 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43726)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43726 (_ BitVec 32)) SeekEntryResult!8534)

(assert (=> b!804180 (= lt!360079 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804181 () Bool)

(declare-fun res!548702 () Bool)

(assert (=> b!804181 (=> (not res!548702) (not e!445543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43726 (_ BitVec 32)) Bool)

(assert (=> b!804181 (= res!548702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548705 () Bool)

(assert (=> start!68936 (=> (not res!548705) (not e!445542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68936 (= res!548705 (validMask!0 mask!3266))))

(assert (=> start!68936 e!445542))

(assert (=> start!68936 true))

(declare-fun array_inv!16739 (array!43726) Bool)

(assert (=> start!68936 (array_inv!16739 a!3170)))

(declare-fun b!804182 () Bool)

(declare-fun res!548704 () Bool)

(assert (=> b!804182 (=> (not res!548704) (not e!445542))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804182 (= res!548704 (and (= (size!21364 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21364 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21364 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804183 () Bool)

(assert (=> b!804183 (= e!445543 false)))

(declare-fun lt!360080 () Bool)

(declare-datatypes ((List!14906 0))(
  ( (Nil!14903) (Cons!14902 (h!16031 (_ BitVec 64)) (t!21221 List!14906)) )
))
(declare-fun arrayNoDuplicates!0 (array!43726 (_ BitVec 32) List!14906) Bool)

(assert (=> b!804183 (= lt!360080 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14903))))

(declare-fun b!804184 () Bool)

(declare-fun res!548700 () Bool)

(assert (=> b!804184 (=> (not res!548700) (not e!445542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804184 (= res!548700 (validKeyInArray!0 (select (arr!20943 a!3170) j!153)))))

(declare-fun b!804185 () Bool)

(declare-fun res!548699 () Bool)

(assert (=> b!804185 (=> (not res!548699) (not e!445542))))

(declare-fun arrayContainsKey!0 (array!43726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804185 (= res!548699 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804186 () Bool)

(declare-fun res!548701 () Bool)

(assert (=> b!804186 (=> (not res!548701) (not e!445542))))

(assert (=> b!804186 (= res!548701 (validKeyInArray!0 k!2044))))

(assert (= (and start!68936 res!548705) b!804182))

(assert (= (and b!804182 res!548704) b!804184))

(assert (= (and b!804184 res!548700) b!804186))

(assert (= (and b!804186 res!548701) b!804185))

(assert (= (and b!804185 res!548699) b!804180))

(assert (= (and b!804180 res!548703) b!804181))

(assert (= (and b!804181 res!548702) b!804183))

(declare-fun m!746093 () Bool)

(assert (=> b!804180 m!746093))

(declare-fun m!746095 () Bool)

(assert (=> b!804186 m!746095))

(declare-fun m!746097 () Bool)

(assert (=> b!804185 m!746097))

(declare-fun m!746099 () Bool)

(assert (=> b!804184 m!746099))

(assert (=> b!804184 m!746099))

(declare-fun m!746101 () Bool)

(assert (=> b!804184 m!746101))

(declare-fun m!746103 () Bool)

(assert (=> b!804183 m!746103))

(declare-fun m!746105 () Bool)

(assert (=> b!804181 m!746105))

(declare-fun m!746107 () Bool)

(assert (=> start!68936 m!746107))

(declare-fun m!746109 () Bool)

(assert (=> start!68936 m!746109))

(push 1)

