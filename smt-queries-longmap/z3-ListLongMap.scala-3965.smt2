; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53910 () Bool)

(assert start!53910)

(declare-fun b!587625 () Bool)

(declare-fun e!335754 () Bool)

(declare-fun e!335753 () Bool)

(assert (=> b!587625 (= e!335754 e!335753)))

(declare-fun res!375161 () Bool)

(assert (=> b!587625 (=> (not res!375161) (not e!335753))))

(declare-datatypes ((SeekEntryResult!6016 0))(
  ( (MissingZero!6016 (index!26294 (_ BitVec 32))) (Found!6016 (index!26295 (_ BitVec 32))) (Intermediate!6016 (undefined!6828 Bool) (index!26296 (_ BitVec 32)) (x!55257 (_ BitVec 32))) (Undefined!6016) (MissingVacant!6016 (index!26297 (_ BitVec 32))) )
))
(declare-fun lt!266495 () SeekEntryResult!6016)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587625 (= res!375161 (or (= lt!266495 (MissingZero!6016 i!1108)) (= lt!266495 (MissingVacant!6016 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36699 0))(
  ( (array!36700 (arr!17620 (Array (_ BitVec 32) (_ BitVec 64))) (size!17984 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36699)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36699 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!587625 (= lt!266495 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587626 () Bool)

(declare-fun res!375156 () Bool)

(assert (=> b!587626 (=> (not res!375156) (not e!335754))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587626 (= res!375156 (validKeyInArray!0 (select (arr!17620 a!2986) j!136)))))

(declare-fun b!587627 () Bool)

(declare-fun res!375160 () Bool)

(assert (=> b!587627 (=> (not res!375160) (not e!335753))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36699 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!587627 (= res!375160 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17620 a!2986) j!136) a!2986 mask!3053) (Found!6016 j!136)))))

(declare-fun b!587628 () Bool)

(declare-fun res!375159 () Bool)

(assert (=> b!587628 (=> (not res!375159) (not e!335753))))

(declare-datatypes ((List!11568 0))(
  ( (Nil!11565) (Cons!11564 (h!12612 (_ BitVec 64)) (t!17788 List!11568)) )
))
(declare-fun arrayNoDuplicates!0 (array!36699 (_ BitVec 32) List!11568) Bool)

(assert (=> b!587628 (= res!375159 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11565))))

(declare-fun b!587629 () Bool)

(declare-fun res!375165 () Bool)

(assert (=> b!587629 (=> (not res!375165) (not e!335753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36699 (_ BitVec 32)) Bool)

(assert (=> b!587629 (= res!375165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!375158 () Bool)

(assert (=> start!53910 (=> (not res!375158) (not e!335754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53910 (= res!375158 (validMask!0 mask!3053))))

(assert (=> start!53910 e!335754))

(assert (=> start!53910 true))

(declare-fun array_inv!13479 (array!36699) Bool)

(assert (=> start!53910 (array_inv!13479 a!2986)))

(declare-fun b!587630 () Bool)

(declare-fun res!375166 () Bool)

(assert (=> b!587630 (=> (not res!375166) (not e!335753))))

(assert (=> b!587630 (= res!375166 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17620 a!2986) index!984) (select (arr!17620 a!2986) j!136))) (not (= (select (arr!17620 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587631 () Bool)

(declare-fun lt!266497 () (_ BitVec 32))

(assert (=> b!587631 (= e!335753 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvslt lt!266497 #b00000000000000000000000000000000) (bvsge lt!266497 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(assert (=> b!587631 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266497 vacantSpotIndex!68 (select (arr!17620 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266497 vacantSpotIndex!68 (select (store (arr!17620 a!2986) i!1108 k0!1786) j!136) (array!36700 (store (arr!17620 a!2986) i!1108 k0!1786) (size!17984 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18229 0))(
  ( (Unit!18230) )
))
(declare-fun lt!266496 () Unit!18229)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18229)

(assert (=> b!587631 (= lt!266496 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266497 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587631 (= lt!266497 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587632 () Bool)

(declare-fun res!375162 () Bool)

(assert (=> b!587632 (=> (not res!375162) (not e!335754))))

(assert (=> b!587632 (= res!375162 (validKeyInArray!0 k0!1786))))

(declare-fun b!587633 () Bool)

(declare-fun res!375157 () Bool)

(assert (=> b!587633 (=> (not res!375157) (not e!335754))))

(declare-fun arrayContainsKey!0 (array!36699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587633 (= res!375157 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587634 () Bool)

(declare-fun res!375164 () Bool)

(assert (=> b!587634 (=> (not res!375164) (not e!335753))))

(assert (=> b!587634 (= res!375164 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17620 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17620 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587635 () Bool)

(declare-fun res!375163 () Bool)

(assert (=> b!587635 (=> (not res!375163) (not e!335754))))

(assert (=> b!587635 (= res!375163 (and (= (size!17984 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17984 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17984 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53910 res!375158) b!587635))

(assert (= (and b!587635 res!375163) b!587626))

(assert (= (and b!587626 res!375156) b!587632))

(assert (= (and b!587632 res!375162) b!587633))

(assert (= (and b!587633 res!375157) b!587625))

(assert (= (and b!587625 res!375161) b!587629))

(assert (= (and b!587629 res!375165) b!587628))

(assert (= (and b!587628 res!375159) b!587634))

(assert (= (and b!587634 res!375164) b!587627))

(assert (= (and b!587627 res!375160) b!587630))

(assert (= (and b!587630 res!375166) b!587631))

(declare-fun m!566177 () Bool)

(assert (=> b!587626 m!566177))

(assert (=> b!587626 m!566177))

(declare-fun m!566179 () Bool)

(assert (=> b!587626 m!566179))

(declare-fun m!566181 () Bool)

(assert (=> b!587628 m!566181))

(declare-fun m!566183 () Bool)

(assert (=> b!587632 m!566183))

(declare-fun m!566185 () Bool)

(assert (=> b!587625 m!566185))

(declare-fun m!566187 () Bool)

(assert (=> b!587631 m!566187))

(assert (=> b!587631 m!566177))

(declare-fun m!566189 () Bool)

(assert (=> b!587631 m!566189))

(declare-fun m!566191 () Bool)

(assert (=> b!587631 m!566191))

(assert (=> b!587631 m!566177))

(declare-fun m!566193 () Bool)

(assert (=> b!587631 m!566193))

(declare-fun m!566195 () Bool)

(assert (=> b!587631 m!566195))

(assert (=> b!587631 m!566187))

(declare-fun m!566197 () Bool)

(assert (=> b!587631 m!566197))

(declare-fun m!566199 () Bool)

(assert (=> b!587634 m!566199))

(assert (=> b!587634 m!566189))

(declare-fun m!566201 () Bool)

(assert (=> b!587634 m!566201))

(declare-fun m!566203 () Bool)

(assert (=> b!587629 m!566203))

(assert (=> b!587627 m!566177))

(assert (=> b!587627 m!566177))

(declare-fun m!566205 () Bool)

(assert (=> b!587627 m!566205))

(declare-fun m!566207 () Bool)

(assert (=> start!53910 m!566207))

(declare-fun m!566209 () Bool)

(assert (=> start!53910 m!566209))

(declare-fun m!566211 () Bool)

(assert (=> b!587630 m!566211))

(assert (=> b!587630 m!566177))

(declare-fun m!566213 () Bool)

(assert (=> b!587633 m!566213))

(check-sat (not b!587626) (not b!587627) (not b!587633) (not b!587628) (not b!587632) (not start!53910) (not b!587629) (not b!587625) (not b!587631))
(check-sat)
