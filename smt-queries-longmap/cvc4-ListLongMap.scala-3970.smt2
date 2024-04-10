; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53894 () Bool)

(assert start!53894)

(declare-fun b!587977 () Bool)

(declare-fun res!375616 () Bool)

(declare-fun e!335813 () Bool)

(assert (=> b!587977 (=> (not res!375616) (not e!335813))))

(declare-datatypes ((array!36738 0))(
  ( (array!36739 (arr!17642 (Array (_ BitVec 32) (_ BitVec 64))) (size!18006 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36738)

(declare-datatypes ((List!11683 0))(
  ( (Nil!11680) (Cons!11679 (h!12724 (_ BitVec 64)) (t!17911 List!11683)) )
))
(declare-fun arrayNoDuplicates!0 (array!36738 (_ BitVec 32) List!11683) Bool)

(assert (=> b!587977 (= res!375616 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11680))))

(declare-fun b!587978 () Bool)

(declare-fun res!375613 () Bool)

(assert (=> b!587978 (=> (not res!375613) (not e!335813))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587978 (= res!375613 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17642 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17642 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587979 () Bool)

(declare-fun res!375615 () Bool)

(declare-fun e!335812 () Bool)

(assert (=> b!587979 (=> (not res!375615) (not e!335812))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587979 (= res!375615 (validKeyInArray!0 (select (arr!17642 a!2986) j!136)))))

(declare-fun b!587980 () Bool)

(declare-fun res!375618 () Bool)

(assert (=> b!587980 (=> (not res!375618) (not e!335812))))

(assert (=> b!587980 (= res!375618 (and (= (size!18006 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18006 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18006 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587981 () Bool)

(declare-fun res!375622 () Bool)

(assert (=> b!587981 (=> (not res!375622) (not e!335812))))

(assert (=> b!587981 (= res!375622 (validKeyInArray!0 k!1786))))

(declare-fun b!587982 () Bool)

(declare-fun e!335811 () Bool)

(declare-datatypes ((SeekEntryResult!6082 0))(
  ( (MissingZero!6082 (index!26558 (_ BitVec 32))) (Found!6082 (index!26559 (_ BitVec 32))) (Intermediate!6082 (undefined!6894 Bool) (index!26560 (_ BitVec 32)) (x!55360 (_ BitVec 32))) (Undefined!6082) (MissingVacant!6082 (index!26561 (_ BitVec 32))) )
))
(declare-fun lt!266583 () SeekEntryResult!6082)

(declare-fun lt!266582 () SeekEntryResult!6082)

(assert (=> b!587982 (= e!335811 (= lt!266583 lt!266582))))

(declare-fun b!587983 () Bool)

(assert (=> b!587983 (= e!335812 e!335813)))

(declare-fun res!375620 () Bool)

(assert (=> b!587983 (=> (not res!375620) (not e!335813))))

(declare-fun lt!266581 () SeekEntryResult!6082)

(assert (=> b!587983 (= res!375620 (or (= lt!266581 (MissingZero!6082 i!1108)) (= lt!266581 (MissingVacant!6082 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36738 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!587983 (= lt!266581 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!375617 () Bool)

(assert (=> start!53894 (=> (not res!375617) (not e!335812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53894 (= res!375617 (validMask!0 mask!3053))))

(assert (=> start!53894 e!335812))

(assert (=> start!53894 true))

(declare-fun array_inv!13438 (array!36738) Bool)

(assert (=> start!53894 (array_inv!13438 a!2986)))

(declare-fun b!587984 () Bool)

(declare-fun res!375614 () Bool)

(assert (=> b!587984 (=> (not res!375614) (not e!335812))))

(declare-fun arrayContainsKey!0 (array!36738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587984 (= res!375614 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587985 () Bool)

(declare-fun e!335810 () Bool)

(assert (=> b!587985 (= e!335810 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(assert (=> b!587985 e!335811))

(declare-fun res!375623 () Bool)

(assert (=> b!587985 (=> (not res!375623) (not e!335811))))

(declare-fun lt!266580 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36738 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!587985 (= res!375623 (= lt!266582 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266580 vacantSpotIndex!68 (select (store (arr!17642 a!2986) i!1108 k!1786) j!136) (array!36739 (store (arr!17642 a!2986) i!1108 k!1786) (size!18006 a!2986)) mask!3053)))))

(assert (=> b!587985 (= lt!266582 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266580 vacantSpotIndex!68 (select (arr!17642 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18284 0))(
  ( (Unit!18285) )
))
(declare-fun lt!266584 () Unit!18284)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36738 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18284)

(assert (=> b!587985 (= lt!266584 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266580 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587985 (= lt!266580 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587986 () Bool)

(assert (=> b!587986 (= e!335813 e!335810)))

(declare-fun res!375621 () Bool)

(assert (=> b!587986 (=> (not res!375621) (not e!335810))))

(assert (=> b!587986 (= res!375621 (and (= lt!266583 (Found!6082 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17642 a!2986) index!984) (select (arr!17642 a!2986) j!136))) (not (= (select (arr!17642 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587986 (= lt!266583 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17642 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587987 () Bool)

(declare-fun res!375619 () Bool)

(assert (=> b!587987 (=> (not res!375619) (not e!335813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36738 (_ BitVec 32)) Bool)

(assert (=> b!587987 (= res!375619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53894 res!375617) b!587980))

(assert (= (and b!587980 res!375618) b!587979))

(assert (= (and b!587979 res!375615) b!587981))

(assert (= (and b!587981 res!375622) b!587984))

(assert (= (and b!587984 res!375614) b!587983))

(assert (= (and b!587983 res!375620) b!587987))

(assert (= (and b!587987 res!375619) b!587977))

(assert (= (and b!587977 res!375616) b!587978))

(assert (= (and b!587978 res!375613) b!587986))

(assert (= (and b!587986 res!375621) b!587985))

(assert (= (and b!587985 res!375623) b!587982))

(declare-fun m!566459 () Bool)

(assert (=> b!587985 m!566459))

(declare-fun m!566461 () Bool)

(assert (=> b!587985 m!566461))

(declare-fun m!566463 () Bool)

(assert (=> b!587985 m!566463))

(declare-fun m!566465 () Bool)

(assert (=> b!587985 m!566465))

(assert (=> b!587985 m!566461))

(declare-fun m!566467 () Bool)

(assert (=> b!587985 m!566467))

(declare-fun m!566469 () Bool)

(assert (=> b!587985 m!566469))

(assert (=> b!587985 m!566463))

(declare-fun m!566471 () Bool)

(assert (=> b!587985 m!566471))

(declare-fun m!566473 () Bool)

(assert (=> b!587986 m!566473))

(assert (=> b!587986 m!566463))

(assert (=> b!587986 m!566463))

(declare-fun m!566475 () Bool)

(assert (=> b!587986 m!566475))

(declare-fun m!566477 () Bool)

(assert (=> start!53894 m!566477))

(declare-fun m!566479 () Bool)

(assert (=> start!53894 m!566479))

(declare-fun m!566481 () Bool)

(assert (=> b!587983 m!566481))

(assert (=> b!587979 m!566463))

(assert (=> b!587979 m!566463))

(declare-fun m!566483 () Bool)

(assert (=> b!587979 m!566483))

(declare-fun m!566485 () Bool)

(assert (=> b!587978 m!566485))

(assert (=> b!587978 m!566465))

(declare-fun m!566487 () Bool)

(assert (=> b!587978 m!566487))

(declare-fun m!566489 () Bool)

(assert (=> b!587984 m!566489))

(declare-fun m!566491 () Bool)

(assert (=> b!587977 m!566491))

(declare-fun m!566493 () Bool)

(assert (=> b!587981 m!566493))

(declare-fun m!566495 () Bool)

(assert (=> b!587987 m!566495))

(push 1)

