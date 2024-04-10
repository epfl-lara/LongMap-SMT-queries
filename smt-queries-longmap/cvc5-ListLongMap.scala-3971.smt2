; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53896 () Bool)

(assert start!53896)

(declare-fun b!588010 () Bool)

(declare-fun res!375651 () Bool)

(declare-fun e!335828 () Bool)

(assert (=> b!588010 (=> (not res!375651) (not e!335828))))

(declare-datatypes ((array!36740 0))(
  ( (array!36741 (arr!17643 (Array (_ BitVec 32) (_ BitVec 64))) (size!18007 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36740)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588010 (= res!375651 (validKeyInArray!0 (select (arr!17643 a!2986) j!136)))))

(declare-fun b!588011 () Bool)

(declare-fun res!375652 () Bool)

(declare-fun e!335827 () Bool)

(assert (=> b!588011 (=> (not res!375652) (not e!335827))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36740 (_ BitVec 32)) Bool)

(assert (=> b!588011 (= res!375652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588012 () Bool)

(declare-fun e!335825 () Bool)

(declare-datatypes ((SeekEntryResult!6083 0))(
  ( (MissingZero!6083 (index!26562 (_ BitVec 32))) (Found!6083 (index!26563 (_ BitVec 32))) (Intermediate!6083 (undefined!6895 Bool) (index!26564 (_ BitVec 32)) (x!55369 (_ BitVec 32))) (Undefined!6083) (MissingVacant!6083 (index!26565 (_ BitVec 32))) )
))
(declare-fun lt!266597 () SeekEntryResult!6083)

(declare-fun lt!266599 () SeekEntryResult!6083)

(assert (=> b!588012 (= e!335825 (= lt!266597 lt!266599))))

(declare-fun b!588013 () Bool)

(assert (=> b!588013 (= e!335828 e!335827)))

(declare-fun res!375648 () Bool)

(assert (=> b!588013 (=> (not res!375648) (not e!335827))))

(declare-fun lt!266596 () SeekEntryResult!6083)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588013 (= res!375648 (or (= lt!266596 (MissingZero!6083 i!1108)) (= lt!266596 (MissingVacant!6083 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36740 (_ BitVec 32)) SeekEntryResult!6083)

(assert (=> b!588013 (= lt!266596 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588014 () Bool)

(declare-fun res!375656 () Bool)

(assert (=> b!588014 (=> (not res!375656) (not e!335828))))

(assert (=> b!588014 (= res!375656 (and (= (size!18007 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18007 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18007 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!375646 () Bool)

(assert (=> start!53896 (=> (not res!375646) (not e!335828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53896 (= res!375646 (validMask!0 mask!3053))))

(assert (=> start!53896 e!335828))

(assert (=> start!53896 true))

(declare-fun array_inv!13439 (array!36740) Bool)

(assert (=> start!53896 (array_inv!13439 a!2986)))

(declare-fun b!588015 () Bool)

(declare-fun res!375649 () Bool)

(assert (=> b!588015 (=> (not res!375649) (not e!335827))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588015 (= res!375649 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17643 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17643 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588016 () Bool)

(declare-fun e!335826 () Bool)

(assert (=> b!588016 (= e!335826 (not true))))

(assert (=> b!588016 e!335825))

(declare-fun res!375647 () Bool)

(assert (=> b!588016 (=> (not res!375647) (not e!335825))))

(declare-fun lt!266595 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36740 (_ BitVec 32)) SeekEntryResult!6083)

(assert (=> b!588016 (= res!375647 (= lt!266599 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266595 vacantSpotIndex!68 (select (store (arr!17643 a!2986) i!1108 k!1786) j!136) (array!36741 (store (arr!17643 a!2986) i!1108 k!1786) (size!18007 a!2986)) mask!3053)))))

(assert (=> b!588016 (= lt!266599 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266595 vacantSpotIndex!68 (select (arr!17643 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18286 0))(
  ( (Unit!18287) )
))
(declare-fun lt!266598 () Unit!18286)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36740 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18286)

(assert (=> b!588016 (= lt!266598 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266595 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588016 (= lt!266595 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588017 () Bool)

(declare-fun res!375654 () Bool)

(assert (=> b!588017 (=> (not res!375654) (not e!335828))))

(declare-fun arrayContainsKey!0 (array!36740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588017 (= res!375654 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588018 () Bool)

(declare-fun res!375650 () Bool)

(assert (=> b!588018 (=> (not res!375650) (not e!335828))))

(assert (=> b!588018 (= res!375650 (validKeyInArray!0 k!1786))))

(declare-fun b!588019 () Bool)

(declare-fun res!375653 () Bool)

(assert (=> b!588019 (=> (not res!375653) (not e!335827))))

(declare-datatypes ((List!11684 0))(
  ( (Nil!11681) (Cons!11680 (h!12725 (_ BitVec 64)) (t!17912 List!11684)) )
))
(declare-fun arrayNoDuplicates!0 (array!36740 (_ BitVec 32) List!11684) Bool)

(assert (=> b!588019 (= res!375653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11681))))

(declare-fun b!588020 () Bool)

(assert (=> b!588020 (= e!335827 e!335826)))

(declare-fun res!375655 () Bool)

(assert (=> b!588020 (=> (not res!375655) (not e!335826))))

(assert (=> b!588020 (= res!375655 (and (= lt!266597 (Found!6083 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17643 a!2986) index!984) (select (arr!17643 a!2986) j!136))) (not (= (select (arr!17643 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588020 (= lt!266597 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17643 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53896 res!375646) b!588014))

(assert (= (and b!588014 res!375656) b!588010))

(assert (= (and b!588010 res!375651) b!588018))

(assert (= (and b!588018 res!375650) b!588017))

(assert (= (and b!588017 res!375654) b!588013))

(assert (= (and b!588013 res!375648) b!588011))

(assert (= (and b!588011 res!375652) b!588019))

(assert (= (and b!588019 res!375653) b!588015))

(assert (= (and b!588015 res!375649) b!588020))

(assert (= (and b!588020 res!375655) b!588016))

(assert (= (and b!588016 res!375647) b!588012))

(declare-fun m!566497 () Bool)

(assert (=> b!588010 m!566497))

(assert (=> b!588010 m!566497))

(declare-fun m!566499 () Bool)

(assert (=> b!588010 m!566499))

(declare-fun m!566501 () Bool)

(assert (=> start!53896 m!566501))

(declare-fun m!566503 () Bool)

(assert (=> start!53896 m!566503))

(declare-fun m!566505 () Bool)

(assert (=> b!588018 m!566505))

(declare-fun m!566507 () Bool)

(assert (=> b!588020 m!566507))

(assert (=> b!588020 m!566497))

(assert (=> b!588020 m!566497))

(declare-fun m!566509 () Bool)

(assert (=> b!588020 m!566509))

(declare-fun m!566511 () Bool)

(assert (=> b!588013 m!566511))

(declare-fun m!566513 () Bool)

(assert (=> b!588017 m!566513))

(declare-fun m!566515 () Bool)

(assert (=> b!588019 m!566515))

(declare-fun m!566517 () Bool)

(assert (=> b!588015 m!566517))

(declare-fun m!566519 () Bool)

(assert (=> b!588015 m!566519))

(declare-fun m!566521 () Bool)

(assert (=> b!588015 m!566521))

(declare-fun m!566523 () Bool)

(assert (=> b!588016 m!566523))

(declare-fun m!566525 () Bool)

(assert (=> b!588016 m!566525))

(assert (=> b!588016 m!566497))

(assert (=> b!588016 m!566519))

(declare-fun m!566527 () Bool)

(assert (=> b!588016 m!566527))

(assert (=> b!588016 m!566525))

(declare-fun m!566529 () Bool)

(assert (=> b!588016 m!566529))

(assert (=> b!588016 m!566497))

(declare-fun m!566531 () Bool)

(assert (=> b!588016 m!566531))

(declare-fun m!566533 () Bool)

(assert (=> b!588011 m!566533))

(push 1)

