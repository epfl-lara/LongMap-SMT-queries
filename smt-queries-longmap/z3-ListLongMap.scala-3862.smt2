; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53232 () Bool)

(assert start!53232)

(declare-fun b!578293 () Bool)

(declare-fun res!366010 () Bool)

(declare-fun e!332639 () Bool)

(assert (=> b!578293 (=> (not res!366010) (not e!332639))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578293 (= res!366010 (validKeyInArray!0 k0!1786))))

(declare-fun b!578294 () Bool)

(declare-fun e!332638 () Bool)

(assert (=> b!578294 (= e!332639 e!332638)))

(declare-fun res!366005 () Bool)

(assert (=> b!578294 (=> (not res!366005) (not e!332638))))

(declare-datatypes ((SeekEntryResult!5707 0))(
  ( (MissingZero!5707 (index!25055 (_ BitVec 32))) (Found!5707 (index!25056 (_ BitVec 32))) (Intermediate!5707 (undefined!6519 Bool) (index!25057 (_ BitVec 32)) (x!54115 (_ BitVec 32))) (Undefined!5707) (MissingVacant!5707 (index!25058 (_ BitVec 32))) )
))
(declare-fun lt!264286 () SeekEntryResult!5707)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578294 (= res!366005 (or (= lt!264286 (MissingZero!5707 i!1108)) (= lt!264286 (MissingVacant!5707 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36078 0))(
  ( (array!36079 (arr!17311 (Array (_ BitVec 32) (_ BitVec 64))) (size!17675 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36078)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36078 (_ BitVec 32)) SeekEntryResult!5707)

(assert (=> b!578294 (= lt!264286 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578295 () Bool)

(declare-fun res!366007 () Bool)

(assert (=> b!578295 (=> (not res!366007) (not e!332638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36078 (_ BitVec 32)) Bool)

(assert (=> b!578295 (= res!366007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578296 () Bool)

(assert (=> b!578296 (= e!332638 false)))

(declare-fun lt!264285 () Bool)

(declare-datatypes ((List!11259 0))(
  ( (Nil!11256) (Cons!11255 (h!12303 (_ BitVec 64)) (t!17479 List!11259)) )
))
(declare-fun arrayNoDuplicates!0 (array!36078 (_ BitVec 32) List!11259) Bool)

(assert (=> b!578296 (= lt!264285 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11256))))

(declare-fun res!366006 () Bool)

(assert (=> start!53232 (=> (not res!366006) (not e!332639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53232 (= res!366006 (validMask!0 mask!3053))))

(assert (=> start!53232 e!332639))

(assert (=> start!53232 true))

(declare-fun array_inv!13170 (array!36078) Bool)

(assert (=> start!53232 (array_inv!13170 a!2986)))

(declare-fun b!578297 () Bool)

(declare-fun res!366008 () Bool)

(assert (=> b!578297 (=> (not res!366008) (not e!332639))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578297 (= res!366008 (and (= (size!17675 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17675 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17675 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578298 () Bool)

(declare-fun res!366004 () Bool)

(assert (=> b!578298 (=> (not res!366004) (not e!332639))))

(assert (=> b!578298 (= res!366004 (validKeyInArray!0 (select (arr!17311 a!2986) j!136)))))

(declare-fun b!578299 () Bool)

(declare-fun res!366009 () Bool)

(assert (=> b!578299 (=> (not res!366009) (not e!332639))))

(declare-fun arrayContainsKey!0 (array!36078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578299 (= res!366009 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53232 res!366006) b!578297))

(assert (= (and b!578297 res!366008) b!578298))

(assert (= (and b!578298 res!366004) b!578293))

(assert (= (and b!578293 res!366010) b!578299))

(assert (= (and b!578299 res!366009) b!578294))

(assert (= (and b!578294 res!366005) b!578295))

(assert (= (and b!578295 res!366007) b!578296))

(declare-fun m!557171 () Bool)

(assert (=> b!578295 m!557171))

(declare-fun m!557173 () Bool)

(assert (=> b!578298 m!557173))

(assert (=> b!578298 m!557173))

(declare-fun m!557175 () Bool)

(assert (=> b!578298 m!557175))

(declare-fun m!557177 () Bool)

(assert (=> b!578293 m!557177))

(declare-fun m!557179 () Bool)

(assert (=> start!53232 m!557179))

(declare-fun m!557181 () Bool)

(assert (=> start!53232 m!557181))

(declare-fun m!557183 () Bool)

(assert (=> b!578294 m!557183))

(declare-fun m!557185 () Bool)

(assert (=> b!578299 m!557185))

(declare-fun m!557187 () Bool)

(assert (=> b!578296 m!557187))

(check-sat (not b!578299) (not b!578298) (not b!578296) (not start!53232) (not b!578295) (not b!578293) (not b!578294))
(check-sat)
