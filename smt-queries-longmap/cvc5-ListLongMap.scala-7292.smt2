; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93174 () Bool)

(assert start!93174)

(declare-fun b!1056651 () Bool)

(declare-fun res!705401 () Bool)

(declare-fun e!600762 () Bool)

(assert (=> b!1056651 (=> (not res!705401) (not e!600762))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056651 (= res!705401 (validKeyInArray!0 k!2747))))

(declare-fun e!600760 () Bool)

(declare-fun b!1056652 () Bool)

(declare-datatypes ((array!66645 0))(
  ( (array!66646 (arr!32047 (Array (_ BitVec 32) (_ BitVec 64))) (size!32583 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66645)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056652 (= e!600760 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056653 () Bool)

(declare-fun res!705395 () Bool)

(assert (=> b!1056653 (=> (not res!705395) (not e!600762))))

(declare-datatypes ((List!22359 0))(
  ( (Nil!22356) (Cons!22355 (h!23564 (_ BitVec 64)) (t!31666 List!22359)) )
))
(declare-fun arrayNoDuplicates!0 (array!66645 (_ BitVec 32) List!22359) Bool)

(assert (=> b!1056653 (= res!705395 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22356))))

(declare-fun res!705397 () Bool)

(assert (=> start!93174 (=> (not res!705397) (not e!600762))))

(assert (=> start!93174 (= res!705397 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32583 a!3488)) (bvslt (size!32583 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93174 e!600762))

(assert (=> start!93174 true))

(declare-fun array_inv!24827 (array!66645) Bool)

(assert (=> start!93174 (array_inv!24827 a!3488)))

(declare-fun b!1056654 () Bool)

(declare-fun e!600757 () Bool)

(assert (=> b!1056654 (= e!600757 e!600760)))

(declare-fun res!705400 () Bool)

(assert (=> b!1056654 (=> res!705400 e!600760)))

(declare-fun lt!466162 () (_ BitVec 32))

(assert (=> b!1056654 (= res!705400 (or (bvsgt lt!466162 i!1381) (bvsle i!1381 lt!466162)))))

(declare-fun b!1056655 () Bool)

(declare-fun e!600758 () Bool)

(assert (=> b!1056655 (= e!600762 e!600758)))

(declare-fun res!705396 () Bool)

(assert (=> b!1056655 (=> (not res!705396) (not e!600758))))

(declare-fun lt!466164 () array!66645)

(assert (=> b!1056655 (= res!705396 (arrayContainsKey!0 lt!466164 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056655 (= lt!466164 (array!66646 (store (arr!32047 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32583 a!3488)))))

(declare-fun b!1056656 () Bool)

(declare-fun e!600761 () Bool)

(assert (=> b!1056656 (= e!600758 e!600761)))

(declare-fun res!705399 () Bool)

(assert (=> b!1056656 (=> (not res!705399) (not e!600761))))

(assert (=> b!1056656 (= res!705399 (not (= lt!466162 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66645 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056656 (= lt!466162 (arrayScanForKey!0 lt!466164 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056657 () Bool)

(declare-fun res!705398 () Bool)

(assert (=> b!1056657 (=> (not res!705398) (not e!600762))))

(assert (=> b!1056657 (= res!705398 (= (select (arr!32047 a!3488) i!1381) k!2747))))

(declare-fun b!1056658 () Bool)

(declare-fun e!600763 () Bool)

(assert (=> b!1056658 (= e!600761 (not e!600763))))

(declare-fun res!705394 () Bool)

(assert (=> b!1056658 (=> res!705394 e!600763)))

(assert (=> b!1056658 (= res!705394 (or (bvsgt lt!466162 i!1381) (bvsle i!1381 lt!466162)))))

(assert (=> b!1056658 e!600757))

(declare-fun res!705393 () Bool)

(assert (=> b!1056658 (=> (not res!705393) (not e!600757))))

(assert (=> b!1056658 (= res!705393 (= (select (store (arr!32047 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466162) k!2747))))

(declare-fun b!1056659 () Bool)

(assert (=> b!1056659 (= e!600763 true)))

(assert (=> b!1056659 (arrayNoDuplicates!0 a!3488 lt!466162 Nil!22356)))

(declare-datatypes ((Unit!34616 0))(
  ( (Unit!34617) )
))
(declare-fun lt!466163 () Unit!34616)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66645 (_ BitVec 32) (_ BitVec 32)) Unit!34616)

(assert (=> b!1056659 (= lt!466163 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466162))))

(assert (= (and start!93174 res!705397) b!1056653))

(assert (= (and b!1056653 res!705395) b!1056651))

(assert (= (and b!1056651 res!705401) b!1056657))

(assert (= (and b!1056657 res!705398) b!1056655))

(assert (= (and b!1056655 res!705396) b!1056656))

(assert (= (and b!1056656 res!705399) b!1056658))

(assert (= (and b!1056658 res!705393) b!1056654))

(assert (= (and b!1056654 (not res!705400)) b!1056652))

(assert (= (and b!1056658 (not res!705394)) b!1056659))

(declare-fun m!976451 () Bool)

(assert (=> b!1056658 m!976451))

(declare-fun m!976453 () Bool)

(assert (=> b!1056658 m!976453))

(declare-fun m!976455 () Bool)

(assert (=> b!1056655 m!976455))

(assert (=> b!1056655 m!976451))

(declare-fun m!976457 () Bool)

(assert (=> b!1056657 m!976457))

(declare-fun m!976459 () Bool)

(assert (=> b!1056651 m!976459))

(declare-fun m!976461 () Bool)

(assert (=> b!1056652 m!976461))

(declare-fun m!976463 () Bool)

(assert (=> b!1056656 m!976463))

(declare-fun m!976465 () Bool)

(assert (=> start!93174 m!976465))

(declare-fun m!976467 () Bool)

(assert (=> b!1056653 m!976467))

(declare-fun m!976469 () Bool)

(assert (=> b!1056659 m!976469))

(declare-fun m!976471 () Bool)

(assert (=> b!1056659 m!976471))

(push 1)

