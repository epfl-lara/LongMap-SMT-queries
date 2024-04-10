; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53022 () Bool)

(assert start!53022)

(declare-fun b!577342 () Bool)

(declare-fun res!365377 () Bool)

(declare-fun e!332084 () Bool)

(assert (=> b!577342 (=> (not res!365377) (not e!332084))))

(declare-datatypes ((array!36040 0))(
  ( (array!36041 (arr!17299 (Array (_ BitVec 32) (_ BitVec 64))) (size!17663 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36040)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577342 (= res!365377 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577343 () Bool)

(declare-fun res!365374 () Bool)

(assert (=> b!577343 (=> (not res!365374) (not e!332084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577343 (= res!365374 (validKeyInArray!0 k0!1786))))

(declare-fun b!577344 () Bool)

(assert (=> b!577344 (= e!332084 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5739 0))(
  ( (MissingZero!5739 (index!25183 (_ BitVec 32))) (Found!5739 (index!25184 (_ BitVec 32))) (Intermediate!5739 (undefined!6551 Bool) (index!25185 (_ BitVec 32)) (x!54096 (_ BitVec 32))) (Undefined!5739) (MissingVacant!5739 (index!25186 (_ BitVec 32))) )
))
(declare-fun lt!263947 () SeekEntryResult!5739)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36040 (_ BitVec 32)) SeekEntryResult!5739)

(assert (=> b!577344 (= lt!263947 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577345 () Bool)

(declare-fun res!365376 () Bool)

(assert (=> b!577345 (=> (not res!365376) (not e!332084))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577345 (= res!365376 (and (= (size!17663 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17663 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17663 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577346 () Bool)

(declare-fun res!365378 () Bool)

(assert (=> b!577346 (=> (not res!365378) (not e!332084))))

(assert (=> b!577346 (= res!365378 (validKeyInArray!0 (select (arr!17299 a!2986) j!136)))))

(declare-fun res!365375 () Bool)

(assert (=> start!53022 (=> (not res!365375) (not e!332084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53022 (= res!365375 (validMask!0 mask!3053))))

(assert (=> start!53022 e!332084))

(assert (=> start!53022 true))

(declare-fun array_inv!13095 (array!36040) Bool)

(assert (=> start!53022 (array_inv!13095 a!2986)))

(assert (= (and start!53022 res!365375) b!577345))

(assert (= (and b!577345 res!365376) b!577346))

(assert (= (and b!577346 res!365378) b!577343))

(assert (= (and b!577343 res!365374) b!577342))

(assert (= (and b!577342 res!365377) b!577344))

(declare-fun m!556241 () Bool)

(assert (=> b!577346 m!556241))

(assert (=> b!577346 m!556241))

(declare-fun m!556243 () Bool)

(assert (=> b!577346 m!556243))

(declare-fun m!556245 () Bool)

(assert (=> b!577342 m!556245))

(declare-fun m!556247 () Bool)

(assert (=> start!53022 m!556247))

(declare-fun m!556249 () Bool)

(assert (=> start!53022 m!556249))

(declare-fun m!556251 () Bool)

(assert (=> b!577343 m!556251))

(declare-fun m!556253 () Bool)

(assert (=> b!577344 m!556253))

(check-sat (not b!577344) (not start!53022) (not b!577343) (not b!577346) (not b!577342))
