; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92428 () Bool)

(assert start!92428)

(declare-fun b!1050883 () Bool)

(declare-fun res!700010 () Bool)

(declare-fun e!596422 () Bool)

(assert (=> b!1050883 (=> (not res!700010) (not e!596422))))

(declare-datatypes ((array!66229 0))(
  ( (array!66230 (arr!31854 (Array (_ BitVec 32) (_ BitVec 64))) (size!32390 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66229)

(declare-datatypes ((List!22166 0))(
  ( (Nil!22163) (Cons!22162 (h!23371 (_ BitVec 64)) (t!31473 List!22166)) )
))
(declare-fun arrayNoDuplicates!0 (array!66229 (_ BitVec 32) List!22166) Bool)

(assert (=> b!1050883 (= res!700010 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22163))))

(declare-fun b!1050884 () Bool)

(declare-fun e!596420 () Bool)

(assert (=> b!1050884 (= e!596420 (not true))))

(declare-fun e!596424 () Bool)

(assert (=> b!1050884 e!596424))

(declare-fun res!700009 () Bool)

(assert (=> b!1050884 (=> (not res!700009) (not e!596424))))

(declare-fun lt!464100 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050884 (= res!700009 (= (select (store (arr!31854 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464100) k!2747))))

(declare-fun b!1050885 () Bool)

(declare-fun e!596421 () Bool)

(assert (=> b!1050885 (= e!596421 e!596420)))

(declare-fun res!700014 () Bool)

(assert (=> b!1050885 (=> (not res!700014) (not e!596420))))

(assert (=> b!1050885 (= res!700014 (not (= lt!464100 i!1381)))))

(declare-fun lt!464099 () array!66229)

(declare-fun arrayScanForKey!0 (array!66229 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050885 (= lt!464100 (arrayScanForKey!0 lt!464099 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!700016 () Bool)

(assert (=> start!92428 (=> (not res!700016) (not e!596422))))

(assert (=> start!92428 (= res!700016 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32390 a!3488)) (bvslt (size!32390 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92428 e!596422))

(assert (=> start!92428 true))

(declare-fun array_inv!24634 (array!66229) Bool)

(assert (=> start!92428 (array_inv!24634 a!3488)))

(declare-fun b!1050886 () Bool)

(declare-fun res!700012 () Bool)

(assert (=> b!1050886 (=> (not res!700012) (not e!596422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050886 (= res!700012 (validKeyInArray!0 k!2747))))

(declare-fun b!1050887 () Bool)

(declare-fun res!700011 () Bool)

(assert (=> b!1050887 (=> (not res!700011) (not e!596422))))

(assert (=> b!1050887 (= res!700011 (= (select (arr!31854 a!3488) i!1381) k!2747))))

(declare-fun b!1050888 () Bool)

(declare-fun e!596425 () Bool)

(declare-fun arrayContainsKey!0 (array!66229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050888 (= e!596425 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050889 () Bool)

(assert (=> b!1050889 (= e!596424 e!596425)))

(declare-fun res!700013 () Bool)

(assert (=> b!1050889 (=> res!700013 e!596425)))

(assert (=> b!1050889 (= res!700013 (or (bvsgt lt!464100 i!1381) (bvsle i!1381 lt!464100)))))

(declare-fun b!1050890 () Bool)

(assert (=> b!1050890 (= e!596422 e!596421)))

(declare-fun res!700015 () Bool)

(assert (=> b!1050890 (=> (not res!700015) (not e!596421))))

(assert (=> b!1050890 (= res!700015 (arrayContainsKey!0 lt!464099 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050890 (= lt!464099 (array!66230 (store (arr!31854 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32390 a!3488)))))

(assert (= (and start!92428 res!700016) b!1050883))

(assert (= (and b!1050883 res!700010) b!1050886))

(assert (= (and b!1050886 res!700012) b!1050887))

(assert (= (and b!1050887 res!700011) b!1050890))

(assert (= (and b!1050890 res!700015) b!1050885))

(assert (= (and b!1050885 res!700014) b!1050884))

(assert (= (and b!1050884 res!700009) b!1050889))

(assert (= (and b!1050889 (not res!700013)) b!1050888))

(declare-fun m!971501 () Bool)

(assert (=> b!1050887 m!971501))

(declare-fun m!971503 () Bool)

(assert (=> b!1050890 m!971503))

(declare-fun m!971505 () Bool)

(assert (=> b!1050890 m!971505))

(declare-fun m!971507 () Bool)

(assert (=> b!1050886 m!971507))

(declare-fun m!971509 () Bool)

(assert (=> b!1050888 m!971509))

(declare-fun m!971511 () Bool)

(assert (=> start!92428 m!971511))

(assert (=> b!1050884 m!971505))

(declare-fun m!971513 () Bool)

(assert (=> b!1050884 m!971513))

(declare-fun m!971515 () Bool)

(assert (=> b!1050883 m!971515))

(declare-fun m!971517 () Bool)

(assert (=> b!1050885 m!971517))

(push 1)

