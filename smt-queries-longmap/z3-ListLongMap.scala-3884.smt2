; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53364 () Bool)

(assert start!53364)

(declare-fun b!579953 () Bool)

(declare-fun res!367671 () Bool)

(declare-fun e!333233 () Bool)

(assert (=> b!579953 (=> (not res!367671) (not e!333233))))

(declare-datatypes ((array!36210 0))(
  ( (array!36211 (arr!17377 (Array (_ BitVec 32) (_ BitVec 64))) (size!17741 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36210)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36210 (_ BitVec 32)) Bool)

(assert (=> b!579953 (= res!367671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579954 () Bool)

(declare-fun res!367667 () Bool)

(assert (=> b!579954 (=> (not res!367667) (not e!333233))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579954 (= res!367667 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17377 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17377 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367666 () Bool)

(declare-fun e!333232 () Bool)

(assert (=> start!53364 (=> (not res!367666) (not e!333232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53364 (= res!367666 (validMask!0 mask!3053))))

(assert (=> start!53364 e!333232))

(assert (=> start!53364 true))

(declare-fun array_inv!13236 (array!36210) Bool)

(assert (=> start!53364 (array_inv!13236 a!2986)))

(declare-fun b!579955 () Bool)

(assert (=> b!579955 (= e!333232 e!333233)))

(declare-fun res!367670 () Bool)

(assert (=> b!579955 (=> (not res!367670) (not e!333233))))

(declare-datatypes ((SeekEntryResult!5773 0))(
  ( (MissingZero!5773 (index!25319 (_ BitVec 32))) (Found!5773 (index!25320 (_ BitVec 32))) (Intermediate!5773 (undefined!6585 Bool) (index!25321 (_ BitVec 32)) (x!54357 (_ BitVec 32))) (Undefined!5773) (MissingVacant!5773 (index!25322 (_ BitVec 32))) )
))
(declare-fun lt!264663 () SeekEntryResult!5773)

(assert (=> b!579955 (= res!367670 (or (= lt!264663 (MissingZero!5773 i!1108)) (= lt!264663 (MissingVacant!5773 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36210 (_ BitVec 32)) SeekEntryResult!5773)

(assert (=> b!579955 (= lt!264663 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579956 () Bool)

(declare-fun res!367668 () Bool)

(assert (=> b!579956 (=> (not res!367668) (not e!333232))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579956 (= res!367668 (and (= (size!17741 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17741 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17741 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579957 () Bool)

(declare-fun res!367672 () Bool)

(assert (=> b!579957 (=> (not res!367672) (not e!333233))))

(declare-datatypes ((List!11325 0))(
  ( (Nil!11322) (Cons!11321 (h!12369 (_ BitVec 64)) (t!17545 List!11325)) )
))
(declare-fun arrayNoDuplicates!0 (array!36210 (_ BitVec 32) List!11325) Bool)

(assert (=> b!579957 (= res!367672 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11322))))

(declare-fun b!579958 () Bool)

(declare-fun res!367664 () Bool)

(assert (=> b!579958 (=> (not res!367664) (not e!333232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579958 (= res!367664 (validKeyInArray!0 k0!1786))))

(declare-fun b!579959 () Bool)

(declare-fun res!367669 () Bool)

(assert (=> b!579959 (=> (not res!367669) (not e!333232))))

(assert (=> b!579959 (= res!367669 (validKeyInArray!0 (select (arr!17377 a!2986) j!136)))))

(declare-fun b!579960 () Bool)

(assert (=> b!579960 (= e!333233 false)))

(declare-fun lt!264664 () SeekEntryResult!5773)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36210 (_ BitVec 32)) SeekEntryResult!5773)

(assert (=> b!579960 (= lt!264664 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17377 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579961 () Bool)

(declare-fun res!367665 () Bool)

(assert (=> b!579961 (=> (not res!367665) (not e!333232))))

(declare-fun arrayContainsKey!0 (array!36210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579961 (= res!367665 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53364 res!367666) b!579956))

(assert (= (and b!579956 res!367668) b!579959))

(assert (= (and b!579959 res!367669) b!579958))

(assert (= (and b!579958 res!367664) b!579961))

(assert (= (and b!579961 res!367665) b!579955))

(assert (= (and b!579955 res!367670) b!579953))

(assert (= (and b!579953 res!367671) b!579957))

(assert (= (and b!579957 res!367672) b!579954))

(assert (= (and b!579954 res!367667) b!579960))

(declare-fun m!558713 () Bool)

(assert (=> b!579953 m!558713))

(declare-fun m!558715 () Bool)

(assert (=> b!579960 m!558715))

(assert (=> b!579960 m!558715))

(declare-fun m!558717 () Bool)

(assert (=> b!579960 m!558717))

(declare-fun m!558719 () Bool)

(assert (=> b!579961 m!558719))

(assert (=> b!579959 m!558715))

(assert (=> b!579959 m!558715))

(declare-fun m!558721 () Bool)

(assert (=> b!579959 m!558721))

(declare-fun m!558723 () Bool)

(assert (=> b!579957 m!558723))

(declare-fun m!558725 () Bool)

(assert (=> b!579958 m!558725))

(declare-fun m!558727 () Bool)

(assert (=> start!53364 m!558727))

(declare-fun m!558729 () Bool)

(assert (=> start!53364 m!558729))

(declare-fun m!558731 () Bool)

(assert (=> b!579954 m!558731))

(declare-fun m!558733 () Bool)

(assert (=> b!579954 m!558733))

(declare-fun m!558735 () Bool)

(assert (=> b!579954 m!558735))

(declare-fun m!558737 () Bool)

(assert (=> b!579955 m!558737))

(check-sat (not b!579958) (not b!579953) (not b!579959) (not b!579955) (not b!579960) (not b!579957) (not start!53364) (not b!579961))
(check-sat)
