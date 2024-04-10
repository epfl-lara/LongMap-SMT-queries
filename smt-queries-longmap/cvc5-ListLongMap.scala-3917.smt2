; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53512 () Bool)

(assert start!53512)

(declare-fun res!370284 () Bool)

(declare-fun e!333996 () Bool)

(assert (=> start!53512 (=> (not res!370284) (not e!333996))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53512 (= res!370284 (validMask!0 mask!3053))))

(assert (=> start!53512 e!333996))

(assert (=> start!53512 true))

(declare-datatypes ((array!36413 0))(
  ( (array!36414 (arr!17481 (Array (_ BitVec 32) (_ BitVec 64))) (size!17845 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36413)

(declare-fun array_inv!13277 (array!36413) Bool)

(assert (=> start!53512 (array_inv!13277 a!2986)))

(declare-fun b!582462 () Bool)

(declare-fun res!370286 () Bool)

(assert (=> b!582462 (=> (not res!370286) (not e!333996))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582462 (= res!370286 (and (= (size!17845 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17845 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17845 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582463 () Bool)

(declare-fun res!370283 () Bool)

(assert (=> b!582463 (=> (not res!370283) (not e!333996))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582463 (= res!370283 (validKeyInArray!0 k!1786))))

(declare-fun b!582464 () Bool)

(declare-fun res!370279 () Bool)

(declare-fun e!333995 () Bool)

(assert (=> b!582464 (=> (not res!370279) (not e!333995))))

(declare-datatypes ((List!11522 0))(
  ( (Nil!11519) (Cons!11518 (h!12563 (_ BitVec 64)) (t!17750 List!11522)) )
))
(declare-fun arrayNoDuplicates!0 (array!36413 (_ BitVec 32) List!11522) Bool)

(assert (=> b!582464 (= res!370279 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11519))))

(declare-fun b!582465 () Bool)

(declare-fun res!370281 () Bool)

(assert (=> b!582465 (=> (not res!370281) (not e!333996))))

(declare-fun arrayContainsKey!0 (array!36413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582465 (= res!370281 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582466 () Bool)

(assert (=> b!582466 (= e!333996 e!333995)))

(declare-fun res!370282 () Bool)

(assert (=> b!582466 (=> (not res!370282) (not e!333995))))

(declare-datatypes ((SeekEntryResult!5921 0))(
  ( (MissingZero!5921 (index!25911 (_ BitVec 32))) (Found!5921 (index!25912 (_ BitVec 32))) (Intermediate!5921 (undefined!6733 Bool) (index!25913 (_ BitVec 32)) (x!54766 (_ BitVec 32))) (Undefined!5921) (MissingVacant!5921 (index!25914 (_ BitVec 32))) )
))
(declare-fun lt!265119 () SeekEntryResult!5921)

(assert (=> b!582466 (= res!370282 (or (= lt!265119 (MissingZero!5921 i!1108)) (= lt!265119 (MissingVacant!5921 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36413 (_ BitVec 32)) SeekEntryResult!5921)

(assert (=> b!582466 (= lt!265119 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582467 () Bool)

(declare-fun res!370278 () Bool)

(assert (=> b!582467 (=> (not res!370278) (not e!333995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36413 (_ BitVec 32)) Bool)

(assert (=> b!582467 (= res!370278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582468 () Bool)

(declare-fun res!370280 () Bool)

(assert (=> b!582468 (=> (not res!370280) (not e!333996))))

(assert (=> b!582468 (= res!370280 (validKeyInArray!0 (select (arr!17481 a!2986) j!136)))))

(declare-fun b!582469 () Bool)

(assert (=> b!582469 (= e!333995 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265120 () SeekEntryResult!5921)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36413 (_ BitVec 32)) SeekEntryResult!5921)

(assert (=> b!582469 (= lt!265120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582470 () Bool)

(declare-fun res!370285 () Bool)

(assert (=> b!582470 (=> (not res!370285) (not e!333995))))

(assert (=> b!582470 (= res!370285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17481 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17481 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53512 res!370284) b!582462))

(assert (= (and b!582462 res!370286) b!582468))

(assert (= (and b!582468 res!370280) b!582463))

(assert (= (and b!582463 res!370283) b!582465))

(assert (= (and b!582465 res!370281) b!582466))

(assert (= (and b!582466 res!370282) b!582467))

(assert (= (and b!582467 res!370278) b!582464))

(assert (= (and b!582464 res!370279) b!582470))

(assert (= (and b!582470 res!370285) b!582469))

(declare-fun m!560965 () Bool)

(assert (=> b!582467 m!560965))

(declare-fun m!560967 () Bool)

(assert (=> b!582466 m!560967))

(declare-fun m!560969 () Bool)

(assert (=> b!582470 m!560969))

(declare-fun m!560971 () Bool)

(assert (=> b!582470 m!560971))

(declare-fun m!560973 () Bool)

(assert (=> b!582470 m!560973))

(declare-fun m!560975 () Bool)

(assert (=> b!582463 m!560975))

(declare-fun m!560977 () Bool)

(assert (=> b!582465 m!560977))

(declare-fun m!560979 () Bool)

(assert (=> b!582468 m!560979))

(assert (=> b!582468 m!560979))

(declare-fun m!560981 () Bool)

(assert (=> b!582468 m!560981))

(declare-fun m!560983 () Bool)

(assert (=> start!53512 m!560983))

(declare-fun m!560985 () Bool)

(assert (=> start!53512 m!560985))

(declare-fun m!560987 () Bool)

(assert (=> b!582464 m!560987))

(assert (=> b!582469 m!560979))

(assert (=> b!582469 m!560979))

(declare-fun m!560989 () Bool)

(assert (=> b!582469 m!560989))

(push 1)

(assert (not b!582469))

(assert (not b!582468))

(assert (not start!53512))

(assert (not b!582466))

(assert (not b!582464))

(assert (not b!582465))

(assert (not b!582463))

(assert (not b!582467))

(check-sat)

