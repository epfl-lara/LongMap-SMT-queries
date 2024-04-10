; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53320 () Bool)

(assert start!53320)

(declare-fun b!579834 () Bool)

(declare-fun res!367655 () Bool)

(declare-fun e!333132 () Bool)

(assert (=> b!579834 (=> (not res!367655) (not e!333132))))

(declare-datatypes ((array!36221 0))(
  ( (array!36222 (arr!17385 (Array (_ BitVec 32) (_ BitVec 64))) (size!17749 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36221)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579834 (= res!367655 (validKeyInArray!0 (select (arr!17385 a!2986) j!136)))))

(declare-fun b!579835 () Bool)

(declare-fun e!333130 () Bool)

(assert (=> b!579835 (= e!333130 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5825 0))(
  ( (MissingZero!5825 (index!25527 (_ BitVec 32))) (Found!5825 (index!25528 (_ BitVec 32))) (Intermediate!5825 (undefined!6637 Bool) (index!25529 (_ BitVec 32)) (x!54414 (_ BitVec 32))) (Undefined!5825) (MissingVacant!5825 (index!25530 (_ BitVec 32))) )
))
(declare-fun lt!264571 () SeekEntryResult!5825)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36221 (_ BitVec 32)) SeekEntryResult!5825)

(assert (=> b!579835 (= lt!264571 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17385 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579836 () Bool)

(declare-fun res!367652 () Bool)

(assert (=> b!579836 (=> (not res!367652) (not e!333130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36221 (_ BitVec 32)) Bool)

(assert (=> b!579836 (= res!367652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367657 () Bool)

(assert (=> start!53320 (=> (not res!367657) (not e!333132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53320 (= res!367657 (validMask!0 mask!3053))))

(assert (=> start!53320 e!333132))

(assert (=> start!53320 true))

(declare-fun array_inv!13181 (array!36221) Bool)

(assert (=> start!53320 (array_inv!13181 a!2986)))

(declare-fun b!579837 () Bool)

(declare-fun res!367658 () Bool)

(assert (=> b!579837 (=> (not res!367658) (not e!333132))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!579837 (= res!367658 (validKeyInArray!0 k!1786))))

(declare-fun b!579838 () Bool)

(declare-fun res!367651 () Bool)

(assert (=> b!579838 (=> (not res!367651) (not e!333132))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579838 (= res!367651 (and (= (size!17749 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17749 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17749 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579839 () Bool)

(declare-fun res!367654 () Bool)

(assert (=> b!579839 (=> (not res!367654) (not e!333130))))

(declare-datatypes ((List!11426 0))(
  ( (Nil!11423) (Cons!11422 (h!12467 (_ BitVec 64)) (t!17654 List!11426)) )
))
(declare-fun arrayNoDuplicates!0 (array!36221 (_ BitVec 32) List!11426) Bool)

(assert (=> b!579839 (= res!367654 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11423))))

(declare-fun b!579840 () Bool)

(declare-fun res!367656 () Bool)

(assert (=> b!579840 (=> (not res!367656) (not e!333130))))

(assert (=> b!579840 (= res!367656 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17385 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17385 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579841 () Bool)

(assert (=> b!579841 (= e!333132 e!333130)))

(declare-fun res!367650 () Bool)

(assert (=> b!579841 (=> (not res!367650) (not e!333130))))

(declare-fun lt!264570 () SeekEntryResult!5825)

(assert (=> b!579841 (= res!367650 (or (= lt!264570 (MissingZero!5825 i!1108)) (= lt!264570 (MissingVacant!5825 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36221 (_ BitVec 32)) SeekEntryResult!5825)

(assert (=> b!579841 (= lt!264570 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579842 () Bool)

(declare-fun res!367653 () Bool)

(assert (=> b!579842 (=> (not res!367653) (not e!333132))))

(declare-fun arrayContainsKey!0 (array!36221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579842 (= res!367653 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53320 res!367657) b!579838))

(assert (= (and b!579838 res!367651) b!579834))

(assert (= (and b!579834 res!367655) b!579837))

(assert (= (and b!579837 res!367658) b!579842))

(assert (= (and b!579842 res!367653) b!579841))

(assert (= (and b!579841 res!367650) b!579836))

(assert (= (and b!579836 res!367652) b!579839))

(assert (= (and b!579839 res!367654) b!579840))

(assert (= (and b!579840 res!367656) b!579835))

(declare-fun m!558439 () Bool)

(assert (=> b!579836 m!558439))

(declare-fun m!558441 () Bool)

(assert (=> b!579837 m!558441))

(declare-fun m!558443 () Bool)

(assert (=> b!579834 m!558443))

(assert (=> b!579834 m!558443))

(declare-fun m!558445 () Bool)

(assert (=> b!579834 m!558445))

(declare-fun m!558447 () Bool)

(assert (=> b!579841 m!558447))

(declare-fun m!558449 () Bool)

(assert (=> start!53320 m!558449))

(declare-fun m!558451 () Bool)

(assert (=> start!53320 m!558451))

(declare-fun m!558453 () Bool)

(assert (=> b!579839 m!558453))

(declare-fun m!558455 () Bool)

(assert (=> b!579842 m!558455))

(declare-fun m!558457 () Bool)

(assert (=> b!579840 m!558457))

(declare-fun m!558459 () Bool)

(assert (=> b!579840 m!558459))

(declare-fun m!558461 () Bool)

(assert (=> b!579840 m!558461))

(assert (=> b!579835 m!558443))

(assert (=> b!579835 m!558443))

(declare-fun m!558463 () Bool)

(assert (=> b!579835 m!558463))

(push 1)

