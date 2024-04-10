; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52980 () Bool)

(assert start!52980)

(declare-fun b!577018 () Bool)

(declare-fun e!331959 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!577018 (= e!331959 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577019 () Bool)

(declare-fun res!365051 () Bool)

(assert (=> b!577019 (=> (not res!365051) (not e!331959))))

(declare-datatypes ((array!35998 0))(
  ( (array!35999 (arr!17278 (Array (_ BitVec 32) (_ BitVec 64))) (size!17642 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35998)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577019 (= res!365051 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577021 () Bool)

(declare-fun res!365050 () Bool)

(assert (=> b!577021 (=> (not res!365050) (not e!331959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577021 (= res!365050 (validKeyInArray!0 k0!1786))))

(declare-fun b!577022 () Bool)

(declare-fun res!365053 () Bool)

(assert (=> b!577022 (=> (not res!365053) (not e!331959))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577022 (= res!365053 (validKeyInArray!0 (select (arr!17278 a!2986) j!136)))))

(declare-fun b!577020 () Bool)

(declare-fun res!365052 () Bool)

(assert (=> b!577020 (=> (not res!365052) (not e!331959))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577020 (= res!365052 (and (= (size!17642 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17642 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17642 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365054 () Bool)

(assert (=> start!52980 (=> (not res!365054) (not e!331959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52980 (= res!365054 (validMask!0 mask!3053))))

(assert (=> start!52980 e!331959))

(assert (=> start!52980 true))

(declare-fun array_inv!13074 (array!35998) Bool)

(assert (=> start!52980 (array_inv!13074 a!2986)))

(assert (= (and start!52980 res!365054) b!577020))

(assert (= (and b!577020 res!365052) b!577022))

(assert (= (and b!577022 res!365053) b!577021))

(assert (= (and b!577021 res!365050) b!577019))

(assert (= (and b!577019 res!365051) b!577018))

(declare-fun m!555951 () Bool)

(assert (=> b!577019 m!555951))

(declare-fun m!555953 () Bool)

(assert (=> b!577021 m!555953))

(declare-fun m!555955 () Bool)

(assert (=> b!577022 m!555955))

(assert (=> b!577022 m!555955))

(declare-fun m!555957 () Bool)

(assert (=> b!577022 m!555957))

(declare-fun m!555959 () Bool)

(assert (=> start!52980 m!555959))

(declare-fun m!555961 () Bool)

(assert (=> start!52980 m!555961))

(check-sat (not b!577019) (not b!577021) (not b!577022) (not start!52980))
(check-sat)
