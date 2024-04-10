; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92434 () Bool)

(assert start!92434)

(declare-fun b!1050955 () Bool)

(declare-fun e!596479 () Bool)

(declare-fun e!596474 () Bool)

(assert (=> b!1050955 (= e!596479 e!596474)))

(declare-fun res!700081 () Bool)

(assert (=> b!1050955 (=> (not res!700081) (not e!596474))))

(declare-fun lt!464117 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050955 (= res!700081 (not (= lt!464117 i!1381)))))

(declare-datatypes ((array!66235 0))(
  ( (array!66236 (arr!31857 (Array (_ BitVec 32) (_ BitVec 64))) (size!32393 (_ BitVec 32))) )
))
(declare-fun lt!464118 () array!66235)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66235 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050955 (= lt!464117 (arrayScanForKey!0 lt!464118 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050956 () Bool)

(declare-fun res!700087 () Bool)

(declare-fun e!596477 () Bool)

(assert (=> b!1050956 (=> (not res!700087) (not e!596477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050956 (= res!700087 (validKeyInArray!0 k!2747))))

(declare-fun res!700083 () Bool)

(assert (=> start!92434 (=> (not res!700083) (not e!596477))))

(declare-fun a!3488 () array!66235)

(assert (=> start!92434 (= res!700083 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32393 a!3488)) (bvslt (size!32393 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92434 e!596477))

(assert (=> start!92434 true))

(declare-fun array_inv!24637 (array!66235) Bool)

(assert (=> start!92434 (array_inv!24637 a!3488)))

(declare-fun b!1050957 () Bool)

(declare-fun res!700086 () Bool)

(assert (=> b!1050957 (=> (not res!700086) (not e!596477))))

(declare-datatypes ((List!22169 0))(
  ( (Nil!22166) (Cons!22165 (h!23374 (_ BitVec 64)) (t!31476 List!22169)) )
))
(declare-fun arrayNoDuplicates!0 (array!66235 (_ BitVec 32) List!22169) Bool)

(assert (=> b!1050957 (= res!700086 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22166))))

(declare-fun b!1050958 () Bool)

(assert (=> b!1050958 (= e!596477 e!596479)))

(declare-fun res!700084 () Bool)

(assert (=> b!1050958 (=> (not res!700084) (not e!596479))))

(declare-fun arrayContainsKey!0 (array!66235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050958 (= res!700084 (arrayContainsKey!0 lt!464118 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050958 (= lt!464118 (array!66236 (store (arr!31857 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32393 a!3488)))))

(declare-fun b!1050959 () Bool)

(declare-fun e!596476 () Bool)

(declare-fun e!596478 () Bool)

(assert (=> b!1050959 (= e!596476 e!596478)))

(declare-fun res!700085 () Bool)

(assert (=> b!1050959 (=> res!700085 e!596478)))

(assert (=> b!1050959 (= res!700085 (or (bvsgt lt!464117 i!1381) (bvsle i!1381 lt!464117)))))

(declare-fun b!1050960 () Bool)

(assert (=> b!1050960 (= e!596474 (not true))))

(assert (=> b!1050960 e!596476))

(declare-fun res!700088 () Bool)

(assert (=> b!1050960 (=> (not res!700088) (not e!596476))))

(assert (=> b!1050960 (= res!700088 (= (select (store (arr!31857 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464117) k!2747))))

(declare-fun b!1050961 () Bool)

(declare-fun res!700082 () Bool)

(assert (=> b!1050961 (=> (not res!700082) (not e!596477))))

(assert (=> b!1050961 (= res!700082 (= (select (arr!31857 a!3488) i!1381) k!2747))))

(declare-fun b!1050962 () Bool)

(assert (=> b!1050962 (= e!596478 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!92434 res!700083) b!1050957))

(assert (= (and b!1050957 res!700086) b!1050956))

(assert (= (and b!1050956 res!700087) b!1050961))

(assert (= (and b!1050961 res!700082) b!1050958))

(assert (= (and b!1050958 res!700084) b!1050955))

(assert (= (and b!1050955 res!700081) b!1050960))

(assert (= (and b!1050960 res!700088) b!1050959))

(assert (= (and b!1050959 (not res!700085)) b!1050962))

(declare-fun m!971555 () Bool)

(assert (=> b!1050955 m!971555))

(declare-fun m!971557 () Bool)

(assert (=> b!1050962 m!971557))

(declare-fun m!971559 () Bool)

(assert (=> start!92434 m!971559))

(declare-fun m!971561 () Bool)

(assert (=> b!1050960 m!971561))

(declare-fun m!971563 () Bool)

(assert (=> b!1050960 m!971563))

(declare-fun m!971565 () Bool)

(assert (=> b!1050958 m!971565))

(assert (=> b!1050958 m!971561))

(declare-fun m!971567 () Bool)

(assert (=> b!1050956 m!971567))

(declare-fun m!971569 () Bool)

(assert (=> b!1050961 m!971569))

(declare-fun m!971571 () Bool)

(assert (=> b!1050957 m!971571))

(push 1)

(assert (not b!1050962))

(assert (not b!1050957))

(assert (not b!1050956))

(assert (not b!1050958))

(assert (not start!92434))

(assert (not b!1050955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

