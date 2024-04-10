; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118908 () Bool)

(assert start!118908)

(declare-fun b!1388654 () Bool)

(declare-fun res!928923 () Bool)

(declare-fun e!786635 () Bool)

(assert (=> b!1388654 (=> (not res!928923) (not e!786635))))

(declare-datatypes ((array!94965 0))(
  ( (array!94966 (arr!45854 (Array (_ BitVec 32) (_ BitVec 64))) (size!46404 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94965)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388654 (= res!928923 (validKeyInArray!0 (select (arr!45854 a!2901) i!1037)))))

(declare-fun b!1388655 () Bool)

(declare-datatypes ((List!32373 0))(
  ( (Nil!32370) (Cons!32369 (h!33584 (_ BitVec 64)) (t!47067 List!32373)) )
))
(declare-fun noDuplicate!2600 (List!32373) Bool)

(assert (=> b!1388655 (= e!786635 (not (noDuplicate!2600 Nil!32370)))))

(declare-fun b!1388656 () Bool)

(declare-fun res!928921 () Bool)

(assert (=> b!1388656 (=> (not res!928921) (not e!786635))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94965 (_ BitVec 32)) Bool)

(assert (=> b!1388656 (= res!928921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388657 () Bool)

(declare-fun res!928919 () Bool)

(assert (=> b!1388657 (=> (not res!928919) (not e!786635))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388657 (= res!928919 (and (= (size!46404 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46404 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46404 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388658 () Bool)

(declare-fun res!928924 () Bool)

(assert (=> b!1388658 (=> (not res!928924) (not e!786635))))

(assert (=> b!1388658 (= res!928924 (validKeyInArray!0 (select (arr!45854 a!2901) j!112)))))

(declare-fun b!1388653 () Bool)

(declare-fun res!928922 () Bool)

(assert (=> b!1388653 (=> (not res!928922) (not e!786635))))

(assert (=> b!1388653 (= res!928922 (and (bvsle #b00000000000000000000000000000000 (size!46404 a!2901)) (bvslt (size!46404 a!2901) #b01111111111111111111111111111111)))))

(declare-fun res!928920 () Bool)

(assert (=> start!118908 (=> (not res!928920) (not e!786635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118908 (= res!928920 (validMask!0 mask!2840))))

(assert (=> start!118908 e!786635))

(assert (=> start!118908 true))

(declare-fun array_inv!34882 (array!94965) Bool)

(assert (=> start!118908 (array_inv!34882 a!2901)))

(assert (= (and start!118908 res!928920) b!1388657))

(assert (= (and b!1388657 res!928919) b!1388654))

(assert (= (and b!1388654 res!928923) b!1388658))

(assert (= (and b!1388658 res!928924) b!1388656))

(assert (= (and b!1388656 res!928921) b!1388653))

(assert (= (and b!1388653 res!928922) b!1388655))

(declare-fun m!1274397 () Bool)

(assert (=> b!1388655 m!1274397))

(declare-fun m!1274399 () Bool)

(assert (=> b!1388656 m!1274399))

(declare-fun m!1274401 () Bool)

(assert (=> b!1388654 m!1274401))

(assert (=> b!1388654 m!1274401))

(declare-fun m!1274403 () Bool)

(assert (=> b!1388654 m!1274403))

(declare-fun m!1274405 () Bool)

(assert (=> start!118908 m!1274405))

(declare-fun m!1274407 () Bool)

(assert (=> start!118908 m!1274407))

(declare-fun m!1274409 () Bool)

(assert (=> b!1388658 m!1274409))

(assert (=> b!1388658 m!1274409))

(declare-fun m!1274411 () Bool)

(assert (=> b!1388658 m!1274411))

(push 1)

(assert (not start!118908))

(assert (not b!1388655))

(assert (not b!1388656))

(assert (not b!1388654))

(assert (not b!1388658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149987 () Bool)

(assert (=> d!149987 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118908 d!149987))

(declare-fun d!149997 () Bool)

(assert (=> d!149997 (= (array_inv!34882 a!2901) (bvsge (size!46404 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118908 d!149997))

(declare-fun d!149999 () Bool)

(assert (=> d!149999 (= (validKeyInArray!0 (select (arr!45854 a!2901) i!1037)) (and (not (= (select (arr!45854 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45854 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388654 d!149999))

(declare-fun d!150003 () Bool)

(declare-fun res!928981 () Bool)

(declare-fun e!786673 () Bool)

(assert (=> d!150003 (=> res!928981 e!786673)))

(assert (=> d!150003 (= res!928981 (is-Nil!32370 Nil!32370))))

(assert (=> d!150003 (= (noDuplicate!2600 Nil!32370) e!786673)))

(declare-fun b!1388725 () Bool)

(declare-fun e!786674 () Bool)

(assert (=> b!1388725 (= e!786673 e!786674)))

(declare-fun res!928982 () Bool)

(assert (=> b!1388725 (=> (not res!928982) (not e!786674))))

(declare-fun contains!9752 (List!32373 (_ BitVec 64)) Bool)

(assert (=> b!1388725 (= res!928982 (not (contains!9752 (t!47067 Nil!32370) (h!33584 Nil!32370))))))

(declare-fun b!1388726 () Bool)

(assert (=> b!1388726 (= e!786674 (noDuplicate!2600 (t!47067 Nil!32370)))))

(assert (= (and d!150003 (not res!928981)) b!1388725))

(assert (= (and b!1388725 res!928982) b!1388726))

(declare-fun m!1274461 () Bool)

(assert (=> b!1388725 m!1274461))

(declare-fun m!1274463 () Bool)

(assert (=> b!1388726 m!1274463))

(assert (=> b!1388655 d!150003))

(declare-fun d!150005 () Bool)

(declare-fun res!928989 () Bool)

(declare-fun e!786684 () Bool)

(assert (=> d!150005 (=> res!928989 e!786684)))

(assert (=> d!150005 (= res!928989 (bvsge #b00000000000000000000000000000000 (size!46404 a!2901)))))

(assert (=> d!150005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786684)))

(declare-fun b!1388739 () Bool)

(declare-fun e!786685 () Bool)

(declare-fun call!66652 () Bool)

(assert (=> b!1388739 (= e!786685 call!66652)))

(declare-fun b!1388740 () Bool)

(declare-fun e!786686 () Bool)

(assert (=> b!1388740 (= e!786685 e!786686)))

(declare-fun lt!610409 () (_ BitVec 64))

(assert (=> b!1388740 (= lt!610409 (select (arr!45854 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46416 0))(
  ( (Unit!46417) )
))
(declare-fun lt!610410 () Unit!46416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94965 (_ BitVec 64) (_ BitVec 32)) Unit!46416)

