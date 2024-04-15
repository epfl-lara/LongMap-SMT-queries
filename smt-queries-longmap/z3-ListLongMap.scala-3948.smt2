; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53682 () Bool)

(assert start!53682)

(declare-fun b!585203 () Bool)

(declare-fun e!334824 () Bool)

(assert (=> b!585203 (= e!334824 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265600 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6010 0))(
  ( (MissingZero!6010 (index!26267 (_ BitVec 32))) (Found!6010 (index!26268 (_ BitVec 32))) (Intermediate!6010 (undefined!6822 Bool) (index!26269 (_ BitVec 32)) (x!55098 (_ BitVec 32))) (Undefined!6010) (MissingVacant!6010 (index!26270 (_ BitVec 32))) )
))
(declare-fun lt!265599 () SeekEntryResult!6010)

(declare-datatypes ((array!36597 0))(
  ( (array!36598 (arr!17573 (Array (_ BitVec 32) (_ BitVec 64))) (size!17938 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36597)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36597 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!585203 (= lt!265599 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265600 vacantSpotIndex!68 (select (arr!17573 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585204 () Bool)

(declare-fun res!373162 () Bool)

(declare-fun e!334822 () Bool)

(assert (=> b!585204 (=> (not res!373162) (not e!334822))))

(declare-datatypes ((List!11653 0))(
  ( (Nil!11650) (Cons!11649 (h!12694 (_ BitVec 64)) (t!17872 List!11653)) )
))
(declare-fun arrayNoDuplicates!0 (array!36597 (_ BitVec 32) List!11653) Bool)

(assert (=> b!585204 (= res!373162 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11650))))

(declare-fun b!585205 () Bool)

(declare-fun res!373163 () Bool)

(assert (=> b!585205 (=> (not res!373163) (not e!334822))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585205 (= res!373163 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17573 a!2986) index!984) (select (arr!17573 a!2986) j!136))) (not (= (select (arr!17573 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373170 () Bool)

(declare-fun e!334823 () Bool)

(assert (=> start!53682 (=> (not res!373170) (not e!334823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53682 (= res!373170 (validMask!0 mask!3053))))

(assert (=> start!53682 e!334823))

(assert (=> start!53682 true))

(declare-fun array_inv!13456 (array!36597) Bool)

(assert (=> start!53682 (array_inv!13456 a!2986)))

(declare-fun b!585206 () Bool)

(declare-fun res!373168 () Bool)

(assert (=> b!585206 (=> (not res!373168) (not e!334823))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585206 (= res!373168 (validKeyInArray!0 k0!1786))))

(declare-fun b!585207 () Bool)

(declare-fun res!373167 () Bool)

(assert (=> b!585207 (=> (not res!373167) (not e!334823))))

(assert (=> b!585207 (= res!373167 (validKeyInArray!0 (select (arr!17573 a!2986) j!136)))))

(declare-fun b!585208 () Bool)

(declare-fun res!373164 () Bool)

(assert (=> b!585208 (=> (not res!373164) (not e!334822))))

(assert (=> b!585208 (= res!373164 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17573 a!2986) j!136) a!2986 mask!3053) (Found!6010 j!136)))))

(declare-fun b!585209 () Bool)

(declare-fun res!373161 () Bool)

(assert (=> b!585209 (=> (not res!373161) (not e!334823))))

(declare-fun arrayContainsKey!0 (array!36597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585209 (= res!373161 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585210 () Bool)

(assert (=> b!585210 (= e!334822 e!334824)))

(declare-fun res!373172 () Bool)

(assert (=> b!585210 (=> (not res!373172) (not e!334824))))

(assert (=> b!585210 (= res!373172 (and (bvsge lt!265600 #b00000000000000000000000000000000) (bvslt lt!265600 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585210 (= lt!265600 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585211 () Bool)

(declare-fun res!373165 () Bool)

(assert (=> b!585211 (=> (not res!373165) (not e!334822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36597 (_ BitVec 32)) Bool)

(assert (=> b!585211 (= res!373165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585212 () Bool)

(declare-fun res!373166 () Bool)

(assert (=> b!585212 (=> (not res!373166) (not e!334823))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585212 (= res!373166 (and (= (size!17938 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17938 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17938 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585213 () Bool)

(declare-fun res!373171 () Bool)

(assert (=> b!585213 (=> (not res!373171) (not e!334822))))

(assert (=> b!585213 (= res!373171 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17573 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17573 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585214 () Bool)

(assert (=> b!585214 (= e!334823 e!334822)))

(declare-fun res!373169 () Bool)

(assert (=> b!585214 (=> (not res!373169) (not e!334822))))

(declare-fun lt!265598 () SeekEntryResult!6010)

(assert (=> b!585214 (= res!373169 (or (= lt!265598 (MissingZero!6010 i!1108)) (= lt!265598 (MissingVacant!6010 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36597 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!585214 (= lt!265598 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53682 res!373170) b!585212))

(assert (= (and b!585212 res!373166) b!585207))

(assert (= (and b!585207 res!373167) b!585206))

(assert (= (and b!585206 res!373168) b!585209))

(assert (= (and b!585209 res!373161) b!585214))

(assert (= (and b!585214 res!373169) b!585211))

(assert (= (and b!585211 res!373165) b!585204))

(assert (= (and b!585204 res!373162) b!585213))

(assert (= (and b!585213 res!373171) b!585208))

(assert (= (and b!585208 res!373164) b!585205))

(assert (= (and b!585205 res!373163) b!585210))

(assert (= (and b!585210 res!373172) b!585203))

(declare-fun m!562927 () Bool)

(assert (=> b!585211 m!562927))

(declare-fun m!562929 () Bool)

(assert (=> b!585209 m!562929))

(declare-fun m!562931 () Bool)

(assert (=> b!585207 m!562931))

(assert (=> b!585207 m!562931))

(declare-fun m!562933 () Bool)

(assert (=> b!585207 m!562933))

(assert (=> b!585203 m!562931))

(assert (=> b!585203 m!562931))

(declare-fun m!562935 () Bool)

(assert (=> b!585203 m!562935))

(declare-fun m!562937 () Bool)

(assert (=> b!585206 m!562937))

(declare-fun m!562939 () Bool)

(assert (=> b!585210 m!562939))

(declare-fun m!562941 () Bool)

(assert (=> start!53682 m!562941))

(declare-fun m!562943 () Bool)

(assert (=> start!53682 m!562943))

(declare-fun m!562945 () Bool)

(assert (=> b!585213 m!562945))

(declare-fun m!562947 () Bool)

(assert (=> b!585213 m!562947))

(declare-fun m!562949 () Bool)

(assert (=> b!585213 m!562949))

(assert (=> b!585208 m!562931))

(assert (=> b!585208 m!562931))

(declare-fun m!562951 () Bool)

(assert (=> b!585208 m!562951))

(declare-fun m!562953 () Bool)

(assert (=> b!585214 m!562953))

(declare-fun m!562955 () Bool)

(assert (=> b!585204 m!562955))

(declare-fun m!562957 () Bool)

(assert (=> b!585205 m!562957))

(assert (=> b!585205 m!562931))

(check-sat (not b!585211) (not b!585203) (not b!585204) (not b!585208) (not start!53682) (not b!585206) (not b!585210) (not b!585207) (not b!585214) (not b!585209))
(check-sat)
