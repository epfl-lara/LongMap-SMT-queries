; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53264 () Bool)

(assert start!53264)

(declare-fun b!579078 () Bool)

(declare-fun res!366899 () Bool)

(declare-fun e!332878 () Bool)

(assert (=> b!579078 (=> (not res!366899) (not e!332878))))

(declare-datatypes ((array!36165 0))(
  ( (array!36166 (arr!17357 (Array (_ BitVec 32) (_ BitVec 64))) (size!17721 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36165)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579078 (= res!366899 (validKeyInArray!0 (select (arr!17357 a!2986) j!136)))))

(declare-fun b!579079 () Bool)

(declare-fun res!366894 () Bool)

(assert (=> b!579079 (=> (not res!366894) (not e!332878))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!579079 (= res!366894 (validKeyInArray!0 k!1786))))

(declare-fun b!579080 () Bool)

(declare-fun res!366898 () Bool)

(assert (=> b!579080 (=> (not res!366898) (not e!332878))))

(declare-fun arrayContainsKey!0 (array!36165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579080 (= res!366898 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579081 () Bool)

(declare-fun res!366900 () Bool)

(assert (=> b!579081 (=> (not res!366900) (not e!332878))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579081 (= res!366900 (and (= (size!17721 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17721 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17721 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366901 () Bool)

(assert (=> start!53264 (=> (not res!366901) (not e!332878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53264 (= res!366901 (validMask!0 mask!3053))))

(assert (=> start!53264 e!332878))

(assert (=> start!53264 true))

(declare-fun array_inv!13153 (array!36165) Bool)

(assert (=> start!53264 (array_inv!13153 a!2986)))

(declare-fun b!579082 () Bool)

(declare-fun e!332880 () Bool)

(assert (=> b!579082 (= e!332878 e!332880)))

(declare-fun res!366897 () Bool)

(assert (=> b!579082 (=> (not res!366897) (not e!332880))))

(declare-datatypes ((SeekEntryResult!5797 0))(
  ( (MissingZero!5797 (index!25415 (_ BitVec 32))) (Found!5797 (index!25416 (_ BitVec 32))) (Intermediate!5797 (undefined!6609 Bool) (index!25417 (_ BitVec 32)) (x!54306 (_ BitVec 32))) (Undefined!5797) (MissingVacant!5797 (index!25418 (_ BitVec 32))) )
))
(declare-fun lt!264403 () SeekEntryResult!5797)

(assert (=> b!579082 (= res!366897 (or (= lt!264403 (MissingZero!5797 i!1108)) (= lt!264403 (MissingVacant!5797 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36165 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!579082 (= lt!264403 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579083 () Bool)

(declare-fun res!366895 () Bool)

(assert (=> b!579083 (=> (not res!366895) (not e!332880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36165 (_ BitVec 32)) Bool)

(assert (=> b!579083 (= res!366895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579084 () Bool)

(declare-fun res!366896 () Bool)

(assert (=> b!579084 (=> (not res!366896) (not e!332880))))

(declare-datatypes ((List!11398 0))(
  ( (Nil!11395) (Cons!11394 (h!12439 (_ BitVec 64)) (t!17626 List!11398)) )
))
(declare-fun arrayNoDuplicates!0 (array!36165 (_ BitVec 32) List!11398) Bool)

(assert (=> b!579084 (= res!366896 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11395))))

(declare-fun b!579085 () Bool)

(assert (=> b!579085 (= e!332880 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264402 () SeekEntryResult!5797)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36165 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!579085 (= lt!264402 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17357 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579086 () Bool)

(declare-fun res!366902 () Bool)

(assert (=> b!579086 (=> (not res!366902) (not e!332880))))

(assert (=> b!579086 (= res!366902 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17357 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17357 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53264 res!366901) b!579081))

(assert (= (and b!579081 res!366900) b!579078))

(assert (= (and b!579078 res!366899) b!579079))

(assert (= (and b!579079 res!366894) b!579080))

(assert (= (and b!579080 res!366898) b!579082))

(assert (= (and b!579082 res!366897) b!579083))

(assert (= (and b!579083 res!366895) b!579084))

(assert (= (and b!579084 res!366896) b!579086))

(assert (= (and b!579086 res!366902) b!579085))

(declare-fun m!557711 () Bool)

(assert (=> b!579085 m!557711))

(assert (=> b!579085 m!557711))

(declare-fun m!557713 () Bool)

(assert (=> b!579085 m!557713))

(declare-fun m!557715 () Bool)

(assert (=> start!53264 m!557715))

(declare-fun m!557717 () Bool)

(assert (=> start!53264 m!557717))

(declare-fun m!557719 () Bool)

(assert (=> b!579086 m!557719))

(declare-fun m!557721 () Bool)

(assert (=> b!579086 m!557721))

(declare-fun m!557723 () Bool)

(assert (=> b!579086 m!557723))

(declare-fun m!557725 () Bool)

(assert (=> b!579083 m!557725))

(declare-fun m!557727 () Bool)

(assert (=> b!579079 m!557727))

(declare-fun m!557729 () Bool)

(assert (=> b!579082 m!557729))

(assert (=> b!579078 m!557711))

(assert (=> b!579078 m!557711))

(declare-fun m!557731 () Bool)

(assert (=> b!579078 m!557731))

(declare-fun m!557733 () Bool)

(assert (=> b!579080 m!557733))

(declare-fun m!557735 () Bool)

(assert (=> b!579084 m!557735))

(push 1)

(assert (not start!53264))

(assert (not b!579084))

(assert (not b!579080))

(assert (not b!579082))

(assert (not b!579083))

(assert (not b!579078))

(assert (not b!579085))

(assert (not b!579079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

