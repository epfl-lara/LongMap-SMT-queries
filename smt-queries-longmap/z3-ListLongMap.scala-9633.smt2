; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113936 () Bool)

(assert start!113936)

(declare-fun b!1351396 () Bool)

(declare-fun res!896908 () Bool)

(declare-fun e!768483 () Bool)

(assert (=> b!1351396 (=> (not res!896908) (not e!768483))))

(declare-datatypes ((List!31601 0))(
  ( (Nil!31598) (Cons!31597 (h!32806 (_ BitVec 64)) (t!46251 List!31601)) )
))
(declare-fun acc!759 () List!31601)

(declare-fun contains!9221 (List!31601 (_ BitVec 64)) Bool)

(assert (=> b!1351396 (= res!896908 (not (contains!9221 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351397 () Bool)

(declare-fun res!896903 () Bool)

(assert (=> b!1351397 (=> (not res!896903) (not e!768483))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92067 0))(
  ( (array!92068 (arr!44482 (Array (_ BitVec 32) (_ BitVec 64))) (size!45034 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92067)

(assert (=> b!1351397 (= res!896903 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45034 a!3742))))))

(declare-fun b!1351398 () Bool)

(declare-fun res!896896 () Bool)

(assert (=> b!1351398 (=> (not res!896896) (not e!768483))))

(declare-fun noDuplicate!2136 (List!31601) Bool)

(assert (=> b!1351398 (= res!896896 (noDuplicate!2136 acc!759))))

(declare-fun b!1351400 () Bool)

(declare-fun res!896905 () Bool)

(declare-fun e!768482 () Bool)

(assert (=> b!1351400 (=> res!896905 e!768482)))

(declare-fun lt!597049 () List!31601)

(assert (=> b!1351400 (= res!896905 (contains!9221 lt!597049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351401 () Bool)

(declare-fun res!896906 () Bool)

(assert (=> b!1351401 (=> (not res!896906) (not e!768483))))

(declare-fun arrayNoDuplicates!0 (array!92067 (_ BitVec 32) List!31601) Bool)

(assert (=> b!1351401 (= res!896906 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31598))))

(declare-fun b!1351402 () Bool)

(assert (=> b!1351402 (= e!768483 (not e!768482))))

(declare-fun res!896901 () Bool)

(assert (=> b!1351402 (=> res!896901 e!768482)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351402 (= res!896901 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!694 (List!31601 (_ BitVec 64)) List!31601)

(assert (=> b!1351402 (= lt!597049 ($colon$colon!694 acc!759 (select (arr!44482 a!3742) from!3120)))))

(declare-fun subseq!677 (List!31601 List!31601) Bool)

(assert (=> b!1351402 (subseq!677 acc!759 acc!759)))

(declare-datatypes ((Unit!44109 0))(
  ( (Unit!44110) )
))
(declare-fun lt!597052 () Unit!44109)

(declare-fun lemmaListSubSeqRefl!0 (List!31601) Unit!44109)

(assert (=> b!1351402 (= lt!597052 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351403 () Bool)

(declare-fun res!896895 () Bool)

(assert (=> b!1351403 (=> (not res!896895) (not e!768483))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351403 (= res!896895 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351404 () Bool)

(assert (=> b!1351404 (= e!768482 true)))

(declare-fun lt!597051 () Bool)

(assert (=> b!1351404 (= lt!597051 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597049))))

(declare-fun lt!597050 () Unit!44109)

(declare-fun noDuplicateSubseq!128 (List!31601 List!31601) Unit!44109)

(assert (=> b!1351404 (= lt!597050 (noDuplicateSubseq!128 acc!759 lt!597049))))

(declare-fun b!1351405 () Bool)

(declare-fun res!896909 () Bool)

(assert (=> b!1351405 (=> res!896909 e!768482)))

(assert (=> b!1351405 (= res!896909 (contains!9221 lt!597049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351406 () Bool)

(declare-fun res!896907 () Bool)

(assert (=> b!1351406 (=> (not res!896907) (not e!768483))))

(assert (=> b!1351406 (= res!896907 (not (contains!9221 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351407 () Bool)

(declare-fun res!896900 () Bool)

(assert (=> b!1351407 (=> res!896900 e!768482)))

(assert (=> b!1351407 (= res!896900 (not (subseq!677 acc!759 lt!597049)))))

(declare-fun b!1351408 () Bool)

(declare-fun res!896898 () Bool)

(assert (=> b!1351408 (=> (not res!896898) (not e!768483))))

(assert (=> b!1351408 (= res!896898 (validKeyInArray!0 (select (arr!44482 a!3742) from!3120)))))

(declare-fun b!1351399 () Bool)

(declare-fun res!896899 () Bool)

(assert (=> b!1351399 (=> res!896899 e!768482)))

(assert (=> b!1351399 (= res!896899 (not (noDuplicate!2136 lt!597049)))))

(declare-fun res!896904 () Bool)

(assert (=> start!113936 (=> (not res!896904) (not e!768483))))

(assert (=> start!113936 (= res!896904 (and (bvslt (size!45034 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45034 a!3742))))))

(assert (=> start!113936 e!768483))

(assert (=> start!113936 true))

(declare-fun array_inv!33715 (array!92067) Bool)

(assert (=> start!113936 (array_inv!33715 a!3742)))

(declare-fun b!1351409 () Bool)

(declare-fun res!896897 () Bool)

(assert (=> b!1351409 (=> (not res!896897) (not e!768483))))

(assert (=> b!1351409 (= res!896897 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351410 () Bool)

(declare-fun res!896902 () Bool)

(assert (=> b!1351410 (=> (not res!896902) (not e!768483))))

(assert (=> b!1351410 (= res!896902 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45034 a!3742)))))

(assert (= (and start!113936 res!896904) b!1351398))

(assert (= (and b!1351398 res!896896) b!1351396))

(assert (= (and b!1351396 res!896908) b!1351406))

(assert (= (and b!1351406 res!896907) b!1351401))

(assert (= (and b!1351401 res!896906) b!1351409))

(assert (= (and b!1351409 res!896897) b!1351397))

(assert (= (and b!1351397 res!896903) b!1351403))

(assert (= (and b!1351403 res!896895) b!1351410))

(assert (= (and b!1351410 res!896902) b!1351408))

(assert (= (and b!1351408 res!896898) b!1351402))

(assert (= (and b!1351402 (not res!896901)) b!1351399))

(assert (= (and b!1351399 (not res!896899)) b!1351400))

(assert (= (and b!1351400 (not res!896905)) b!1351405))

(assert (= (and b!1351405 (not res!896909)) b!1351407))

(assert (= (and b!1351407 (not res!896900)) b!1351404))

(declare-fun m!1237969 () Bool)

(assert (=> b!1351403 m!1237969))

(declare-fun m!1237971 () Bool)

(assert (=> b!1351398 m!1237971))

(declare-fun m!1237973 () Bool)

(assert (=> b!1351406 m!1237973))

(declare-fun m!1237975 () Bool)

(assert (=> b!1351402 m!1237975))

(assert (=> b!1351402 m!1237975))

(declare-fun m!1237977 () Bool)

(assert (=> b!1351402 m!1237977))

(declare-fun m!1237979 () Bool)

(assert (=> b!1351402 m!1237979))

(declare-fun m!1237981 () Bool)

(assert (=> b!1351402 m!1237981))

(declare-fun m!1237983 () Bool)

(assert (=> b!1351401 m!1237983))

(declare-fun m!1237985 () Bool)

(assert (=> b!1351407 m!1237985))

(declare-fun m!1237987 () Bool)

(assert (=> b!1351396 m!1237987))

(declare-fun m!1237989 () Bool)

(assert (=> b!1351399 m!1237989))

(declare-fun m!1237991 () Bool)

(assert (=> b!1351404 m!1237991))

(declare-fun m!1237993 () Bool)

(assert (=> b!1351404 m!1237993))

(declare-fun m!1237995 () Bool)

(assert (=> b!1351405 m!1237995))

(declare-fun m!1237997 () Bool)

(assert (=> b!1351400 m!1237997))

(declare-fun m!1237999 () Bool)

(assert (=> start!113936 m!1237999))

(declare-fun m!1238001 () Bool)

(assert (=> b!1351409 m!1238001))

(assert (=> b!1351408 m!1237975))

(assert (=> b!1351408 m!1237975))

(declare-fun m!1238003 () Bool)

(assert (=> b!1351408 m!1238003))

(check-sat (not b!1351403) (not start!113936) (not b!1351402) (not b!1351407) (not b!1351396) (not b!1351400) (not b!1351399) (not b!1351404) (not b!1351409) (not b!1351401) (not b!1351406) (not b!1351408) (not b!1351405) (not b!1351398))
(check-sat)
