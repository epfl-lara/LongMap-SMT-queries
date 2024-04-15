; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54048 () Bool)

(assert start!54048)

(declare-fun b!590199 () Bool)

(declare-fun res!377567 () Bool)

(declare-fun e!336935 () Bool)

(assert (=> b!590199 (=> (not res!377567) (not e!336935))))

(declare-datatypes ((array!36849 0))(
  ( (array!36850 (arr!17696 (Array (_ BitVec 32) (_ BitVec 64))) (size!18061 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36849)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590199 (= res!377567 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590200 () Bool)

(declare-fun res!377565 () Bool)

(declare-fun e!336933 () Bool)

(assert (=> b!590200 (=> (not res!377565) (not e!336933))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590200 (= res!377565 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17696 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590201 () Bool)

(declare-fun res!377559 () Bool)

(assert (=> b!590201 (=> (not res!377559) (not e!336935))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!590201 (= res!377559 (and (= (size!18061 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18061 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18061 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590202 () Bool)

(declare-fun e!336939 () Bool)

(declare-fun e!336937 () Bool)

(assert (=> b!590202 (= e!336939 e!336937)))

(declare-fun res!377563 () Bool)

(assert (=> b!590202 (=> (not res!377563) (not e!336937))))

(declare-datatypes ((SeekEntryResult!6133 0))(
  ( (MissingZero!6133 (index!26765 (_ BitVec 32))) (Found!6133 (index!26766 (_ BitVec 32))) (Intermediate!6133 (undefined!6945 Bool) (index!26767 (_ BitVec 32)) (x!55567 (_ BitVec 32))) (Undefined!6133) (MissingVacant!6133 (index!26768 (_ BitVec 32))) )
))
(declare-fun lt!267652 () SeekEntryResult!6133)

(assert (=> b!590202 (= res!377563 (and (= lt!267652 (Found!6133 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17696 a!2986) index!984) (select (arr!17696 a!2986) j!136))) (not (= (select (arr!17696 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36849 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!590202 (= lt!267652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17696 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590203 () Bool)

(assert (=> b!590203 (= e!336933 e!336939)))

(declare-fun res!377564 () Bool)

(assert (=> b!590203 (=> (not res!377564) (not e!336939))))

(assert (=> b!590203 (= res!377564 (= (select (store (arr!17696 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267654 () array!36849)

(assert (=> b!590203 (= lt!267654 (array!36850 (store (arr!17696 a!2986) i!1108 k0!1786) (size!18061 a!2986)))))

(declare-fun b!590204 () Bool)

(assert (=> b!590204 (= e!336935 e!336933)))

(declare-fun res!377569 () Bool)

(assert (=> b!590204 (=> (not res!377569) (not e!336933))))

(declare-fun lt!267653 () SeekEntryResult!6133)

(assert (=> b!590204 (= res!377569 (or (= lt!267653 (MissingZero!6133 i!1108)) (= lt!267653 (MissingVacant!6133 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36849 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!590204 (= lt!267653 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!336938 () Bool)

(declare-fun b!590205 () Bool)

(assert (=> b!590205 (= e!336938 (arrayContainsKey!0 lt!267654 (select (arr!17696 a!2986) j!136) j!136))))

(declare-fun b!590206 () Bool)

(declare-datatypes ((Unit!18444 0))(
  ( (Unit!18445) )
))
(declare-fun e!336936 () Unit!18444)

(declare-fun Unit!18446 () Unit!18444)

(assert (=> b!590206 (= e!336936 Unit!18446)))

(assert (=> b!590206 false))

(declare-fun b!590208 () Bool)

(declare-fun Unit!18447 () Unit!18444)

(assert (=> b!590208 (= e!336936 Unit!18447)))

(declare-fun b!590209 () Bool)

(declare-fun res!377566 () Bool)

(assert (=> b!590209 (=> (not res!377566) (not e!336933))))

(declare-datatypes ((List!11776 0))(
  ( (Nil!11773) (Cons!11772 (h!12817 (_ BitVec 64)) (t!17995 List!11776)) )
))
(declare-fun arrayNoDuplicates!0 (array!36849 (_ BitVec 32) List!11776) Bool)

(assert (=> b!590209 (= res!377566 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11773))))

(declare-fun b!590210 () Bool)

(declare-fun e!336934 () Bool)

(declare-fun lt!267651 () SeekEntryResult!6133)

(assert (=> b!590210 (= e!336934 (= lt!267652 lt!267651))))

(declare-fun b!590211 () Bool)

(declare-fun res!377573 () Bool)

(assert (=> b!590211 (=> (not res!377573) (not e!336935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590211 (= res!377573 (validKeyInArray!0 k0!1786))))

(declare-fun b!590212 () Bool)

(declare-fun res!377572 () Bool)

(assert (=> b!590212 (=> (not res!377572) (not e!336935))))

(assert (=> b!590212 (= res!377572 (validKeyInArray!0 (select (arr!17696 a!2986) j!136)))))

(declare-fun b!590213 () Bool)

(declare-fun e!336930 () Bool)

(assert (=> b!590213 (= e!336930 e!336938)))

(declare-fun res!377568 () Bool)

(assert (=> b!590213 (=> res!377568 e!336938)))

(declare-fun lt!267649 () (_ BitVec 64))

(assert (=> b!590213 (= res!377568 (or (not (= (select (arr!17696 a!2986) j!136) lt!267649)) (not (= (select (arr!17696 a!2986) j!136) (select (store (arr!17696 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590214 () Bool)

(declare-fun e!336931 () Bool)

(assert (=> b!590214 (= e!336931 (or (not (= (select (arr!17696 a!2986) j!136) lt!267649)) (not (= (select (arr!17696 a!2986) j!136) (select (store (arr!17696 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt index!984 (size!18061 a!2986))))))

(assert (=> b!590214 e!336930))

(declare-fun res!377560 () Bool)

(assert (=> b!590214 (=> (not res!377560) (not e!336930))))

(assert (=> b!590214 (= res!377560 (= (select (store (arr!17696 a!2986) i!1108 k0!1786) index!984) (select (arr!17696 a!2986) j!136)))))

(declare-fun b!590215 () Bool)

(assert (=> b!590215 (= e!336937 (not e!336931))))

(declare-fun res!377561 () Bool)

(assert (=> b!590215 (=> res!377561 e!336931)))

(declare-fun lt!267648 () SeekEntryResult!6133)

(assert (=> b!590215 (= res!377561 (not (= lt!267648 (Found!6133 index!984))))))

(declare-fun lt!267650 () Unit!18444)

(assert (=> b!590215 (= lt!267650 e!336936)))

(declare-fun c!66687 () Bool)

(assert (=> b!590215 (= c!66687 (= lt!267648 Undefined!6133))))

(assert (=> b!590215 (= lt!267648 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267649 lt!267654 mask!3053))))

(assert (=> b!590215 e!336934))

(declare-fun res!377562 () Bool)

(assert (=> b!590215 (=> (not res!377562) (not e!336934))))

(declare-fun lt!267647 () (_ BitVec 32))

(assert (=> b!590215 (= res!377562 (= lt!267651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267647 vacantSpotIndex!68 lt!267649 lt!267654 mask!3053)))))

(assert (=> b!590215 (= lt!267651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267647 vacantSpotIndex!68 (select (arr!17696 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590215 (= lt!267649 (select (store (arr!17696 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267655 () Unit!18444)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18444)

(assert (=> b!590215 (= lt!267655 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267647 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590215 (= lt!267647 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!377570 () Bool)

(assert (=> start!54048 (=> (not res!377570) (not e!336935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54048 (= res!377570 (validMask!0 mask!3053))))

(assert (=> start!54048 e!336935))

(assert (=> start!54048 true))

(declare-fun array_inv!13579 (array!36849) Bool)

(assert (=> start!54048 (array_inv!13579 a!2986)))

(declare-fun b!590207 () Bool)

(declare-fun res!377571 () Bool)

(assert (=> b!590207 (=> (not res!377571) (not e!336933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36849 (_ BitVec 32)) Bool)

(assert (=> b!590207 (= res!377571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54048 res!377570) b!590201))

(assert (= (and b!590201 res!377559) b!590212))

(assert (= (and b!590212 res!377572) b!590211))

(assert (= (and b!590211 res!377573) b!590199))

(assert (= (and b!590199 res!377567) b!590204))

(assert (= (and b!590204 res!377569) b!590207))

(assert (= (and b!590207 res!377571) b!590209))

(assert (= (and b!590209 res!377566) b!590200))

(assert (= (and b!590200 res!377565) b!590203))

(assert (= (and b!590203 res!377564) b!590202))

(assert (= (and b!590202 res!377563) b!590215))

(assert (= (and b!590215 res!377562) b!590210))

(assert (= (and b!590215 c!66687) b!590206))

(assert (= (and b!590215 (not c!66687)) b!590208))

(assert (= (and b!590215 (not res!377561)) b!590214))

(assert (= (and b!590214 res!377560) b!590213))

(assert (= (and b!590213 (not res!377568)) b!590205))

(declare-fun m!568087 () Bool)

(assert (=> b!590212 m!568087))

(assert (=> b!590212 m!568087))

(declare-fun m!568089 () Bool)

(assert (=> b!590212 m!568089))

(declare-fun m!568091 () Bool)

(assert (=> b!590215 m!568091))

(declare-fun m!568093 () Bool)

(assert (=> b!590215 m!568093))

(assert (=> b!590215 m!568087))

(declare-fun m!568095 () Bool)

(assert (=> b!590215 m!568095))

(declare-fun m!568097 () Bool)

(assert (=> b!590215 m!568097))

(assert (=> b!590215 m!568087))

(declare-fun m!568099 () Bool)

(assert (=> b!590215 m!568099))

(declare-fun m!568101 () Bool)

(assert (=> b!590215 m!568101))

(declare-fun m!568103 () Bool)

(assert (=> b!590215 m!568103))

(assert (=> b!590205 m!568087))

(assert (=> b!590205 m!568087))

(declare-fun m!568105 () Bool)

(assert (=> b!590205 m!568105))

(declare-fun m!568107 () Bool)

(assert (=> b!590204 m!568107))

(declare-fun m!568109 () Bool)

(assert (=> b!590202 m!568109))

(assert (=> b!590202 m!568087))

(assert (=> b!590202 m!568087))

(declare-fun m!568111 () Bool)

(assert (=> b!590202 m!568111))

(assert (=> b!590214 m!568087))

(assert (=> b!590214 m!568097))

(declare-fun m!568113 () Bool)

(assert (=> b!590214 m!568113))

(assert (=> b!590203 m!568097))

(declare-fun m!568115 () Bool)

(assert (=> b!590203 m!568115))

(declare-fun m!568117 () Bool)

(assert (=> b!590209 m!568117))

(declare-fun m!568119 () Bool)

(assert (=> b!590207 m!568119))

(declare-fun m!568121 () Bool)

(assert (=> b!590199 m!568121))

(declare-fun m!568123 () Bool)

(assert (=> b!590211 m!568123))

(declare-fun m!568125 () Bool)

(assert (=> start!54048 m!568125))

(declare-fun m!568127 () Bool)

(assert (=> start!54048 m!568127))

(declare-fun m!568129 () Bool)

(assert (=> b!590200 m!568129))

(assert (=> b!590213 m!568087))

(assert (=> b!590213 m!568097))

(assert (=> b!590213 m!568113))

(check-sat (not b!590199) (not b!590204) (not b!590209) (not b!590212) (not b!590211) (not start!54048) (not b!590207) (not b!590215) (not b!590205) (not b!590202))
(check-sat)
