; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56438 () Bool)

(assert start!56438)

(declare-fun b!625653 () Bool)

(declare-fun res!403661 () Bool)

(declare-fun e!358556 () Bool)

(assert (=> b!625653 (=> (not res!403661) (not e!358556))))

(declare-datatypes ((array!37818 0))(
  ( (array!37819 (arr!18152 (Array (_ BitVec 32) (_ BitVec 64))) (size!18516 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37818)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625653 (= res!403661 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625654 () Bool)

(declare-fun res!403664 () Bool)

(declare-fun e!358555 () Bool)

(assert (=> b!625654 (=> (not res!403664) (not e!358555))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37818 (_ BitVec 32)) Bool)

(assert (=> b!625654 (= res!403664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625655 () Bool)

(declare-fun res!403663 () Bool)

(assert (=> b!625655 (=> (not res!403663) (not e!358555))))

(declare-datatypes ((List!12193 0))(
  ( (Nil!12190) (Cons!12189 (h!13234 (_ BitVec 64)) (t!18421 List!12193)) )
))
(declare-fun arrayNoDuplicates!0 (array!37818 (_ BitVec 32) List!12193) Bool)

(assert (=> b!625655 (= res!403663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12190))))

(declare-fun res!403659 () Bool)

(assert (=> start!56438 (=> (not res!403659) (not e!358556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56438 (= res!403659 (validMask!0 mask!3053))))

(assert (=> start!56438 e!358556))

(assert (=> start!56438 true))

(declare-fun array_inv!13948 (array!37818) Bool)

(assert (=> start!56438 (array_inv!13948 a!2986)))

(declare-fun b!625656 () Bool)

(declare-fun res!403660 () Bool)

(assert (=> b!625656 (=> (not res!403660) (not e!358556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625656 (= res!403660 (validKeyInArray!0 k!1786))))

(declare-fun b!625657 () Bool)

(declare-fun res!403666 () Bool)

(assert (=> b!625657 (=> (not res!403666) (not e!358556))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625657 (= res!403666 (validKeyInArray!0 (select (arr!18152 a!2986) j!136)))))

(declare-fun b!625658 () Bool)

(assert (=> b!625658 (= e!358555 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6592 0))(
  ( (MissingZero!6592 (index!28652 (_ BitVec 32))) (Found!6592 (index!28653 (_ BitVec 32))) (Intermediate!6592 (undefined!7404 Bool) (index!28654 (_ BitVec 32)) (x!57398 (_ BitVec 32))) (Undefined!6592) (MissingVacant!6592 (index!28655 (_ BitVec 32))) )
))
(declare-fun lt!289873 () SeekEntryResult!6592)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37818 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!625658 (= lt!289873 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18152 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625659 () Bool)

(assert (=> b!625659 (= e!358556 e!358555)))

(declare-fun res!403662 () Bool)

(assert (=> b!625659 (=> (not res!403662) (not e!358555))))

(declare-fun lt!289872 () SeekEntryResult!6592)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625659 (= res!403662 (or (= lt!289872 (MissingZero!6592 i!1108)) (= lt!289872 (MissingVacant!6592 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37818 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!625659 (= lt!289872 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625660 () Bool)

(declare-fun res!403665 () Bool)

(assert (=> b!625660 (=> (not res!403665) (not e!358556))))

(assert (=> b!625660 (= res!403665 (and (= (size!18516 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18516 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18516 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625661 () Bool)

(declare-fun res!403667 () Bool)

(assert (=> b!625661 (=> (not res!403667) (not e!358555))))

(assert (=> b!625661 (= res!403667 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18152 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18152 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56438 res!403659) b!625660))

(assert (= (and b!625660 res!403665) b!625657))

(assert (= (and b!625657 res!403666) b!625656))

(assert (= (and b!625656 res!403660) b!625653))

(assert (= (and b!625653 res!403661) b!625659))

(assert (= (and b!625659 res!403662) b!625654))

(assert (= (and b!625654 res!403664) b!625655))

(assert (= (and b!625655 res!403663) b!625661))

(assert (= (and b!625661 res!403667) b!625658))

(declare-fun m!601215 () Bool)

(assert (=> b!625655 m!601215))

(declare-fun m!601217 () Bool)

(assert (=> b!625661 m!601217))

(declare-fun m!601219 () Bool)

(assert (=> b!625661 m!601219))

(declare-fun m!601221 () Bool)

(assert (=> b!625661 m!601221))

(declare-fun m!601223 () Bool)

(assert (=> b!625656 m!601223))

(declare-fun m!601225 () Bool)

(assert (=> b!625654 m!601225))

(declare-fun m!601227 () Bool)

(assert (=> start!56438 m!601227))

(declare-fun m!601229 () Bool)

(assert (=> start!56438 m!601229))

(declare-fun m!601231 () Bool)

(assert (=> b!625653 m!601231))

(declare-fun m!601233 () Bool)

(assert (=> b!625658 m!601233))

(assert (=> b!625658 m!601233))

(declare-fun m!601235 () Bool)

(assert (=> b!625658 m!601235))

(assert (=> b!625657 m!601233))

(assert (=> b!625657 m!601233))

(declare-fun m!601237 () Bool)

(assert (=> b!625657 m!601237))

(declare-fun m!601239 () Bool)

(assert (=> b!625659 m!601239))

(push 1)

(assert (not start!56438))

(assert (not b!625656))

(assert (not b!625659))

(assert (not b!625658))

(assert (not b!625653))

(assert (not b!625655))

(assert (not b!625654))

(assert (not b!625657))

(check-sat)

