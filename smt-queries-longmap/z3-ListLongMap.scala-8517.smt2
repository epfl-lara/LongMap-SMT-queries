; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103892 () Bool)

(assert start!103892)

(declare-fun res!829298 () Bool)

(declare-fun e!704921 () Bool)

(assert (=> start!103892 (=> (not res!829298) (not e!704921))))

(declare-datatypes ((array!79910 0))(
  ( (array!79911 (arr!38549 (Array (_ BitVec 32) (_ BitVec 64))) (size!39087 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79910)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103892 (= res!829298 (and (bvslt (size!39087 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39087 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39087 a!3892))))))

(assert (=> start!103892 e!704921))

(declare-fun array_inv!29532 (array!79910) Bool)

(assert (=> start!103892 (array_inv!29532 a!3892)))

(assert (=> start!103892 true))

(declare-fun b!1243473 () Bool)

(declare-fun res!829300 () Bool)

(assert (=> b!1243473 (=> (not res!829300) (not e!704921))))

(assert (=> b!1243473 (= res!829300 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39087 a!3892)) (not (= newFrom!287 (size!39087 a!3892)))))))

(declare-fun b!1243474 () Bool)

(declare-fun res!829293 () Bool)

(declare-fun e!704922 () Bool)

(assert (=> b!1243474 (=> (not res!829293) (not e!704922))))

(declare-datatypes ((List!27453 0))(
  ( (Nil!27450) (Cons!27449 (h!28658 (_ BitVec 64)) (t!40913 List!27453)) )
))
(declare-fun lt!562242 () List!27453)

(declare-fun contains!7383 (List!27453 (_ BitVec 64)) Bool)

(assert (=> b!1243474 (= res!829293 (not (contains!7383 lt!562242 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243475 () Bool)

(declare-fun res!829294 () Bool)

(assert (=> b!1243475 (=> (not res!829294) (not e!704922))))

(assert (=> b!1243475 (= res!829294 (not (contains!7383 lt!562242 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243476 () Bool)

(declare-fun res!829299 () Bool)

(assert (=> b!1243476 (=> (not res!829299) (not e!704922))))

(assert (=> b!1243476 (= res!829299 (not (contains!7383 Nil!27450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243477 () Bool)

(declare-fun res!829292 () Bool)

(assert (=> b!1243477 (=> (not res!829292) (not e!704922))))

(declare-fun noDuplicate!2008 (List!27453) Bool)

(assert (=> b!1243477 (= res!829292 (noDuplicate!2008 lt!562242))))

(declare-fun b!1243478 () Bool)

(declare-fun res!829296 () Bool)

(assert (=> b!1243478 (=> (not res!829296) (not e!704922))))

(declare-fun subseq!638 (List!27453 List!27453) Bool)

(assert (=> b!1243478 (= res!829296 (subseq!638 Nil!27450 lt!562242))))

(declare-fun b!1243479 () Bool)

(assert (=> b!1243479 (= e!704922 false)))

(declare-fun lt!562240 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79910 (_ BitVec 32) List!27453) Bool)

(assert (=> b!1243479 (= lt!562240 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562242))))

(declare-datatypes ((Unit!41130 0))(
  ( (Unit!41131) )
))
(declare-fun lt!562241 () Unit!41130)

(declare-fun noDuplicateSubseq!92 (List!27453 List!27453) Unit!41130)

(assert (=> b!1243479 (= lt!562241 (noDuplicateSubseq!92 Nil!27450 lt!562242))))

(declare-fun b!1243480 () Bool)

(declare-fun res!829302 () Bool)

(assert (=> b!1243480 (=> (not res!829302) (not e!704922))))

(assert (=> b!1243480 (= res!829302 (not (contains!7383 Nil!27450 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243481 () Bool)

(declare-fun res!829295 () Bool)

(assert (=> b!1243481 (=> (not res!829295) (not e!704921))))

(assert (=> b!1243481 (= res!829295 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27450))))

(declare-fun b!1243482 () Bool)

(declare-fun res!829297 () Bool)

(assert (=> b!1243482 (=> (not res!829297) (not e!704921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243482 (= res!829297 (validKeyInArray!0 (select (arr!38549 a!3892) from!3270)))))

(declare-fun b!1243483 () Bool)

(assert (=> b!1243483 (= e!704921 e!704922)))

(declare-fun res!829301 () Bool)

(assert (=> b!1243483 (=> (not res!829301) (not e!704922))))

(assert (=> b!1243483 (= res!829301 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243483 (= lt!562242 (Cons!27449 (select (arr!38549 a!3892) from!3270) Nil!27450))))

(assert (= (and start!103892 res!829298) b!1243481))

(assert (= (and b!1243481 res!829295) b!1243473))

(assert (= (and b!1243473 res!829300) b!1243482))

(assert (= (and b!1243482 res!829297) b!1243483))

(assert (= (and b!1243483 res!829301) b!1243477))

(assert (= (and b!1243477 res!829292) b!1243475))

(assert (= (and b!1243475 res!829294) b!1243474))

(assert (= (and b!1243474 res!829293) b!1243476))

(assert (= (and b!1243476 res!829299) b!1243480))

(assert (= (and b!1243480 res!829302) b!1243478))

(assert (= (and b!1243478 res!829296) b!1243479))

(declare-fun m!1145553 () Bool)

(assert (=> b!1243481 m!1145553))

(declare-fun m!1145555 () Bool)

(assert (=> start!103892 m!1145555))

(declare-fun m!1145557 () Bool)

(assert (=> b!1243479 m!1145557))

(declare-fun m!1145559 () Bool)

(assert (=> b!1243479 m!1145559))

(declare-fun m!1145561 () Bool)

(assert (=> b!1243482 m!1145561))

(assert (=> b!1243482 m!1145561))

(declare-fun m!1145563 () Bool)

(assert (=> b!1243482 m!1145563))

(declare-fun m!1145565 () Bool)

(assert (=> b!1243475 m!1145565))

(assert (=> b!1243483 m!1145561))

(declare-fun m!1145567 () Bool)

(assert (=> b!1243474 m!1145567))

(declare-fun m!1145569 () Bool)

(assert (=> b!1243478 m!1145569))

(declare-fun m!1145571 () Bool)

(assert (=> b!1243480 m!1145571))

(declare-fun m!1145573 () Bool)

(assert (=> b!1243477 m!1145573))

(declare-fun m!1145575 () Bool)

(assert (=> b!1243476 m!1145575))

(check-sat (not b!1243476) (not b!1243480) (not b!1243474) (not b!1243482) (not b!1243479) (not b!1243477) (not start!103892) (not b!1243478) (not b!1243481) (not b!1243475))
(check-sat)
