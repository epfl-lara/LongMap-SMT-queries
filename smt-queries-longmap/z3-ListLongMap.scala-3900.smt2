; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53412 () Bool)

(assert start!53412)

(declare-fun res!368908 () Bool)

(declare-fun e!333545 () Bool)

(assert (=> start!53412 (=> (not res!368908) (not e!333545))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53412 (= res!368908 (validMask!0 mask!3053))))

(assert (=> start!53412 e!333545))

(assert (=> start!53412 true))

(declare-datatypes ((array!36313 0))(
  ( (array!36314 (arr!17431 (Array (_ BitVec 32) (_ BitVec 64))) (size!17795 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36313)

(declare-fun array_inv!13227 (array!36313) Bool)

(assert (=> start!53412 (array_inv!13227 a!2986)))

(declare-fun b!581085 () Bool)

(declare-fun e!333544 () Bool)

(assert (=> b!581085 (= e!333545 e!333544)))

(declare-fun res!368901 () Bool)

(assert (=> b!581085 (=> (not res!368901) (not e!333544))))

(declare-datatypes ((SeekEntryResult!5871 0))(
  ( (MissingZero!5871 (index!25711 (_ BitVec 32))) (Found!5871 (index!25712 (_ BitVec 32))) (Intermediate!5871 (undefined!6683 Bool) (index!25713 (_ BitVec 32)) (x!54580 (_ BitVec 32))) (Undefined!5871) (MissingVacant!5871 (index!25714 (_ BitVec 32))) )
))
(declare-fun lt!264838 () SeekEntryResult!5871)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581085 (= res!368901 (or (= lt!264838 (MissingZero!5871 i!1108)) (= lt!264838 (MissingVacant!5871 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36313 (_ BitVec 32)) SeekEntryResult!5871)

(assert (=> b!581085 (= lt!264838 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581086 () Bool)

(declare-fun res!368903 () Bool)

(assert (=> b!581086 (=> (not res!368903) (not e!333544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36313 (_ BitVec 32)) Bool)

(assert (=> b!581086 (= res!368903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581087 () Bool)

(declare-fun res!368905 () Bool)

(assert (=> b!581087 (=> (not res!368905) (not e!333544))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581087 (= res!368905 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17431 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17431 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581088 () Bool)

(declare-fun res!368907 () Bool)

(assert (=> b!581088 (=> (not res!368907) (not e!333545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581088 (= res!368907 (validKeyInArray!0 k0!1786))))

(declare-fun b!581089 () Bool)

(declare-fun res!368904 () Bool)

(assert (=> b!581089 (=> (not res!368904) (not e!333545))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581089 (= res!368904 (validKeyInArray!0 (select (arr!17431 a!2986) j!136)))))

(declare-fun b!581090 () Bool)

(declare-fun res!368909 () Bool)

(assert (=> b!581090 (=> (not res!368909) (not e!333544))))

(declare-datatypes ((List!11472 0))(
  ( (Nil!11469) (Cons!11468 (h!12513 (_ BitVec 64)) (t!17700 List!11472)) )
))
(declare-fun arrayNoDuplicates!0 (array!36313 (_ BitVec 32) List!11472) Bool)

(assert (=> b!581090 (= res!368909 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11469))))

(declare-fun b!581091 () Bool)

(assert (=> b!581091 (= e!333544 false)))

(declare-fun lt!264837 () SeekEntryResult!5871)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36313 (_ BitVec 32)) SeekEntryResult!5871)

(assert (=> b!581091 (= lt!264837 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581092 () Bool)

(declare-fun res!368902 () Bool)

(assert (=> b!581092 (=> (not res!368902) (not e!333545))))

(declare-fun arrayContainsKey!0 (array!36313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581092 (= res!368902 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581093 () Bool)

(declare-fun res!368906 () Bool)

(assert (=> b!581093 (=> (not res!368906) (not e!333545))))

(assert (=> b!581093 (= res!368906 (and (= (size!17795 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17795 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17795 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53412 res!368908) b!581093))

(assert (= (and b!581093 res!368906) b!581089))

(assert (= (and b!581089 res!368904) b!581088))

(assert (= (and b!581088 res!368907) b!581092))

(assert (= (and b!581092 res!368902) b!581085))

(assert (= (and b!581085 res!368901) b!581086))

(assert (= (and b!581086 res!368903) b!581090))

(assert (= (and b!581090 res!368909) b!581087))

(assert (= (and b!581087 res!368905) b!581091))

(declare-fun m!559641 () Bool)

(assert (=> b!581086 m!559641))

(declare-fun m!559643 () Bool)

(assert (=> b!581090 m!559643))

(declare-fun m!559645 () Bool)

(assert (=> b!581087 m!559645))

(declare-fun m!559647 () Bool)

(assert (=> b!581087 m!559647))

(declare-fun m!559649 () Bool)

(assert (=> b!581087 m!559649))

(declare-fun m!559651 () Bool)

(assert (=> b!581089 m!559651))

(assert (=> b!581089 m!559651))

(declare-fun m!559653 () Bool)

(assert (=> b!581089 m!559653))

(assert (=> b!581091 m!559651))

(assert (=> b!581091 m!559651))

(declare-fun m!559655 () Bool)

(assert (=> b!581091 m!559655))

(declare-fun m!559657 () Bool)

(assert (=> b!581085 m!559657))

(declare-fun m!559659 () Bool)

(assert (=> b!581088 m!559659))

(declare-fun m!559661 () Bool)

(assert (=> b!581092 m!559661))

(declare-fun m!559663 () Bool)

(assert (=> start!53412 m!559663))

(declare-fun m!559665 () Bool)

(assert (=> start!53412 m!559665))

(check-sat (not b!581086) (not b!581085) (not start!53412) (not b!581090) (not b!581091) (not b!581092) (not b!581088) (not b!581089))
(check-sat)
