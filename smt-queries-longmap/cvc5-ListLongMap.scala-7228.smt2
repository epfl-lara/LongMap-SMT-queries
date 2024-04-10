; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92430 () Bool)

(assert start!92430)

(declare-fun b!1050907 () Bool)

(declare-fun res!700037 () Bool)

(declare-fun e!596438 () Bool)

(assert (=> b!1050907 (=> (not res!700037) (not e!596438))))

(declare-datatypes ((array!66231 0))(
  ( (array!66232 (arr!31855 (Array (_ BitVec 32) (_ BitVec 64))) (size!32391 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66231)

(declare-datatypes ((List!22167 0))(
  ( (Nil!22164) (Cons!22163 (h!23372 (_ BitVec 64)) (t!31474 List!22167)) )
))
(declare-fun arrayNoDuplicates!0 (array!66231 (_ BitVec 32) List!22167) Bool)

(assert (=> b!1050907 (= res!700037 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22164))))

(declare-fun b!1050908 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun e!596443 () Bool)

(declare-fun arrayContainsKey!0 (array!66231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050908 (= e!596443 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050909 () Bool)

(declare-fun res!700039 () Bool)

(assert (=> b!1050909 (=> (not res!700039) (not e!596438))))

(assert (=> b!1050909 (= res!700039 (= (select (arr!31855 a!3488) i!1381) k!2747))))

(declare-fun b!1050910 () Bool)

(declare-fun e!596441 () Bool)

(declare-fun e!596442 () Bool)

(assert (=> b!1050910 (= e!596441 e!596442)))

(declare-fun res!700033 () Bool)

(assert (=> b!1050910 (=> (not res!700033) (not e!596442))))

(declare-fun lt!464105 () (_ BitVec 32))

(assert (=> b!1050910 (= res!700033 (not (= lt!464105 i!1381)))))

(declare-fun lt!464106 () array!66231)

(declare-fun arrayScanForKey!0 (array!66231 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050910 (= lt!464105 (arrayScanForKey!0 lt!464106 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!700040 () Bool)

(assert (=> start!92430 (=> (not res!700040) (not e!596438))))

(assert (=> start!92430 (= res!700040 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32391 a!3488)) (bvslt (size!32391 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92430 e!596438))

(assert (=> start!92430 true))

(declare-fun array_inv!24635 (array!66231) Bool)

(assert (=> start!92430 (array_inv!24635 a!3488)))

(declare-fun b!1050911 () Bool)

(declare-fun e!596439 () Bool)

(assert (=> b!1050911 (= e!596439 e!596443)))

(declare-fun res!700036 () Bool)

(assert (=> b!1050911 (=> res!700036 e!596443)))

(assert (=> b!1050911 (= res!700036 (or (bvsgt lt!464105 i!1381) (bvsle i!1381 lt!464105)))))

(declare-fun b!1050912 () Bool)

(assert (=> b!1050912 (= e!596438 e!596441)))

(declare-fun res!700034 () Bool)

(assert (=> b!1050912 (=> (not res!700034) (not e!596441))))

(assert (=> b!1050912 (= res!700034 (arrayContainsKey!0 lt!464106 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050912 (= lt!464106 (array!66232 (store (arr!31855 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32391 a!3488)))))

(declare-fun b!1050913 () Bool)

(assert (=> b!1050913 (= e!596442 (not true))))

(assert (=> b!1050913 e!596439))

(declare-fun res!700035 () Bool)

(assert (=> b!1050913 (=> (not res!700035) (not e!596439))))

(assert (=> b!1050913 (= res!700035 (= (select (store (arr!31855 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464105) k!2747))))

(declare-fun b!1050914 () Bool)

(declare-fun res!700038 () Bool)

(assert (=> b!1050914 (=> (not res!700038) (not e!596438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050914 (= res!700038 (validKeyInArray!0 k!2747))))

(assert (= (and start!92430 res!700040) b!1050907))

(assert (= (and b!1050907 res!700037) b!1050914))

(assert (= (and b!1050914 res!700038) b!1050909))

(assert (= (and b!1050909 res!700039) b!1050912))

(assert (= (and b!1050912 res!700034) b!1050910))

(assert (= (and b!1050910 res!700033) b!1050913))

(assert (= (and b!1050913 res!700035) b!1050911))

(assert (= (and b!1050911 (not res!700036)) b!1050908))

(declare-fun m!971519 () Bool)

(assert (=> b!1050910 m!971519))

(declare-fun m!971521 () Bool)

(assert (=> start!92430 m!971521))

(declare-fun m!971523 () Bool)

(assert (=> b!1050908 m!971523))

(declare-fun m!971525 () Bool)

(assert (=> b!1050909 m!971525))

(declare-fun m!971527 () Bool)

(assert (=> b!1050912 m!971527))

(declare-fun m!971529 () Bool)

(assert (=> b!1050912 m!971529))

(declare-fun m!971531 () Bool)

(assert (=> b!1050914 m!971531))

(declare-fun m!971533 () Bool)

(assert (=> b!1050907 m!971533))

(assert (=> b!1050913 m!971529))

(declare-fun m!971535 () Bool)

(assert (=> b!1050913 m!971535))

(push 1)

(assert (not start!92430))

(assert (not b!1050912))

(assert (not b!1050908))

(assert (not b!1050910))

(assert (not b!1050914))

(assert (not b!1050907))

(check-sat)

(pop 1)

