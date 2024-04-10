; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92774 () Bool)

(assert start!92774)

(declare-fun lt!465227 () (_ BitVec 32))

(declare-datatypes ((array!66467 0))(
  ( (array!66468 (arr!31967 (Array (_ BitVec 32) (_ BitVec 64))) (size!32503 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66467)

(declare-fun e!598573 () Bool)

(declare-fun b!1053817 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053817 (= e!598573 (not (or (bvsle lt!465227 i!1381) (bvsgt #b00000000000000000000000000000000 (size!32503 a!3488)) (bvsle i!1381 (size!32503 a!3488)))))))

(declare-fun e!598572 () Bool)

(assert (=> b!1053817 e!598572))

(declare-fun res!702800 () Bool)

(assert (=> b!1053817 (=> (not res!702800) (not e!598572))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053817 (= res!702800 (= (select (store (arr!31967 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465227) k0!2747))))

(declare-fun b!1053818 () Bool)

(declare-fun res!702802 () Bool)

(declare-fun e!598569 () Bool)

(assert (=> b!1053818 (=> (not res!702802) (not e!598569))))

(declare-datatypes ((List!22279 0))(
  ( (Nil!22276) (Cons!22275 (h!23484 (_ BitVec 64)) (t!31586 List!22279)) )
))
(declare-fun arrayNoDuplicates!0 (array!66467 (_ BitVec 32) List!22279) Bool)

(assert (=> b!1053818 (= res!702802 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22276))))

(declare-fun res!702804 () Bool)

(assert (=> start!92774 (=> (not res!702804) (not e!598569))))

(assert (=> start!92774 (= res!702804 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32503 a!3488)) (bvslt (size!32503 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92774 e!598569))

(assert (=> start!92774 true))

(declare-fun array_inv!24747 (array!66467) Bool)

(assert (=> start!92774 (array_inv!24747 a!3488)))

(declare-fun b!1053819 () Bool)

(declare-fun e!598568 () Bool)

(assert (=> b!1053819 (= e!598568 e!598573)))

(declare-fun res!702801 () Bool)

(assert (=> b!1053819 (=> (not res!702801) (not e!598573))))

(assert (=> b!1053819 (= res!702801 (not (= lt!465227 i!1381)))))

(declare-fun lt!465228 () array!66467)

(declare-fun arrayScanForKey!0 (array!66467 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053819 (= lt!465227 (arrayScanForKey!0 lt!465228 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053820 () Bool)

(declare-fun res!702803 () Bool)

(assert (=> b!1053820 (=> (not res!702803) (not e!598569))))

(assert (=> b!1053820 (= res!702803 (= (select (arr!31967 a!3488) i!1381) k0!2747))))

(declare-fun b!1053821 () Bool)

(declare-fun e!598570 () Bool)

(declare-fun arrayContainsKey!0 (array!66467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053821 (= e!598570 (arrayContainsKey!0 a!3488 k0!2747 lt!465227))))

(declare-fun b!1053822 () Bool)

(declare-fun res!702799 () Bool)

(assert (=> b!1053822 (=> (not res!702799) (not e!598569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053822 (= res!702799 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053823 () Bool)

(assert (=> b!1053823 (= e!598572 e!598570)))

(declare-fun res!702806 () Bool)

(assert (=> b!1053823 (=> res!702806 e!598570)))

(assert (=> b!1053823 (= res!702806 (bvsle lt!465227 i!1381))))

(declare-fun b!1053824 () Bool)

(assert (=> b!1053824 (= e!598569 e!598568)))

(declare-fun res!702805 () Bool)

(assert (=> b!1053824 (=> (not res!702805) (not e!598568))))

(assert (=> b!1053824 (= res!702805 (arrayContainsKey!0 lt!465228 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053824 (= lt!465228 (array!66468 (store (arr!31967 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32503 a!3488)))))

(assert (= (and start!92774 res!702804) b!1053818))

(assert (= (and b!1053818 res!702802) b!1053822))

(assert (= (and b!1053822 res!702799) b!1053820))

(assert (= (and b!1053820 res!702803) b!1053824))

(assert (= (and b!1053824 res!702805) b!1053819))

(assert (= (and b!1053819 res!702801) b!1053817))

(assert (= (and b!1053817 res!702800) b!1053823))

(assert (= (and b!1053823 (not res!702806)) b!1053821))

(declare-fun m!974009 () Bool)

(assert (=> start!92774 m!974009))

(declare-fun m!974011 () Bool)

(assert (=> b!1053820 m!974011))

(declare-fun m!974013 () Bool)

(assert (=> b!1053824 m!974013))

(declare-fun m!974015 () Bool)

(assert (=> b!1053824 m!974015))

(declare-fun m!974017 () Bool)

(assert (=> b!1053822 m!974017))

(declare-fun m!974019 () Bool)

(assert (=> b!1053819 m!974019))

(declare-fun m!974021 () Bool)

(assert (=> b!1053818 m!974021))

(declare-fun m!974023 () Bool)

(assert (=> b!1053821 m!974023))

(assert (=> b!1053817 m!974015))

(declare-fun m!974025 () Bool)

(assert (=> b!1053817 m!974025))

(check-sat (not b!1053822) (not b!1053819) (not b!1053821) (not b!1053824) (not b!1053818) (not start!92774))
(check-sat)
