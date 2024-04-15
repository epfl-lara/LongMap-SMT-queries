; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26120 () Bool)

(assert start!26120)

(declare-fun b!269372 () Bool)

(declare-fun res!133613 () Bool)

(declare-fun e!173778 () Bool)

(assert (=> b!269372 (=> (not res!133613) (not e!173778))))

(declare-datatypes ((array!13206 0))(
  ( (array!13207 (arr!6252 (Array (_ BitVec 32) (_ BitVec 64))) (size!6605 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13206)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13206 (_ BitVec 32)) Bool)

(assert (=> b!269372 (= res!133613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269373 () Bool)

(assert (=> b!269373 (= e!173778 false)))

(declare-datatypes ((Unit!8304 0))(
  ( (Unit!8305) )
))
(declare-fun lt!135040 () Unit!8304)

(declare-fun e!173776 () Unit!8304)

(assert (=> b!269373 (= lt!135040 e!173776)))

(declare-fun c!45433 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269373 (= c!45433 (bvslt startIndex!26 (bvsub (size!6605 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269374 () Bool)

(declare-fun res!133608 () Bool)

(assert (=> b!269374 (=> (not res!133608) (not e!173778))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269374 (= res!133608 (= startIndex!26 i!1267))))

(declare-fun b!269375 () Bool)

(declare-fun Unit!8306 () Unit!8304)

(assert (=> b!269375 (= e!173776 Unit!8306)))

(declare-fun res!133614 () Bool)

(declare-fun e!173777 () Bool)

(assert (=> start!26120 (=> (not res!133614) (not e!173777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26120 (= res!133614 (validMask!0 mask!3868))))

(assert (=> start!26120 e!173777))

(declare-fun array_inv!4224 (array!13206) Bool)

(assert (=> start!26120 (array_inv!4224 a!3325)))

(assert (=> start!26120 true))

(declare-fun b!269376 () Bool)

(declare-fun res!133611 () Bool)

(assert (=> b!269376 (=> (not res!133611) (not e!173777))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269376 (= res!133611 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269377 () Bool)

(declare-fun res!133609 () Bool)

(assert (=> b!269377 (=> (not res!133609) (not e!173777))))

(assert (=> b!269377 (= res!133609 (and (= (size!6605 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6605 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6605 a!3325))))))

(declare-fun b!269378 () Bool)

(declare-fun lt!135041 () Unit!8304)

(assert (=> b!269378 (= e!173776 lt!135041)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8304)

(assert (=> b!269378 (= lt!135041 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269378 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13207 (store (arr!6252 a!3325) i!1267 k0!2581) (size!6605 a!3325)) mask!3868)))

(declare-fun b!269379 () Bool)

(assert (=> b!269379 (= e!173777 e!173778)))

(declare-fun res!133615 () Bool)

(assert (=> b!269379 (=> (not res!133615) (not e!173778))))

(declare-datatypes ((SeekEntryResult!1409 0))(
  ( (MissingZero!1409 (index!7806 (_ BitVec 32))) (Found!1409 (index!7807 (_ BitVec 32))) (Intermediate!1409 (undefined!2221 Bool) (index!7808 (_ BitVec 32)) (x!26173 (_ BitVec 32))) (Undefined!1409) (MissingVacant!1409 (index!7809 (_ BitVec 32))) )
))
(declare-fun lt!135042 () SeekEntryResult!1409)

(assert (=> b!269379 (= res!133615 (or (= lt!135042 (MissingZero!1409 i!1267)) (= lt!135042 (MissingVacant!1409 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13206 (_ BitVec 32)) SeekEntryResult!1409)

(assert (=> b!269379 (= lt!135042 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269380 () Bool)

(declare-fun res!133612 () Bool)

(assert (=> b!269380 (=> (not res!133612) (not e!173777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269380 (= res!133612 (validKeyInArray!0 k0!2581))))

(declare-fun b!269381 () Bool)

(declare-fun res!133610 () Bool)

(assert (=> b!269381 (=> (not res!133610) (not e!173777))))

(declare-datatypes ((List!4033 0))(
  ( (Nil!4030) (Cons!4029 (h!4696 (_ BitVec 64)) (t!9106 List!4033)) )
))
(declare-fun arrayNoDuplicates!0 (array!13206 (_ BitVec 32) List!4033) Bool)

(assert (=> b!269381 (= res!133610 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4030))))

(assert (= (and start!26120 res!133614) b!269377))

(assert (= (and b!269377 res!133609) b!269380))

(assert (= (and b!269380 res!133612) b!269381))

(assert (= (and b!269381 res!133610) b!269376))

(assert (= (and b!269376 res!133611) b!269379))

(assert (= (and b!269379 res!133615) b!269372))

(assert (= (and b!269372 res!133613) b!269374))

(assert (= (and b!269374 res!133608) b!269373))

(assert (= (and b!269373 c!45433) b!269378))

(assert (= (and b!269373 (not c!45433)) b!269375))

(declare-fun m!284759 () Bool)

(assert (=> b!269376 m!284759))

(declare-fun m!284761 () Bool)

(assert (=> b!269381 m!284761))

(declare-fun m!284763 () Bool)

(assert (=> start!26120 m!284763))

(declare-fun m!284765 () Bool)

(assert (=> start!26120 m!284765))

(declare-fun m!284767 () Bool)

(assert (=> b!269378 m!284767))

(declare-fun m!284769 () Bool)

(assert (=> b!269378 m!284769))

(declare-fun m!284771 () Bool)

(assert (=> b!269378 m!284771))

(declare-fun m!284773 () Bool)

(assert (=> b!269379 m!284773))

(declare-fun m!284775 () Bool)

(assert (=> b!269380 m!284775))

(declare-fun m!284777 () Bool)

(assert (=> b!269372 m!284777))

(check-sat (not start!26120) (not b!269376) (not b!269381) (not b!269380) (not b!269378) (not b!269379) (not b!269372))
(check-sat)
