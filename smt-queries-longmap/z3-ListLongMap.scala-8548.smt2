; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104310 () Bool)

(assert start!104310)

(declare-fun b!1245781 () Bool)

(declare-fun e!706458 () Bool)

(declare-datatypes ((List!27485 0))(
  ( (Nil!27482) (Cons!27481 (h!28690 (_ BitVec 64)) (t!40954 List!27485)) )
))
(declare-fun contains!7451 (List!27485 (_ BitVec 64)) Bool)

(assert (=> b!1245781 (= e!706458 (contains!7451 Nil!27482 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245782 () Bool)

(declare-fun res!831213 () Bool)

(declare-fun e!706457 () Bool)

(assert (=> b!1245782 (=> (not res!831213) (not e!706457))))

(declare-fun lt!562971 () List!27485)

(assert (=> b!1245782 (= res!831213 (not (contains!7451 lt!562971 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245783 () Bool)

(declare-fun e!706460 () Bool)

(assert (=> b!1245783 (= e!706460 e!706457)))

(declare-fun res!831211 () Bool)

(assert (=> b!1245783 (=> (not res!831211) (not e!706457))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245783 (= res!831211 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!80201 0))(
  ( (array!80202 (arr!38682 (Array (_ BitVec 32) (_ BitVec 64))) (size!39218 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80201)

(assert (=> b!1245783 (= lt!562971 (Cons!27481 (select (arr!38682 a!3892) from!3270) Nil!27482))))

(declare-fun b!1245784 () Bool)

(declare-fun res!831209 () Bool)

(assert (=> b!1245784 (=> (not res!831209) (not e!706460))))

(declare-fun arrayNoDuplicates!0 (array!80201 (_ BitVec 32) List!27485) Bool)

(assert (=> b!1245784 (= res!831209 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27482))))

(declare-fun b!1245785 () Bool)

(declare-fun res!831212 () Bool)

(assert (=> b!1245785 (=> (not res!831212) (not e!706460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245785 (= res!831212 (validKeyInArray!0 (select (arr!38682 a!3892) from!3270)))))

(declare-fun b!1245787 () Bool)

(declare-fun res!831206 () Bool)

(assert (=> b!1245787 (=> (not res!831206) (not e!706457))))

(assert (=> b!1245787 (= res!831206 (not (contains!7451 lt!562971 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245788 () Bool)

(declare-fun res!831207 () Bool)

(assert (=> b!1245788 (=> (not res!831207) (not e!706460))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245788 (= res!831207 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39218 a!3892)) (not (= newFrom!287 (size!39218 a!3892)))))))

(declare-fun b!1245789 () Bool)

(declare-fun res!831210 () Bool)

(assert (=> b!1245789 (=> (not res!831210) (not e!706457))))

(declare-fun noDuplicate!2030 (List!27485) Bool)

(assert (=> b!1245789 (= res!831210 (noDuplicate!2030 lt!562971))))

(declare-fun res!831214 () Bool)

(assert (=> start!104310 (=> (not res!831214) (not e!706460))))

(assert (=> start!104310 (= res!831214 (and (bvslt (size!39218 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39218 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39218 a!3892))))))

(assert (=> start!104310 e!706460))

(declare-fun array_inv!29530 (array!80201) Bool)

(assert (=> start!104310 (array_inv!29530 a!3892)))

(assert (=> start!104310 true))

(declare-fun b!1245786 () Bool)

(assert (=> b!1245786 (= e!706457 e!706458)))

(declare-fun res!831208 () Bool)

(assert (=> b!1245786 (=> res!831208 e!706458)))

(assert (=> b!1245786 (= res!831208 (contains!7451 Nil!27482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104310 res!831214) b!1245784))

(assert (= (and b!1245784 res!831209) b!1245788))

(assert (= (and b!1245788 res!831207) b!1245785))

(assert (= (and b!1245785 res!831212) b!1245783))

(assert (= (and b!1245783 res!831211) b!1245789))

(assert (= (and b!1245789 res!831210) b!1245782))

(assert (= (and b!1245782 res!831213) b!1245787))

(assert (= (and b!1245787 res!831206) b!1245786))

(assert (= (and b!1245786 (not res!831208)) b!1245781))

(declare-fun m!1147769 () Bool)

(assert (=> b!1245783 m!1147769))

(declare-fun m!1147771 () Bool)

(assert (=> b!1245782 m!1147771))

(declare-fun m!1147773 () Bool)

(assert (=> start!104310 m!1147773))

(declare-fun m!1147775 () Bool)

(assert (=> b!1245787 m!1147775))

(declare-fun m!1147777 () Bool)

(assert (=> b!1245786 m!1147777))

(declare-fun m!1147779 () Bool)

(assert (=> b!1245781 m!1147779))

(assert (=> b!1245785 m!1147769))

(assert (=> b!1245785 m!1147769))

(declare-fun m!1147781 () Bool)

(assert (=> b!1245785 m!1147781))

(declare-fun m!1147783 () Bool)

(assert (=> b!1245784 m!1147783))

(declare-fun m!1147785 () Bool)

(assert (=> b!1245789 m!1147785))

(check-sat (not b!1245781) (not b!1245782) (not b!1245787) (not b!1245789) (not start!104310) (not b!1245784) (not b!1245786) (not b!1245785))
(check-sat)
(get-model)

(declare-fun d!137473 () Bool)

(assert (=> d!137473 (= (validKeyInArray!0 (select (arr!38682 a!3892) from!3270)) (and (not (= (select (arr!38682 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38682 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245785 d!137473))

(declare-fun d!137477 () Bool)

(declare-fun lt!562983 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!626 (List!27485) (InoxSet (_ BitVec 64)))

(assert (=> d!137477 (= lt!562983 (select (content!626 Nil!27482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706510 () Bool)

(assert (=> d!137477 (= lt!562983 e!706510)))

(declare-fun res!831273 () Bool)

(assert (=> d!137477 (=> (not res!831273) (not e!706510))))

(get-info :version)

(assert (=> d!137477 (= res!831273 ((_ is Cons!27481) Nil!27482))))

(assert (=> d!137477 (= (contains!7451 Nil!27482 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562983)))

(declare-fun b!1245858 () Bool)

(declare-fun e!706509 () Bool)

(assert (=> b!1245858 (= e!706510 e!706509)))

(declare-fun res!831274 () Bool)

(assert (=> b!1245858 (=> res!831274 e!706509)))

(assert (=> b!1245858 (= res!831274 (= (h!28690 Nil!27482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245859 () Bool)

(assert (=> b!1245859 (= e!706509 (contains!7451 (t!40954 Nil!27482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137477 res!831273) b!1245858))

(assert (= (and b!1245858 (not res!831274)) b!1245859))

(declare-fun m!1147827 () Bool)

(assert (=> d!137477 m!1147827))

(declare-fun m!1147829 () Bool)

(assert (=> d!137477 m!1147829))

(declare-fun m!1147831 () Bool)

(assert (=> b!1245859 m!1147831))

(assert (=> b!1245786 d!137477))

(declare-fun d!137489 () Bool)

(declare-fun res!831304 () Bool)

(declare-fun e!706541 () Bool)

(assert (=> d!137489 (=> res!831304 e!706541)))

(assert (=> d!137489 (= res!831304 ((_ is Nil!27482) lt!562971))))

(assert (=> d!137489 (= (noDuplicate!2030 lt!562971) e!706541)))

(declare-fun b!1245891 () Bool)

(declare-fun e!706542 () Bool)

(assert (=> b!1245891 (= e!706541 e!706542)))

(declare-fun res!831305 () Bool)

(assert (=> b!1245891 (=> (not res!831305) (not e!706542))))

(assert (=> b!1245891 (= res!831305 (not (contains!7451 (t!40954 lt!562971) (h!28690 lt!562971))))))

(declare-fun b!1245892 () Bool)

(assert (=> b!1245892 (= e!706542 (noDuplicate!2030 (t!40954 lt!562971)))))

(assert (= (and d!137489 (not res!831304)) b!1245891))

(assert (= (and b!1245891 res!831305) b!1245892))

(declare-fun m!1147863 () Bool)

(assert (=> b!1245891 m!1147863))

(declare-fun m!1147865 () Bool)

(assert (=> b!1245892 m!1147865))

(assert (=> b!1245789 d!137489))

(declare-fun d!137509 () Bool)

(assert (=> d!137509 (= (array_inv!29530 a!3892) (bvsge (size!39218 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104310 d!137509))

(declare-fun call!61506 () Bool)

(declare-fun bm!61503 () Bool)

(declare-fun c!121980 () Bool)

(assert (=> bm!61503 (= call!61506 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121980 (Cons!27481 (select (arr!38682 a!3892) from!3270) Nil!27482) Nil!27482)))))

(declare-fun b!1245905 () Bool)

(declare-fun e!706556 () Bool)

(declare-fun e!706554 () Bool)

(assert (=> b!1245905 (= e!706556 e!706554)))

(assert (=> b!1245905 (= c!121980 (validKeyInArray!0 (select (arr!38682 a!3892) from!3270)))))

(declare-fun b!1245906 () Bool)

(declare-fun e!706553 () Bool)

(assert (=> b!1245906 (= e!706553 (contains!7451 Nil!27482 (select (arr!38682 a!3892) from!3270)))))

(declare-fun b!1245907 () Bool)

(assert (=> b!1245907 (= e!706554 call!61506)))

(declare-fun b!1245908 () Bool)

(declare-fun e!706555 () Bool)

(assert (=> b!1245908 (= e!706555 e!706556)))

(declare-fun res!831316 () Bool)

(assert (=> b!1245908 (=> (not res!831316) (not e!706556))))

(assert (=> b!1245908 (= res!831316 (not e!706553))))

(declare-fun res!831314 () Bool)

(assert (=> b!1245908 (=> (not res!831314) (not e!706553))))

(assert (=> b!1245908 (= res!831314 (validKeyInArray!0 (select (arr!38682 a!3892) from!3270)))))

(declare-fun d!137511 () Bool)

(declare-fun res!831315 () Bool)

(assert (=> d!137511 (=> res!831315 e!706555)))

(assert (=> d!137511 (= res!831315 (bvsge from!3270 (size!39218 a!3892)))))

(assert (=> d!137511 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27482) e!706555)))

(declare-fun b!1245909 () Bool)

(assert (=> b!1245909 (= e!706554 call!61506)))

(assert (= (and d!137511 (not res!831315)) b!1245908))

(assert (= (and b!1245908 res!831314) b!1245906))

(assert (= (and b!1245908 res!831316) b!1245905))

(assert (= (and b!1245905 c!121980) b!1245907))

(assert (= (and b!1245905 (not c!121980)) b!1245909))

(assert (= (or b!1245907 b!1245909) bm!61503))

(assert (=> bm!61503 m!1147769))

(declare-fun m!1147871 () Bool)

(assert (=> bm!61503 m!1147871))

(assert (=> b!1245905 m!1147769))

(assert (=> b!1245905 m!1147769))

(assert (=> b!1245905 m!1147781))

(assert (=> b!1245906 m!1147769))

(assert (=> b!1245906 m!1147769))

(declare-fun m!1147873 () Bool)

