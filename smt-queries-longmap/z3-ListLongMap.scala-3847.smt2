; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52954 () Bool)

(assert start!52954)

(declare-fun b!576944 () Bool)

(declare-fun e!331922 () Bool)

(declare-datatypes ((array!35985 0))(
  ( (array!35986 (arr!17272 (Array (_ BitVec 32) (_ BitVec 64))) (size!17636 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35985)

(assert (=> b!576944 (= e!331922 (bvsge #b00000000000000000000000000000000 (size!17636 a!2986)))))

(declare-fun b!576942 () Bool)

(declare-fun res!364976 () Bool)

(assert (=> b!576942 (=> (not res!364976) (not e!331922))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576942 (= res!364976 (validKeyInArray!0 (select (arr!17272 a!2986) j!136)))))

(declare-fun b!576941 () Bool)

(declare-fun res!364975 () Bool)

(assert (=> b!576941 (=> (not res!364975) (not e!331922))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576941 (= res!364975 (and (= (size!17636 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17636 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17636 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576943 () Bool)

(declare-fun res!364974 () Bool)

(assert (=> b!576943 (=> (not res!364974) (not e!331922))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!576943 (= res!364974 (validKeyInArray!0 k0!1786))))

(declare-fun res!364973 () Bool)

(assert (=> start!52954 (=> (not res!364973) (not e!331922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52954 (= res!364973 (validMask!0 mask!3053))))

(assert (=> start!52954 e!331922))

(assert (=> start!52954 true))

(declare-fun array_inv!13068 (array!35985) Bool)

(assert (=> start!52954 (array_inv!13068 a!2986)))

(assert (= (and start!52954 res!364973) b!576941))

(assert (= (and b!576941 res!364975) b!576942))

(assert (= (and b!576942 res!364976) b!576943))

(assert (= (and b!576943 res!364974) b!576944))

(declare-fun m!555889 () Bool)

(assert (=> b!576942 m!555889))

(assert (=> b!576942 m!555889))

(declare-fun m!555891 () Bool)

(assert (=> b!576942 m!555891))

(declare-fun m!555893 () Bool)

(assert (=> b!576943 m!555893))

(declare-fun m!555895 () Bool)

(assert (=> start!52954 m!555895))

(declare-fun m!555897 () Bool)

(assert (=> start!52954 m!555897))

(check-sat (not start!52954) (not b!576942) (not b!576943))
(check-sat)
