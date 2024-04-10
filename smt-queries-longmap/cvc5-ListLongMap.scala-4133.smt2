; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56392 () Bool)

(assert start!56392)

(declare-fun b!625023 () Bool)

(declare-fun res!403032 () Bool)

(declare-fun e!358349 () Bool)

(assert (=> b!625023 (=> (not res!403032) (not e!358349))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37772 0))(
  ( (array!37773 (arr!18129 (Array (_ BitVec 32) (_ BitVec 64))) (size!18493 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37772)

(assert (=> b!625023 (= res!403032 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18129 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18129 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625024 () Bool)

(declare-fun res!403036 () Bool)

(assert (=> b!625024 (=> (not res!403036) (not e!358349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37772 (_ BitVec 32)) Bool)

(assert (=> b!625024 (= res!403036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625025 () Bool)

(declare-fun res!403034 () Bool)

(assert (=> b!625025 (=> (not res!403034) (not e!358349))))

(declare-datatypes ((List!12170 0))(
  ( (Nil!12167) (Cons!12166 (h!13211 (_ BitVec 64)) (t!18398 List!12170)) )
))
(declare-fun arrayNoDuplicates!0 (array!37772 (_ BitVec 32) List!12170) Bool)

(assert (=> b!625025 (= res!403034 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12167))))

(declare-fun b!625026 () Bool)

(declare-fun res!403037 () Bool)

(declare-fun e!358348 () Bool)

(assert (=> b!625026 (=> (not res!403037) (not e!358348))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625026 (= res!403037 (and (= (size!18493 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18493 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18493 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625027 () Bool)

(assert (=> b!625027 (= e!358349 false)))

(declare-datatypes ((SeekEntryResult!6569 0))(
  ( (MissingZero!6569 (index!28560 (_ BitVec 32))) (Found!6569 (index!28561 (_ BitVec 32))) (Intermediate!6569 (undefined!7381 Bool) (index!28562 (_ BitVec 32)) (x!57319 (_ BitVec 32))) (Undefined!6569) (MissingVacant!6569 (index!28563 (_ BitVec 32))) )
))
(declare-fun lt!289744 () SeekEntryResult!6569)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37772 (_ BitVec 32)) SeekEntryResult!6569)

(assert (=> b!625027 (= lt!289744 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18129 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625028 () Bool)

(declare-fun res!403030 () Bool)

(assert (=> b!625028 (=> (not res!403030) (not e!358348))))

(declare-fun arrayContainsKey!0 (array!37772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625028 (= res!403030 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625029 () Bool)

(assert (=> b!625029 (= e!358348 e!358349)))

(declare-fun res!403035 () Bool)

(assert (=> b!625029 (=> (not res!403035) (not e!358349))))

(declare-fun lt!289743 () SeekEntryResult!6569)

(assert (=> b!625029 (= res!403035 (or (= lt!289743 (MissingZero!6569 i!1108)) (= lt!289743 (MissingVacant!6569 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37772 (_ BitVec 32)) SeekEntryResult!6569)

(assert (=> b!625029 (= lt!289743 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!403033 () Bool)

(assert (=> start!56392 (=> (not res!403033) (not e!358348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56392 (= res!403033 (validMask!0 mask!3053))))

(assert (=> start!56392 e!358348))

(assert (=> start!56392 true))

(declare-fun array_inv!13925 (array!37772) Bool)

(assert (=> start!56392 (array_inv!13925 a!2986)))

(declare-fun b!625030 () Bool)

(declare-fun res!403029 () Bool)

(assert (=> b!625030 (=> (not res!403029) (not e!358348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625030 (= res!403029 (validKeyInArray!0 k!1786))))

(declare-fun b!625031 () Bool)

(declare-fun res!403031 () Bool)

(assert (=> b!625031 (=> (not res!403031) (not e!358348))))

(assert (=> b!625031 (= res!403031 (validKeyInArray!0 (select (arr!18129 a!2986) j!136)))))

(assert (= (and start!56392 res!403033) b!625026))

(assert (= (and b!625026 res!403037) b!625031))

(assert (= (and b!625031 res!403031) b!625030))

(assert (= (and b!625030 res!403029) b!625028))

(assert (= (and b!625028 res!403030) b!625029))

(assert (= (and b!625029 res!403035) b!625024))

(assert (= (and b!625024 res!403036) b!625025))

(assert (= (and b!625025 res!403034) b!625023))

(assert (= (and b!625023 res!403032) b!625027))

(declare-fun m!600617 () Bool)

(assert (=> b!625027 m!600617))

(assert (=> b!625027 m!600617))

(declare-fun m!600619 () Bool)

(assert (=> b!625027 m!600619))

(declare-fun m!600621 () Bool)

(assert (=> b!625025 m!600621))

(assert (=> b!625031 m!600617))

(assert (=> b!625031 m!600617))

(declare-fun m!600623 () Bool)

(assert (=> b!625031 m!600623))

(declare-fun m!600625 () Bool)

(assert (=> b!625024 m!600625))

(declare-fun m!600627 () Bool)

(assert (=> start!56392 m!600627))

(declare-fun m!600629 () Bool)

(assert (=> start!56392 m!600629))

(declare-fun m!600631 () Bool)

(assert (=> b!625023 m!600631))

(declare-fun m!600633 () Bool)

(assert (=> b!625023 m!600633))

(declare-fun m!600635 () Bool)

(assert (=> b!625023 m!600635))

(declare-fun m!600637 () Bool)

(assert (=> b!625029 m!600637))

(declare-fun m!600639 () Bool)

(assert (=> b!625030 m!600639))

(declare-fun m!600641 () Bool)

(assert (=> b!625028 m!600641))

(push 1)

