; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53020 () Bool)

(assert start!53020)

(declare-fun b!577327 () Bool)

(declare-fun res!365360 () Bool)

(declare-fun e!332078 () Bool)

(assert (=> b!577327 (=> (not res!365360) (not e!332078))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36038 0))(
  ( (array!36039 (arr!17298 (Array (_ BitVec 32) (_ BitVec 64))) (size!17662 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36038)

(assert (=> b!577327 (= res!365360 (and (= (size!17662 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17662 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17662 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577328 () Bool)

(declare-fun res!365359 () Bool)

(assert (=> b!577328 (=> (not res!365359) (not e!332078))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577328 (= res!365359 (validKeyInArray!0 k!1786))))

(declare-fun res!365363 () Bool)

(assert (=> start!53020 (=> (not res!365363) (not e!332078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53020 (= res!365363 (validMask!0 mask!3053))))

(assert (=> start!53020 e!332078))

(assert (=> start!53020 true))

(declare-fun array_inv!13094 (array!36038) Bool)

(assert (=> start!53020 (array_inv!13094 a!2986)))

(declare-fun b!577329 () Bool)

(declare-fun res!365362 () Bool)

(assert (=> b!577329 (=> (not res!365362) (not e!332078))))

(assert (=> b!577329 (= res!365362 (validKeyInArray!0 (select (arr!17298 a!2986) j!136)))))

(declare-fun b!577330 () Bool)

(declare-fun res!365361 () Bool)

(assert (=> b!577330 (=> (not res!365361) (not e!332078))))

(declare-fun arrayContainsKey!0 (array!36038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577330 (= res!365361 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577331 () Bool)

(assert (=> b!577331 (= e!332078 false)))

(declare-datatypes ((SeekEntryResult!5738 0))(
  ( (MissingZero!5738 (index!25179 (_ BitVec 32))) (Found!5738 (index!25180 (_ BitVec 32))) (Intermediate!5738 (undefined!6550 Bool) (index!25181 (_ BitVec 32)) (x!54095 (_ BitVec 32))) (Undefined!5738) (MissingVacant!5738 (index!25182 (_ BitVec 32))) )
))
(declare-fun lt!263944 () SeekEntryResult!5738)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36038 (_ BitVec 32)) SeekEntryResult!5738)

(assert (=> b!577331 (= lt!263944 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53020 res!365363) b!577327))

(assert (= (and b!577327 res!365360) b!577329))

(assert (= (and b!577329 res!365362) b!577328))

(assert (= (and b!577328 res!365359) b!577330))

(assert (= (and b!577330 res!365361) b!577331))

(declare-fun m!556227 () Bool)

(assert (=> b!577329 m!556227))

(assert (=> b!577329 m!556227))

(declare-fun m!556229 () Bool)

(assert (=> b!577329 m!556229))

(declare-fun m!556231 () Bool)

(assert (=> start!53020 m!556231))

(declare-fun m!556233 () Bool)

(assert (=> start!53020 m!556233))

(declare-fun m!556235 () Bool)

(assert (=> b!577328 m!556235))

(declare-fun m!556237 () Bool)

(assert (=> b!577331 m!556237))

(declare-fun m!556239 () Bool)

(assert (=> b!577330 m!556239))

(push 1)

(assert (not start!53020))

(assert (not b!577328))

(assert (not b!577329))

(assert (not b!577331))

(assert (not b!577330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

