; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92440 () Bool)

(assert start!92440)

(declare-fun b!1051027 () Bool)

(declare-fun res!700154 () Bool)

(declare-fun e!596530 () Bool)

(assert (=> b!1051027 (=> (not res!700154) (not e!596530))))

(declare-datatypes ((array!66241 0))(
  ( (array!66242 (arr!31860 (Array (_ BitVec 32) (_ BitVec 64))) (size!32396 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66241)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051027 (= res!700154 (= (select (arr!31860 a!3488) i!1381) k!2747))))

(declare-fun e!596532 () Bool)

(declare-fun b!1051028 () Bool)

(declare-fun arrayContainsKey!0 (array!66241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051028 (= e!596532 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051029 () Bool)

(declare-fun e!596528 () Bool)

(assert (=> b!1051029 (= e!596528 (not true))))

(declare-fun e!596533 () Bool)

(assert (=> b!1051029 e!596533))

(declare-fun res!700153 () Bool)

(assert (=> b!1051029 (=> (not res!700153) (not e!596533))))

(declare-fun lt!464135 () (_ BitVec 32))

(assert (=> b!1051029 (= res!700153 (= (select (store (arr!31860 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464135) k!2747))))

(declare-fun res!700158 () Bool)

(assert (=> start!92440 (=> (not res!700158) (not e!596530))))

(assert (=> start!92440 (= res!700158 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32396 a!3488)) (bvslt (size!32396 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92440 e!596530))

(assert (=> start!92440 true))

(declare-fun array_inv!24640 (array!66241) Bool)

(assert (=> start!92440 (array_inv!24640 a!3488)))

(declare-fun b!1051030 () Bool)

(declare-fun res!700160 () Bool)

(assert (=> b!1051030 (=> (not res!700160) (not e!596530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051030 (= res!700160 (validKeyInArray!0 k!2747))))

(declare-fun b!1051031 () Bool)

(declare-fun e!596529 () Bool)

(assert (=> b!1051031 (= e!596530 e!596529)))

(declare-fun res!700157 () Bool)

(assert (=> b!1051031 (=> (not res!700157) (not e!596529))))

(declare-fun lt!464136 () array!66241)

(assert (=> b!1051031 (= res!700157 (arrayContainsKey!0 lt!464136 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051031 (= lt!464136 (array!66242 (store (arr!31860 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32396 a!3488)))))

(declare-fun b!1051032 () Bool)

(declare-fun res!700155 () Bool)

(assert (=> b!1051032 (=> (not res!700155) (not e!596530))))

(declare-datatypes ((List!22172 0))(
  ( (Nil!22169) (Cons!22168 (h!23377 (_ BitVec 64)) (t!31479 List!22172)) )
))
(declare-fun arrayNoDuplicates!0 (array!66241 (_ BitVec 32) List!22172) Bool)

(assert (=> b!1051032 (= res!700155 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22169))))

(declare-fun b!1051033 () Bool)

(assert (=> b!1051033 (= e!596533 e!596532)))

(declare-fun res!700159 () Bool)

(assert (=> b!1051033 (=> res!700159 e!596532)))

(assert (=> b!1051033 (= res!700159 (or (bvsgt lt!464135 i!1381) (bvsle i!1381 lt!464135)))))

(declare-fun b!1051034 () Bool)

(assert (=> b!1051034 (= e!596529 e!596528)))

(declare-fun res!700156 () Bool)

(assert (=> b!1051034 (=> (not res!700156) (not e!596528))))

(assert (=> b!1051034 (= res!700156 (not (= lt!464135 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66241 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051034 (= lt!464135 (arrayScanForKey!0 lt!464136 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92440 res!700158) b!1051032))

(assert (= (and b!1051032 res!700155) b!1051030))

(assert (= (and b!1051030 res!700160) b!1051027))

(assert (= (and b!1051027 res!700154) b!1051031))

(assert (= (and b!1051031 res!700157) b!1051034))

(assert (= (and b!1051034 res!700156) b!1051029))

(assert (= (and b!1051029 res!700153) b!1051033))

(assert (= (and b!1051033 (not res!700159)) b!1051028))

(declare-fun m!971609 () Bool)

(assert (=> b!1051029 m!971609))

(declare-fun m!971611 () Bool)

(assert (=> b!1051029 m!971611))

(declare-fun m!971613 () Bool)

(assert (=> start!92440 m!971613))

(declare-fun m!971615 () Bool)

(assert (=> b!1051034 m!971615))

(declare-fun m!971617 () Bool)

(assert (=> b!1051030 m!971617))

(declare-fun m!971619 () Bool)

(assert (=> b!1051032 m!971619))

(declare-fun m!971621 () Bool)

(assert (=> b!1051028 m!971621))

(declare-fun m!971623 () Bool)

(assert (=> b!1051031 m!971623))

(assert (=> b!1051031 m!971609))

(declare-fun m!971625 () Bool)

(assert (=> b!1051027 m!971625))

(push 1)

(assert (not b!1051032))

(assert (not b!1051034))

(assert (not start!92440))

(assert (not b!1051031))

(assert (not b!1051030))

(assert (not b!1051028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

