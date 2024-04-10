; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92460 () Bool)

(assert start!92460)

(declare-fun b!1051296 () Bool)

(declare-fun e!596739 () Bool)

(declare-fun e!596737 () Bool)

(assert (=> b!1051296 (= e!596739 e!596737)))

(declare-fun res!700430 () Bool)

(assert (=> b!1051296 (=> res!700430 e!596737)))

(declare-fun lt!464224 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051296 (= res!700430 (or (bvsgt lt!464224 i!1381) (bvsle i!1381 lt!464224)))))

(declare-fun b!1051297 () Bool)

(declare-fun e!596742 () Bool)

(declare-fun e!596741 () Bool)

(assert (=> b!1051297 (= e!596742 e!596741)))

(declare-fun res!700425 () Bool)

(assert (=> b!1051297 (=> (not res!700425) (not e!596741))))

(assert (=> b!1051297 (= res!700425 (not (= lt!464224 i!1381)))))

(declare-datatypes ((array!66261 0))(
  ( (array!66262 (arr!31870 (Array (_ BitVec 32) (_ BitVec 64))) (size!32406 (_ BitVec 32))) )
))
(declare-fun lt!464225 () array!66261)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66261 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051297 (= lt!464224 (arrayScanForKey!0 lt!464225 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051298 () Bool)

(declare-fun e!596738 () Bool)

(assert (=> b!1051298 (= e!596741 (not e!596738))))

(declare-fun res!700426 () Bool)

(assert (=> b!1051298 (=> res!700426 e!596738)))

(assert (=> b!1051298 (= res!700426 (or (bvsgt lt!464224 i!1381) (bvsle i!1381 lt!464224)))))

(assert (=> b!1051298 e!596739))

(declare-fun res!700424 () Bool)

(assert (=> b!1051298 (=> (not res!700424) (not e!596739))))

(declare-fun a!3488 () array!66261)

(assert (=> b!1051298 (= res!700424 (= (select (store (arr!31870 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464224) k!2747))))

(declare-fun b!1051299 () Bool)

(declare-fun res!700428 () Bool)

(declare-fun e!596740 () Bool)

(assert (=> b!1051299 (=> (not res!700428) (not e!596740))))

(declare-datatypes ((List!22182 0))(
  ( (Nil!22179) (Cons!22178 (h!23387 (_ BitVec 64)) (t!31489 List!22182)) )
))
(declare-fun arrayNoDuplicates!0 (array!66261 (_ BitVec 32) List!22182) Bool)

(assert (=> b!1051299 (= res!700428 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22179))))

(declare-fun b!1051300 () Bool)

(declare-fun res!700427 () Bool)

(assert (=> b!1051300 (=> (not res!700427) (not e!596740))))

(assert (=> b!1051300 (= res!700427 (= (select (arr!31870 a!3488) i!1381) k!2747))))

(declare-fun res!700423 () Bool)

(assert (=> start!92460 (=> (not res!700423) (not e!596740))))

(assert (=> start!92460 (= res!700423 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32406 a!3488)) (bvslt (size!32406 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92460 e!596740))

(assert (=> start!92460 true))

(declare-fun array_inv!24650 (array!66261) Bool)

(assert (=> start!92460 (array_inv!24650 a!3488)))

(declare-fun b!1051301 () Bool)

(declare-fun arrayContainsKey!0 (array!66261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051301 (= e!596737 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051302 () Bool)

(declare-fun res!700422 () Bool)

(assert (=> b!1051302 (=> (not res!700422) (not e!596740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051302 (= res!700422 (validKeyInArray!0 k!2747))))

(declare-fun b!1051303 () Bool)

(assert (=> b!1051303 (= e!596738 true)))

(assert (=> b!1051303 (arrayNoDuplicates!0 a!3488 lt!464224 Nil!22179)))

(declare-datatypes ((Unit!34412 0))(
  ( (Unit!34413) )
))
(declare-fun lt!464226 () Unit!34412)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66261 (_ BitVec 32) (_ BitVec 32)) Unit!34412)

(assert (=> b!1051303 (= lt!464226 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464224))))

(declare-fun b!1051304 () Bool)

(assert (=> b!1051304 (= e!596740 e!596742)))

(declare-fun res!700429 () Bool)

(assert (=> b!1051304 (=> (not res!700429) (not e!596742))))

(assert (=> b!1051304 (= res!700429 (arrayContainsKey!0 lt!464225 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051304 (= lt!464225 (array!66262 (store (arr!31870 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32406 a!3488)))))

(assert (= (and start!92460 res!700423) b!1051299))

(assert (= (and b!1051299 res!700428) b!1051302))

(assert (= (and b!1051302 res!700422) b!1051300))

(assert (= (and b!1051300 res!700427) b!1051304))

(assert (= (and b!1051304 res!700429) b!1051297))

(assert (= (and b!1051297 res!700425) b!1051298))

(assert (= (and b!1051298 res!700424) b!1051296))

(assert (= (and b!1051296 (not res!700430)) b!1051301))

(assert (= (and b!1051298 (not res!700426)) b!1051303))

(declare-fun m!971825 () Bool)

(assert (=> b!1051300 m!971825))

(declare-fun m!971827 () Bool)

(assert (=> b!1051304 m!971827))

(declare-fun m!971829 () Bool)

(assert (=> b!1051304 m!971829))

(declare-fun m!971831 () Bool)

(assert (=> b!1051303 m!971831))

(declare-fun m!971833 () Bool)

(assert (=> b!1051303 m!971833))

(assert (=> b!1051298 m!971829))

(declare-fun m!971835 () Bool)

(assert (=> b!1051298 m!971835))

(declare-fun m!971837 () Bool)

(assert (=> b!1051302 m!971837))

(declare-fun m!971839 () Bool)

(assert (=> b!1051301 m!971839))

(declare-fun m!971841 () Bool)

(assert (=> b!1051297 m!971841))

(declare-fun m!971843 () Bool)

(assert (=> start!92460 m!971843))

(declare-fun m!971845 () Bool)

(assert (=> b!1051299 m!971845))

(push 1)

(assert (not b!1051303))

(assert (not b!1051299))

(assert (not b!1051304))

(assert (not start!92460))

(assert (not b!1051302))

(assert (not b!1051301))

(assert (not b!1051297))

(check-sat)

(pop 1)

