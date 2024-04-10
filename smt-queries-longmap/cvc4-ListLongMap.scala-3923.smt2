; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53552 () Bool)

(assert start!53552)

(declare-fun b!583002 () Bool)

(declare-fun res!370823 () Bool)

(declare-fun e!334174 () Bool)

(assert (=> b!583002 (=> (not res!370823) (not e!334174))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583002 (= res!370823 (validKeyInArray!0 k!1786))))

(declare-fun res!370826 () Bool)

(assert (=> start!53552 (=> (not res!370826) (not e!334174))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53552 (= res!370826 (validMask!0 mask!3053))))

(assert (=> start!53552 e!334174))

(assert (=> start!53552 true))

(declare-datatypes ((array!36453 0))(
  ( (array!36454 (arr!17501 (Array (_ BitVec 32) (_ BitVec 64))) (size!17865 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36453)

(declare-fun array_inv!13297 (array!36453) Bool)

(assert (=> start!53552 (array_inv!13297 a!2986)))

(declare-fun b!583003 () Bool)

(declare-fun res!370819 () Bool)

(declare-fun e!334176 () Bool)

(assert (=> b!583003 (=> (not res!370819) (not e!334176))))

(declare-datatypes ((List!11542 0))(
  ( (Nil!11539) (Cons!11538 (h!12583 (_ BitVec 64)) (t!17770 List!11542)) )
))
(declare-fun arrayNoDuplicates!0 (array!36453 (_ BitVec 32) List!11542) Bool)

(assert (=> b!583003 (= res!370819 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11539))))

(declare-fun b!583004 () Bool)

(declare-fun res!370818 () Bool)

(assert (=> b!583004 (=> (not res!370818) (not e!334176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36453 (_ BitVec 32)) Bool)

(assert (=> b!583004 (= res!370818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583005 () Bool)

(assert (=> b!583005 (= e!334176 false)))

(declare-datatypes ((SeekEntryResult!5941 0))(
  ( (MissingZero!5941 (index!25991 (_ BitVec 32))) (Found!5941 (index!25992 (_ BitVec 32))) (Intermediate!5941 (undefined!6753 Bool) (index!25993 (_ BitVec 32)) (x!54834 (_ BitVec 32))) (Undefined!5941) (MissingVacant!5941 (index!25994 (_ BitVec 32))) )
))
(declare-fun lt!265239 () SeekEntryResult!5941)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36453 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!583005 (= lt!265239 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17501 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583006 () Bool)

(declare-fun res!370821 () Bool)

(assert (=> b!583006 (=> (not res!370821) (not e!334174))))

(assert (=> b!583006 (= res!370821 (validKeyInArray!0 (select (arr!17501 a!2986) j!136)))))

(declare-fun b!583007 () Bool)

(declare-fun res!370822 () Bool)

(assert (=> b!583007 (=> (not res!370822) (not e!334176))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583007 (= res!370822 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17501 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17501 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583008 () Bool)

(assert (=> b!583008 (= e!334174 e!334176)))

(declare-fun res!370824 () Bool)

(assert (=> b!583008 (=> (not res!370824) (not e!334176))))

(declare-fun lt!265240 () SeekEntryResult!5941)

(assert (=> b!583008 (= res!370824 (or (= lt!265240 (MissingZero!5941 i!1108)) (= lt!265240 (MissingVacant!5941 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36453 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!583008 (= lt!265240 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583009 () Bool)

(declare-fun res!370820 () Bool)

(assert (=> b!583009 (=> (not res!370820) (not e!334174))))

(declare-fun arrayContainsKey!0 (array!36453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583009 (= res!370820 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583010 () Bool)

(declare-fun res!370825 () Bool)

(assert (=> b!583010 (=> (not res!370825) (not e!334174))))

(assert (=> b!583010 (= res!370825 (and (= (size!17865 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17865 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17865 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53552 res!370826) b!583010))

(assert (= (and b!583010 res!370825) b!583006))

(assert (= (and b!583006 res!370821) b!583002))

(assert (= (and b!583002 res!370823) b!583009))

(assert (= (and b!583009 res!370820) b!583008))

(assert (= (and b!583008 res!370824) b!583004))

(assert (= (and b!583004 res!370818) b!583003))

(assert (= (and b!583003 res!370819) b!583007))

(assert (= (and b!583007 res!370822) b!583005))

(declare-fun m!561485 () Bool)

(assert (=> b!583006 m!561485))

(assert (=> b!583006 m!561485))

(declare-fun m!561487 () Bool)

(assert (=> b!583006 m!561487))

(declare-fun m!561489 () Bool)

(assert (=> b!583008 m!561489))

(declare-fun m!561491 () Bool)

(assert (=> b!583009 m!561491))

(declare-fun m!561493 () Bool)

(assert (=> b!583003 m!561493))

(declare-fun m!561495 () Bool)

(assert (=> b!583004 m!561495))

(declare-fun m!561497 () Bool)

(assert (=> b!583007 m!561497))

(declare-fun m!561499 () Bool)

(assert (=> b!583007 m!561499))

(declare-fun m!561501 () Bool)

(assert (=> b!583007 m!561501))

(declare-fun m!561503 () Bool)

(assert (=> start!53552 m!561503))

(declare-fun m!561505 () Bool)

(assert (=> start!53552 m!561505))

(assert (=> b!583005 m!561485))

(assert (=> b!583005 m!561485))

(declare-fun m!561507 () Bool)

(assert (=> b!583005 m!561507))

(declare-fun m!561509 () Bool)

(assert (=> b!583002 m!561509))

(push 1)

(assert (not start!53552))

(assert (not b!583004))

(assert (not b!583009))

(assert (not b!583002))

(assert (not b!583008))

(assert (not b!583003))

(assert (not b!583006))

(assert (not b!583005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

