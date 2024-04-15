; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92344 () Bool)

(assert start!92344)

(declare-fun b!1049603 () Bool)

(declare-fun res!698819 () Bool)

(declare-fun e!595532 () Bool)

(assert (=> b!1049603 (=> (not res!698819) (not e!595532))))

(declare-datatypes ((array!66086 0))(
  ( (array!66087 (arr!31782 (Array (_ BitVec 32) (_ BitVec 64))) (size!32320 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66086)

(declare-datatypes ((List!22153 0))(
  ( (Nil!22150) (Cons!22149 (h!23358 (_ BitVec 64)) (t!31451 List!22153)) )
))
(declare-fun arrayNoDuplicates!0 (array!66086 (_ BitVec 32) List!22153) Bool)

(assert (=> b!1049603 (= res!698819 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22150))))

(declare-fun b!1049604 () Bool)

(declare-fun res!698824 () Bool)

(assert (=> b!1049604 (=> (not res!698824) (not e!595532))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049604 (= res!698824 (= (select (arr!31782 a!3488) i!1381) k0!2747))))

(declare-fun b!1049605 () Bool)

(declare-fun res!698818 () Bool)

(declare-fun e!595534 () Bool)

(assert (=> b!1049605 (=> res!698818 e!595534)))

(declare-fun contains!6091 (List!22153 (_ BitVec 64)) Bool)

(assert (=> b!1049605 (= res!698818 (contains!6091 Nil!22150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!698821 () Bool)

(assert (=> start!92344 (=> (not res!698821) (not e!595532))))

(assert (=> start!92344 (= res!698821 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32320 a!3488)) (bvslt (size!32320 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92344 e!595532))

(assert (=> start!92344 true))

(declare-fun array_inv!24565 (array!66086) Bool)

(assert (=> start!92344 (array_inv!24565 a!3488)))

(declare-fun b!1049606 () Bool)

(declare-fun res!698822 () Bool)

(assert (=> b!1049606 (=> (not res!698822) (not e!595532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049606 (= res!698822 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049607 () Bool)

(declare-fun e!595536 () Bool)

(declare-fun e!595535 () Bool)

(assert (=> b!1049607 (= e!595536 e!595535)))

(declare-fun res!698815 () Bool)

(assert (=> b!1049607 (=> res!698815 e!595535)))

(declare-fun lt!463444 () (_ BitVec 32))

(assert (=> b!1049607 (= res!698815 (bvsle lt!463444 i!1381))))

(declare-fun b!1049608 () Bool)

(declare-fun e!595539 () Bool)

(declare-fun e!595538 () Bool)

(assert (=> b!1049608 (= e!595539 e!595538)))

(declare-fun res!698817 () Bool)

(assert (=> b!1049608 (=> (not res!698817) (not e!595538))))

(assert (=> b!1049608 (= res!698817 (not (= lt!463444 i!1381)))))

(declare-fun lt!463446 () array!66086)

(declare-fun arrayScanForKey!0 (array!66086 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049608 (= lt!463444 (arrayScanForKey!0 lt!463446 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049609 () Bool)

(declare-fun arrayContainsKey!0 (array!66086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049609 (= e!595535 (arrayContainsKey!0 a!3488 k0!2747 lt!463444))))

(declare-fun b!1049610 () Bool)

(assert (=> b!1049610 (= e!595532 e!595539)))

(declare-fun res!698823 () Bool)

(assert (=> b!1049610 (=> (not res!698823) (not e!595539))))

(assert (=> b!1049610 (= res!698823 (arrayContainsKey!0 lt!463446 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049610 (= lt!463446 (array!66087 (store (arr!31782 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32320 a!3488)))))

(declare-fun b!1049611 () Bool)

(assert (=> b!1049611 (= e!595534 true)))

(declare-fun lt!463443 () Bool)

(assert (=> b!1049611 (= lt!463443 (contains!6091 Nil!22150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049612 () Bool)

(declare-fun e!595533 () Bool)

(assert (=> b!1049612 (= e!595538 (not e!595533))))

(declare-fun res!698813 () Bool)

(assert (=> b!1049612 (=> res!698813 e!595533)))

(assert (=> b!1049612 (= res!698813 (bvsle lt!463444 i!1381))))

(assert (=> b!1049612 e!595536))

(declare-fun res!698814 () Bool)

(assert (=> b!1049612 (=> (not res!698814) (not e!595536))))

(assert (=> b!1049612 (= res!698814 (= (select (store (arr!31782 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463444) k0!2747))))

(declare-fun b!1049613 () Bool)

(assert (=> b!1049613 (= e!595533 e!595534)))

(declare-fun res!698816 () Bool)

(assert (=> b!1049613 (=> res!698816 e!595534)))

(assert (=> b!1049613 (= res!698816 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32320 a!3488)))))

(assert (=> b!1049613 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34217 0))(
  ( (Unit!34218) )
))
(declare-fun lt!463447 () Unit!34217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66086 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34217)

(assert (=> b!1049613 (= lt!463447 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463444 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049613 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22150)))

(declare-fun lt!463445 () Unit!34217)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66086 (_ BitVec 32) (_ BitVec 32)) Unit!34217)

(assert (=> b!1049613 (= lt!463445 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049614 () Bool)

(declare-fun res!698820 () Bool)

(assert (=> b!1049614 (=> res!698820 e!595534)))

(declare-fun noDuplicate!1516 (List!22153) Bool)

(assert (=> b!1049614 (= res!698820 (not (noDuplicate!1516 Nil!22150)))))

(assert (= (and start!92344 res!698821) b!1049603))

(assert (= (and b!1049603 res!698819) b!1049606))

(assert (= (and b!1049606 res!698822) b!1049604))

(assert (= (and b!1049604 res!698824) b!1049610))

(assert (= (and b!1049610 res!698823) b!1049608))

(assert (= (and b!1049608 res!698817) b!1049612))

(assert (= (and b!1049612 res!698814) b!1049607))

(assert (= (and b!1049607 (not res!698815)) b!1049609))

(assert (= (and b!1049612 (not res!698813)) b!1049613))

(assert (= (and b!1049613 (not res!698816)) b!1049614))

(assert (= (and b!1049614 (not res!698820)) b!1049605))

(assert (= (and b!1049605 (not res!698818)) b!1049611))

(declare-fun m!969865 () Bool)

(assert (=> b!1049613 m!969865))

(declare-fun m!969867 () Bool)

(assert (=> b!1049613 m!969867))

(declare-fun m!969869 () Bool)

(assert (=> b!1049613 m!969869))

(declare-fun m!969871 () Bool)

(assert (=> b!1049613 m!969871))

(declare-fun m!969873 () Bool)

(assert (=> b!1049614 m!969873))

(declare-fun m!969875 () Bool)

(assert (=> b!1049612 m!969875))

(declare-fun m!969877 () Bool)

(assert (=> b!1049612 m!969877))

(declare-fun m!969879 () Bool)

(assert (=> start!92344 m!969879))

(declare-fun m!969881 () Bool)

(assert (=> b!1049605 m!969881))

(declare-fun m!969883 () Bool)

(assert (=> b!1049611 m!969883))

(declare-fun m!969885 () Bool)

(assert (=> b!1049608 m!969885))

(declare-fun m!969887 () Bool)

(assert (=> b!1049610 m!969887))

(assert (=> b!1049610 m!969875))

(declare-fun m!969889 () Bool)

(assert (=> b!1049606 m!969889))

(declare-fun m!969891 () Bool)

(assert (=> b!1049603 m!969891))

(declare-fun m!969893 () Bool)

(assert (=> b!1049609 m!969893))

(declare-fun m!969895 () Bool)

(assert (=> b!1049604 m!969895))

(check-sat (not b!1049605) (not b!1049611) (not b!1049609) (not b!1049613) (not start!92344) (not b!1049614) (not b!1049608) (not b!1049606) (not b!1049603) (not b!1049610))
(check-sat)
