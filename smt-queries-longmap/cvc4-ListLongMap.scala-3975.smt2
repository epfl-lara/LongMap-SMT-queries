; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53924 () Bool)

(assert start!53924)

(declare-fun b!588472 () Bool)

(declare-fun res!376111 () Bool)

(declare-fun e!336036 () Bool)

(assert (=> b!588472 (=> (not res!376111) (not e!336036))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36768 0))(
  ( (array!36769 (arr!17657 (Array (_ BitVec 32) (_ BitVec 64))) (size!18021 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36768)

(assert (=> b!588472 (= res!376111 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17657 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17657 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588473 () Bool)

(declare-fun res!376118 () Bool)

(declare-fun e!336039 () Bool)

(assert (=> b!588473 (=> (not res!376118) (not e!336039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588473 (= res!376118 (validKeyInArray!0 k!1786))))

(declare-fun b!588474 () Bool)

(declare-fun res!376108 () Bool)

(assert (=> b!588474 (=> (not res!376108) (not e!336039))))

(declare-fun arrayContainsKey!0 (array!36768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588474 (= res!376108 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588475 () Bool)

(declare-fun res!376113 () Bool)

(assert (=> b!588475 (=> (not res!376113) (not e!336039))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588475 (= res!376113 (validKeyInArray!0 (select (arr!17657 a!2986) j!136)))))

(declare-fun b!588477 () Bool)

(declare-fun res!376112 () Bool)

(assert (=> b!588477 (=> (not res!376112) (not e!336036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36768 (_ BitVec 32)) Bool)

(assert (=> b!588477 (= res!376112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588478 () Bool)

(declare-fun res!376109 () Bool)

(assert (=> b!588478 (=> (not res!376109) (not e!336039))))

(assert (=> b!588478 (= res!376109 (and (= (size!18021 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18021 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18021 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588479 () Bool)

(declare-fun res!376117 () Bool)

(assert (=> b!588479 (=> (not res!376117) (not e!336036))))

(declare-datatypes ((List!11698 0))(
  ( (Nil!11695) (Cons!11694 (h!12739 (_ BitVec 64)) (t!17926 List!11698)) )
))
(declare-fun arrayNoDuplicates!0 (array!36768 (_ BitVec 32) List!11698) Bool)

(assert (=> b!588479 (= res!376117 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11695))))

(declare-fun b!588480 () Bool)

(declare-fun e!336038 () Bool)

(declare-datatypes ((SeekEntryResult!6097 0))(
  ( (MissingZero!6097 (index!26618 (_ BitVec 32))) (Found!6097 (index!26619 (_ BitVec 32))) (Intermediate!6097 (undefined!6909 Bool) (index!26620 (_ BitVec 32)) (x!55415 (_ BitVec 32))) (Undefined!6097) (MissingVacant!6097 (index!26621 (_ BitVec 32))) )
))
(declare-fun lt!266805 () SeekEntryResult!6097)

(declare-fun lt!266809 () SeekEntryResult!6097)

(assert (=> b!588480 (= e!336038 (= lt!266805 lt!266809))))

(declare-fun b!588481 () Bool)

(declare-fun e!336035 () Bool)

(assert (=> b!588481 (= e!336035 (not true))))

(assert (=> b!588481 e!336038))

(declare-fun res!376110 () Bool)

(assert (=> b!588481 (=> (not res!376110) (not e!336038))))

(declare-fun lt!266806 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36768 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!588481 (= res!376110 (= lt!266809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266806 vacantSpotIndex!68 (select (store (arr!17657 a!2986) i!1108 k!1786) j!136) (array!36769 (store (arr!17657 a!2986) i!1108 k!1786) (size!18021 a!2986)) mask!3053)))))

(assert (=> b!588481 (= lt!266809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266806 vacantSpotIndex!68 (select (arr!17657 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18314 0))(
  ( (Unit!18315) )
))
(declare-fun lt!266807 () Unit!18314)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18314)

(assert (=> b!588481 (= lt!266807 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266806 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588481 (= lt!266806 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588482 () Bool)

(assert (=> b!588482 (= e!336039 e!336036)))

(declare-fun res!376116 () Bool)

(assert (=> b!588482 (=> (not res!376116) (not e!336036))))

(declare-fun lt!266808 () SeekEntryResult!6097)

(assert (=> b!588482 (= res!376116 (or (= lt!266808 (MissingZero!6097 i!1108)) (= lt!266808 (MissingVacant!6097 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36768 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!588482 (= lt!266808 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588476 () Bool)

(assert (=> b!588476 (= e!336036 e!336035)))

(declare-fun res!376115 () Bool)

(assert (=> b!588476 (=> (not res!376115) (not e!336035))))

(assert (=> b!588476 (= res!376115 (and (= lt!266805 (Found!6097 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17657 a!2986) index!984) (select (arr!17657 a!2986) j!136))) (not (= (select (arr!17657 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588476 (= lt!266805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17657 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!376114 () Bool)

(assert (=> start!53924 (=> (not res!376114) (not e!336039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53924 (= res!376114 (validMask!0 mask!3053))))

(assert (=> start!53924 e!336039))

(assert (=> start!53924 true))

(declare-fun array_inv!13453 (array!36768) Bool)

(assert (=> start!53924 (array_inv!13453 a!2986)))

(assert (= (and start!53924 res!376114) b!588478))

(assert (= (and b!588478 res!376109) b!588475))

(assert (= (and b!588475 res!376113) b!588473))

(assert (= (and b!588473 res!376118) b!588474))

(assert (= (and b!588474 res!376108) b!588482))

(assert (= (and b!588482 res!376116) b!588477))

(assert (= (and b!588477 res!376112) b!588479))

(assert (= (and b!588479 res!376117) b!588472))

(assert (= (and b!588472 res!376111) b!588476))

(assert (= (and b!588476 res!376115) b!588481))

(assert (= (and b!588481 res!376110) b!588480))

(declare-fun m!567029 () Bool)

(assert (=> b!588479 m!567029))

(declare-fun m!567031 () Bool)

(assert (=> b!588481 m!567031))

(declare-fun m!567033 () Bool)

(assert (=> b!588481 m!567033))

(declare-fun m!567035 () Bool)

(assert (=> b!588481 m!567035))

(declare-fun m!567037 () Bool)

(assert (=> b!588481 m!567037))

(assert (=> b!588481 m!567033))

(declare-fun m!567039 () Bool)

(assert (=> b!588481 m!567039))

(declare-fun m!567041 () Bool)

(assert (=> b!588481 m!567041))

(assert (=> b!588481 m!567041))

(declare-fun m!567043 () Bool)

(assert (=> b!588481 m!567043))

(declare-fun m!567045 () Bool)

(assert (=> start!53924 m!567045))

(declare-fun m!567047 () Bool)

(assert (=> start!53924 m!567047))

(declare-fun m!567049 () Bool)

(assert (=> b!588473 m!567049))

(declare-fun m!567051 () Bool)

(assert (=> b!588482 m!567051))

(declare-fun m!567053 () Bool)

(assert (=> b!588472 m!567053))

(assert (=> b!588472 m!567035))

(declare-fun m!567055 () Bool)

(assert (=> b!588472 m!567055))

(declare-fun m!567057 () Bool)

(assert (=> b!588476 m!567057))

(assert (=> b!588476 m!567041))

(assert (=> b!588476 m!567041))

(declare-fun m!567059 () Bool)

(assert (=> b!588476 m!567059))

(declare-fun m!567061 () Bool)

(assert (=> b!588477 m!567061))

(declare-fun m!567063 () Bool)

(assert (=> b!588474 m!567063))

(assert (=> b!588475 m!567041))

(assert (=> b!588475 m!567041))

(declare-fun m!567065 () Bool)

(assert (=> b!588475 m!567065))

(push 1)

