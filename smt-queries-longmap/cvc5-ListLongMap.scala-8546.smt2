; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104232 () Bool)

(assert start!104232)

(declare-fun b!1245403 () Bool)

(declare-fun e!706181 () Bool)

(declare-datatypes ((array!80181 0))(
  ( (array!80182 (arr!38675 (Array (_ BitVec 32) (_ BitVec 64))) (size!39211 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80181)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27478 0))(
  ( (Nil!27475) (Cons!27474 (h!28683 (_ BitVec 64)) (t!40947 List!27478)) )
))
(declare-fun noDuplicate!2023 (List!27478) Bool)

(assert (=> b!1245403 (= e!706181 (not (noDuplicate!2023 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475))))))

(declare-fun b!1245404 () Bool)

(declare-fun res!830886 () Bool)

(assert (=> b!1245404 (=> (not res!830886) (not e!706181))))

(assert (=> b!1245404 (= res!830886 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun res!830889 () Bool)

(assert (=> start!104232 (=> (not res!830889) (not e!706181))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104232 (= res!830889 (and (bvslt (size!39211 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39211 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39211 a!3892))))))

(assert (=> start!104232 e!706181))

(declare-fun array_inv!29523 (array!80181) Bool)

(assert (=> start!104232 (array_inv!29523 a!3892)))

(assert (=> start!104232 true))

(declare-fun b!1245405 () Bool)

(declare-fun res!830888 () Bool)

(assert (=> b!1245405 (=> (not res!830888) (not e!706181))))

(declare-fun arrayNoDuplicates!0 (array!80181 (_ BitVec 32) List!27478) Bool)

(assert (=> b!1245405 (= res!830888 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27475))))

(declare-fun b!1245406 () Bool)

(declare-fun res!830887 () Bool)

(assert (=> b!1245406 (=> (not res!830887) (not e!706181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245406 (= res!830887 (validKeyInArray!0 (select (arr!38675 a!3892) from!3270)))))

(declare-fun b!1245407 () Bool)

(declare-fun res!830890 () Bool)

(assert (=> b!1245407 (=> (not res!830890) (not e!706181))))

(assert (=> b!1245407 (= res!830890 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39211 a!3892)) (not (= newFrom!287 (size!39211 a!3892)))))))

(assert (= (and start!104232 res!830889) b!1245405))

(assert (= (and b!1245405 res!830888) b!1245407))

(assert (= (and b!1245407 res!830890) b!1245406))

(assert (= (and b!1245406 res!830887) b!1245404))

(assert (= (and b!1245404 res!830886) b!1245403))

(declare-fun m!1147473 () Bool)

(assert (=> b!1245403 m!1147473))

(declare-fun m!1147475 () Bool)

(assert (=> b!1245403 m!1147475))

(declare-fun m!1147477 () Bool)

(assert (=> start!104232 m!1147477))

(declare-fun m!1147479 () Bool)

(assert (=> b!1245405 m!1147479))

(assert (=> b!1245406 m!1147473))

(assert (=> b!1245406 m!1147473))

(declare-fun m!1147481 () Bool)

(assert (=> b!1245406 m!1147481))

(push 1)

(assert (not start!104232))

(assert (not b!1245403))

(assert (not b!1245405))

(assert (not b!1245406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137363 () Bool)

(assert (=> d!137363 (= (array_inv!29523 a!3892) (bvsge (size!39211 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104232 d!137363))

(declare-fun d!137365 () Bool)

(declare-fun res!830931 () Bool)

(declare-fun e!706207 () Bool)

(assert (=> d!137365 (=> res!830931 e!706207)))

(assert (=> d!137365 (= res!830931 (is-Nil!27475 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475)))))

(assert (=> d!137365 (= (noDuplicate!2023 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475)) e!706207)))

(declare-fun b!1245452 () Bool)

(declare-fun e!706208 () Bool)

(assert (=> b!1245452 (= e!706207 e!706208)))

(declare-fun res!830932 () Bool)

(assert (=> b!1245452 (=> (not res!830932) (not e!706208))))

(declare-fun contains!7445 (List!27478 (_ BitVec 64)) Bool)

(assert (=> b!1245452 (= res!830932 (not (contains!7445 (t!40947 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475)) (h!28683 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475)))))))

(declare-fun b!1245453 () Bool)

(assert (=> b!1245453 (= e!706208 (noDuplicate!2023 (t!40947 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475))))))

(assert (= (and d!137365 (not res!830931)) b!1245452))

(assert (= (and b!1245452 res!830932) b!1245453))

(declare-fun m!1147503 () Bool)

(assert (=> b!1245452 m!1147503))

(declare-fun m!1147505 () Bool)

(assert (=> b!1245453 m!1147505))

(assert (=> b!1245403 d!137365))

(declare-fun b!1245475 () Bool)

(declare-fun e!706227 () Bool)

(declare-fun call!61480 () Bool)

(assert (=> b!1245475 (= e!706227 call!61480)))

(declare-fun b!1245476 () Bool)

(assert (=> b!1245476 (= e!706227 call!61480)))

(declare-fun b!1245477 () Bool)

(declare-fun e!706228 () Bool)

(assert (=> b!1245477 (= e!706228 e!706227)))

(declare-fun c!121948 () Bool)

(assert (=> b!1245477 (= c!121948 (validKeyInArray!0 (select (arr!38675 a!3892) from!3270)))))

(declare-fun b!1245478 () Bool)

(declare-fun e!706230 () Bool)

(assert (=> b!1245478 (= e!706230 e!706228)))

(declare-fun res!830950 () Bool)

(assert (=> b!1245478 (=> (not res!830950) (not e!706228))))

(declare-fun e!706229 () Bool)

(assert (=> b!1245478 (= res!830950 (not e!706229))))

(declare-fun res!830949 () Bool)

(assert (=> b!1245478 (=> (not res!830949) (not e!706229))))

(assert (=> b!1245478 (= res!830949 (validKeyInArray!0 (select (arr!38675 a!3892) from!3270)))))

(declare-fun bm!61477 () Bool)

(assert (=> bm!61477 (= call!61480 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121948 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475) Nil!27475)))))

(declare-fun b!1245479 () Bool)

(assert (=> b!1245479 (= e!706229 (contains!7445 Nil!27475 (select (arr!38675 a!3892) from!3270)))))

(declare-fun d!137367 () Bool)

(declare-fun res!830948 () Bool)

(assert (=> d!137367 (=> res!830948 e!706230)))

(assert (=> d!137367 (= res!830948 (bvsge from!3270 (size!39211 a!3892)))))

(assert (=> d!137367 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27475) e!706230)))

(assert (= (and d!137367 (not res!830948)) b!1245478))

(assert (= (and b!1245478 res!830949) b!1245479))

(assert (= (and b!1245478 res!830950) b!1245477))

(assert (= (and b!1245477 c!121948) b!1245476))

(assert (= (and b!1245477 (not c!121948)) b!1245475))

(assert (= (or b!1245476 b!1245475) bm!61477))

(assert (=> b!1245477 m!1147473))

(assert (=> b!1245477 m!1147473))

(assert (=> b!1245477 m!1147481))

(assert (=> b!1245478 m!1147473))

(assert (=> b!1245478 m!1147473))

(assert (=> b!1245478 m!1147481))

(assert (=> bm!61477 m!1147473))

(declare-fun m!1147515 () Bool)

(assert (=> bm!61477 m!1147515))

(assert (=> b!1245479 m!1147473))

(assert (=> b!1245479 m!1147473))

(declare-fun m!1147517 () Bool)

(assert (=> b!1245479 m!1147517))

(assert (=> b!1245405 d!137367))

(declare-fun d!137375 () Bool)

(assert (=> d!137375 (= (validKeyInArray!0 (select (arr!38675 a!3892) from!3270)) (and (not (= (select (arr!38675 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38675 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245406 d!137375))

(push 1)

(assert (not b!1245478))

(assert (not b!1245452))

(assert (not bm!61477))

(assert (not b!1245453))

(assert (not b!1245477))

(assert (not b!1245479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1245516 () Bool)

(declare-fun e!706263 () Bool)

(declare-fun call!61485 () Bool)

(assert (=> b!1245516 (= e!706263 call!61485)))

(declare-fun b!1245517 () Bool)

(assert (=> b!1245517 (= e!706263 call!61485)))

(declare-fun b!1245518 () Bool)

(declare-fun e!706264 () Bool)

(assert (=> b!1245518 (= e!706264 e!706263)))

(declare-fun c!121953 () Bool)

(assert (=> b!1245518 (= c!121953 (validKeyInArray!0 (select (arr!38675 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245519 () Bool)

(declare-fun e!706266 () Bool)

(assert (=> b!1245519 (= e!706266 e!706264)))

(declare-fun res!830981 () Bool)

(assert (=> b!1245519 (=> (not res!830981) (not e!706264))))

(declare-fun e!706265 () Bool)

(assert (=> b!1245519 (= res!830981 (not e!706265))))

(declare-fun res!830980 () Bool)

(assert (=> b!1245519 (=> (not res!830980) (not e!706265))))

(assert (=> b!1245519 (= res!830980 (validKeyInArray!0 (select (arr!38675 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61482 () Bool)

(assert (=> bm!61482 (= call!61485 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121953 (Cons!27474 (select (arr!38675 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!121948 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475) Nil!27475)) (ite c!121948 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475) Nil!27475))))))

(declare-fun b!1245520 () Bool)

(assert (=> b!1245520 (= e!706265 (contains!7445 (ite c!121948 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475) Nil!27475) (select (arr!38675 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun d!137389 () Bool)

(declare-fun res!830979 () Bool)

(assert (=> d!137389 (=> res!830979 e!706266)))

(assert (=> d!137389 (= res!830979 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39211 a!3892)))))

(assert (=> d!137389 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121948 (Cons!27474 (select (arr!38675 a!3892) from!3270) Nil!27475) Nil!27475)) e!706266)))

(assert (= (and d!137389 (not res!830979)) b!1245519))

(assert (= (and b!1245519 res!830980) b!1245520))

(assert (= (and b!1245519 res!830981) b!1245518))

(assert (= (and b!1245518 c!121953) b!1245517))

(assert (= (and b!1245518 (not c!121953)) b!1245516))

(assert (= (or b!1245517 b!1245516) bm!61482))

(declare-fun m!1147551 () Bool)

(assert (=> b!1245518 m!1147551))

(assert (=> b!1245518 m!1147551))

(declare-fun m!1147553 () Bool)

(assert (=> b!1245518 m!1147553))

(assert (=> b!1245519 m!1147551))

(assert (=> b!1245519 m!1147551))

(assert (=> b!1245519 m!1147553))

(assert (=> bm!61482 m!1147551))

(declare-fun m!1147555 () Bool)

(assert (=> bm!61482 m!1147555))

(assert (=> b!1245520 m!1147551))

(assert (=> b!1245520 m!1147551))

(declare-fun m!1147557 () Bool)

(assert (=> b!1245520 m!1147557))

(assert (=> bm!61477 d!137389))

(declare-fun d!137391 () Bool)

(declare-fun lt!562932 () Bool)

(declare-fun content!620 (List!27478) (Set (_ BitVec 64)))

(assert (=> d!137391 (= lt!562932 (set.member (select (arr!38675 a!3892) from!3270) (content!620 Nil!27475)))))

(declare-fun e!706271 () Bool)

(assert (=> d!137391 (= lt!562932 e!706271)))

(declare-fun res!830986 () Bool)

(assert (=> d!137391 (=> (not res!830986) (not e!706271))))

(assert (=> d!137391 (= res!830986 (is-Cons!27474 Nil!27475))))

(assert (=> d!137391 (= (contains!7445 Nil!27475 (select (arr!38675 a!3892) from!3270)) lt!562932)))

(declare-fun b!1245525 () Bool)

(declare-fun e!706272 () Bool)

(assert (=> b!1245525 (= e!706271 e!706272)))

(declare-fun res!830987 () Bool)

(assert (=> b!1245525 (=> res!830987 e!706272)))

(assert (=> b!1245525 (= res!830987 (= (h!28683 Nil!27475) (select (arr!38675 a!3892) from!3270)))))

