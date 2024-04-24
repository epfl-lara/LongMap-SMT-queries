; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27108 () Bool)

(assert start!27108)

(declare-fun b!280267 () Bool)

(declare-fun e!178512 () Bool)

(assert (=> b!280267 (= e!178512 false)))

(declare-fun lt!138851 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4325 0))(
  ( (Nil!4322) (Cons!4321 (h!4991 (_ BitVec 64)) (t!9399 List!4325)) )
))
(declare-fun contains!1959 (List!4325 (_ BitVec 64)) Bool)

(assert (=> b!280267 (= lt!138851 (contains!1959 Nil!4322 k0!2581))))

(declare-fun b!280268 () Bool)

(declare-fun res!143322 () Bool)

(assert (=> b!280268 (=> (not res!143322) (not e!178512))))

(declare-fun noDuplicate!170 (List!4325) Bool)

(assert (=> b!280268 (= res!143322 (noDuplicate!170 Nil!4322))))

(declare-fun b!280269 () Bool)

(declare-fun res!143312 () Bool)

(assert (=> b!280269 (=> (not res!143312) (not e!178512))))

(declare-datatypes ((array!13925 0))(
  ( (array!13926 (arr!6604 (Array (_ BitVec 32) (_ BitVec 64))) (size!6956 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13925)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280269 (= res!143312 (validKeyInArray!0 (select (arr!6604 a!3325) startIndex!26)))))

(declare-fun b!280270 () Bool)

(declare-fun res!143311 () Bool)

(declare-fun e!178514 () Bool)

(assert (=> b!280270 (=> (not res!143311) (not e!178514))))

(assert (=> b!280270 (= res!143311 (validKeyInArray!0 k0!2581))))

(declare-fun b!280271 () Bool)

(declare-fun res!143317 () Bool)

(assert (=> b!280271 (=> (not res!143317) (not e!178512))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280271 (= res!143317 (not (= startIndex!26 i!1267)))))

(declare-fun b!280273 () Bool)

(declare-fun res!143313 () Bool)

(assert (=> b!280273 (=> (not res!143313) (not e!178514))))

(declare-fun arrayContainsKey!0 (array!13925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280273 (= res!143313 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280274 () Bool)

(declare-fun res!143314 () Bool)

(assert (=> b!280274 (=> (not res!143314) (not e!178512))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13925 (_ BitVec 32)) Bool)

(assert (=> b!280274 (= res!143314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280275 () Bool)

(declare-fun res!143318 () Bool)

(assert (=> b!280275 (=> (not res!143318) (not e!178512))))

(assert (=> b!280275 (= res!143318 (not (contains!1959 Nil!4322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280276 () Bool)

(declare-fun res!143321 () Bool)

(assert (=> b!280276 (=> (not res!143321) (not e!178512))))

(assert (=> b!280276 (= res!143321 (and (bvslt (size!6956 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6956 a!3325))))))

(declare-fun b!280277 () Bool)

(declare-fun res!143320 () Bool)

(assert (=> b!280277 (=> (not res!143320) (not e!178514))))

(assert (=> b!280277 (= res!143320 (and (= (size!6956 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6956 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6956 a!3325))))))

(declare-fun b!280278 () Bool)

(declare-fun res!143316 () Bool)

(assert (=> b!280278 (=> (not res!143316) (not e!178514))))

(declare-fun arrayNoDuplicates!0 (array!13925 (_ BitVec 32) List!4325) Bool)

(assert (=> b!280278 (= res!143316 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4322))))

(declare-fun b!280279 () Bool)

(declare-fun res!143319 () Bool)

(assert (=> b!280279 (=> (not res!143319) (not e!178512))))

(assert (=> b!280279 (= res!143319 (not (contains!1959 Nil!4322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280272 () Bool)

(assert (=> b!280272 (= e!178514 e!178512)))

(declare-fun res!143315 () Bool)

(assert (=> b!280272 (=> (not res!143315) (not e!178512))))

(declare-datatypes ((SeekEntryResult!1727 0))(
  ( (MissingZero!1727 (index!9078 (_ BitVec 32))) (Found!1727 (index!9079 (_ BitVec 32))) (Intermediate!1727 (undefined!2539 Bool) (index!9080 (_ BitVec 32)) (x!27429 (_ BitVec 32))) (Undefined!1727) (MissingVacant!1727 (index!9081 (_ BitVec 32))) )
))
(declare-fun lt!138852 () SeekEntryResult!1727)

(assert (=> b!280272 (= res!143315 (or (= lt!138852 (MissingZero!1727 i!1267)) (= lt!138852 (MissingVacant!1727 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13925 (_ BitVec 32)) SeekEntryResult!1727)

(assert (=> b!280272 (= lt!138852 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!143310 () Bool)

(assert (=> start!27108 (=> (not res!143310) (not e!178514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27108 (= res!143310 (validMask!0 mask!3868))))

(assert (=> start!27108 e!178514))

(declare-fun array_inv!4554 (array!13925) Bool)

(assert (=> start!27108 (array_inv!4554 a!3325)))

(assert (=> start!27108 true))

(assert (= (and start!27108 res!143310) b!280277))

(assert (= (and b!280277 res!143320) b!280270))

(assert (= (and b!280270 res!143311) b!280278))

(assert (= (and b!280278 res!143316) b!280273))

(assert (= (and b!280273 res!143313) b!280272))

(assert (= (and b!280272 res!143315) b!280274))

(assert (= (and b!280274 res!143314) b!280271))

(assert (= (and b!280271 res!143317) b!280269))

(assert (= (and b!280269 res!143312) b!280276))

(assert (= (and b!280276 res!143321) b!280268))

(assert (= (and b!280268 res!143322) b!280279))

(assert (= (and b!280279 res!143319) b!280275))

(assert (= (and b!280275 res!143318) b!280267))

(declare-fun m!294929 () Bool)

(assert (=> b!280272 m!294929))

(declare-fun m!294931 () Bool)

(assert (=> b!280269 m!294931))

(assert (=> b!280269 m!294931))

(declare-fun m!294933 () Bool)

(assert (=> b!280269 m!294933))

(declare-fun m!294935 () Bool)

(assert (=> b!280275 m!294935))

(declare-fun m!294937 () Bool)

(assert (=> b!280267 m!294937))

(declare-fun m!294939 () Bool)

(assert (=> b!280270 m!294939))

(declare-fun m!294941 () Bool)

(assert (=> b!280268 m!294941))

(declare-fun m!294943 () Bool)

(assert (=> b!280279 m!294943))

(declare-fun m!294945 () Bool)

(assert (=> start!27108 m!294945))

(declare-fun m!294947 () Bool)

(assert (=> start!27108 m!294947))

(declare-fun m!294949 () Bool)

(assert (=> b!280273 m!294949))

(declare-fun m!294951 () Bool)

(assert (=> b!280274 m!294951))

(declare-fun m!294953 () Bool)

(assert (=> b!280278 m!294953))

(check-sat (not b!280273) (not b!280278) (not b!280279) (not b!280274) (not b!280272) (not b!280267) (not b!280269) (not b!280268) (not b!280270) (not start!27108) (not b!280275))
(check-sat)
