; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72116 () Bool)

(assert start!72116)

(declare-fun bm!36841 () Bool)

(declare-fun call!36845 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46863 0))(
  ( (array!46864 (arr!22461 (Array (_ BitVec 32) (_ BitVec 64))) (size!22881 (_ BitVec 32))) )
))
(declare-fun lt!380662 () array!46863)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46863 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36841 (= call!36845 (arrayCountValidKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836959 () Bool)

(declare-datatypes ((Unit!28786 0))(
  ( (Unit!28787) )
))
(declare-fun e!466989 () Unit!28786)

(declare-fun lt!380660 () Unit!28786)

(assert (=> b!836959 (= e!466989 lt!380660)))

(declare-fun a!4227 () array!46863)

(declare-fun lt!380658 () Unit!28786)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46863 (_ BitVec 32) (_ BitVec 32)) Unit!28786)

(assert (=> b!836959 (= lt!380658 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36844 () (_ BitVec 32))

(declare-fun lt!380661 () (_ BitVec 32))

(assert (=> b!836959 (= call!36844 lt!380661)))

(assert (=> b!836959 (= lt!380660 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380663 () (_ BitVec 32))

(assert (=> b!836959 (= call!36845 lt!380663)))

(declare-fun b!836960 () Bool)

(declare-fun e!466986 () Bool)

(assert (=> b!836960 (= e!466986 (not true))))

(assert (=> b!836960 (= (arrayCountValidKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) (size!22881 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22881 a!4227)))))

(declare-fun lt!380664 () Unit!28786)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46863 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28786)

(assert (=> b!836960 (= lt!380664 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!569154 () Bool)

(declare-fun e!466987 () Bool)

(assert (=> start!72116 (=> (not res!569154) (not e!466987))))

(assert (=> start!72116 (= res!569154 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22881 a!4227))))))

(assert (=> start!72116 e!466987))

(assert (=> start!72116 true))

(declare-fun array_inv!17947 (array!46863) Bool)

(assert (=> start!72116 (array_inv!17947 a!4227)))

(declare-fun b!836961 () Bool)

(declare-fun lt!380666 () Unit!28786)

(assert (=> b!836961 (= e!466989 lt!380666)))

(declare-fun lt!380665 () Unit!28786)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46863 (_ BitVec 32) (_ BitVec 32)) Unit!28786)

(assert (=> b!836961 (= lt!380665 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836961 (= call!36844 (bvadd #b00000000000000000000000000000001 lt!380661))))

(assert (=> b!836961 (= lt!380666 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836961 (= call!36845 (bvadd #b00000000000000000000000000000001 lt!380663))))

(declare-fun b!836962 () Bool)

(declare-fun res!569150 () Bool)

(assert (=> b!836962 (=> (not res!569150) (not e!466987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836962 (= res!569150 (validKeyInArray!0 k0!2968))))

(declare-fun b!836963 () Bool)

(declare-fun e!466988 () Bool)

(assert (=> b!836963 (= e!466987 e!466988)))

(declare-fun res!569153 () Bool)

(assert (=> b!836963 (=> (not res!569153) (not e!466988))))

(assert (=> b!836963 (= res!569153 (and (= lt!380663 lt!380661) (not (= to!390 (size!22881 a!4227)))))))

(assert (=> b!836963 (= lt!380661 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836963 (= lt!380663 (arrayCountValidKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836963 (= lt!380662 (array!46864 (store (arr!22461 a!4227) i!1466 k0!2968) (size!22881 a!4227)))))

(declare-fun b!836964 () Bool)

(declare-fun res!569148 () Bool)

(assert (=> b!836964 (=> (not res!569148) (not e!466986))))

(assert (=> b!836964 (= res!569148 (= (arrayCountValidKeys!0 lt!380662 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836965 () Bool)

(assert (=> b!836965 (= e!466988 e!466986)))

(declare-fun res!569149 () Bool)

(assert (=> b!836965 (=> (not res!569149) (not e!466986))))

(assert (=> b!836965 (= res!569149 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22881 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380659 () Unit!28786)

(assert (=> b!836965 (= lt!380659 e!466989)))

(declare-fun c!91304 () Bool)

(assert (=> b!836965 (= c!91304 (validKeyInArray!0 (select (arr!22461 a!4227) to!390)))))

(declare-fun b!836966 () Bool)

(declare-fun res!569151 () Bool)

(assert (=> b!836966 (=> (not res!569151) (not e!466987))))

(assert (=> b!836966 (= res!569151 (not (validKeyInArray!0 (select (arr!22461 a!4227) i!1466))))))

(declare-fun bm!36842 () Bool)

(assert (=> bm!36842 (= call!36844 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836967 () Bool)

(declare-fun res!569152 () Bool)

(assert (=> b!836967 (=> (not res!569152) (not e!466987))))

(assert (=> b!836967 (= res!569152 (and (bvslt (size!22881 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22881 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!72116 res!569154) b!836966))

(assert (= (and b!836966 res!569151) b!836962))

(assert (= (and b!836962 res!569150) b!836967))

(assert (= (and b!836967 res!569152) b!836963))

(assert (= (and b!836963 res!569153) b!836965))

(assert (= (and b!836965 c!91304) b!836961))

(assert (= (and b!836965 (not c!91304)) b!836959))

(assert (= (or b!836961 b!836959) bm!36841))

(assert (= (or b!836961 b!836959) bm!36842))

(assert (= (and b!836965 res!569149) b!836964))

(assert (= (and b!836964 res!569148) b!836960))

(declare-fun m!782707 () Bool)

(assert (=> b!836964 m!782707))

(declare-fun m!782709 () Bool)

(assert (=> b!836964 m!782709))

(assert (=> bm!36841 m!782707))

(declare-fun m!782711 () Bool)

(assert (=> b!836961 m!782711))

(declare-fun m!782713 () Bool)

(assert (=> b!836961 m!782713))

(declare-fun m!782715 () Bool)

(assert (=> b!836965 m!782715))

(assert (=> b!836965 m!782715))

(declare-fun m!782717 () Bool)

(assert (=> b!836965 m!782717))

(declare-fun m!782719 () Bool)

(assert (=> start!72116 m!782719))

(declare-fun m!782721 () Bool)

(assert (=> b!836960 m!782721))

(declare-fun m!782723 () Bool)

(assert (=> b!836960 m!782723))

(declare-fun m!782725 () Bool)

(assert (=> b!836960 m!782725))

(declare-fun m!782727 () Bool)

(assert (=> b!836959 m!782727))

(declare-fun m!782729 () Bool)

(assert (=> b!836959 m!782729))

(declare-fun m!782731 () Bool)

(assert (=> b!836966 m!782731))

(assert (=> b!836966 m!782731))

(declare-fun m!782733 () Bool)

(assert (=> b!836966 m!782733))

(declare-fun m!782735 () Bool)

(assert (=> b!836963 m!782735))

(declare-fun m!782737 () Bool)

(assert (=> b!836963 m!782737))

(declare-fun m!782739 () Bool)

(assert (=> b!836963 m!782739))

(assert (=> bm!36842 m!782709))

(declare-fun m!782741 () Bool)

(assert (=> b!836962 m!782741))

(check-sat (not b!836965) (not bm!36841) (not b!836960) (not b!836963) (not b!836964) (not b!836962) (not b!836961) (not b!836959) (not b!836966) (not start!72116) (not bm!36842))
(check-sat)
