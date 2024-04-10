; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52958 () Bool)

(assert start!52958)

(declare-fun b!576966 () Bool)

(declare-fun res!364997 () Bool)

(declare-fun e!331934 () Bool)

(assert (=> b!576966 (=> (not res!364997) (not e!331934))))

(declare-datatypes ((array!35989 0))(
  ( (array!35990 (arr!17274 (Array (_ BitVec 32) (_ BitVec 64))) (size!17638 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35989)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576966 (= res!364997 (validKeyInArray!0 (select (arr!17274 a!2986) j!136)))))

(declare-fun b!576965 () Bool)

(declare-fun res!364999 () Bool)

(assert (=> b!576965 (=> (not res!364999) (not e!331934))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576965 (= res!364999 (and (= (size!17638 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17638 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17638 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365000 () Bool)

(assert (=> start!52958 (=> (not res!365000) (not e!331934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52958 (= res!365000 (validMask!0 mask!3053))))

(assert (=> start!52958 e!331934))

(assert (=> start!52958 true))

(declare-fun array_inv!13070 (array!35989) Bool)

(assert (=> start!52958 (array_inv!13070 a!2986)))

(declare-fun b!576968 () Bool)

(assert (=> b!576968 (= e!331934 (and (bvslt #b00000000000000000000000000000000 (size!17638 a!2986)) (bvsge (size!17638 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!576967 () Bool)

(declare-fun res!364998 () Bool)

(assert (=> b!576967 (=> (not res!364998) (not e!331934))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!576967 (= res!364998 (validKeyInArray!0 k!1786))))

(assert (= (and start!52958 res!365000) b!576965))

(assert (= (and b!576965 res!364999) b!576966))

(assert (= (and b!576966 res!364997) b!576967))

(assert (= (and b!576967 res!364998) b!576968))

(declare-fun m!555909 () Bool)

(assert (=> b!576966 m!555909))

(assert (=> b!576966 m!555909))

(declare-fun m!555911 () Bool)

(assert (=> b!576966 m!555911))

(declare-fun m!555913 () Bool)

(assert (=> start!52958 m!555913))

(declare-fun m!555915 () Bool)

(assert (=> start!52958 m!555915))

(declare-fun m!555917 () Bool)

(assert (=> b!576967 m!555917))

(push 1)

(assert (not b!576966))

(assert (not b!576967))

(assert (not start!52958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

