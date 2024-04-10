; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56666 () Bool)

(assert start!56666)

(declare-fun b!628141 () Bool)

(declare-fun res!405846 () Bool)

(declare-fun e!359448 () Bool)

(assert (=> b!628141 (=> (not res!405846) (not e!359448))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37958 0))(
  ( (array!37959 (arr!18219 (Array (_ BitVec 32) (_ BitVec 64))) (size!18583 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37958)

(assert (=> b!628141 (= res!405846 (and (= (size!18583 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18583 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18583 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628142 () Bool)

(declare-fun e!359446 () Bool)

(assert (=> b!628142 (= e!359448 e!359446)))

(declare-fun res!405844 () Bool)

(assert (=> b!628142 (=> (not res!405844) (not e!359446))))

(declare-datatypes ((SeekEntryResult!6659 0))(
  ( (MissingZero!6659 (index!28920 (_ BitVec 32))) (Found!6659 (index!28921 (_ BitVec 32))) (Intermediate!6659 (undefined!7471 Bool) (index!28922 (_ BitVec 32)) (x!57655 (_ BitVec 32))) (Undefined!6659) (MissingVacant!6659 (index!28923 (_ BitVec 32))) )
))
(declare-fun lt!290406 () SeekEntryResult!6659)

(assert (=> b!628142 (= res!405844 (or (= lt!290406 (MissingZero!6659 i!1108)) (= lt!290406 (MissingVacant!6659 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37958 (_ BitVec 32)) SeekEntryResult!6659)

(assert (=> b!628142 (= lt!290406 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628143 () Bool)

(declare-fun res!405848 () Bool)

(assert (=> b!628143 (=> (not res!405848) (not e!359446))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628143 (= res!405848 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18219 a!2986) index!984) (select (arr!18219 a!2986) j!136))) (not (= (select (arr!18219 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628144 () Bool)

(declare-fun res!405843 () Bool)

(assert (=> b!628144 (=> (not res!405843) (not e!359446))))

(declare-datatypes ((List!12260 0))(
  ( (Nil!12257) (Cons!12256 (h!13301 (_ BitVec 64)) (t!18488 List!12260)) )
))
(declare-fun arrayNoDuplicates!0 (array!37958 (_ BitVec 32) List!12260) Bool)

(assert (=> b!628144 (= res!405843 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12257))))

(declare-fun b!628145 () Bool)

(declare-fun res!405850 () Bool)

(assert (=> b!628145 (=> (not res!405850) (not e!359448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628145 (= res!405850 (validKeyInArray!0 (select (arr!18219 a!2986) j!136)))))

(declare-fun b!628146 () Bool)

(declare-fun res!405851 () Bool)

(assert (=> b!628146 (=> (not res!405851) (not e!359448))))

(declare-fun arrayContainsKey!0 (array!37958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628146 (= res!405851 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628147 () Bool)

(declare-fun res!405847 () Bool)

(assert (=> b!628147 (=> (not res!405847) (not e!359446))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37958 (_ BitVec 32)) SeekEntryResult!6659)

(assert (=> b!628147 (= res!405847 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18219 a!2986) j!136) a!2986 mask!3053) (Found!6659 j!136)))))

(declare-fun res!405842 () Bool)

(assert (=> start!56666 (=> (not res!405842) (not e!359448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56666 (= res!405842 (validMask!0 mask!3053))))

(assert (=> start!56666 e!359448))

(assert (=> start!56666 true))

(declare-fun array_inv!14015 (array!37958) Bool)

(assert (=> start!56666 (array_inv!14015 a!2986)))

(declare-fun b!628148 () Bool)

(declare-fun res!405841 () Bool)

(assert (=> b!628148 (=> (not res!405841) (not e!359446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37958 (_ BitVec 32)) Bool)

(assert (=> b!628148 (= res!405841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628149 () Bool)

(declare-fun res!405849 () Bool)

(assert (=> b!628149 (=> (not res!405849) (not e!359448))))

(assert (=> b!628149 (= res!405849 (validKeyInArray!0 k!1786))))

(declare-fun b!628150 () Bool)

(declare-fun res!405845 () Bool)

(assert (=> b!628150 (=> (not res!405845) (not e!359446))))

(assert (=> b!628150 (= res!405845 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18219 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18219 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628151 () Bool)

(assert (=> b!628151 (= e!359446 false)))

(declare-fun lt!290407 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628151 (= lt!290407 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56666 res!405842) b!628141))

(assert (= (and b!628141 res!405846) b!628145))

(assert (= (and b!628145 res!405850) b!628149))

(assert (= (and b!628149 res!405849) b!628146))

(assert (= (and b!628146 res!405851) b!628142))

(assert (= (and b!628142 res!405844) b!628148))

(assert (= (and b!628148 res!405841) b!628144))

(assert (= (and b!628144 res!405843) b!628150))

(assert (= (and b!628150 res!405845) b!628147))

(assert (= (and b!628147 res!405847) b!628143))

(assert (= (and b!628143 res!405848) b!628151))

(declare-fun m!603387 () Bool)

(assert (=> b!628149 m!603387))

(declare-fun m!603389 () Bool)

(assert (=> b!628143 m!603389))

(declare-fun m!603391 () Bool)

(assert (=> b!628143 m!603391))

(declare-fun m!603393 () Bool)

(assert (=> start!56666 m!603393))

(declare-fun m!603395 () Bool)

(assert (=> start!56666 m!603395))

(declare-fun m!603397 () Bool)

(assert (=> b!628150 m!603397))

(declare-fun m!603399 () Bool)

(assert (=> b!628150 m!603399))

(declare-fun m!603401 () Bool)

(assert (=> b!628150 m!603401))

(assert (=> b!628145 m!603391))

(assert (=> b!628145 m!603391))

(declare-fun m!603403 () Bool)

(assert (=> b!628145 m!603403))

(declare-fun m!603405 () Bool)

(assert (=> b!628146 m!603405))

(declare-fun m!603407 () Bool)

(assert (=> b!628151 m!603407))

(declare-fun m!603409 () Bool)

(assert (=> b!628142 m!603409))

(declare-fun m!603411 () Bool)

(assert (=> b!628148 m!603411))

(declare-fun m!603413 () Bool)

(assert (=> b!628144 m!603413))

(assert (=> b!628147 m!603391))

(assert (=> b!628147 m!603391))

(declare-fun m!603415 () Bool)

(assert (=> b!628147 m!603415))

(push 1)

