; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53266 () Bool)

(assert start!53266)

(declare-fun b!579105 () Bool)

(declare-fun res!366927 () Bool)

(declare-fun e!332889 () Bool)

(assert (=> b!579105 (=> (not res!366927) (not e!332889))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579105 (= res!366927 (validKeyInArray!0 k!1786))))

(declare-fun b!579107 () Bool)

(declare-fun res!366928 () Bool)

(assert (=> b!579107 (=> (not res!366928) (not e!332889))))

(declare-datatypes ((array!36167 0))(
  ( (array!36168 (arr!17358 (Array (_ BitVec 32) (_ BitVec 64))) (size!17722 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36167)

(declare-fun arrayContainsKey!0 (array!36167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579107 (= res!366928 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579108 () Bool)

(declare-fun res!366922 () Bool)

(declare-fun e!332888 () Bool)

(assert (=> b!579108 (=> (not res!366922) (not e!332888))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579108 (= res!366922 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17358 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17358 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579109 () Bool)

(declare-fun res!366926 () Bool)

(assert (=> b!579109 (=> (not res!366926) (not e!332888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36167 (_ BitVec 32)) Bool)

(assert (=> b!579109 (= res!366926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579110 () Bool)

(declare-fun res!366923 () Bool)

(assert (=> b!579110 (=> (not res!366923) (not e!332889))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579110 (= res!366923 (validKeyInArray!0 (select (arr!17358 a!2986) j!136)))))

(declare-fun b!579111 () Bool)

(declare-fun res!366921 () Bool)

(assert (=> b!579111 (=> (not res!366921) (not e!332888))))

(declare-datatypes ((List!11399 0))(
  ( (Nil!11396) (Cons!11395 (h!12440 (_ BitVec 64)) (t!17627 List!11399)) )
))
(declare-fun arrayNoDuplicates!0 (array!36167 (_ BitVec 32) List!11399) Bool)

(assert (=> b!579111 (= res!366921 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11396))))

(declare-fun b!579112 () Bool)

(declare-fun res!366925 () Bool)

(assert (=> b!579112 (=> (not res!366925) (not e!332889))))

(assert (=> b!579112 (= res!366925 (and (= (size!17722 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17722 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17722 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579113 () Bool)

(assert (=> b!579113 (= e!332888 false)))

(declare-datatypes ((SeekEntryResult!5798 0))(
  ( (MissingZero!5798 (index!25419 (_ BitVec 32))) (Found!5798 (index!25420 (_ BitVec 32))) (Intermediate!5798 (undefined!6610 Bool) (index!25421 (_ BitVec 32)) (x!54315 (_ BitVec 32))) (Undefined!5798) (MissingVacant!5798 (index!25422 (_ BitVec 32))) )
))
(declare-fun lt!264409 () SeekEntryResult!5798)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36167 (_ BitVec 32)) SeekEntryResult!5798)

(assert (=> b!579113 (= lt!264409 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17358 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579106 () Bool)

(assert (=> b!579106 (= e!332889 e!332888)))

(declare-fun res!366929 () Bool)

(assert (=> b!579106 (=> (not res!366929) (not e!332888))))

(declare-fun lt!264408 () SeekEntryResult!5798)

(assert (=> b!579106 (= res!366929 (or (= lt!264408 (MissingZero!5798 i!1108)) (= lt!264408 (MissingVacant!5798 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36167 (_ BitVec 32)) SeekEntryResult!5798)

(assert (=> b!579106 (= lt!264408 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!366924 () Bool)

(assert (=> start!53266 (=> (not res!366924) (not e!332889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53266 (= res!366924 (validMask!0 mask!3053))))

(assert (=> start!53266 e!332889))

(assert (=> start!53266 true))

(declare-fun array_inv!13154 (array!36167) Bool)

(assert (=> start!53266 (array_inv!13154 a!2986)))

(assert (= (and start!53266 res!366924) b!579112))

(assert (= (and b!579112 res!366925) b!579110))

(assert (= (and b!579110 res!366923) b!579105))

(assert (= (and b!579105 res!366927) b!579107))

(assert (= (and b!579107 res!366928) b!579106))

(assert (= (and b!579106 res!366929) b!579109))

(assert (= (and b!579109 res!366926) b!579111))

(assert (= (and b!579111 res!366921) b!579108))

(assert (= (and b!579108 res!366922) b!579113))

(declare-fun m!557737 () Bool)

(assert (=> b!579111 m!557737))

(declare-fun m!557739 () Bool)

(assert (=> b!579106 m!557739))

(declare-fun m!557741 () Bool)

(assert (=> b!579105 m!557741))

(declare-fun m!557743 () Bool)

(assert (=> b!579107 m!557743))

(declare-fun m!557745 () Bool)

(assert (=> start!53266 m!557745))

(declare-fun m!557747 () Bool)

(assert (=> start!53266 m!557747))

(declare-fun m!557749 () Bool)

(assert (=> b!579108 m!557749))

(declare-fun m!557751 () Bool)

(assert (=> b!579108 m!557751))

(declare-fun m!557753 () Bool)

(assert (=> b!579108 m!557753))

(declare-fun m!557755 () Bool)

(assert (=> b!579110 m!557755))

(assert (=> b!579110 m!557755))

(declare-fun m!557757 () Bool)

(assert (=> b!579110 m!557757))

(declare-fun m!557759 () Bool)

(assert (=> b!579109 m!557759))

(assert (=> b!579113 m!557755))

(assert (=> b!579113 m!557755))

(declare-fun m!557761 () Bool)

(assert (=> b!579113 m!557761))

(push 1)

(assert (not b!579110))

(assert (not start!53266))

(assert (not b!579111))

(assert (not b!579109))

(assert (not b!579106))

(assert (not b!579113))

(assert (not b!579107))

(assert (not b!579105))

(check-sat)

