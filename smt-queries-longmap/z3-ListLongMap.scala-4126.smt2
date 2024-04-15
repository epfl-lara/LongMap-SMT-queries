; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56286 () Bool)

(assert start!56286)

(declare-fun b!624010 () Bool)

(declare-fun res!402306 () Bool)

(declare-fun e!357852 () Bool)

(assert (=> b!624010 (=> (not res!402306) (not e!357852))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624010 (= res!402306 (validKeyInArray!0 k0!1786))))

(declare-fun b!624011 () Bool)

(declare-fun res!402305 () Bool)

(assert (=> b!624011 (=> (not res!402305) (not e!357852))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37725 0))(
  ( (array!37726 (arr!18107 (Array (_ BitVec 32) (_ BitVec 64))) (size!18472 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37725)

(assert (=> b!624011 (= res!402305 (and (= (size!18472 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18472 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18472 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624012 () Bool)

(declare-fun res!402307 () Bool)

(assert (=> b!624012 (=> (not res!402307) (not e!357852))))

(assert (=> b!624012 (= res!402307 (validKeyInArray!0 (select (arr!18107 a!2986) j!136)))))

(declare-fun b!624013 () Bool)

(declare-fun res!402302 () Bool)

(assert (=> b!624013 (=> (not res!402302) (not e!357852))))

(declare-fun arrayContainsKey!0 (array!37725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624013 (= res!402302 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624014 () Bool)

(declare-fun e!357851 () Bool)

(assert (=> b!624014 (= e!357851 false)))

(declare-fun lt!289329 () Bool)

(declare-datatypes ((List!12187 0))(
  ( (Nil!12184) (Cons!12183 (h!13228 (_ BitVec 64)) (t!18406 List!12187)) )
))
(declare-fun arrayNoDuplicates!0 (array!37725 (_ BitVec 32) List!12187) Bool)

(assert (=> b!624014 (= lt!289329 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12184))))

(declare-fun b!624015 () Bool)

(assert (=> b!624015 (= e!357852 e!357851)))

(declare-fun res!402303 () Bool)

(assert (=> b!624015 (=> (not res!402303) (not e!357851))))

(declare-datatypes ((SeekEntryResult!6544 0))(
  ( (MissingZero!6544 (index!28460 (_ BitVec 32))) (Found!6544 (index!28461 (_ BitVec 32))) (Intermediate!6544 (undefined!7356 Bool) (index!28462 (_ BitVec 32)) (x!57230 (_ BitVec 32))) (Undefined!6544) (MissingVacant!6544 (index!28463 (_ BitVec 32))) )
))
(declare-fun lt!289330 () SeekEntryResult!6544)

(assert (=> b!624015 (= res!402303 (or (= lt!289330 (MissingZero!6544 i!1108)) (= lt!289330 (MissingVacant!6544 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37725 (_ BitVec 32)) SeekEntryResult!6544)

(assert (=> b!624015 (= lt!289330 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!402308 () Bool)

(assert (=> start!56286 (=> (not res!402308) (not e!357852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56286 (= res!402308 (validMask!0 mask!3053))))

(assert (=> start!56286 e!357852))

(assert (=> start!56286 true))

(declare-fun array_inv!13990 (array!37725) Bool)

(assert (=> start!56286 (array_inv!13990 a!2986)))

(declare-fun b!624016 () Bool)

(declare-fun res!402304 () Bool)

(assert (=> b!624016 (=> (not res!402304) (not e!357851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37725 (_ BitVec 32)) Bool)

(assert (=> b!624016 (= res!402304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56286 res!402308) b!624011))

(assert (= (and b!624011 res!402305) b!624012))

(assert (= (and b!624012 res!402307) b!624010))

(assert (= (and b!624010 res!402306) b!624013))

(assert (= (and b!624013 res!402302) b!624015))

(assert (= (and b!624015 res!402303) b!624016))

(assert (= (and b!624016 res!402304) b!624014))

(declare-fun m!599239 () Bool)

(assert (=> b!624016 m!599239))

(declare-fun m!599241 () Bool)

(assert (=> b!624014 m!599241))

(declare-fun m!599243 () Bool)

(assert (=> b!624015 m!599243))

(declare-fun m!599245 () Bool)

(assert (=> b!624013 m!599245))

(declare-fun m!599247 () Bool)

(assert (=> start!56286 m!599247))

(declare-fun m!599249 () Bool)

(assert (=> start!56286 m!599249))

(declare-fun m!599251 () Bool)

(assert (=> b!624010 m!599251))

(declare-fun m!599253 () Bool)

(assert (=> b!624012 m!599253))

(assert (=> b!624012 m!599253))

(declare-fun m!599255 () Bool)

(assert (=> b!624012 m!599255))

(check-sat (not start!56286) (not b!624013) (not b!624012) (not b!624015) (not b!624016) (not b!624010) (not b!624014))
(check-sat)
