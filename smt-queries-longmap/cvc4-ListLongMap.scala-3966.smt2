; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53870 () Bool)

(assert start!53870)

(declare-fun b!587581 () Bool)

(declare-fun e!335668 () Bool)

(declare-fun e!335670 () Bool)

(assert (=> b!587581 (= e!335668 e!335670)))

(declare-fun res!375224 () Bool)

(assert (=> b!587581 (=> (not res!375224) (not e!335670))))

(declare-datatypes ((SeekEntryResult!6070 0))(
  ( (MissingZero!6070 (index!26510 (_ BitVec 32))) (Found!6070 (index!26511 (_ BitVec 32))) (Intermediate!6070 (undefined!6882 Bool) (index!26512 (_ BitVec 32)) (x!55316 (_ BitVec 32))) (Undefined!6070) (MissingVacant!6070 (index!26513 (_ BitVec 32))) )
))
(declare-fun lt!266439 () SeekEntryResult!6070)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587581 (= res!375224 (or (= lt!266439 (MissingZero!6070 i!1108)) (= lt!266439 (MissingVacant!6070 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36714 0))(
  ( (array!36715 (arr!17630 (Array (_ BitVec 32) (_ BitVec 64))) (size!17994 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36714)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36714 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!587581 (= lt!266439 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587582 () Bool)

(declare-fun res!375220 () Bool)

(assert (=> b!587582 (=> (not res!375220) (not e!335670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36714 (_ BitVec 32)) Bool)

(assert (=> b!587582 (= res!375220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!375221 () Bool)

(assert (=> start!53870 (=> (not res!375221) (not e!335668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53870 (= res!375221 (validMask!0 mask!3053))))

(assert (=> start!53870 e!335668))

(assert (=> start!53870 true))

(declare-fun array_inv!13426 (array!36714) Bool)

(assert (=> start!53870 (array_inv!13426 a!2986)))

(declare-fun b!587583 () Bool)

(declare-fun res!375217 () Bool)

(assert (=> b!587583 (=> (not res!375217) (not e!335670))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587583 (= res!375217 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17630 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17630 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587584 () Bool)

(declare-fun res!375219 () Bool)

(assert (=> b!587584 (=> (not res!375219) (not e!335670))))

(declare-datatypes ((List!11671 0))(
  ( (Nil!11668) (Cons!11667 (h!12712 (_ BitVec 64)) (t!17899 List!11671)) )
))
(declare-fun arrayNoDuplicates!0 (array!36714 (_ BitVec 32) List!11671) Bool)

(assert (=> b!587584 (= res!375219 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11668))))

(declare-fun b!587585 () Bool)

(assert (=> b!587585 (= e!335670 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!266440 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36714 (_ BitVec 32)) SeekEntryResult!6070)

(assert (=> b!587585 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266440 vacantSpotIndex!68 (select (arr!17630 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266440 vacantSpotIndex!68 (select (store (arr!17630 a!2986) i!1108 k!1786) j!136) (array!36715 (store (arr!17630 a!2986) i!1108 k!1786) (size!17994 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18260 0))(
  ( (Unit!18261) )
))
(declare-fun lt!266438 () Unit!18260)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18260)

(assert (=> b!587585 (= lt!266438 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266440 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587585 (= lt!266440 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587586 () Bool)

(declare-fun res!375222 () Bool)

(assert (=> b!587586 (=> (not res!375222) (not e!335670))))

(assert (=> b!587586 (= res!375222 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17630 a!2986) index!984) (select (arr!17630 a!2986) j!136))) (not (= (select (arr!17630 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587587 () Bool)

(declare-fun res!375225 () Bool)

(assert (=> b!587587 (=> (not res!375225) (not e!335668))))

(assert (=> b!587587 (= res!375225 (and (= (size!17994 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17994 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17994 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587588 () Bool)

(declare-fun res!375226 () Bool)

(assert (=> b!587588 (=> (not res!375226) (not e!335668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587588 (= res!375226 (validKeyInArray!0 (select (arr!17630 a!2986) j!136)))))

(declare-fun b!587589 () Bool)

(declare-fun res!375218 () Bool)

(assert (=> b!587589 (=> (not res!375218) (not e!335668))))

(assert (=> b!587589 (= res!375218 (validKeyInArray!0 k!1786))))

(declare-fun b!587590 () Bool)

(declare-fun res!375227 () Bool)

(assert (=> b!587590 (=> (not res!375227) (not e!335670))))

(assert (=> b!587590 (= res!375227 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17630 a!2986) j!136) a!2986 mask!3053) (Found!6070 j!136)))))

(declare-fun b!587591 () Bool)

(declare-fun res!375223 () Bool)

(assert (=> b!587591 (=> (not res!375223) (not e!335668))))

(declare-fun arrayContainsKey!0 (array!36714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587591 (= res!375223 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53870 res!375221) b!587587))

(assert (= (and b!587587 res!375225) b!587588))

(assert (= (and b!587588 res!375226) b!587589))

(assert (= (and b!587589 res!375218) b!587591))

(assert (= (and b!587591 res!375223) b!587581))

(assert (= (and b!587581 res!375224) b!587582))

(assert (= (and b!587582 res!375220) b!587584))

(assert (= (and b!587584 res!375219) b!587583))

(assert (= (and b!587583 res!375217) b!587590))

(assert (= (and b!587590 res!375227) b!587586))

(assert (= (and b!587586 res!375222) b!587585))

(declare-fun m!566003 () Bool)

(assert (=> b!587589 m!566003))

(declare-fun m!566005 () Bool)

(assert (=> start!53870 m!566005))

(declare-fun m!566007 () Bool)

(assert (=> start!53870 m!566007))

(declare-fun m!566009 () Bool)

(assert (=> b!587582 m!566009))

(declare-fun m!566011 () Bool)

(assert (=> b!587591 m!566011))

(declare-fun m!566013 () Bool)

(assert (=> b!587581 m!566013))

(declare-fun m!566015 () Bool)

(assert (=> b!587585 m!566015))

(declare-fun m!566017 () Bool)

(assert (=> b!587585 m!566017))

(declare-fun m!566019 () Bool)

(assert (=> b!587585 m!566019))

(declare-fun m!566021 () Bool)

(assert (=> b!587585 m!566021))

(declare-fun m!566023 () Bool)

(assert (=> b!587585 m!566023))

(assert (=> b!587585 m!566019))

(declare-fun m!566025 () Bool)

(assert (=> b!587585 m!566025))

(assert (=> b!587585 m!566017))

(declare-fun m!566027 () Bool)

(assert (=> b!587585 m!566027))

(declare-fun m!566029 () Bool)

(assert (=> b!587583 m!566029))

(assert (=> b!587583 m!566023))

(declare-fun m!566031 () Bool)

(assert (=> b!587583 m!566031))

(assert (=> b!587590 m!566019))

(assert (=> b!587590 m!566019))

(declare-fun m!566033 () Bool)

(assert (=> b!587590 m!566033))

(declare-fun m!566035 () Bool)

(assert (=> b!587584 m!566035))

(declare-fun m!566037 () Bool)

(assert (=> b!587586 m!566037))

(assert (=> b!587586 m!566019))

(assert (=> b!587588 m!566019))

(assert (=> b!587588 m!566019))

(declare-fun m!566039 () Bool)

(assert (=> b!587588 m!566039))

(push 1)

(assert (not start!53870))

(assert (not b!587589))

(assert (not b!587590))

(assert (not b!587581))

(assert (not b!587582))

(assert (not b!587588))

(assert (not b!587585))

(assert (not b!587591))

(assert (not b!587584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

