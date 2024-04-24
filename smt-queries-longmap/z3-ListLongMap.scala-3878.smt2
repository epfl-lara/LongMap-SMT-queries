; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53328 () Bool)

(assert start!53328)

(declare-fun b!579467 () Bool)

(declare-fun res!367185 () Bool)

(declare-fun e!333072 () Bool)

(assert (=> b!579467 (=> (not res!367185) (not e!333072))))

(declare-datatypes ((array!36174 0))(
  ( (array!36175 (arr!17359 (Array (_ BitVec 32) (_ BitVec 64))) (size!17723 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36174)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579467 (= res!367185 (validKeyInArray!0 (select (arr!17359 a!2986) j!136)))))

(declare-fun b!579468 () Bool)

(declare-fun res!367186 () Bool)

(assert (=> b!579468 (=> (not res!367186) (not e!333072))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579468 (= res!367186 (and (= (size!17723 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17723 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17723 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579469 () Bool)

(declare-fun res!367184 () Bool)

(assert (=> b!579469 (=> (not res!367184) (not e!333072))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579469 (= res!367184 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579470 () Bool)

(declare-fun res!367179 () Bool)

(declare-fun e!333071 () Bool)

(assert (=> b!579470 (=> (not res!367179) (not e!333071))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579470 (= res!367179 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17359 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17359 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579471 () Bool)

(declare-fun res!367183 () Bool)

(assert (=> b!579471 (=> (not res!367183) (not e!333071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36174 (_ BitVec 32)) Bool)

(assert (=> b!579471 (= res!367183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367180 () Bool)

(assert (=> start!53328 (=> (not res!367180) (not e!333072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53328 (= res!367180 (validMask!0 mask!3053))))

(assert (=> start!53328 e!333072))

(assert (=> start!53328 true))

(declare-fun array_inv!13218 (array!36174) Bool)

(assert (=> start!53328 (array_inv!13218 a!2986)))

(declare-fun b!579472 () Bool)

(declare-fun res!367178 () Bool)

(assert (=> b!579472 (=> (not res!367178) (not e!333072))))

(assert (=> b!579472 (= res!367178 (validKeyInArray!0 k0!1786))))

(declare-fun b!579473 () Bool)

(declare-fun res!367181 () Bool)

(assert (=> b!579473 (=> (not res!367181) (not e!333071))))

(declare-datatypes ((List!11307 0))(
  ( (Nil!11304) (Cons!11303 (h!12351 (_ BitVec 64)) (t!17527 List!11307)) )
))
(declare-fun arrayNoDuplicates!0 (array!36174 (_ BitVec 32) List!11307) Bool)

(assert (=> b!579473 (= res!367181 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11304))))

(declare-fun b!579474 () Bool)

(assert (=> b!579474 (= e!333072 e!333071)))

(declare-fun res!367182 () Bool)

(assert (=> b!579474 (=> (not res!367182) (not e!333071))))

(declare-datatypes ((SeekEntryResult!5755 0))(
  ( (MissingZero!5755 (index!25247 (_ BitVec 32))) (Found!5755 (index!25248 (_ BitVec 32))) (Intermediate!5755 (undefined!6567 Bool) (index!25249 (_ BitVec 32)) (x!54291 (_ BitVec 32))) (Undefined!5755) (MissingVacant!5755 (index!25250 (_ BitVec 32))) )
))
(declare-fun lt!264556 () SeekEntryResult!5755)

(assert (=> b!579474 (= res!367182 (or (= lt!264556 (MissingZero!5755 i!1108)) (= lt!264556 (MissingVacant!5755 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36174 (_ BitVec 32)) SeekEntryResult!5755)

(assert (=> b!579474 (= lt!264556 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579475 () Bool)

(assert (=> b!579475 (= e!333071 false)))

(declare-fun lt!264555 () SeekEntryResult!5755)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36174 (_ BitVec 32)) SeekEntryResult!5755)

(assert (=> b!579475 (= lt!264555 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17359 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53328 res!367180) b!579468))

(assert (= (and b!579468 res!367186) b!579467))

(assert (= (and b!579467 res!367185) b!579472))

(assert (= (and b!579472 res!367178) b!579469))

(assert (= (and b!579469 res!367184) b!579474))

(assert (= (and b!579474 res!367182) b!579471))

(assert (= (and b!579471 res!367183) b!579473))

(assert (= (and b!579473 res!367181) b!579470))

(assert (= (and b!579470 res!367179) b!579475))

(declare-fun m!558245 () Bool)

(assert (=> b!579469 m!558245))

(declare-fun m!558247 () Bool)

(assert (=> start!53328 m!558247))

(declare-fun m!558249 () Bool)

(assert (=> start!53328 m!558249))

(declare-fun m!558251 () Bool)

(assert (=> b!579473 m!558251))

(declare-fun m!558253 () Bool)

(assert (=> b!579471 m!558253))

(declare-fun m!558255 () Bool)

(assert (=> b!579475 m!558255))

(assert (=> b!579475 m!558255))

(declare-fun m!558257 () Bool)

(assert (=> b!579475 m!558257))

(declare-fun m!558259 () Bool)

(assert (=> b!579474 m!558259))

(assert (=> b!579467 m!558255))

(assert (=> b!579467 m!558255))

(declare-fun m!558261 () Bool)

(assert (=> b!579467 m!558261))

(declare-fun m!558263 () Bool)

(assert (=> b!579470 m!558263))

(declare-fun m!558265 () Bool)

(assert (=> b!579470 m!558265))

(declare-fun m!558267 () Bool)

(assert (=> b!579470 m!558267))

(declare-fun m!558269 () Bool)

(assert (=> b!579472 m!558269))

(check-sat (not b!579473) (not b!579474) (not b!579472) (not b!579475) (not start!53328) (not b!579467) (not b!579469) (not b!579471))
(check-sat)
