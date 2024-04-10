; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93042 () Bool)

(assert start!93042)

(declare-fun b!1055520 () Bool)

(declare-fun e!599917 () Bool)

(declare-fun e!599911 () Bool)

(assert (=> b!1055520 (= e!599917 e!599911)))

(declare-fun res!704336 () Bool)

(assert (=> b!1055520 (=> (not res!704336) (not e!599911))))

(declare-fun lt!465790 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055520 (= res!704336 (not (= lt!465790 i!1381)))))

(declare-datatypes ((array!66567 0))(
  ( (array!66568 (arr!32011 (Array (_ BitVec 32) (_ BitVec 64))) (size!32547 (_ BitVec 32))) )
))
(declare-fun lt!465788 () array!66567)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66567 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055520 (= lt!465790 (arrayScanForKey!0 lt!465788 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055522 () Bool)

(declare-fun res!704340 () Bool)

(declare-fun e!599914 () Bool)

(assert (=> b!1055522 (=> (not res!704340) (not e!599914))))

(declare-fun a!3488 () array!66567)

(declare-datatypes ((List!22323 0))(
  ( (Nil!22320) (Cons!22319 (h!23528 (_ BitVec 64)) (t!31630 List!22323)) )
))
(declare-fun arrayNoDuplicates!0 (array!66567 (_ BitVec 32) List!22323) Bool)

(assert (=> b!1055522 (= res!704340 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22320))))

(declare-fun b!1055523 () Bool)

(declare-fun res!704342 () Bool)

(declare-fun e!599913 () Bool)

(assert (=> b!1055523 (=> res!704342 e!599913)))

(declare-fun contains!6183 (List!22323 (_ BitVec 64)) Bool)

(assert (=> b!1055523 (= res!704342 (contains!6183 Nil!22320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055524 () Bool)

(assert (=> b!1055524 (= e!599913 true)))

(declare-fun lt!465792 () Bool)

(assert (=> b!1055524 (= lt!465792 (contains!6183 Nil!22320 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055525 () Bool)

(declare-fun res!704335 () Bool)

(assert (=> b!1055525 (=> res!704335 e!599913)))

(declare-fun noDuplicate!1551 (List!22323) Bool)

(assert (=> b!1055525 (= res!704335 (not (noDuplicate!1551 Nil!22320)))))

(declare-fun b!1055526 () Bool)

(assert (=> b!1055526 (= e!599914 e!599917)))

(declare-fun res!704337 () Bool)

(assert (=> b!1055526 (=> (not res!704337) (not e!599917))))

(declare-fun arrayContainsKey!0 (array!66567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055526 (= res!704337 (arrayContainsKey!0 lt!465788 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055526 (= lt!465788 (array!66568 (store (arr!32011 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32547 a!3488)))))

(declare-fun b!1055527 () Bool)

(declare-fun res!704344 () Bool)

(assert (=> b!1055527 (=> (not res!704344) (not e!599914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055527 (= res!704344 (validKeyInArray!0 k!2747))))

(declare-fun b!1055528 () Bool)

(declare-fun res!704339 () Bool)

(assert (=> b!1055528 (=> (not res!704339) (not e!599914))))

(assert (=> b!1055528 (= res!704339 (= (select (arr!32011 a!3488) i!1381) k!2747))))

(declare-fun b!1055529 () Bool)

(declare-fun e!599915 () Bool)

(declare-fun e!599910 () Bool)

(assert (=> b!1055529 (= e!599915 e!599910)))

(declare-fun res!704341 () Bool)

(assert (=> b!1055529 (=> res!704341 e!599910)))

(assert (=> b!1055529 (= res!704341 (bvsle lt!465790 i!1381))))

(declare-fun res!704345 () Bool)

(assert (=> start!93042 (=> (not res!704345) (not e!599914))))

(assert (=> start!93042 (= res!704345 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32547 a!3488)) (bvslt (size!32547 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93042 e!599914))

(assert (=> start!93042 true))

(declare-fun array_inv!24791 (array!66567) Bool)

(assert (=> start!93042 (array_inv!24791 a!3488)))

(declare-fun b!1055521 () Bool)

(assert (=> b!1055521 (= e!599910 (arrayContainsKey!0 a!3488 k!2747 lt!465790))))

(declare-fun b!1055530 () Bool)

(declare-fun e!599912 () Bool)

(assert (=> b!1055530 (= e!599912 e!599913)))

(declare-fun res!704338 () Bool)

(assert (=> b!1055530 (=> res!704338 e!599913)))

(assert (=> b!1055530 (= res!704338 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32547 a!3488)))))

(assert (=> b!1055530 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34580 0))(
  ( (Unit!34581) )
))
(declare-fun lt!465789 () Unit!34580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34580)

(assert (=> b!1055530 (= lt!465789 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465790 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055530 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22320)))

(declare-fun lt!465791 () Unit!34580)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66567 (_ BitVec 32) (_ BitVec 32)) Unit!34580)

(assert (=> b!1055530 (= lt!465791 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055531 () Bool)

(assert (=> b!1055531 (= e!599911 (not e!599912))))

(declare-fun res!704343 () Bool)

(assert (=> b!1055531 (=> res!704343 e!599912)))

(assert (=> b!1055531 (= res!704343 (bvsle lt!465790 i!1381))))

(assert (=> b!1055531 e!599915))

(declare-fun res!704334 () Bool)

(assert (=> b!1055531 (=> (not res!704334) (not e!599915))))

(assert (=> b!1055531 (= res!704334 (= (select (store (arr!32011 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465790) k!2747))))

(assert (= (and start!93042 res!704345) b!1055522))

(assert (= (and b!1055522 res!704340) b!1055527))

(assert (= (and b!1055527 res!704344) b!1055528))

(assert (= (and b!1055528 res!704339) b!1055526))

(assert (= (and b!1055526 res!704337) b!1055520))

(assert (= (and b!1055520 res!704336) b!1055531))

(assert (= (and b!1055531 res!704334) b!1055529))

(assert (= (and b!1055529 (not res!704341)) b!1055521))

(assert (= (and b!1055531 (not res!704343)) b!1055530))

(assert (= (and b!1055530 (not res!704338)) b!1055525))

(assert (= (and b!1055525 (not res!704335)) b!1055523))

(assert (= (and b!1055523 (not res!704342)) b!1055524))

(declare-fun m!975509 () Bool)

(assert (=> b!1055523 m!975509))

(declare-fun m!975511 () Bool)

(assert (=> b!1055525 m!975511))

(declare-fun m!975513 () Bool)

(assert (=> b!1055528 m!975513))

(declare-fun m!975515 () Bool)

(assert (=> start!93042 m!975515))

(declare-fun m!975517 () Bool)

(assert (=> b!1055530 m!975517))

(declare-fun m!975519 () Bool)

(assert (=> b!1055530 m!975519))

(declare-fun m!975521 () Bool)

(assert (=> b!1055530 m!975521))

(declare-fun m!975523 () Bool)

(assert (=> b!1055530 m!975523))

(declare-fun m!975525 () Bool)

(assert (=> b!1055522 m!975525))

(declare-fun m!975527 () Bool)

(assert (=> b!1055524 m!975527))

(declare-fun m!975529 () Bool)

(assert (=> b!1055531 m!975529))

(declare-fun m!975531 () Bool)

(assert (=> b!1055531 m!975531))

(declare-fun m!975533 () Bool)

(assert (=> b!1055521 m!975533))

(declare-fun m!975535 () Bool)

(assert (=> b!1055526 m!975535))

(assert (=> b!1055526 m!975529))

(declare-fun m!975537 () Bool)

(assert (=> b!1055520 m!975537))

(declare-fun m!975539 () Bool)

(assert (=> b!1055527 m!975539))

(push 1)

