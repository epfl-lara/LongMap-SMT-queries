; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92862 () Bool)

(assert start!92862)

(declare-fun lt!465477 () (_ BitVec 32))

(declare-fun e!599186 () Bool)

(declare-fun b!1054608 () Bool)

(declare-datatypes ((array!66522 0))(
  ( (array!66523 (arr!31993 (Array (_ BitVec 32) (_ BitVec 64))) (size!32529 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66522)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054608 (= e!599186 (arrayContainsKey!0 a!3488 k!2747 lt!465477))))

(declare-fun b!1054609 () Bool)

(declare-fun e!599185 () Bool)

(declare-fun e!599183 () Bool)

(assert (=> b!1054609 (= e!599185 e!599183)))

(declare-fun res!703550 () Bool)

(assert (=> b!1054609 (=> (not res!703550) (not e!599183))))

(declare-fun lt!465480 () array!66522)

(assert (=> b!1054609 (= res!703550 (arrayContainsKey!0 lt!465480 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054609 (= lt!465480 (array!66523 (store (arr!31993 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32529 a!3488)))))

(declare-fun b!1054610 () Bool)

(declare-fun res!703552 () Bool)

(assert (=> b!1054610 (=> (not res!703552) (not e!599185))))

(declare-datatypes ((List!22305 0))(
  ( (Nil!22302) (Cons!22301 (h!23510 (_ BitVec 64)) (t!31612 List!22305)) )
))
(declare-fun arrayNoDuplicates!0 (array!66522 (_ BitVec 32) List!22305) Bool)

(assert (=> b!1054610 (= res!703552 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22302))))

(declare-fun b!1054611 () Bool)

(declare-fun e!599182 () Bool)

(assert (=> b!1054611 (= e!599183 e!599182)))

(declare-fun res!703553 () Bool)

(assert (=> b!1054611 (=> (not res!703553) (not e!599182))))

(assert (=> b!1054611 (= res!703553 (not (= lt!465477 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66522 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054611 (= lt!465477 (arrayScanForKey!0 lt!465480 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054612 () Bool)

(declare-fun e!599184 () Bool)

(assert (=> b!1054612 (= e!599184 true)))

(assert (=> b!1054612 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34544 0))(
  ( (Unit!34545) )
))
(declare-fun lt!465478 () Unit!34544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66522 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34544)

(assert (=> b!1054612 (= lt!465478 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465477 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054612 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22302)))

(declare-fun lt!465479 () Unit!34544)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66522 (_ BitVec 32) (_ BitVec 32)) Unit!34544)

(assert (=> b!1054612 (= lt!465479 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054613 () Bool)

(declare-fun res!703548 () Bool)

(assert (=> b!1054613 (=> (not res!703548) (not e!599185))))

(assert (=> b!1054613 (= res!703548 (= (select (arr!31993 a!3488) i!1381) k!2747))))

(declare-fun b!1054614 () Bool)

(declare-fun res!703551 () Bool)

(assert (=> b!1054614 (=> (not res!703551) (not e!599185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054614 (= res!703551 (validKeyInArray!0 k!2747))))

(declare-fun b!1054615 () Bool)

(declare-fun e!599187 () Bool)

(assert (=> b!1054615 (= e!599187 e!599186)))

(declare-fun res!703549 () Bool)

(assert (=> b!1054615 (=> res!703549 e!599186)))

(assert (=> b!1054615 (= res!703549 (bvsle lt!465477 i!1381))))

(declare-fun res!703556 () Bool)

(assert (=> start!92862 (=> (not res!703556) (not e!599185))))

(assert (=> start!92862 (= res!703556 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32529 a!3488)) (bvslt (size!32529 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92862 e!599185))

(assert (=> start!92862 true))

(declare-fun array_inv!24773 (array!66522) Bool)

(assert (=> start!92862 (array_inv!24773 a!3488)))

(declare-fun b!1054616 () Bool)

(assert (=> b!1054616 (= e!599182 (not e!599184))))

(declare-fun res!703555 () Bool)

(assert (=> b!1054616 (=> res!703555 e!599184)))

(assert (=> b!1054616 (= res!703555 (bvsle lt!465477 i!1381))))

(assert (=> b!1054616 e!599187))

(declare-fun res!703554 () Bool)

(assert (=> b!1054616 (=> (not res!703554) (not e!599187))))

(assert (=> b!1054616 (= res!703554 (= (select (store (arr!31993 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465477) k!2747))))

(assert (= (and start!92862 res!703556) b!1054610))

(assert (= (and b!1054610 res!703552) b!1054614))

(assert (= (and b!1054614 res!703551) b!1054613))

(assert (= (and b!1054613 res!703548) b!1054609))

(assert (= (and b!1054609 res!703550) b!1054611))

(assert (= (and b!1054611 res!703553) b!1054616))

(assert (= (and b!1054616 res!703554) b!1054615))

(assert (= (and b!1054615 (not res!703549)) b!1054608))

(assert (= (and b!1054616 (not res!703555)) b!1054612))

(declare-fun m!974657 () Bool)

(assert (=> b!1054611 m!974657))

(declare-fun m!974659 () Bool)

(assert (=> b!1054609 m!974659))

(declare-fun m!974661 () Bool)

(assert (=> b!1054609 m!974661))

(declare-fun m!974663 () Bool)

(assert (=> b!1054610 m!974663))

(declare-fun m!974665 () Bool)

(assert (=> start!92862 m!974665))

(declare-fun m!974667 () Bool)

(assert (=> b!1054614 m!974667))

(declare-fun m!974669 () Bool)

(assert (=> b!1054613 m!974669))

(assert (=> b!1054616 m!974661))

(declare-fun m!974671 () Bool)

(assert (=> b!1054616 m!974671))

(declare-fun m!974673 () Bool)

(assert (=> b!1054612 m!974673))

(declare-fun m!974675 () Bool)

(assert (=> b!1054612 m!974675))

(declare-fun m!974677 () Bool)

(assert (=> b!1054612 m!974677))

(declare-fun m!974679 () Bool)

(assert (=> b!1054612 m!974679))

(declare-fun m!974681 () Bool)

(assert (=> b!1054608 m!974681))

(push 1)

