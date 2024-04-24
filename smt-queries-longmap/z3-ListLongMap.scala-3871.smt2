; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53286 () Bool)

(assert start!53286)

(declare-fun b!578893 () Bool)

(declare-fun res!366608 () Bool)

(declare-fun e!332882 () Bool)

(assert (=> b!578893 (=> (not res!366608) (not e!332882))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578893 (= res!366608 (validKeyInArray!0 k0!1786))))

(declare-fun b!578894 () Bool)

(declare-fun res!366605 () Bool)

(declare-fun e!332883 () Bool)

(assert (=> b!578894 (=> (not res!366605) (not e!332883))))

(declare-datatypes ((array!36132 0))(
  ( (array!36133 (arr!17338 (Array (_ BitVec 32) (_ BitVec 64))) (size!17702 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36132)

(declare-datatypes ((List!11286 0))(
  ( (Nil!11283) (Cons!11282 (h!12330 (_ BitVec 64)) (t!17506 List!11286)) )
))
(declare-fun arrayNoDuplicates!0 (array!36132 (_ BitVec 32) List!11286) Bool)

(assert (=> b!578894 (= res!366605 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11283))))

(declare-fun b!578895 () Bool)

(declare-fun res!366611 () Bool)

(assert (=> b!578895 (=> (not res!366611) (not e!332883))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578895 (= res!366611 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17338 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17338 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578896 () Bool)

(assert (=> b!578896 (= e!332883 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!578897 () Bool)

(declare-fun res!366610 () Bool)

(assert (=> b!578897 (=> (not res!366610) (not e!332882))))

(declare-fun arrayContainsKey!0 (array!36132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578897 (= res!366610 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!366606 () Bool)

(assert (=> start!53286 (=> (not res!366606) (not e!332882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53286 (= res!366606 (validMask!0 mask!3053))))

(assert (=> start!53286 e!332882))

(assert (=> start!53286 true))

(declare-fun array_inv!13197 (array!36132) Bool)

(assert (=> start!53286 (array_inv!13197 a!2986)))

(declare-fun b!578898 () Bool)

(declare-fun res!366607 () Bool)

(assert (=> b!578898 (=> (not res!366607) (not e!332883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36132 (_ BitVec 32)) Bool)

(assert (=> b!578898 (= res!366607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578899 () Bool)

(declare-fun res!366604 () Bool)

(assert (=> b!578899 (=> (not res!366604) (not e!332882))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578899 (= res!366604 (validKeyInArray!0 (select (arr!17338 a!2986) j!136)))))

(declare-fun b!578900 () Bool)

(declare-fun res!366609 () Bool)

(assert (=> b!578900 (=> (not res!366609) (not e!332882))))

(assert (=> b!578900 (= res!366609 (and (= (size!17702 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17702 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17702 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578901 () Bool)

(assert (=> b!578901 (= e!332882 e!332883)))

(declare-fun res!366613 () Bool)

(assert (=> b!578901 (=> (not res!366613) (not e!332883))))

(declare-datatypes ((SeekEntryResult!5734 0))(
  ( (MissingZero!5734 (index!25163 (_ BitVec 32))) (Found!5734 (index!25164 (_ BitVec 32))) (Intermediate!5734 (undefined!6546 Bool) (index!25165 (_ BitVec 32)) (x!54214 (_ BitVec 32))) (Undefined!5734) (MissingVacant!5734 (index!25166 (_ BitVec 32))) )
))
(declare-fun lt!264436 () SeekEntryResult!5734)

(assert (=> b!578901 (= res!366613 (or (= lt!264436 (MissingZero!5734 i!1108)) (= lt!264436 (MissingVacant!5734 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36132 (_ BitVec 32)) SeekEntryResult!5734)

(assert (=> b!578901 (= lt!264436 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578902 () Bool)

(declare-fun res!366612 () Bool)

(assert (=> b!578902 (=> (not res!366612) (not e!332883))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36132 (_ BitVec 32)) SeekEntryResult!5734)

(assert (=> b!578902 (= res!366612 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17338 a!2986) j!136) a!2986 mask!3053) (Found!5734 j!136)))))

(assert (= (and start!53286 res!366606) b!578900))

(assert (= (and b!578900 res!366609) b!578899))

(assert (= (and b!578899 res!366604) b!578893))

(assert (= (and b!578893 res!366608) b!578897))

(assert (= (and b!578897 res!366610) b!578901))

(assert (= (and b!578901 res!366613) b!578898))

(assert (= (and b!578898 res!366607) b!578894))

(assert (= (and b!578894 res!366605) b!578895))

(assert (= (and b!578895 res!366611) b!578902))

(assert (= (and b!578902 res!366612) b!578896))

(declare-fun m!557699 () Bool)

(assert (=> b!578895 m!557699))

(declare-fun m!557701 () Bool)

(assert (=> b!578895 m!557701))

(declare-fun m!557703 () Bool)

(assert (=> b!578895 m!557703))

(declare-fun m!557705 () Bool)

(assert (=> b!578901 m!557705))

(declare-fun m!557707 () Bool)

(assert (=> start!53286 m!557707))

(declare-fun m!557709 () Bool)

(assert (=> start!53286 m!557709))

(declare-fun m!557711 () Bool)

(assert (=> b!578902 m!557711))

(assert (=> b!578902 m!557711))

(declare-fun m!557713 () Bool)

(assert (=> b!578902 m!557713))

(assert (=> b!578899 m!557711))

(assert (=> b!578899 m!557711))

(declare-fun m!557715 () Bool)

(assert (=> b!578899 m!557715))

(declare-fun m!557717 () Bool)

(assert (=> b!578893 m!557717))

(declare-fun m!557719 () Bool)

(assert (=> b!578898 m!557719))

(declare-fun m!557721 () Bool)

(assert (=> b!578897 m!557721))

(declare-fun m!557723 () Bool)

(assert (=> b!578894 m!557723))

(check-sat (not b!578901) (not b!578893) (not b!578899) (not b!578902) (not b!578898) (not b!578894) (not start!53286) (not b!578897))
(check-sat)
