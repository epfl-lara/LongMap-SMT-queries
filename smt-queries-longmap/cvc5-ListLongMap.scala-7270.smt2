; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92838 () Bool)

(assert start!92838)

(declare-fun res!703231 () Bool)

(declare-fun e!598933 () Bool)

(assert (=> start!92838 (=> (not res!703231) (not e!598933))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66498 0))(
  ( (array!66499 (arr!31981 (Array (_ BitVec 32) (_ BitVec 64))) (size!32517 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66498)

(assert (=> start!92838 (= res!703231 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32517 a!3488)) (bvslt (size!32517 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92838 e!598933))

(assert (=> start!92838 true))

(declare-fun array_inv!24761 (array!66498) Bool)

(assert (=> start!92838 (array_inv!24761 a!3488)))

(declare-fun b!1054284 () Bool)

(declare-fun e!598932 () Bool)

(declare-fun e!598930 () Bool)

(assert (=> b!1054284 (= e!598932 e!598930)))

(declare-fun res!703230 () Bool)

(assert (=> b!1054284 (=> res!703230 e!598930)))

(declare-fun lt!465360 () (_ BitVec 32))

(assert (=> b!1054284 (= res!703230 (bvsle lt!465360 i!1381))))

(declare-fun b!1054285 () Bool)

(declare-fun res!703225 () Bool)

(assert (=> b!1054285 (=> (not res!703225) (not e!598933))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1054285 (= res!703225 (= (select (arr!31981 a!3488) i!1381) k!2747))))

(declare-fun b!1054286 () Bool)

(declare-fun res!703229 () Bool)

(assert (=> b!1054286 (=> (not res!703229) (not e!598933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054286 (= res!703229 (validKeyInArray!0 k!2747))))

(declare-fun b!1054287 () Bool)

(declare-fun e!598936 () Bool)

(assert (=> b!1054287 (= e!598936 true)))

(declare-datatypes ((List!22293 0))(
  ( (Nil!22290) (Cons!22289 (h!23498 (_ BitVec 64)) (t!31600 List!22293)) )
))
(declare-fun arrayNoDuplicates!0 (array!66498 (_ BitVec 32) List!22293) Bool)

(assert (=> b!1054287 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22290)))

(declare-datatypes ((Unit!34520 0))(
  ( (Unit!34521) )
))
(declare-fun lt!465359 () Unit!34520)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66498 (_ BitVec 32) (_ BitVec 32)) Unit!34520)

(assert (=> b!1054287 (= lt!465359 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054288 () Bool)

(declare-fun e!598934 () Bool)

(declare-fun e!598935 () Bool)

(assert (=> b!1054288 (= e!598934 e!598935)))

(declare-fun res!703232 () Bool)

(assert (=> b!1054288 (=> (not res!703232) (not e!598935))))

(assert (=> b!1054288 (= res!703232 (not (= lt!465360 i!1381)))))

(declare-fun lt!465358 () array!66498)

(declare-fun arrayScanForKey!0 (array!66498 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054288 (= lt!465360 (arrayScanForKey!0 lt!465358 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054289 () Bool)

(declare-fun arrayContainsKey!0 (array!66498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054289 (= e!598930 (arrayContainsKey!0 a!3488 k!2747 lt!465360))))

(declare-fun b!1054290 () Bool)

(assert (=> b!1054290 (= e!598933 e!598934)))

(declare-fun res!703226 () Bool)

(assert (=> b!1054290 (=> (not res!703226) (not e!598934))))

(assert (=> b!1054290 (= res!703226 (arrayContainsKey!0 lt!465358 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054290 (= lt!465358 (array!66499 (store (arr!31981 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32517 a!3488)))))

(declare-fun b!1054291 () Bool)

(declare-fun res!703228 () Bool)

(assert (=> b!1054291 (=> (not res!703228) (not e!598933))))

(assert (=> b!1054291 (= res!703228 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22290))))

(declare-fun b!1054292 () Bool)

(assert (=> b!1054292 (= e!598935 (not e!598936))))

(declare-fun res!703227 () Bool)

(assert (=> b!1054292 (=> res!703227 e!598936)))

(assert (=> b!1054292 (= res!703227 (bvsle lt!465360 i!1381))))

(assert (=> b!1054292 e!598932))

(declare-fun res!703224 () Bool)

(assert (=> b!1054292 (=> (not res!703224) (not e!598932))))

(assert (=> b!1054292 (= res!703224 (= (select (store (arr!31981 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465360) k!2747))))

(assert (= (and start!92838 res!703231) b!1054291))

(assert (= (and b!1054291 res!703228) b!1054286))

(assert (= (and b!1054286 res!703229) b!1054285))

(assert (= (and b!1054285 res!703225) b!1054290))

(assert (= (and b!1054290 res!703226) b!1054288))

(assert (= (and b!1054288 res!703232) b!1054292))

(assert (= (and b!1054292 res!703224) b!1054284))

(assert (= (and b!1054284 (not res!703230)) b!1054289))

(assert (= (and b!1054292 (not res!703227)) b!1054287))

(declare-fun m!974381 () Bool)

(assert (=> b!1054289 m!974381))

(declare-fun m!974383 () Bool)

(assert (=> b!1054288 m!974383))

(declare-fun m!974385 () Bool)

(assert (=> b!1054287 m!974385))

(declare-fun m!974387 () Bool)

(assert (=> b!1054287 m!974387))

(declare-fun m!974389 () Bool)

(assert (=> b!1054291 m!974389))

(declare-fun m!974391 () Bool)

(assert (=> b!1054290 m!974391))

(declare-fun m!974393 () Bool)

(assert (=> b!1054290 m!974393))

(declare-fun m!974395 () Bool)

(assert (=> start!92838 m!974395))

(assert (=> b!1054292 m!974393))

(declare-fun m!974397 () Bool)

(assert (=> b!1054292 m!974397))

(declare-fun m!974399 () Bool)

(assert (=> b!1054285 m!974399))

(declare-fun m!974401 () Bool)

(assert (=> b!1054286 m!974401))

(push 1)

