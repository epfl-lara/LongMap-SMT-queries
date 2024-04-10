; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92466 () Bool)

(assert start!92466)

(declare-fun b!1051377 () Bool)

(declare-fun e!596804 () Bool)

(declare-fun e!596802 () Bool)

(assert (=> b!1051377 (= e!596804 e!596802)))

(declare-fun res!700504 () Bool)

(assert (=> b!1051377 (=> (not res!700504) (not e!596802))))

(declare-datatypes ((array!66267 0))(
  ( (array!66268 (arr!31873 (Array (_ BitVec 32) (_ BitVec 64))) (size!32409 (_ BitVec 32))) )
))
(declare-fun lt!464251 () array!66267)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051377 (= res!700504 (arrayContainsKey!0 lt!464251 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66267)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051377 (= lt!464251 (array!66268 (store (arr!31873 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32409 a!3488)))))

(declare-fun b!1051378 () Bool)

(declare-fun res!700508 () Bool)

(assert (=> b!1051378 (=> (not res!700508) (not e!596804))))

(assert (=> b!1051378 (= res!700508 (= (select (arr!31873 a!3488) i!1381) k!2747))))

(declare-fun b!1051379 () Bool)

(declare-fun e!596806 () Bool)

(assert (=> b!1051379 (= e!596806 true)))

(declare-fun lt!464252 () (_ BitVec 32))

(declare-datatypes ((List!22185 0))(
  ( (Nil!22182) (Cons!22181 (h!23390 (_ BitVec 64)) (t!31492 List!22185)) )
))
(declare-fun arrayNoDuplicates!0 (array!66267 (_ BitVec 32) List!22185) Bool)

(assert (=> b!1051379 (arrayNoDuplicates!0 a!3488 lt!464252 Nil!22182)))

(declare-datatypes ((Unit!34418 0))(
  ( (Unit!34419) )
))
(declare-fun lt!464253 () Unit!34418)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66267 (_ BitVec 32) (_ BitVec 32)) Unit!34418)

(assert (=> b!1051379 (= lt!464253 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464252))))

(declare-fun b!1051380 () Bool)

(declare-fun res!700511 () Bool)

(assert (=> b!1051380 (=> (not res!700511) (not e!596804))))

(assert (=> b!1051380 (= res!700511 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22182))))

(declare-fun res!700510 () Bool)

(assert (=> start!92466 (=> (not res!700510) (not e!596804))))

(assert (=> start!92466 (= res!700510 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32409 a!3488)) (bvslt (size!32409 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92466 e!596804))

(assert (=> start!92466 true))

(declare-fun array_inv!24653 (array!66267) Bool)

(assert (=> start!92466 (array_inv!24653 a!3488)))

(declare-fun b!1051381 () Bool)

(declare-fun e!596801 () Bool)

(assert (=> b!1051381 (= e!596801 (not e!596806))))

(declare-fun res!700503 () Bool)

(assert (=> b!1051381 (=> res!700503 e!596806)))

(assert (=> b!1051381 (= res!700503 (or (bvsgt lt!464252 i!1381) (bvsle i!1381 lt!464252)))))

(declare-fun e!596800 () Bool)

(assert (=> b!1051381 e!596800))

(declare-fun res!700505 () Bool)

(assert (=> b!1051381 (=> (not res!700505) (not e!596800))))

(assert (=> b!1051381 (= res!700505 (= (select (store (arr!31873 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464252) k!2747))))

(declare-fun b!1051382 () Bool)

(declare-fun e!596803 () Bool)

(assert (=> b!1051382 (= e!596800 e!596803)))

(declare-fun res!700507 () Bool)

(assert (=> b!1051382 (=> res!700507 e!596803)))

(assert (=> b!1051382 (= res!700507 (or (bvsgt lt!464252 i!1381) (bvsle i!1381 lt!464252)))))

(declare-fun b!1051383 () Bool)

(declare-fun res!700509 () Bool)

(assert (=> b!1051383 (=> (not res!700509) (not e!596804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051383 (= res!700509 (validKeyInArray!0 k!2747))))

(declare-fun b!1051384 () Bool)

(assert (=> b!1051384 (= e!596803 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051385 () Bool)

(assert (=> b!1051385 (= e!596802 e!596801)))

(declare-fun res!700506 () Bool)

(assert (=> b!1051385 (=> (not res!700506) (not e!596801))))

(assert (=> b!1051385 (= res!700506 (not (= lt!464252 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66267 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051385 (= lt!464252 (arrayScanForKey!0 lt!464251 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92466 res!700510) b!1051380))

(assert (= (and b!1051380 res!700511) b!1051383))

(assert (= (and b!1051383 res!700509) b!1051378))

(assert (= (and b!1051378 res!700508) b!1051377))

(assert (= (and b!1051377 res!700504) b!1051385))

(assert (= (and b!1051385 res!700506) b!1051381))

(assert (= (and b!1051381 res!700505) b!1051382))

(assert (= (and b!1051382 (not res!700507)) b!1051384))

(assert (= (and b!1051381 (not res!700503)) b!1051379))

(declare-fun m!971891 () Bool)

(assert (=> b!1051379 m!971891))

(declare-fun m!971893 () Bool)

(assert (=> b!1051379 m!971893))

(declare-fun m!971895 () Bool)

(assert (=> start!92466 m!971895))

(declare-fun m!971897 () Bool)

(assert (=> b!1051381 m!971897))

(declare-fun m!971899 () Bool)

(assert (=> b!1051381 m!971899))

(declare-fun m!971901 () Bool)

(assert (=> b!1051384 m!971901))

(declare-fun m!971903 () Bool)

(assert (=> b!1051378 m!971903))

(declare-fun m!971905 () Bool)

(assert (=> b!1051380 m!971905))

(declare-fun m!971907 () Bool)

(assert (=> b!1051383 m!971907))

(declare-fun m!971909 () Bool)

(assert (=> b!1051377 m!971909))

(assert (=> b!1051377 m!971897))

(declare-fun m!971911 () Bool)

(assert (=> b!1051385 m!971911))

(push 1)

