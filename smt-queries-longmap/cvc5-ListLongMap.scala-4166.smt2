; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56738 () Bool)

(assert start!56738)

(declare-fun b!628645 () Bool)

(declare-fun res!406205 () Bool)

(declare-fun e!359664 () Bool)

(assert (=> b!628645 (=> (not res!406205) (not e!359664))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37979 0))(
  ( (array!37980 (arr!18228 (Array (_ BitVec 32) (_ BitVec 64))) (size!18592 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37979)

(assert (=> b!628645 (= res!406205 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18228 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18228 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628646 () Bool)

(declare-fun res!406211 () Bool)

(assert (=> b!628646 (=> (not res!406211) (not e!359664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37979 (_ BitVec 32)) Bool)

(assert (=> b!628646 (= res!406211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628647 () Bool)

(declare-fun res!406209 () Bool)

(assert (=> b!628647 (=> (not res!406209) (not e!359664))))

(declare-datatypes ((List!12269 0))(
  ( (Nil!12266) (Cons!12265 (h!13310 (_ BitVec 64)) (t!18497 List!12269)) )
))
(declare-fun arrayNoDuplicates!0 (array!37979 (_ BitVec 32) List!12269) Bool)

(assert (=> b!628647 (= res!406209 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12266))))

(declare-fun b!628648 () Bool)

(assert (=> b!628648 (= e!359664 false)))

(declare-fun lt!290541 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628648 (= lt!290541 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628650 () Bool)

(declare-fun res!406207 () Bool)

(declare-fun e!359662 () Bool)

(assert (=> b!628650 (=> (not res!406207) (not e!359662))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628650 (= res!406207 (and (= (size!18592 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18592 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18592 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628651 () Bool)

(declare-fun res!406206 () Bool)

(assert (=> b!628651 (=> (not res!406206) (not e!359662))))

(declare-fun arrayContainsKey!0 (array!37979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628651 (= res!406206 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628652 () Bool)

(assert (=> b!628652 (= e!359662 e!359664)))

(declare-fun res!406204 () Bool)

(assert (=> b!628652 (=> (not res!406204) (not e!359664))))

(declare-datatypes ((SeekEntryResult!6668 0))(
  ( (MissingZero!6668 (index!28956 (_ BitVec 32))) (Found!6668 (index!28957 (_ BitVec 32))) (Intermediate!6668 (undefined!7480 Bool) (index!28958 (_ BitVec 32)) (x!57694 (_ BitVec 32))) (Undefined!6668) (MissingVacant!6668 (index!28959 (_ BitVec 32))) )
))
(declare-fun lt!290542 () SeekEntryResult!6668)

(assert (=> b!628652 (= res!406204 (or (= lt!290542 (MissingZero!6668 i!1108)) (= lt!290542 (MissingVacant!6668 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37979 (_ BitVec 32)) SeekEntryResult!6668)

(assert (=> b!628652 (= lt!290542 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628653 () Bool)

(declare-fun res!406210 () Bool)

(assert (=> b!628653 (=> (not res!406210) (not e!359664))))

(assert (=> b!628653 (= res!406210 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18228 a!2986) index!984) (select (arr!18228 a!2986) j!136))) (not (= (select (arr!18228 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!406203 () Bool)

(assert (=> start!56738 (=> (not res!406203) (not e!359662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56738 (= res!406203 (validMask!0 mask!3053))))

(assert (=> start!56738 e!359662))

(assert (=> start!56738 true))

(declare-fun array_inv!14024 (array!37979) Bool)

(assert (=> start!56738 (array_inv!14024 a!2986)))

(declare-fun b!628649 () Bool)

(declare-fun res!406202 () Bool)

(assert (=> b!628649 (=> (not res!406202) (not e!359662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628649 (= res!406202 (validKeyInArray!0 k!1786))))

(declare-fun b!628654 () Bool)

(declare-fun res!406208 () Bool)

(assert (=> b!628654 (=> (not res!406208) (not e!359662))))

(assert (=> b!628654 (= res!406208 (validKeyInArray!0 (select (arr!18228 a!2986) j!136)))))

(declare-fun b!628655 () Bool)

(declare-fun res!406201 () Bool)

(assert (=> b!628655 (=> (not res!406201) (not e!359664))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37979 (_ BitVec 32)) SeekEntryResult!6668)

(assert (=> b!628655 (= res!406201 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18228 a!2986) j!136) a!2986 mask!3053) (Found!6668 j!136)))))

(assert (= (and start!56738 res!406203) b!628650))

(assert (= (and b!628650 res!406207) b!628654))

(assert (= (and b!628654 res!406208) b!628649))

(assert (= (and b!628649 res!406202) b!628651))

(assert (= (and b!628651 res!406206) b!628652))

(assert (= (and b!628652 res!406204) b!628646))

(assert (= (and b!628646 res!406211) b!628647))

(assert (= (and b!628647 res!406209) b!628645))

(assert (= (and b!628645 res!406205) b!628655))

(assert (= (and b!628655 res!406201) b!628653))

(assert (= (and b!628653 res!406210) b!628648))

(declare-fun m!603777 () Bool)

(assert (=> b!628655 m!603777))

(assert (=> b!628655 m!603777))

(declare-fun m!603779 () Bool)

(assert (=> b!628655 m!603779))

(declare-fun m!603781 () Bool)

(assert (=> b!628646 m!603781))

(declare-fun m!603783 () Bool)

(assert (=> start!56738 m!603783))

(declare-fun m!603785 () Bool)

(assert (=> start!56738 m!603785))

(declare-fun m!603787 () Bool)

(assert (=> b!628651 m!603787))

(declare-fun m!603789 () Bool)

(assert (=> b!628648 m!603789))

(declare-fun m!603791 () Bool)

(assert (=> b!628653 m!603791))

(assert (=> b!628653 m!603777))

(assert (=> b!628654 m!603777))

(assert (=> b!628654 m!603777))

(declare-fun m!603793 () Bool)

(assert (=> b!628654 m!603793))

(declare-fun m!603795 () Bool)

(assert (=> b!628649 m!603795))

(declare-fun m!603797 () Bool)

(assert (=> b!628647 m!603797))

(declare-fun m!603799 () Bool)

(assert (=> b!628652 m!603799))

(declare-fun m!603801 () Bool)

(assert (=> b!628645 m!603801))

(declare-fun m!603803 () Bool)

(assert (=> b!628645 m!603803))

(declare-fun m!603805 () Bool)

(assert (=> b!628645 m!603805))

(push 1)

