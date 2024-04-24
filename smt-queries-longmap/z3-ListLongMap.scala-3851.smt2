; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53040 () Bool)

(assert start!53040)

(declare-fun b!577296 () Bool)

(declare-fun res!365224 () Bool)

(declare-fun e!332117 () Bool)

(assert (=> b!577296 (=> (not res!365224) (not e!332117))))

(declare-datatypes ((array!36003 0))(
  ( (array!36004 (arr!17278 (Array (_ BitVec 32) (_ BitVec 64))) (size!17642 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36003)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577296 (= res!365224 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577297 () Bool)

(declare-fun res!365223 () Bool)

(assert (=> b!577297 (=> (not res!365223) (not e!332117))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577297 (= res!365223 (validKeyInArray!0 (select (arr!17278 a!2986) j!136)))))

(declare-fun b!577298 () Bool)

(declare-fun res!365226 () Bool)

(assert (=> b!577298 (=> (not res!365226) (not e!332117))))

(assert (=> b!577298 (= res!365226 (validKeyInArray!0 k0!1786))))

(declare-fun b!577299 () Bool)

(declare-fun res!365225 () Bool)

(assert (=> b!577299 (=> (not res!365225) (not e!332117))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5674 0))(
  ( (MissingZero!5674 (index!24923 (_ BitVec 32))) (Found!5674 (index!24924 (_ BitVec 32))) (Intermediate!5674 (undefined!6486 Bool) (index!24925 (_ BitVec 32)) (x!53994 (_ BitVec 32))) (Undefined!5674) (MissingVacant!5674 (index!24926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36003 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!577299 (= res!365225 (not (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) (MissingZero!5674 i!1108))))))

(declare-fun b!577300 () Bool)

(declare-fun res!365227 () Bool)

(assert (=> b!577300 (=> (not res!365227) (not e!332117))))

(assert (=> b!577300 (= res!365227 (and (= (size!17642 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17642 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17642 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365222 () Bool)

(assert (=> start!53040 (=> (not res!365222) (not e!332117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53040 (= res!365222 (validMask!0 mask!3053))))

(assert (=> start!53040 e!332117))

(assert (=> start!53040 true))

(declare-fun array_inv!13137 (array!36003) Bool)

(assert (=> start!53040 (array_inv!13137 a!2986)))

(declare-fun b!577295 () Bool)

(assert (=> b!577295 (= e!332117 (bvslt mask!3053 #b00000000000000000000000000000000))))

(assert (= (and start!53040 res!365222) b!577300))

(assert (= (and b!577300 res!365227) b!577297))

(assert (= (and b!577297 res!365223) b!577298))

(assert (= (and b!577298 res!365226) b!577296))

(assert (= (and b!577296 res!365224) b!577299))

(assert (= (and b!577299 res!365225) b!577295))

(declare-fun m!556355 () Bool)

(assert (=> b!577298 m!556355))

(declare-fun m!556357 () Bool)

(assert (=> b!577296 m!556357))

(declare-fun m!556359 () Bool)

(assert (=> b!577299 m!556359))

(declare-fun m!556361 () Bool)

(assert (=> b!577297 m!556361))

(assert (=> b!577297 m!556361))

(declare-fun m!556363 () Bool)

(assert (=> b!577297 m!556363))

(declare-fun m!556365 () Bool)

(assert (=> start!53040 m!556365))

(declare-fun m!556367 () Bool)

(assert (=> start!53040 m!556367))

(check-sat (not start!53040) (not b!577298) (not b!577297) (not b!577296) (not b!577299))
(check-sat)
