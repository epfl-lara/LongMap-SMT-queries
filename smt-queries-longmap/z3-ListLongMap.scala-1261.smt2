; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26124 () Bool)

(assert start!26124)

(declare-fun b!269657 () Bool)

(declare-fun res!133796 () Bool)

(declare-fun e!173936 () Bool)

(assert (=> b!269657 (=> (not res!133796) (not e!173936))))

(declare-datatypes ((array!13220 0))(
  ( (array!13221 (arr!6259 (Array (_ BitVec 32) (_ BitVec 64))) (size!6611 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13220)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269657 (= res!133796 (and (= (size!6611 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6611 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6611 a!3325))))))

(declare-fun b!269658 () Bool)

(declare-fun res!133799 () Bool)

(declare-fun e!173938 () Bool)

(assert (=> b!269658 (=> (not res!133799) (not e!173938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13220 (_ BitVec 32)) Bool)

(assert (=> b!269658 (= res!133799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269659 () Bool)

(declare-fun res!133797 () Bool)

(assert (=> b!269659 (=> (not res!133797) (not e!173936))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269659 (= res!133797 (validKeyInArray!0 k0!2581))))

(declare-fun b!269660 () Bool)

(declare-datatypes ((Unit!8339 0))(
  ( (Unit!8340) )
))
(declare-fun e!173937 () Unit!8339)

(declare-fun Unit!8341 () Unit!8339)

(assert (=> b!269660 (= e!173937 Unit!8341)))

(declare-fun b!269661 () Bool)

(declare-fun res!133803 () Bool)

(assert (=> b!269661 (=> (not res!133803) (not e!173936))))

(declare-datatypes ((List!3980 0))(
  ( (Nil!3977) (Cons!3976 (h!4643 (_ BitVec 64)) (t!9054 List!3980)) )
))
(declare-fun arrayNoDuplicates!0 (array!13220 (_ BitVec 32) List!3980) Bool)

(assert (=> b!269661 (= res!133803 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3977))))

(declare-fun b!269656 () Bool)

(assert (=> b!269656 (= e!173936 e!173938)))

(declare-fun res!133800 () Bool)

(assert (=> b!269656 (=> (not res!133800) (not e!173938))))

(declare-datatypes ((SeekEntryResult!1382 0))(
  ( (MissingZero!1382 (index!7698 (_ BitVec 32))) (Found!1382 (index!7699 (_ BitVec 32))) (Intermediate!1382 (undefined!2194 Bool) (index!7700 (_ BitVec 32)) (x!26155 (_ BitVec 32))) (Undefined!1382) (MissingVacant!1382 (index!7701 (_ BitVec 32))) )
))
(declare-fun lt!135307 () SeekEntryResult!1382)

(assert (=> b!269656 (= res!133800 (or (= lt!135307 (MissingZero!1382 i!1267)) (= lt!135307 (MissingVacant!1382 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13220 (_ BitVec 32)) SeekEntryResult!1382)

(assert (=> b!269656 (= lt!135307 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!133801 () Bool)

(assert (=> start!26124 (=> (not res!133801) (not e!173936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26124 (= res!133801 (validMask!0 mask!3868))))

(assert (=> start!26124 e!173936))

(declare-fun array_inv!4209 (array!13220) Bool)

(assert (=> start!26124 (array_inv!4209 a!3325)))

(assert (=> start!26124 true))

(declare-fun b!269662 () Bool)

(declare-fun res!133798 () Bool)

(assert (=> b!269662 (=> (not res!133798) (not e!173936))))

(declare-fun arrayContainsKey!0 (array!13220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269662 (= res!133798 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269663 () Bool)

(assert (=> b!269663 (= e!173938 false)))

(declare-fun lt!135308 () Unit!8339)

(assert (=> b!269663 (= lt!135308 e!173937)))

(declare-fun c!45481 () Bool)

(assert (=> b!269663 (= c!45481 (bvslt startIndex!26 (bvsub (size!6611 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269664 () Bool)

(declare-fun res!133802 () Bool)

(assert (=> b!269664 (=> (not res!133802) (not e!173938))))

(assert (=> b!269664 (= res!133802 (= startIndex!26 i!1267))))

(declare-fun b!269665 () Bool)

(declare-fun lt!135309 () Unit!8339)

(assert (=> b!269665 (= e!173937 lt!135309)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13220 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8339)

(assert (=> b!269665 (= lt!135309 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269665 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13221 (store (arr!6259 a!3325) i!1267 k0!2581) (size!6611 a!3325)) mask!3868)))

(assert (= (and start!26124 res!133801) b!269657))

(assert (= (and b!269657 res!133796) b!269659))

(assert (= (and b!269659 res!133797) b!269661))

(assert (= (and b!269661 res!133803) b!269662))

(assert (= (and b!269662 res!133798) b!269656))

(assert (= (and b!269656 res!133800) b!269658))

(assert (= (and b!269658 res!133799) b!269664))

(assert (= (and b!269664 res!133802) b!269663))

(assert (= (and b!269663 c!45481) b!269665))

(assert (= (and b!269663 (not c!45481)) b!269660))

(declare-fun m!285617 () Bool)

(assert (=> start!26124 m!285617))

(declare-fun m!285619 () Bool)

(assert (=> start!26124 m!285619))

(declare-fun m!285621 () Bool)

(assert (=> b!269661 m!285621))

(declare-fun m!285623 () Bool)

(assert (=> b!269658 m!285623))

(declare-fun m!285625 () Bool)

(assert (=> b!269659 m!285625))

(declare-fun m!285627 () Bool)

(assert (=> b!269656 m!285627))

(declare-fun m!285629 () Bool)

(assert (=> b!269665 m!285629))

(declare-fun m!285631 () Bool)

(assert (=> b!269665 m!285631))

(declare-fun m!285633 () Bool)

(assert (=> b!269665 m!285633))

(declare-fun m!285635 () Bool)

(assert (=> b!269662 m!285635))

(check-sat (not start!26124) (not b!269665) (not b!269661) (not b!269659) (not b!269658) (not b!269656) (not b!269662))
(check-sat)
