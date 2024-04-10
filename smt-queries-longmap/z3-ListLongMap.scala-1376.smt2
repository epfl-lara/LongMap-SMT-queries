; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27110 () Bool)

(assert start!27110)

(declare-fun b!280259 () Bool)

(declare-fun e!178497 () Bool)

(declare-fun e!178499 () Bool)

(assert (=> b!280259 (= e!178497 e!178499)))

(declare-fun res!143332 () Bool)

(assert (=> b!280259 (=> (not res!143332) (not e!178499))))

(declare-datatypes ((SeekEntryResult!1764 0))(
  ( (MissingZero!1764 (index!9226 (_ BitVec 32))) (Found!1764 (index!9227 (_ BitVec 32))) (Intermediate!1764 (undefined!2576 Bool) (index!9228 (_ BitVec 32)) (x!27466 (_ BitVec 32))) (Undefined!1764) (MissingVacant!1764 (index!9229 (_ BitVec 32))) )
))
(declare-fun lt!138799 () SeekEntryResult!1764)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280259 (= res!143332 (or (= lt!138799 (MissingZero!1764 i!1267)) (= lt!138799 (MissingVacant!1764 i!1267))))))

(declare-datatypes ((array!13928 0))(
  ( (array!13929 (arr!6606 (Array (_ BitVec 32) (_ BitVec 64))) (size!6958 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13928)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13928 (_ BitVec 32)) SeekEntryResult!1764)

(assert (=> b!280259 (= lt!138799 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280260 () Bool)

(declare-fun res!143335 () Bool)

(assert (=> b!280260 (=> (not res!143335) (not e!178497))))

(declare-fun arrayContainsKey!0 (array!13928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280260 (= res!143335 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280261 () Bool)

(declare-fun res!143331 () Bool)

(assert (=> b!280261 (=> (not res!143331) (not e!178499))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280261 (= res!143331 (validKeyInArray!0 (select (arr!6606 a!3325) startIndex!26)))))

(declare-fun b!280262 () Bool)

(declare-fun res!143333 () Bool)

(assert (=> b!280262 (=> (not res!143333) (not e!178499))))

(declare-datatypes ((List!4414 0))(
  ( (Nil!4411) (Cons!4410 (h!5080 (_ BitVec 64)) (t!9496 List!4414)) )
))
(declare-fun contains!1986 (List!4414 (_ BitVec 64)) Bool)

(assert (=> b!280262 (= res!143333 (not (contains!1986 Nil!4411 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280263 () Bool)

(declare-fun res!143336 () Bool)

(assert (=> b!280263 (=> (not res!143336) (not e!178497))))

(declare-fun arrayNoDuplicates!0 (array!13928 (_ BitVec 32) List!4414) Bool)

(assert (=> b!280263 (= res!143336 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4411))))

(declare-fun b!280264 () Bool)

(declare-fun res!143339 () Bool)

(assert (=> b!280264 (=> (not res!143339) (not e!178499))))

(assert (=> b!280264 (= res!143339 (not (= startIndex!26 i!1267)))))

(declare-fun b!280265 () Bool)

(declare-fun res!143338 () Bool)

(assert (=> b!280265 (=> (not res!143338) (not e!178499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13928 (_ BitVec 32)) Bool)

(assert (=> b!280265 (= res!143338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280266 () Bool)

(declare-fun res!143337 () Bool)

(assert (=> b!280266 (=> (not res!143337) (not e!178499))))

(declare-fun noDuplicate!168 (List!4414) Bool)

(assert (=> b!280266 (= res!143337 (noDuplicate!168 Nil!4411))))

(declare-fun b!280267 () Bool)

(declare-fun res!143329 () Bool)

(assert (=> b!280267 (=> (not res!143329) (not e!178499))))

(assert (=> b!280267 (= res!143329 (and (bvslt (size!6958 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6958 a!3325))))))

(declare-fun b!280268 () Bool)

(declare-fun res!143334 () Bool)

(assert (=> b!280268 (=> (not res!143334) (not e!178499))))

(assert (=> b!280268 (= res!143334 (not (contains!1986 Nil!4411 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280269 () Bool)

(declare-fun res!143328 () Bool)

(assert (=> b!280269 (=> (not res!143328) (not e!178497))))

(assert (=> b!280269 (= res!143328 (and (= (size!6958 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6958 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6958 a!3325))))))

(declare-fun b!280270 () Bool)

(declare-fun res!143340 () Bool)

(assert (=> b!280270 (=> (not res!143340) (not e!178497))))

(assert (=> b!280270 (= res!143340 (validKeyInArray!0 k0!2581))))

(declare-fun res!143330 () Bool)

(assert (=> start!27110 (=> (not res!143330) (not e!178497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27110 (= res!143330 (validMask!0 mask!3868))))

(assert (=> start!27110 e!178497))

(declare-fun array_inv!4569 (array!13928) Bool)

(assert (=> start!27110 (array_inv!4569 a!3325)))

(assert (=> start!27110 true))

(declare-fun b!280271 () Bool)

(assert (=> b!280271 (= e!178499 false)))

(declare-fun lt!138798 () Bool)

(assert (=> b!280271 (= lt!138798 (contains!1986 Nil!4411 k0!2581))))

(assert (= (and start!27110 res!143330) b!280269))

(assert (= (and b!280269 res!143328) b!280270))

(assert (= (and b!280270 res!143340) b!280263))

(assert (= (and b!280263 res!143336) b!280260))

(assert (= (and b!280260 res!143335) b!280259))

(assert (= (and b!280259 res!143332) b!280265))

(assert (= (and b!280265 res!143338) b!280264))

(assert (= (and b!280264 res!143339) b!280261))

(assert (= (and b!280261 res!143331) b!280267))

(assert (= (and b!280267 res!143329) b!280266))

(assert (= (and b!280266 res!143337) b!280262))

(assert (= (and b!280262 res!143333) b!280268))

(assert (= (and b!280268 res!143334) b!280271))

(declare-fun m!294749 () Bool)

(assert (=> b!280259 m!294749))

(declare-fun m!294751 () Bool)

(assert (=> start!27110 m!294751))

(declare-fun m!294753 () Bool)

(assert (=> start!27110 m!294753))

(declare-fun m!294755 () Bool)

(assert (=> b!280265 m!294755))

(declare-fun m!294757 () Bool)

(assert (=> b!280266 m!294757))

(declare-fun m!294759 () Bool)

(assert (=> b!280262 m!294759))

(declare-fun m!294761 () Bool)

(assert (=> b!280263 m!294761))

(declare-fun m!294763 () Bool)

(assert (=> b!280271 m!294763))

(declare-fun m!294765 () Bool)

(assert (=> b!280261 m!294765))

(assert (=> b!280261 m!294765))

(declare-fun m!294767 () Bool)

(assert (=> b!280261 m!294767))

(declare-fun m!294769 () Bool)

(assert (=> b!280270 m!294769))

(declare-fun m!294771 () Bool)

(assert (=> b!280268 m!294771))

(declare-fun m!294773 () Bool)

(assert (=> b!280260 m!294773))

(check-sat (not b!280260) (not b!280263) (not b!280265) (not start!27110) (not b!280268) (not b!280261) (not b!280259) (not b!280271) (not b!280262) (not b!280270) (not b!280266))
(check-sat)
