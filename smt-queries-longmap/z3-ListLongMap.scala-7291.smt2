; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93166 () Bool)

(assert start!93166)

(declare-fun b!1056419 () Bool)

(declare-fun e!600609 () Bool)

(assert (=> b!1056419 (= e!600609 true)))

(declare-datatypes ((array!66578 0))(
  ( (array!66579 (arr!32013 (Array (_ BitVec 32) (_ BitVec 64))) (size!32551 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66578)

(declare-fun lt!465935 () (_ BitVec 32))

(declare-datatypes ((List!22384 0))(
  ( (Nil!22381) (Cons!22380 (h!23589 (_ BitVec 64)) (t!31682 List!22384)) )
))
(declare-fun arrayNoDuplicates!0 (array!66578 (_ BitVec 32) List!22384) Bool)

(assert (=> b!1056419 (arrayNoDuplicates!0 a!3488 lt!465935 Nil!22381)))

(declare-datatypes ((Unit!34481 0))(
  ( (Unit!34482) )
))
(declare-fun lt!465936 () Unit!34481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66578 (_ BitVec 32) (_ BitVec 32)) Unit!34481)

(assert (=> b!1056419 (= lt!465936 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465935))))

(declare-fun b!1056420 () Bool)

(declare-fun res!705246 () Bool)

(declare-fun e!600608 () Bool)

(assert (=> b!1056420 (=> (not res!705246) (not e!600608))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056420 (= res!705246 (= (select (arr!32013 a!3488) i!1381) k0!2747))))

(declare-fun b!1056421 () Bool)

(declare-fun e!600605 () Bool)

(assert (=> b!1056421 (= e!600608 e!600605)))

(declare-fun res!705249 () Bool)

(assert (=> b!1056421 (=> (not res!705249) (not e!600605))))

(declare-fun lt!465937 () array!66578)

(declare-fun arrayContainsKey!0 (array!66578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056421 (= res!705249 (arrayContainsKey!0 lt!465937 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056421 (= lt!465937 (array!66579 (store (arr!32013 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32551 a!3488)))))

(declare-fun b!1056422 () Bool)

(declare-fun e!600607 () Bool)

(assert (=> b!1056422 (= e!600605 e!600607)))

(declare-fun res!705247 () Bool)

(assert (=> b!1056422 (=> (not res!705247) (not e!600607))))

(assert (=> b!1056422 (= res!705247 (not (= lt!465935 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66578 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056422 (= lt!465935 (arrayScanForKey!0 lt!465937 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056423 () Bool)

(assert (=> b!1056423 (= e!600607 (not e!600609))))

(declare-fun res!705245 () Bool)

(assert (=> b!1056423 (=> res!705245 e!600609)))

(assert (=> b!1056423 (= res!705245 (or (bvsgt lt!465935 i!1381) (bvsle i!1381 lt!465935)))))

(declare-fun e!600603 () Bool)

(assert (=> b!1056423 e!600603))

(declare-fun res!705248 () Bool)

(assert (=> b!1056423 (=> (not res!705248) (not e!600603))))

(assert (=> b!1056423 (= res!705248 (= (select (store (arr!32013 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465935) k0!2747))))

(declare-fun b!1056424 () Bool)

(declare-fun e!600604 () Bool)

(assert (=> b!1056424 (= e!600603 e!600604)))

(declare-fun res!705253 () Bool)

(assert (=> b!1056424 (=> res!705253 e!600604)))

(assert (=> b!1056424 (= res!705253 (or (bvsgt lt!465935 i!1381) (bvsle i!1381 lt!465935)))))

(declare-fun b!1056425 () Bool)

(declare-fun res!705250 () Bool)

(assert (=> b!1056425 (=> (not res!705250) (not e!600608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056425 (= res!705250 (validKeyInArray!0 k0!2747))))

(declare-fun res!705251 () Bool)

(assert (=> start!93166 (=> (not res!705251) (not e!600608))))

(assert (=> start!93166 (= res!705251 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32551 a!3488)) (bvslt (size!32551 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93166 e!600608))

(assert (=> start!93166 true))

(declare-fun array_inv!24796 (array!66578) Bool)

(assert (=> start!93166 (array_inv!24796 a!3488)))

(declare-fun b!1056426 () Bool)

(declare-fun res!705252 () Bool)

(assert (=> b!1056426 (=> (not res!705252) (not e!600608))))

(assert (=> b!1056426 (= res!705252 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22381))))

(declare-fun b!1056427 () Bool)

(assert (=> b!1056427 (= e!600604 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93166 res!705251) b!1056426))

(assert (= (and b!1056426 res!705252) b!1056425))

(assert (= (and b!1056425 res!705250) b!1056420))

(assert (= (and b!1056420 res!705246) b!1056421))

(assert (= (and b!1056421 res!705249) b!1056422))

(assert (= (and b!1056422 res!705247) b!1056423))

(assert (= (and b!1056423 res!705248) b!1056424))

(assert (= (and b!1056424 (not res!705253)) b!1056427))

(assert (= (and b!1056423 (not res!705245)) b!1056419))

(declare-fun m!975761 () Bool)

(assert (=> b!1056425 m!975761))

(declare-fun m!975763 () Bool)

(assert (=> b!1056427 m!975763))

(declare-fun m!975765 () Bool)

(assert (=> start!93166 m!975765))

(declare-fun m!975767 () Bool)

(assert (=> b!1056423 m!975767))

(declare-fun m!975769 () Bool)

(assert (=> b!1056423 m!975769))

(declare-fun m!975771 () Bool)

(assert (=> b!1056419 m!975771))

(declare-fun m!975773 () Bool)

(assert (=> b!1056419 m!975773))

(declare-fun m!975775 () Bool)

(assert (=> b!1056420 m!975775))

(declare-fun m!975777 () Bool)

(assert (=> b!1056426 m!975777))

(declare-fun m!975779 () Bool)

(assert (=> b!1056422 m!975779))

(declare-fun m!975781 () Bool)

(assert (=> b!1056421 m!975781))

(assert (=> b!1056421 m!975767))

(check-sat (not b!1056421) (not b!1056419) (not b!1056422) (not b!1056427) (not b!1056426) (not start!93166) (not b!1056425))
(check-sat)
