; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56624 () Bool)

(assert start!56624)

(declare-fun b!627408 () Bool)

(declare-fun res!405254 () Bool)

(declare-fun e!359147 () Bool)

(assert (=> b!627408 (=> (not res!405254) (not e!359147))))

(declare-datatypes ((array!37928 0))(
  ( (array!37929 (arr!18204 (Array (_ BitVec 32) (_ BitVec 64))) (size!18569 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37928)

(declare-datatypes ((List!12284 0))(
  ( (Nil!12281) (Cons!12280 (h!13325 (_ BitVec 64)) (t!18503 List!12284)) )
))
(declare-fun arrayNoDuplicates!0 (array!37928 (_ BitVec 32) List!12284) Bool)

(assert (=> b!627408 (= res!405254 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12281))))

(declare-fun b!627409 () Bool)

(declare-fun res!405258 () Bool)

(assert (=> b!627409 (=> (not res!405258) (not e!359147))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6641 0))(
  ( (MissingZero!6641 (index!28848 (_ BitVec 32))) (Found!6641 (index!28849 (_ BitVec 32))) (Intermediate!6641 (undefined!7453 Bool) (index!28850 (_ BitVec 32)) (x!57592 (_ BitVec 32))) (Undefined!6641) (MissingVacant!6641 (index!28851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37928 (_ BitVec 32)) SeekEntryResult!6641)

(assert (=> b!627409 (= res!405258 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18204 a!2986) j!136) a!2986 mask!3053) (Found!6641 j!136)))))

(declare-fun b!627410 () Bool)

(declare-fun res!405252 () Bool)

(assert (=> b!627410 (=> (not res!405252) (not e!359147))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!627410 (= res!405252 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18204 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18204 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!405251 () Bool)

(declare-fun e!359146 () Bool)

(assert (=> start!56624 (=> (not res!405251) (not e!359146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56624 (= res!405251 (validMask!0 mask!3053))))

(assert (=> start!56624 e!359146))

(assert (=> start!56624 true))

(declare-fun array_inv!14087 (array!37928) Bool)

(assert (=> start!56624 (array_inv!14087 a!2986)))

(declare-fun b!627411 () Bool)

(declare-fun res!405250 () Bool)

(assert (=> b!627411 (=> (not res!405250) (not e!359147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37928 (_ BitVec 32)) Bool)

(assert (=> b!627411 (= res!405250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627412 () Bool)

(declare-fun res!405260 () Bool)

(assert (=> b!627412 (=> (not res!405260) (not e!359146))))

(assert (=> b!627412 (= res!405260 (and (= (size!18569 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18569 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18569 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627413 () Bool)

(declare-fun res!405256 () Bool)

(assert (=> b!627413 (=> (not res!405256) (not e!359147))))

(assert (=> b!627413 (= res!405256 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18204 a!2986) index!984) (select (arr!18204 a!2986) j!136))) (not (= (select (arr!18204 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627414 () Bool)

(declare-fun res!405259 () Bool)

(assert (=> b!627414 (=> (not res!405259) (not e!359146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627414 (= res!405259 (validKeyInArray!0 (select (arr!18204 a!2986) j!136)))))

(declare-fun b!627415 () Bool)

(declare-fun res!405253 () Bool)

(assert (=> b!627415 (=> (not res!405253) (not e!359146))))

(assert (=> b!627415 (= res!405253 (validKeyInArray!0 k!1786))))

(declare-fun b!627416 () Bool)

(declare-fun res!405257 () Bool)

(assert (=> b!627416 (=> (not res!405257) (not e!359146))))

(declare-fun arrayContainsKey!0 (array!37928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627416 (= res!405257 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627417 () Bool)

(assert (=> b!627417 (= e!359146 e!359147)))

(declare-fun res!405255 () Bool)

(assert (=> b!627417 (=> (not res!405255) (not e!359147))))

(declare-fun lt!290089 () SeekEntryResult!6641)

(assert (=> b!627417 (= res!405255 (or (= lt!290089 (MissingZero!6641 i!1108)) (= lt!290089 (MissingVacant!6641 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37928 (_ BitVec 32)) SeekEntryResult!6641)

(assert (=> b!627417 (= lt!290089 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627418 () Bool)

(assert (=> b!627418 (= e!359147 false)))

(declare-fun lt!290088 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627418 (= lt!290088 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56624 res!405251) b!627412))

(assert (= (and b!627412 res!405260) b!627414))

(assert (= (and b!627414 res!405259) b!627415))

(assert (= (and b!627415 res!405253) b!627416))

(assert (= (and b!627416 res!405257) b!627417))

(assert (= (and b!627417 res!405255) b!627411))

(assert (= (and b!627411 res!405250) b!627408))

(assert (= (and b!627408 res!405254) b!627410))

(assert (= (and b!627410 res!405252) b!627409))

(assert (= (and b!627409 res!405258) b!627413))

(assert (= (and b!627413 res!405256) b!627418))

(declare-fun m!602203 () Bool)

(assert (=> start!56624 m!602203))

(declare-fun m!602205 () Bool)

(assert (=> start!56624 m!602205))

(declare-fun m!602207 () Bool)

(assert (=> b!627414 m!602207))

(assert (=> b!627414 m!602207))

(declare-fun m!602209 () Bool)

(assert (=> b!627414 m!602209))

(declare-fun m!602211 () Bool)

(assert (=> b!627416 m!602211))

(declare-fun m!602213 () Bool)

(assert (=> b!627415 m!602213))

(assert (=> b!627409 m!602207))

(assert (=> b!627409 m!602207))

(declare-fun m!602215 () Bool)

(assert (=> b!627409 m!602215))

(declare-fun m!602217 () Bool)

(assert (=> b!627408 m!602217))

(declare-fun m!602219 () Bool)

(assert (=> b!627417 m!602219))

(declare-fun m!602221 () Bool)

(assert (=> b!627410 m!602221))

(declare-fun m!602223 () Bool)

(assert (=> b!627410 m!602223))

(declare-fun m!602225 () Bool)

(assert (=> b!627410 m!602225))

(declare-fun m!602227 () Bool)

(assert (=> b!627411 m!602227))

(declare-fun m!602229 () Bool)

(assert (=> b!627418 m!602229))

(declare-fun m!602231 () Bool)

(assert (=> b!627413 m!602231))

(assert (=> b!627413 m!602207))

(push 1)

(assert (not b!627409))

(assert (not b!627417))

(assert (not b!627415))

(assert (not b!627414))

(assert (not start!56624))

(assert (not b!627408))

(assert (not b!627418))

(assert (not b!627411))

(assert (not b!627416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

