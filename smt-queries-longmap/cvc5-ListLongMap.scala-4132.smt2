; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56386 () Bool)

(assert start!56386)

(declare-fun b!624942 () Bool)

(declare-fun res!402948 () Bool)

(declare-fun e!358321 () Bool)

(assert (=> b!624942 (=> (not res!402948) (not e!358321))))

(declare-datatypes ((array!37766 0))(
  ( (array!37767 (arr!18126 (Array (_ BitVec 32) (_ BitVec 64))) (size!18490 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37766)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624942 (= res!402948 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624943 () Bool)

(declare-fun res!402955 () Bool)

(assert (=> b!624943 (=> (not res!402955) (not e!358321))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624943 (= res!402955 (validKeyInArray!0 (select (arr!18126 a!2986) j!136)))))

(declare-fun b!624944 () Bool)

(declare-fun res!402952 () Bool)

(assert (=> b!624944 (=> (not res!402952) (not e!358321))))

(assert (=> b!624944 (= res!402952 (validKeyInArray!0 k!1786))))

(declare-fun b!624945 () Bool)

(declare-fun res!402956 () Bool)

(declare-fun e!358323 () Bool)

(assert (=> b!624945 (=> (not res!402956) (not e!358323))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37766 (_ BitVec 32)) Bool)

(assert (=> b!624945 (= res!402956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624946 () Bool)

(declare-fun res!402951 () Bool)

(assert (=> b!624946 (=> (not res!402951) (not e!358321))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624946 (= res!402951 (and (= (size!18490 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18490 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18490 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624947 () Bool)

(assert (=> b!624947 (= e!358323 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6566 0))(
  ( (MissingZero!6566 (index!28548 (_ BitVec 32))) (Found!6566 (index!28549 (_ BitVec 32))) (Intermediate!6566 (undefined!7378 Bool) (index!28550 (_ BitVec 32)) (x!57308 (_ BitVec 32))) (Undefined!6566) (MissingVacant!6566 (index!28551 (_ BitVec 32))) )
))
(declare-fun lt!289726 () SeekEntryResult!6566)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37766 (_ BitVec 32)) SeekEntryResult!6566)

(assert (=> b!624947 (= lt!289726 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18126 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624948 () Bool)

(declare-fun res!402950 () Bool)

(assert (=> b!624948 (=> (not res!402950) (not e!358323))))

(assert (=> b!624948 (= res!402950 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18126 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18126 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!402949 () Bool)

(assert (=> start!56386 (=> (not res!402949) (not e!358321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56386 (= res!402949 (validMask!0 mask!3053))))

(assert (=> start!56386 e!358321))

(assert (=> start!56386 true))

(declare-fun array_inv!13922 (array!37766) Bool)

(assert (=> start!56386 (array_inv!13922 a!2986)))

(declare-fun b!624949 () Bool)

(assert (=> b!624949 (= e!358321 e!358323)))

(declare-fun res!402953 () Bool)

(assert (=> b!624949 (=> (not res!402953) (not e!358323))))

(declare-fun lt!289725 () SeekEntryResult!6566)

(assert (=> b!624949 (= res!402953 (or (= lt!289725 (MissingZero!6566 i!1108)) (= lt!289725 (MissingVacant!6566 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37766 (_ BitVec 32)) SeekEntryResult!6566)

(assert (=> b!624949 (= lt!289725 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624950 () Bool)

(declare-fun res!402954 () Bool)

(assert (=> b!624950 (=> (not res!402954) (not e!358323))))

(declare-datatypes ((List!12167 0))(
  ( (Nil!12164) (Cons!12163 (h!13208 (_ BitVec 64)) (t!18395 List!12167)) )
))
(declare-fun arrayNoDuplicates!0 (array!37766 (_ BitVec 32) List!12167) Bool)

(assert (=> b!624950 (= res!402954 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12164))))

(assert (= (and start!56386 res!402949) b!624946))

(assert (= (and b!624946 res!402951) b!624943))

(assert (= (and b!624943 res!402955) b!624944))

(assert (= (and b!624944 res!402952) b!624942))

(assert (= (and b!624942 res!402948) b!624949))

(assert (= (and b!624949 res!402953) b!624945))

(assert (= (and b!624945 res!402956) b!624950))

(assert (= (and b!624950 res!402954) b!624948))

(assert (= (and b!624948 res!402950) b!624947))

(declare-fun m!600539 () Bool)

(assert (=> b!624942 m!600539))

(declare-fun m!600541 () Bool)

(assert (=> b!624950 m!600541))

(declare-fun m!600543 () Bool)

(assert (=> b!624948 m!600543))

(declare-fun m!600545 () Bool)

(assert (=> b!624948 m!600545))

(declare-fun m!600547 () Bool)

(assert (=> b!624948 m!600547))

(declare-fun m!600549 () Bool)

(assert (=> b!624949 m!600549))

(declare-fun m!600551 () Bool)

(assert (=> b!624944 m!600551))

(declare-fun m!600553 () Bool)

(assert (=> b!624945 m!600553))

(declare-fun m!600555 () Bool)

(assert (=> start!56386 m!600555))

(declare-fun m!600557 () Bool)

(assert (=> start!56386 m!600557))

(declare-fun m!600559 () Bool)

(assert (=> b!624947 m!600559))

(assert (=> b!624947 m!600559))

(declare-fun m!600561 () Bool)

(assert (=> b!624947 m!600561))

(assert (=> b!624943 m!600559))

(assert (=> b!624943 m!600559))

(declare-fun m!600563 () Bool)

(assert (=> b!624943 m!600563))

(push 1)

