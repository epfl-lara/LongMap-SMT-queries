; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119132 () Bool)

(assert start!119132)

(declare-fun b!1389905 () Bool)

(declare-fun res!929471 () Bool)

(declare-fun e!787437 () Bool)

(assert (=> b!1389905 (=> (not res!929471) (not e!787437))))

(declare-datatypes ((array!95084 0))(
  ( (array!95085 (arr!45910 (Array (_ BitVec 32) (_ BitVec 64))) (size!46461 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95084)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95084 (_ BitVec 32)) Bool)

(assert (=> b!1389905 (= res!929471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389906 () Bool)

(declare-fun res!929476 () Bool)

(assert (=> b!1389906 (=> (not res!929476) (not e!787437))))

(declare-datatypes ((List!32416 0))(
  ( (Nil!32413) (Cons!32412 (h!33635 (_ BitVec 64)) (t!47102 List!32416)) )
))
(declare-fun noDuplicate!2620 (List!32416) Bool)

(assert (=> b!1389906 (= res!929476 (noDuplicate!2620 Nil!32413))))

(declare-fun res!929474 () Bool)

(assert (=> start!119132 (=> (not res!929474) (not e!787437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119132 (= res!929474 (validMask!0 mask!2840))))

(assert (=> start!119132 e!787437))

(assert (=> start!119132 true))

(declare-fun array_inv!35191 (array!95084) Bool)

(assert (=> start!119132 (array_inv!35191 a!2901)))

(declare-fun b!1389907 () Bool)

(declare-fun res!929475 () Bool)

(assert (=> b!1389907 (=> (not res!929475) (not e!787437))))

(assert (=> b!1389907 (= res!929475 (and (bvsle #b00000000000000000000000000000000 (size!46461 a!2901)) (bvslt (size!46461 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1389908 () Bool)

(declare-fun res!929469 () Bool)

(assert (=> b!1389908 (=> (not res!929469) (not e!787437))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389908 (= res!929469 (validKeyInArray!0 (select (arr!45910 a!2901) j!112)))))

(declare-fun b!1389909 () Bool)

(declare-fun e!787439 () Bool)

(assert (=> b!1389909 (= e!787437 e!787439)))

(declare-fun res!929473 () Bool)

(assert (=> b!1389909 (=> res!929473 e!787439)))

(declare-fun contains!9795 (List!32416 (_ BitVec 64)) Bool)

(assert (=> b!1389909 (= res!929473 (contains!9795 Nil!32413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1389910 () Bool)

(declare-fun res!929470 () Bool)

(assert (=> b!1389910 (=> (not res!929470) (not e!787437))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389910 (= res!929470 (and (= (size!46461 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46461 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46461 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389911 () Bool)

(assert (=> b!1389911 (= e!787439 (contains!9795 Nil!32413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1389912 () Bool)

(declare-fun res!929472 () Bool)

(assert (=> b!1389912 (=> (not res!929472) (not e!787437))))

(assert (=> b!1389912 (= res!929472 (validKeyInArray!0 (select (arr!45910 a!2901) i!1037)))))

(assert (= (and start!119132 res!929474) b!1389910))

(assert (= (and b!1389910 res!929470) b!1389912))

(assert (= (and b!1389912 res!929472) b!1389908))

(assert (= (and b!1389908 res!929469) b!1389905))

(assert (= (and b!1389905 res!929471) b!1389907))

(assert (= (and b!1389907 res!929475) b!1389906))

(assert (= (and b!1389906 res!929476) b!1389909))

(assert (= (and b!1389909 (not res!929473)) b!1389911))

(declare-fun m!1275865 () Bool)

(assert (=> b!1389908 m!1275865))

(assert (=> b!1389908 m!1275865))

(declare-fun m!1275867 () Bool)

(assert (=> b!1389908 m!1275867))

(declare-fun m!1275869 () Bool)

(assert (=> b!1389905 m!1275869))

(declare-fun m!1275871 () Bool)

(assert (=> b!1389909 m!1275871))

(declare-fun m!1275873 () Bool)

(assert (=> b!1389906 m!1275873))

(declare-fun m!1275875 () Bool)

(assert (=> start!119132 m!1275875))

(declare-fun m!1275877 () Bool)

(assert (=> start!119132 m!1275877))

(declare-fun m!1275879 () Bool)

(assert (=> b!1389911 m!1275879))

(declare-fun m!1275881 () Bool)

(assert (=> b!1389912 m!1275881))

(assert (=> b!1389912 m!1275881))

(declare-fun m!1275883 () Bool)

(assert (=> b!1389912 m!1275883))

(check-sat (not b!1389908) (not b!1389911) (not b!1389912) (not b!1389909) (not b!1389905) (not b!1389906) (not start!119132))
(check-sat)
(get-model)

(declare-fun b!1389977 () Bool)

(declare-fun e!787473 () Bool)

(declare-fun call!66714 () Bool)

(assert (=> b!1389977 (= e!787473 call!66714)))

(declare-fun bm!66711 () Bool)

(assert (=> bm!66711 (= call!66714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1389979 () Bool)

(declare-fun e!787474 () Bool)

(assert (=> b!1389979 (= e!787473 e!787474)))

(declare-fun lt!610819 () (_ BitVec 64))

(assert (=> b!1389979 (= lt!610819 (select (arr!45910 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46357 0))(
  ( (Unit!46358) )
))
(declare-fun lt!610821 () Unit!46357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95084 (_ BitVec 64) (_ BitVec 32)) Unit!46357)

(assert (=> b!1389979 (= lt!610821 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610819 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389979 (arrayContainsKey!0 a!2901 lt!610819 #b00000000000000000000000000000000)))

(declare-fun lt!610820 () Unit!46357)

(assert (=> b!1389979 (= lt!610820 lt!610821)))

(declare-fun res!929537 () Bool)

(declare-datatypes ((SeekEntryResult!10149 0))(
  ( (MissingZero!10149 (index!42967 (_ BitVec 32))) (Found!10149 (index!42968 (_ BitVec 32))) (Intermediate!10149 (undefined!10961 Bool) (index!42969 (_ BitVec 32)) (x!124763 (_ BitVec 32))) (Undefined!10149) (MissingVacant!10149 (index!42970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95084 (_ BitVec 32)) SeekEntryResult!10149)

(assert (=> b!1389979 (= res!929537 (= (seekEntryOrOpen!0 (select (arr!45910 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10149 #b00000000000000000000000000000000)))))

(assert (=> b!1389979 (=> (not res!929537) (not e!787474))))

(declare-fun b!1389980 () Bool)

(declare-fun e!787472 () Bool)

(assert (=> b!1389980 (= e!787472 e!787473)))

(declare-fun c!129670 () Bool)

(assert (=> b!1389980 (= c!129670 (validKeyInArray!0 (select (arr!45910 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150363 () Bool)

(declare-fun res!929538 () Bool)

(assert (=> d!150363 (=> res!929538 e!787472)))

(assert (=> d!150363 (= res!929538 (bvsge #b00000000000000000000000000000000 (size!46461 a!2901)))))

(assert (=> d!150363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787472)))

(declare-fun b!1389978 () Bool)

(assert (=> b!1389978 (= e!787474 call!66714)))

(assert (= (and d!150363 (not res!929538)) b!1389980))

(assert (= (and b!1389980 c!129670) b!1389979))

(assert (= (and b!1389980 (not c!129670)) b!1389977))

(assert (= (and b!1389979 res!929537) b!1389978))

(assert (= (or b!1389978 b!1389977) bm!66711))

(declare-fun m!1275935 () Bool)

(assert (=> bm!66711 m!1275935))

(declare-fun m!1275937 () Bool)

(assert (=> b!1389979 m!1275937))

(declare-fun m!1275939 () Bool)

(assert (=> b!1389979 m!1275939))

(declare-fun m!1275941 () Bool)

(assert (=> b!1389979 m!1275941))

(assert (=> b!1389979 m!1275937))

(declare-fun m!1275943 () Bool)

(assert (=> b!1389979 m!1275943))

(assert (=> b!1389980 m!1275937))

(assert (=> b!1389980 m!1275937))

(declare-fun m!1275945 () Bool)

(assert (=> b!1389980 m!1275945))

(assert (=> b!1389905 d!150363))

(declare-fun d!150377 () Bool)

(declare-fun lt!610830 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!760 (List!32416) (InoxSet (_ BitVec 64)))

(assert (=> d!150377 (= lt!610830 (select (content!760 Nil!32413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787485 () Bool)

(assert (=> d!150377 (= lt!610830 e!787485)))

(declare-fun res!929547 () Bool)

(assert (=> d!150377 (=> (not res!929547) (not e!787485))))

(get-info :version)

(assert (=> d!150377 (= res!929547 ((_ is Cons!32412) Nil!32413))))

(assert (=> d!150377 (= (contains!9795 Nil!32413 #b1000000000000000000000000000000000000000000000000000000000000000) lt!610830)))

(declare-fun b!1389993 () Bool)

(declare-fun e!787486 () Bool)

(assert (=> b!1389993 (= e!787485 e!787486)))

(declare-fun res!929548 () Bool)

(assert (=> b!1389993 (=> res!929548 e!787486)))

(assert (=> b!1389993 (= res!929548 (= (h!33635 Nil!32413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1389994 () Bool)

(assert (=> b!1389994 (= e!787486 (contains!9795 (t!47102 Nil!32413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150377 res!929547) b!1389993))

(assert (= (and b!1389993 (not res!929548)) b!1389994))

(declare-fun m!1275947 () Bool)

(assert (=> d!150377 m!1275947))

(declare-fun m!1275949 () Bool)

(assert (=> d!150377 m!1275949))

(declare-fun m!1275951 () Bool)

(assert (=> b!1389994 m!1275951))

(assert (=> b!1389911 d!150377))

(declare-fun d!150379 () Bool)

(declare-fun res!929559 () Bool)

(declare-fun e!787498 () Bool)

(assert (=> d!150379 (=> res!929559 e!787498)))

(assert (=> d!150379 (= res!929559 ((_ is Nil!32413) Nil!32413))))

(assert (=> d!150379 (= (noDuplicate!2620 Nil!32413) e!787498)))

(declare-fun b!1390007 () Bool)

(declare-fun e!787499 () Bool)

(assert (=> b!1390007 (= e!787498 e!787499)))

(declare-fun res!929560 () Bool)

(assert (=> b!1390007 (=> (not res!929560) (not e!787499))))

(assert (=> b!1390007 (= res!929560 (not (contains!9795 (t!47102 Nil!32413) (h!33635 Nil!32413))))))

(declare-fun b!1390008 () Bool)

(assert (=> b!1390008 (= e!787499 (noDuplicate!2620 (t!47102 Nil!32413)))))

(assert (= (and d!150379 (not res!929559)) b!1390007))

(assert (= (and b!1390007 res!929560) b!1390008))

(declare-fun m!1275965 () Bool)

(assert (=> b!1390007 m!1275965))

(declare-fun m!1275967 () Bool)

(assert (=> b!1390008 m!1275967))

(assert (=> b!1389906 d!150379))

(declare-fun d!150383 () Bool)

(assert (=> d!150383 (= (validKeyInArray!0 (select (arr!45910 a!2901) i!1037)) (and (not (= (select (arr!45910 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45910 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389912 d!150383))

(declare-fun d!150387 () Bool)

(assert (=> d!150387 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119132 d!150387))

(declare-fun d!150399 () Bool)

(assert (=> d!150399 (= (array_inv!35191 a!2901) (bvsge (size!46461 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119132 d!150399))

(declare-fun d!150401 () Bool)

(assert (=> d!150401 (= (validKeyInArray!0 (select (arr!45910 a!2901) j!112)) (and (not (= (select (arr!45910 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45910 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389908 d!150401))

(declare-fun d!150403 () Bool)

(declare-fun lt!610846 () Bool)

(assert (=> d!150403 (= lt!610846 (select (content!760 Nil!32413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787517 () Bool)

(assert (=> d!150403 (= lt!610846 e!787517)))

(declare-fun res!929575 () Bool)

(assert (=> d!150403 (=> (not res!929575) (not e!787517))))

(assert (=> d!150403 (= res!929575 ((_ is Cons!32412) Nil!32413))))

(assert (=> d!150403 (= (contains!9795 Nil!32413 #b0000000000000000000000000000000000000000000000000000000000000000) lt!610846)))

(declare-fun b!1390029 () Bool)

(declare-fun e!787518 () Bool)

(assert (=> b!1390029 (= e!787517 e!787518)))

(declare-fun res!929576 () Bool)

(assert (=> b!1390029 (=> res!929576 e!787518)))

(assert (=> b!1390029 (= res!929576 (= (h!33635 Nil!32413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1390030 () Bool)

(assert (=> b!1390030 (= e!787518 (contains!9795 (t!47102 Nil!32413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150403 res!929575) b!1390029))

(assert (= (and b!1390029 (not res!929576)) b!1390030))

(assert (=> d!150403 m!1275947))

(declare-fun m!1275981 () Bool)

(assert (=> d!150403 m!1275981))

(declare-fun m!1275985 () Bool)

(assert (=> b!1390030 m!1275985))

(assert (=> b!1389909 d!150403))

(check-sat (not d!150403) (not d!150377) (not b!1390007) (not b!1390008) (not b!1390030) (not bm!66711) (not b!1389980) (not b!1389994) (not b!1389979))
(check-sat)
