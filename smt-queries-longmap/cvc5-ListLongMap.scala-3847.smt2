; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52952 () Bool)

(assert start!52952)

(declare-fun b!576931 () Bool)

(declare-fun res!364964 () Bool)

(declare-fun e!331916 () Bool)

(assert (=> b!576931 (=> (not res!364964) (not e!331916))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576931 (= res!364964 (validKeyInArray!0 k!1786))))

(declare-fun b!576930 () Bool)

(declare-fun res!364962 () Bool)

(assert (=> b!576930 (=> (not res!364962) (not e!331916))))

(declare-datatypes ((array!35983 0))(
  ( (array!35984 (arr!17271 (Array (_ BitVec 32) (_ BitVec 64))) (size!17635 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35983)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!576930 (= res!364962 (validKeyInArray!0 (select (arr!17271 a!2986) j!136)))))

(declare-fun res!364961 () Bool)

(assert (=> start!52952 (=> (not res!364961) (not e!331916))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52952 (= res!364961 (validMask!0 mask!3053))))

(assert (=> start!52952 e!331916))

(assert (=> start!52952 true))

(declare-fun array_inv!13067 (array!35983) Bool)

(assert (=> start!52952 (array_inv!13067 a!2986)))

(declare-fun b!576932 () Bool)

(assert (=> b!576932 (= e!331916 (bvsge #b00000000000000000000000000000000 (size!17635 a!2986)))))

(declare-fun b!576929 () Bool)

(declare-fun res!364963 () Bool)

(assert (=> b!576929 (=> (not res!364963) (not e!331916))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576929 (= res!364963 (and (= (size!17635 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17635 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17635 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!52952 res!364961) b!576929))

(assert (= (and b!576929 res!364963) b!576930))

(assert (= (and b!576930 res!364962) b!576931))

(assert (= (and b!576931 res!364964) b!576932))

(declare-fun m!555879 () Bool)

(assert (=> b!576931 m!555879))

(declare-fun m!555881 () Bool)

(assert (=> b!576930 m!555881))

(assert (=> b!576930 m!555881))

(declare-fun m!555883 () Bool)

(assert (=> b!576930 m!555883))

(declare-fun m!555885 () Bool)

(assert (=> start!52952 m!555885))

(declare-fun m!555887 () Bool)

(assert (=> start!52952 m!555887))

(push 1)

(assert (not b!576931))

(assert (not start!52952))

(assert (not b!576930))

(check-sat)

