; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52956 () Bool)

(assert start!52956)

(declare-fun b!576954 () Bool)

(declare-fun res!364988 () Bool)

(declare-fun e!331929 () Bool)

(assert (=> b!576954 (=> (not res!364988) (not e!331929))))

(declare-datatypes ((array!35987 0))(
  ( (array!35988 (arr!17273 (Array (_ BitVec 32) (_ BitVec 64))) (size!17637 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35987)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576954 (= res!364988 (validKeyInArray!0 (select (arr!17273 a!2986) j!136)))))

(declare-fun b!576953 () Bool)

(declare-fun res!364987 () Bool)

(assert (=> b!576953 (=> (not res!364987) (not e!331929))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576953 (= res!364987 (and (= (size!17637 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17637 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17637 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!364985 () Bool)

(assert (=> start!52956 (=> (not res!364985) (not e!331929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52956 (= res!364985 (validMask!0 mask!3053))))

(assert (=> start!52956 e!331929))

(assert (=> start!52956 true))

(declare-fun array_inv!13069 (array!35987) Bool)

(assert (=> start!52956 (array_inv!13069 a!2986)))

(declare-fun b!576955 () Bool)

(declare-fun res!364986 () Bool)

(assert (=> b!576955 (=> (not res!364986) (not e!331929))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!576955 (= res!364986 (validKeyInArray!0 k!1786))))

(declare-fun b!576956 () Bool)

(assert (=> b!576956 (= e!331929 (bvsge #b00000000000000000000000000000000 (size!17637 a!2986)))))

(assert (= (and start!52956 res!364985) b!576953))

(assert (= (and b!576953 res!364987) b!576954))

(assert (= (and b!576954 res!364988) b!576955))

(assert (= (and b!576955 res!364986) b!576956))

(declare-fun m!555899 () Bool)

(assert (=> b!576954 m!555899))

(assert (=> b!576954 m!555899))

(declare-fun m!555901 () Bool)

(assert (=> b!576954 m!555901))

(declare-fun m!555903 () Bool)

(assert (=> start!52956 m!555903))

(declare-fun m!555905 () Bool)

(assert (=> start!52956 m!555905))

(declare-fun m!555907 () Bool)

(assert (=> b!576955 m!555907))

(push 1)

(assert (not start!52956))

(assert (not b!576954))

(assert (not b!576955))

(check-sat)

(pop 1)

