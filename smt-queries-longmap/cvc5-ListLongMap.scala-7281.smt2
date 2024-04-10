; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93048 () Bool)

(assert start!93048)

(declare-fun b!1055628 () Bool)

(declare-fun e!599986 () Bool)

(declare-fun e!599982 () Bool)

(assert (=> b!1055628 (= e!599986 e!599982)))

(declare-fun res!704448 () Bool)

(assert (=> b!1055628 (=> res!704448 e!599982)))

(declare-fun lt!465833 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055628 (= res!704448 (bvsle lt!465833 i!1381))))

(declare-fun b!1055629 () Bool)

(declare-fun res!704453 () Bool)

(declare-fun e!599987 () Bool)

(assert (=> b!1055629 (=> (not res!704453) (not e!599987))))

(declare-datatypes ((array!66573 0))(
  ( (array!66574 (arr!32014 (Array (_ BitVec 32) (_ BitVec 64))) (size!32550 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66573)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1055629 (= res!704453 (= (select (arr!32014 a!3488) i!1381) k!2747))))

(declare-fun b!1055630 () Bool)

(declare-fun arrayContainsKey!0 (array!66573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055630 (= e!599982 (arrayContainsKey!0 a!3488 k!2747 lt!465833))))

(declare-fun b!1055631 () Bool)

(declare-fun res!704444 () Bool)

(assert (=> b!1055631 (=> (not res!704444) (not e!599987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055631 (= res!704444 (validKeyInArray!0 k!2747))))

(declare-fun b!1055632 () Bool)

(declare-fun e!599988 () Bool)

(declare-fun e!599985 () Bool)

(assert (=> b!1055632 (= e!599988 e!599985)))

(declare-fun res!704445 () Bool)

(assert (=> b!1055632 (=> (not res!704445) (not e!599985))))

(assert (=> b!1055632 (= res!704445 (not (= lt!465833 i!1381)))))

(declare-fun lt!465834 () array!66573)

(declare-fun arrayScanForKey!0 (array!66573 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055632 (= lt!465833 (arrayScanForKey!0 lt!465834 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055633 () Bool)

(assert (=> b!1055633 (= e!599987 e!599988)))

(declare-fun res!704442 () Bool)

(assert (=> b!1055633 (=> (not res!704442) (not e!599988))))

(assert (=> b!1055633 (= res!704442 (arrayContainsKey!0 lt!465834 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055633 (= lt!465834 (array!66574 (store (arr!32014 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32550 a!3488)))))

(declare-fun b!1055634 () Bool)

(declare-fun e!599983 () Bool)

(declare-fun e!599989 () Bool)

(assert (=> b!1055634 (= e!599983 e!599989)))

(declare-fun res!704447 () Bool)

(assert (=> b!1055634 (=> res!704447 e!599989)))

(assert (=> b!1055634 (= res!704447 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32550 a!3488)))))

(assert (=> b!1055634 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34586 0))(
  ( (Unit!34587) )
))
(declare-fun lt!465837 () Unit!34586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66573 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34586)

(assert (=> b!1055634 (= lt!465837 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465833 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22326 0))(
  ( (Nil!22323) (Cons!22322 (h!23531 (_ BitVec 64)) (t!31633 List!22326)) )
))
(declare-fun arrayNoDuplicates!0 (array!66573 (_ BitVec 32) List!22326) Bool)

(assert (=> b!1055634 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22323)))

(declare-fun lt!465835 () Unit!34586)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66573 (_ BitVec 32) (_ BitVec 32)) Unit!34586)

(assert (=> b!1055634 (= lt!465835 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055635 () Bool)

(declare-fun res!704450 () Bool)

(assert (=> b!1055635 (=> res!704450 e!599989)))

(declare-fun contains!6186 (List!22326 (_ BitVec 64)) Bool)

(assert (=> b!1055635 (= res!704450 (contains!6186 Nil!22323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!704446 () Bool)

(assert (=> start!93048 (=> (not res!704446) (not e!599987))))

(assert (=> start!93048 (= res!704446 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32550 a!3488)) (bvslt (size!32550 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93048 e!599987))

(assert (=> start!93048 true))

(declare-fun array_inv!24794 (array!66573) Bool)

(assert (=> start!93048 (array_inv!24794 a!3488)))

(declare-fun b!1055636 () Bool)

(declare-fun res!704452 () Bool)

(assert (=> b!1055636 (=> res!704452 e!599989)))

(declare-fun noDuplicate!1554 (List!22326) Bool)

(assert (=> b!1055636 (= res!704452 (not (noDuplicate!1554 Nil!22323)))))

(declare-fun b!1055637 () Bool)

(declare-fun res!704451 () Bool)

(assert (=> b!1055637 (=> (not res!704451) (not e!599987))))

(assert (=> b!1055637 (= res!704451 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22323))))

(declare-fun b!1055638 () Bool)

(assert (=> b!1055638 (= e!599989 true)))

(declare-fun lt!465836 () Bool)

(assert (=> b!1055638 (= lt!465836 (contains!6186 Nil!22323 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055639 () Bool)

(assert (=> b!1055639 (= e!599985 (not e!599983))))

(declare-fun res!704443 () Bool)

(assert (=> b!1055639 (=> res!704443 e!599983)))

(assert (=> b!1055639 (= res!704443 (bvsle lt!465833 i!1381))))

(assert (=> b!1055639 e!599986))

(declare-fun res!704449 () Bool)

(assert (=> b!1055639 (=> (not res!704449) (not e!599986))))

(assert (=> b!1055639 (= res!704449 (= (select (store (arr!32014 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465833) k!2747))))

(assert (= (and start!93048 res!704446) b!1055637))

(assert (= (and b!1055637 res!704451) b!1055631))

(assert (= (and b!1055631 res!704444) b!1055629))

(assert (= (and b!1055629 res!704453) b!1055633))

(assert (= (and b!1055633 res!704442) b!1055632))

(assert (= (and b!1055632 res!704445) b!1055639))

(assert (= (and b!1055639 res!704449) b!1055628))

(assert (= (and b!1055628 (not res!704448)) b!1055630))

(assert (= (and b!1055639 (not res!704443)) b!1055634))

(assert (= (and b!1055634 (not res!704447)) b!1055636))

(assert (= (and b!1055636 (not res!704452)) b!1055635))

(assert (= (and b!1055635 (not res!704450)) b!1055638))

(declare-fun m!975605 () Bool)

(assert (=> b!1055636 m!975605))

(declare-fun m!975607 () Bool)

(assert (=> b!1055637 m!975607))

(declare-fun m!975609 () Bool)

(assert (=> b!1055634 m!975609))

(declare-fun m!975611 () Bool)

(assert (=> b!1055634 m!975611))

(declare-fun m!975613 () Bool)

(assert (=> b!1055634 m!975613))

(declare-fun m!975615 () Bool)

(assert (=> b!1055634 m!975615))

(declare-fun m!975617 () Bool)

(assert (=> b!1055630 m!975617))

(declare-fun m!975619 () Bool)

(assert (=> b!1055631 m!975619))

(declare-fun m!975621 () Bool)

(assert (=> b!1055639 m!975621))

(declare-fun m!975623 () Bool)

(assert (=> b!1055639 m!975623))

(declare-fun m!975625 () Bool)

(assert (=> b!1055632 m!975625))

(declare-fun m!975627 () Bool)

(assert (=> start!93048 m!975627))

(declare-fun m!975629 () Bool)

(assert (=> b!1055638 m!975629))

(declare-fun m!975631 () Bool)

(assert (=> b!1055629 m!975631))

(declare-fun m!975633 () Bool)

(assert (=> b!1055633 m!975633))

(assert (=> b!1055633 m!975621))

(declare-fun m!975635 () Bool)

(assert (=> b!1055635 m!975635))

(push 1)

