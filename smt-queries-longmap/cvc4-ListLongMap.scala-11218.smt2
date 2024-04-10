; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130944 () Bool)

(assert start!130944)

(declare-fun b!1536001 () Bool)

(declare-fun res!1053097 () Bool)

(declare-fun e!854980 () Bool)

(assert (=> b!1536001 (=> (not res!1053097) (not e!854980))))

(declare-datatypes ((array!102042 0))(
  ( (array!102043 (arr!49237 (Array (_ BitVec 32) (_ BitVec 64))) (size!49787 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102042)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102042 (_ BitVec 32)) Bool)

(assert (=> b!1536001 (= res!1053097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536002 () Bool)

(declare-fun res!1053091 () Bool)

(declare-fun e!854979 () Bool)

(assert (=> b!1536002 (=> (not res!1053091) (not e!854979))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536002 (= res!1053091 (not (= (select (arr!49237 a!2792) index!463) (select (arr!49237 a!2792) j!64))))))

(declare-fun b!1536003 () Bool)

(declare-fun res!1053090 () Bool)

(assert (=> b!1536003 (=> (not res!1053090) (not e!854980))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536003 (= res!1053090 (and (= (size!49787 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49787 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49787 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536004 () Bool)

(declare-fun e!854981 () Bool)

(declare-fun e!854982 () Bool)

(assert (=> b!1536004 (= e!854981 e!854982)))

(declare-fun res!1053093 () Bool)

(assert (=> b!1536004 (=> (not res!1053093) (not e!854982))))

(declare-datatypes ((SeekEntryResult!13369 0))(
  ( (MissingZero!13369 (index!55871 (_ BitVec 32))) (Found!13369 (index!55872 (_ BitVec 32))) (Intermediate!13369 (undefined!14181 Bool) (index!55873 (_ BitVec 32)) (x!137611 (_ BitVec 32))) (Undefined!13369) (MissingVacant!13369 (index!55874 (_ BitVec 32))) )
))
(declare-fun lt!664187 () SeekEntryResult!13369)

(declare-fun lt!664188 () SeekEntryResult!13369)

(assert (=> b!1536004 (= res!1053093 (= lt!664187 lt!664188))))

(declare-fun lt!664186 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102042 (_ BitVec 32)) SeekEntryResult!13369)

(assert (=> b!1536004 (= lt!664187 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664186 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536005 () Bool)

(assert (=> b!1536005 (= e!854980 e!854979)))

(declare-fun res!1053089 () Bool)

(assert (=> b!1536005 (=> (not res!1053089) (not e!854979))))

(assert (=> b!1536005 (= res!1053089 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480) lt!664188))))

(assert (=> b!1536005 (= lt!664188 (Found!13369 j!64))))

(declare-fun res!1053095 () Bool)

(assert (=> start!130944 (=> (not res!1053095) (not e!854980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130944 (= res!1053095 (validMask!0 mask!2480))))

(assert (=> start!130944 e!854980))

(assert (=> start!130944 true))

(declare-fun array_inv!38265 (array!102042) Bool)

(assert (=> start!130944 (array_inv!38265 a!2792)))

(declare-fun b!1536006 () Bool)

(declare-fun res!1053094 () Bool)

(assert (=> b!1536006 (=> (not res!1053094) (not e!854980))))

(assert (=> b!1536006 (= res!1053094 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49787 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49787 a!2792)) (= (select (arr!49237 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536007 () Bool)

(declare-fun res!1053088 () Bool)

(assert (=> b!1536007 (=> (not res!1053088) (not e!854980))))

(declare-datatypes ((List!35711 0))(
  ( (Nil!35708) (Cons!35707 (h!37152 (_ BitVec 64)) (t!50405 List!35711)) )
))
(declare-fun arrayNoDuplicates!0 (array!102042 (_ BitVec 32) List!35711) Bool)

(assert (=> b!1536007 (= res!1053088 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35708))))

(declare-fun b!1536008 () Bool)

(assert (=> b!1536008 (= e!854982 (not true))))

(assert (=> b!1536008 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664186 vacantIndex!5 (select (store (arr!49237 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102043 (store (arr!49237 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49787 a!2792)) mask!2480) lt!664187)))

(declare-datatypes ((Unit!51310 0))(
  ( (Unit!51311) )
))
(declare-fun lt!664189 () Unit!51310)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51310)

(assert (=> b!1536008 (= lt!664189 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664186 vacantIndex!5 mask!2480))))

(declare-fun b!1536009 () Bool)

(declare-fun res!1053096 () Bool)

(assert (=> b!1536009 (=> (not res!1053096) (not e!854980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536009 (= res!1053096 (validKeyInArray!0 (select (arr!49237 a!2792) i!951)))))

(declare-fun b!1536010 () Bool)

(assert (=> b!1536010 (= e!854979 e!854981)))

(declare-fun res!1053087 () Bool)

(assert (=> b!1536010 (=> (not res!1053087) (not e!854981))))

(assert (=> b!1536010 (= res!1053087 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664186 #b00000000000000000000000000000000) (bvslt lt!664186 (size!49787 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536010 (= lt!664186 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536011 () Bool)

(declare-fun res!1053092 () Bool)

(assert (=> b!1536011 (=> (not res!1053092) (not e!854980))))

(assert (=> b!1536011 (= res!1053092 (validKeyInArray!0 (select (arr!49237 a!2792) j!64)))))

(assert (= (and start!130944 res!1053095) b!1536003))

(assert (= (and b!1536003 res!1053090) b!1536009))

(assert (= (and b!1536009 res!1053096) b!1536011))

(assert (= (and b!1536011 res!1053092) b!1536001))

(assert (= (and b!1536001 res!1053097) b!1536007))

(assert (= (and b!1536007 res!1053088) b!1536006))

(assert (= (and b!1536006 res!1053094) b!1536005))

(assert (= (and b!1536005 res!1053089) b!1536002))

(assert (= (and b!1536002 res!1053091) b!1536010))

(assert (= (and b!1536010 res!1053087) b!1536004))

(assert (= (and b!1536004 res!1053093) b!1536008))

(declare-fun m!1418453 () Bool)

(assert (=> b!1536011 m!1418453))

(assert (=> b!1536011 m!1418453))

(declare-fun m!1418455 () Bool)

(assert (=> b!1536011 m!1418455))

(declare-fun m!1418457 () Bool)

(assert (=> b!1536007 m!1418457))

(declare-fun m!1418459 () Bool)

(assert (=> b!1536008 m!1418459))

(declare-fun m!1418461 () Bool)

(assert (=> b!1536008 m!1418461))

(assert (=> b!1536008 m!1418461))

(declare-fun m!1418463 () Bool)

(assert (=> b!1536008 m!1418463))

(declare-fun m!1418465 () Bool)

(assert (=> b!1536008 m!1418465))

(declare-fun m!1418467 () Bool)

(assert (=> b!1536006 m!1418467))

(declare-fun m!1418469 () Bool)

(assert (=> start!130944 m!1418469))

(declare-fun m!1418471 () Bool)

(assert (=> start!130944 m!1418471))

(declare-fun m!1418473 () Bool)

(assert (=> b!1536010 m!1418473))

(declare-fun m!1418475 () Bool)

(assert (=> b!1536001 m!1418475))

(assert (=> b!1536005 m!1418453))

(assert (=> b!1536005 m!1418453))

(declare-fun m!1418477 () Bool)

(assert (=> b!1536005 m!1418477))

(assert (=> b!1536004 m!1418453))

(assert (=> b!1536004 m!1418453))

(declare-fun m!1418479 () Bool)

(assert (=> b!1536004 m!1418479))

(declare-fun m!1418481 () Bool)

(assert (=> b!1536002 m!1418481))

(assert (=> b!1536002 m!1418453))

(declare-fun m!1418483 () Bool)

(assert (=> b!1536009 m!1418483))

(assert (=> b!1536009 m!1418483))

(declare-fun m!1418485 () Bool)

(assert (=> b!1536009 m!1418485))

(push 1)

(assert (not b!1536004))

(assert (not b!1536008))

(assert (not b!1536007))

