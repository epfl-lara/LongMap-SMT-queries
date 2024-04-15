; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56400 () Bool)

(assert start!56400)

(declare-fun b!625078 () Bool)

(declare-fun res!403235 () Bool)

(declare-fun e!358282 () Bool)

(assert (=> b!625078 (=> (not res!403235) (not e!358282))))

(declare-datatypes ((array!37794 0))(
  ( (array!37795 (arr!18140 (Array (_ BitVec 32) (_ BitVec 64))) (size!18505 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37794)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37794 (_ BitVec 32)) Bool)

(assert (=> b!625078 (= res!403235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625079 () Bool)

(declare-fun res!403233 () Bool)

(declare-fun e!358284 () Bool)

(assert (=> b!625079 (=> (not res!403233) (not e!358284))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625079 (= res!403233 (validKeyInArray!0 k0!1786))))

(declare-fun res!403229 () Bool)

(assert (=> start!56400 (=> (not res!403229) (not e!358284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56400 (= res!403229 (validMask!0 mask!3053))))

(assert (=> start!56400 e!358284))

(assert (=> start!56400 true))

(declare-fun array_inv!14023 (array!37794) Bool)

(assert (=> start!56400 (array_inv!14023 a!2986)))

(declare-fun b!625080 () Bool)

(declare-fun res!403228 () Bool)

(assert (=> b!625080 (=> (not res!403228) (not e!358282))))

(declare-datatypes ((List!12220 0))(
  ( (Nil!12217) (Cons!12216 (h!13261 (_ BitVec 64)) (t!18439 List!12220)) )
))
(declare-fun arrayNoDuplicates!0 (array!37794 (_ BitVec 32) List!12220) Bool)

(assert (=> b!625080 (= res!403228 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12217))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!625081 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625081 (= e!358282 (and (bvslt x!910 #b01111111111111111111111111111110) (bvsge index!984 (size!18505 a!2986))))))

(declare-fun b!625082 () Bool)

(declare-fun res!403231 () Bool)

(assert (=> b!625082 (=> (not res!403231) (not e!358284))))

(declare-fun arrayContainsKey!0 (array!37794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625082 (= res!403231 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625083 () Bool)

(declare-fun res!403226 () Bool)

(assert (=> b!625083 (=> (not res!403226) (not e!358284))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625083 (= res!403226 (and (= (size!18505 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18505 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18505 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625084 () Bool)

(declare-fun res!403232 () Bool)

(assert (=> b!625084 (=> (not res!403232) (not e!358282))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6577 0))(
  ( (MissingZero!6577 (index!28592 (_ BitVec 32))) (Found!6577 (index!28593 (_ BitVec 32))) (Intermediate!6577 (undefined!7389 Bool) (index!28594 (_ BitVec 32)) (x!57354 (_ BitVec 32))) (Undefined!6577) (MissingVacant!6577 (index!28595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37794 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!625084 (= res!403232 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18140 a!2986) j!136) a!2986 mask!3053) (Found!6577 j!136)))))

(declare-fun b!625085 () Bool)

(declare-fun res!403234 () Bool)

(assert (=> b!625085 (=> (not res!403234) (not e!358282))))

(assert (=> b!625085 (= res!403234 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18140 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18140 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625086 () Bool)

(assert (=> b!625086 (= e!358284 e!358282)))

(declare-fun res!403230 () Bool)

(assert (=> b!625086 (=> (not res!403230) (not e!358282))))

(declare-fun lt!289579 () SeekEntryResult!6577)

(assert (=> b!625086 (= res!403230 (or (= lt!289579 (MissingZero!6577 i!1108)) (= lt!289579 (MissingVacant!6577 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37794 (_ BitVec 32)) SeekEntryResult!6577)

(assert (=> b!625086 (= lt!289579 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625087 () Bool)

(declare-fun res!403227 () Bool)

(assert (=> b!625087 (=> (not res!403227) (not e!358284))))

(assert (=> b!625087 (= res!403227 (validKeyInArray!0 (select (arr!18140 a!2986) j!136)))))

(assert (= (and start!56400 res!403229) b!625083))

(assert (= (and b!625083 res!403226) b!625087))

(assert (= (and b!625087 res!403227) b!625079))

(assert (= (and b!625079 res!403233) b!625082))

(assert (= (and b!625082 res!403231) b!625086))

(assert (= (and b!625086 res!403230) b!625078))

(assert (= (and b!625078 res!403235) b!625080))

(assert (= (and b!625080 res!403228) b!625085))

(assert (= (and b!625085 res!403234) b!625084))

(assert (= (and b!625084 res!403232) b!625081))

(declare-fun m!600157 () Bool)

(assert (=> b!625086 m!600157))

(declare-fun m!600159 () Bool)

(assert (=> start!56400 m!600159))

(declare-fun m!600161 () Bool)

(assert (=> start!56400 m!600161))

(declare-fun m!600163 () Bool)

(assert (=> b!625080 m!600163))

(declare-fun m!600165 () Bool)

(assert (=> b!625078 m!600165))

(declare-fun m!600167 () Bool)

(assert (=> b!625082 m!600167))

(declare-fun m!600169 () Bool)

(assert (=> b!625085 m!600169))

(declare-fun m!600171 () Bool)

(assert (=> b!625085 m!600171))

(declare-fun m!600173 () Bool)

(assert (=> b!625085 m!600173))

(declare-fun m!600175 () Bool)

(assert (=> b!625079 m!600175))

(declare-fun m!600177 () Bool)

(assert (=> b!625084 m!600177))

(assert (=> b!625084 m!600177))

(declare-fun m!600179 () Bool)

(assert (=> b!625084 m!600179))

(assert (=> b!625087 m!600177))

(assert (=> b!625087 m!600177))

(declare-fun m!600181 () Bool)

(assert (=> b!625087 m!600181))

(check-sat (not b!625078) (not b!625079) (not b!625086) (not b!625084) (not start!56400) (not b!625082) (not b!625087) (not b!625080))
(check-sat)
