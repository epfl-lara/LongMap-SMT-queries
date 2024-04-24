; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53736 () Bool)

(assert start!53736)

(declare-fun b!585467 () Bool)

(declare-fun e!335052 () Bool)

(assert (=> b!585467 (= e!335052 false)))

(declare-fun lt!265881 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36582 0))(
  ( (array!36583 (arr!17563 (Array (_ BitVec 32) (_ BitVec 64))) (size!17927 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36582)

(declare-datatypes ((SeekEntryResult!5959 0))(
  ( (MissingZero!5959 (index!26063 (_ BitVec 32))) (Found!5959 (index!26064 (_ BitVec 32))) (Intermediate!5959 (undefined!6771 Bool) (index!26065 (_ BitVec 32)) (x!55039 (_ BitVec 32))) (Undefined!5959) (MissingVacant!5959 (index!26066 (_ BitVec 32))) )
))
(declare-fun lt!265880 () SeekEntryResult!5959)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36582 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!585467 (= lt!265880 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265881 vacantSpotIndex!68 (select (arr!17563 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585468 () Bool)

(declare-fun res!373183 () Bool)

(declare-fun e!335053 () Bool)

(assert (=> b!585468 (=> (not res!373183) (not e!335053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585468 (= res!373183 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17563 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17563 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585469 () Bool)

(declare-fun res!373178 () Bool)

(declare-fun e!335055 () Bool)

(assert (=> b!585469 (=> (not res!373178) (not e!335055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585469 (= res!373178 (validKeyInArray!0 (select (arr!17563 a!2986) j!136)))))

(declare-fun b!585470 () Bool)

(declare-fun res!373187 () Bool)

(assert (=> b!585470 (=> (not res!373187) (not e!335053))))

(assert (=> b!585470 (= res!373187 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17563 a!2986) j!136) a!2986 mask!3053) (Found!5959 j!136)))))

(declare-fun b!585471 () Bool)

(declare-fun res!373181 () Bool)

(assert (=> b!585471 (=> (not res!373181) (not e!335053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36582 (_ BitVec 32)) Bool)

(assert (=> b!585471 (= res!373181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585472 () Bool)

(declare-fun res!373180 () Bool)

(assert (=> b!585472 (=> (not res!373180) (not e!335053))))

(declare-datatypes ((List!11511 0))(
  ( (Nil!11508) (Cons!11507 (h!12555 (_ BitVec 64)) (t!17731 List!11511)) )
))
(declare-fun arrayNoDuplicates!0 (array!36582 (_ BitVec 32) List!11511) Bool)

(assert (=> b!585472 (= res!373180 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11508))))

(declare-fun b!585474 () Bool)

(declare-fun res!373182 () Bool)

(assert (=> b!585474 (=> (not res!373182) (not e!335055))))

(assert (=> b!585474 (= res!373182 (and (= (size!17927 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17927 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17927 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585475 () Bool)

(assert (=> b!585475 (= e!335053 e!335052)))

(declare-fun res!373188 () Bool)

(assert (=> b!585475 (=> (not res!373188) (not e!335052))))

(assert (=> b!585475 (= res!373188 (and (bvsge lt!265881 #b00000000000000000000000000000000) (bvslt lt!265881 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585475 (= lt!265881 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585476 () Bool)

(declare-fun res!373189 () Bool)

(assert (=> b!585476 (=> (not res!373189) (not e!335055))))

(declare-fun arrayContainsKey!0 (array!36582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585476 (= res!373189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585477 () Bool)

(assert (=> b!585477 (= e!335055 e!335053)))

(declare-fun res!373186 () Bool)

(assert (=> b!585477 (=> (not res!373186) (not e!335053))))

(declare-fun lt!265882 () SeekEntryResult!5959)

(assert (=> b!585477 (= res!373186 (or (= lt!265882 (MissingZero!5959 i!1108)) (= lt!265882 (MissingVacant!5959 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36582 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!585477 (= lt!265882 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585478 () Bool)

(declare-fun res!373179 () Bool)

(assert (=> b!585478 (=> (not res!373179) (not e!335053))))

(assert (=> b!585478 (= res!373179 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17563 a!2986) index!984) (select (arr!17563 a!2986) j!136))) (not (= (select (arr!17563 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373185 () Bool)

(assert (=> start!53736 (=> (not res!373185) (not e!335055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53736 (= res!373185 (validMask!0 mask!3053))))

(assert (=> start!53736 e!335055))

(assert (=> start!53736 true))

(declare-fun array_inv!13422 (array!36582) Bool)

(assert (=> start!53736 (array_inv!13422 a!2986)))

(declare-fun b!585473 () Bool)

(declare-fun res!373184 () Bool)

(assert (=> b!585473 (=> (not res!373184) (not e!335055))))

(assert (=> b!585473 (= res!373184 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53736 res!373185) b!585474))

(assert (= (and b!585474 res!373182) b!585469))

(assert (= (and b!585469 res!373178) b!585473))

(assert (= (and b!585473 res!373184) b!585476))

(assert (= (and b!585476 res!373189) b!585477))

(assert (= (and b!585477 res!373186) b!585471))

(assert (= (and b!585471 res!373181) b!585472))

(assert (= (and b!585472 res!373180) b!585468))

(assert (= (and b!585468 res!373183) b!585470))

(assert (= (and b!585470 res!373187) b!585478))

(assert (= (and b!585478 res!373179) b!585475))

(assert (= (and b!585475 res!373188) b!585467))

(declare-fun m!563879 () Bool)

(assert (=> b!585468 m!563879))

(declare-fun m!563881 () Bool)

(assert (=> b!585468 m!563881))

(declare-fun m!563883 () Bool)

(assert (=> b!585468 m!563883))

(declare-fun m!563885 () Bool)

(assert (=> b!585476 m!563885))

(declare-fun m!563887 () Bool)

(assert (=> b!585472 m!563887))

(declare-fun m!563889 () Bool)

(assert (=> b!585473 m!563889))

(declare-fun m!563891 () Bool)

(assert (=> b!585470 m!563891))

(assert (=> b!585470 m!563891))

(declare-fun m!563893 () Bool)

(assert (=> b!585470 m!563893))

(assert (=> b!585467 m!563891))

(assert (=> b!585467 m!563891))

(declare-fun m!563895 () Bool)

(assert (=> b!585467 m!563895))

(declare-fun m!563897 () Bool)

(assert (=> start!53736 m!563897))

(declare-fun m!563899 () Bool)

(assert (=> start!53736 m!563899))

(declare-fun m!563901 () Bool)

(assert (=> b!585478 m!563901))

(assert (=> b!585478 m!563891))

(declare-fun m!563903 () Bool)

(assert (=> b!585471 m!563903))

(assert (=> b!585469 m!563891))

(assert (=> b!585469 m!563891))

(declare-fun m!563905 () Bool)

(assert (=> b!585469 m!563905))

(declare-fun m!563907 () Bool)

(assert (=> b!585477 m!563907))

(declare-fun m!563909 () Bool)

(assert (=> b!585475 m!563909))

(check-sat (not b!585475) (not b!585469) (not b!585467) (not b!585471) (not b!585473) (not b!585470) (not b!585477) (not b!585472) (not b!585476) (not start!53736))
(check-sat)
