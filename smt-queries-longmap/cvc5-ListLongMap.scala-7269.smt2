; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92832 () Bool)

(assert start!92832)

(declare-fun res!703145 () Bool)

(declare-fun e!598872 () Bool)

(assert (=> start!92832 (=> (not res!703145) (not e!598872))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66492 0))(
  ( (array!66493 (arr!31978 (Array (_ BitVec 32) (_ BitVec 64))) (size!32514 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66492)

(assert (=> start!92832 (= res!703145 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32514 a!3488)) (bvslt (size!32514 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92832 e!598872))

(assert (=> start!92832 true))

(declare-fun array_inv!24758 (array!66492) Bool)

(assert (=> start!92832 (array_inv!24758 a!3488)))

(declare-fun b!1054203 () Bool)

(declare-fun e!598868 () Bool)

(declare-fun e!598867 () Bool)

(assert (=> b!1054203 (= e!598868 (not e!598867))))

(declare-fun res!703150 () Bool)

(assert (=> b!1054203 (=> res!703150 e!598867)))

(declare-fun lt!465333 () (_ BitVec 32))

(assert (=> b!1054203 (= res!703150 (bvsle lt!465333 i!1381))))

(declare-fun e!598870 () Bool)

(assert (=> b!1054203 e!598870))

(declare-fun res!703144 () Bool)

(assert (=> b!1054203 (=> (not res!703144) (not e!598870))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1054203 (= res!703144 (= (select (store (arr!31978 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465333) k!2747))))

(declare-fun b!1054204 () Bool)

(declare-fun res!703147 () Bool)

(assert (=> b!1054204 (=> (not res!703147) (not e!598872))))

(assert (=> b!1054204 (= res!703147 (= (select (arr!31978 a!3488) i!1381) k!2747))))

(declare-fun b!1054205 () Bool)

(declare-fun res!703148 () Bool)

(assert (=> b!1054205 (=> (not res!703148) (not e!598872))))

(declare-datatypes ((List!22290 0))(
  ( (Nil!22287) (Cons!22286 (h!23495 (_ BitVec 64)) (t!31597 List!22290)) )
))
(declare-fun arrayNoDuplicates!0 (array!66492 (_ BitVec 32) List!22290) Bool)

(assert (=> b!1054205 (= res!703148 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22287))))

(declare-fun b!1054206 () Bool)

(assert (=> b!1054206 (= e!598867 (or (bvslt lt!465333 #b00000000000000000000000000000000) (bvsge lt!465333 (size!32514 a!3488)) (bvsge (bvadd #b00000000000000000000000000000001 i!1381) #b00000000000000000000000000000000)))))

(assert (=> b!1054206 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22287)))

(declare-datatypes ((Unit!34514 0))(
  ( (Unit!34515) )
))
(declare-fun lt!465332 () Unit!34514)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66492 (_ BitVec 32) (_ BitVec 32)) Unit!34514)

(assert (=> b!1054206 (= lt!465332 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054207 () Bool)

(declare-fun e!598873 () Bool)

(assert (=> b!1054207 (= e!598873 e!598868)))

(declare-fun res!703143 () Bool)

(assert (=> b!1054207 (=> (not res!703143) (not e!598868))))

(assert (=> b!1054207 (= res!703143 (not (= lt!465333 i!1381)))))

(declare-fun lt!465331 () array!66492)

(declare-fun arrayScanForKey!0 (array!66492 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054207 (= lt!465333 (arrayScanForKey!0 lt!465331 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054208 () Bool)

(declare-fun e!598871 () Bool)

(assert (=> b!1054208 (= e!598870 e!598871)))

(declare-fun res!703149 () Bool)

(assert (=> b!1054208 (=> res!703149 e!598871)))

(assert (=> b!1054208 (= res!703149 (bvsle lt!465333 i!1381))))

(declare-fun b!1054209 () Bool)

(assert (=> b!1054209 (= e!598872 e!598873)))

(declare-fun res!703151 () Bool)

(assert (=> b!1054209 (=> (not res!703151) (not e!598873))))

(declare-fun arrayContainsKey!0 (array!66492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054209 (= res!703151 (arrayContainsKey!0 lt!465331 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054209 (= lt!465331 (array!66493 (store (arr!31978 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32514 a!3488)))))

(declare-fun b!1054210 () Bool)

(declare-fun res!703146 () Bool)

(assert (=> b!1054210 (=> (not res!703146) (not e!598872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054210 (= res!703146 (validKeyInArray!0 k!2747))))

(declare-fun b!1054211 () Bool)

(assert (=> b!1054211 (= e!598871 (arrayContainsKey!0 a!3488 k!2747 lt!465333))))

(assert (= (and start!92832 res!703145) b!1054205))

(assert (= (and b!1054205 res!703148) b!1054210))

(assert (= (and b!1054210 res!703146) b!1054204))

(assert (= (and b!1054204 res!703147) b!1054209))

(assert (= (and b!1054209 res!703151) b!1054207))

(assert (= (and b!1054207 res!703143) b!1054203))

(assert (= (and b!1054203 res!703144) b!1054208))

(assert (= (and b!1054208 (not res!703149)) b!1054211))

(assert (= (and b!1054203 (not res!703150)) b!1054206))

(declare-fun m!974315 () Bool)

(assert (=> b!1054203 m!974315))

(declare-fun m!974317 () Bool)

(assert (=> b!1054203 m!974317))

(declare-fun m!974319 () Bool)

(assert (=> b!1054204 m!974319))

(declare-fun m!974321 () Bool)

(assert (=> b!1054209 m!974321))

(assert (=> b!1054209 m!974315))

(declare-fun m!974323 () Bool)

(assert (=> b!1054206 m!974323))

(declare-fun m!974325 () Bool)

(assert (=> b!1054206 m!974325))

(declare-fun m!974327 () Bool)

(assert (=> start!92832 m!974327))

(declare-fun m!974329 () Bool)

(assert (=> b!1054207 m!974329))

(declare-fun m!974331 () Bool)

(assert (=> b!1054211 m!974331))

(declare-fun m!974333 () Bool)

(assert (=> b!1054210 m!974333))

(declare-fun m!974335 () Bool)

(assert (=> b!1054205 m!974335))

(push 1)

