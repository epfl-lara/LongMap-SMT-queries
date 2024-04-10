; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92472 () Bool)

(assert start!92472)

(declare-fun b!1051458 () Bool)

(declare-fun res!700588 () Bool)

(declare-fun e!596863 () Bool)

(assert (=> b!1051458 (=> (not res!700588) (not e!596863))))

(declare-datatypes ((array!66273 0))(
  ( (array!66274 (arr!31876 (Array (_ BitVec 32) (_ BitVec 64))) (size!32412 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66273)

(declare-datatypes ((List!22188 0))(
  ( (Nil!22185) (Cons!22184 (h!23393 (_ BitVec 64)) (t!31495 List!22188)) )
))
(declare-fun arrayNoDuplicates!0 (array!66273 (_ BitVec 32) List!22188) Bool)

(assert (=> b!1051458 (= res!700588 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22185))))

(declare-fun res!700592 () Bool)

(assert (=> start!92472 (=> (not res!700592) (not e!596863))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92472 (= res!700592 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32412 a!3488)) (bvslt (size!32412 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92472 e!596863))

(assert (=> start!92472 true))

(declare-fun array_inv!24656 (array!66273) Bool)

(assert (=> start!92472 (array_inv!24656 a!3488)))

(declare-fun b!1051459 () Bool)

(declare-fun e!596866 () Bool)

(declare-fun e!596864 () Bool)

(assert (=> b!1051459 (= e!596866 e!596864)))

(declare-fun res!700589 () Bool)

(assert (=> b!1051459 (=> (not res!700589) (not e!596864))))

(declare-fun lt!464280 () (_ BitVec 32))

(assert (=> b!1051459 (= res!700589 (not (= lt!464280 i!1381)))))

(declare-fun lt!464278 () array!66273)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66273 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051459 (= lt!464280 (arrayScanForKey!0 lt!464278 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051460 () Bool)

(declare-fun res!700591 () Bool)

(assert (=> b!1051460 (=> (not res!700591) (not e!596863))))

(assert (=> b!1051460 (= res!700591 (= (select (arr!31876 a!3488) i!1381) k!2747))))

(declare-fun b!1051461 () Bool)

(declare-fun res!700590 () Bool)

(assert (=> b!1051461 (=> (not res!700590) (not e!596863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051461 (= res!700590 (validKeyInArray!0 k!2747))))

(declare-fun b!1051462 () Bool)

(assert (=> b!1051462 (= e!596863 e!596866)))

(declare-fun res!700584 () Bool)

(assert (=> b!1051462 (=> (not res!700584) (not e!596866))))

(declare-fun arrayContainsKey!0 (array!66273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051462 (= res!700584 (arrayContainsKey!0 lt!464278 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051462 (= lt!464278 (array!66274 (store (arr!31876 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32412 a!3488)))))

(declare-fun b!1051463 () Bool)

(declare-fun e!596865 () Bool)

(assert (=> b!1051463 (= e!596865 true)))

(assert (=> b!1051463 (arrayNoDuplicates!0 a!3488 lt!464280 Nil!22185)))

(declare-datatypes ((Unit!34424 0))(
  ( (Unit!34425) )
))
(declare-fun lt!464279 () Unit!34424)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66273 (_ BitVec 32) (_ BitVec 32)) Unit!34424)

(assert (=> b!1051463 (= lt!464279 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464280))))

(declare-fun b!1051464 () Bool)

(assert (=> b!1051464 (= e!596864 (not e!596865))))

(declare-fun res!700585 () Bool)

(assert (=> b!1051464 (=> res!700585 e!596865)))

(assert (=> b!1051464 (= res!700585 (or (bvsgt lt!464280 i!1381) (bvsle i!1381 lt!464280)))))

(declare-fun e!596869 () Bool)

(assert (=> b!1051464 e!596869))

(declare-fun res!700586 () Bool)

(assert (=> b!1051464 (=> (not res!700586) (not e!596869))))

(assert (=> b!1051464 (= res!700586 (= (select (store (arr!31876 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464280) k!2747))))

(declare-fun b!1051465 () Bool)

(declare-fun e!596868 () Bool)

(assert (=> b!1051465 (= e!596869 e!596868)))

(declare-fun res!700587 () Bool)

(assert (=> b!1051465 (=> res!700587 e!596868)))

(assert (=> b!1051465 (= res!700587 (or (bvsgt lt!464280 i!1381) (bvsle i!1381 lt!464280)))))

(declare-fun b!1051466 () Bool)

(assert (=> b!1051466 (= e!596868 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!92472 res!700592) b!1051458))

(assert (= (and b!1051458 res!700588) b!1051461))

(assert (= (and b!1051461 res!700590) b!1051460))

(assert (= (and b!1051460 res!700591) b!1051462))

(assert (= (and b!1051462 res!700584) b!1051459))

(assert (= (and b!1051459 res!700589) b!1051464))

(assert (= (and b!1051464 res!700586) b!1051465))

(assert (= (and b!1051465 (not res!700587)) b!1051466))

(assert (= (and b!1051464 (not res!700585)) b!1051463))

(declare-fun m!971957 () Bool)

(assert (=> b!1051461 m!971957))

(declare-fun m!971959 () Bool)

(assert (=> b!1051459 m!971959))

(declare-fun m!971961 () Bool)

(assert (=> b!1051463 m!971961))

(declare-fun m!971963 () Bool)

(assert (=> b!1051463 m!971963))

(declare-fun m!971965 () Bool)

(assert (=> b!1051460 m!971965))

(declare-fun m!971967 () Bool)

(assert (=> b!1051466 m!971967))

(declare-fun m!971969 () Bool)

(assert (=> b!1051462 m!971969))

(declare-fun m!971971 () Bool)

(assert (=> b!1051462 m!971971))

(declare-fun m!971973 () Bool)

(assert (=> start!92472 m!971973))

(declare-fun m!971975 () Bool)

(assert (=> b!1051458 m!971975))

(assert (=> b!1051464 m!971971))

(declare-fun m!971977 () Bool)

(assert (=> b!1051464 m!971977))

(push 1)

