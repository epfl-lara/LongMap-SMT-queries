; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56330 () Bool)

(assert start!56330)

(declare-fun b!624618 () Bool)

(declare-fun res!402774 () Bool)

(declare-fun e!358152 () Bool)

(assert (=> b!624618 (=> (not res!402774) (not e!358152))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37755 0))(
  ( (array!37756 (arr!18122 (Array (_ BitVec 32) (_ BitVec 64))) (size!18486 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37755)

(assert (=> b!624618 (= res!402774 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18122 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18122 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624619 () Bool)

(declare-fun res!402773 () Bool)

(declare-fun e!358151 () Bool)

(assert (=> b!624619 (=> (not res!402773) (not e!358151))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624619 (= res!402773 (and (= (size!18486 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18486 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18486 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624620 () Bool)

(declare-fun res!402772 () Bool)

(assert (=> b!624620 (=> (not res!402772) (not e!358151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624620 (= res!402772 (validKeyInArray!0 k!1786))))

(declare-fun b!624621 () Bool)

(declare-fun res!402776 () Bool)

(assert (=> b!624621 (=> (not res!402776) (not e!358152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37755 (_ BitVec 32)) Bool)

(assert (=> b!624621 (= res!402776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624622 () Bool)

(declare-fun res!402771 () Bool)

(assert (=> b!624622 (=> (not res!402771) (not e!358152))))

(declare-datatypes ((List!12163 0))(
  ( (Nil!12160) (Cons!12159 (h!13204 (_ BitVec 64)) (t!18391 List!12163)) )
))
(declare-fun arrayNoDuplicates!0 (array!37755 (_ BitVec 32) List!12163) Bool)

(assert (=> b!624622 (= res!402771 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12160))))

(declare-fun b!624624 () Bool)

(assert (=> b!624624 (= e!358152 false)))

(declare-datatypes ((SeekEntryResult!6562 0))(
  ( (MissingZero!6562 (index!28532 (_ BitVec 32))) (Found!6562 (index!28533 (_ BitVec 32))) (Intermediate!6562 (undefined!7374 Bool) (index!28534 (_ BitVec 32)) (x!57285 (_ BitVec 32))) (Undefined!6562) (MissingVacant!6562 (index!28535 (_ BitVec 32))) )
))
(declare-fun lt!289638 () SeekEntryResult!6562)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37755 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!624624 (= lt!289638 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18122 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!402768 () Bool)

(assert (=> start!56330 (=> (not res!402768) (not e!358151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56330 (= res!402768 (validMask!0 mask!3053))))

(assert (=> start!56330 e!358151))

(assert (=> start!56330 true))

(declare-fun array_inv!13918 (array!37755) Bool)

(assert (=> start!56330 (array_inv!13918 a!2986)))

(declare-fun b!624623 () Bool)

(declare-fun res!402769 () Bool)

(assert (=> b!624623 (=> (not res!402769) (not e!358151))))

(assert (=> b!624623 (= res!402769 (validKeyInArray!0 (select (arr!18122 a!2986) j!136)))))

(declare-fun b!624625 () Bool)

(declare-fun res!402770 () Bool)

(assert (=> b!624625 (=> (not res!402770) (not e!358151))))

(declare-fun arrayContainsKey!0 (array!37755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624625 (= res!402770 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624626 () Bool)

(assert (=> b!624626 (= e!358151 e!358152)))

(declare-fun res!402775 () Bool)

(assert (=> b!624626 (=> (not res!402775) (not e!358152))))

(declare-fun lt!289639 () SeekEntryResult!6562)

(assert (=> b!624626 (= res!402775 (or (= lt!289639 (MissingZero!6562 i!1108)) (= lt!289639 (MissingVacant!6562 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37755 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!624626 (= lt!289639 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56330 res!402768) b!624619))

(assert (= (and b!624619 res!402773) b!624623))

(assert (= (and b!624623 res!402769) b!624620))

(assert (= (and b!624620 res!402772) b!624625))

(assert (= (and b!624625 res!402770) b!624626))

(assert (= (and b!624626 res!402775) b!624621))

(assert (= (and b!624621 res!402776) b!624622))

(assert (= (and b!624622 res!402771) b!624618))

(assert (= (and b!624618 res!402774) b!624624))

(declare-fun m!600309 () Bool)

(assert (=> start!56330 m!600309))

(declare-fun m!600311 () Bool)

(assert (=> start!56330 m!600311))

(declare-fun m!600313 () Bool)

(assert (=> b!624626 m!600313))

(declare-fun m!600315 () Bool)

(assert (=> b!624621 m!600315))

(declare-fun m!600317 () Bool)

(assert (=> b!624624 m!600317))

(assert (=> b!624624 m!600317))

(declare-fun m!600319 () Bool)

(assert (=> b!624624 m!600319))

(declare-fun m!600321 () Bool)

(assert (=> b!624620 m!600321))

(declare-fun m!600323 () Bool)

(assert (=> b!624622 m!600323))

(declare-fun m!600325 () Bool)

(assert (=> b!624625 m!600325))

(assert (=> b!624623 m!600317))

(assert (=> b!624623 m!600317))

(declare-fun m!600327 () Bool)

(assert (=> b!624623 m!600327))

(declare-fun m!600329 () Bool)

(assert (=> b!624618 m!600329))

(declare-fun m!600331 () Bool)

(assert (=> b!624618 m!600331))

(declare-fun m!600333 () Bool)

(assert (=> b!624618 m!600333))

(push 1)

(assert (not b!624624))

(assert (not b!624625))

(assert (not b!624621))

