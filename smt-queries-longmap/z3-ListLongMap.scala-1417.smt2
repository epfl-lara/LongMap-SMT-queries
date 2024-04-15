; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27530 () Bool)

(assert start!27530)

(declare-fun b!284298 () Bool)

(declare-fun res!146866 () Bool)

(declare-fun e!180343 () Bool)

(assert (=> b!284298 (=> (not res!146866) (not e!180343))))

(declare-datatypes ((array!14169 0))(
  ( (array!14170 (arr!6723 (Array (_ BitVec 32) (_ BitVec 64))) (size!7076 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14169)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284298 (= res!146866 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284299 () Bool)

(declare-fun res!146860 () Bool)

(declare-fun e!180344 () Bool)

(assert (=> b!284299 (=> (not res!146860) (not e!180344))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284299 (= res!146860 (not (validKeyInArray!0 (select (arr!6723 a!3325) startIndex!26))))))

(declare-fun b!284300 () Bool)

(assert (=> b!284300 (= e!180344 (and (bvslt startIndex!26 (bvsub (size!7076 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284301 () Bool)

(assert (=> b!284301 (= e!180343 e!180344)))

(declare-fun res!146863 () Bool)

(assert (=> b!284301 (=> (not res!146863) (not e!180344))))

(declare-datatypes ((SeekEntryResult!1880 0))(
  ( (MissingZero!1880 (index!9690 (_ BitVec 32))) (Found!1880 (index!9691 (_ BitVec 32))) (Intermediate!1880 (undefined!2692 Bool) (index!9692 (_ BitVec 32)) (x!27918 (_ BitVec 32))) (Undefined!1880) (MissingVacant!1880 (index!9693 (_ BitVec 32))) )
))
(declare-fun lt!140337 () SeekEntryResult!1880)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284301 (= res!146863 (or (= lt!140337 (MissingZero!1880 i!1267)) (= lt!140337 (MissingVacant!1880 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14169 (_ BitVec 32)) SeekEntryResult!1880)

(assert (=> b!284301 (= lt!140337 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284302 () Bool)

(declare-fun res!146859 () Bool)

(assert (=> b!284302 (=> (not res!146859) (not e!180344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14169 (_ BitVec 32)) Bool)

(assert (=> b!284302 (= res!146859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284303 () Bool)

(declare-fun res!146864 () Bool)

(assert (=> b!284303 (=> (not res!146864) (not e!180343))))

(assert (=> b!284303 (= res!146864 (and (= (size!7076 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7076 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7076 a!3325))))))

(declare-fun res!146862 () Bool)

(assert (=> start!27530 (=> (not res!146862) (not e!180343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27530 (= res!146862 (validMask!0 mask!3868))))

(assert (=> start!27530 e!180343))

(declare-fun array_inv!4695 (array!14169) Bool)

(assert (=> start!27530 (array_inv!4695 a!3325)))

(assert (=> start!27530 true))

(declare-fun b!284304 () Bool)

(declare-fun res!146858 () Bool)

(assert (=> b!284304 (=> (not res!146858) (not e!180344))))

(assert (=> b!284304 (= res!146858 (not (= startIndex!26 i!1267)))))

(declare-fun b!284305 () Bool)

(declare-fun res!146865 () Bool)

(assert (=> b!284305 (=> (not res!146865) (not e!180343))))

(assert (=> b!284305 (= res!146865 (validKeyInArray!0 k0!2581))))

(declare-fun b!284306 () Bool)

(declare-fun res!146861 () Bool)

(assert (=> b!284306 (=> (not res!146861) (not e!180343))))

(declare-datatypes ((List!4504 0))(
  ( (Nil!4501) (Cons!4500 (h!5173 (_ BitVec 64)) (t!9577 List!4504)) )
))
(declare-fun arrayNoDuplicates!0 (array!14169 (_ BitVec 32) List!4504) Bool)

(assert (=> b!284306 (= res!146861 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4501))))

(assert (= (and start!27530 res!146862) b!284303))

(assert (= (and b!284303 res!146864) b!284305))

(assert (= (and b!284305 res!146865) b!284306))

(assert (= (and b!284306 res!146861) b!284298))

(assert (= (and b!284298 res!146866) b!284301))

(assert (= (and b!284301 res!146863) b!284302))

(assert (= (and b!284302 res!146859) b!284304))

(assert (= (and b!284304 res!146858) b!284299))

(assert (= (and b!284299 res!146860) b!284300))

(declare-fun m!298871 () Bool)

(assert (=> b!284306 m!298871))

(declare-fun m!298873 () Bool)

(assert (=> b!284299 m!298873))

(assert (=> b!284299 m!298873))

(declare-fun m!298875 () Bool)

(assert (=> b!284299 m!298875))

(declare-fun m!298877 () Bool)

(assert (=> b!284305 m!298877))

(declare-fun m!298879 () Bool)

(assert (=> b!284302 m!298879))

(declare-fun m!298881 () Bool)

(assert (=> b!284298 m!298881))

(declare-fun m!298883 () Bool)

(assert (=> b!284301 m!298883))

(declare-fun m!298885 () Bool)

(assert (=> start!27530 m!298885))

(declare-fun m!298887 () Bool)

(assert (=> start!27530 m!298887))

(check-sat (not b!284298) (not b!284305) (not b!284302) (not b!284306) (not b!284299) (not b!284301) (not start!27530))
(check-sat)
