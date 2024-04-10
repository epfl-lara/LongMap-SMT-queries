; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52978 () Bool)

(assert start!52978)

(declare-fun b!577003 () Bool)

(declare-fun res!365038 () Bool)

(declare-fun e!331953 () Bool)

(assert (=> b!577003 (=> (not res!365038) (not e!331953))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577003 (= res!365038 (validKeyInArray!0 k!1786))))

(declare-fun b!577004 () Bool)

(declare-fun res!365036 () Bool)

(assert (=> b!577004 (=> (not res!365036) (not e!331953))))

(declare-datatypes ((array!35996 0))(
  ( (array!35997 (arr!17277 (Array (_ BitVec 32) (_ BitVec 64))) (size!17641 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35996)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577004 (= res!365036 (validKeyInArray!0 (select (arr!17277 a!2986) j!136)))))

(declare-fun b!577005 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!577005 (= e!331953 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577006 () Bool)

(declare-fun res!365039 () Bool)

(assert (=> b!577006 (=> (not res!365039) (not e!331953))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577006 (= res!365039 (and (= (size!17641 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17641 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17641 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365035 () Bool)

(assert (=> start!52978 (=> (not res!365035) (not e!331953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52978 (= res!365035 (validMask!0 mask!3053))))

(assert (=> start!52978 e!331953))

(assert (=> start!52978 true))

(declare-fun array_inv!13073 (array!35996) Bool)

(assert (=> start!52978 (array_inv!13073 a!2986)))

(declare-fun b!577007 () Bool)

(declare-fun res!365037 () Bool)

(assert (=> b!577007 (=> (not res!365037) (not e!331953))))

(declare-fun arrayContainsKey!0 (array!35996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577007 (= res!365037 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!52978 res!365035) b!577006))

(assert (= (and b!577006 res!365039) b!577004))

(assert (= (and b!577004 res!365036) b!577003))

(assert (= (and b!577003 res!365038) b!577007))

(assert (= (and b!577007 res!365037) b!577005))

(declare-fun m!555939 () Bool)

(assert (=> b!577003 m!555939))

(declare-fun m!555941 () Bool)

(assert (=> b!577004 m!555941))

(assert (=> b!577004 m!555941))

(declare-fun m!555943 () Bool)

(assert (=> b!577004 m!555943))

(declare-fun m!555945 () Bool)

(assert (=> start!52978 m!555945))

(declare-fun m!555947 () Bool)

(assert (=> start!52978 m!555947))

(declare-fun m!555949 () Bool)

(assert (=> b!577007 m!555949))

(push 1)

(assert (not b!577007))

(assert (not b!577003))

(assert (not start!52978))

(assert (not b!577004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

