; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53004 () Bool)

(assert start!53004)

(declare-fun b!577207 () Bool)

(declare-fun res!365240 () Bool)

(declare-fun e!332031 () Bool)

(assert (=> b!577207 (=> (not res!365240) (not e!332031))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577207 (= res!365240 (validKeyInArray!0 k0!1786))))

(declare-fun b!577208 () Bool)

(assert (=> b!577208 (= e!332031 false)))

(declare-datatypes ((array!36022 0))(
  ( (array!36023 (arr!17290 (Array (_ BitVec 32) (_ BitVec 64))) (size!17654 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36022)

(declare-datatypes ((SeekEntryResult!5730 0))(
  ( (MissingZero!5730 (index!25147 (_ BitVec 32))) (Found!5730 (index!25148 (_ BitVec 32))) (Intermediate!5730 (undefined!6542 Bool) (index!25149 (_ BitVec 32)) (x!54063 (_ BitVec 32))) (Undefined!5730) (MissingVacant!5730 (index!25150 (_ BitVec 32))) )
))
(declare-fun lt!263920 () SeekEntryResult!5730)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36022 (_ BitVec 32)) SeekEntryResult!5730)

(assert (=> b!577208 (= lt!263920 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577209 () Bool)

(declare-fun res!365239 () Bool)

(assert (=> b!577209 (=> (not res!365239) (not e!332031))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577209 (= res!365239 (validKeyInArray!0 (select (arr!17290 a!2986) j!136)))))

(declare-fun b!577211 () Bool)

(declare-fun res!365243 () Bool)

(assert (=> b!577211 (=> (not res!365243) (not e!332031))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577211 (= res!365243 (and (= (size!17654 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17654 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17654 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577210 () Bool)

(declare-fun res!365241 () Bool)

(assert (=> b!577210 (=> (not res!365241) (not e!332031))))

(declare-fun arrayContainsKey!0 (array!36022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577210 (= res!365241 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365242 () Bool)

(assert (=> start!53004 (=> (not res!365242) (not e!332031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53004 (= res!365242 (validMask!0 mask!3053))))

(assert (=> start!53004 e!332031))

(assert (=> start!53004 true))

(declare-fun array_inv!13086 (array!36022) Bool)

(assert (=> start!53004 (array_inv!13086 a!2986)))

(assert (= (and start!53004 res!365242) b!577211))

(assert (= (and b!577211 res!365243) b!577209))

(assert (= (and b!577209 res!365239) b!577207))

(assert (= (and b!577207 res!365240) b!577210))

(assert (= (and b!577210 res!365241) b!577208))

(declare-fun m!556115 () Bool)

(assert (=> start!53004 m!556115))

(declare-fun m!556117 () Bool)

(assert (=> start!53004 m!556117))

(declare-fun m!556119 () Bool)

(assert (=> b!577209 m!556119))

(assert (=> b!577209 m!556119))

(declare-fun m!556121 () Bool)

(assert (=> b!577209 m!556121))

(declare-fun m!556123 () Bool)

(assert (=> b!577207 m!556123))

(declare-fun m!556125 () Bool)

(assert (=> b!577210 m!556125))

(declare-fun m!556127 () Bool)

(assert (=> b!577208 m!556127))

(check-sat (not b!577210) (not b!577207) (not b!577208) (not start!53004) (not b!577209))
(check-sat)
