; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92926 () Bool)

(assert start!92926)

(declare-fun b!1055013 () Bool)

(declare-fun res!703915 () Bool)

(declare-fun e!599500 () Bool)

(assert (=> b!1055013 (=> (not res!703915) (not e!599500))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055013 (= res!703915 (validKeyInArray!0 k!2747))))

(declare-fun b!1055014 () Bool)

(declare-fun res!703918 () Bool)

(assert (=> b!1055014 (=> (not res!703918) (not e!599500))))

(declare-datatypes ((array!66547 0))(
  ( (array!66548 (arr!32004 (Array (_ BitVec 32) (_ BitVec 64))) (size!32540 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66547)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055014 (= res!703918 (= (select (arr!32004 a!3488) i!1381) k!2747))))

(declare-fun res!703912 () Bool)

(assert (=> start!92926 (=> (not res!703912) (not e!599500))))

(assert (=> start!92926 (= res!703912 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32540 a!3488)) (bvslt (size!32540 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92926 e!599500))

(assert (=> start!92926 true))

(declare-fun array_inv!24784 (array!66547) Bool)

(assert (=> start!92926 (array_inv!24784 a!3488)))

(declare-fun b!1055015 () Bool)

(declare-fun e!599501 () Bool)

(declare-fun e!599505 () Bool)

(assert (=> b!1055015 (= e!599501 e!599505)))

(declare-fun res!703914 () Bool)

(assert (=> b!1055015 (=> (not res!703914) (not e!599505))))

(declare-fun lt!465636 () (_ BitVec 32))

(assert (=> b!1055015 (= res!703914 (not (= lt!465636 i!1381)))))

(declare-fun lt!465639 () array!66547)

(declare-fun arrayScanForKey!0 (array!66547 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055015 (= lt!465636 (arrayScanForKey!0 lt!465639 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055016 () Bool)

(declare-fun res!703917 () Bool)

(assert (=> b!1055016 (=> (not res!703917) (not e!599500))))

(declare-datatypes ((List!22316 0))(
  ( (Nil!22313) (Cons!22312 (h!23521 (_ BitVec 64)) (t!31623 List!22316)) )
))
(declare-fun arrayNoDuplicates!0 (array!66547 (_ BitVec 32) List!22316) Bool)

(assert (=> b!1055016 (= res!703917 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22313))))

(declare-fun b!1055017 () Bool)

(assert (=> b!1055017 (= e!599500 e!599501)))

(declare-fun res!703913 () Bool)

(assert (=> b!1055017 (=> (not res!703913) (not e!599501))))

(declare-fun arrayContainsKey!0 (array!66547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055017 (= res!703913 (arrayContainsKey!0 lt!465639 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055017 (= lt!465639 (array!66548 (store (arr!32004 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32540 a!3488)))))

(declare-fun b!1055018 () Bool)

(declare-fun e!599504 () Bool)

(declare-fun e!599502 () Bool)

(assert (=> b!1055018 (= e!599504 e!599502)))

(declare-fun res!703916 () Bool)

(assert (=> b!1055018 (=> res!703916 e!599502)))

(assert (=> b!1055018 (= res!703916 (bvsle lt!465636 i!1381))))

(declare-fun b!1055019 () Bool)

(declare-fun e!599506 () Bool)

(assert (=> b!1055019 (= e!599505 (not e!599506))))

(declare-fun res!703911 () Bool)

(assert (=> b!1055019 (=> res!703911 e!599506)))

(assert (=> b!1055019 (= res!703911 (bvsle lt!465636 i!1381))))

(assert (=> b!1055019 e!599504))

(declare-fun res!703919 () Bool)

(assert (=> b!1055019 (=> (not res!703919) (not e!599504))))

(assert (=> b!1055019 (= res!703919 (= (select (store (arr!32004 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465636) k!2747))))

(declare-fun b!1055020 () Bool)

(assert (=> b!1055020 (= e!599506 true)))

(assert (=> b!1055020 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34566 0))(
  ( (Unit!34567) )
))
(declare-fun lt!465637 () Unit!34566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66547 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34566)

(assert (=> b!1055020 (= lt!465637 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465636 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055020 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22313)))

(declare-fun lt!465638 () Unit!34566)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66547 (_ BitVec 32) (_ BitVec 32)) Unit!34566)

(assert (=> b!1055020 (= lt!465638 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055021 () Bool)

(assert (=> b!1055021 (= e!599502 (arrayContainsKey!0 a!3488 k!2747 lt!465636))))

(assert (= (and start!92926 res!703912) b!1055016))

(assert (= (and b!1055016 res!703917) b!1055013))

(assert (= (and b!1055013 res!703915) b!1055014))

(assert (= (and b!1055014 res!703918) b!1055017))

(assert (= (and b!1055017 res!703913) b!1055015))

(assert (= (and b!1055015 res!703914) b!1055019))

(assert (= (and b!1055019 res!703919) b!1055018))

(assert (= (and b!1055018 (not res!703916)) b!1055021))

(assert (= (and b!1055019 (not res!703911)) b!1055020))

(declare-fun m!975045 () Bool)

(assert (=> b!1055016 m!975045))

(declare-fun m!975047 () Bool)

(assert (=> b!1055017 m!975047))

(declare-fun m!975049 () Bool)

(assert (=> b!1055017 m!975049))

(declare-fun m!975051 () Bool)

(assert (=> b!1055013 m!975051))

(declare-fun m!975053 () Bool)

(assert (=> b!1055015 m!975053))

(declare-fun m!975055 () Bool)

(assert (=> b!1055014 m!975055))

(declare-fun m!975057 () Bool)

(assert (=> b!1055021 m!975057))

(declare-fun m!975059 () Bool)

(assert (=> b!1055020 m!975059))

(declare-fun m!975061 () Bool)

(assert (=> b!1055020 m!975061))

(declare-fun m!975063 () Bool)

(assert (=> b!1055020 m!975063))

(declare-fun m!975065 () Bool)

(assert (=> b!1055020 m!975065))

(assert (=> b!1055019 m!975049))

(declare-fun m!975067 () Bool)

(assert (=> b!1055019 m!975067))

(declare-fun m!975069 () Bool)

(assert (=> start!92926 m!975069))

(push 1)

