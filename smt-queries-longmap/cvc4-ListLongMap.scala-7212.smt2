; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92338 () Bool)

(assert start!92338)

(declare-fun b!1049610 () Bool)

(declare-fun e!595534 () Bool)

(declare-fun e!595533 () Bool)

(assert (=> b!1049610 (= e!595534 e!595533)))

(declare-fun res!698747 () Bool)

(assert (=> b!1049610 (=> (not res!698747) (not e!595533))))

(declare-datatypes ((array!66139 0))(
  ( (array!66140 (arr!31809 (Array (_ BitVec 32) (_ BitVec 64))) (size!32345 (_ BitVec 32))) )
))
(declare-fun lt!463585 () array!66139)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049610 (= res!698747 (arrayContainsKey!0 lt!463585 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66139)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049610 (= lt!463585 (array!66140 (store (arr!31809 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32345 a!3488)))))

(declare-fun b!1049611 () Bool)

(declare-fun e!595529 () Bool)

(assert (=> b!1049611 (= e!595533 e!595529)))

(declare-fun res!698744 () Bool)

(assert (=> b!1049611 (=> (not res!698744) (not e!595529))))

(declare-fun lt!463586 () (_ BitVec 32))

(assert (=> b!1049611 (= res!698744 (not (= lt!463586 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66139 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049611 (= lt!463586 (arrayScanForKey!0 lt!463585 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049612 () Bool)

(declare-fun res!698737 () Bool)

(assert (=> b!1049612 (=> (not res!698737) (not e!595534))))

(assert (=> b!1049612 (= res!698737 (= (select (arr!31809 a!3488) i!1381) k!2747))))

(declare-fun res!698745 () Bool)

(assert (=> start!92338 (=> (not res!698745) (not e!595534))))

(assert (=> start!92338 (= res!698745 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32345 a!3488)) (bvslt (size!32345 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92338 e!595534))

(assert (=> start!92338 true))

(declare-fun array_inv!24589 (array!66139) Bool)

(assert (=> start!92338 (array_inv!24589 a!3488)))

(declare-fun b!1049613 () Bool)

(declare-fun res!698746 () Bool)

(assert (=> b!1049613 (=> (not res!698746) (not e!595534))))

(declare-datatypes ((List!22121 0))(
  ( (Nil!22118) (Cons!22117 (h!23326 (_ BitVec 64)) (t!31428 List!22121)) )
))
(declare-fun arrayNoDuplicates!0 (array!66139 (_ BitVec 32) List!22121) Bool)

(assert (=> b!1049613 (= res!698746 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22118))))

(declare-fun b!1049614 () Bool)

(declare-fun res!698742 () Bool)

(declare-fun e!595532 () Bool)

(assert (=> b!1049614 (=> res!698742 e!595532)))

(declare-fun noDuplicate!1499 (List!22121) Bool)

(assert (=> b!1049614 (= res!698742 (not (noDuplicate!1499 Nil!22118)))))

(declare-fun b!1049615 () Bool)

(declare-fun e!595531 () Bool)

(declare-fun e!595528 () Bool)

(assert (=> b!1049615 (= e!595531 e!595528)))

(declare-fun res!698740 () Bool)

(assert (=> b!1049615 (=> res!698740 e!595528)))

(assert (=> b!1049615 (= res!698740 (bvsle lt!463586 i!1381))))

(declare-fun b!1049616 () Bool)

(assert (=> b!1049616 (= e!595532 true)))

(declare-fun lt!463584 () Bool)

(declare-fun contains!6114 (List!22121 (_ BitVec 64)) Bool)

(assert (=> b!1049616 (= lt!463584 (contains!6114 Nil!22118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049617 () Bool)

(declare-fun res!698736 () Bool)

(assert (=> b!1049617 (=> res!698736 e!595532)))

(assert (=> b!1049617 (= res!698736 (contains!6114 Nil!22118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049618 () Bool)

(assert (=> b!1049618 (= e!595528 (arrayContainsKey!0 a!3488 k!2747 lt!463586))))

(declare-fun b!1049619 () Bool)

(declare-fun e!595530 () Bool)

(assert (=> b!1049619 (= e!595529 (not e!595530))))

(declare-fun res!698739 () Bool)

(assert (=> b!1049619 (=> res!698739 e!595530)))

(assert (=> b!1049619 (= res!698739 (bvsle lt!463586 i!1381))))

(assert (=> b!1049619 e!595531))

(declare-fun res!698738 () Bool)

(assert (=> b!1049619 (=> (not res!698738) (not e!595531))))

(assert (=> b!1049619 (= res!698738 (= (select (store (arr!31809 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463586) k!2747))))

(declare-fun b!1049620 () Bool)

(declare-fun res!698741 () Bool)

(assert (=> b!1049620 (=> (not res!698741) (not e!595534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049620 (= res!698741 (validKeyInArray!0 k!2747))))

(declare-fun b!1049621 () Bool)

(assert (=> b!1049621 (= e!595530 e!595532)))

(declare-fun res!698743 () Bool)

(assert (=> b!1049621 (=> res!698743 e!595532)))

(assert (=> b!1049621 (= res!698743 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32345 a!3488)))))

(assert (=> b!1049621 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34338 0))(
  ( (Unit!34339) )
))
(declare-fun lt!463583 () Unit!34338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34338)

(assert (=> b!1049621 (= lt!463583 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463586 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049621 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22118)))

(declare-fun lt!463587 () Unit!34338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66139 (_ BitVec 32) (_ BitVec 32)) Unit!34338)

(assert (=> b!1049621 (= lt!463587 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92338 res!698745) b!1049613))

(assert (= (and b!1049613 res!698746) b!1049620))

(assert (= (and b!1049620 res!698741) b!1049612))

(assert (= (and b!1049612 res!698737) b!1049610))

(assert (= (and b!1049610 res!698747) b!1049611))

(assert (= (and b!1049611 res!698744) b!1049619))

(assert (= (and b!1049619 res!698738) b!1049615))

(assert (= (and b!1049615 (not res!698740)) b!1049618))

(assert (= (and b!1049619 (not res!698739)) b!1049621))

(assert (= (and b!1049621 (not res!698743)) b!1049614))

(assert (= (and b!1049614 (not res!698742)) b!1049617))

(assert (= (and b!1049617 (not res!698736)) b!1049616))

(declare-fun m!970353 () Bool)

(assert (=> b!1049621 m!970353))

(declare-fun m!970355 () Bool)

(assert (=> b!1049621 m!970355))

(declare-fun m!970357 () Bool)

(assert (=> b!1049621 m!970357))

(declare-fun m!970359 () Bool)

(assert (=> b!1049621 m!970359))

(declare-fun m!970361 () Bool)

(assert (=> b!1049616 m!970361))

(declare-fun m!970363 () Bool)

(assert (=> b!1049610 m!970363))

(declare-fun m!970365 () Bool)

(assert (=> b!1049610 m!970365))

(declare-fun m!970367 () Bool)

(assert (=> b!1049614 m!970367))

(assert (=> b!1049619 m!970365))

(declare-fun m!970369 () Bool)

(assert (=> b!1049619 m!970369))

(declare-fun m!970371 () Bool)

(assert (=> b!1049611 m!970371))

(declare-fun m!970373 () Bool)

(assert (=> b!1049620 m!970373))

(declare-fun m!970375 () Bool)

(assert (=> b!1049612 m!970375))

(declare-fun m!970377 () Bool)

(assert (=> start!92338 m!970377))

(declare-fun m!970379 () Bool)

(assert (=> b!1049618 m!970379))

(declare-fun m!970381 () Bool)

(assert (=> b!1049613 m!970381))

(declare-fun m!970383 () Bool)

(assert (=> b!1049617 m!970383))

(push 1)

(assert (not b!1049621))

(assert (not b!1049614))

(assert (not b!1049616))

(assert (not b!1049617))

(assert (not b!1049610))

(assert (not b!1049618))

(assert (not start!92338))

(assert (not b!1049611))

(assert (not b!1049613))

(assert (not b!1049620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

