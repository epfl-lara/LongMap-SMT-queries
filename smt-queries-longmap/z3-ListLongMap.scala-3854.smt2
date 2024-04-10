; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53010 () Bool)

(assert start!53010)

(declare-fun b!577252 () Bool)

(declare-fun res!365286 () Bool)

(declare-fun e!332048 () Bool)

(assert (=> b!577252 (=> (not res!365286) (not e!332048))))

(declare-datatypes ((array!36028 0))(
  ( (array!36029 (arr!17293 (Array (_ BitVec 32) (_ BitVec 64))) (size!17657 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36028)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577252 (= res!365286 (validKeyInArray!0 (select (arr!17293 a!2986) j!136)))))

(declare-fun b!577253 () Bool)

(assert (=> b!577253 (= e!332048 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5733 0))(
  ( (MissingZero!5733 (index!25159 (_ BitVec 32))) (Found!5733 (index!25160 (_ BitVec 32))) (Intermediate!5733 (undefined!6545 Bool) (index!25161 (_ BitVec 32)) (x!54074 (_ BitVec 32))) (Undefined!5733) (MissingVacant!5733 (index!25162 (_ BitVec 32))) )
))
(declare-fun lt!263929 () SeekEntryResult!5733)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36028 (_ BitVec 32)) SeekEntryResult!5733)

(assert (=> b!577253 (= lt!263929 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577254 () Bool)

(declare-fun res!365288 () Bool)

(assert (=> b!577254 (=> (not res!365288) (not e!332048))))

(declare-fun arrayContainsKey!0 (array!36028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577254 (= res!365288 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577255 () Bool)

(declare-fun res!365285 () Bool)

(assert (=> b!577255 (=> (not res!365285) (not e!332048))))

(assert (=> b!577255 (= res!365285 (validKeyInArray!0 k0!1786))))

(declare-fun res!365287 () Bool)

(assert (=> start!53010 (=> (not res!365287) (not e!332048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53010 (= res!365287 (validMask!0 mask!3053))))

(assert (=> start!53010 e!332048))

(assert (=> start!53010 true))

(declare-fun array_inv!13089 (array!36028) Bool)

(assert (=> start!53010 (array_inv!13089 a!2986)))

(declare-fun b!577256 () Bool)

(declare-fun res!365284 () Bool)

(assert (=> b!577256 (=> (not res!365284) (not e!332048))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577256 (= res!365284 (and (= (size!17657 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17657 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17657 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53010 res!365287) b!577256))

(assert (= (and b!577256 res!365284) b!577252))

(assert (= (and b!577252 res!365286) b!577255))

(assert (= (and b!577255 res!365285) b!577254))

(assert (= (and b!577254 res!365288) b!577253))

(declare-fun m!556157 () Bool)

(assert (=> b!577254 m!556157))

(declare-fun m!556159 () Bool)

(assert (=> start!53010 m!556159))

(declare-fun m!556161 () Bool)

(assert (=> start!53010 m!556161))

(declare-fun m!556163 () Bool)

(assert (=> b!577253 m!556163))

(declare-fun m!556165 () Bool)

(assert (=> b!577255 m!556165))

(declare-fun m!556167 () Bool)

(assert (=> b!577252 m!556167))

(assert (=> b!577252 m!556167))

(declare-fun m!556169 () Bool)

(assert (=> b!577252 m!556169))

(check-sat (not b!577254) (not b!577255) (not start!53010) (not b!577252) (not b!577253))
