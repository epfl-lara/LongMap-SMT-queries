; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93178 () Bool)

(assert start!93178)

(declare-fun b!1056705 () Bool)

(declare-fun e!600803 () Bool)

(declare-fun e!600802 () Bool)

(assert (=> b!1056705 (= e!600803 e!600802)))

(declare-fun res!705448 () Bool)

(assert (=> b!1056705 (=> res!705448 e!600802)))

(declare-fun lt!466180 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056705 (= res!705448 (or (bvsgt lt!466180 i!1381) (bvsle i!1381 lt!466180)))))

(declare-fun b!1056706 () Bool)

(declare-fun e!600805 () Bool)

(declare-fun e!600799 () Bool)

(assert (=> b!1056706 (= e!600805 e!600799)))

(declare-fun res!705449 () Bool)

(assert (=> b!1056706 (=> (not res!705449) (not e!600799))))

(assert (=> b!1056706 (= res!705449 (not (= lt!466180 i!1381)))))

(declare-datatypes ((array!66649 0))(
  ( (array!66650 (arr!32049 (Array (_ BitVec 32) (_ BitVec 64))) (size!32585 (_ BitVec 32))) )
))
(declare-fun lt!466182 () array!66649)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66649 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056706 (= lt!466180 (arrayScanForKey!0 lt!466182 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056707 () Bool)

(declare-fun res!705452 () Bool)

(declare-fun e!600800 () Bool)

(assert (=> b!1056707 (=> (not res!705452) (not e!600800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056707 (= res!705452 (validKeyInArray!0 k!2747))))

(declare-fun b!1056708 () Bool)

(assert (=> b!1056708 (= e!600800 e!600805)))

(declare-fun res!705450 () Bool)

(assert (=> b!1056708 (=> (not res!705450) (not e!600805))))

(declare-fun arrayContainsKey!0 (array!66649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056708 (= res!705450 (arrayContainsKey!0 lt!466182 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66649)

(assert (=> b!1056708 (= lt!466182 (array!66650 (store (arr!32049 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32585 a!3488)))))

(declare-fun b!1056709 () Bool)

(declare-fun res!705447 () Bool)

(assert (=> b!1056709 (=> (not res!705447) (not e!600800))))

(assert (=> b!1056709 (= res!705447 (= (select (arr!32049 a!3488) i!1381) k!2747))))

(declare-fun res!705451 () Bool)

(assert (=> start!93178 (=> (not res!705451) (not e!600800))))

(assert (=> start!93178 (= res!705451 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32585 a!3488)) (bvslt (size!32585 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93178 e!600800))

(assert (=> start!93178 true))

(declare-fun array_inv!24829 (array!66649) Bool)

(assert (=> start!93178 (array_inv!24829 a!3488)))

(declare-fun b!1056710 () Bool)

(declare-fun e!600804 () Bool)

(assert (=> b!1056710 (= e!600799 (not e!600804))))

(declare-fun res!705455 () Bool)

(assert (=> b!1056710 (=> res!705455 e!600804)))

(assert (=> b!1056710 (= res!705455 (or (bvsgt lt!466180 i!1381) (bvsle i!1381 lt!466180)))))

(assert (=> b!1056710 e!600803))

(declare-fun res!705453 () Bool)

(assert (=> b!1056710 (=> (not res!705453) (not e!600803))))

(assert (=> b!1056710 (= res!705453 (= (select (store (arr!32049 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466180) k!2747))))

(declare-fun b!1056711 () Bool)

(declare-fun res!705454 () Bool)

(assert (=> b!1056711 (=> (not res!705454) (not e!600800))))

(declare-datatypes ((List!22361 0))(
  ( (Nil!22358) (Cons!22357 (h!23566 (_ BitVec 64)) (t!31668 List!22361)) )
))
(declare-fun arrayNoDuplicates!0 (array!66649 (_ BitVec 32) List!22361) Bool)

(assert (=> b!1056711 (= res!705454 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22358))))

(declare-fun b!1056712 () Bool)

(assert (=> b!1056712 (= e!600804 true)))

(assert (=> b!1056712 (arrayNoDuplicates!0 a!3488 lt!466180 Nil!22358)))

(declare-datatypes ((Unit!34620 0))(
  ( (Unit!34621) )
))
(declare-fun lt!466181 () Unit!34620)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66649 (_ BitVec 32) (_ BitVec 32)) Unit!34620)

(assert (=> b!1056712 (= lt!466181 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466180))))

(declare-fun b!1056713 () Bool)

(assert (=> b!1056713 (= e!600802 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93178 res!705451) b!1056711))

(assert (= (and b!1056711 res!705454) b!1056707))

(assert (= (and b!1056707 res!705452) b!1056709))

(assert (= (and b!1056709 res!705447) b!1056708))

(assert (= (and b!1056708 res!705450) b!1056706))

(assert (= (and b!1056706 res!705449) b!1056710))

(assert (= (and b!1056710 res!705453) b!1056705))

(assert (= (and b!1056705 (not res!705448)) b!1056713))

(assert (= (and b!1056710 (not res!705455)) b!1056712))

(declare-fun m!976495 () Bool)

(assert (=> b!1056706 m!976495))

(declare-fun m!976497 () Bool)

(assert (=> b!1056713 m!976497))

(declare-fun m!976499 () Bool)

(assert (=> b!1056711 m!976499))

(declare-fun m!976501 () Bool)

(assert (=> b!1056712 m!976501))

(declare-fun m!976503 () Bool)

(assert (=> b!1056712 m!976503))

(declare-fun m!976505 () Bool)

(assert (=> b!1056709 m!976505))

(declare-fun m!976507 () Bool)

(assert (=> b!1056710 m!976507))

(declare-fun m!976509 () Bool)

(assert (=> b!1056710 m!976509))

(declare-fun m!976511 () Bool)

(assert (=> b!1056707 m!976511))

(declare-fun m!976513 () Bool)

(assert (=> b!1056708 m!976513))

(assert (=> b!1056708 m!976507))

(declare-fun m!976515 () Bool)

(assert (=> start!93178 m!976515))

(push 1)

