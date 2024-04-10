; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53868 () Bool)

(assert start!53868)

(declare-fun b!587548 () Bool)

(declare-fun res!375184 () Bool)

(declare-fun e!335659 () Bool)

(assert (=> b!587548 (=> (not res!375184) (not e!335659))))

(declare-datatypes ((array!36712 0))(
  ( (array!36713 (arr!17629 (Array (_ BitVec 32) (_ BitVec 64))) (size!17993 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36712)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587548 (= res!375184 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!375190 () Bool)

(assert (=> start!53868 (=> (not res!375190) (not e!335659))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53868 (= res!375190 (validMask!0 mask!3053))))

(assert (=> start!53868 e!335659))

(assert (=> start!53868 true))

(declare-fun array_inv!13425 (array!36712) Bool)

(assert (=> start!53868 (array_inv!13425 a!2986)))

(declare-fun b!587549 () Bool)

(declare-fun res!375187 () Bool)

(declare-fun e!335660 () Bool)

(assert (=> b!587549 (=> (not res!375187) (not e!335660))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6069 0))(
  ( (MissingZero!6069 (index!26506 (_ BitVec 32))) (Found!6069 (index!26507 (_ BitVec 32))) (Intermediate!6069 (undefined!6881 Bool) (index!26508 (_ BitVec 32)) (x!55315 (_ BitVec 32))) (Undefined!6069) (MissingVacant!6069 (index!26509 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36712 (_ BitVec 32)) SeekEntryResult!6069)

(assert (=> b!587549 (= res!375187 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17629 a!2986) j!136) a!2986 mask!3053) (Found!6069 j!136)))))

(declare-fun b!587550 () Bool)

(declare-fun res!375186 () Bool)

(assert (=> b!587550 (=> (not res!375186) (not e!335659))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587550 (= res!375186 (and (= (size!17993 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17993 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17993 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587551 () Bool)

(declare-fun res!375185 () Bool)

(assert (=> b!587551 (=> (not res!375185) (not e!335660))))

(assert (=> b!587551 (= res!375185 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17629 a!2986) index!984) (select (arr!17629 a!2986) j!136))) (not (= (select (arr!17629 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587552 () Bool)

(declare-fun res!375189 () Bool)

(assert (=> b!587552 (=> (not res!375189) (not e!335660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36712 (_ BitVec 32)) Bool)

(assert (=> b!587552 (= res!375189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587553 () Bool)

(declare-fun res!375188 () Bool)

(assert (=> b!587553 (=> (not res!375188) (not e!335660))))

(assert (=> b!587553 (= res!375188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17629 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17629 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587554 () Bool)

(declare-fun res!375192 () Bool)

(assert (=> b!587554 (=> (not res!375192) (not e!335659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587554 (= res!375192 (validKeyInArray!0 (select (arr!17629 a!2986) j!136)))))

(declare-fun b!587555 () Bool)

(declare-fun res!375193 () Bool)

(assert (=> b!587555 (=> (not res!375193) (not e!335659))))

(assert (=> b!587555 (= res!375193 (validKeyInArray!0 k0!1786))))

(declare-fun b!587556 () Bool)

(declare-fun res!375191 () Bool)

(assert (=> b!587556 (=> (not res!375191) (not e!335660))))

(declare-datatypes ((List!11670 0))(
  ( (Nil!11667) (Cons!11666 (h!12711 (_ BitVec 64)) (t!17898 List!11670)) )
))
(declare-fun arrayNoDuplicates!0 (array!36712 (_ BitVec 32) List!11670) Bool)

(assert (=> b!587556 (= res!375191 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11667))))

(declare-fun b!587557 () Bool)

(assert (=> b!587557 (= e!335659 e!335660)))

(declare-fun res!375194 () Bool)

(assert (=> b!587557 (=> (not res!375194) (not e!335660))))

(declare-fun lt!266429 () SeekEntryResult!6069)

(assert (=> b!587557 (= res!375194 (or (= lt!266429 (MissingZero!6069 i!1108)) (= lt!266429 (MissingVacant!6069 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36712 (_ BitVec 32)) SeekEntryResult!6069)

(assert (=> b!587557 (= lt!266429 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587558 () Bool)

(assert (=> b!587558 (= e!335660 (not true))))

(declare-fun lt!266430 () (_ BitVec 32))

(assert (=> b!587558 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266430 vacantSpotIndex!68 (select (arr!17629 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266430 vacantSpotIndex!68 (select (store (arr!17629 a!2986) i!1108 k0!1786) j!136) (array!36713 (store (arr!17629 a!2986) i!1108 k0!1786) (size!17993 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18258 0))(
  ( (Unit!18259) )
))
(declare-fun lt!266431 () Unit!18258)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36712 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18258)

(assert (=> b!587558 (= lt!266431 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266430 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587558 (= lt!266430 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53868 res!375190) b!587550))

(assert (= (and b!587550 res!375186) b!587554))

(assert (= (and b!587554 res!375192) b!587555))

(assert (= (and b!587555 res!375193) b!587548))

(assert (= (and b!587548 res!375184) b!587557))

(assert (= (and b!587557 res!375194) b!587552))

(assert (= (and b!587552 res!375189) b!587556))

(assert (= (and b!587556 res!375191) b!587553))

(assert (= (and b!587553 res!375188) b!587549))

(assert (= (and b!587549 res!375187) b!587551))

(assert (= (and b!587551 res!375185) b!587558))

(declare-fun m!565965 () Bool)

(assert (=> b!587552 m!565965))

(declare-fun m!565967 () Bool)

(assert (=> b!587556 m!565967))

(declare-fun m!565969 () Bool)

(assert (=> b!587557 m!565969))

(declare-fun m!565971 () Bool)

(assert (=> start!53868 m!565971))

(declare-fun m!565973 () Bool)

(assert (=> start!53868 m!565973))

(declare-fun m!565975 () Bool)

(assert (=> b!587551 m!565975))

(declare-fun m!565977 () Bool)

(assert (=> b!587551 m!565977))

(assert (=> b!587554 m!565977))

(assert (=> b!587554 m!565977))

(declare-fun m!565979 () Bool)

(assert (=> b!587554 m!565979))

(assert (=> b!587558 m!565977))

(declare-fun m!565981 () Bool)

(assert (=> b!587558 m!565981))

(declare-fun m!565983 () Bool)

(assert (=> b!587558 m!565983))

(assert (=> b!587558 m!565977))

(declare-fun m!565985 () Bool)

(assert (=> b!587558 m!565985))

(declare-fun m!565987 () Bool)

(assert (=> b!587558 m!565987))

(declare-fun m!565989 () Bool)

(assert (=> b!587558 m!565989))

(assert (=> b!587558 m!565987))

(declare-fun m!565991 () Bool)

(assert (=> b!587558 m!565991))

(declare-fun m!565993 () Bool)

(assert (=> b!587555 m!565993))

(declare-fun m!565995 () Bool)

(assert (=> b!587548 m!565995))

(assert (=> b!587549 m!565977))

(assert (=> b!587549 m!565977))

(declare-fun m!565997 () Bool)

(assert (=> b!587549 m!565997))

(declare-fun m!565999 () Bool)

(assert (=> b!587553 m!565999))

(assert (=> b!587553 m!565985))

(declare-fun m!566001 () Bool)

(assert (=> b!587553 m!566001))

(check-sat (not b!587548) (not b!587557) (not b!587549) (not b!587555) (not b!587558) (not b!587552) (not b!587554) (not start!53868) (not b!587556))
