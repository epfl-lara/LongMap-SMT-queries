; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53050 () Bool)

(assert start!53050)

(declare-fun b!577377 () Bool)

(declare-fun res!365308 () Bool)

(declare-fun e!332148 () Bool)

(assert (=> b!577377 (=> (not res!365308) (not e!332148))))

(declare-datatypes ((array!36013 0))(
  ( (array!36014 (arr!17283 (Array (_ BitVec 32) (_ BitVec 64))) (size!17647 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36013)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577377 (= res!365308 (validKeyInArray!0 (select (arr!17283 a!2986) j!136)))))

(declare-fun b!577378 () Bool)

(declare-fun res!365306 () Bool)

(assert (=> b!577378 (=> (not res!365306) (not e!332148))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!577378 (= res!365306 (validKeyInArray!0 k!1786))))

(declare-fun b!577379 () Bool)

(declare-fun res!365304 () Bool)

(assert (=> b!577379 (=> (not res!365304) (not e!332148))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577379 (= res!365304 (and (= (size!17647 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17647 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17647 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365305 () Bool)

(assert (=> start!53050 (=> (not res!365305) (not e!332148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53050 (= res!365305 (validMask!0 mask!3053))))

(assert (=> start!53050 e!332148))

(assert (=> start!53050 true))

(declare-fun array_inv!13142 (array!36013) Bool)

(assert (=> start!53050 (array_inv!13142 a!2986)))

(declare-fun b!577380 () Bool)

(declare-fun res!365307 () Bool)

(assert (=> b!577380 (=> (not res!365307) (not e!332148))))

(declare-fun arrayContainsKey!0 (array!36013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577380 (= res!365307 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577381 () Bool)

(assert (=> b!577381 (= e!332148 false)))

(declare-datatypes ((SeekEntryResult!5679 0))(
  ( (MissingZero!5679 (index!24943 (_ BitVec 32))) (Found!5679 (index!24944 (_ BitVec 32))) (Intermediate!5679 (undefined!6491 Bool) (index!24945 (_ BitVec 32)) (x!54007 (_ BitVec 32))) (Undefined!5679) (MissingVacant!5679 (index!24946 (_ BitVec 32))) )
))
(declare-fun lt!264025 () SeekEntryResult!5679)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36013 (_ BitVec 32)) SeekEntryResult!5679)

(assert (=> b!577381 (= lt!264025 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53050 res!365305) b!577379))

(assert (= (and b!577379 res!365304) b!577377))

(assert (= (and b!577377 res!365308) b!577378))

(assert (= (and b!577378 res!365306) b!577380))

(assert (= (and b!577380 res!365307) b!577381))

(declare-fun m!556425 () Bool)

(assert (=> b!577378 m!556425))

(declare-fun m!556427 () Bool)

(assert (=> b!577380 m!556427))

(declare-fun m!556429 () Bool)

(assert (=> b!577377 m!556429))

(assert (=> b!577377 m!556429))

(declare-fun m!556431 () Bool)

(assert (=> b!577377 m!556431))

(declare-fun m!556433 () Bool)

(assert (=> b!577381 m!556433))

(declare-fun m!556435 () Bool)

(assert (=> start!53050 m!556435))

(declare-fun m!556437 () Bool)

(assert (=> start!53050 m!556437))

(push 1)

(assert (not b!577378))

(assert (not b!577380))

(assert (not start!53050))

(assert (not b!577377))

(assert (not b!577381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

