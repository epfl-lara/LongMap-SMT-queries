; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93304 () Bool)

(assert start!93304)

(declare-fun b!1057563 () Bool)

(declare-fun res!706228 () Bool)

(declare-fun e!601476 () Bool)

(assert (=> b!1057563 (=> (not res!706228) (not e!601476))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057563 (= res!706228 (validKeyInArray!0 k!2747))))

(declare-fun e!601475 () Bool)

(declare-fun lt!466511 () (_ BitVec 32))

(declare-datatypes ((array!66703 0))(
  ( (array!66704 (arr!32073 (Array (_ BitVec 32) (_ BitVec 64))) (size!32609 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66703)

(declare-fun lt!466512 () (_ BitVec 32))

(declare-fun b!1057564 () Bool)

(assert (=> b!1057564 (= e!601475 (or (bvslt lt!466512 #b00000000000000000000000000000000) (bvslt lt!466511 (size!32609 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057564 (arrayContainsKey!0 a!3488 k!2747 lt!466511)))

(declare-datatypes ((Unit!34668 0))(
  ( (Unit!34669) )
))
(declare-fun lt!466513 () Unit!34668)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34668)

(assert (=> b!1057564 (= lt!466513 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466511))))

(assert (=> b!1057564 (= lt!466511 (bvadd #b00000000000000000000000000000001 lt!466512))))

(declare-datatypes ((List!22385 0))(
  ( (Nil!22382) (Cons!22381 (h!23590 (_ BitVec 64)) (t!31692 List!22385)) )
))
(declare-fun arrayNoDuplicates!0 (array!66703 (_ BitVec 32) List!22385) Bool)

(assert (=> b!1057564 (arrayNoDuplicates!0 a!3488 lt!466512 Nil!22382)))

(declare-fun lt!466515 () Unit!34668)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66703 (_ BitVec 32) (_ BitVec 32)) Unit!34668)

(assert (=> b!1057564 (= lt!466515 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466512))))

(declare-fun b!1057565 () Bool)

(declare-fun res!706226 () Bool)

(assert (=> b!1057565 (=> (not res!706226) (not e!601476))))

(assert (=> b!1057565 (= res!706226 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22382))))

(declare-fun e!601471 () Bool)

(declare-fun b!1057566 () Bool)

(assert (=> b!1057566 (= e!601471 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!706225 () Bool)

(assert (=> start!93304 (=> (not res!706225) (not e!601476))))

(assert (=> start!93304 (= res!706225 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32609 a!3488)) (bvslt (size!32609 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93304 e!601476))

(assert (=> start!93304 true))

(declare-fun array_inv!24853 (array!66703) Bool)

(assert (=> start!93304 (array_inv!24853 a!3488)))

(declare-fun b!1057567 () Bool)

(declare-fun e!601474 () Bool)

(assert (=> b!1057567 (= e!601474 e!601471)))

(declare-fun res!706223 () Bool)

(assert (=> b!1057567 (=> res!706223 e!601471)))

(assert (=> b!1057567 (= res!706223 (or (bvsgt lt!466512 i!1381) (bvsle i!1381 lt!466512)))))

(declare-fun b!1057568 () Bool)

(declare-fun e!601473 () Bool)

(assert (=> b!1057568 (= e!601476 e!601473)))

(declare-fun res!706221 () Bool)

(assert (=> b!1057568 (=> (not res!706221) (not e!601473))))

(declare-fun lt!466514 () array!66703)

(assert (=> b!1057568 (= res!706221 (arrayContainsKey!0 lt!466514 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057568 (= lt!466514 (array!66704 (store (arr!32073 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32609 a!3488)))))

(declare-fun b!1057569 () Bool)

(declare-fun e!601472 () Bool)

(assert (=> b!1057569 (= e!601473 e!601472)))

(declare-fun res!706227 () Bool)

(assert (=> b!1057569 (=> (not res!706227) (not e!601472))))

(assert (=> b!1057569 (= res!706227 (not (= lt!466512 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66703 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057569 (= lt!466512 (arrayScanForKey!0 lt!466514 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057570 () Bool)

(declare-fun res!706224 () Bool)

(assert (=> b!1057570 (=> (not res!706224) (not e!601476))))

(assert (=> b!1057570 (= res!706224 (= (select (arr!32073 a!3488) i!1381) k!2747))))

(declare-fun b!1057571 () Bool)

(assert (=> b!1057571 (= e!601472 (not e!601475))))

(declare-fun res!706229 () Bool)

(assert (=> b!1057571 (=> res!706229 e!601475)))

(assert (=> b!1057571 (= res!706229 (or (bvsgt lt!466512 i!1381) (bvsle i!1381 lt!466512)))))

(assert (=> b!1057571 e!601474))

(declare-fun res!706222 () Bool)

(assert (=> b!1057571 (=> (not res!706222) (not e!601474))))

(assert (=> b!1057571 (= res!706222 (= (select (store (arr!32073 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466512) k!2747))))

(assert (= (and start!93304 res!706225) b!1057565))

(assert (= (and b!1057565 res!706226) b!1057563))

(assert (= (and b!1057563 res!706228) b!1057570))

(assert (= (and b!1057570 res!706224) b!1057568))

(assert (= (and b!1057568 res!706221) b!1057569))

(assert (= (and b!1057569 res!706227) b!1057571))

(assert (= (and b!1057571 res!706222) b!1057567))

(assert (= (and b!1057567 (not res!706223)) b!1057566))

(assert (= (and b!1057571 (not res!706229)) b!1057564))

(declare-fun m!977253 () Bool)

(assert (=> b!1057566 m!977253))

(declare-fun m!977255 () Bool)

(assert (=> start!93304 m!977255))

(declare-fun m!977257 () Bool)

(assert (=> b!1057569 m!977257))

(declare-fun m!977259 () Bool)

(assert (=> b!1057571 m!977259))

(declare-fun m!977261 () Bool)

(assert (=> b!1057571 m!977261))

(declare-fun m!977263 () Bool)

(assert (=> b!1057564 m!977263))

(declare-fun m!977265 () Bool)

(assert (=> b!1057564 m!977265))

(declare-fun m!977267 () Bool)

(assert (=> b!1057564 m!977267))

(declare-fun m!977269 () Bool)

(assert (=> b!1057564 m!977269))

(declare-fun m!977271 () Bool)

(assert (=> b!1057570 m!977271))

(declare-fun m!977273 () Bool)

(assert (=> b!1057565 m!977273))

(declare-fun m!977275 () Bool)

(assert (=> b!1057568 m!977275))

(assert (=> b!1057568 m!977259))

(declare-fun m!977277 () Bool)

(assert (=> b!1057563 m!977277))

(push 1)

(assert (not start!93304))

(assert (not b!1057569))

(assert (not b!1057563))

(assert (not b!1057564))

(assert (not b!1057565))

(assert (not b!1057566))

(assert (not b!1057568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

