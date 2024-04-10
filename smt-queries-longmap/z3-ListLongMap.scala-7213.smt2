; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92342 () Bool)

(assert start!92342)

(declare-fun res!698814 () Bool)

(declare-fun e!595579 () Bool)

(assert (=> start!92342 (=> (not res!698814) (not e!595579))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66143 0))(
  ( (array!66144 (arr!31811 (Array (_ BitVec 32) (_ BitVec 64))) (size!32347 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66143)

(assert (=> start!92342 (= res!698814 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32347 a!3488)) (bvslt (size!32347 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92342 e!595579))

(assert (=> start!92342 true))

(declare-fun array_inv!24591 (array!66143) Bool)

(assert (=> start!92342 (array_inv!24591 a!3488)))

(declare-fun b!1049682 () Bool)

(declare-fun e!595578 () Bool)

(assert (=> b!1049682 (= e!595579 e!595578)))

(declare-fun res!698817 () Bool)

(assert (=> b!1049682 (=> (not res!698817) (not e!595578))))

(declare-fun lt!463615 () array!66143)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049682 (= res!698817 (arrayContainsKey!0 lt!463615 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049682 (= lt!463615 (array!66144 (store (arr!31811 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32347 a!3488)))))

(declare-fun b!1049683 () Bool)

(declare-fun res!698819 () Bool)

(declare-fun e!595582 () Bool)

(assert (=> b!1049683 (=> res!698819 e!595582)))

(declare-datatypes ((List!22123 0))(
  ( (Nil!22120) (Cons!22119 (h!23328 (_ BitVec 64)) (t!31430 List!22123)) )
))
(declare-fun noDuplicate!1501 (List!22123) Bool)

(assert (=> b!1049683 (= res!698819 (not (noDuplicate!1501 Nil!22120)))))

(declare-fun b!1049684 () Bool)

(declare-fun res!698818 () Bool)

(assert (=> b!1049684 (=> (not res!698818) (not e!595579))))

(declare-fun arrayNoDuplicates!0 (array!66143 (_ BitVec 32) List!22123) Bool)

(assert (=> b!1049684 (= res!698818 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22120))))

(declare-fun b!1049685 () Bool)

(declare-fun res!698815 () Bool)

(assert (=> b!1049685 (=> (not res!698815) (not e!595579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049685 (= res!698815 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049686 () Bool)

(declare-fun e!595580 () Bool)

(assert (=> b!1049686 (= e!595578 e!595580)))

(declare-fun res!698816 () Bool)

(assert (=> b!1049686 (=> (not res!698816) (not e!595580))))

(declare-fun lt!463617 () (_ BitVec 32))

(assert (=> b!1049686 (= res!698816 (not (= lt!463617 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66143 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049686 (= lt!463617 (arrayScanForKey!0 lt!463615 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049687 () Bool)

(declare-fun e!595575 () Bool)

(declare-fun e!595581 () Bool)

(assert (=> b!1049687 (= e!595575 e!595581)))

(declare-fun res!698812 () Bool)

(assert (=> b!1049687 (=> res!698812 e!595581)))

(assert (=> b!1049687 (= res!698812 (bvsle lt!463617 i!1381))))

(declare-fun b!1049688 () Bool)

(declare-fun res!698810 () Bool)

(assert (=> b!1049688 (=> (not res!698810) (not e!595579))))

(assert (=> b!1049688 (= res!698810 (= (select (arr!31811 a!3488) i!1381) k0!2747))))

(declare-fun b!1049689 () Bool)

(assert (=> b!1049689 (= e!595582 true)))

(declare-fun lt!463616 () Bool)

(declare-fun contains!6116 (List!22123 (_ BitVec 64)) Bool)

(assert (=> b!1049689 (= lt!463616 (contains!6116 Nil!22120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049690 () Bool)

(declare-fun e!595577 () Bool)

(assert (=> b!1049690 (= e!595580 (not e!595577))))

(declare-fun res!698808 () Bool)

(assert (=> b!1049690 (=> res!698808 e!595577)))

(assert (=> b!1049690 (= res!698808 (bvsle lt!463617 i!1381))))

(assert (=> b!1049690 e!595575))

(declare-fun res!698811 () Bool)

(assert (=> b!1049690 (=> (not res!698811) (not e!595575))))

(assert (=> b!1049690 (= res!698811 (= (select (store (arr!31811 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463617) k0!2747))))

(declare-fun b!1049691 () Bool)

(assert (=> b!1049691 (= e!595581 (arrayContainsKey!0 a!3488 k0!2747 lt!463617))))

(declare-fun b!1049692 () Bool)

(assert (=> b!1049692 (= e!595577 e!595582)))

(declare-fun res!698813 () Bool)

(assert (=> b!1049692 (=> res!698813 e!595582)))

(assert (=> b!1049692 (= res!698813 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32347 a!3488)))))

(assert (=> b!1049692 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34342 0))(
  ( (Unit!34343) )
))
(declare-fun lt!463614 () Unit!34342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34342)

(assert (=> b!1049692 (= lt!463614 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463617 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049692 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22120)))

(declare-fun lt!463613 () Unit!34342)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66143 (_ BitVec 32) (_ BitVec 32)) Unit!34342)

(assert (=> b!1049692 (= lt!463613 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049693 () Bool)

(declare-fun res!698809 () Bool)

(assert (=> b!1049693 (=> res!698809 e!595582)))

(assert (=> b!1049693 (= res!698809 (contains!6116 Nil!22120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92342 res!698814) b!1049684))

(assert (= (and b!1049684 res!698818) b!1049685))

(assert (= (and b!1049685 res!698815) b!1049688))

(assert (= (and b!1049688 res!698810) b!1049682))

(assert (= (and b!1049682 res!698817) b!1049686))

(assert (= (and b!1049686 res!698816) b!1049690))

(assert (= (and b!1049690 res!698811) b!1049687))

(assert (= (and b!1049687 (not res!698812)) b!1049691))

(assert (= (and b!1049690 (not res!698808)) b!1049692))

(assert (= (and b!1049692 (not res!698813)) b!1049683))

(assert (= (and b!1049683 (not res!698819)) b!1049693))

(assert (= (and b!1049693 (not res!698809)) b!1049689))

(declare-fun m!970417 () Bool)

(assert (=> b!1049682 m!970417))

(declare-fun m!970419 () Bool)

(assert (=> b!1049682 m!970419))

(declare-fun m!970421 () Bool)

(assert (=> b!1049684 m!970421))

(declare-fun m!970423 () Bool)

(assert (=> start!92342 m!970423))

(declare-fun m!970425 () Bool)

(assert (=> b!1049691 m!970425))

(declare-fun m!970427 () Bool)

(assert (=> b!1049692 m!970427))

(declare-fun m!970429 () Bool)

(assert (=> b!1049692 m!970429))

(declare-fun m!970431 () Bool)

(assert (=> b!1049692 m!970431))

(declare-fun m!970433 () Bool)

(assert (=> b!1049692 m!970433))

(declare-fun m!970435 () Bool)

(assert (=> b!1049688 m!970435))

(declare-fun m!970437 () Bool)

(assert (=> b!1049683 m!970437))

(assert (=> b!1049690 m!970419))

(declare-fun m!970439 () Bool)

(assert (=> b!1049690 m!970439))

(declare-fun m!970441 () Bool)

(assert (=> b!1049689 m!970441))

(declare-fun m!970443 () Bool)

(assert (=> b!1049685 m!970443))

(declare-fun m!970445 () Bool)

(assert (=> b!1049693 m!970445))

(declare-fun m!970447 () Bool)

(assert (=> b!1049686 m!970447))

(check-sat (not b!1049684) (not b!1049692) (not b!1049685) (not b!1049689) (not start!92342) (not b!1049682) (not b!1049683) (not b!1049686) (not b!1049691) (not b!1049693))
