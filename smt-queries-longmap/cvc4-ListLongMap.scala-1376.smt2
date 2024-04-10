; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27112 () Bool)

(assert start!27112)

(declare-fun b!280298 () Bool)

(declare-fun res!143378 () Bool)

(declare-fun e!178507 () Bool)

(assert (=> b!280298 (=> (not res!143378) (not e!178507))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280298 (= res!143378 (not (= startIndex!26 i!1267)))))

(declare-fun b!280299 () Bool)

(declare-fun res!143370 () Bool)

(declare-fun e!178508 () Bool)

(assert (=> b!280299 (=> (not res!143370) (not e!178508))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280299 (= res!143370 (validKeyInArray!0 k!2581))))

(declare-fun res!143375 () Bool)

(assert (=> start!27112 (=> (not res!143375) (not e!178508))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27112 (= res!143375 (validMask!0 mask!3868))))

(assert (=> start!27112 e!178508))

(declare-datatypes ((array!13930 0))(
  ( (array!13931 (arr!6607 (Array (_ BitVec 32) (_ BitVec 64))) (size!6959 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13930)

(declare-fun array_inv!4570 (array!13930) Bool)

(assert (=> start!27112 (array_inv!4570 a!3325)))

(assert (=> start!27112 true))

(declare-fun b!280300 () Bool)

(declare-fun res!143372 () Bool)

(assert (=> b!280300 (=> (not res!143372) (not e!178508))))

(assert (=> b!280300 (= res!143372 (and (= (size!6959 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6959 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6959 a!3325))))))

(declare-fun b!280301 () Bool)

(declare-fun res!143374 () Bool)

(assert (=> b!280301 (=> (not res!143374) (not e!178507))))

(declare-datatypes ((List!4415 0))(
  ( (Nil!4412) (Cons!4411 (h!5081 (_ BitVec 64)) (t!9497 List!4415)) )
))
(declare-fun contains!1987 (List!4415 (_ BitVec 64)) Bool)

(assert (=> b!280301 (= res!143374 (not (contains!1987 Nil!4412 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280302 () Bool)

(declare-fun res!143376 () Bool)

(assert (=> b!280302 (=> (not res!143376) (not e!178508))))

(declare-fun arrayNoDuplicates!0 (array!13930 (_ BitVec 32) List!4415) Bool)

(assert (=> b!280302 (= res!143376 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4412))))

(declare-fun b!280303 () Bool)

(declare-fun res!143369 () Bool)

(assert (=> b!280303 (=> (not res!143369) (not e!178507))))

(declare-fun noDuplicate!169 (List!4415) Bool)

(assert (=> b!280303 (= res!143369 (noDuplicate!169 Nil!4412))))

(declare-fun b!280304 () Bool)

(assert (=> b!280304 (= e!178507 false)))

(declare-fun lt!138804 () Bool)

(assert (=> b!280304 (= lt!138804 (contains!1987 Nil!4412 k!2581))))

(declare-fun b!280305 () Bool)

(assert (=> b!280305 (= e!178508 e!178507)))

(declare-fun res!143373 () Bool)

(assert (=> b!280305 (=> (not res!143373) (not e!178507))))

(declare-datatypes ((SeekEntryResult!1765 0))(
  ( (MissingZero!1765 (index!9230 (_ BitVec 32))) (Found!1765 (index!9231 (_ BitVec 32))) (Intermediate!1765 (undefined!2577 Bool) (index!9232 (_ BitVec 32)) (x!27467 (_ BitVec 32))) (Undefined!1765) (MissingVacant!1765 (index!9233 (_ BitVec 32))) )
))
(declare-fun lt!138805 () SeekEntryResult!1765)

(assert (=> b!280305 (= res!143373 (or (= lt!138805 (MissingZero!1765 i!1267)) (= lt!138805 (MissingVacant!1765 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13930 (_ BitVec 32)) SeekEntryResult!1765)

(assert (=> b!280305 (= lt!138805 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280306 () Bool)

(declare-fun res!143379 () Bool)

(assert (=> b!280306 (=> (not res!143379) (not e!178507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13930 (_ BitVec 32)) Bool)

(assert (=> b!280306 (= res!143379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280307 () Bool)

(declare-fun res!143367 () Bool)

(assert (=> b!280307 (=> (not res!143367) (not e!178507))))

(assert (=> b!280307 (= res!143367 (and (bvslt (size!6959 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6959 a!3325))))))

(declare-fun b!280308 () Bool)

(declare-fun res!143371 () Bool)

(assert (=> b!280308 (=> (not res!143371) (not e!178507))))

(assert (=> b!280308 (= res!143371 (validKeyInArray!0 (select (arr!6607 a!3325) startIndex!26)))))

(declare-fun b!280309 () Bool)

(declare-fun res!143377 () Bool)

(assert (=> b!280309 (=> (not res!143377) (not e!178508))))

(declare-fun arrayContainsKey!0 (array!13930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280309 (= res!143377 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280310 () Bool)

(declare-fun res!143368 () Bool)

(assert (=> b!280310 (=> (not res!143368) (not e!178507))))

(assert (=> b!280310 (= res!143368 (not (contains!1987 Nil!4412 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27112 res!143375) b!280300))

(assert (= (and b!280300 res!143372) b!280299))

(assert (= (and b!280299 res!143370) b!280302))

(assert (= (and b!280302 res!143376) b!280309))

(assert (= (and b!280309 res!143377) b!280305))

(assert (= (and b!280305 res!143373) b!280306))

(assert (= (and b!280306 res!143379) b!280298))

(assert (= (and b!280298 res!143378) b!280308))

(assert (= (and b!280308 res!143371) b!280307))

(assert (= (and b!280307 res!143367) b!280303))

(assert (= (and b!280303 res!143369) b!280301))

(assert (= (and b!280301 res!143374) b!280310))

(assert (= (and b!280310 res!143368) b!280304))

(declare-fun m!294775 () Bool)

(assert (=> b!280303 m!294775))

(declare-fun m!294777 () Bool)

(assert (=> start!27112 m!294777))

(declare-fun m!294779 () Bool)

(assert (=> start!27112 m!294779))

(declare-fun m!294781 () Bool)

(assert (=> b!280302 m!294781))

(declare-fun m!294783 () Bool)

(assert (=> b!280309 m!294783))

(declare-fun m!294785 () Bool)

(assert (=> b!280304 m!294785))

(declare-fun m!294787 () Bool)

(assert (=> b!280299 m!294787))

(declare-fun m!294789 () Bool)

(assert (=> b!280310 m!294789))

(declare-fun m!294791 () Bool)

(assert (=> b!280306 m!294791))

(declare-fun m!294793 () Bool)

(assert (=> b!280305 m!294793))

(declare-fun m!294795 () Bool)

(assert (=> b!280301 m!294795))

(declare-fun m!294797 () Bool)

(assert (=> b!280308 m!294797))

(assert (=> b!280308 m!294797))

(declare-fun m!294799 () Bool)

(assert (=> b!280308 m!294799))

(push 1)

