; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52982 () Bool)

(assert start!52982)

(declare-fun b!577033 () Bool)

(declare-fun res!365067 () Bool)

(declare-fun e!331965 () Bool)

(assert (=> b!577033 (=> (not res!365067) (not e!331965))))

(declare-datatypes ((array!36000 0))(
  ( (array!36001 (arr!17279 (Array (_ BitVec 32) (_ BitVec 64))) (size!17643 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36000)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577033 (= res!365067 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577034 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!577034 (= e!331965 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577035 () Bool)

(declare-fun res!365065 () Bool)

(assert (=> b!577035 (=> (not res!365065) (not e!331965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577035 (= res!365065 (validKeyInArray!0 k!1786))))

(declare-fun b!577036 () Bool)

(declare-fun res!365068 () Bool)

(assert (=> b!577036 (=> (not res!365068) (not e!331965))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577036 (= res!365068 (validKeyInArray!0 (select (arr!17279 a!2986) j!136)))))

(declare-fun res!365069 () Bool)

(assert (=> start!52982 (=> (not res!365069) (not e!331965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52982 (= res!365069 (validMask!0 mask!3053))))

(assert (=> start!52982 e!331965))

(assert (=> start!52982 true))

(declare-fun array_inv!13075 (array!36000) Bool)

(assert (=> start!52982 (array_inv!13075 a!2986)))

(declare-fun b!577037 () Bool)

(declare-fun res!365066 () Bool)

(assert (=> b!577037 (=> (not res!365066) (not e!331965))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577037 (= res!365066 (and (= (size!17643 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17643 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17643 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!52982 res!365069) b!577037))

(assert (= (and b!577037 res!365066) b!577036))

(assert (= (and b!577036 res!365068) b!577035))

(assert (= (and b!577035 res!365065) b!577033))

(assert (= (and b!577033 res!365067) b!577034))

(declare-fun m!555963 () Bool)

(assert (=> b!577033 m!555963))

(declare-fun m!555965 () Bool)

(assert (=> b!577035 m!555965))

(declare-fun m!555967 () Bool)

(assert (=> b!577036 m!555967))

(assert (=> b!577036 m!555967))

(declare-fun m!555969 () Bool)

(assert (=> b!577036 m!555969))

(declare-fun m!555971 () Bool)

(assert (=> start!52982 m!555971))

(declare-fun m!555973 () Bool)

(assert (=> start!52982 m!555973))

(push 1)

(assert (not start!52982))

(assert (not b!577033))

(assert (not b!577035))

(assert (not b!577036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

