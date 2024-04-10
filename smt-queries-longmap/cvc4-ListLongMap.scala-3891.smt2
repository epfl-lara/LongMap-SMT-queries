; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53360 () Bool)

(assert start!53360)

(declare-fun res!368194 () Bool)

(declare-fun e!333310 () Bool)

(assert (=> start!53360 (=> (not res!368194) (not e!333310))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53360 (= res!368194 (validMask!0 mask!3053))))

(assert (=> start!53360 e!333310))

(assert (=> start!53360 true))

(declare-datatypes ((array!36261 0))(
  ( (array!36262 (arr!17405 (Array (_ BitVec 32) (_ BitVec 64))) (size!17769 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36261)

(declare-fun array_inv!13201 (array!36261) Bool)

(assert (=> start!53360 (array_inv!13201 a!2986)))

(declare-fun b!580374 () Bool)

(declare-fun res!368190 () Bool)

(assert (=> b!580374 (=> (not res!368190) (not e!333310))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580374 (= res!368190 (and (= (size!17769 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17769 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17769 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580375 () Bool)

(declare-fun e!333311 () Bool)

(assert (=> b!580375 (= e!333311 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5845 0))(
  ( (MissingZero!5845 (index!25607 (_ BitVec 32))) (Found!5845 (index!25608 (_ BitVec 32))) (Intermediate!5845 (undefined!6657 Bool) (index!25609 (_ BitVec 32)) (x!54482 (_ BitVec 32))) (Undefined!5845) (MissingVacant!5845 (index!25610 (_ BitVec 32))) )
))
(declare-fun lt!264690 () SeekEntryResult!5845)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36261 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!580375 (= lt!264690 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17405 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580376 () Bool)

(declare-fun res!368198 () Bool)

(assert (=> b!580376 (=> (not res!368198) (not e!333310))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580376 (= res!368198 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580377 () Bool)

(assert (=> b!580377 (= e!333310 e!333311)))

(declare-fun res!368195 () Bool)

(assert (=> b!580377 (=> (not res!368195) (not e!333311))))

(declare-fun lt!264691 () SeekEntryResult!5845)

(assert (=> b!580377 (= res!368195 (or (= lt!264691 (MissingZero!5845 i!1108)) (= lt!264691 (MissingVacant!5845 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36261 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!580377 (= lt!264691 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580378 () Bool)

(declare-fun res!368191 () Bool)

(assert (=> b!580378 (=> (not res!368191) (not e!333311))))

(assert (=> b!580378 (= res!368191 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17405 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17405 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580379 () Bool)

(declare-fun res!368196 () Bool)

(assert (=> b!580379 (=> (not res!368196) (not e!333311))))

(declare-datatypes ((List!11446 0))(
  ( (Nil!11443) (Cons!11442 (h!12487 (_ BitVec 64)) (t!17674 List!11446)) )
))
(declare-fun arrayNoDuplicates!0 (array!36261 (_ BitVec 32) List!11446) Bool)

(assert (=> b!580379 (= res!368196 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11443))))

(declare-fun b!580380 () Bool)

(declare-fun res!368197 () Bool)

(assert (=> b!580380 (=> (not res!368197) (not e!333311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36261 (_ BitVec 32)) Bool)

(assert (=> b!580380 (= res!368197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580381 () Bool)

(declare-fun res!368193 () Bool)

(assert (=> b!580381 (=> (not res!368193) (not e!333310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580381 (= res!368193 (validKeyInArray!0 (select (arr!17405 a!2986) j!136)))))

(declare-fun b!580382 () Bool)

(declare-fun res!368192 () Bool)

(assert (=> b!580382 (=> (not res!368192) (not e!333310))))

(assert (=> b!580382 (= res!368192 (validKeyInArray!0 k!1786))))

(assert (= (and start!53360 res!368194) b!580374))

(assert (= (and b!580374 res!368190) b!580381))

(assert (= (and b!580381 res!368193) b!580382))

(assert (= (and b!580382 res!368192) b!580376))

(assert (= (and b!580376 res!368198) b!580377))

(assert (= (and b!580377 res!368195) b!580380))

(assert (= (and b!580380 res!368197) b!580379))

(assert (= (and b!580379 res!368196) b!580378))

(assert (= (and b!580378 res!368191) b!580375))

(declare-fun m!558959 () Bool)

(assert (=> b!580377 m!558959))

(declare-fun m!558961 () Bool)

(assert (=> b!580379 m!558961))

(declare-fun m!558963 () Bool)

(assert (=> b!580375 m!558963))

(assert (=> b!580375 m!558963))

(declare-fun m!558965 () Bool)

(assert (=> b!580375 m!558965))

(declare-fun m!558967 () Bool)

(assert (=> b!580376 m!558967))

(assert (=> b!580381 m!558963))

(assert (=> b!580381 m!558963))

(declare-fun m!558969 () Bool)

(assert (=> b!580381 m!558969))

(declare-fun m!558971 () Bool)

(assert (=> b!580382 m!558971))

(declare-fun m!558973 () Bool)

(assert (=> start!53360 m!558973))

(declare-fun m!558975 () Bool)

(assert (=> start!53360 m!558975))

(declare-fun m!558977 () Bool)

(assert (=> b!580380 m!558977))

(declare-fun m!558979 () Bool)

(assert (=> b!580378 m!558979))

(declare-fun m!558981 () Bool)

(assert (=> b!580378 m!558981))

(declare-fun m!558983 () Bool)

(assert (=> b!580378 m!558983))

(push 1)

(assert (not b!580375))

(assert (not start!53360))

(assert (not b!580382))

(assert (not b!580379))

(assert (not b!580376))

(assert (not b!580380))

(assert (not b!580381))

(assert (not b!580377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

