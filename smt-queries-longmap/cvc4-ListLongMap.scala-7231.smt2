; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92452 () Bool)

(assert start!92452)

(declare-fun b!1051188 () Bool)

(declare-fun e!596653 () Bool)

(assert (=> b!1051188 (= e!596653 true)))

(declare-datatypes ((array!66253 0))(
  ( (array!66254 (arr!31866 (Array (_ BitVec 32) (_ BitVec 64))) (size!32402 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66253)

(declare-fun lt!464190 () (_ BitVec 32))

(declare-datatypes ((List!22178 0))(
  ( (Nil!22175) (Cons!22174 (h!23383 (_ BitVec 64)) (t!31485 List!22178)) )
))
(declare-fun arrayNoDuplicates!0 (array!66253 (_ BitVec 32) List!22178) Bool)

(assert (=> b!1051188 (arrayNoDuplicates!0 a!3488 lt!464190 Nil!22175)))

(declare-datatypes ((Unit!34404 0))(
  ( (Unit!34405) )
))
(declare-fun lt!464189 () Unit!34404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66253 (_ BitVec 32) (_ BitVec 32)) Unit!34404)

(assert (=> b!1051188 (= lt!464189 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464190))))

(declare-fun b!1051189 () Bool)

(declare-fun e!596656 () Bool)

(declare-fun e!596658 () Bool)

(assert (=> b!1051189 (= e!596656 e!596658)))

(declare-fun res!700317 () Bool)

(assert (=> b!1051189 (=> (not res!700317) (not e!596658))))

(declare-fun lt!464188 () array!66253)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051189 (= res!700317 (arrayContainsKey!0 lt!464188 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051189 (= lt!464188 (array!66254 (store (arr!31866 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32402 a!3488)))))

(declare-fun b!1051190 () Bool)

(declare-fun e!596654 () Bool)

(assert (=> b!1051190 (= e!596654 (not e!596653))))

(declare-fun res!700321 () Bool)

(assert (=> b!1051190 (=> res!700321 e!596653)))

(assert (=> b!1051190 (= res!700321 (or (bvsgt lt!464190 i!1381) (bvsle i!1381 lt!464190)))))

(declare-fun e!596659 () Bool)

(assert (=> b!1051190 e!596659))

(declare-fun res!700314 () Bool)

(assert (=> b!1051190 (=> (not res!700314) (not e!596659))))

(assert (=> b!1051190 (= res!700314 (= (select (store (arr!31866 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464190) k!2747))))

(declare-fun b!1051191 () Bool)

(declare-fun e!596657 () Bool)

(assert (=> b!1051191 (= e!596659 e!596657)))

(declare-fun res!700319 () Bool)

(assert (=> b!1051191 (=> res!700319 e!596657)))

(assert (=> b!1051191 (= res!700319 (or (bvsgt lt!464190 i!1381) (bvsle i!1381 lt!464190)))))

(declare-fun b!1051192 () Bool)

(assert (=> b!1051192 (= e!596658 e!596654)))

(declare-fun res!700316 () Bool)

(assert (=> b!1051192 (=> (not res!700316) (not e!596654))))

(assert (=> b!1051192 (= res!700316 (not (= lt!464190 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66253 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051192 (= lt!464190 (arrayScanForKey!0 lt!464188 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!700315 () Bool)

(assert (=> start!92452 (=> (not res!700315) (not e!596656))))

(assert (=> start!92452 (= res!700315 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32402 a!3488)) (bvslt (size!32402 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92452 e!596656))

(assert (=> start!92452 true))

(declare-fun array_inv!24646 (array!66253) Bool)

(assert (=> start!92452 (array_inv!24646 a!3488)))

(declare-fun b!1051193 () Bool)

(declare-fun res!700322 () Bool)

(assert (=> b!1051193 (=> (not res!700322) (not e!596656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051193 (= res!700322 (validKeyInArray!0 k!2747))))

(declare-fun b!1051194 () Bool)

(declare-fun res!700318 () Bool)

(assert (=> b!1051194 (=> (not res!700318) (not e!596656))))

(assert (=> b!1051194 (= res!700318 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22175))))

(declare-fun b!1051195 () Bool)

(assert (=> b!1051195 (= e!596657 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051196 () Bool)

(declare-fun res!700320 () Bool)

(assert (=> b!1051196 (=> (not res!700320) (not e!596656))))

(assert (=> b!1051196 (= res!700320 (= (select (arr!31866 a!3488) i!1381) k!2747))))

(assert (= (and start!92452 res!700315) b!1051194))

(assert (= (and b!1051194 res!700318) b!1051193))

(assert (= (and b!1051193 res!700322) b!1051196))

(assert (= (and b!1051196 res!700320) b!1051189))

(assert (= (and b!1051189 res!700317) b!1051192))

(assert (= (and b!1051192 res!700316) b!1051190))

(assert (= (and b!1051190 res!700314) b!1051191))

(assert (= (and b!1051191 (not res!700319)) b!1051195))

(assert (= (and b!1051190 (not res!700321)) b!1051188))

(declare-fun m!971737 () Bool)

(assert (=> start!92452 m!971737))

(declare-fun m!971739 () Bool)

(assert (=> b!1051193 m!971739))

(declare-fun m!971741 () Bool)

(assert (=> b!1051194 m!971741))

(declare-fun m!971743 () Bool)

(assert (=> b!1051190 m!971743))

(declare-fun m!971745 () Bool)

(assert (=> b!1051190 m!971745))

(declare-fun m!971747 () Bool)

(assert (=> b!1051196 m!971747))

(declare-fun m!971749 () Bool)

(assert (=> b!1051188 m!971749))

(declare-fun m!971751 () Bool)

(assert (=> b!1051188 m!971751))

(declare-fun m!971753 () Bool)

(assert (=> b!1051189 m!971753))

(assert (=> b!1051189 m!971743))

(declare-fun m!971755 () Bool)

(assert (=> b!1051195 m!971755))

(declare-fun m!971757 () Bool)

(assert (=> b!1051192 m!971757))

(push 1)

(assert (not b!1051192))

