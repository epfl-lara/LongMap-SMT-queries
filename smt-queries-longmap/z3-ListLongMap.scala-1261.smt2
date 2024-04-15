; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26126 () Bool)

(assert start!26126)

(declare-fun b!269462 () Bool)

(declare-datatypes ((Unit!8313 0))(
  ( (Unit!8314) )
))
(declare-fun e!173811 () Unit!8313)

(declare-fun lt!135067 () Unit!8313)

(assert (=> b!269462 (= e!173811 lt!135067)))

(declare-datatypes ((array!13212 0))(
  ( (array!13213 (arr!6255 (Array (_ BitVec 32) (_ BitVec 64))) (size!6608 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13212)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8313)

(assert (=> b!269462 (= lt!135067 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13212 (_ BitVec 32)) Bool)

(assert (=> b!269462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13213 (store (arr!6255 a!3325) i!1267 k0!2581) (size!6608 a!3325)) mask!3868)))

(declare-fun b!269463 () Bool)

(declare-fun res!133687 () Bool)

(declare-fun e!173812 () Bool)

(assert (=> b!269463 (=> (not res!133687) (not e!173812))))

(assert (=> b!269463 (= res!133687 (and (= (size!6608 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6608 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6608 a!3325))))))

(declare-fun res!133685 () Bool)

(assert (=> start!26126 (=> (not res!133685) (not e!173812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26126 (= res!133685 (validMask!0 mask!3868))))

(assert (=> start!26126 e!173812))

(declare-fun array_inv!4227 (array!13212) Bool)

(assert (=> start!26126 (array_inv!4227 a!3325)))

(assert (=> start!26126 true))

(declare-fun b!269464 () Bool)

(declare-fun res!133682 () Bool)

(assert (=> b!269464 (=> (not res!133682) (not e!173812))))

(declare-fun arrayContainsKey!0 (array!13212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269464 (= res!133682 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269465 () Bool)

(declare-fun res!133686 () Bool)

(declare-fun e!173813 () Bool)

(assert (=> b!269465 (=> (not res!133686) (not e!173813))))

(assert (=> b!269465 (= res!133686 (= startIndex!26 i!1267))))

(declare-fun b!269466 () Bool)

(assert (=> b!269466 (= e!173812 e!173813)))

(declare-fun res!133681 () Bool)

(assert (=> b!269466 (=> (not res!133681) (not e!173813))))

(declare-datatypes ((SeekEntryResult!1412 0))(
  ( (MissingZero!1412 (index!7818 (_ BitVec 32))) (Found!1412 (index!7819 (_ BitVec 32))) (Intermediate!1412 (undefined!2224 Bool) (index!7820 (_ BitVec 32)) (x!26184 (_ BitVec 32))) (Undefined!1412) (MissingVacant!1412 (index!7821 (_ BitVec 32))) )
))
(declare-fun lt!135069 () SeekEntryResult!1412)

(assert (=> b!269466 (= res!133681 (or (= lt!135069 (MissingZero!1412 i!1267)) (= lt!135069 (MissingVacant!1412 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13212 (_ BitVec 32)) SeekEntryResult!1412)

(assert (=> b!269466 (= lt!135069 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269467 () Bool)

(declare-fun res!133680 () Bool)

(assert (=> b!269467 (=> (not res!133680) (not e!173812))))

(declare-datatypes ((List!4036 0))(
  ( (Nil!4033) (Cons!4032 (h!4699 (_ BitVec 64)) (t!9109 List!4036)) )
))
(declare-fun arrayNoDuplicates!0 (array!13212 (_ BitVec 32) List!4036) Bool)

(assert (=> b!269467 (= res!133680 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4033))))

(declare-fun b!269468 () Bool)

(declare-fun Unit!8315 () Unit!8313)

(assert (=> b!269468 (= e!173811 Unit!8315)))

(declare-fun b!269469 () Bool)

(declare-fun res!133684 () Bool)

(assert (=> b!269469 (=> (not res!133684) (not e!173812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269469 (= res!133684 (validKeyInArray!0 k0!2581))))

(declare-fun b!269470 () Bool)

(assert (=> b!269470 (= e!173813 false)))

(declare-fun lt!135068 () Unit!8313)

(assert (=> b!269470 (= lt!135068 e!173811)))

(declare-fun c!45442 () Bool)

(assert (=> b!269470 (= c!45442 (bvslt startIndex!26 (bvsub (size!6608 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269471 () Bool)

(declare-fun res!133683 () Bool)

(assert (=> b!269471 (=> (not res!133683) (not e!173813))))

(assert (=> b!269471 (= res!133683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26126 res!133685) b!269463))

(assert (= (and b!269463 res!133687) b!269469))

(assert (= (and b!269469 res!133684) b!269467))

(assert (= (and b!269467 res!133680) b!269464))

(assert (= (and b!269464 res!133682) b!269466))

(assert (= (and b!269466 res!133681) b!269471))

(assert (= (and b!269471 res!133683) b!269465))

(assert (= (and b!269465 res!133686) b!269470))

(assert (= (and b!269470 c!45442) b!269462))

(assert (= (and b!269470 (not c!45442)) b!269468))

(declare-fun m!284819 () Bool)

(assert (=> b!269469 m!284819))

(declare-fun m!284821 () Bool)

(assert (=> b!269464 m!284821))

(declare-fun m!284823 () Bool)

(assert (=> start!26126 m!284823))

(declare-fun m!284825 () Bool)

(assert (=> start!26126 m!284825))

(declare-fun m!284827 () Bool)

(assert (=> b!269462 m!284827))

(declare-fun m!284829 () Bool)

(assert (=> b!269462 m!284829))

(declare-fun m!284831 () Bool)

(assert (=> b!269462 m!284831))

(declare-fun m!284833 () Bool)

(assert (=> b!269471 m!284833))

(declare-fun m!284835 () Bool)

(assert (=> b!269467 m!284835))

(declare-fun m!284837 () Bool)

(assert (=> b!269466 m!284837))

(check-sat (not b!269467) (not start!26126) (not b!269466) (not b!269464) (not b!269471) (not b!269462) (not b!269469))
(check-sat)
