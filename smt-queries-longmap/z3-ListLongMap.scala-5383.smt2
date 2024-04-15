; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71876 () Bool)

(assert start!71876)

(declare-fun b!835210 () Bool)

(declare-fun res!568220 () Bool)

(declare-fun e!465913 () Bool)

(assert (=> b!835210 (=> (not res!568220) (not e!465913))))

(declare-datatypes ((array!46775 0))(
  ( (array!46776 (arr!22422 (Array (_ BitVec 32) (_ BitVec 64))) (size!22843 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46775)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835210 (= res!568220 (and (bvslt (size!22843 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22843 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835211 () Bool)

(declare-fun res!568217 () Bool)

(assert (=> b!835211 (=> (not res!568217) (not e!465913))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835211 (= res!568217 (validKeyInArray!0 k0!2968))))

(declare-fun b!835212 () Bool)

(declare-fun res!568222 () Bool)

(assert (=> b!835212 (=> (not res!568222) (not e!465913))))

(assert (=> b!835212 (= res!568222 (not (validKeyInArray!0 (select (arr!22422 a!4227) i!1466))))))

(declare-fun b!835213 () Bool)

(declare-fun e!465914 () Bool)

(assert (=> b!835213 (= e!465913 e!465914)))

(declare-fun res!568218 () Bool)

(assert (=> b!835213 (=> (not res!568218) (not e!465914))))

(declare-fun lt!379482 () (_ BitVec 32))

(declare-fun lt!379483 () (_ BitVec 32))

(assert (=> b!835213 (= res!568218 (and (= lt!379483 lt!379482) (not (= to!390 (size!22843 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835213 (= lt!379482 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835213 (= lt!379483 (arrayCountValidKeys!0 (array!46776 (store (arr!22422 a!4227) i!1466 k0!2968) (size!22843 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835214 () Bool)

(declare-fun res!568221 () Bool)

(assert (=> b!835214 (=> (not res!568221) (not e!465914))))

(assert (=> b!835214 (= res!568221 (not (validKeyInArray!0 (select (arr!22422 a!4227) to!390))))))

(declare-fun res!568219 () Bool)

(assert (=> start!71876 (=> (not res!568219) (not e!465913))))

(assert (=> start!71876 (= res!568219 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22843 a!4227))))))

(assert (=> start!71876 e!465913))

(assert (=> start!71876 true))

(declare-fun array_inv!17934 (array!46775) Bool)

(assert (=> start!71876 (array_inv!17934 a!4227)))

(declare-fun b!835215 () Bool)

(assert (=> b!835215 (= e!465914 (not true))))

(assert (=> b!835215 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379482)))

(declare-datatypes ((Unit!28667 0))(
  ( (Unit!28668) )
))
(declare-fun lt!379484 () Unit!28667)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46775 (_ BitVec 32) (_ BitVec 32)) Unit!28667)

(assert (=> b!835215 (= lt!379484 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71876 res!568219) b!835212))

(assert (= (and b!835212 res!568222) b!835211))

(assert (= (and b!835211 res!568217) b!835210))

(assert (= (and b!835210 res!568220) b!835213))

(assert (= (and b!835213 res!568218) b!835214))

(assert (= (and b!835214 res!568221) b!835215))

(declare-fun m!779869 () Bool)

(assert (=> b!835213 m!779869))

(declare-fun m!779871 () Bool)

(assert (=> b!835213 m!779871))

(declare-fun m!779873 () Bool)

(assert (=> b!835213 m!779873))

(declare-fun m!779875 () Bool)

(assert (=> b!835212 m!779875))

(assert (=> b!835212 m!779875))

(declare-fun m!779877 () Bool)

(assert (=> b!835212 m!779877))

(declare-fun m!779879 () Bool)

(assert (=> b!835214 m!779879))

(assert (=> b!835214 m!779879))

(declare-fun m!779881 () Bool)

(assert (=> b!835214 m!779881))

(declare-fun m!779883 () Bool)

(assert (=> b!835215 m!779883))

(declare-fun m!779885 () Bool)

(assert (=> b!835215 m!779885))

(declare-fun m!779887 () Bool)

(assert (=> b!835211 m!779887))

(declare-fun m!779889 () Bool)

(assert (=> start!71876 m!779889))

(check-sat (not b!835215) (not b!835212) (not start!71876) (not b!835211) (not b!835213) (not b!835214))
(check-sat)
