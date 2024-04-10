; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53508 () Bool)

(assert start!53508)

(declare-fun b!582408 () Bool)

(declare-fun res!370231 () Bool)

(declare-fun e!333978 () Bool)

(assert (=> b!582408 (=> (not res!370231) (not e!333978))))

(declare-datatypes ((array!36409 0))(
  ( (array!36410 (arr!17479 (Array (_ BitVec 32) (_ BitVec 64))) (size!17843 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36409)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582408 (= res!370231 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582409 () Bool)

(declare-fun e!333977 () Bool)

(assert (=> b!582409 (= e!333978 e!333977)))

(declare-fun res!370228 () Bool)

(assert (=> b!582409 (=> (not res!370228) (not e!333977))))

(declare-datatypes ((SeekEntryResult!5919 0))(
  ( (MissingZero!5919 (index!25903 (_ BitVec 32))) (Found!5919 (index!25904 (_ BitVec 32))) (Intermediate!5919 (undefined!6731 Bool) (index!25905 (_ BitVec 32)) (x!54756 (_ BitVec 32))) (Undefined!5919) (MissingVacant!5919 (index!25906 (_ BitVec 32))) )
))
(declare-fun lt!265108 () SeekEntryResult!5919)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582409 (= res!370228 (or (= lt!265108 (MissingZero!5919 i!1108)) (= lt!265108 (MissingVacant!5919 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36409 (_ BitVec 32)) SeekEntryResult!5919)

(assert (=> b!582409 (= lt!265108 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582410 () Bool)

(assert (=> b!582410 (= e!333977 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265107 () SeekEntryResult!5919)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36409 (_ BitVec 32)) SeekEntryResult!5919)

(assert (=> b!582410 (= lt!265107 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17479 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582411 () Bool)

(declare-fun res!370230 () Bool)

(assert (=> b!582411 (=> (not res!370230) (not e!333977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36409 (_ BitVec 32)) Bool)

(assert (=> b!582411 (= res!370230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582412 () Bool)

(declare-fun res!370225 () Bool)

(assert (=> b!582412 (=> (not res!370225) (not e!333977))))

(assert (=> b!582412 (= res!370225 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17479 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17479 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582414 () Bool)

(declare-fun res!370226 () Bool)

(assert (=> b!582414 (=> (not res!370226) (not e!333978))))

(assert (=> b!582414 (= res!370226 (and (= (size!17843 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17843 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17843 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582415 () Bool)

(declare-fun res!370227 () Bool)

(assert (=> b!582415 (=> (not res!370227) (not e!333978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582415 (= res!370227 (validKeyInArray!0 (select (arr!17479 a!2986) j!136)))))

(declare-fun b!582416 () Bool)

(declare-fun res!370224 () Bool)

(assert (=> b!582416 (=> (not res!370224) (not e!333978))))

(assert (=> b!582416 (= res!370224 (validKeyInArray!0 k0!1786))))

(declare-fun res!370232 () Bool)

(assert (=> start!53508 (=> (not res!370232) (not e!333978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53508 (= res!370232 (validMask!0 mask!3053))))

(assert (=> start!53508 e!333978))

(assert (=> start!53508 true))

(declare-fun array_inv!13275 (array!36409) Bool)

(assert (=> start!53508 (array_inv!13275 a!2986)))

(declare-fun b!582413 () Bool)

(declare-fun res!370229 () Bool)

(assert (=> b!582413 (=> (not res!370229) (not e!333977))))

(declare-datatypes ((List!11520 0))(
  ( (Nil!11517) (Cons!11516 (h!12561 (_ BitVec 64)) (t!17748 List!11520)) )
))
(declare-fun arrayNoDuplicates!0 (array!36409 (_ BitVec 32) List!11520) Bool)

(assert (=> b!582413 (= res!370229 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11517))))

(assert (= (and start!53508 res!370232) b!582414))

(assert (= (and b!582414 res!370226) b!582415))

(assert (= (and b!582415 res!370227) b!582416))

(assert (= (and b!582416 res!370224) b!582408))

(assert (= (and b!582408 res!370231) b!582409))

(assert (= (and b!582409 res!370228) b!582411))

(assert (= (and b!582411 res!370230) b!582413))

(assert (= (and b!582413 res!370229) b!582412))

(assert (= (and b!582412 res!370225) b!582410))

(declare-fun m!560913 () Bool)

(assert (=> b!582410 m!560913))

(assert (=> b!582410 m!560913))

(declare-fun m!560915 () Bool)

(assert (=> b!582410 m!560915))

(declare-fun m!560917 () Bool)

(assert (=> b!582408 m!560917))

(declare-fun m!560919 () Bool)

(assert (=> b!582416 m!560919))

(declare-fun m!560921 () Bool)

(assert (=> b!582409 m!560921))

(declare-fun m!560923 () Bool)

(assert (=> b!582413 m!560923))

(declare-fun m!560925 () Bool)

(assert (=> b!582412 m!560925))

(declare-fun m!560927 () Bool)

(assert (=> b!582412 m!560927))

(declare-fun m!560929 () Bool)

(assert (=> b!582412 m!560929))

(declare-fun m!560931 () Bool)

(assert (=> start!53508 m!560931))

(declare-fun m!560933 () Bool)

(assert (=> start!53508 m!560933))

(assert (=> b!582415 m!560913))

(assert (=> b!582415 m!560913))

(declare-fun m!560935 () Bool)

(assert (=> b!582415 m!560935))

(declare-fun m!560937 () Bool)

(assert (=> b!582411 m!560937))

(check-sat (not b!582413) (not b!582409) (not b!582411) (not b!582408) (not b!582416) (not b!582410) (not start!53508) (not b!582415))
