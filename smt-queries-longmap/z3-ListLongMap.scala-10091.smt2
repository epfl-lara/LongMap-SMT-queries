; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118910 () Bool)

(assert start!118910)

(declare-fun b!1388671 () Bool)

(declare-fun res!928940 () Bool)

(declare-fun e!786641 () Bool)

(assert (=> b!1388671 (=> (not res!928940) (not e!786641))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!94967 0))(
  ( (array!94968 (arr!45855 (Array (_ BitVec 32) (_ BitVec 64))) (size!46405 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94967)

(assert (=> b!1388671 (= res!928940 (and (= (size!46405 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46405 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46405 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388672 () Bool)

(declare-fun res!928937 () Bool)

(assert (=> b!1388672 (=> (not res!928937) (not e!786641))))

(assert (=> b!1388672 (= res!928937 (and (bvsle #b00000000000000000000000000000000 (size!46405 a!2901)) (bvslt (size!46405 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388673 () Bool)

(declare-fun res!928938 () Bool)

(assert (=> b!1388673 (=> (not res!928938) (not e!786641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388673 (= res!928938 (validKeyInArray!0 (select (arr!45855 a!2901) i!1037)))))

(declare-fun b!1388674 () Bool)

(declare-fun res!928941 () Bool)

(assert (=> b!1388674 (=> (not res!928941) (not e!786641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94967 (_ BitVec 32)) Bool)

(assert (=> b!1388674 (= res!928941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!928939 () Bool)

(assert (=> start!118910 (=> (not res!928939) (not e!786641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118910 (= res!928939 (validMask!0 mask!2840))))

(assert (=> start!118910 e!786641))

(assert (=> start!118910 true))

(declare-fun array_inv!34883 (array!94967) Bool)

(assert (=> start!118910 (array_inv!34883 a!2901)))

(declare-fun b!1388675 () Bool)

(declare-datatypes ((List!32374 0))(
  ( (Nil!32371) (Cons!32370 (h!33585 (_ BitVec 64)) (t!47068 List!32374)) )
))
(declare-fun noDuplicate!2601 (List!32374) Bool)

(assert (=> b!1388675 (= e!786641 (not (noDuplicate!2601 Nil!32371)))))

(declare-fun b!1388676 () Bool)

(declare-fun res!928942 () Bool)

(assert (=> b!1388676 (=> (not res!928942) (not e!786641))))

(assert (=> b!1388676 (= res!928942 (validKeyInArray!0 (select (arr!45855 a!2901) j!112)))))

(assert (= (and start!118910 res!928939) b!1388671))

(assert (= (and b!1388671 res!928940) b!1388673))

(assert (= (and b!1388673 res!928938) b!1388676))

(assert (= (and b!1388676 res!928942) b!1388674))

(assert (= (and b!1388674 res!928941) b!1388672))

(assert (= (and b!1388672 res!928937) b!1388675))

(declare-fun m!1274413 () Bool)

(assert (=> b!1388674 m!1274413))

(declare-fun m!1274415 () Bool)

(assert (=> start!118910 m!1274415))

(declare-fun m!1274417 () Bool)

(assert (=> start!118910 m!1274417))

(declare-fun m!1274419 () Bool)

(assert (=> b!1388673 m!1274419))

(assert (=> b!1388673 m!1274419))

(declare-fun m!1274421 () Bool)

(assert (=> b!1388673 m!1274421))

(declare-fun m!1274423 () Bool)

(assert (=> b!1388675 m!1274423))

(declare-fun m!1274425 () Bool)

(assert (=> b!1388676 m!1274425))

(assert (=> b!1388676 m!1274425))

(declare-fun m!1274427 () Bool)

(assert (=> b!1388676 m!1274427))

(check-sat (not b!1388674) (not b!1388673) (not b!1388675) (not b!1388676) (not start!118910))
(check-sat)
(get-model)

(declare-fun d!149981 () Bool)

(declare-fun res!928965 () Bool)

(declare-fun e!786652 () Bool)

(assert (=> d!149981 (=> res!928965 e!786652)))

(get-info :version)

(assert (=> d!149981 (= res!928965 ((_ is Nil!32371) Nil!32371))))

(assert (=> d!149981 (= (noDuplicate!2601 Nil!32371) e!786652)))

(declare-fun b!1388699 () Bool)

(declare-fun e!786653 () Bool)

(assert (=> b!1388699 (= e!786652 e!786653)))

(declare-fun res!928966 () Bool)

(assert (=> b!1388699 (=> (not res!928966) (not e!786653))))

(declare-fun contains!9751 (List!32374 (_ BitVec 64)) Bool)

(assert (=> b!1388699 (= res!928966 (not (contains!9751 (t!47068 Nil!32371) (h!33585 Nil!32371))))))

(declare-fun b!1388700 () Bool)

(assert (=> b!1388700 (= e!786653 (noDuplicate!2601 (t!47068 Nil!32371)))))

(assert (= (and d!149981 (not res!928965)) b!1388699))

(assert (= (and b!1388699 res!928966) b!1388700))

(declare-fun m!1274445 () Bool)

(assert (=> b!1388699 m!1274445))

(declare-fun m!1274447 () Bool)

(assert (=> b!1388700 m!1274447))

(assert (=> b!1388675 d!149981))

(declare-fun d!149983 () Bool)

(assert (=> d!149983 (= (validKeyInArray!0 (select (arr!45855 a!2901) j!112)) (and (not (= (select (arr!45855 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45855 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388676 d!149983))

(declare-fun d!149985 () Bool)

(assert (=> d!149985 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118910 d!149985))

(declare-fun d!149991 () Bool)

(assert (=> d!149991 (= (array_inv!34883 a!2901) (bvsge (size!46405 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118910 d!149991))

(declare-fun d!149993 () Bool)

(assert (=> d!149993 (= (validKeyInArray!0 (select (arr!45855 a!2901) i!1037)) (and (not (= (select (arr!45855 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45855 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388673 d!149993))

(declare-fun b!1388727 () Bool)

(declare-fun e!786676 () Bool)

(declare-fun e!786677 () Bool)

(assert (=> b!1388727 (= e!786676 e!786677)))

(declare-fun lt!610401 () (_ BitVec 64))

(assert (=> b!1388727 (= lt!610401 (select (arr!45855 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46412 0))(
  ( (Unit!46413) )
))
(declare-fun lt!610399 () Unit!46412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94967 (_ BitVec 64) (_ BitVec 32)) Unit!46412)

(assert (=> b!1388727 (= lt!610399 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610401 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388727 (arrayContainsKey!0 a!2901 lt!610401 #b00000000000000000000000000000000)))

(declare-fun lt!610400 () Unit!46412)

(assert (=> b!1388727 (= lt!610400 lt!610399)))

(declare-fun res!928983 () Bool)

(declare-datatypes ((SeekEntryResult!10190 0))(
  ( (MissingZero!10190 (index!43131 (_ BitVec 32))) (Found!10190 (index!43132 (_ BitVec 32))) (Intermediate!10190 (undefined!11002 Bool) (index!43133 (_ BitVec 32)) (x!124777 (_ BitVec 32))) (Undefined!10190) (MissingVacant!10190 (index!43134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94967 (_ BitVec 32)) SeekEntryResult!10190)

(assert (=> b!1388727 (= res!928983 (= (seekEntryOrOpen!0 (select (arr!45855 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10190 #b00000000000000000000000000000000)))))

(assert (=> b!1388727 (=> (not res!928983) (not e!786677))))

(declare-fun b!1388728 () Bool)

(declare-fun call!66649 () Bool)

(assert (=> b!1388728 (= e!786676 call!66649)))

(declare-fun b!1388729 () Bool)

(assert (=> b!1388729 (= e!786677 call!66649)))

(declare-fun d!149995 () Bool)

(declare-fun res!928984 () Bool)

(declare-fun e!786675 () Bool)

(assert (=> d!149995 (=> res!928984 e!786675)))

(assert (=> d!149995 (= res!928984 (bvsge #b00000000000000000000000000000000 (size!46405 a!2901)))))

(assert (=> d!149995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786675)))

(declare-fun bm!66646 () Bool)

(assert (=> bm!66646 (= call!66649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388730 () Bool)

(assert (=> b!1388730 (= e!786675 e!786676)))

(declare-fun c!129315 () Bool)

(assert (=> b!1388730 (= c!129315 (validKeyInArray!0 (select (arr!45855 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!149995 (not res!928984)) b!1388730))

(assert (= (and b!1388730 c!129315) b!1388727))

(assert (= (and b!1388730 (not c!129315)) b!1388728))

(assert (= (and b!1388727 res!928983) b!1388729))

(assert (= (or b!1388729 b!1388728) bm!66646))

(declare-fun m!1274465 () Bool)

(assert (=> b!1388727 m!1274465))

(declare-fun m!1274467 () Bool)

(assert (=> b!1388727 m!1274467))

(declare-fun m!1274469 () Bool)

(assert (=> b!1388727 m!1274469))

(assert (=> b!1388727 m!1274465))

(declare-fun m!1274471 () Bool)

(assert (=> b!1388727 m!1274471))

(declare-fun m!1274473 () Bool)

(assert (=> bm!66646 m!1274473))

(assert (=> b!1388730 m!1274465))

(assert (=> b!1388730 m!1274465))

(declare-fun m!1274475 () Bool)

(assert (=> b!1388730 m!1274475))

(assert (=> b!1388674 d!149995))

(check-sat (not b!1388727) (not b!1388700) (not bm!66646) (not b!1388699) (not b!1388730))
(check-sat)
