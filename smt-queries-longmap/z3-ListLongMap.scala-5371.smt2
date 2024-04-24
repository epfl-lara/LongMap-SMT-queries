; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71990 () Bool)

(assert start!71990)

(declare-fun b!835699 () Bool)

(declare-fun res!568051 () Bool)

(declare-fun e!466349 () Bool)

(assert (=> b!835699 (=> (not res!568051) (not e!466349))))

(declare-datatypes ((array!46737 0))(
  ( (array!46738 (arr!22398 (Array (_ BitVec 32) (_ BitVec 64))) (size!22818 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46737)

(declare-fun lt!379846 () array!46737)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835699 (= res!568051 (= (arrayCountValidKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun call!36682 () (_ BitVec 32))

(declare-fun bm!36679 () Bool)

(assert (=> bm!36679 (= call!36682 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835700 () Bool)

(declare-fun e!466348 () Bool)

(declare-fun e!466347 () Bool)

(assert (=> b!835700 (= e!466348 e!466347)))

(declare-fun res!568052 () Bool)

(assert (=> b!835700 (=> (not res!568052) (not e!466347))))

(declare-fun lt!379840 () (_ BitVec 32))

(declare-fun lt!379841 () (_ BitVec 32))

(assert (=> b!835700 (= res!568052 (and (= lt!379841 lt!379840) (not (= to!390 (size!22818 a!4227)))))))

(assert (=> b!835700 (= lt!379840 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835700 (= lt!379841 (arrayCountValidKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835700 (= lt!379846 (array!46738 (store (arr!22398 a!4227) i!1466 k0!2968) (size!22818 a!4227)))))

(declare-fun b!835701 () Bool)

(declare-fun res!568054 () Bool)

(assert (=> b!835701 (=> (not res!568054) (not e!466348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835701 (= res!568054 (not (validKeyInArray!0 (select (arr!22398 a!4227) i!1466))))))

(declare-fun b!835702 () Bool)

(declare-datatypes ((Unit!28708 0))(
  ( (Unit!28709) )
))
(declare-fun e!466351 () Unit!28708)

(declare-fun lt!379844 () Unit!28708)

(assert (=> b!835702 (= e!466351 lt!379844)))

(declare-fun lt!379847 () Unit!28708)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46737 (_ BitVec 32) (_ BitVec 32)) Unit!28708)

(assert (=> b!835702 (= lt!379847 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835702 (= call!36682 lt!379840)))

(assert (=> b!835702 (= lt!379844 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36683 () (_ BitVec 32))

(assert (=> b!835702 (= call!36683 lt!379841)))

(declare-fun b!835703 () Bool)

(assert (=> b!835703 (= e!466349 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!835703 (= (arrayCountValidKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) (size!22818 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22818 a!4227)))))

(declare-fun lt!379845 () Unit!28708)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28708)

(assert (=> b!835703 (= lt!379845 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835704 () Bool)

(declare-fun res!568050 () Bool)

(assert (=> b!835704 (=> (not res!568050) (not e!466348))))

(assert (=> b!835704 (= res!568050 (and (bvslt (size!22818 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22818 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835705 () Bool)

(declare-fun res!568056 () Bool)

(assert (=> b!835705 (=> (not res!568056) (not e!466348))))

(assert (=> b!835705 (= res!568056 (validKeyInArray!0 k0!2968))))

(declare-fun b!835706 () Bool)

(assert (=> b!835706 (= e!466347 e!466349)))

(declare-fun res!568053 () Bool)

(assert (=> b!835706 (=> (not res!568053) (not e!466349))))

(assert (=> b!835706 (= res!568053 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22818 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379839 () Unit!28708)

(assert (=> b!835706 (= lt!379839 e!466351)))

(declare-fun c!91223 () Bool)

(assert (=> b!835706 (= c!91223 (validKeyInArray!0 (select (arr!22398 a!4227) to!390)))))

(declare-fun b!835707 () Bool)

(declare-fun lt!379842 () Unit!28708)

(assert (=> b!835707 (= e!466351 lt!379842)))

(declare-fun lt!379843 () Unit!28708)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46737 (_ BitVec 32) (_ BitVec 32)) Unit!28708)

(assert (=> b!835707 (= lt!379843 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835707 (= call!36682 (bvadd #b00000000000000000000000000000001 lt!379840))))

(assert (=> b!835707 (= lt!379842 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835707 (= call!36683 (bvadd #b00000000000000000000000000000001 lt!379841))))

(declare-fun bm!36680 () Bool)

(assert (=> bm!36680 (= call!36683 (arrayCountValidKeys!0 lt!379846 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568055 () Bool)

(assert (=> start!71990 (=> (not res!568055) (not e!466348))))

(assert (=> start!71990 (= res!568055 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22818 a!4227))))))

(assert (=> start!71990 e!466348))

(assert (=> start!71990 true))

(declare-fun array_inv!17884 (array!46737) Bool)

(assert (=> start!71990 (array_inv!17884 a!4227)))

(assert (= (and start!71990 res!568055) b!835701))

(assert (= (and b!835701 res!568054) b!835705))

(assert (= (and b!835705 res!568056) b!835704))

(assert (= (and b!835704 res!568050) b!835700))

(assert (= (and b!835700 res!568052) b!835706))

(assert (= (and b!835706 c!91223) b!835707))

(assert (= (and b!835706 (not c!91223)) b!835702))

(assert (= (or b!835707 b!835702) bm!36680))

(assert (= (or b!835707 b!835702) bm!36679))

(assert (= (and b!835706 res!568053) b!835699))

(assert (= (and b!835699 res!568051) b!835703))

(declare-fun m!781195 () Bool)

(assert (=> bm!36679 m!781195))

(declare-fun m!781197 () Bool)

(assert (=> b!835703 m!781197))

(declare-fun m!781199 () Bool)

(assert (=> b!835703 m!781199))

(declare-fun m!781201 () Bool)

(assert (=> b!835703 m!781201))

(declare-fun m!781203 () Bool)

(assert (=> b!835705 m!781203))

(declare-fun m!781205 () Bool)

(assert (=> b!835702 m!781205))

(declare-fun m!781207 () Bool)

(assert (=> b!835702 m!781207))

(declare-fun m!781209 () Bool)

(assert (=> start!71990 m!781209))

(declare-fun m!781211 () Bool)

(assert (=> b!835706 m!781211))

(assert (=> b!835706 m!781211))

(declare-fun m!781213 () Bool)

(assert (=> b!835706 m!781213))

(declare-fun m!781215 () Bool)

(assert (=> b!835701 m!781215))

(assert (=> b!835701 m!781215))

(declare-fun m!781217 () Bool)

(assert (=> b!835701 m!781217))

(declare-fun m!781219 () Bool)

(assert (=> b!835700 m!781219))

(declare-fun m!781221 () Bool)

(assert (=> b!835700 m!781221))

(declare-fun m!781223 () Bool)

(assert (=> b!835700 m!781223))

(declare-fun m!781225 () Bool)

(assert (=> b!835699 m!781225))

(assert (=> b!835699 m!781195))

(assert (=> bm!36680 m!781225))

(declare-fun m!781227 () Bool)

(assert (=> b!835707 m!781227))

(declare-fun m!781229 () Bool)

(assert (=> b!835707 m!781229))

(check-sat (not b!835700) (not start!71990) (not bm!36680) (not bm!36679) (not b!835703) (not b!835705) (not b!835706) (not b!835702) (not b!835707) (not b!835701) (not b!835699))
(check-sat)
