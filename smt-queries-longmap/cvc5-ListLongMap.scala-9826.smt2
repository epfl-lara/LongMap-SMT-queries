; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116642 () Bool)

(assert start!116642)

(declare-fun b!1375036 () Bool)

(declare-fun e!778954 () Bool)

(declare-datatypes ((array!93311 0))(
  ( (array!93312 (arr!45059 (Array (_ BitVec 32) (_ BitVec 64))) (size!45609 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93311)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375036 (= e!778954 (not (and (bvsge (size!45609 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!603970 () array!93311)

(declare-fun arrayCountValidKeys!0 (array!93311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375036 (= (arrayCountValidKeys!0 lt!603970 (bvadd #b00000000000000000000000000000001 i!1457) (size!45609 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45609 a!4142)))))

(declare-datatypes ((Unit!45507 0))(
  ( (Unit!45508) )
))
(declare-fun lt!603968 () Unit!45507)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45507)

(assert (=> b!1375036 (= lt!603968 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375036 (= (arrayCountValidKeys!0 lt!603970 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1375036 (= lt!603970 (array!93312 (store (arr!45059 a!4142) i!1457 k!2959) (size!45609 a!4142)))))

(declare-fun lt!603969 () Unit!45507)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45507)

(assert (=> b!1375036 (= lt!603969 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375035 () Bool)

(declare-fun res!918099 () Bool)

(assert (=> b!1375035 (=> (not res!918099) (not e!778954))))

(assert (=> b!1375035 (= res!918099 (bvslt (size!45609 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375033 () Bool)

(declare-fun res!918098 () Bool)

(assert (=> b!1375033 (=> (not res!918098) (not e!778954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375033 (= res!918098 (validKeyInArray!0 (select (arr!45059 a!4142) i!1457)))))

(declare-fun res!918097 () Bool)

(assert (=> start!116642 (=> (not res!918097) (not e!778954))))

(assert (=> start!116642 (= res!918097 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45609 a!4142))))))

(assert (=> start!116642 e!778954))

(assert (=> start!116642 true))

(declare-fun array_inv!34087 (array!93311) Bool)

(assert (=> start!116642 (array_inv!34087 a!4142)))

(declare-fun b!1375034 () Bool)

(declare-fun res!918100 () Bool)

(assert (=> b!1375034 (=> (not res!918100) (not e!778954))))

(assert (=> b!1375034 (= res!918100 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116642 res!918097) b!1375033))

(assert (= (and b!1375033 res!918098) b!1375034))

(assert (= (and b!1375034 res!918100) b!1375035))

(assert (= (and b!1375035 res!918099) b!1375036))

(declare-fun m!1258645 () Bool)

(assert (=> b!1375036 m!1258645))

(declare-fun m!1258647 () Bool)

(assert (=> b!1375036 m!1258647))

(declare-fun m!1258649 () Bool)

(assert (=> b!1375036 m!1258649))

(declare-fun m!1258651 () Bool)

(assert (=> b!1375036 m!1258651))

(declare-fun m!1258653 () Bool)

(assert (=> b!1375036 m!1258653))

(declare-fun m!1258655 () Bool)

(assert (=> b!1375036 m!1258655))

(declare-fun m!1258657 () Bool)

(assert (=> b!1375036 m!1258657))

(declare-fun m!1258659 () Bool)

(assert (=> b!1375033 m!1258659))

(assert (=> b!1375033 m!1258659))

(declare-fun m!1258661 () Bool)

(assert (=> b!1375033 m!1258661))

(declare-fun m!1258663 () Bool)

(assert (=> start!116642 m!1258663))

(declare-fun m!1258665 () Bool)

(assert (=> b!1375034 m!1258665))

(push 1)

(assert (not b!1375036))

(assert (not b!1375034))

(assert (not start!116642))

(assert (not b!1375033))

(check-sat)

