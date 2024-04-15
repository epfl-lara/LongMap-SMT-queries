; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53000 () Bool)

(assert start!53000)

(declare-fun res!365204 () Bool)

(declare-fun e!331892 () Bool)

(assert (=> start!53000 (=> (not res!365204) (not e!331892))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53000 (= res!365204 (validMask!0 mask!3053))))

(assert (=> start!53000 e!331892))

(assert (=> start!53000 true))

(declare-datatypes ((array!36032 0))(
  ( (array!36033 (arr!17295 (Array (_ BitVec 32) (_ BitVec 64))) (size!17660 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36032)

(declare-fun array_inv!13178 (array!36032) Bool)

(assert (=> start!53000 (array_inv!13178 a!2986)))

(declare-fun b!577026 () Bool)

(assert (=> b!577026 (= e!331892 false)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5732 0))(
  ( (MissingZero!5732 (index!25155 (_ BitVec 32))) (Found!5732 (index!25156 (_ BitVec 32))) (Intermediate!5732 (undefined!6544 Bool) (index!25157 (_ BitVec 32)) (x!54076 (_ BitVec 32))) (Undefined!5732) (MissingVacant!5732 (index!25158 (_ BitVec 32))) )
))
(declare-fun lt!263704 () SeekEntryResult!5732)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36032 (_ BitVec 32)) SeekEntryResult!5732)

(assert (=> b!577026 (= lt!263704 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577027 () Bool)

(declare-fun res!365200 () Bool)

(assert (=> b!577027 (=> (not res!365200) (not e!331892))))

(declare-fun arrayContainsKey!0 (array!36032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577027 (= res!365200 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577028 () Bool)

(declare-fun res!365203 () Bool)

(assert (=> b!577028 (=> (not res!365203) (not e!331892))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577028 (= res!365203 (and (= (size!17660 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17660 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17660 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577029 () Bool)

(declare-fun res!365201 () Bool)

(assert (=> b!577029 (=> (not res!365201) (not e!331892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577029 (= res!365201 (validKeyInArray!0 k!1786))))

(declare-fun b!577030 () Bool)

(declare-fun res!365202 () Bool)

(assert (=> b!577030 (=> (not res!365202) (not e!331892))))

(assert (=> b!577030 (= res!365202 (validKeyInArray!0 (select (arr!17295 a!2986) j!136)))))

(assert (= (and start!53000 res!365204) b!577028))

(assert (= (and b!577028 res!365203) b!577030))

(assert (= (and b!577030 res!365202) b!577029))

(assert (= (and b!577029 res!365201) b!577027))

(assert (= (and b!577027 res!365200) b!577026))

(declare-fun m!555427 () Bool)

(assert (=> b!577030 m!555427))

(assert (=> b!577030 m!555427))

(declare-fun m!555429 () Bool)

(assert (=> b!577030 m!555429))

(declare-fun m!555431 () Bool)

(assert (=> b!577027 m!555431))

(declare-fun m!555433 () Bool)

(assert (=> b!577026 m!555433))

(declare-fun m!555435 () Bool)

(assert (=> b!577029 m!555435))

(declare-fun m!555437 () Bool)

(assert (=> start!53000 m!555437))

(declare-fun m!555439 () Bool)

(assert (=> start!53000 m!555439))

(push 1)

(assert (not b!577026))

(assert (not b!577027))

(assert (not b!577030))

(assert (not start!53000))

(assert (not b!577029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

