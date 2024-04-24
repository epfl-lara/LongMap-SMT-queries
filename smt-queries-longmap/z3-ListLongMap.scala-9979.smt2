; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118068 () Bool)

(assert start!118068)

(declare-fun b!1382643 () Bool)

(declare-fun e!783854 () Bool)

(declare-datatypes ((List!32092 0))(
  ( (Nil!32089) (Cons!32088 (h!33306 (_ BitVec 64)) (t!46778 List!32092)) )
))
(declare-fun contains!9775 (List!32092 (_ BitVec 64)) Bool)

(assert (=> b!1382643 (= e!783854 (contains!9775 Nil!32089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382644 () Bool)

(declare-fun res!923482 () Bool)

(declare-fun e!783853 () Bool)

(assert (=> b!1382644 (=> (not res!923482) (not e!783853))))

(declare-datatypes ((array!94380 0))(
  ( (array!94381 (arr!45571 (Array (_ BitVec 32) (_ BitVec 64))) (size!46122 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94380)

(assert (=> b!1382644 (= res!923482 (and (bvsle #b00000000000000000000000000000000 (size!46122 a!2971)) (bvslt (size!46122 a!2971) #b01111111111111111111111111111111)))))

(declare-fun b!1382645 () Bool)

(declare-fun res!923486 () Bool)

(assert (=> b!1382645 (=> (not res!923486) (not e!783853))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382645 (= res!923486 (validKeyInArray!0 (select (arr!45571 a!2971) i!1094)))))

(declare-fun b!1382646 () Bool)

(assert (=> b!1382646 (= e!783853 e!783854)))

(declare-fun res!923485 () Bool)

(assert (=> b!1382646 (=> res!923485 e!783854)))

(assert (=> b!1382646 (= res!923485 (contains!9775 Nil!32089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382647 () Bool)

(declare-fun res!923487 () Bool)

(assert (=> b!1382647 (=> (not res!923487) (not e!783853))))

(declare-fun noDuplicate!2608 (List!32092) Bool)

(assert (=> b!1382647 (= res!923487 (noDuplicate!2608 Nil!32089))))

(declare-fun res!923483 () Bool)

(assert (=> start!118068 (=> (not res!923483) (not e!783853))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118068 (= res!923483 (validMask!0 mask!3034))))

(assert (=> start!118068 e!783853))

(assert (=> start!118068 true))

(declare-fun array_inv!34852 (array!94380) Bool)

(assert (=> start!118068 (array_inv!34852 a!2971)))

(declare-fun b!1382648 () Bool)

(declare-fun res!923484 () Bool)

(assert (=> b!1382648 (=> (not res!923484) (not e!783853))))

(assert (=> b!1382648 (= res!923484 (and (= (size!46122 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46122 a!2971))))))

(assert (= (and start!118068 res!923483) b!1382648))

(assert (= (and b!1382648 res!923484) b!1382645))

(assert (= (and b!1382645 res!923486) b!1382644))

(assert (= (and b!1382644 res!923482) b!1382647))

(assert (= (and b!1382647 res!923487) b!1382646))

(assert (= (and b!1382646 (not res!923485)) b!1382643))

(declare-fun m!1268155 () Bool)

(assert (=> b!1382646 m!1268155))

(declare-fun m!1268157 () Bool)

(assert (=> b!1382645 m!1268157))

(assert (=> b!1382645 m!1268157))

(declare-fun m!1268159 () Bool)

(assert (=> b!1382645 m!1268159))

(declare-fun m!1268161 () Bool)

(assert (=> start!118068 m!1268161))

(declare-fun m!1268163 () Bool)

(assert (=> start!118068 m!1268163))

(declare-fun m!1268165 () Bool)

(assert (=> b!1382647 m!1268165))

(declare-fun m!1268167 () Bool)

(assert (=> b!1382643 m!1268167))

(check-sat (not start!118068) (not b!1382647) (not b!1382645) (not b!1382643) (not b!1382646))
(check-sat)
(get-model)

(declare-fun d!149517 () Bool)

(assert (=> d!149517 (= (validKeyInArray!0 (select (arr!45571 a!2971) i!1094)) (and (not (= (select (arr!45571 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45571 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382645 d!149517))

(declare-fun d!149519 () Bool)

(declare-fun lt!608668 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!752 (List!32092) (InoxSet (_ BitVec 64)))

(assert (=> d!149519 (= lt!608668 (select (content!752 Nil!32089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783879 () Bool)

(assert (=> d!149519 (= lt!608668 e!783879)))

(declare-fun res!923528 () Bool)

(assert (=> d!149519 (=> (not res!923528) (not e!783879))))

(get-info :version)

(assert (=> d!149519 (= res!923528 ((_ is Cons!32088) Nil!32089))))

(assert (=> d!149519 (= (contains!9775 Nil!32089 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608668)))

(declare-fun b!1382689 () Bool)

(declare-fun e!783878 () Bool)

(assert (=> b!1382689 (= e!783879 e!783878)))

(declare-fun res!923529 () Bool)

(assert (=> b!1382689 (=> res!923529 e!783878)))

(assert (=> b!1382689 (= res!923529 (= (h!33306 Nil!32089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382690 () Bool)

(assert (=> b!1382690 (= e!783878 (contains!9775 (t!46778 Nil!32089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149519 res!923528) b!1382689))

(assert (= (and b!1382689 (not res!923529)) b!1382690))

(declare-fun m!1268197 () Bool)

(assert (=> d!149519 m!1268197))

(declare-fun m!1268199 () Bool)

(assert (=> d!149519 m!1268199))

(declare-fun m!1268201 () Bool)

(assert (=> b!1382690 m!1268201))

(assert (=> b!1382646 d!149519))

(declare-fun d!149521 () Bool)

(assert (=> d!149521 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!118068 d!149521))

(declare-fun d!149535 () Bool)

(assert (=> d!149535 (= (array_inv!34852 a!2971) (bvsge (size!46122 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!118068 d!149535))

(declare-fun d!149537 () Bool)

(declare-fun res!923558 () Bool)

(declare-fun e!783908 () Bool)

(assert (=> d!149537 (=> res!923558 e!783908)))

(assert (=> d!149537 (= res!923558 ((_ is Nil!32089) Nil!32089))))

(assert (=> d!149537 (= (noDuplicate!2608 Nil!32089) e!783908)))

(declare-fun b!1382719 () Bool)

(declare-fun e!783909 () Bool)

(assert (=> b!1382719 (= e!783908 e!783909)))

(declare-fun res!923559 () Bool)

(assert (=> b!1382719 (=> (not res!923559) (not e!783909))))

(assert (=> b!1382719 (= res!923559 (not (contains!9775 (t!46778 Nil!32089) (h!33306 Nil!32089))))))

(declare-fun b!1382720 () Bool)

(assert (=> b!1382720 (= e!783909 (noDuplicate!2608 (t!46778 Nil!32089)))))

(assert (= (and d!149537 (not res!923558)) b!1382719))

(assert (= (and b!1382719 res!923559) b!1382720))

(declare-fun m!1268223 () Bool)

(assert (=> b!1382719 m!1268223))

(declare-fun m!1268225 () Bool)

(assert (=> b!1382720 m!1268225))

(assert (=> b!1382647 d!149537))

(declare-fun d!149541 () Bool)

(declare-fun lt!608676 () Bool)

(assert (=> d!149541 (= lt!608676 (select (content!752 Nil!32089) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783911 () Bool)

(assert (=> d!149541 (= lt!608676 e!783911)))

(declare-fun res!923560 () Bool)

(assert (=> d!149541 (=> (not res!923560) (not e!783911))))

(assert (=> d!149541 (= res!923560 ((_ is Cons!32088) Nil!32089))))

(assert (=> d!149541 (= (contains!9775 Nil!32089 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608676)))

(declare-fun b!1382721 () Bool)

(declare-fun e!783910 () Bool)

(assert (=> b!1382721 (= e!783911 e!783910)))

(declare-fun res!923561 () Bool)

(assert (=> b!1382721 (=> res!923561 e!783910)))

(assert (=> b!1382721 (= res!923561 (= (h!33306 Nil!32089) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382722 () Bool)

(assert (=> b!1382722 (= e!783910 (contains!9775 (t!46778 Nil!32089) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149541 res!923560) b!1382721))

(assert (= (and b!1382721 (not res!923561)) b!1382722))

(assert (=> d!149541 m!1268197))

(declare-fun m!1268227 () Bool)

(assert (=> d!149541 m!1268227))

(declare-fun m!1268229 () Bool)

(assert (=> b!1382722 m!1268229))

(assert (=> b!1382643 d!149541))

(check-sat (not b!1382719) (not d!149541) (not b!1382690) (not d!149519) (not b!1382722) (not b!1382720))
(check-sat)
