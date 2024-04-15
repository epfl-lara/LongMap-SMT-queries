; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68274 () Bool)

(assert start!68274)

(declare-fun b!793124 () Bool)

(declare-fun res!537789 () Bool)

(declare-fun e!440582 () Bool)

(assert (=> b!793124 (=> (not res!537789) (not e!440582))))

(declare-datatypes ((array!43081 0))(
  ( (array!43082 (arr!20621 (Array (_ BitVec 32) (_ BitVec 64))) (size!21042 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43081)

(declare-datatypes ((List!14623 0))(
  ( (Nil!14620) (Cons!14619 (h!15748 (_ BitVec 64)) (t!20929 List!14623)) )
))
(declare-fun arrayNoDuplicates!0 (array!43081 (_ BitVec 32) List!14623) Bool)

(assert (=> b!793124 (= res!537789 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14620))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!793125 () Bool)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793125 (= e!440582 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21042 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20621 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21042 a!3170)) (= (select (arr!20621 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20621 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!793126 () Bool)

(declare-fun res!537788 () Bool)

(declare-fun e!440583 () Bool)

(assert (=> b!793126 (=> (not res!537788) (not e!440583))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793126 (= res!537788 (and (= (size!21042 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21042 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21042 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793127 () Bool)

(declare-fun res!537785 () Bool)

(assert (=> b!793127 (=> (not res!537785) (not e!440583))))

(declare-fun arrayContainsKey!0 (array!43081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793127 (= res!537785 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793128 () Bool)

(declare-fun res!537782 () Bool)

(assert (=> b!793128 (=> (not res!537782) (not e!440582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43081 (_ BitVec 32)) Bool)

(assert (=> b!793128 (= res!537782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793123 () Bool)

(assert (=> b!793123 (= e!440583 e!440582)))

(declare-fun res!537787 () Bool)

(assert (=> b!793123 (=> (not res!537787) (not e!440582))))

(declare-datatypes ((SeekEntryResult!8209 0))(
  ( (MissingZero!8209 (index!35204 (_ BitVec 32))) (Found!8209 (index!35205 (_ BitVec 32))) (Intermediate!8209 (undefined!9021 Bool) (index!35206 (_ BitVec 32)) (x!66154 (_ BitVec 32))) (Undefined!8209) (MissingVacant!8209 (index!35207 (_ BitVec 32))) )
))
(declare-fun lt!353456 () SeekEntryResult!8209)

(assert (=> b!793123 (= res!537787 (or (= lt!353456 (MissingZero!8209 i!1163)) (= lt!353456 (MissingVacant!8209 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43081 (_ BitVec 32)) SeekEntryResult!8209)

(assert (=> b!793123 (= lt!353456 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537786 () Bool)

(assert (=> start!68274 (=> (not res!537786) (not e!440583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68274 (= res!537786 (validMask!0 mask!3266))))

(assert (=> start!68274 e!440583))

(assert (=> start!68274 true))

(declare-fun array_inv!16504 (array!43081) Bool)

(assert (=> start!68274 (array_inv!16504 a!3170)))

(declare-fun b!793129 () Bool)

(declare-fun res!537783 () Bool)

(assert (=> b!793129 (=> (not res!537783) (not e!440583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793129 (= res!537783 (validKeyInArray!0 k0!2044))))

(declare-fun b!793130 () Bool)

(declare-fun res!537784 () Bool)

(assert (=> b!793130 (=> (not res!537784) (not e!440583))))

(assert (=> b!793130 (= res!537784 (validKeyInArray!0 (select (arr!20621 a!3170) j!153)))))

(assert (= (and start!68274 res!537786) b!793126))

(assert (= (and b!793126 res!537788) b!793130))

(assert (= (and b!793130 res!537784) b!793129))

(assert (= (and b!793129 res!537783) b!793127))

(assert (= (and b!793127 res!537785) b!793123))

(assert (= (and b!793123 res!537787) b!793128))

(assert (= (and b!793128 res!537782) b!793124))

(assert (= (and b!793124 res!537789) b!793125))

(declare-fun m!733093 () Bool)

(assert (=> b!793124 m!733093))

(declare-fun m!733095 () Bool)

(assert (=> start!68274 m!733095))

(declare-fun m!733097 () Bool)

(assert (=> start!68274 m!733097))

(declare-fun m!733099 () Bool)

(assert (=> b!793125 m!733099))

(declare-fun m!733101 () Bool)

(assert (=> b!793125 m!733101))

(declare-fun m!733103 () Bool)

(assert (=> b!793125 m!733103))

(declare-fun m!733105 () Bool)

(assert (=> b!793125 m!733105))

(declare-fun m!733107 () Bool)

(assert (=> b!793128 m!733107))

(declare-fun m!733109 () Bool)

(assert (=> b!793127 m!733109))

(declare-fun m!733111 () Bool)

(assert (=> b!793130 m!733111))

(assert (=> b!793130 m!733111))

(declare-fun m!733113 () Bool)

(assert (=> b!793130 m!733113))

(declare-fun m!733115 () Bool)

(assert (=> b!793123 m!733115))

(declare-fun m!733117 () Bool)

(assert (=> b!793129 m!733117))

(check-sat (not b!793128) (not b!793127) (not b!793130) (not start!68274) (not b!793124) (not b!793129) (not b!793123))
(check-sat)
