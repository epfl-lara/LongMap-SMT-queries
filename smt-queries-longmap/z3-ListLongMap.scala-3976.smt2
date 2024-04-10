; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53928 () Bool)

(assert start!53928)

(declare-fun b!588543 () Bool)

(declare-fun res!376180 () Bool)

(declare-fun e!336074 () Bool)

(assert (=> b!588543 (=> (not res!376180) (not e!336074))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36772 0))(
  ( (array!36773 (arr!17659 (Array (_ BitVec 32) (_ BitVec 64))) (size!18023 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36772)

(assert (=> b!588543 (= res!376180 (and (= (size!18023 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18023 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18023 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588544 () Bool)

(declare-fun e!336071 () Bool)

(assert (=> b!588544 (= e!336074 e!336071)))

(declare-fun res!376179 () Bool)

(assert (=> b!588544 (=> (not res!376179) (not e!336071))))

(declare-datatypes ((SeekEntryResult!6099 0))(
  ( (MissingZero!6099 (index!26626 (_ BitVec 32))) (Found!6099 (index!26627 (_ BitVec 32))) (Intermediate!6099 (undefined!6911 Bool) (index!26628 (_ BitVec 32)) (x!55425 (_ BitVec 32))) (Undefined!6099) (MissingVacant!6099 (index!26629 (_ BitVec 32))) )
))
(declare-fun lt!266836 () SeekEntryResult!6099)

(assert (=> b!588544 (= res!376179 (or (= lt!266836 (MissingZero!6099 i!1108)) (= lt!266836 (MissingVacant!6099 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36772 (_ BitVec 32)) SeekEntryResult!6099)

(assert (=> b!588544 (= lt!266836 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588545 () Bool)

(declare-fun e!336073 () Bool)

(declare-fun lt!266838 () SeekEntryResult!6099)

(declare-fun lt!266835 () SeekEntryResult!6099)

(assert (=> b!588545 (= e!336073 (= lt!266838 lt!266835))))

(declare-fun b!588547 () Bool)

(declare-fun e!336075 () Bool)

(declare-fun e!336072 () Bool)

(assert (=> b!588547 (= e!336075 (not e!336072))))

(declare-fun res!376187 () Bool)

(assert (=> b!588547 (=> res!376187 e!336072)))

(assert (=> b!588547 (= res!376187 (bvslt mask!3053 #b00000000000000000000000000000000))))

(assert (=> b!588547 e!336073))

(declare-fun res!376185 () Bool)

(assert (=> b!588547 (=> (not res!376185) (not e!336073))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266837 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36772 (_ BitVec 32)) SeekEntryResult!6099)

(assert (=> b!588547 (= res!376185 (= lt!266835 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266837 vacantSpotIndex!68 (select (store (arr!17659 a!2986) i!1108 k0!1786) j!136) (array!36773 (store (arr!17659 a!2986) i!1108 k0!1786) (size!18023 a!2986)) mask!3053)))))

(assert (=> b!588547 (= lt!266835 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266837 vacantSpotIndex!68 (select (arr!17659 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18318 0))(
  ( (Unit!18319) )
))
(declare-fun lt!266839 () Unit!18318)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36772 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18318)

(assert (=> b!588547 (= lt!266839 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266837 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588547 (= lt!266837 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588548 () Bool)

(declare-fun res!376182 () Bool)

(assert (=> b!588548 (=> (not res!376182) (not e!336074))))

(declare-fun arrayContainsKey!0 (array!36772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588548 (= res!376182 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588549 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588549 (= e!336072 (validKeyInArray!0 (select (store (arr!17659 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!588550 () Bool)

(declare-fun res!376186 () Bool)

(assert (=> b!588550 (=> (not res!376186) (not e!336071))))

(declare-datatypes ((List!11700 0))(
  ( (Nil!11697) (Cons!11696 (h!12741 (_ BitVec 64)) (t!17928 List!11700)) )
))
(declare-fun arrayNoDuplicates!0 (array!36772 (_ BitVec 32) List!11700) Bool)

(assert (=> b!588550 (= res!376186 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11697))))

(declare-fun b!588551 () Bool)

(declare-fun res!376184 () Bool)

(assert (=> b!588551 (=> (not res!376184) (not e!336074))))

(assert (=> b!588551 (= res!376184 (validKeyInArray!0 k0!1786))))

(declare-fun b!588552 () Bool)

(assert (=> b!588552 (= e!336071 e!336075)))

(declare-fun res!376189 () Bool)

(assert (=> b!588552 (=> (not res!376189) (not e!336075))))

(assert (=> b!588552 (= res!376189 (and (= lt!266838 (Found!6099 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17659 a!2986) index!984) (select (arr!17659 a!2986) j!136))) (not (= (select (arr!17659 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588552 (= lt!266838 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17659 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588546 () Bool)

(declare-fun res!376188 () Bool)

(assert (=> b!588546 (=> (not res!376188) (not e!336071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36772 (_ BitVec 32)) Bool)

(assert (=> b!588546 (= res!376188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!376190 () Bool)

(assert (=> start!53928 (=> (not res!376190) (not e!336074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53928 (= res!376190 (validMask!0 mask!3053))))

(assert (=> start!53928 e!336074))

(assert (=> start!53928 true))

(declare-fun array_inv!13455 (array!36772) Bool)

(assert (=> start!53928 (array_inv!13455 a!2986)))

(declare-fun b!588553 () Bool)

(declare-fun res!376183 () Bool)

(assert (=> b!588553 (=> (not res!376183) (not e!336074))))

(assert (=> b!588553 (= res!376183 (validKeyInArray!0 (select (arr!17659 a!2986) j!136)))))

(declare-fun b!588554 () Bool)

(declare-fun res!376181 () Bool)

(assert (=> b!588554 (=> (not res!376181) (not e!336071))))

(assert (=> b!588554 (= res!376181 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17659 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17659 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53928 res!376190) b!588543))

(assert (= (and b!588543 res!376180) b!588553))

(assert (= (and b!588553 res!376183) b!588551))

(assert (= (and b!588551 res!376184) b!588548))

(assert (= (and b!588548 res!376182) b!588544))

(assert (= (and b!588544 res!376179) b!588546))

(assert (= (and b!588546 res!376188) b!588550))

(assert (= (and b!588550 res!376186) b!588554))

(assert (= (and b!588554 res!376181) b!588552))

(assert (= (and b!588552 res!376189) b!588547))

(assert (= (and b!588547 res!376185) b!588545))

(assert (= (and b!588547 (not res!376187)) b!588549))

(declare-fun m!567107 () Bool)

(assert (=> b!588551 m!567107))

(declare-fun m!567109 () Bool)

(assert (=> b!588554 m!567109))

(declare-fun m!567111 () Bool)

(assert (=> b!588554 m!567111))

(declare-fun m!567113 () Bool)

(assert (=> b!588554 m!567113))

(declare-fun m!567115 () Bool)

(assert (=> b!588550 m!567115))

(declare-fun m!567117 () Bool)

(assert (=> b!588544 m!567117))

(declare-fun m!567119 () Bool)

(assert (=> start!53928 m!567119))

(declare-fun m!567121 () Bool)

(assert (=> start!53928 m!567121))

(declare-fun m!567123 () Bool)

(assert (=> b!588546 m!567123))

(declare-fun m!567125 () Bool)

(assert (=> b!588553 m!567125))

(assert (=> b!588553 m!567125))

(declare-fun m!567127 () Bool)

(assert (=> b!588553 m!567127))

(declare-fun m!567129 () Bool)

(assert (=> b!588547 m!567129))

(declare-fun m!567131 () Bool)

(assert (=> b!588547 m!567131))

(assert (=> b!588547 m!567125))

(assert (=> b!588547 m!567111))

(assert (=> b!588547 m!567125))

(declare-fun m!567133 () Bool)

(assert (=> b!588547 m!567133))

(assert (=> b!588547 m!567131))

(declare-fun m!567135 () Bool)

(assert (=> b!588547 m!567135))

(declare-fun m!567137 () Bool)

(assert (=> b!588547 m!567137))

(declare-fun m!567139 () Bool)

(assert (=> b!588548 m!567139))

(assert (=> b!588549 m!567111))

(assert (=> b!588549 m!567131))

(assert (=> b!588549 m!567131))

(declare-fun m!567141 () Bool)

(assert (=> b!588549 m!567141))

(declare-fun m!567143 () Bool)

(assert (=> b!588552 m!567143))

(assert (=> b!588552 m!567125))

(assert (=> b!588552 m!567125))

(declare-fun m!567145 () Bool)

(assert (=> b!588552 m!567145))

(check-sat (not b!588551) (not b!588549) (not b!588550) (not start!53928) (not b!588553) (not b!588552) (not b!588548) (not b!588547) (not b!588544) (not b!588546))
(check-sat)
