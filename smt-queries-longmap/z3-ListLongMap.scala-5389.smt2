; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71934 () Bool)

(assert start!71934)

(declare-fun b!835849 () Bool)

(declare-fun res!568639 () Bool)

(declare-fun e!466290 () Bool)

(assert (=> b!835849 (=> (not res!568639) (not e!466290))))

(declare-datatypes ((array!46844 0))(
  ( (array!46845 (arr!22456 (Array (_ BitVec 32) (_ BitVec 64))) (size!22877 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46844)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835849 (= res!568639 (not (validKeyInArray!0 (select (arr!22456 a!4227) i!1466))))))

(declare-fun b!835850 () Bool)

(declare-datatypes ((Unit!28757 0))(
  ( (Unit!28758) )
))
(declare-fun e!466288 () Unit!28757)

(declare-fun lt!380103 () Unit!28757)

(assert (=> b!835850 (= e!466288 lt!380103)))

(declare-fun lt!380098 () Unit!28757)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46844 (_ BitVec 32) (_ BitVec 32)) Unit!28757)

(assert (=> b!835850 (= lt!380098 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36752 () (_ BitVec 32))

(declare-fun lt!380099 () (_ BitVec 32))

(assert (=> b!835850 (= call!36752 (bvadd #b00000000000000000000000000000001 lt!380099))))

(declare-fun lt!380097 () array!46844)

(assert (=> b!835850 (= lt!380103 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380097 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36751 () (_ BitVec 32))

(declare-fun lt!380102 () (_ BitVec 32))

(assert (=> b!835850 (= call!36751 (bvadd #b00000000000000000000000000000001 lt!380102))))

(declare-fun b!835851 () Bool)

(declare-fun res!568643 () Bool)

(assert (=> b!835851 (=> (not res!568643) (not e!466290))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835851 (= res!568643 (validKeyInArray!0 k0!2968))))

(declare-fun res!568642 () Bool)

(assert (=> start!71934 (=> (not res!568642) (not e!466290))))

(assert (=> start!71934 (= res!568642 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22877 a!4227))))))

(assert (=> start!71934 e!466290))

(assert (=> start!71934 true))

(declare-fun array_inv!17903 (array!46844) Bool)

(assert (=> start!71934 (array_inv!17903 a!4227)))

(declare-fun bm!36748 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46844 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36748 (= call!36752 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835852 () Bool)

(declare-fun res!568638 () Bool)

(assert (=> b!835852 (=> (not res!568638) (not e!466290))))

(assert (=> b!835852 (= res!568638 (and (bvslt (size!22877 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22877 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36749 () Bool)

(assert (=> bm!36749 (= call!36751 (arrayCountValidKeys!0 lt!380097 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun e!466289 () Bool)

(declare-fun b!835853 () Bool)

(assert (=> b!835853 (= e!466289 (not (= (arrayCountValidKeys!0 lt!380097 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))))

(declare-fun b!835854 () Bool)

(declare-fun e!466287 () Bool)

(assert (=> b!835854 (= e!466287 e!466289)))

(declare-fun res!568641 () Bool)

(assert (=> b!835854 (=> (not res!568641) (not e!466289))))

(assert (=> b!835854 (= res!568641 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22877 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380101 () Unit!28757)

(assert (=> b!835854 (= lt!380101 e!466288)))

(declare-fun c!91001 () Bool)

(assert (=> b!835854 (= c!91001 (validKeyInArray!0 (select (arr!22456 a!4227) to!390)))))

(declare-fun b!835855 () Bool)

(declare-fun lt!380100 () Unit!28757)

(assert (=> b!835855 (= e!466288 lt!380100)))

(declare-fun lt!380104 () Unit!28757)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46844 (_ BitVec 32) (_ BitVec 32)) Unit!28757)

(assert (=> b!835855 (= lt!380104 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835855 (= call!36752 lt!380099)))

(assert (=> b!835855 (= lt!380100 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380097 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835855 (= call!36751 lt!380102)))

(declare-fun b!835856 () Bool)

(assert (=> b!835856 (= e!466290 e!466287)))

(declare-fun res!568640 () Bool)

(assert (=> b!835856 (=> (not res!568640) (not e!466287))))

(assert (=> b!835856 (= res!568640 (and (= lt!380102 lt!380099) (not (= to!390 (size!22877 a!4227)))))))

(assert (=> b!835856 (= lt!380099 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835856 (= lt!380102 (arrayCountValidKeys!0 lt!380097 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835856 (= lt!380097 (array!46845 (store (arr!22456 a!4227) i!1466 k0!2968) (size!22877 a!4227)))))

(assert (= (and start!71934 res!568642) b!835849))

(assert (= (and b!835849 res!568639) b!835851))

(assert (= (and b!835851 res!568643) b!835852))

(assert (= (and b!835852 res!568638) b!835856))

(assert (= (and b!835856 res!568640) b!835854))

(assert (= (and b!835854 c!91001) b!835850))

(assert (= (and b!835854 (not c!91001)) b!835855))

(assert (= (or b!835850 b!835855) bm!36749))

(assert (= (or b!835850 b!835855) bm!36748))

(assert (= (and b!835854 res!568641) b!835853))

(declare-fun m!781155 () Bool)

(assert (=> b!835849 m!781155))

(assert (=> b!835849 m!781155))

(declare-fun m!781157 () Bool)

(assert (=> b!835849 m!781157))

(declare-fun m!781159 () Bool)

(assert (=> bm!36748 m!781159))

(declare-fun m!781161 () Bool)

(assert (=> b!835855 m!781161))

(declare-fun m!781163 () Bool)

(assert (=> b!835855 m!781163))

(declare-fun m!781165 () Bool)

(assert (=> b!835851 m!781165))

(declare-fun m!781167 () Bool)

(assert (=> b!835856 m!781167))

(declare-fun m!781169 () Bool)

(assert (=> b!835856 m!781169))

(declare-fun m!781171 () Bool)

(assert (=> b!835856 m!781171))

(declare-fun m!781173 () Bool)

(assert (=> b!835853 m!781173))

(assert (=> b!835853 m!781159))

(assert (=> bm!36749 m!781173))

(declare-fun m!781175 () Bool)

(assert (=> b!835850 m!781175))

(declare-fun m!781177 () Bool)

(assert (=> b!835850 m!781177))

(declare-fun m!781179 () Bool)

(assert (=> start!71934 m!781179))

(declare-fun m!781181 () Bool)

(assert (=> b!835854 m!781181))

(assert (=> b!835854 m!781181))

(declare-fun m!781183 () Bool)

(assert (=> b!835854 m!781183))

(check-sat (not start!71934) (not b!835849) (not b!835853) (not b!835856) (not b!835854) (not b!835855) (not bm!36749) (not bm!36748) (not b!835850) (not b!835851))
(check-sat)
