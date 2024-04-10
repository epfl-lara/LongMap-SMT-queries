; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56742 () Bool)

(assert start!56742)

(declare-fun b!628711 () Bool)

(declare-fun res!406270 () Bool)

(declare-fun e!359681 () Bool)

(assert (=> b!628711 (=> (not res!406270) (not e!359681))))

(declare-datatypes ((array!37983 0))(
  ( (array!37984 (arr!18230 (Array (_ BitVec 32) (_ BitVec 64))) (size!18594 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37983)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628711 (= res!406270 (validKeyInArray!0 (select (arr!18230 a!2986) j!136)))))

(declare-fun b!628712 () Bool)

(declare-fun e!359680 () Bool)

(assert (=> b!628712 (= e!359680 false)))

(declare-fun lt!290553 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628712 (= lt!290553 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628713 () Bool)

(declare-fun res!406273 () Bool)

(assert (=> b!628713 (=> (not res!406273) (not e!359680))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6670 0))(
  ( (MissingZero!6670 (index!28964 (_ BitVec 32))) (Found!6670 (index!28965 (_ BitVec 32))) (Intermediate!6670 (undefined!7482 Bool) (index!28966 (_ BitVec 32)) (x!57696 (_ BitVec 32))) (Undefined!6670) (MissingVacant!6670 (index!28967 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37983 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!628713 (= res!406273 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18230 a!2986) j!136) a!2986 mask!3053) (Found!6670 j!136)))))

(declare-fun b!628714 () Bool)

(declare-fun res!406275 () Bool)

(assert (=> b!628714 (=> (not res!406275) (not e!359680))))

(assert (=> b!628714 (= res!406275 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18230 a!2986) index!984) (select (arr!18230 a!2986) j!136))) (not (= (select (arr!18230 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!406267 () Bool)

(assert (=> start!56742 (=> (not res!406267) (not e!359681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56742 (= res!406267 (validMask!0 mask!3053))))

(assert (=> start!56742 e!359681))

(assert (=> start!56742 true))

(declare-fun array_inv!14026 (array!37983) Bool)

(assert (=> start!56742 (array_inv!14026 a!2986)))

(declare-fun b!628715 () Bool)

(declare-fun res!406269 () Bool)

(assert (=> b!628715 (=> (not res!406269) (not e!359680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37983 (_ BitVec 32)) Bool)

(assert (=> b!628715 (= res!406269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628716 () Bool)

(declare-fun res!406277 () Bool)

(assert (=> b!628716 (=> (not res!406277) (not e!359680))))

(declare-datatypes ((List!12271 0))(
  ( (Nil!12268) (Cons!12267 (h!13312 (_ BitVec 64)) (t!18499 List!12271)) )
))
(declare-fun arrayNoDuplicates!0 (array!37983 (_ BitVec 32) List!12271) Bool)

(assert (=> b!628716 (= res!406277 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12268))))

(declare-fun b!628717 () Bool)

(assert (=> b!628717 (= e!359681 e!359680)))

(declare-fun res!406272 () Bool)

(assert (=> b!628717 (=> (not res!406272) (not e!359680))))

(declare-fun lt!290554 () SeekEntryResult!6670)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628717 (= res!406272 (or (= lt!290554 (MissingZero!6670 i!1108)) (= lt!290554 (MissingVacant!6670 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37983 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!628717 (= lt!290554 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628718 () Bool)

(declare-fun res!406268 () Bool)

(assert (=> b!628718 (=> (not res!406268) (not e!359681))))

(declare-fun arrayContainsKey!0 (array!37983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628718 (= res!406268 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628719 () Bool)

(declare-fun res!406276 () Bool)

(assert (=> b!628719 (=> (not res!406276) (not e!359681))))

(assert (=> b!628719 (= res!406276 (and (= (size!18594 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18594 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18594 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628720 () Bool)

(declare-fun res!406274 () Bool)

(assert (=> b!628720 (=> (not res!406274) (not e!359680))))

(assert (=> b!628720 (= res!406274 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18230 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18230 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628721 () Bool)

(declare-fun res!406271 () Bool)

(assert (=> b!628721 (=> (not res!406271) (not e!359681))))

(assert (=> b!628721 (= res!406271 (validKeyInArray!0 k!1786))))

(assert (= (and start!56742 res!406267) b!628719))

(assert (= (and b!628719 res!406276) b!628711))

(assert (= (and b!628711 res!406270) b!628721))

(assert (= (and b!628721 res!406271) b!628718))

(assert (= (and b!628718 res!406268) b!628717))

(assert (= (and b!628717 res!406272) b!628715))

(assert (= (and b!628715 res!406269) b!628716))

(assert (= (and b!628716 res!406277) b!628720))

(assert (= (and b!628720 res!406274) b!628713))

(assert (= (and b!628713 res!406273) b!628714))

(assert (= (and b!628714 res!406275) b!628712))

(declare-fun m!603837 () Bool)

(assert (=> b!628716 m!603837))

(declare-fun m!603839 () Bool)

(assert (=> b!628714 m!603839))

(declare-fun m!603841 () Bool)

(assert (=> b!628714 m!603841))

(declare-fun m!603843 () Bool)

(assert (=> start!56742 m!603843))

(declare-fun m!603845 () Bool)

(assert (=> start!56742 m!603845))

(declare-fun m!603847 () Bool)

(assert (=> b!628715 m!603847))

(declare-fun m!603849 () Bool)

(assert (=> b!628717 m!603849))

(declare-fun m!603851 () Bool)

(assert (=> b!628712 m!603851))

(assert (=> b!628713 m!603841))

(assert (=> b!628713 m!603841))

(declare-fun m!603853 () Bool)

(assert (=> b!628713 m!603853))

(assert (=> b!628711 m!603841))

(assert (=> b!628711 m!603841))

(declare-fun m!603855 () Bool)

(assert (=> b!628711 m!603855))

(declare-fun m!603857 () Bool)

(assert (=> b!628721 m!603857))

(declare-fun m!603859 () Bool)

(assert (=> b!628718 m!603859))

(declare-fun m!603861 () Bool)

(assert (=> b!628720 m!603861))

(declare-fun m!603863 () Bool)

(assert (=> b!628720 m!603863))

(declare-fun m!603865 () Bool)

(assert (=> b!628720 m!603865))

(push 1)

(assert (not b!628716))

