; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56398 () Bool)

(assert start!56398)

(declare-fun b!625104 () Bool)

(declare-fun res!403115 () Bool)

(declare-fun e!358376 () Bool)

(assert (=> b!625104 (=> (not res!403115) (not e!358376))))

(declare-datatypes ((array!37778 0))(
  ( (array!37779 (arr!18132 (Array (_ BitVec 32) (_ BitVec 64))) (size!18496 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37778)

(declare-datatypes ((List!12173 0))(
  ( (Nil!12170) (Cons!12169 (h!13214 (_ BitVec 64)) (t!18401 List!12173)) )
))
(declare-fun arrayNoDuplicates!0 (array!37778 (_ BitVec 32) List!12173) Bool)

(assert (=> b!625104 (= res!403115 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12170))))

(declare-fun b!625105 () Bool)

(declare-fun res!403111 () Bool)

(assert (=> b!625105 (=> (not res!403111) (not e!358376))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625105 (= res!403111 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18132 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18132 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403118 () Bool)

(declare-fun e!358375 () Bool)

(assert (=> start!56398 (=> (not res!403118) (not e!358375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56398 (= res!403118 (validMask!0 mask!3053))))

(assert (=> start!56398 e!358375))

(assert (=> start!56398 true))

(declare-fun array_inv!13928 (array!37778) Bool)

(assert (=> start!56398 (array_inv!13928 a!2986)))

(declare-fun b!625106 () Bool)

(declare-fun res!403113 () Bool)

(assert (=> b!625106 (=> (not res!403113) (not e!358375))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625106 (= res!403113 (validKeyInArray!0 (select (arr!18132 a!2986) j!136)))))

(declare-fun b!625107 () Bool)

(assert (=> b!625107 (= e!358375 e!358376)))

(declare-fun res!403112 () Bool)

(assert (=> b!625107 (=> (not res!403112) (not e!358376))))

(declare-datatypes ((SeekEntryResult!6572 0))(
  ( (MissingZero!6572 (index!28572 (_ BitVec 32))) (Found!6572 (index!28573 (_ BitVec 32))) (Intermediate!6572 (undefined!7384 Bool) (index!28574 (_ BitVec 32)) (x!57330 (_ BitVec 32))) (Undefined!6572) (MissingVacant!6572 (index!28575 (_ BitVec 32))) )
))
(declare-fun lt!289762 () SeekEntryResult!6572)

(assert (=> b!625107 (= res!403112 (or (= lt!289762 (MissingZero!6572 i!1108)) (= lt!289762 (MissingVacant!6572 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37778 (_ BitVec 32)) SeekEntryResult!6572)

(assert (=> b!625107 (= lt!289762 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625108 () Bool)

(assert (=> b!625108 (= e!358376 false)))

(declare-fun lt!289761 () SeekEntryResult!6572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37778 (_ BitVec 32)) SeekEntryResult!6572)

(assert (=> b!625108 (= lt!289761 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18132 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625109 () Bool)

(declare-fun res!403116 () Bool)

(assert (=> b!625109 (=> (not res!403116) (not e!358375))))

(assert (=> b!625109 (= res!403116 (and (= (size!18496 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18496 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18496 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625110 () Bool)

(declare-fun res!403114 () Bool)

(assert (=> b!625110 (=> (not res!403114) (not e!358376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37778 (_ BitVec 32)) Bool)

(assert (=> b!625110 (= res!403114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625111 () Bool)

(declare-fun res!403110 () Bool)

(assert (=> b!625111 (=> (not res!403110) (not e!358375))))

(assert (=> b!625111 (= res!403110 (validKeyInArray!0 k!1786))))

(declare-fun b!625112 () Bool)

(declare-fun res!403117 () Bool)

(assert (=> b!625112 (=> (not res!403117) (not e!358375))))

(declare-fun arrayContainsKey!0 (array!37778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625112 (= res!403117 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56398 res!403118) b!625109))

(assert (= (and b!625109 res!403116) b!625106))

(assert (= (and b!625106 res!403113) b!625111))

(assert (= (and b!625111 res!403110) b!625112))

(assert (= (and b!625112 res!403117) b!625107))

(assert (= (and b!625107 res!403112) b!625110))

(assert (= (and b!625110 res!403114) b!625104))

(assert (= (and b!625104 res!403115) b!625105))

(assert (= (and b!625105 res!403111) b!625108))

(declare-fun m!600695 () Bool)

(assert (=> b!625112 m!600695))

(declare-fun m!600697 () Bool)

(assert (=> start!56398 m!600697))

(declare-fun m!600699 () Bool)

(assert (=> start!56398 m!600699))

(declare-fun m!600701 () Bool)

(assert (=> b!625111 m!600701))

(declare-fun m!600703 () Bool)

(assert (=> b!625104 m!600703))

(declare-fun m!600705 () Bool)

(assert (=> b!625107 m!600705))

(declare-fun m!600707 () Bool)

(assert (=> b!625105 m!600707))

(declare-fun m!600709 () Bool)

(assert (=> b!625105 m!600709))

(declare-fun m!600711 () Bool)

(assert (=> b!625105 m!600711))

(declare-fun m!600713 () Bool)

(assert (=> b!625108 m!600713))

(assert (=> b!625108 m!600713))

(declare-fun m!600715 () Bool)

(assert (=> b!625108 m!600715))

(declare-fun m!600717 () Bool)

(assert (=> b!625110 m!600717))

(assert (=> b!625106 m!600713))

(assert (=> b!625106 m!600713))

(declare-fun m!600719 () Bool)

(assert (=> b!625106 m!600719))

(push 1)

