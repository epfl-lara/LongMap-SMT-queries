; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116760 () Bool)

(assert start!116760)

(declare-fun b!1376123 () Bool)

(declare-fun e!779586 () Bool)

(declare-fun e!779587 () Bool)

(assert (=> b!1376123 (= e!779586 e!779587)))

(declare-fun res!919032 () Bool)

(assert (=> b!1376123 (=> (not res!919032) (not e!779587))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93429 0))(
  ( (array!93430 (arr!45118 (Array (_ BitVec 32) (_ BitVec 64))) (size!45668 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93429)

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1376123 (= res!919032 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45668 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45601 0))(
  ( (Unit!45602) )
))
(declare-fun lt!605165 () Unit!45601)

(declare-fun e!779583 () Unit!45601)

(assert (=> b!1376123 (= lt!605165 e!779583)))

(declare-fun c!127988 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376123 (= c!127988 (validKeyInArray!0 (select (arr!45118 a!4032) to!206)))))

(declare-fun b!1376124 () Bool)

(declare-fun res!919028 () Bool)

(assert (=> b!1376124 (=> (not res!919028) (not e!779587))))

(declare-fun lt!605163 () array!93429)

(declare-fun arrayCountValidKeys!0 (array!93429 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376124 (= res!919028 (= (arrayCountValidKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376125 () Bool)

(assert (=> b!1376125 (= e!779587 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1376125 (= (arrayCountValidKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) (size!45668 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45668 a!4032)))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605166 () Unit!45601)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45601)

(assert (=> b!1376125 (= lt!605166 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65830 () Bool)

(declare-fun call!65833 () (_ BitVec 32))

(assert (=> bm!65830 (= call!65833 (arrayCountValidKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376126 () Bool)

(declare-fun e!779584 () Bool)

(assert (=> b!1376126 (= e!779584 e!779586)))

(declare-fun res!919030 () Bool)

(assert (=> b!1376126 (=> (not res!919030) (not e!779586))))

(declare-fun lt!605162 () (_ BitVec 32))

(declare-fun lt!605159 () (_ BitVec 32))

(assert (=> b!1376126 (= res!919030 (and (= lt!605162 lt!605159) (not (= to!206 (size!45668 a!4032)))))))

(assert (=> b!1376126 (= lt!605159 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376126 (= lt!605162 (arrayCountValidKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376126 (= lt!605163 (array!93430 (store (arr!45118 a!4032) i!1445 k!2947) (size!45668 a!4032)))))

(declare-fun b!1376127 () Bool)

(declare-fun res!919031 () Bool)

(assert (=> b!1376127 (=> (not res!919031) (not e!779584))))

(assert (=> b!1376127 (= res!919031 (validKeyInArray!0 (select (arr!45118 a!4032) i!1445)))))

(declare-fun b!1376128 () Bool)

(declare-fun lt!605161 () Unit!45601)

(assert (=> b!1376128 (= e!779583 lt!605161)))

(declare-fun lt!605164 () Unit!45601)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93429 (_ BitVec 32) (_ BitVec 32)) Unit!45601)

(assert (=> b!1376128 (= lt!605164 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65834 () (_ BitVec 32))

(assert (=> b!1376128 (= call!65834 lt!605159)))

(assert (=> b!1376128 (= lt!605161 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376128 (= call!65833 lt!605162)))

(declare-fun b!1376129 () Bool)

(declare-fun lt!605160 () Unit!45601)

(assert (=> b!1376129 (= e!779583 lt!605160)))

(declare-fun lt!605167 () Unit!45601)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93429 (_ BitVec 32) (_ BitVec 32)) Unit!45601)

(assert (=> b!1376129 (= lt!605167 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376129 (= call!65834 (bvadd #b00000000000000000000000000000001 lt!605159))))

(assert (=> b!1376129 (= lt!605160 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605163 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376129 (= call!65833 (bvadd #b00000000000000000000000000000001 lt!605162))))

(declare-fun b!1376130 () Bool)

(declare-fun res!919027 () Bool)

(assert (=> b!1376130 (=> (not res!919027) (not e!779584))))

(assert (=> b!1376130 (= res!919027 (and (bvslt (size!45668 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45668 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919029 () Bool)

(assert (=> start!116760 (=> (not res!919029) (not e!779584))))

(assert (=> start!116760 (= res!919029 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45668 a!4032))))))

(assert (=> start!116760 e!779584))

(assert (=> start!116760 true))

(declare-fun array_inv!34146 (array!93429) Bool)

(assert (=> start!116760 (array_inv!34146 a!4032)))

(declare-fun bm!65831 () Bool)

(assert (=> bm!65831 (= call!65834 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376131 () Bool)

(declare-fun res!919033 () Bool)

(assert (=> b!1376131 (=> (not res!919033) (not e!779584))))

(assert (=> b!1376131 (= res!919033 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116760 res!919029) b!1376127))

(assert (= (and b!1376127 res!919031) b!1376131))

(assert (= (and b!1376131 res!919033) b!1376130))

(assert (= (and b!1376130 res!919027) b!1376126))

(assert (= (and b!1376126 res!919030) b!1376123))

(assert (= (and b!1376123 c!127988) b!1376129))

(assert (= (and b!1376123 (not c!127988)) b!1376128))

(assert (= (or b!1376129 b!1376128) bm!65830))

(assert (= (or b!1376129 b!1376128) bm!65831))

(assert (= (and b!1376123 res!919032) b!1376124))

(assert (= (and b!1376124 res!919028) b!1376125))

(declare-fun m!1260139 () Bool)

(assert (=> b!1376123 m!1260139))

(assert (=> b!1376123 m!1260139))

(declare-fun m!1260141 () Bool)

(assert (=> b!1376123 m!1260141))

(declare-fun m!1260143 () Bool)

(assert (=> b!1376131 m!1260143))

(declare-fun m!1260145 () Bool)

(assert (=> b!1376127 m!1260145))

(assert (=> b!1376127 m!1260145))

(declare-fun m!1260147 () Bool)

(assert (=> b!1376127 m!1260147))

(declare-fun m!1260149 () Bool)

(assert (=> bm!65831 m!1260149))

(declare-fun m!1260151 () Bool)

(assert (=> b!1376124 m!1260151))

(assert (=> b!1376124 m!1260149))

(declare-fun m!1260153 () Bool)

(assert (=> start!116760 m!1260153))

(declare-fun m!1260155 () Bool)

(assert (=> b!1376128 m!1260155))

(declare-fun m!1260157 () Bool)

(assert (=> b!1376128 m!1260157))

(declare-fun m!1260159 () Bool)

(assert (=> b!1376125 m!1260159))

(declare-fun m!1260161 () Bool)

(assert (=> b!1376125 m!1260161))

(declare-fun m!1260163 () Bool)

(assert (=> b!1376125 m!1260163))

(declare-fun m!1260165 () Bool)

(assert (=> b!1376126 m!1260165))

(declare-fun m!1260167 () Bool)

(assert (=> b!1376126 m!1260167))

(declare-fun m!1260169 () Bool)

(assert (=> b!1376126 m!1260169))

(declare-fun m!1260171 () Bool)

(assert (=> b!1376129 m!1260171))

(declare-fun m!1260173 () Bool)

(assert (=> b!1376129 m!1260173))

(assert (=> bm!65830 m!1260151))

(push 1)

(assert (not bm!65830))

(assert (not b!1376124))

(assert (not start!116760))

(assert (not bm!65831))

(assert (not b!1376123))

(assert (not b!1376125))

(assert (not b!1376131))

(assert (not b!1376127))

(assert (not b!1376129))

(assert (not b!1376126))

(assert (not b!1376128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

