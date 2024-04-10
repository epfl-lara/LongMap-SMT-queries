; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53434 () Bool)

(assert start!53434)

(declare-fun b!581391 () Bool)

(declare-fun e!333644 () Bool)

(assert (=> b!581391 (= e!333644 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5882 0))(
  ( (MissingZero!5882 (index!25755 (_ BitVec 32))) (Found!5882 (index!25756 (_ BitVec 32))) (Intermediate!5882 (undefined!6694 Bool) (index!25757 (_ BitVec 32)) (x!54623 (_ BitVec 32))) (Undefined!5882) (MissingVacant!5882 (index!25758 (_ BitVec 32))) )
))
(declare-fun lt!264894 () SeekEntryResult!5882)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36335 0))(
  ( (array!36336 (arr!17442 (Array (_ BitVec 32) (_ BitVec 64))) (size!17806 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36335)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36335 (_ BitVec 32)) SeekEntryResult!5882)

(assert (=> b!581391 (= lt!264894 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17442 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581393 () Bool)

(declare-fun e!333643 () Bool)

(assert (=> b!581393 (= e!333643 e!333644)))

(declare-fun res!369208 () Bool)

(assert (=> b!581393 (=> (not res!369208) (not e!333644))))

(declare-fun lt!264895 () SeekEntryResult!5882)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581393 (= res!369208 (or (= lt!264895 (MissingZero!5882 i!1108)) (= lt!264895 (MissingVacant!5882 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36335 (_ BitVec 32)) SeekEntryResult!5882)

(assert (=> b!581393 (= lt!264895 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581394 () Bool)

(declare-fun res!369211 () Bool)

(assert (=> b!581394 (=> (not res!369211) (not e!333644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36335 (_ BitVec 32)) Bool)

(assert (=> b!581394 (= res!369211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581395 () Bool)

(declare-fun res!369207 () Bool)

(assert (=> b!581395 (=> (not res!369207) (not e!333643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581395 (= res!369207 (validKeyInArray!0 k!1786))))

(declare-fun res!369209 () Bool)

(assert (=> start!53434 (=> (not res!369209) (not e!333643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53434 (= res!369209 (validMask!0 mask!3053))))

(assert (=> start!53434 e!333643))

(assert (=> start!53434 true))

(declare-fun array_inv!13238 (array!36335) Bool)

(assert (=> start!53434 (array_inv!13238 a!2986)))

(declare-fun b!581392 () Bool)

(declare-fun res!369210 () Bool)

(assert (=> b!581392 (=> (not res!369210) (not e!333644))))

(assert (=> b!581392 (= res!369210 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17442 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17442 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581396 () Bool)

(declare-fun res!369213 () Bool)

(assert (=> b!581396 (=> (not res!369213) (not e!333643))))

(assert (=> b!581396 (= res!369213 (validKeyInArray!0 (select (arr!17442 a!2986) j!136)))))

(declare-fun b!581397 () Bool)

(declare-fun res!369214 () Bool)

(assert (=> b!581397 (=> (not res!369214) (not e!333644))))

(declare-datatypes ((List!11483 0))(
  ( (Nil!11480) (Cons!11479 (h!12524 (_ BitVec 64)) (t!17711 List!11483)) )
))
(declare-fun arrayNoDuplicates!0 (array!36335 (_ BitVec 32) List!11483) Bool)

(assert (=> b!581397 (= res!369214 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11480))))

(declare-fun b!581398 () Bool)

(declare-fun res!369212 () Bool)

(assert (=> b!581398 (=> (not res!369212) (not e!333643))))

(declare-fun arrayContainsKey!0 (array!36335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581398 (= res!369212 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581399 () Bool)

(declare-fun res!369215 () Bool)

(assert (=> b!581399 (=> (not res!369215) (not e!333643))))

(assert (=> b!581399 (= res!369215 (and (= (size!17806 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17806 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17806 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53434 res!369209) b!581399))

(assert (= (and b!581399 res!369215) b!581396))

(assert (= (and b!581396 res!369213) b!581395))

(assert (= (and b!581395 res!369207) b!581398))

(assert (= (and b!581398 res!369212) b!581393))

(assert (= (and b!581393 res!369208) b!581394))

(assert (= (and b!581394 res!369211) b!581397))

(assert (= (and b!581397 res!369214) b!581392))

(assert (= (and b!581392 res!369210) b!581391))

(declare-fun m!559933 () Bool)

(assert (=> b!581391 m!559933))

(assert (=> b!581391 m!559933))

(declare-fun m!559935 () Bool)

(assert (=> b!581391 m!559935))

(assert (=> b!581396 m!559933))

(assert (=> b!581396 m!559933))

(declare-fun m!559937 () Bool)

(assert (=> b!581396 m!559937))

(declare-fun m!559939 () Bool)

(assert (=> b!581393 m!559939))

(declare-fun m!559941 () Bool)

(assert (=> b!581395 m!559941))

(declare-fun m!559943 () Bool)

(assert (=> b!581394 m!559943))

(declare-fun m!559945 () Bool)

(assert (=> b!581398 m!559945))

(declare-fun m!559947 () Bool)

(assert (=> b!581397 m!559947))

(declare-fun m!559949 () Bool)

(assert (=> start!53434 m!559949))

(declare-fun m!559951 () Bool)

(assert (=> start!53434 m!559951))

(declare-fun m!559953 () Bool)

(assert (=> b!581392 m!559953))

(declare-fun m!559955 () Bool)

(assert (=> b!581392 m!559955))

(declare-fun m!559957 () Bool)

(assert (=> b!581392 m!559957))

(push 1)

