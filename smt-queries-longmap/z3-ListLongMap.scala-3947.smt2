; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53742 () Bool)

(assert start!53742)

(declare-fun b!585575 () Bool)

(declare-fun e!335090 () Bool)

(declare-fun e!335091 () Bool)

(assert (=> b!585575 (= e!335090 e!335091)))

(declare-fun res!373287 () Bool)

(assert (=> b!585575 (=> (not res!373287) (not e!335091))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265908 () (_ BitVec 32))

(assert (=> b!585575 (= res!373287 (and (bvsge lt!265908 #b00000000000000000000000000000000) (bvslt lt!265908 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585575 (= lt!265908 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585576 () Bool)

(declare-fun res!373296 () Bool)

(declare-fun e!335089 () Bool)

(assert (=> b!585576 (=> (not res!373296) (not e!335089))))

(declare-datatypes ((array!36588 0))(
  ( (array!36589 (arr!17566 (Array (_ BitVec 32) (_ BitVec 64))) (size!17930 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36588)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585576 (= res!373296 (validKeyInArray!0 (select (arr!17566 a!2986) j!136)))))

(declare-fun b!585577 () Bool)

(declare-fun res!373297 () Bool)

(assert (=> b!585577 (=> (not res!373297) (not e!335089))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585577 (= res!373297 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585578 () Bool)

(declare-fun res!373291 () Bool)

(assert (=> b!585578 (=> (not res!373291) (not e!335089))))

(assert (=> b!585578 (= res!373291 (validKeyInArray!0 k0!1786))))

(declare-fun b!585579 () Bool)

(declare-fun res!373289 () Bool)

(assert (=> b!585579 (=> (not res!373289) (not e!335090))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!585579 (= res!373289 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17566 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17566 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!373288 () Bool)

(assert (=> start!53742 (=> (not res!373288) (not e!335089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53742 (= res!373288 (validMask!0 mask!3053))))

(assert (=> start!53742 e!335089))

(assert (=> start!53742 true))

(declare-fun array_inv!13425 (array!36588) Bool)

(assert (=> start!53742 (array_inv!13425 a!2986)))

(declare-fun b!585580 () Bool)

(declare-fun res!373294 () Bool)

(assert (=> b!585580 (=> (not res!373294) (not e!335090))))

(assert (=> b!585580 (= res!373294 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17566 a!2986) index!984) (select (arr!17566 a!2986) j!136))) (not (= (select (arr!17566 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585581 () Bool)

(declare-fun res!373286 () Bool)

(assert (=> b!585581 (=> (not res!373286) (not e!335090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36588 (_ BitVec 32)) Bool)

(assert (=> b!585581 (= res!373286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585582 () Bool)

(assert (=> b!585582 (= e!335091 false)))

(declare-datatypes ((SeekEntryResult!5962 0))(
  ( (MissingZero!5962 (index!26075 (_ BitVec 32))) (Found!5962 (index!26076 (_ BitVec 32))) (Intermediate!5962 (undefined!6774 Bool) (index!26077 (_ BitVec 32)) (x!55050 (_ BitVec 32))) (Undefined!5962) (MissingVacant!5962 (index!26078 (_ BitVec 32))) )
))
(declare-fun lt!265907 () SeekEntryResult!5962)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36588 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!585582 (= lt!265907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265908 vacantSpotIndex!68 (select (arr!17566 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585583 () Bool)

(declare-fun res!373295 () Bool)

(assert (=> b!585583 (=> (not res!373295) (not e!335090))))

(assert (=> b!585583 (= res!373295 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17566 a!2986) j!136) a!2986 mask!3053) (Found!5962 j!136)))))

(declare-fun b!585584 () Bool)

(assert (=> b!585584 (= e!335089 e!335090)))

(declare-fun res!373293 () Bool)

(assert (=> b!585584 (=> (not res!373293) (not e!335090))))

(declare-fun lt!265909 () SeekEntryResult!5962)

(assert (=> b!585584 (= res!373293 (or (= lt!265909 (MissingZero!5962 i!1108)) (= lt!265909 (MissingVacant!5962 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36588 (_ BitVec 32)) SeekEntryResult!5962)

(assert (=> b!585584 (= lt!265909 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585585 () Bool)

(declare-fun res!373290 () Bool)

(assert (=> b!585585 (=> (not res!373290) (not e!335090))))

(declare-datatypes ((List!11514 0))(
  ( (Nil!11511) (Cons!11510 (h!12558 (_ BitVec 64)) (t!17734 List!11514)) )
))
(declare-fun arrayNoDuplicates!0 (array!36588 (_ BitVec 32) List!11514) Bool)

(assert (=> b!585585 (= res!373290 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11511))))

(declare-fun b!585586 () Bool)

(declare-fun res!373292 () Bool)

(assert (=> b!585586 (=> (not res!373292) (not e!335089))))

(assert (=> b!585586 (= res!373292 (and (= (size!17930 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17930 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17930 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53742 res!373288) b!585586))

(assert (= (and b!585586 res!373292) b!585576))

(assert (= (and b!585576 res!373296) b!585578))

(assert (= (and b!585578 res!373291) b!585577))

(assert (= (and b!585577 res!373297) b!585584))

(assert (= (and b!585584 res!373293) b!585581))

(assert (= (and b!585581 res!373286) b!585585))

(assert (= (and b!585585 res!373290) b!585579))

(assert (= (and b!585579 res!373289) b!585583))

(assert (= (and b!585583 res!373295) b!585580))

(assert (= (and b!585580 res!373294) b!585575))

(assert (= (and b!585575 res!373287) b!585582))

(declare-fun m!563975 () Bool)

(assert (=> b!585578 m!563975))

(declare-fun m!563977 () Bool)

(assert (=> b!585585 m!563977))

(declare-fun m!563979 () Bool)

(assert (=> b!585584 m!563979))

(declare-fun m!563981 () Bool)

(assert (=> b!585579 m!563981))

(declare-fun m!563983 () Bool)

(assert (=> b!585579 m!563983))

(declare-fun m!563985 () Bool)

(assert (=> b!585579 m!563985))

(declare-fun m!563987 () Bool)

(assert (=> b!585577 m!563987))

(declare-fun m!563989 () Bool)

(assert (=> b!585582 m!563989))

(assert (=> b!585582 m!563989))

(declare-fun m!563991 () Bool)

(assert (=> b!585582 m!563991))

(declare-fun m!563993 () Bool)

(assert (=> b!585581 m!563993))

(declare-fun m!563995 () Bool)

(assert (=> b!585580 m!563995))

(assert (=> b!585580 m!563989))

(declare-fun m!563997 () Bool)

(assert (=> start!53742 m!563997))

(declare-fun m!563999 () Bool)

(assert (=> start!53742 m!563999))

(assert (=> b!585583 m!563989))

(assert (=> b!585583 m!563989))

(declare-fun m!564001 () Bool)

(assert (=> b!585583 m!564001))

(assert (=> b!585576 m!563989))

(assert (=> b!585576 m!563989))

(declare-fun m!564003 () Bool)

(assert (=> b!585576 m!564003))

(declare-fun m!564005 () Bool)

(assert (=> b!585575 m!564005))

(check-sat (not b!585582) (not b!585575) (not b!585583) (not b!585584) (not b!585577) (not b!585576) (not b!585581) (not b!585585) (not b!585578) (not start!53742))
(check-sat)
