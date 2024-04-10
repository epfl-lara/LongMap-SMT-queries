; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53432 () Bool)

(assert start!53432)

(declare-fun b!581363 () Bool)

(declare-fun res!369182 () Bool)

(declare-fun e!333634 () Bool)

(assert (=> b!581363 (=> (not res!369182) (not e!333634))))

(declare-datatypes ((array!36333 0))(
  ( (array!36334 (arr!17441 (Array (_ BitVec 32) (_ BitVec 64))) (size!17805 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36333)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581363 (= res!369182 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581364 () Bool)

(declare-fun res!369186 () Bool)

(declare-fun e!333635 () Bool)

(assert (=> b!581364 (=> (not res!369186) (not e!333635))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581364 (= res!369186 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17441 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17441 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581365 () Bool)

(declare-fun res!369180 () Bool)

(assert (=> b!581365 (=> (not res!369180) (not e!333634))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581365 (= res!369180 (validKeyInArray!0 (select (arr!17441 a!2986) j!136)))))

(declare-fun b!581366 () Bool)

(assert (=> b!581366 (= e!333635 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17441 a!2986) index!984) (select (arr!17441 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun res!369183 () Bool)

(assert (=> start!53432 (=> (not res!369183) (not e!333634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53432 (= res!369183 (validMask!0 mask!3053))))

(assert (=> start!53432 e!333634))

(assert (=> start!53432 true))

(declare-fun array_inv!13237 (array!36333) Bool)

(assert (=> start!53432 (array_inv!13237 a!2986)))

(declare-fun b!581367 () Bool)

(declare-fun res!369185 () Bool)

(assert (=> b!581367 (=> (not res!369185) (not e!333635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36333 (_ BitVec 32)) Bool)

(assert (=> b!581367 (= res!369185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581368 () Bool)

(declare-fun res!369181 () Bool)

(assert (=> b!581368 (=> (not res!369181) (not e!333635))))

(declare-datatypes ((List!11482 0))(
  ( (Nil!11479) (Cons!11478 (h!12523 (_ BitVec 64)) (t!17710 List!11482)) )
))
(declare-fun arrayNoDuplicates!0 (array!36333 (_ BitVec 32) List!11482) Bool)

(assert (=> b!581368 (= res!369181 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11479))))

(declare-fun b!581369 () Bool)

(assert (=> b!581369 (= e!333634 e!333635)))

(declare-fun res!369188 () Bool)

(assert (=> b!581369 (=> (not res!369188) (not e!333635))))

(declare-datatypes ((SeekEntryResult!5881 0))(
  ( (MissingZero!5881 (index!25751 (_ BitVec 32))) (Found!5881 (index!25752 (_ BitVec 32))) (Intermediate!5881 (undefined!6693 Bool) (index!25753 (_ BitVec 32)) (x!54614 (_ BitVec 32))) (Undefined!5881) (MissingVacant!5881 (index!25754 (_ BitVec 32))) )
))
(declare-fun lt!264889 () SeekEntryResult!5881)

(assert (=> b!581369 (= res!369188 (or (= lt!264889 (MissingZero!5881 i!1108)) (= lt!264889 (MissingVacant!5881 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36333 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!581369 (= lt!264889 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581370 () Bool)

(declare-fun res!369187 () Bool)

(assert (=> b!581370 (=> (not res!369187) (not e!333634))))

(assert (=> b!581370 (= res!369187 (validKeyInArray!0 k!1786))))

(declare-fun b!581371 () Bool)

(declare-fun res!369179 () Bool)

(assert (=> b!581371 (=> (not res!369179) (not e!333635))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36333 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!581371 (= res!369179 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17441 a!2986) j!136) a!2986 mask!3053) (Found!5881 j!136)))))

(declare-fun b!581372 () Bool)

(declare-fun res!369184 () Bool)

(assert (=> b!581372 (=> (not res!369184) (not e!333634))))

(assert (=> b!581372 (= res!369184 (and (= (size!17805 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17805 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17805 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53432 res!369183) b!581372))

(assert (= (and b!581372 res!369184) b!581365))

(assert (= (and b!581365 res!369180) b!581370))

(assert (= (and b!581370 res!369187) b!581363))

(assert (= (and b!581363 res!369182) b!581369))

(assert (= (and b!581369 res!369188) b!581367))

(assert (= (and b!581367 res!369185) b!581368))

(assert (= (and b!581368 res!369181) b!581364))

(assert (= (and b!581364 res!369186) b!581371))

(assert (= (and b!581371 res!369179) b!581366))

(declare-fun m!559905 () Bool)

(assert (=> b!581364 m!559905))

(declare-fun m!559907 () Bool)

(assert (=> b!581364 m!559907))

(declare-fun m!559909 () Bool)

(assert (=> b!581364 m!559909))

(declare-fun m!559911 () Bool)

(assert (=> b!581367 m!559911))

(declare-fun m!559913 () Bool)

(assert (=> b!581365 m!559913))

(assert (=> b!581365 m!559913))

(declare-fun m!559915 () Bool)

(assert (=> b!581365 m!559915))

(declare-fun m!559917 () Bool)

(assert (=> b!581363 m!559917))

(declare-fun m!559919 () Bool)

(assert (=> b!581366 m!559919))

(assert (=> b!581366 m!559913))

(assert (=> b!581371 m!559913))

(assert (=> b!581371 m!559913))

(declare-fun m!559921 () Bool)

(assert (=> b!581371 m!559921))

(declare-fun m!559923 () Bool)

(assert (=> b!581368 m!559923))

(declare-fun m!559925 () Bool)

(assert (=> start!53432 m!559925))

(declare-fun m!559927 () Bool)

(assert (=> start!53432 m!559927))

(declare-fun m!559929 () Bool)

(assert (=> b!581369 m!559929))

(declare-fun m!559931 () Bool)

(assert (=> b!581370 m!559931))

(push 1)

(assert (not start!53432))

(assert (not b!581367))

(assert (not b!581369))

(assert (not b!581363))

