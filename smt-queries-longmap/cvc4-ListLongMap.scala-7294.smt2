; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93226 () Bool)

(assert start!93226)

(declare-fun b!1056969 () Bool)

(declare-fun res!705673 () Bool)

(declare-fun e!601009 () Bool)

(assert (=> b!1056969 (=> (not res!705673) (not e!601009))))

(declare-datatypes ((array!66664 0))(
  ( (array!66665 (arr!32055 (Array (_ BitVec 32) (_ BitVec 64))) (size!32591 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66664)

(declare-datatypes ((List!22367 0))(
  ( (Nil!22364) (Cons!22363 (h!23572 (_ BitVec 64)) (t!31674 List!22367)) )
))
(declare-fun arrayNoDuplicates!0 (array!66664 (_ BitVec 32) List!22367) Bool)

(assert (=> b!1056969 (= res!705673 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22364))))

(declare-fun b!1056970 () Bool)

(declare-fun res!705670 () Bool)

(assert (=> b!1056970 (=> (not res!705670) (not e!601009))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056970 (= res!705670 (= (select (arr!32055 a!3488) i!1381) k!2747))))

(declare-fun b!1056971 () Bool)

(declare-fun res!705674 () Bool)

(assert (=> b!1056971 (=> (not res!705674) (not e!601009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056971 (= res!705674 (validKeyInArray!0 k!2747))))

(declare-fun b!1056972 () Bool)

(declare-fun e!601012 () Bool)

(assert (=> b!1056972 (= e!601012 true)))

(declare-fun lt!466254 () (_ BitVec 32))

(assert (=> b!1056972 (arrayNoDuplicates!0 a!3488 lt!466254 Nil!22364)))

(declare-datatypes ((Unit!34632 0))(
  ( (Unit!34633) )
))
(declare-fun lt!466252 () Unit!34632)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66664 (_ BitVec 32) (_ BitVec 32)) Unit!34632)

(assert (=> b!1056972 (= lt!466252 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466254))))

(declare-fun b!1056973 () Bool)

(declare-fun e!601006 () Bool)

(assert (=> b!1056973 (= e!601006 (not e!601012))))

(declare-fun res!705676 () Bool)

(assert (=> b!1056973 (=> res!705676 e!601012)))

(assert (=> b!1056973 (= res!705676 (or (bvsgt lt!466254 i!1381) (bvsle i!1381 lt!466254)))))

(declare-fun e!601010 () Bool)

(assert (=> b!1056973 e!601010))

(declare-fun res!705677 () Bool)

(assert (=> b!1056973 (=> (not res!705677) (not e!601010))))

(assert (=> b!1056973 (= res!705677 (= (select (store (arr!32055 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466254) k!2747))))

(declare-fun b!1056974 () Bool)

(declare-fun e!601011 () Bool)

(assert (=> b!1056974 (= e!601009 e!601011)))

(declare-fun res!705671 () Bool)

(assert (=> b!1056974 (=> (not res!705671) (not e!601011))))

(declare-fun lt!466253 () array!66664)

(declare-fun arrayContainsKey!0 (array!66664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056974 (= res!705671 (arrayContainsKey!0 lt!466253 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056974 (= lt!466253 (array!66665 (store (arr!32055 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32591 a!3488)))))

(declare-fun b!1056975 () Bool)

(declare-fun e!601008 () Bool)

(assert (=> b!1056975 (= e!601008 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056976 () Bool)

(assert (=> b!1056976 (= e!601011 e!601006)))

(declare-fun res!705672 () Bool)

(assert (=> b!1056976 (=> (not res!705672) (not e!601006))))

(assert (=> b!1056976 (= res!705672 (not (= lt!466254 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66664 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056976 (= lt!466254 (arrayScanForKey!0 lt!466253 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056977 () Bool)

(assert (=> b!1056977 (= e!601010 e!601008)))

(declare-fun res!705669 () Bool)

(assert (=> b!1056977 (=> res!705669 e!601008)))

(assert (=> b!1056977 (= res!705669 (or (bvsgt lt!466254 i!1381) (bvsle i!1381 lt!466254)))))

(declare-fun res!705675 () Bool)

(assert (=> start!93226 (=> (not res!705675) (not e!601009))))

(assert (=> start!93226 (= res!705675 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32591 a!3488)) (bvslt (size!32591 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93226 e!601009))

(assert (=> start!93226 true))

(declare-fun array_inv!24835 (array!66664) Bool)

(assert (=> start!93226 (array_inv!24835 a!3488)))

(assert (= (and start!93226 res!705675) b!1056969))

(assert (= (and b!1056969 res!705673) b!1056971))

(assert (= (and b!1056971 res!705674) b!1056970))

(assert (= (and b!1056970 res!705670) b!1056974))

(assert (= (and b!1056974 res!705671) b!1056976))

(assert (= (and b!1056976 res!705672) b!1056973))

(assert (= (and b!1056973 res!705677) b!1056977))

(assert (= (and b!1056977 (not res!705669)) b!1056975))

(assert (= (and b!1056973 (not res!705676)) b!1056972))

(declare-fun m!976711 () Bool)

(assert (=> b!1056971 m!976711))

(declare-fun m!976713 () Bool)

(assert (=> b!1056969 m!976713))

(declare-fun m!976715 () Bool)

(assert (=> start!93226 m!976715))

(declare-fun m!976717 () Bool)

(assert (=> b!1056973 m!976717))

(declare-fun m!976719 () Bool)

(assert (=> b!1056973 m!976719))

(declare-fun m!976721 () Bool)

(assert (=> b!1056975 m!976721))

(declare-fun m!976723 () Bool)

(assert (=> b!1056970 m!976723))

(declare-fun m!976725 () Bool)

(assert (=> b!1056976 m!976725))

(declare-fun m!976727 () Bool)

(assert (=> b!1056972 m!976727))

(declare-fun m!976729 () Bool)

(assert (=> b!1056972 m!976729))

(declare-fun m!976731 () Bool)

(assert (=> b!1056974 m!976731))

(assert (=> b!1056974 m!976717))

(push 1)

(assert (not b!1056976))

(assert (not b!1056969))

(assert (not b!1056972))

(assert (not b!1056971))

