; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92344 () Bool)

(assert start!92344)

(declare-fun b!1049718 () Bool)

(declare-fun e!595604 () Bool)

(declare-fun e!595606 () Bool)

(assert (=> b!1049718 (= e!595604 e!595606)))

(declare-fun res!698844 () Bool)

(assert (=> b!1049718 (=> res!698844 e!595606)))

(declare-fun lt!463629 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049718 (= res!698844 (bvsle lt!463629 i!1381))))

(declare-fun b!1049719 () Bool)

(declare-fun e!595599 () Bool)

(declare-fun e!595601 () Bool)

(assert (=> b!1049719 (= e!595599 e!595601)))

(declare-fun res!698846 () Bool)

(assert (=> b!1049719 (=> (not res!698846) (not e!595601))))

(assert (=> b!1049719 (= res!698846 (not (= lt!463629 i!1381)))))

(declare-datatypes ((array!66145 0))(
  ( (array!66146 (arr!31812 (Array (_ BitVec 32) (_ BitVec 64))) (size!32348 (_ BitVec 32))) )
))
(declare-fun lt!463630 () array!66145)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66145 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049719 (= lt!463629 (arrayScanForKey!0 lt!463630 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!698850 () Bool)

(declare-fun e!595605 () Bool)

(assert (=> start!92344 (=> (not res!698850) (not e!595605))))

(declare-fun a!3488 () array!66145)

(assert (=> start!92344 (= res!698850 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32348 a!3488)) (bvslt (size!32348 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92344 e!595605))

(assert (=> start!92344 true))

(declare-fun array_inv!24592 (array!66145) Bool)

(assert (=> start!92344 (array_inv!24592 a!3488)))

(declare-fun b!1049720 () Bool)

(declare-fun e!595603 () Bool)

(assert (=> b!1049720 (= e!595601 (not e!595603))))

(declare-fun res!698852 () Bool)

(assert (=> b!1049720 (=> res!698852 e!595603)))

(assert (=> b!1049720 (= res!698852 (bvsle lt!463629 i!1381))))

(assert (=> b!1049720 e!595604))

(declare-fun res!698855 () Bool)

(assert (=> b!1049720 (=> (not res!698855) (not e!595604))))

(assert (=> b!1049720 (= res!698855 (= (select (store (arr!31812 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463629) k!2747))))

(declare-fun b!1049721 () Bool)

(declare-fun res!698845 () Bool)

(assert (=> b!1049721 (=> (not res!698845) (not e!595605))))

(assert (=> b!1049721 (= res!698845 (= (select (arr!31812 a!3488) i!1381) k!2747))))

(declare-fun b!1049722 () Bool)

(declare-fun res!698851 () Bool)

(assert (=> b!1049722 (=> (not res!698851) (not e!595605))))

(declare-datatypes ((List!22124 0))(
  ( (Nil!22121) (Cons!22120 (h!23329 (_ BitVec 64)) (t!31431 List!22124)) )
))
(declare-fun arrayNoDuplicates!0 (array!66145 (_ BitVec 32) List!22124) Bool)

(assert (=> b!1049722 (= res!698851 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22121))))

(declare-fun b!1049723 () Bool)

(declare-fun res!698847 () Bool)

(assert (=> b!1049723 (=> (not res!698847) (not e!595605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049723 (= res!698847 (validKeyInArray!0 k!2747))))

(declare-fun b!1049724 () Bool)

(declare-fun res!698853 () Bool)

(declare-fun e!595602 () Bool)

(assert (=> b!1049724 (=> res!698853 e!595602)))

(declare-fun contains!6117 (List!22124 (_ BitVec 64)) Bool)

(assert (=> b!1049724 (= res!698853 (contains!6117 Nil!22121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049725 () Bool)

(assert (=> b!1049725 (= e!595605 e!595599)))

(declare-fun res!698854 () Bool)

(assert (=> b!1049725 (=> (not res!698854) (not e!595599))))

(declare-fun arrayContainsKey!0 (array!66145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049725 (= res!698854 (arrayContainsKey!0 lt!463630 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049725 (= lt!463630 (array!66146 (store (arr!31812 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32348 a!3488)))))

(declare-fun b!1049726 () Bool)

(assert (=> b!1049726 (= e!595602 true)))

(declare-fun lt!463631 () Bool)

(assert (=> b!1049726 (= lt!463631 (contains!6117 Nil!22121 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049727 () Bool)

(assert (=> b!1049727 (= e!595603 e!595602)))

(declare-fun res!698849 () Bool)

(assert (=> b!1049727 (=> res!698849 e!595602)))

(assert (=> b!1049727 (= res!698849 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32348 a!3488)))))

(assert (=> b!1049727 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34344 0))(
  ( (Unit!34345) )
))
(declare-fun lt!463632 () Unit!34344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34344)

(assert (=> b!1049727 (= lt!463632 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463629 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049727 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22121)))

(declare-fun lt!463628 () Unit!34344)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66145 (_ BitVec 32) (_ BitVec 32)) Unit!34344)

(assert (=> b!1049727 (= lt!463628 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049728 () Bool)

(declare-fun res!698848 () Bool)

(assert (=> b!1049728 (=> res!698848 e!595602)))

(declare-fun noDuplicate!1502 (List!22124) Bool)

(assert (=> b!1049728 (= res!698848 (not (noDuplicate!1502 Nil!22121)))))

(declare-fun b!1049729 () Bool)

(assert (=> b!1049729 (= e!595606 (arrayContainsKey!0 a!3488 k!2747 lt!463629))))

(assert (= (and start!92344 res!698850) b!1049722))

(assert (= (and b!1049722 res!698851) b!1049723))

(assert (= (and b!1049723 res!698847) b!1049721))

(assert (= (and b!1049721 res!698845) b!1049725))

(assert (= (and b!1049725 res!698854) b!1049719))

(assert (= (and b!1049719 res!698846) b!1049720))

(assert (= (and b!1049720 res!698855) b!1049718))

(assert (= (and b!1049718 (not res!698844)) b!1049729))

(assert (= (and b!1049720 (not res!698852)) b!1049727))

(assert (= (and b!1049727 (not res!698849)) b!1049728))

(assert (= (and b!1049728 (not res!698848)) b!1049724))

(assert (= (and b!1049724 (not res!698853)) b!1049726))

(declare-fun m!970449 () Bool)

(assert (=> b!1049723 m!970449))

(declare-fun m!970451 () Bool)

(assert (=> b!1049729 m!970451))

(declare-fun m!970453 () Bool)

(assert (=> b!1049720 m!970453))

(declare-fun m!970455 () Bool)

(assert (=> b!1049720 m!970455))

(declare-fun m!970457 () Bool)

(assert (=> b!1049724 m!970457))

(declare-fun m!970459 () Bool)

(assert (=> b!1049725 m!970459))

(assert (=> b!1049725 m!970453))

(declare-fun m!970461 () Bool)

(assert (=> b!1049721 m!970461))

(declare-fun m!970463 () Bool)

(assert (=> b!1049728 m!970463))

(declare-fun m!970465 () Bool)

(assert (=> b!1049726 m!970465))

(declare-fun m!970467 () Bool)

(assert (=> b!1049719 m!970467))

(declare-fun m!970469 () Bool)

(assert (=> b!1049727 m!970469))

(declare-fun m!970471 () Bool)

(assert (=> b!1049727 m!970471))

(declare-fun m!970473 () Bool)

(assert (=> b!1049727 m!970473))

(declare-fun m!970475 () Bool)

(assert (=> b!1049727 m!970475))

(declare-fun m!970477 () Bool)

(assert (=> start!92344 m!970477))

(declare-fun m!970479 () Bool)

(assert (=> b!1049722 m!970479))

(push 1)

(assert (not b!1049724))

(assert (not b!1049719))

(assert (not b!1049726))

(assert (not b!1049727))

(assert (not b!1049729))

(assert (not start!92344))

(assert (not b!1049722))

(assert (not b!1049725))

(assert (not b!1049723))

(assert (not b!1049728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

