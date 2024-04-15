; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104228 () Bool)

(assert start!104228)

(declare-fun b!1245321 () Bool)

(declare-fun res!830849 () Bool)

(declare-fun e!706137 () Bool)

(assert (=> b!1245321 (=> (not res!830849) (not e!706137))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245321 (= res!830849 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1245322 () Bool)

(declare-datatypes ((array!80102 0))(
  ( (array!80103 (arr!38636 (Array (_ BitVec 32) (_ BitVec 64))) (size!39174 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80102)

(declare-datatypes ((List!27540 0))(
  ( (Nil!27537) (Cons!27536 (h!28745 (_ BitVec 64)) (t!41000 List!27540)) )
))
(declare-fun noDuplicate!2041 (List!27540) Bool)

(assert (=> b!1245322 (= e!706137 (not (noDuplicate!2041 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(declare-fun b!1245323 () Bool)

(declare-fun res!830850 () Bool)

(assert (=> b!1245323 (=> (not res!830850) (not e!706137))))

(declare-fun arrayNoDuplicates!0 (array!80102 (_ BitVec 32) List!27540) Bool)

(assert (=> b!1245323 (= res!830850 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27537))))

(declare-fun b!1245324 () Bool)

(declare-fun res!830848 () Bool)

(assert (=> b!1245324 (=> (not res!830848) (not e!706137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245324 (= res!830848 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1245325 () Bool)

(declare-fun res!830846 () Bool)

(assert (=> b!1245325 (=> (not res!830846) (not e!706137))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245325 (= res!830846 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39174 a!3892)) (not (= newFrom!287 (size!39174 a!3892)))))))

(declare-fun res!830847 () Bool)

(assert (=> start!104228 (=> (not res!830847) (not e!706137))))

(assert (=> start!104228 (= res!830847 (and (bvslt (size!39174 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39174 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39174 a!3892))))))

(assert (=> start!104228 e!706137))

(declare-fun array_inv!29619 (array!80102) Bool)

(assert (=> start!104228 (array_inv!29619 a!3892)))

(assert (=> start!104228 true))

(assert (= (and start!104228 res!830847) b!1245323))

(assert (= (and b!1245323 res!830850) b!1245325))

(assert (= (and b!1245325 res!830846) b!1245324))

(assert (= (and b!1245324 res!830848) b!1245321))

(assert (= (and b!1245321 res!830849) b!1245322))

(declare-fun m!1146951 () Bool)

(assert (=> b!1245322 m!1146951))

(declare-fun m!1146953 () Bool)

(assert (=> b!1245322 m!1146953))

(declare-fun m!1146955 () Bool)

(assert (=> b!1245323 m!1146955))

(assert (=> b!1245324 m!1146951))

(assert (=> b!1245324 m!1146951))

(declare-fun m!1146957 () Bool)

(assert (=> b!1245324 m!1146957))

(declare-fun m!1146959 () Bool)

(assert (=> start!104228 m!1146959))

(check-sat (not b!1245324) (not b!1245323) (not b!1245322) (not start!104228))
(check-sat)
(get-model)

(declare-fun d!137225 () Bool)

(assert (=> d!137225 (= (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)) (and (not (= (select (arr!38636 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38636 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245324 d!137225))

(declare-fun b!1245372 () Bool)

(declare-fun e!706165 () Bool)

(declare-fun call!61458 () Bool)

(assert (=> b!1245372 (= e!706165 call!61458)))

(declare-fun b!1245373 () Bool)

(declare-fun e!706167 () Bool)

(assert (=> b!1245373 (= e!706167 e!706165)))

(declare-fun c!121927 () Bool)

(assert (=> b!1245373 (= c!121927 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun bm!61455 () Bool)

(assert (=> bm!61455 (= call!61458 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121927 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537) Nil!27537)))))

(declare-fun b!1245374 () Bool)

(declare-fun e!706166 () Bool)

(assert (=> b!1245374 (= e!706166 e!706167)))

(declare-fun res!830894 () Bool)

(assert (=> b!1245374 (=> (not res!830894) (not e!706167))))

(declare-fun e!706164 () Bool)

(assert (=> b!1245374 (= res!830894 (not e!706164))))

(declare-fun res!830893 () Bool)

(assert (=> b!1245374 (=> (not res!830893) (not e!706164))))

(assert (=> b!1245374 (= res!830893 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun d!137227 () Bool)

(declare-fun res!830895 () Bool)

(assert (=> d!137227 (=> res!830895 e!706166)))

(assert (=> d!137227 (= res!830895 (bvsge from!3270 (size!39174 a!3892)))))

(assert (=> d!137227 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27537) e!706166)))

(declare-fun b!1245375 () Bool)

(assert (=> b!1245375 (= e!706165 call!61458)))

(declare-fun b!1245376 () Bool)

(declare-fun contains!7416 (List!27540 (_ BitVec 64)) Bool)

(assert (=> b!1245376 (= e!706164 (contains!7416 Nil!27537 (select (arr!38636 a!3892) from!3270)))))

(assert (= (and d!137227 (not res!830895)) b!1245374))

(assert (= (and b!1245374 res!830893) b!1245376))

(assert (= (and b!1245374 res!830894) b!1245373))

(assert (= (and b!1245373 c!121927) b!1245375))

(assert (= (and b!1245373 (not c!121927)) b!1245372))

(assert (= (or b!1245375 b!1245372) bm!61455))

(assert (=> b!1245373 m!1146951))

(assert (=> b!1245373 m!1146951))

(assert (=> b!1245373 m!1146957))

(assert (=> bm!61455 m!1146951))

(declare-fun m!1146985 () Bool)

(assert (=> bm!61455 m!1146985))

(assert (=> b!1245374 m!1146951))

(assert (=> b!1245374 m!1146951))

(assert (=> b!1245374 m!1146957))

(assert (=> b!1245376 m!1146951))

(assert (=> b!1245376 m!1146951))

(declare-fun m!1146987 () Bool)

(assert (=> b!1245376 m!1146987))

(assert (=> b!1245323 d!137227))

(declare-fun d!137237 () Bool)

(declare-fun res!830900 () Bool)

(declare-fun e!706172 () Bool)

(assert (=> d!137237 (=> res!830900 e!706172)))

(get-info :version)

(assert (=> d!137237 (= res!830900 ((_ is Nil!27537) (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)))))

(assert (=> d!137237 (= (noDuplicate!2041 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)) e!706172)))

(declare-fun b!1245381 () Bool)

(declare-fun e!706173 () Bool)

(assert (=> b!1245381 (= e!706172 e!706173)))

(declare-fun res!830901 () Bool)

(assert (=> b!1245381 (=> (not res!830901) (not e!706173))))

(assert (=> b!1245381 (= res!830901 (not (contains!7416 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)) (h!28745 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)))))))

(declare-fun b!1245382 () Bool)

(assert (=> b!1245382 (= e!706173 (noDuplicate!2041 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(assert (= (and d!137237 (not res!830900)) b!1245381))

(assert (= (and b!1245381 res!830901) b!1245382))

(declare-fun m!1146989 () Bool)

(assert (=> b!1245381 m!1146989))

(declare-fun m!1146991 () Bool)

(assert (=> b!1245382 m!1146991))

(assert (=> b!1245322 d!137237))

(declare-fun d!137241 () Bool)

(assert (=> d!137241 (= (array_inv!29619 a!3892) (bvsge (size!39174 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104228 d!137241))

(check-sat (not b!1245376) (not bm!61455) (not b!1245381) (not b!1245382) (not b!1245373) (not b!1245374))
(check-sat)
(get-model)

(assert (=> b!1245374 d!137225))

(declare-fun b!1245419 () Bool)

(declare-fun e!706205 () Bool)

(declare-fun call!61465 () Bool)

(assert (=> b!1245419 (= e!706205 call!61465)))

(declare-fun b!1245420 () Bool)

(declare-fun e!706207 () Bool)

(assert (=> b!1245420 (= e!706207 e!706205)))

(declare-fun c!121934 () Bool)

(assert (=> b!1245420 (= c!121934 (validKeyInArray!0 (select (arr!38636 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61462 () Bool)

(assert (=> bm!61462 (= call!61465 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121934 (Cons!27536 (select (arr!38636 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!121927 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537) Nil!27537)) (ite c!121927 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537) Nil!27537))))))

(declare-fun b!1245421 () Bool)

(declare-fun e!706206 () Bool)

(assert (=> b!1245421 (= e!706206 e!706207)))

(declare-fun res!830927 () Bool)

(assert (=> b!1245421 (=> (not res!830927) (not e!706207))))

(declare-fun e!706204 () Bool)

(assert (=> b!1245421 (= res!830927 (not e!706204))))

(declare-fun res!830926 () Bool)

(assert (=> b!1245421 (=> (not res!830926) (not e!706204))))

(assert (=> b!1245421 (= res!830926 (validKeyInArray!0 (select (arr!38636 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun d!137249 () Bool)

(declare-fun res!830928 () Bool)

(assert (=> d!137249 (=> res!830928 e!706206)))

(assert (=> d!137249 (= res!830928 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39174 a!3892)))))

(assert (=> d!137249 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121927 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537) Nil!27537)) e!706206)))

(declare-fun b!1245422 () Bool)

(assert (=> b!1245422 (= e!706205 call!61465)))

(declare-fun b!1245423 () Bool)

(assert (=> b!1245423 (= e!706204 (contains!7416 (ite c!121927 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537) Nil!27537) (select (arr!38636 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(assert (= (and d!137249 (not res!830928)) b!1245421))

(assert (= (and b!1245421 res!830926) b!1245423))

(assert (= (and b!1245421 res!830927) b!1245420))

(assert (= (and b!1245420 c!121934) b!1245422))

(assert (= (and b!1245420 (not c!121934)) b!1245419))

(assert (= (or b!1245422 b!1245419) bm!61462))

(declare-fun m!1147005 () Bool)

(assert (=> b!1245420 m!1147005))

(assert (=> b!1245420 m!1147005))

(declare-fun m!1147007 () Bool)

(assert (=> b!1245420 m!1147007))

(assert (=> bm!61462 m!1147005))

(declare-fun m!1147009 () Bool)

(assert (=> bm!61462 m!1147009))

(assert (=> b!1245421 m!1147005))

(assert (=> b!1245421 m!1147005))

(assert (=> b!1245421 m!1147007))

(assert (=> b!1245423 m!1147005))

(assert (=> b!1245423 m!1147005))

(declare-fun m!1147011 () Bool)

(assert (=> b!1245423 m!1147011))

(assert (=> bm!61455 d!137249))

(declare-fun d!137251 () Bool)

(declare-fun res!830929 () Bool)

(declare-fun e!706208 () Bool)

(assert (=> d!137251 (=> res!830929 e!706208)))

(assert (=> d!137251 (= res!830929 ((_ is Nil!27537) (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(assert (=> d!137251 (= (noDuplicate!2041 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) e!706208)))

(declare-fun b!1245424 () Bool)

(declare-fun e!706209 () Bool)

(assert (=> b!1245424 (= e!706208 e!706209)))

(declare-fun res!830930 () Bool)

(assert (=> b!1245424 (=> (not res!830930) (not e!706209))))

(assert (=> b!1245424 (= res!830930 (not (contains!7416 (t!41000 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) (h!28745 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))))

(declare-fun b!1245425 () Bool)

(assert (=> b!1245425 (= e!706209 (noDuplicate!2041 (t!41000 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)))))))

(assert (= (and d!137251 (not res!830929)) b!1245424))

(assert (= (and b!1245424 res!830930) b!1245425))

(declare-fun m!1147013 () Bool)

(assert (=> b!1245424 m!1147013))

(declare-fun m!1147015 () Bool)

(assert (=> b!1245425 m!1147015))

(assert (=> b!1245382 d!137251))

(declare-fun d!137253 () Bool)

(declare-fun lt!562749 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!618 (List!27540) (InoxSet (_ BitVec 64)))

(assert (=> d!137253 (= lt!562749 (select (content!618 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) (h!28745 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(declare-fun e!706214 () Bool)

(assert (=> d!137253 (= lt!562749 e!706214)))

(declare-fun res!830936 () Bool)

(assert (=> d!137253 (=> (not res!830936) (not e!706214))))

(assert (=> d!137253 (= res!830936 ((_ is Cons!27536) (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(assert (=> d!137253 (= (contains!7416 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537)) (h!28745 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) lt!562749)))

(declare-fun b!1245430 () Bool)

(declare-fun e!706215 () Bool)

(assert (=> b!1245430 (= e!706214 e!706215)))

(declare-fun res!830935 () Bool)

(assert (=> b!1245430 (=> res!830935 e!706215)))

(assert (=> b!1245430 (= res!830935 (= (h!28745 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) (h!28745 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(declare-fun b!1245431 () Bool)

(assert (=> b!1245431 (= e!706215 (contains!7416 (t!41000 (t!41000 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))) (h!28745 (Cons!27536 (select (arr!38636 a!3892) from!3270) Nil!27537))))))

(assert (= (and d!137253 res!830936) b!1245430))

(assert (= (and b!1245430 (not res!830935)) b!1245431))

(declare-fun m!1147017 () Bool)

(assert (=> d!137253 m!1147017))

(declare-fun m!1147019 () Bool)

(assert (=> d!137253 m!1147019))

(declare-fun m!1147021 () Bool)

(assert (=> b!1245431 m!1147021))

(assert (=> b!1245381 d!137253))

(assert (=> b!1245373 d!137225))

(declare-fun d!137255 () Bool)

(declare-fun lt!562750 () Bool)

(assert (=> d!137255 (= lt!562750 (select (content!618 Nil!27537) (select (arr!38636 a!3892) from!3270)))))

(declare-fun e!706216 () Bool)

(assert (=> d!137255 (= lt!562750 e!706216)))

(declare-fun res!830938 () Bool)

(assert (=> d!137255 (=> (not res!830938) (not e!706216))))

(assert (=> d!137255 (= res!830938 ((_ is Cons!27536) Nil!27537))))

(assert (=> d!137255 (= (contains!7416 Nil!27537 (select (arr!38636 a!3892) from!3270)) lt!562750)))

(declare-fun b!1245432 () Bool)

(declare-fun e!706217 () Bool)

(assert (=> b!1245432 (= e!706216 e!706217)))

(declare-fun res!830937 () Bool)

(assert (=> b!1245432 (=> res!830937 e!706217)))

(assert (=> b!1245432 (= res!830937 (= (h!28745 Nil!27537) (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1245433 () Bool)

(assert (=> b!1245433 (= e!706217 (contains!7416 (t!41000 Nil!27537) (select (arr!38636 a!3892) from!3270)))))

(assert (= (and d!137255 res!830938) b!1245432))

(assert (= (and b!1245432 (not res!830937)) b!1245433))

(declare-fun m!1147023 () Bool)

(assert (=> d!137255 m!1147023))

(assert (=> d!137255 m!1146951))

(declare-fun m!1147025 () Bool)

(assert (=> d!137255 m!1147025))

(assert (=> b!1245433 m!1146951))

(declare-fun m!1147027 () Bool)

(assert (=> b!1245433 m!1147027))

(assert (=> b!1245376 d!137255))

(check-sat (not d!137253) (not b!1245424) (not b!1245431) (not b!1245433) (not b!1245423) (not d!137255) (not b!1245421) (not bm!61462) (not b!1245420) (not b!1245425))
(check-sat)
