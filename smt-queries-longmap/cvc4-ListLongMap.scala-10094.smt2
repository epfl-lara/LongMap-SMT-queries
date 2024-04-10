; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118996 () Bool)

(assert start!118996)

(declare-fun b!1389001 () Bool)

(declare-fun res!929235 () Bool)

(declare-fun e!786823 () Bool)

(assert (=> b!1389001 (=> (not res!929235) (not e!786823))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94993 0))(
  ( (array!94994 (arr!45865 (Array (_ BitVec 32) (_ BitVec 64))) (size!46415 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94993)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389001 (= res!929235 (and (= (size!46415 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46415 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46415 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389002 () Bool)

(declare-fun res!929232 () Bool)

(assert (=> b!1389002 (=> (not res!929232) (not e!786823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389002 (= res!929232 (validKeyInArray!0 (select (arr!45865 a!2901) j!112)))))

(declare-fun b!1389003 () Bool)

(declare-fun res!929234 () Bool)

(assert (=> b!1389003 (=> (not res!929234) (not e!786823))))

(assert (=> b!1389003 (= res!929234 (validKeyInArray!0 (select (arr!45865 a!2901) i!1037)))))

(declare-fun b!1389004 () Bool)

(declare-fun res!929236 () Bool)

(assert (=> b!1389004 (=> (not res!929236) (not e!786823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94993 (_ BitVec 32)) Bool)

(assert (=> b!1389004 (= res!929236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929231 () Bool)

(assert (=> start!118996 (=> (not res!929231) (not e!786823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118996 (= res!929231 (validMask!0 mask!2840))))

(assert (=> start!118996 e!786823))

(assert (=> start!118996 true))

(declare-fun array_inv!34893 (array!94993) Bool)

(assert (=> start!118996 (array_inv!34893 a!2901)))

(declare-fun b!1389005 () Bool)

(declare-fun res!929233 () Bool)

(assert (=> b!1389005 (=> (not res!929233) (not e!786823))))

(declare-datatypes ((List!32384 0))(
  ( (Nil!32381) (Cons!32380 (h!33595 (_ BitVec 64)) (t!47078 List!32384)) )
))
(declare-fun arrayNoDuplicates!0 (array!94993 (_ BitVec 32) List!32384) Bool)

(assert (=> b!1389005 (= res!929233 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32381))))

(declare-fun b!1389006 () Bool)

(assert (=> b!1389006 (= e!786823 (and (bvsge mask!2840 #b00000000000000000000000000000000) (bvsgt mask!2840 #b00111111111111111111111111111111)))))

(assert (= (and start!118996 res!929231) b!1389001))

(assert (= (and b!1389001 res!929235) b!1389003))

(assert (= (and b!1389003 res!929234) b!1389002))

(assert (= (and b!1389002 res!929232) b!1389004))

(assert (= (and b!1389004 res!929236) b!1389005))

(assert (= (and b!1389005 res!929233) b!1389006))

(declare-fun m!1274711 () Bool)

(assert (=> b!1389002 m!1274711))

(assert (=> b!1389002 m!1274711))

(declare-fun m!1274713 () Bool)

(assert (=> b!1389002 m!1274713))

(declare-fun m!1274715 () Bool)

(assert (=> start!118996 m!1274715))

(declare-fun m!1274717 () Bool)

(assert (=> start!118996 m!1274717))

(declare-fun m!1274719 () Bool)

(assert (=> b!1389004 m!1274719))

(declare-fun m!1274721 () Bool)

(assert (=> b!1389005 m!1274721))

(declare-fun m!1274723 () Bool)

(assert (=> b!1389003 m!1274723))

(assert (=> b!1389003 m!1274723))

(declare-fun m!1274725 () Bool)

(assert (=> b!1389003 m!1274725))

(push 1)

(assert (not b!1389003))

(assert (not start!118996))

(assert (not b!1389002))

(assert (not b!1389005))

(assert (not b!1389004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150077 () Bool)

(declare-fun res!929248 () Bool)

(declare-fun e!786840 () Bool)

(assert (=> d!150077 (=> res!929248 e!786840)))

(assert (=> d!150077 (= res!929248 (bvsge #b00000000000000000000000000000000 (size!46415 a!2901)))))

(assert (=> d!150077 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32381) e!786840)))

(declare-fun bm!66663 () Bool)

(declare-fun call!66666 () Bool)

(declare-fun c!129332 () Bool)

(assert (=> bm!66663 (= call!66666 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129332 (Cons!32380 (select (arr!45865 a!2901) #b00000000000000000000000000000000) Nil!32381) Nil!32381)))))

(declare-fun b!1389025 () Bool)

(declare-fun e!786842 () Bool)

(assert (=> b!1389025 (= e!786842 call!66666)))

(declare-fun b!1389026 () Bool)

(assert (=> b!1389026 (= e!786842 call!66666)))

(declare-fun b!1389027 () Bool)

(declare-fun e!786839 () Bool)

(assert (=> b!1389027 (= e!786839 e!786842)))

(assert (=> b!1389027 (= c!129332 (validKeyInArray!0 (select (arr!45865 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389028 () Bool)

(declare-fun e!786841 () Bool)

(declare-fun contains!9757 (List!32384 (_ BitVec 64)) Bool)

(assert (=> b!1389028 (= e!786841 (contains!9757 Nil!32381 (select (arr!45865 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389029 () Bool)

(assert (=> b!1389029 (= e!786840 e!786839)))

(declare-fun res!929247 () Bool)

(assert (=> b!1389029 (=> (not res!929247) (not e!786839))))

(assert (=> b!1389029 (= res!929247 (not e!786841))))

(declare-fun res!929249 () Bool)

(assert (=> b!1389029 (=> (not res!929249) (not e!786841))))

(assert (=> b!1389029 (= res!929249 (validKeyInArray!0 (select (arr!45865 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150077 (not res!929248)) b!1389029))

(assert (= (and b!1389029 res!929249) b!1389028))

(assert (= (and b!1389029 res!929247) b!1389027))

(assert (= (and b!1389027 c!129332) b!1389026))

(assert (= (and b!1389027 (not c!129332)) b!1389025))

(assert (= (or b!1389026 b!1389025) bm!66663))

(declare-fun m!1274727 () Bool)

(assert (=> bm!66663 m!1274727))

(declare-fun m!1274729 () Bool)

(assert (=> bm!66663 m!1274729))

(assert (=> b!1389027 m!1274727))

(assert (=> b!1389027 m!1274727))

(declare-fun m!1274731 () Bool)

(assert (=> b!1389027 m!1274731))

(assert (=> b!1389028 m!1274727))

(assert (=> b!1389028 m!1274727))

(declare-fun m!1274733 () Bool)

(assert (=> b!1389028 m!1274733))

(assert (=> b!1389029 m!1274727))

(assert (=> b!1389029 m!1274727))

(assert (=> b!1389029 m!1274731))

(assert (=> b!1389005 d!150077))

(declare-fun b!1389072 () Bool)

(declare-fun e!786877 () Bool)

(declare-fun e!786876 () Bool)

(assert (=> b!1389072 (= e!786877 e!786876)))

(declare-fun lt!610465 () (_ BitVec 64))

(assert (=> b!1389072 (= lt!610465 (select (arr!45865 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46428 0))(
  ( (Unit!46429) )
))
(declare-fun lt!610467 () Unit!46428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94993 (_ BitVec 64) (_ BitVec 32)) Unit!46428)

(assert (=> b!1389072 (= lt!610467 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610465 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389072 (arrayContainsKey!0 a!2901 lt!610465 #b00000000000000000000000000000000)))

(declare-fun lt!610466 () Unit!46428)

(assert (=> b!1389072 (= lt!610466 lt!610467)))

(declare-fun res!929275 () Bool)

(declare-datatypes ((SeekEntryResult!10197 0))(
  ( (MissingZero!10197 (index!43159 (_ BitVec 32))) (Found!10197 (index!43160 (_ BitVec 32))) (Intermediate!10197 (undefined!11009 Bool) (index!43161 (_ BitVec 32)) (x!124808 (_ BitVec 32))) (Undefined!10197) (MissingVacant!10197 (index!43162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94993 (_ BitVec 32)) SeekEntryResult!10197)

(assert (=> b!1389072 (= res!929275 (= (seekEntryOrOpen!0 (select (arr!45865 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10197 #b00000000000000000000000000000000)))))

(assert (=> b!1389072 (=> (not res!929275) (not e!786876))))

(declare-fun bm!66673 () Bool)

