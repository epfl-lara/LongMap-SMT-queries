; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92774 () Bool)

(assert start!92774)

(declare-fun b!1053690 () Bool)

(declare-fun res!702761 () Bool)

(declare-fun e!598495 () Bool)

(assert (=> b!1053690 (=> (not res!702761) (not e!598495))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053690 (= res!702761 (validKeyInArray!0 k!2747))))

(declare-fun b!1053691 () Bool)

(declare-fun e!598496 () Bool)

(declare-fun e!598499 () Bool)

(assert (=> b!1053691 (= e!598496 e!598499)))

(declare-fun res!702762 () Bool)

(assert (=> b!1053691 (=> res!702762 e!598499)))

(declare-fun lt!465034 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053691 (= res!702762 (bvsle lt!465034 i!1381))))

(declare-fun b!1053692 () Bool)

(declare-fun e!598497 () Bool)

(assert (=> b!1053692 (= e!598495 e!598497)))

(declare-fun res!702756 () Bool)

(assert (=> b!1053692 (=> (not res!702756) (not e!598497))))

(declare-datatypes ((array!66408 0))(
  ( (array!66409 (arr!31937 (Array (_ BitVec 32) (_ BitVec 64))) (size!32475 (_ BitVec 32))) )
))
(declare-fun lt!465033 () array!66408)

(declare-fun arrayContainsKey!0 (array!66408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053692 (= res!702756 (arrayContainsKey!0 lt!465033 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66408)

(assert (=> b!1053692 (= lt!465033 (array!66409 (store (arr!31937 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32475 a!3488)))))

(declare-fun res!702758 () Bool)

(assert (=> start!92774 (=> (not res!702758) (not e!598495))))

(assert (=> start!92774 (= res!702758 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32475 a!3488)) (bvslt (size!32475 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92774 e!598495))

(assert (=> start!92774 true))

(declare-fun array_inv!24720 (array!66408) Bool)

(assert (=> start!92774 (array_inv!24720 a!3488)))

(declare-fun b!1053693 () Bool)

(assert (=> b!1053693 (= e!598499 (arrayContainsKey!0 a!3488 k!2747 lt!465034))))

(declare-fun b!1053694 () Bool)

(declare-fun res!702757 () Bool)

(assert (=> b!1053694 (=> (not res!702757) (not e!598495))))

(declare-datatypes ((List!22308 0))(
  ( (Nil!22305) (Cons!22304 (h!23513 (_ BitVec 64)) (t!31606 List!22308)) )
))
(declare-fun arrayNoDuplicates!0 (array!66408 (_ BitVec 32) List!22308) Bool)

(assert (=> b!1053694 (= res!702757 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22305))))

(declare-fun b!1053695 () Bool)

(declare-fun res!702763 () Bool)

(assert (=> b!1053695 (=> (not res!702763) (not e!598495))))

(assert (=> b!1053695 (= res!702763 (= (select (arr!31937 a!3488) i!1381) k!2747))))

(declare-fun b!1053696 () Bool)

(declare-fun e!598498 () Bool)

(assert (=> b!1053696 (= e!598497 e!598498)))

(declare-fun res!702760 () Bool)

(assert (=> b!1053696 (=> (not res!702760) (not e!598498))))

(assert (=> b!1053696 (= res!702760 (not (= lt!465034 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66408 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053696 (= lt!465034 (arrayScanForKey!0 lt!465033 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053697 () Bool)

(assert (=> b!1053697 (= e!598498 (not (or (bvsle lt!465034 i!1381) (bvsgt #b00000000000000000000000000000000 (size!32475 a!3488)) (bvsle i!1381 (size!32475 a!3488)))))))

(assert (=> b!1053697 e!598496))

(declare-fun res!702759 () Bool)

(assert (=> b!1053697 (=> (not res!702759) (not e!598496))))

(assert (=> b!1053697 (= res!702759 (= (select (store (arr!31937 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465034) k!2747))))

(assert (= (and start!92774 res!702758) b!1053694))

(assert (= (and b!1053694 res!702757) b!1053690))

(assert (= (and b!1053690 res!702761) b!1053695))

(assert (= (and b!1053695 res!702763) b!1053692))

(assert (= (and b!1053692 res!702756) b!1053696))

(assert (= (and b!1053696 res!702760) b!1053697))

(assert (= (and b!1053697 res!702759) b!1053691))

(assert (= (and b!1053691 (not res!702762)) b!1053693))

(declare-fun m!973411 () Bool)

(assert (=> b!1053695 m!973411))

(declare-fun m!973413 () Bool)

(assert (=> start!92774 m!973413))

(declare-fun m!973415 () Bool)

(assert (=> b!1053692 m!973415))

(declare-fun m!973417 () Bool)

(assert (=> b!1053692 m!973417))

(declare-fun m!973419 () Bool)

(assert (=> b!1053696 m!973419))

(declare-fun m!973421 () Bool)

(assert (=> b!1053694 m!973421))

(declare-fun m!973423 () Bool)

(assert (=> b!1053690 m!973423))

(declare-fun m!973425 () Bool)

(assert (=> b!1053693 m!973425))

(assert (=> b!1053697 m!973417))

(declare-fun m!973427 () Bool)

(assert (=> b!1053697 m!973427))

(push 1)

(assert (not b!1053696))

(assert (not b!1053692))

(assert (not b!1053694))

(assert (not b!1053690))

(assert (not start!92774))

(assert (not b!1053693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

