; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116754 () Bool)

(assert start!116754)

(declare-fun b!1376042 () Bool)

(declare-fun res!918969 () Bool)

(declare-fun e!779538 () Bool)

(assert (=> b!1376042 (=> (not res!918969) (not e!779538))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93423 0))(
  ( (array!93424 (arr!45115 (Array (_ BitVec 32) (_ BitVec 64))) (size!45665 (_ BitVec 32))) )
))
(declare-fun lt!605083 () array!93423)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93423)

(declare-fun arrayCountValidKeys!0 (array!93423 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376042 (= res!918969 (= (arrayCountValidKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376043 () Bool)

(declare-fun e!779540 () Bool)

(declare-fun e!779542 () Bool)

(assert (=> b!1376043 (= e!779540 e!779542)))

(declare-fun res!918965 () Bool)

(assert (=> b!1376043 (=> (not res!918965) (not e!779542))))

(declare-fun lt!605079 () (_ BitVec 32))

(declare-fun lt!605078 () (_ BitVec 32))

(assert (=> b!1376043 (= res!918965 (and (= lt!605079 lt!605078) (not (= to!206 (size!45665 a!4032)))))))

(assert (=> b!1376043 (= lt!605078 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376043 (= lt!605079 (arrayCountValidKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376043 (= lt!605083 (array!93424 (store (arr!45115 a!4032) i!1445 k!2947) (size!45665 a!4032)))))

(declare-fun res!918968 () Bool)

(assert (=> start!116754 (=> (not res!918968) (not e!779540))))

(assert (=> start!116754 (= res!918968 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45665 a!4032))))))

(assert (=> start!116754 e!779540))

(assert (=> start!116754 true))

(declare-fun array_inv!34143 (array!93423) Bool)

(assert (=> start!116754 (array_inv!34143 a!4032)))

(declare-fun bm!65812 () Bool)

(declare-fun call!65816 () (_ BitVec 32))

(assert (=> bm!65812 (= call!65816 (arrayCountValidKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376044 () Bool)

(assert (=> b!1376044 (= e!779542 e!779538)))

(declare-fun res!918966 () Bool)

(assert (=> b!1376044 (=> (not res!918966) (not e!779538))))

(assert (=> b!1376044 (= res!918966 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45665 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45595 0))(
  ( (Unit!45596) )
))
(declare-fun lt!605084 () Unit!45595)

(declare-fun e!779539 () Unit!45595)

(assert (=> b!1376044 (= lt!605084 e!779539)))

(declare-fun c!127979 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376044 (= c!127979 (validKeyInArray!0 (select (arr!45115 a!4032) to!206)))))

(declare-fun b!1376045 () Bool)

(declare-fun lt!605081 () Unit!45595)

(assert (=> b!1376045 (= e!779539 lt!605081)))

(declare-fun lt!605086 () Unit!45595)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93423 (_ BitVec 32) (_ BitVec 32)) Unit!45595)

(assert (=> b!1376045 (= lt!605086 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65815 () (_ BitVec 32))

(assert (=> b!1376045 (= call!65815 lt!605078)))

(assert (=> b!1376045 (= lt!605081 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376045 (= call!65816 lt!605079)))

(declare-fun bm!65813 () Bool)

(assert (=> bm!65813 (= call!65815 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376046 () Bool)

(assert (=> b!1376046 (= e!779538 (not true))))

(assert (=> b!1376046 (= (arrayCountValidKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) (size!45665 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45665 a!4032)))))

(declare-fun lt!605082 () Unit!45595)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93423 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45595)

(assert (=> b!1376046 (= lt!605082 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376047 () Bool)

(declare-fun res!918970 () Bool)

(assert (=> b!1376047 (=> (not res!918970) (not e!779540))))

(assert (=> b!1376047 (= res!918970 (validKeyInArray!0 (select (arr!45115 a!4032) i!1445)))))

(declare-fun b!1376048 () Bool)

(declare-fun res!918967 () Bool)

(assert (=> b!1376048 (=> (not res!918967) (not e!779540))))

(assert (=> b!1376048 (= res!918967 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376049 () Bool)

(declare-fun lt!605080 () Unit!45595)

(assert (=> b!1376049 (= e!779539 lt!605080)))

(declare-fun lt!605085 () Unit!45595)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93423 (_ BitVec 32) (_ BitVec 32)) Unit!45595)

(assert (=> b!1376049 (= lt!605085 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376049 (= call!65815 (bvadd #b00000000000000000000000000000001 lt!605078))))

(assert (=> b!1376049 (= lt!605080 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605083 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376049 (= call!65816 (bvadd #b00000000000000000000000000000001 lt!605079))))

(declare-fun b!1376050 () Bool)

(declare-fun res!918964 () Bool)

(assert (=> b!1376050 (=> (not res!918964) (not e!779540))))

(assert (=> b!1376050 (= res!918964 (and (bvslt (size!45665 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45665 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116754 res!918968) b!1376047))

(assert (= (and b!1376047 res!918970) b!1376048))

(assert (= (and b!1376048 res!918967) b!1376050))

(assert (= (and b!1376050 res!918964) b!1376043))

(assert (= (and b!1376043 res!918965) b!1376044))

(assert (= (and b!1376044 c!127979) b!1376049))

(assert (= (and b!1376044 (not c!127979)) b!1376045))

(assert (= (or b!1376049 b!1376045) bm!65813))

(assert (= (or b!1376049 b!1376045) bm!65812))

(assert (= (and b!1376044 res!918966) b!1376042))

(assert (= (and b!1376042 res!918969) b!1376046))

(declare-fun m!1260031 () Bool)

(assert (=> b!1376043 m!1260031))

(declare-fun m!1260033 () Bool)

(assert (=> b!1376043 m!1260033))

(declare-fun m!1260035 () Bool)

(assert (=> b!1376043 m!1260035))

(declare-fun m!1260037 () Bool)

(assert (=> b!1376049 m!1260037))

(declare-fun m!1260039 () Bool)

(assert (=> b!1376049 m!1260039))

(declare-fun m!1260041 () Bool)

(assert (=> b!1376044 m!1260041))

(assert (=> b!1376044 m!1260041))

(declare-fun m!1260043 () Bool)

(assert (=> b!1376044 m!1260043))

(declare-fun m!1260045 () Bool)

(assert (=> start!116754 m!1260045))

(declare-fun m!1260047 () Bool)

(assert (=> b!1376042 m!1260047))

(declare-fun m!1260049 () Bool)

(assert (=> b!1376042 m!1260049))

(declare-fun m!1260051 () Bool)

(assert (=> b!1376046 m!1260051))

(declare-fun m!1260053 () Bool)

(assert (=> b!1376046 m!1260053))

(declare-fun m!1260055 () Bool)

(assert (=> b!1376046 m!1260055))

(assert (=> bm!65812 m!1260047))

(declare-fun m!1260057 () Bool)

(assert (=> b!1376048 m!1260057))

(declare-fun m!1260059 () Bool)

(assert (=> b!1376047 m!1260059))

(assert (=> b!1376047 m!1260059))

(declare-fun m!1260061 () Bool)

(assert (=> b!1376047 m!1260061))

(declare-fun m!1260063 () Bool)

(assert (=> b!1376045 m!1260063))

(declare-fun m!1260065 () Bool)

(assert (=> b!1376045 m!1260065))

(assert (=> bm!65813 m!1260049))

(push 1)

(assert (not b!1376048))

(assert (not b!1376044))

(assert (not b!1376047))

