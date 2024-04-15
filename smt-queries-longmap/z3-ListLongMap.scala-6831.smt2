; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86016 () Bool)

(assert start!86016)

(declare-fun b!996179 () Bool)

(declare-fun e!562056 () Bool)

(declare-fun e!562057 () Bool)

(assert (=> b!996179 (= e!562056 e!562057)))

(declare-fun res!666418 () Bool)

(assert (=> b!996179 (=> (not res!666418) (not e!562057))))

(declare-datatypes ((SeekEntryResult!9272 0))(
  ( (MissingZero!9272 (index!39459 (_ BitVec 32))) (Found!9272 (index!39460 (_ BitVec 32))) (Intermediate!9272 (undefined!10084 Bool) (index!39461 (_ BitVec 32)) (x!86911 (_ BitVec 32))) (Undefined!9272) (MissingVacant!9272 (index!39462 (_ BitVec 32))) )
))
(declare-fun lt!440994 () SeekEntryResult!9272)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996179 (= res!666418 (or (= lt!440994 (MissingVacant!9272 i!1194)) (= lt!440994 (MissingZero!9272 i!1194))))))

(declare-datatypes ((array!62968 0))(
  ( (array!62969 (arr!30315 (Array (_ BitVec 32) (_ BitVec 64))) (size!30819 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62968)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62968 (_ BitVec 32)) SeekEntryResult!9272)

(assert (=> b!996179 (= lt!440994 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!666420 () Bool)

(assert (=> start!86016 (=> (not res!666420) (not e!562056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86016 (= res!666420 (validMask!0 mask!3464))))

(assert (=> start!86016 e!562056))

(declare-fun array_inv!23458 (array!62968) Bool)

(assert (=> start!86016 (array_inv!23458 a!3219)))

(assert (=> start!86016 true))

(declare-fun b!996180 () Bool)

(declare-fun res!666424 () Bool)

(assert (=> b!996180 (=> (not res!666424) (not e!562056))))

(declare-fun arrayContainsKey!0 (array!62968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996180 (= res!666424 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996181 () Bool)

(declare-fun res!666422 () Bool)

(assert (=> b!996181 (=> (not res!666422) (not e!562056))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996181 (= res!666422 (validKeyInArray!0 (select (arr!30315 a!3219) j!170)))))

(declare-fun b!996182 () Bool)

(declare-fun res!666421 () Bool)

(assert (=> b!996182 (=> (not res!666421) (not e!562057))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!996182 (= res!666421 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30819 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30819 a!3219))))))

(declare-fun b!996183 () Bool)

(declare-fun res!666425 () Bool)

(assert (=> b!996183 (=> (not res!666425) (not e!562056))))

(assert (=> b!996183 (= res!666425 (validKeyInArray!0 k0!2224))))

(declare-fun b!996184 () Bool)

(declare-fun res!666417 () Bool)

(assert (=> b!996184 (=> (not res!666417) (not e!562057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62968 (_ BitVec 32)) Bool)

(assert (=> b!996184 (= res!666417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996185 () Bool)

(declare-fun res!666423 () Bool)

(assert (=> b!996185 (=> (not res!666423) (not e!562057))))

(declare-datatypes ((List!21057 0))(
  ( (Nil!21054) (Cons!21053 (h!22218 (_ BitVec 64)) (t!30049 List!21057)) )
))
(declare-fun arrayNoDuplicates!0 (array!62968 (_ BitVec 32) List!21057) Bool)

(assert (=> b!996185 (= res!666423 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21054))))

(declare-fun b!996186 () Bool)

(declare-fun res!666419 () Bool)

(assert (=> b!996186 (=> (not res!666419) (not e!562056))))

(assert (=> b!996186 (= res!666419 (and (= (size!30819 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30819 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30819 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996187 () Bool)

(assert (=> b!996187 (= e!562057 false)))

(declare-fun lt!440995 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996187 (= lt!440995 (toIndex!0 (select (arr!30315 a!3219) j!170) mask!3464))))

(assert (= (and start!86016 res!666420) b!996186))

(assert (= (and b!996186 res!666419) b!996181))

(assert (= (and b!996181 res!666422) b!996183))

(assert (= (and b!996183 res!666425) b!996180))

(assert (= (and b!996180 res!666424) b!996179))

(assert (= (and b!996179 res!666418) b!996184))

(assert (= (and b!996184 res!666417) b!996185))

(assert (= (and b!996185 res!666423) b!996182))

(assert (= (and b!996182 res!666421) b!996187))

(declare-fun m!922795 () Bool)

(assert (=> start!86016 m!922795))

(declare-fun m!922797 () Bool)

(assert (=> start!86016 m!922797))

(declare-fun m!922799 () Bool)

(assert (=> b!996184 m!922799))

(declare-fun m!922801 () Bool)

(assert (=> b!996187 m!922801))

(assert (=> b!996187 m!922801))

(declare-fun m!922803 () Bool)

(assert (=> b!996187 m!922803))

(declare-fun m!922805 () Bool)

(assert (=> b!996183 m!922805))

(declare-fun m!922807 () Bool)

(assert (=> b!996185 m!922807))

(assert (=> b!996181 m!922801))

(assert (=> b!996181 m!922801))

(declare-fun m!922809 () Bool)

(assert (=> b!996181 m!922809))

(declare-fun m!922811 () Bool)

(assert (=> b!996180 m!922811))

(declare-fun m!922813 () Bool)

(assert (=> b!996179 m!922813))

(check-sat (not b!996187) (not b!996185) (not start!86016) (not b!996183) (not b!996184) (not b!996181) (not b!996180) (not b!996179))
(check-sat)
