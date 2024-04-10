; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92446 () Bool)

(assert start!92446)

(declare-fun b!1051107 () Bool)

(declare-fun e!596591 () Bool)

(declare-fun e!596596 () Bool)

(assert (=> b!1051107 (= e!596591 e!596596)))

(declare-fun res!700241 () Bool)

(assert (=> b!1051107 (=> (not res!700241) (not e!596596))))

(declare-fun lt!464161 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051107 (= res!700241 (not (= lt!464161 i!1381)))))

(declare-datatypes ((array!66247 0))(
  ( (array!66248 (arr!31863 (Array (_ BitVec 32) (_ BitVec 64))) (size!32399 (_ BitVec 32))) )
))
(declare-fun lt!464162 () array!66247)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66247 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051107 (= lt!464161 (arrayScanForKey!0 lt!464162 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051108 () Bool)

(declare-fun e!596592 () Bool)

(assert (=> b!1051108 (= e!596592 true)))

(declare-fun a!3488 () array!66247)

(declare-datatypes ((List!22175 0))(
  ( (Nil!22172) (Cons!22171 (h!23380 (_ BitVec 64)) (t!31482 List!22175)) )
))
(declare-fun arrayNoDuplicates!0 (array!66247 (_ BitVec 32) List!22175) Bool)

(assert (=> b!1051108 (arrayNoDuplicates!0 a!3488 lt!464161 Nil!22172)))

(declare-datatypes ((Unit!34398 0))(
  ( (Unit!34399) )
))
(declare-fun lt!464163 () Unit!34398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66247 (_ BitVec 32) (_ BitVec 32)) Unit!34398)

(assert (=> b!1051108 (= lt!464163 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464161))))

(declare-fun b!1051109 () Bool)

(declare-fun res!700240 () Bool)

(declare-fun e!596593 () Bool)

(assert (=> b!1051109 (=> (not res!700240) (not e!596593))))

(assert (=> b!1051109 (= res!700240 (= (select (arr!31863 a!3488) i!1381) k!2747))))

(declare-fun e!596595 () Bool)

(declare-fun b!1051110 () Bool)

(declare-fun arrayContainsKey!0 (array!66247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051110 (= e!596595 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051111 () Bool)

(declare-fun res!700237 () Bool)

(assert (=> b!1051111 (=> (not res!700237) (not e!596593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051111 (= res!700237 (validKeyInArray!0 k!2747))))

(declare-fun b!1051112 () Bool)

(declare-fun res!700234 () Bool)

(assert (=> b!1051112 (=> (not res!700234) (not e!596593))))

(assert (=> b!1051112 (= res!700234 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22172))))

(declare-fun res!700239 () Bool)

(assert (=> start!92446 (=> (not res!700239) (not e!596593))))

(assert (=> start!92446 (= res!700239 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32399 a!3488)) (bvslt (size!32399 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92446 e!596593))

(assert (=> start!92446 true))

(declare-fun array_inv!24643 (array!66247) Bool)

(assert (=> start!92446 (array_inv!24643 a!3488)))

(declare-fun b!1051113 () Bool)

(assert (=> b!1051113 (= e!596596 (not e!596592))))

(declare-fun res!700233 () Bool)

(assert (=> b!1051113 (=> res!700233 e!596592)))

(assert (=> b!1051113 (= res!700233 (or (bvsgt lt!464161 i!1381) (bvsle i!1381 lt!464161)))))

(declare-fun e!596594 () Bool)

(assert (=> b!1051113 e!596594))

(declare-fun res!700236 () Bool)

(assert (=> b!1051113 (=> (not res!700236) (not e!596594))))

(assert (=> b!1051113 (= res!700236 (= (select (store (arr!31863 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464161) k!2747))))

(declare-fun b!1051114 () Bool)

(assert (=> b!1051114 (= e!596594 e!596595)))

(declare-fun res!700238 () Bool)

(assert (=> b!1051114 (=> res!700238 e!596595)))

(assert (=> b!1051114 (= res!700238 (or (bvsgt lt!464161 i!1381) (bvsle i!1381 lt!464161)))))

(declare-fun b!1051115 () Bool)

(assert (=> b!1051115 (= e!596593 e!596591)))

(declare-fun res!700235 () Bool)

(assert (=> b!1051115 (=> (not res!700235) (not e!596591))))

(assert (=> b!1051115 (= res!700235 (arrayContainsKey!0 lt!464162 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051115 (= lt!464162 (array!66248 (store (arr!31863 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32399 a!3488)))))

(assert (= (and start!92446 res!700239) b!1051112))

(assert (= (and b!1051112 res!700234) b!1051111))

(assert (= (and b!1051111 res!700237) b!1051109))

(assert (= (and b!1051109 res!700240) b!1051115))

(assert (= (and b!1051115 res!700235) b!1051107))

(assert (= (and b!1051107 res!700241) b!1051113))

(assert (= (and b!1051113 res!700236) b!1051114))

(assert (= (and b!1051114 (not res!700238)) b!1051110))

(assert (= (and b!1051113 (not res!700233)) b!1051108))

(declare-fun m!971671 () Bool)

(assert (=> start!92446 m!971671))

(declare-fun m!971673 () Bool)

(assert (=> b!1051110 m!971673))

(declare-fun m!971675 () Bool)

(assert (=> b!1051108 m!971675))

(declare-fun m!971677 () Bool)

(assert (=> b!1051108 m!971677))

(declare-fun m!971679 () Bool)

(assert (=> b!1051111 m!971679))

(declare-fun m!971681 () Bool)

(assert (=> b!1051115 m!971681))

(declare-fun m!971683 () Bool)

(assert (=> b!1051115 m!971683))

(declare-fun m!971685 () Bool)

(assert (=> b!1051109 m!971685))

(declare-fun m!971687 () Bool)

(assert (=> b!1051112 m!971687))

(declare-fun m!971689 () Bool)

(assert (=> b!1051107 m!971689))

(assert (=> b!1051113 m!971683))

(declare-fun m!971691 () Bool)

(assert (=> b!1051113 m!971691))

(push 1)

(assert (not b!1051111))

(assert (not b!1051112))

(assert (not start!92446))

(assert (not b!1051108))

(assert (not b!1051110))

(assert (not b!1051115))

(assert (not b!1051107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

