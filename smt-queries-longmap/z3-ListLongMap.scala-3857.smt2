; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53010 () Bool)

(assert start!53010)

(declare-fun b!577101 () Bool)

(declare-fun res!365278 () Bool)

(declare-fun e!331922 () Bool)

(assert (=> b!577101 (=> (not res!365278) (not e!331922))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577101 (= res!365278 (validKeyInArray!0 k0!1786))))

(declare-fun b!577102 () Bool)

(declare-fun res!365279 () Bool)

(assert (=> b!577102 (=> (not res!365279) (not e!331922))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36042 0))(
  ( (array!36043 (arr!17300 (Array (_ BitVec 32) (_ BitVec 64))) (size!17665 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36042)

(assert (=> b!577102 (= res!365279 (and (= (size!17665 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17665 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17665 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577103 () Bool)

(declare-fun res!365277 () Bool)

(assert (=> b!577103 (=> (not res!365277) (not e!331922))))

(declare-fun arrayContainsKey!0 (array!36042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577103 (= res!365277 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5737 0))(
  ( (MissingZero!5737 (index!25175 (_ BitVec 32))) (Found!5737 (index!25176 (_ BitVec 32))) (Intermediate!5737 (undefined!6549 Bool) (index!25177 (_ BitVec 32)) (x!54097 (_ BitVec 32))) (Undefined!5737) (MissingVacant!5737 (index!25178 (_ BitVec 32))) )
))
(declare-fun lt!263719 () SeekEntryResult!5737)

(declare-fun b!577104 () Bool)

(assert (=> b!577104 (= e!331922 (and (or (= lt!263719 (MissingZero!5737 i!1108)) (= lt!263719 (MissingVacant!5737 i!1108))) (bvsgt #b00000000000000000000000000000000 (size!17665 a!2986))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36042 (_ BitVec 32)) SeekEntryResult!5737)

(assert (=> b!577104 (= lt!263719 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!365275 () Bool)

(assert (=> start!53010 (=> (not res!365275) (not e!331922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53010 (= res!365275 (validMask!0 mask!3053))))

(assert (=> start!53010 e!331922))

(assert (=> start!53010 true))

(declare-fun array_inv!13183 (array!36042) Bool)

(assert (=> start!53010 (array_inv!13183 a!2986)))

(declare-fun b!577105 () Bool)

(declare-fun res!365276 () Bool)

(assert (=> b!577105 (=> (not res!365276) (not e!331922))))

(assert (=> b!577105 (= res!365276 (validKeyInArray!0 (select (arr!17300 a!2986) j!136)))))

(assert (= (and start!53010 res!365275) b!577102))

(assert (= (and b!577102 res!365279) b!577105))

(assert (= (and b!577105 res!365276) b!577101))

(assert (= (and b!577101 res!365278) b!577103))

(assert (= (and b!577103 res!365277) b!577104))

(declare-fun m!555497 () Bool)

(assert (=> b!577101 m!555497))

(declare-fun m!555499 () Bool)

(assert (=> start!53010 m!555499))

(declare-fun m!555501 () Bool)

(assert (=> start!53010 m!555501))

(declare-fun m!555503 () Bool)

(assert (=> b!577103 m!555503))

(declare-fun m!555505 () Bool)

(assert (=> b!577105 m!555505))

(assert (=> b!577105 m!555505))

(declare-fun m!555507 () Bool)

(assert (=> b!577105 m!555507))

(declare-fun m!555509 () Bool)

(assert (=> b!577104 m!555509))

(check-sat (not start!53010) (not b!577105) (not b!577104) (not b!577103) (not b!577101))
(check-sat)
