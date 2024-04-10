; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92836 () Bool)

(assert start!92836)

(declare-fun b!1054257 () Bool)

(declare-fun e!598914 () Bool)

(declare-fun e!598913 () Bool)

(assert (=> b!1054257 (= e!598914 (not e!598913))))

(declare-fun res!703199 () Bool)

(assert (=> b!1054257 (=> res!703199 e!598913)))

(declare-fun lt!465351 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054257 (= res!703199 (bvsle lt!465351 i!1381))))

(declare-fun e!598911 () Bool)

(assert (=> b!1054257 e!598911))

(declare-fun res!703205 () Bool)

(assert (=> b!1054257 (=> (not res!703205) (not e!598911))))

(declare-datatypes ((array!66496 0))(
  ( (array!66497 (arr!31980 (Array (_ BitVec 32) (_ BitVec 64))) (size!32516 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66496)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1054257 (= res!703205 (= (select (store (arr!31980 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465351) k!2747))))

(declare-fun b!1054258 () Bool)

(declare-fun e!598912 () Bool)

(declare-fun e!598915 () Bool)

(assert (=> b!1054258 (= e!598912 e!598915)))

(declare-fun res!703201 () Bool)

(assert (=> b!1054258 (=> (not res!703201) (not e!598915))))

(declare-fun lt!465350 () array!66496)

(declare-fun arrayContainsKey!0 (array!66496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054258 (= res!703201 (arrayContainsKey!0 lt!465350 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054258 (= lt!465350 (array!66497 (store (arr!31980 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32516 a!3488)))))

(declare-fun b!1054259 () Bool)

(assert (=> b!1054259 (= e!598915 e!598914)))

(declare-fun res!703198 () Bool)

(assert (=> b!1054259 (=> (not res!703198) (not e!598914))))

(assert (=> b!1054259 (= res!703198 (not (= lt!465351 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66496 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054259 (= lt!465351 (arrayScanForKey!0 lt!465350 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054260 () Bool)

(assert (=> b!1054260 (= e!598913 (or (bvslt lt!465351 #b00000000000000000000000000000000) (bvsge lt!465351 (size!32516 a!3488)) (bvsge (bvadd #b00000000000000000000000000000001 i!1381) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!22292 0))(
  ( (Nil!22289) (Cons!22288 (h!23497 (_ BitVec 64)) (t!31599 List!22292)) )
))
(declare-fun arrayNoDuplicates!0 (array!66496 (_ BitVec 32) List!22292) Bool)

(assert (=> b!1054260 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22289)))

(declare-datatypes ((Unit!34518 0))(
  ( (Unit!34519) )
))
(declare-fun lt!465349 () Unit!34518)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66496 (_ BitVec 32) (_ BitVec 32)) Unit!34518)

(assert (=> b!1054260 (= lt!465349 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054261 () Bool)

(declare-fun e!598910 () Bool)

(assert (=> b!1054261 (= e!598911 e!598910)))

(declare-fun res!703203 () Bool)

(assert (=> b!1054261 (=> res!703203 e!598910)))

(assert (=> b!1054261 (= res!703203 (bvsle lt!465351 i!1381))))

(declare-fun b!1054262 () Bool)

(declare-fun res!703200 () Bool)

(assert (=> b!1054262 (=> (not res!703200) (not e!598912))))

(assert (=> b!1054262 (= res!703200 (= (select (arr!31980 a!3488) i!1381) k!2747))))

(declare-fun b!1054263 () Bool)

(assert (=> b!1054263 (= e!598910 (arrayContainsKey!0 a!3488 k!2747 lt!465351))))

(declare-fun b!1054264 () Bool)

(declare-fun res!703202 () Bool)

(assert (=> b!1054264 (=> (not res!703202) (not e!598912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054264 (= res!703202 (validKeyInArray!0 k!2747))))

(declare-fun b!1054265 () Bool)

(declare-fun res!703197 () Bool)

(assert (=> b!1054265 (=> (not res!703197) (not e!598912))))

(assert (=> b!1054265 (= res!703197 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22289))))

(declare-fun res!703204 () Bool)

(assert (=> start!92836 (=> (not res!703204) (not e!598912))))

(assert (=> start!92836 (= res!703204 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32516 a!3488)) (bvslt (size!32516 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92836 e!598912))

(assert (=> start!92836 true))

(declare-fun array_inv!24760 (array!66496) Bool)

(assert (=> start!92836 (array_inv!24760 a!3488)))

(assert (= (and start!92836 res!703204) b!1054265))

(assert (= (and b!1054265 res!703197) b!1054264))

(assert (= (and b!1054264 res!703202) b!1054262))

(assert (= (and b!1054262 res!703200) b!1054258))

(assert (= (and b!1054258 res!703201) b!1054259))

(assert (= (and b!1054259 res!703198) b!1054257))

(assert (= (and b!1054257 res!703205) b!1054261))

(assert (= (and b!1054261 (not res!703203)) b!1054263))

(assert (= (and b!1054257 (not res!703199)) b!1054260))

(declare-fun m!974359 () Bool)

(assert (=> b!1054259 m!974359))

(declare-fun m!974361 () Bool)

(assert (=> b!1054263 m!974361))

(declare-fun m!974363 () Bool)

(assert (=> b!1054260 m!974363))

(declare-fun m!974365 () Bool)

(assert (=> b!1054260 m!974365))

(declare-fun m!974367 () Bool)

(assert (=> b!1054265 m!974367))

(declare-fun m!974369 () Bool)

(assert (=> b!1054257 m!974369))

(declare-fun m!974371 () Bool)

(assert (=> b!1054257 m!974371))

(declare-fun m!974373 () Bool)

(assert (=> b!1054262 m!974373))

(declare-fun m!974375 () Bool)

(assert (=> b!1054258 m!974375))

(assert (=> b!1054258 m!974369))

(declare-fun m!974377 () Bool)

(assert (=> b!1054264 m!974377))

(declare-fun m!974379 () Bool)

(assert (=> start!92836 m!974379))

(push 1)

(assert (not start!92836))

(assert (not b!1054263))

(assert (not b!1054265))

