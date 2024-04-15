; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52940 () Bool)

(assert start!52940)

(declare-fun b!576661 () Bool)

(declare-fun e!331742 () Bool)

(declare-datatypes ((array!35980 0))(
  ( (array!35981 (arr!17270 (Array (_ BitVec 32) (_ BitVec 64))) (size!17635 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35980)

(assert (=> b!576661 (= e!331742 (bvsge #b00000000000000000000000000000000 (size!17635 a!2986)))))

(declare-fun b!576659 () Bool)

(declare-fun res!364833 () Bool)

(assert (=> b!576659 (=> (not res!364833) (not e!331742))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576659 (= res!364833 (validKeyInArray!0 (select (arr!17270 a!2986) j!136)))))

(declare-fun b!576660 () Bool)

(declare-fun res!364832 () Bool)

(assert (=> b!576660 (=> (not res!364832) (not e!331742))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!576660 (= res!364832 (validKeyInArray!0 k0!1786))))

(declare-fun res!364834 () Bool)

(assert (=> start!52940 (=> (not res!364834) (not e!331742))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52940 (= res!364834 (validMask!0 mask!3053))))

(assert (=> start!52940 e!331742))

(assert (=> start!52940 true))

(declare-fun array_inv!13153 (array!35980) Bool)

(assert (=> start!52940 (array_inv!13153 a!2986)))

(declare-fun b!576658 () Bool)

(declare-fun res!364835 () Bool)

(assert (=> b!576658 (=> (not res!364835) (not e!331742))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576658 (= res!364835 (and (= (size!17635 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17635 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17635 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!52940 res!364834) b!576658))

(assert (= (and b!576658 res!364835) b!576659))

(assert (= (and b!576659 res!364833) b!576660))

(assert (= (and b!576660 res!364832) b!576661))

(declare-fun m!555107 () Bool)

(assert (=> b!576659 m!555107))

(assert (=> b!576659 m!555107))

(declare-fun m!555109 () Bool)

(assert (=> b!576659 m!555109))

(declare-fun m!555111 () Bool)

(assert (=> b!576660 m!555111))

(declare-fun m!555113 () Bool)

(assert (=> start!52940 m!555113))

(declare-fun m!555115 () Bool)

(assert (=> start!52940 m!555115))

(check-sat (not start!52940) (not b!576659) (not b!576660))
(check-sat)
