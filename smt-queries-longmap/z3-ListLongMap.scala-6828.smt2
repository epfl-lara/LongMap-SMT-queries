; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85960 () Bool)

(assert start!85960)

(declare-fun b!996028 () Bool)

(declare-fun res!666236 () Bool)

(declare-fun e!562009 () Bool)

(assert (=> b!996028 (=> (not res!666236) (not e!562009))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996028 (= res!666236 (validKeyInArray!0 k0!2224))))

(declare-fun res!666234 () Bool)

(assert (=> start!85960 (=> (not res!666234) (not e!562009))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85960 (= res!666234 (validMask!0 mask!3464))))

(assert (=> start!85960 e!562009))

(declare-datatypes ((array!63010 0))(
  ( (array!63011 (arr!30338 (Array (_ BitVec 32) (_ BitVec 64))) (size!30840 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63010)

(declare-fun array_inv!23462 (array!63010) Bool)

(assert (=> start!85960 (array_inv!23462 a!3219)))

(assert (=> start!85960 true))

(declare-fun b!996029 () Bool)

(declare-fun e!562008 () Bool)

(assert (=> b!996029 (= e!562008 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441106 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996029 (= lt!441106 (toIndex!0 (select (arr!30338 a!3219) j!170) mask!3464))))

(declare-fun b!996030 () Bool)

(declare-fun res!666237 () Bool)

(assert (=> b!996030 (=> (not res!666237) (not e!562009))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996030 (= res!666237 (and (= (size!30840 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30840 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30840 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996031 () Bool)

(declare-fun res!666232 () Bool)

(assert (=> b!996031 (=> (not res!666232) (not e!562009))))

(assert (=> b!996031 (= res!666232 (validKeyInArray!0 (select (arr!30338 a!3219) j!170)))))

(declare-fun b!996032 () Bool)

(declare-fun res!666235 () Bool)

(assert (=> b!996032 (=> (not res!666235) (not e!562008))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996032 (= res!666235 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30840 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30840 a!3219))))))

(declare-fun b!996033 () Bool)

(assert (=> b!996033 (= e!562009 e!562008)))

(declare-fun res!666231 () Bool)

(assert (=> b!996033 (=> (not res!666231) (not e!562008))))

(declare-datatypes ((SeekEntryResult!9270 0))(
  ( (MissingZero!9270 (index!39451 (_ BitVec 32))) (Found!9270 (index!39452 (_ BitVec 32))) (Intermediate!9270 (undefined!10082 Bool) (index!39453 (_ BitVec 32)) (x!86887 (_ BitVec 32))) (Undefined!9270) (MissingVacant!9270 (index!39454 (_ BitVec 32))) )
))
(declare-fun lt!441107 () SeekEntryResult!9270)

(assert (=> b!996033 (= res!666231 (or (= lt!441107 (MissingVacant!9270 i!1194)) (= lt!441107 (MissingZero!9270 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63010 (_ BitVec 32)) SeekEntryResult!9270)

(assert (=> b!996033 (= lt!441107 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996034 () Bool)

(declare-fun res!666230 () Bool)

(assert (=> b!996034 (=> (not res!666230) (not e!562009))))

(declare-fun arrayContainsKey!0 (array!63010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996034 (= res!666230 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996035 () Bool)

(declare-fun res!666233 () Bool)

(assert (=> b!996035 (=> (not res!666233) (not e!562008))))

(declare-datatypes ((List!21014 0))(
  ( (Nil!21011) (Cons!21010 (h!22172 (_ BitVec 64)) (t!30015 List!21014)) )
))
(declare-fun arrayNoDuplicates!0 (array!63010 (_ BitVec 32) List!21014) Bool)

(assert (=> b!996035 (= res!666233 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21011))))

(declare-fun b!996036 () Bool)

(declare-fun res!666229 () Bool)

(assert (=> b!996036 (=> (not res!666229) (not e!562008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63010 (_ BitVec 32)) Bool)

(assert (=> b!996036 (= res!666229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!85960 res!666234) b!996030))

(assert (= (and b!996030 res!666237) b!996031))

(assert (= (and b!996031 res!666232) b!996028))

(assert (= (and b!996028 res!666236) b!996034))

(assert (= (and b!996034 res!666230) b!996033))

(assert (= (and b!996033 res!666231) b!996036))

(assert (= (and b!996036 res!666229) b!996035))

(assert (= (and b!996035 res!666233) b!996032))

(assert (= (and b!996032 res!666235) b!996029))

(declare-fun m!923269 () Bool)

(assert (=> b!996035 m!923269))

(declare-fun m!923271 () Bool)

(assert (=> b!996031 m!923271))

(assert (=> b!996031 m!923271))

(declare-fun m!923273 () Bool)

(assert (=> b!996031 m!923273))

(declare-fun m!923275 () Bool)

(assert (=> b!996034 m!923275))

(declare-fun m!923277 () Bool)

(assert (=> b!996036 m!923277))

(declare-fun m!923279 () Bool)

(assert (=> b!996033 m!923279))

(declare-fun m!923281 () Bool)

(assert (=> b!996028 m!923281))

(assert (=> b!996029 m!923271))

(assert (=> b!996029 m!923271))

(declare-fun m!923283 () Bool)

(assert (=> b!996029 m!923283))

(declare-fun m!923285 () Bool)

(assert (=> start!85960 m!923285))

(declare-fun m!923287 () Bool)

(assert (=> start!85960 m!923287))

(check-sat (not b!996029) (not b!996033) (not b!996035) (not start!85960) (not b!996031) (not b!996028) (not b!996036) (not b!996034))
(check-sat)
