; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53930 () Bool)

(assert start!53930)

(declare-fun b!588579 () Bool)

(declare-fun e!336090 () Bool)

(declare-fun e!336089 () Bool)

(assert (=> b!588579 (= e!336090 e!336089)))

(declare-fun res!376221 () Bool)

(assert (=> b!588579 (=> (not res!376221) (not e!336089))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6100 0))(
  ( (MissingZero!6100 (index!26630 (_ BitVec 32))) (Found!6100 (index!26631 (_ BitVec 32))) (Intermediate!6100 (undefined!6912 Bool) (index!26632 (_ BitVec 32)) (x!55426 (_ BitVec 32))) (Undefined!6100) (MissingVacant!6100 (index!26633 (_ BitVec 32))) )
))
(declare-fun lt!266850 () SeekEntryResult!6100)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36774 0))(
  ( (array!36775 (arr!17660 (Array (_ BitVec 32) (_ BitVec 64))) (size!18024 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36774)

(assert (=> b!588579 (= res!376221 (and (= lt!266850 (Found!6100 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17660 a!2986) index!984) (select (arr!17660 a!2986) j!136))) (not (= (select (arr!17660 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36774 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!588579 (= lt!266850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17660 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588580 () Bool)

(declare-fun res!376216 () Bool)

(declare-fun e!336092 () Bool)

(assert (=> b!588580 (=> (not res!376216) (not e!336092))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588580 (= res!376216 (validKeyInArray!0 k!1786))))

(declare-fun b!588581 () Bool)

(declare-fun e!336088 () Bool)

(declare-fun lt!266854 () SeekEntryResult!6100)

(assert (=> b!588581 (= e!336088 (= lt!266850 lt!266854))))

(declare-fun res!376218 () Bool)

(assert (=> start!53930 (=> (not res!376218) (not e!336092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53930 (= res!376218 (validMask!0 mask!3053))))

(assert (=> start!53930 e!336092))

(assert (=> start!53930 true))

(declare-fun array_inv!13456 (array!36774) Bool)

(assert (=> start!53930 (array_inv!13456 a!2986)))

(declare-fun b!588582 () Bool)

(declare-fun res!376225 () Bool)

(assert (=> b!588582 (=> (not res!376225) (not e!336090))))

(declare-datatypes ((List!11701 0))(
  ( (Nil!11698) (Cons!11697 (h!12742 (_ BitVec 64)) (t!17929 List!11701)) )
))
(declare-fun arrayNoDuplicates!0 (array!36774 (_ BitVec 32) List!11701) Bool)

(assert (=> b!588582 (= res!376225 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11698))))

(declare-fun b!588583 () Bool)

(declare-fun res!376217 () Bool)

(assert (=> b!588583 (=> (not res!376217) (not e!336090))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588583 (= res!376217 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17660 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17660 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588584 () Bool)

(declare-fun res!376224 () Bool)

(assert (=> b!588584 (=> (not res!376224) (not e!336092))))

(declare-fun arrayContainsKey!0 (array!36774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588584 (= res!376224 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588585 () Bool)

(declare-fun res!376223 () Bool)

(assert (=> b!588585 (=> (not res!376223) (not e!336092))))

(assert (=> b!588585 (= res!376223 (and (= (size!18024 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18024 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18024 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588586 () Bool)

(declare-fun e!336091 () Bool)

(assert (=> b!588586 (= e!336089 (not e!336091))))

(declare-fun res!376226 () Bool)

(assert (=> b!588586 (=> res!376226 e!336091)))

(assert (=> b!588586 (= res!376226 (bvslt mask!3053 #b00000000000000000000000000000000))))

(assert (=> b!588586 e!336088))

(declare-fun res!376222 () Bool)

(assert (=> b!588586 (=> (not res!376222) (not e!336088))))

(declare-fun lt!266851 () (_ BitVec 32))

(assert (=> b!588586 (= res!376222 (= lt!266854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266851 vacantSpotIndex!68 (select (store (arr!17660 a!2986) i!1108 k!1786) j!136) (array!36775 (store (arr!17660 a!2986) i!1108 k!1786) (size!18024 a!2986)) mask!3053)))))

(assert (=> b!588586 (= lt!266854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266851 vacantSpotIndex!68 (select (arr!17660 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18320 0))(
  ( (Unit!18321) )
))
(declare-fun lt!266853 () Unit!18320)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36774 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18320)

(assert (=> b!588586 (= lt!266853 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266851 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588586 (= lt!266851 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588587 () Bool)

(assert (=> b!588587 (= e!336091 (validKeyInArray!0 (select (store (arr!17660 a!2986) i!1108 k!1786) j!136)))))

(declare-fun b!588588 () Bool)

(declare-fun res!376220 () Bool)

(assert (=> b!588588 (=> (not res!376220) (not e!336092))))

(assert (=> b!588588 (= res!376220 (validKeyInArray!0 (select (arr!17660 a!2986) j!136)))))

(declare-fun b!588589 () Bool)

(assert (=> b!588589 (= e!336092 e!336090)))

(declare-fun res!376215 () Bool)

(assert (=> b!588589 (=> (not res!376215) (not e!336090))))

(declare-fun lt!266852 () SeekEntryResult!6100)

(assert (=> b!588589 (= res!376215 (or (= lt!266852 (MissingZero!6100 i!1108)) (= lt!266852 (MissingVacant!6100 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36774 (_ BitVec 32)) SeekEntryResult!6100)

(assert (=> b!588589 (= lt!266852 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588590 () Bool)

(declare-fun res!376219 () Bool)

(assert (=> b!588590 (=> (not res!376219) (not e!336090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36774 (_ BitVec 32)) Bool)

(assert (=> b!588590 (= res!376219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53930 res!376218) b!588585))

(assert (= (and b!588585 res!376223) b!588588))

(assert (= (and b!588588 res!376220) b!588580))

(assert (= (and b!588580 res!376216) b!588584))

(assert (= (and b!588584 res!376224) b!588589))

(assert (= (and b!588589 res!376215) b!588590))

(assert (= (and b!588590 res!376219) b!588582))

(assert (= (and b!588582 res!376225) b!588583))

(assert (= (and b!588583 res!376217) b!588579))

(assert (= (and b!588579 res!376221) b!588586))

(assert (= (and b!588586 res!376222) b!588581))

(assert (= (and b!588586 (not res!376226)) b!588587))

(declare-fun m!567147 () Bool)

(assert (=> start!53930 m!567147))

(declare-fun m!567149 () Bool)

(assert (=> start!53930 m!567149))

(declare-fun m!567151 () Bool)

(assert (=> b!588582 m!567151))

(declare-fun m!567153 () Bool)

(assert (=> b!588584 m!567153))

(declare-fun m!567155 () Bool)

(assert (=> b!588580 m!567155))

(declare-fun m!567157 () Bool)

(assert (=> b!588583 m!567157))

(declare-fun m!567159 () Bool)

(assert (=> b!588583 m!567159))

(declare-fun m!567161 () Bool)

(assert (=> b!588583 m!567161))

(declare-fun m!567163 () Bool)

(assert (=> b!588586 m!567163))

(declare-fun m!567165 () Bool)

(assert (=> b!588586 m!567165))

(declare-fun m!567167 () Bool)

(assert (=> b!588586 m!567167))

(assert (=> b!588586 m!567159))

(declare-fun m!567169 () Bool)

(assert (=> b!588586 m!567169))

(assert (=> b!588586 m!567167))

(declare-fun m!567171 () Bool)

(assert (=> b!588586 m!567171))

(assert (=> b!588586 m!567165))

(declare-fun m!567173 () Bool)

(assert (=> b!588586 m!567173))

(assert (=> b!588588 m!567167))

(assert (=> b!588588 m!567167))

(declare-fun m!567175 () Bool)

(assert (=> b!588588 m!567175))

(declare-fun m!567177 () Bool)

(assert (=> b!588589 m!567177))

(declare-fun m!567179 () Bool)

(assert (=> b!588579 m!567179))

(assert (=> b!588579 m!567167))

(assert (=> b!588579 m!567167))

(declare-fun m!567181 () Bool)

(assert (=> b!588579 m!567181))

(assert (=> b!588587 m!567159))

(assert (=> b!588587 m!567165))

(assert (=> b!588587 m!567165))

(declare-fun m!567183 () Bool)

(assert (=> b!588587 m!567183))

(declare-fun m!567185 () Bool)

(assert (=> b!588590 m!567185))

(push 1)

(assert (not b!588589))

(assert (not b!588590))

(assert (not start!53930))

(assert (not b!588587))

