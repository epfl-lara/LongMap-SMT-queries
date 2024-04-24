; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92538 () Bool)

(assert start!92538)

(declare-fun b!1050388 () Bool)

(declare-fun e!595989 () Bool)

(assert (=> b!1050388 (= e!595989 true)))

(declare-datatypes ((array!66154 0))(
  ( (array!66155 (arr!31810 (Array (_ BitVec 32) (_ BitVec 64))) (size!32347 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66154)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22092 0))(
  ( (Nil!22089) (Cons!22088 (h!23306 (_ BitVec 64)) (t!31391 List!22092)) )
))
(declare-fun arrayNoDuplicates!0 (array!66154 (_ BitVec 32) List!22092) Bool)

(assert (=> b!1050388 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22089)))

(declare-datatypes ((Unit!34309 0))(
  ( (Unit!34310) )
))
(declare-fun lt!463893 () Unit!34309)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66154 (_ BitVec 32) (_ BitVec 32)) Unit!34309)

(assert (=> b!1050388 (= lt!463893 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050389 () Bool)

(declare-fun e!595992 () Bool)

(declare-fun e!595988 () Bool)

(assert (=> b!1050389 (= e!595992 e!595988)))

(declare-fun res!698709 () Bool)

(assert (=> b!1050389 (=> (not res!698709) (not e!595988))))

(declare-fun lt!463894 () (_ BitVec 32))

(assert (=> b!1050389 (= res!698709 (not (= lt!463894 i!1381)))))

(declare-fun lt!463895 () array!66154)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66154 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050389 (= lt!463894 (arrayScanForKey!0 lt!463895 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!698715 () Bool)

(declare-fun e!595993 () Bool)

(assert (=> start!92538 (=> (not res!698715) (not e!595993))))

(assert (=> start!92538 (= res!698715 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32347 a!3488)) (bvslt (size!32347 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92538 e!595993))

(assert (=> start!92538 true))

(declare-fun array_inv!24592 (array!66154) Bool)

(assert (=> start!92538 (array_inv!24592 a!3488)))

(declare-fun b!1050390 () Bool)

(declare-fun res!698714 () Bool)

(assert (=> b!1050390 (=> (not res!698714) (not e!595993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050390 (= res!698714 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050391 () Bool)

(declare-fun res!698713 () Bool)

(assert (=> b!1050391 (=> (not res!698713) (not e!595993))))

(assert (=> b!1050391 (= res!698713 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22089))))

(declare-fun b!1050392 () Bool)

(assert (=> b!1050392 (= e!595988 (not e!595989))))

(declare-fun res!698712 () Bool)

(assert (=> b!1050392 (=> res!698712 e!595989)))

(assert (=> b!1050392 (= res!698712 (bvsle lt!463894 i!1381))))

(declare-fun e!595990 () Bool)

(assert (=> b!1050392 e!595990))

(declare-fun res!698711 () Bool)

(assert (=> b!1050392 (=> (not res!698711) (not e!595990))))

(assert (=> b!1050392 (= res!698711 (= (select (store (arr!31810 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463894) k0!2747))))

(declare-fun b!1050393 () Bool)

(declare-fun res!698710 () Bool)

(assert (=> b!1050393 (=> (not res!698710) (not e!595993))))

(assert (=> b!1050393 (= res!698710 (= (select (arr!31810 a!3488) i!1381) k0!2747))))

(declare-fun b!1050394 () Bool)

(declare-fun e!595991 () Bool)

(assert (=> b!1050394 (= e!595990 e!595991)))

(declare-fun res!698717 () Bool)

(assert (=> b!1050394 (=> res!698717 e!595991)))

(assert (=> b!1050394 (= res!698717 (bvsle lt!463894 i!1381))))

(declare-fun b!1050395 () Bool)

(declare-fun arrayContainsKey!0 (array!66154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050395 (= e!595991 (arrayContainsKey!0 a!3488 k0!2747 lt!463894))))

(declare-fun b!1050396 () Bool)

(assert (=> b!1050396 (= e!595993 e!595992)))

(declare-fun res!698716 () Bool)

(assert (=> b!1050396 (=> (not res!698716) (not e!595992))))

(assert (=> b!1050396 (= res!698716 (arrayContainsKey!0 lt!463895 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050396 (= lt!463895 (array!66155 (store (arr!31810 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32347 a!3488)))))

(assert (= (and start!92538 res!698715) b!1050391))

(assert (= (and b!1050391 res!698713) b!1050390))

(assert (= (and b!1050390 res!698714) b!1050393))

(assert (= (and b!1050393 res!698710) b!1050396))

(assert (= (and b!1050396 res!698716) b!1050389))

(assert (= (and b!1050389 res!698709) b!1050392))

(assert (= (and b!1050392 res!698711) b!1050394))

(assert (= (and b!1050394 (not res!698717)) b!1050395))

(assert (= (and b!1050392 (not res!698712)) b!1050388))

(declare-fun m!971567 () Bool)

(assert (=> b!1050388 m!971567))

(declare-fun m!971569 () Bool)

(assert (=> b!1050388 m!971569))

(declare-fun m!971571 () Bool)

(assert (=> b!1050395 m!971571))

(declare-fun m!971573 () Bool)

(assert (=> start!92538 m!971573))

(declare-fun m!971575 () Bool)

(assert (=> b!1050390 m!971575))

(declare-fun m!971577 () Bool)

(assert (=> b!1050393 m!971577))

(declare-fun m!971579 () Bool)

(assert (=> b!1050391 m!971579))

(declare-fun m!971581 () Bool)

(assert (=> b!1050392 m!971581))

(declare-fun m!971583 () Bool)

(assert (=> b!1050392 m!971583))

(declare-fun m!971585 () Bool)

(assert (=> b!1050396 m!971585))

(assert (=> b!1050396 m!971581))

(declare-fun m!971587 () Bool)

(assert (=> b!1050389 m!971587))

(check-sat (not start!92538) (not b!1050389) (not b!1050391) (not b!1050396) (not b!1050388) (not b!1050390) (not b!1050395))
(check-sat)
