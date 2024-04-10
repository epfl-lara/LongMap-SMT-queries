; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56326 () Bool)

(assert start!56326)

(declare-fun b!624564 () Bool)

(declare-fun res!402716 () Bool)

(declare-fun e!358134 () Bool)

(assert (=> b!624564 (=> (not res!402716) (not e!358134))))

(declare-datatypes ((array!37751 0))(
  ( (array!37752 (arr!18120 (Array (_ BitVec 32) (_ BitVec 64))) (size!18484 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37751)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624564 (= res!402716 (validKeyInArray!0 (select (arr!18120 a!2986) j!136)))))

(declare-fun b!624565 () Bool)

(declare-fun res!402717 () Bool)

(assert (=> b!624565 (=> (not res!402717) (not e!358134))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!624565 (= res!402717 (validKeyInArray!0 k!1786))))

(declare-fun b!624566 () Bool)

(declare-fun res!402719 () Bool)

(assert (=> b!624566 (=> (not res!402719) (not e!358134))))

(declare-fun arrayContainsKey!0 (array!37751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624566 (= res!402719 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624567 () Bool)

(declare-fun res!402721 () Bool)

(assert (=> b!624567 (=> (not res!402721) (not e!358134))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624567 (= res!402721 (and (= (size!18484 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18484 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18484 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624568 () Bool)

(declare-fun res!402722 () Bool)

(declare-fun e!358132 () Bool)

(assert (=> b!624568 (=> (not res!402722) (not e!358132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37751 (_ BitVec 32)) Bool)

(assert (=> b!624568 (= res!402722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624570 () Bool)

(assert (=> b!624570 (= e!358134 e!358132)))

(declare-fun res!402714 () Bool)

(assert (=> b!624570 (=> (not res!402714) (not e!358132))))

(declare-datatypes ((SeekEntryResult!6560 0))(
  ( (MissingZero!6560 (index!28524 (_ BitVec 32))) (Found!6560 (index!28525 (_ BitVec 32))) (Intermediate!6560 (undefined!7372 Bool) (index!28526 (_ BitVec 32)) (x!57283 (_ BitVec 32))) (Undefined!6560) (MissingVacant!6560 (index!28527 (_ BitVec 32))) )
))
(declare-fun lt!289626 () SeekEntryResult!6560)

(assert (=> b!624570 (= res!402714 (or (= lt!289626 (MissingZero!6560 i!1108)) (= lt!289626 (MissingVacant!6560 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37751 (_ BitVec 32)) SeekEntryResult!6560)

(assert (=> b!624570 (= lt!289626 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624571 () Bool)

(assert (=> b!624571 (= e!358132 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!289627 () SeekEntryResult!6560)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37751 (_ BitVec 32)) SeekEntryResult!6560)

(assert (=> b!624571 (= lt!289627 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18120 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624572 () Bool)

(declare-fun res!402720 () Bool)

(assert (=> b!624572 (=> (not res!402720) (not e!358132))))

(declare-datatypes ((List!12161 0))(
  ( (Nil!12158) (Cons!12157 (h!13202 (_ BitVec 64)) (t!18389 List!12161)) )
))
(declare-fun arrayNoDuplicates!0 (array!37751 (_ BitVec 32) List!12161) Bool)

(assert (=> b!624572 (= res!402720 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12158))))

(declare-fun res!402718 () Bool)

(assert (=> start!56326 (=> (not res!402718) (not e!358134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56326 (= res!402718 (validMask!0 mask!3053))))

(assert (=> start!56326 e!358134))

(assert (=> start!56326 true))

(declare-fun array_inv!13916 (array!37751) Bool)

(assert (=> start!56326 (array_inv!13916 a!2986)))

(declare-fun b!624569 () Bool)

(declare-fun res!402715 () Bool)

(assert (=> b!624569 (=> (not res!402715) (not e!358132))))

(assert (=> b!624569 (= res!402715 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18120 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18120 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56326 res!402718) b!624567))

(assert (= (and b!624567 res!402721) b!624564))

(assert (= (and b!624564 res!402716) b!624565))

(assert (= (and b!624565 res!402717) b!624566))

(assert (= (and b!624566 res!402719) b!624570))

(assert (= (and b!624570 res!402714) b!624568))

(assert (= (and b!624568 res!402722) b!624572))

(assert (= (and b!624572 res!402720) b!624569))

(assert (= (and b!624569 res!402715) b!624571))

(declare-fun m!600257 () Bool)

(assert (=> b!624570 m!600257))

(declare-fun m!600259 () Bool)

(assert (=> b!624564 m!600259))

(assert (=> b!624564 m!600259))

(declare-fun m!600261 () Bool)

(assert (=> b!624564 m!600261))

(declare-fun m!600263 () Bool)

(assert (=> start!56326 m!600263))

(declare-fun m!600265 () Bool)

(assert (=> start!56326 m!600265))

(declare-fun m!600267 () Bool)

(assert (=> b!624568 m!600267))

(declare-fun m!600269 () Bool)

(assert (=> b!624572 m!600269))

(declare-fun m!600271 () Bool)

(assert (=> b!624566 m!600271))

(declare-fun m!600273 () Bool)

(assert (=> b!624569 m!600273))

(declare-fun m!600275 () Bool)

(assert (=> b!624569 m!600275))

(declare-fun m!600277 () Bool)

(assert (=> b!624569 m!600277))

(declare-fun m!600279 () Bool)

(assert (=> b!624565 m!600279))

(assert (=> b!624571 m!600259))

(assert (=> b!624571 m!600259))

(declare-fun m!600281 () Bool)

(assert (=> b!624571 m!600281))

(push 1)

