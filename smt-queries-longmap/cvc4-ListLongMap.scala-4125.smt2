; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56300 () Bool)

(assert start!56300)

(declare-fun b!624259 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun e!358017 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37725 0))(
  ( (array!37726 (arr!18107 (Array (_ BitVec 32) (_ BitVec 64))) (size!18471 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37725)

(assert (=> b!624259 (= e!358017 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge vacantSpotIndex!68 (size!18471 a!2986))))))

(declare-fun b!624260 () Bool)

(declare-fun res!402414 () Bool)

(declare-fun e!358016 () Bool)

(assert (=> b!624260 (=> (not res!402414) (not e!358016))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624260 (= res!402414 (validKeyInArray!0 k!1786))))

(declare-fun b!624261 () Bool)

(assert (=> b!624261 (= e!358016 e!358017)))

(declare-fun res!402409 () Bool)

(assert (=> b!624261 (=> (not res!402409) (not e!358017))))

(declare-datatypes ((SeekEntryResult!6547 0))(
  ( (MissingZero!6547 (index!28472 (_ BitVec 32))) (Found!6547 (index!28473 (_ BitVec 32))) (Intermediate!6547 (undefined!7359 Bool) (index!28474 (_ BitVec 32)) (x!57230 (_ BitVec 32))) (Undefined!6547) (MissingVacant!6547 (index!28475 (_ BitVec 32))) )
))
(declare-fun lt!289558 () SeekEntryResult!6547)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624261 (= res!402409 (or (= lt!289558 (MissingZero!6547 i!1108)) (= lt!289558 (MissingVacant!6547 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37725 (_ BitVec 32)) SeekEntryResult!6547)

(assert (=> b!624261 (= lt!289558 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624262 () Bool)

(declare-fun res!402410 () Bool)

(assert (=> b!624262 (=> (not res!402410) (not e!358016))))

(declare-fun arrayContainsKey!0 (array!37725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624262 (= res!402410 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624263 () Bool)

(declare-fun res!402415 () Bool)

(assert (=> b!624263 (=> (not res!402415) (not e!358016))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624263 (= res!402415 (and (= (size!18471 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18471 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18471 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624264 () Bool)

(declare-fun res!402412 () Bool)

(assert (=> b!624264 (=> (not res!402412) (not e!358016))))

(assert (=> b!624264 (= res!402412 (validKeyInArray!0 (select (arr!18107 a!2986) j!136)))))

(declare-fun b!624265 () Bool)

(declare-fun res!402413 () Bool)

(assert (=> b!624265 (=> (not res!402413) (not e!358017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37725 (_ BitVec 32)) Bool)

(assert (=> b!624265 (= res!402413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402416 () Bool)

(assert (=> start!56300 (=> (not res!402416) (not e!358016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56300 (= res!402416 (validMask!0 mask!3053))))

(assert (=> start!56300 e!358016))

(assert (=> start!56300 true))

(declare-fun array_inv!13903 (array!37725) Bool)

(assert (=> start!56300 (array_inv!13903 a!2986)))

(declare-fun b!624266 () Bool)

(declare-fun res!402411 () Bool)

(assert (=> b!624266 (=> (not res!402411) (not e!358017))))

(declare-datatypes ((List!12148 0))(
  ( (Nil!12145) (Cons!12144 (h!13189 (_ BitVec 64)) (t!18376 List!12148)) )
))
(declare-fun arrayNoDuplicates!0 (array!37725 (_ BitVec 32) List!12148) Bool)

(assert (=> b!624266 (= res!402411 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12145))))

(assert (= (and start!56300 res!402416) b!624263))

(assert (= (and b!624263 res!402415) b!624264))

(assert (= (and b!624264 res!402412) b!624260))

(assert (= (and b!624260 res!402414) b!624262))

(assert (= (and b!624262 res!402410) b!624261))

(assert (= (and b!624261 res!402409) b!624265))

(assert (= (and b!624265 res!402413) b!624266))

(assert (= (and b!624266 res!402411) b!624259))

(declare-fun m!599993 () Bool)

(assert (=> b!624265 m!599993))

(declare-fun m!599995 () Bool)

(assert (=> b!624260 m!599995))

(declare-fun m!599997 () Bool)

(assert (=> b!624266 m!599997))

(declare-fun m!599999 () Bool)

(assert (=> start!56300 m!599999))

(declare-fun m!600001 () Bool)

(assert (=> start!56300 m!600001))

(declare-fun m!600003 () Bool)

(assert (=> b!624261 m!600003))

(declare-fun m!600005 () Bool)

(assert (=> b!624262 m!600005))

(declare-fun m!600007 () Bool)

(assert (=> b!624264 m!600007))

(assert (=> b!624264 m!600007))

(declare-fun m!600009 () Bool)

(assert (=> b!624264 m!600009))

(push 1)

(assert (not b!624262))

(assert (not b!624266))

(assert (not b!624260))

(assert (not start!56300))

(assert (not b!624265))

(assert (not b!624261))

(assert (not b!624264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

