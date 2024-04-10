; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53872 () Bool)

(assert start!53872)

(declare-fun b!587614 () Bool)

(declare-fun res!375252 () Bool)

(declare-fun e!335678 () Bool)

(assert (=> b!587614 (=> (not res!375252) (not e!335678))))

(declare-datatypes ((array!36716 0))(
  ( (array!36717 (arr!17631 (Array (_ BitVec 32) (_ BitVec 64))) (size!17995 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36716)

(declare-datatypes ((List!11672 0))(
  ( (Nil!11669) (Cons!11668 (h!12713 (_ BitVec 64)) (t!17900 List!11672)) )
))
(declare-fun arrayNoDuplicates!0 (array!36716 (_ BitVec 32) List!11672) Bool)

(assert (=> b!587614 (= res!375252 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11669))))

(declare-fun b!587615 () Bool)

(declare-fun res!375253 () Bool)

(assert (=> b!587615 (=> (not res!375253) (not e!335678))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587615 (= res!375253 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17631 a!2986) index!984) (select (arr!17631 a!2986) j!136))) (not (= (select (arr!17631 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587616 () Bool)

(declare-fun res!375257 () Bool)

(assert (=> b!587616 (=> (not res!375257) (not e!335678))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6071 0))(
  ( (MissingZero!6071 (index!26514 (_ BitVec 32))) (Found!6071 (index!26515 (_ BitVec 32))) (Intermediate!6071 (undefined!6883 Bool) (index!26516 (_ BitVec 32)) (x!55325 (_ BitVec 32))) (Undefined!6071) (MissingVacant!6071 (index!26517 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36716 (_ BitVec 32)) SeekEntryResult!6071)

(assert (=> b!587616 (= res!375257 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17631 a!2986) j!136) a!2986 mask!3053) (Found!6071 j!136)))))

(declare-fun b!587617 () Bool)

(declare-fun res!375254 () Bool)

(declare-fun e!335679 () Bool)

(assert (=> b!587617 (=> (not res!375254) (not e!335679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587617 (= res!375254 (validKeyInArray!0 (select (arr!17631 a!2986) j!136)))))

(declare-fun b!587618 () Bool)

(declare-fun res!375256 () Bool)

(assert (=> b!587618 (=> (not res!375256) (not e!335678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36716 (_ BitVec 32)) Bool)

(assert (=> b!587618 (= res!375256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587619 () Bool)

(assert (=> b!587619 (= e!335679 e!335678)))

(declare-fun res!375255 () Bool)

(assert (=> b!587619 (=> (not res!375255) (not e!335678))))

(declare-fun lt!266449 () SeekEntryResult!6071)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587619 (= res!375255 (or (= lt!266449 (MissingZero!6071 i!1108)) (= lt!266449 (MissingVacant!6071 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36716 (_ BitVec 32)) SeekEntryResult!6071)

(assert (=> b!587619 (= lt!266449 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587620 () Bool)

(assert (=> b!587620 (= e!335678 (not true))))

(declare-fun lt!266448 () (_ BitVec 32))

(assert (=> b!587620 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266448 vacantSpotIndex!68 (select (arr!17631 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266448 vacantSpotIndex!68 (select (store (arr!17631 a!2986) i!1108 k!1786) j!136) (array!36717 (store (arr!17631 a!2986) i!1108 k!1786) (size!17995 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18262 0))(
  ( (Unit!18263) )
))
(declare-fun lt!266447 () Unit!18262)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36716 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18262)

(assert (=> b!587620 (= lt!266447 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266448 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587620 (= lt!266448 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587621 () Bool)

(declare-fun res!375258 () Bool)

(assert (=> b!587621 (=> (not res!375258) (not e!335679))))

(assert (=> b!587621 (= res!375258 (validKeyInArray!0 k!1786))))

(declare-fun b!587622 () Bool)

(declare-fun res!375250 () Bool)

(assert (=> b!587622 (=> (not res!375250) (not e!335679))))

(declare-fun arrayContainsKey!0 (array!36716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587622 (= res!375250 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!375251 () Bool)

(assert (=> start!53872 (=> (not res!375251) (not e!335679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53872 (= res!375251 (validMask!0 mask!3053))))

(assert (=> start!53872 e!335679))

(assert (=> start!53872 true))

(declare-fun array_inv!13427 (array!36716) Bool)

(assert (=> start!53872 (array_inv!13427 a!2986)))

(declare-fun b!587623 () Bool)

(declare-fun res!375259 () Bool)

(assert (=> b!587623 (=> (not res!375259) (not e!335679))))

(assert (=> b!587623 (= res!375259 (and (= (size!17995 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17995 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17995 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587624 () Bool)

(declare-fun res!375260 () Bool)

(assert (=> b!587624 (=> (not res!375260) (not e!335678))))

(assert (=> b!587624 (= res!375260 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17631 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17631 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53872 res!375251) b!587623))

(assert (= (and b!587623 res!375259) b!587617))

(assert (= (and b!587617 res!375254) b!587621))

(assert (= (and b!587621 res!375258) b!587622))

(assert (= (and b!587622 res!375250) b!587619))

(assert (= (and b!587619 res!375255) b!587618))

(assert (= (and b!587618 res!375256) b!587614))

(assert (= (and b!587614 res!375252) b!587624))

(assert (= (and b!587624 res!375260) b!587616))

(assert (= (and b!587616 res!375257) b!587615))

(assert (= (and b!587615 res!375253) b!587620))

(declare-fun m!566041 () Bool)

(assert (=> b!587615 m!566041))

(declare-fun m!566043 () Bool)

(assert (=> b!587615 m!566043))

(declare-fun m!566045 () Bool)

(assert (=> b!587614 m!566045))

(assert (=> b!587616 m!566043))

(assert (=> b!587616 m!566043))

(declare-fun m!566047 () Bool)

(assert (=> b!587616 m!566047))

(declare-fun m!566049 () Bool)

(assert (=> b!587622 m!566049))

(declare-fun m!566051 () Bool)

(assert (=> b!587621 m!566051))

(declare-fun m!566053 () Bool)

(assert (=> start!53872 m!566053))

(declare-fun m!566055 () Bool)

(assert (=> start!53872 m!566055))

(declare-fun m!566057 () Bool)

(assert (=> b!587624 m!566057))

(declare-fun m!566059 () Bool)

(assert (=> b!587624 m!566059))

(declare-fun m!566061 () Bool)

(assert (=> b!587624 m!566061))

(declare-fun m!566063 () Bool)

(assert (=> b!587618 m!566063))

(declare-fun m!566065 () Bool)

(assert (=> b!587620 m!566065))

(declare-fun m!566067 () Bool)

(assert (=> b!587620 m!566067))

(assert (=> b!587620 m!566043))

(declare-fun m!566069 () Bool)

(assert (=> b!587620 m!566069))

(assert (=> b!587620 m!566043))

(assert (=> b!587620 m!566067))

(declare-fun m!566071 () Bool)

(assert (=> b!587620 m!566071))

(assert (=> b!587620 m!566059))

(declare-fun m!566073 () Bool)

(assert (=> b!587620 m!566073))

(declare-fun m!566075 () Bool)

(assert (=> b!587619 m!566075))

(assert (=> b!587617 m!566043))

(assert (=> b!587617 m!566043))

(declare-fun m!566077 () Bool)

(assert (=> b!587617 m!566077))

(push 1)

