; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60202 () Bool)

(assert start!60202)

(declare-fun b!673510 () Bool)

(declare-fun res!440056 () Bool)

(declare-fun e!384601 () Bool)

(assert (=> b!673510 (=> (not res!440056) (not e!384601))))

(declare-datatypes ((List!12858 0))(
  ( (Nil!12855) (Cons!12854 (h!13899 (_ BitVec 64)) (t!19086 List!12858)) )
))
(declare-fun lt!312476 () List!12858)

(declare-fun contains!3435 (List!12858 (_ BitVec 64)) Bool)

(assert (=> b!673510 (= res!440056 (not (contains!3435 lt!312476 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673511 () Bool)

(declare-fun res!440068 () Bool)

(declare-fun e!384598 () Bool)

(assert (=> b!673511 (=> (not res!440068) (not e!384598))))

(declare-fun e!384593 () Bool)

(assert (=> b!673511 (= res!440068 e!384593)))

(declare-fun res!440065 () Bool)

(assert (=> b!673511 (=> res!440065 e!384593)))

(declare-fun e!384603 () Bool)

(assert (=> b!673511 (= res!440065 e!384603)))

(declare-fun res!440067 () Bool)

(assert (=> b!673511 (=> (not res!440067) (not e!384603))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673511 (= res!440067 (bvsgt from!3004 i!1382))))

(declare-fun b!673512 () Bool)

(declare-fun res!440057 () Bool)

(assert (=> b!673512 (=> (not res!440057) (not e!384598))))

(declare-fun acc!681 () List!12858)

(assert (=> b!673512 (= res!440057 (not (contains!3435 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673513 () Bool)

(declare-fun e!384595 () Bool)

(assert (=> b!673513 (= e!384595 e!384601)))

(declare-fun res!440054 () Bool)

(assert (=> b!673513 (=> (not res!440054) (not e!384601))))

(assert (=> b!673513 (= res!440054 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39249 0))(
  ( (array!39250 (arr!18817 (Array (_ BitVec 32) (_ BitVec 64))) (size!19181 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39249)

(declare-fun $colon$colon!285 (List!12858 (_ BitVec 64)) List!12858)

(assert (=> b!673513 (= lt!312476 ($colon$colon!285 acc!681 (select (arr!18817 a!3626) from!3004)))))

(declare-fun b!673514 () Bool)

(declare-fun res!440061 () Bool)

(assert (=> b!673514 (=> (not res!440061) (not e!384598))))

(assert (=> b!673514 (= res!440061 (not (contains!3435 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673515 () Bool)

(declare-fun e!384602 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!673515 (= e!384602 (contains!3435 lt!312476 k0!2843))))

(declare-fun b!673516 () Bool)

(declare-fun res!440059 () Bool)

(assert (=> b!673516 (=> (not res!440059) (not e!384601))))

(declare-fun e!384600 () Bool)

(assert (=> b!673516 (= res!440059 e!384600)))

(declare-fun res!440066 () Bool)

(assert (=> b!673516 (=> res!440066 e!384600)))

(assert (=> b!673516 (= res!440066 e!384602)))

(declare-fun res!440070 () Bool)

(assert (=> b!673516 (=> (not res!440070) (not e!384602))))

(assert (=> b!673516 (= res!440070 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673517 () Bool)

(assert (=> b!673517 (= e!384601 false)))

(declare-fun lt!312475 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39249 (_ BitVec 32) List!12858) Bool)

(assert (=> b!673517 (= lt!312475 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312476))))

(declare-fun b!673518 () Bool)

(declare-fun res!440075 () Bool)

(assert (=> b!673518 (=> (not res!440075) (not e!384601))))

(assert (=> b!673518 (= res!440075 (not (contains!3435 lt!312476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673519 () Bool)

(declare-fun res!440058 () Bool)

(assert (=> b!673519 (=> (not res!440058) (not e!384598))))

(assert (=> b!673519 (= res!440058 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12855))))

(declare-fun b!673520 () Bool)

(declare-fun res!440063 () Bool)

(assert (=> b!673520 (=> (not res!440063) (not e!384598))))

(declare-fun arrayContainsKey!0 (array!39249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673520 (= res!440063 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673521 () Bool)

(declare-fun res!440062 () Bool)

(assert (=> b!673521 (=> (not res!440062) (not e!384601))))

(declare-fun noDuplicate!682 (List!12858) Bool)

(assert (=> b!673521 (= res!440062 (noDuplicate!682 lt!312476))))

(declare-fun b!673522 () Bool)

(assert (=> b!673522 (= e!384598 e!384595)))

(declare-fun res!440071 () Bool)

(assert (=> b!673522 (=> (not res!440071) (not e!384595))))

(assert (=> b!673522 (= res!440071 (not (= (select (arr!18817 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23680 0))(
  ( (Unit!23681) )
))
(declare-fun lt!312478 () Unit!23680)

(declare-fun e!384594 () Unit!23680)

(assert (=> b!673522 (= lt!312478 e!384594)))

(declare-fun c!77096 () Bool)

(assert (=> b!673522 (= c!77096 (= (select (arr!18817 a!3626) from!3004) k0!2843))))

(declare-fun b!673523 () Bool)

(declare-fun res!440072 () Bool)

(assert (=> b!673523 (=> (not res!440072) (not e!384598))))

(assert (=> b!673523 (= res!440072 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673525 () Bool)

(declare-fun Unit!23682 () Unit!23680)

(assert (=> b!673525 (= e!384594 Unit!23682)))

(declare-fun b!673526 () Bool)

(declare-fun Unit!23683 () Unit!23680)

(assert (=> b!673526 (= e!384594 Unit!23683)))

(assert (=> b!673526 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312477 () Unit!23680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39249 (_ BitVec 64) (_ BitVec 32)) Unit!23680)

(assert (=> b!673526 (= lt!312477 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673526 false))

(declare-fun b!673527 () Bool)

(declare-fun e!384596 () Bool)

(assert (=> b!673527 (= e!384596 (not (contains!3435 acc!681 k0!2843)))))

(declare-fun b!673528 () Bool)

(declare-fun res!440055 () Bool)

(assert (=> b!673528 (=> (not res!440055) (not e!384598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673528 (= res!440055 (validKeyInArray!0 (select (arr!18817 a!3626) from!3004)))))

(declare-fun b!673529 () Bool)

(declare-fun res!440073 () Bool)

(assert (=> b!673529 (=> (not res!440073) (not e!384598))))

(assert (=> b!673529 (= res!440073 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19181 a!3626))))))

(declare-fun b!673530 () Bool)

(assert (=> b!673530 (= e!384593 e!384596)))

(declare-fun res!440053 () Bool)

(assert (=> b!673530 (=> (not res!440053) (not e!384596))))

(assert (=> b!673530 (= res!440053 (bvsle from!3004 i!1382))))

(declare-fun b!673531 () Bool)

(declare-fun res!440074 () Bool)

(assert (=> b!673531 (=> (not res!440074) (not e!384598))))

(assert (=> b!673531 (= res!440074 (validKeyInArray!0 k0!2843))))

(declare-fun b!673532 () Bool)

(declare-fun res!440064 () Bool)

(assert (=> b!673532 (=> (not res!440064) (not e!384598))))

(assert (=> b!673532 (= res!440064 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19181 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673533 () Bool)

(declare-fun res!440052 () Bool)

(assert (=> b!673533 (=> (not res!440052) (not e!384598))))

(assert (=> b!673533 (= res!440052 (noDuplicate!682 acc!681))))

(declare-fun b!673524 () Bool)

(declare-fun e!384597 () Bool)

(assert (=> b!673524 (= e!384600 e!384597)))

(declare-fun res!440069 () Bool)

(assert (=> b!673524 (=> (not res!440069) (not e!384597))))

(assert (=> b!673524 (= res!440069 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!440060 () Bool)

(assert (=> start!60202 (=> (not res!440060) (not e!384598))))

(assert (=> start!60202 (= res!440060 (and (bvslt (size!19181 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19181 a!3626))))))

(assert (=> start!60202 e!384598))

(assert (=> start!60202 true))

(declare-fun array_inv!14613 (array!39249) Bool)

(assert (=> start!60202 (array_inv!14613 a!3626)))

(declare-fun b!673534 () Bool)

(assert (=> b!673534 (= e!384597 (not (contains!3435 lt!312476 k0!2843)))))

(declare-fun b!673535 () Bool)

(assert (=> b!673535 (= e!384603 (contains!3435 acc!681 k0!2843))))

(assert (= (and start!60202 res!440060) b!673533))

(assert (= (and b!673533 res!440052) b!673512))

(assert (= (and b!673512 res!440057) b!673514))

(assert (= (and b!673514 res!440061) b!673511))

(assert (= (and b!673511 res!440067) b!673535))

(assert (= (and b!673511 (not res!440065)) b!673530))

(assert (= (and b!673530 res!440053) b!673527))

(assert (= (and b!673511 res!440068) b!673519))

(assert (= (and b!673519 res!440058) b!673523))

(assert (= (and b!673523 res!440072) b!673529))

(assert (= (and b!673529 res!440073) b!673531))

(assert (= (and b!673531 res!440074) b!673520))

(assert (= (and b!673520 res!440063) b!673532))

(assert (= (and b!673532 res!440064) b!673528))

(assert (= (and b!673528 res!440055) b!673522))

(assert (= (and b!673522 c!77096) b!673526))

(assert (= (and b!673522 (not c!77096)) b!673525))

(assert (= (and b!673522 res!440071) b!673513))

(assert (= (and b!673513 res!440054) b!673521))

(assert (= (and b!673521 res!440062) b!673518))

(assert (= (and b!673518 res!440075) b!673510))

(assert (= (and b!673510 res!440056) b!673516))

(assert (= (and b!673516 res!440070) b!673515))

(assert (= (and b!673516 (not res!440066)) b!673524))

(assert (= (and b!673524 res!440069) b!673534))

(assert (= (and b!673516 res!440059) b!673517))

(declare-fun m!641923 () Bool)

(assert (=> b!673520 m!641923))

(declare-fun m!641925 () Bool)

(assert (=> b!673512 m!641925))

(declare-fun m!641927 () Bool)

(assert (=> b!673528 m!641927))

(assert (=> b!673528 m!641927))

(declare-fun m!641929 () Bool)

(assert (=> b!673528 m!641929))

(declare-fun m!641931 () Bool)

(assert (=> b!673510 m!641931))

(declare-fun m!641933 () Bool)

(assert (=> b!673514 m!641933))

(declare-fun m!641935 () Bool)

(assert (=> b!673523 m!641935))

(assert (=> b!673522 m!641927))

(declare-fun m!641937 () Bool)

(assert (=> b!673531 m!641937))

(declare-fun m!641939 () Bool)

(assert (=> b!673517 m!641939))

(assert (=> b!673513 m!641927))

(assert (=> b!673513 m!641927))

(declare-fun m!641941 () Bool)

(assert (=> b!673513 m!641941))

(declare-fun m!641943 () Bool)

(assert (=> b!673533 m!641943))

(declare-fun m!641945 () Bool)

(assert (=> b!673518 m!641945))

(declare-fun m!641947 () Bool)

(assert (=> b!673527 m!641947))

(declare-fun m!641949 () Bool)

(assert (=> start!60202 m!641949))

(declare-fun m!641951 () Bool)

(assert (=> b!673526 m!641951))

(declare-fun m!641953 () Bool)

(assert (=> b!673526 m!641953))

(declare-fun m!641955 () Bool)

(assert (=> b!673534 m!641955))

(declare-fun m!641957 () Bool)

(assert (=> b!673519 m!641957))

(assert (=> b!673535 m!641947))

(assert (=> b!673515 m!641955))

(declare-fun m!641959 () Bool)

(assert (=> b!673521 m!641959))

(check-sat (not b!673521) (not b!673528) (not b!673512) (not b!673515) (not b!673526) (not b!673527) (not b!673513) (not b!673523) (not b!673518) (not b!673514) (not start!60202) (not b!673535) (not b!673517) (not b!673533) (not b!673531) (not b!673510) (not b!673519) (not b!673534) (not b!673520))
(check-sat)
