; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104236 () Bool)

(assert start!104236)

(declare-fun res!830918 () Bool)

(declare-fun e!706194 () Bool)

(assert (=> start!104236 (=> (not res!830918) (not e!706194))))

(declare-datatypes ((array!80185 0))(
  ( (array!80186 (arr!38677 (Array (_ BitVec 32) (_ BitVec 64))) (size!39213 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80185)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104236 (= res!830918 (and (bvslt (size!39213 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39213 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39213 a!3892))))))

(assert (=> start!104236 e!706194))

(declare-fun array_inv!29525 (array!80185) Bool)

(assert (=> start!104236 (array_inv!29525 a!3892)))

(assert (=> start!104236 true))

(declare-fun b!1245433 () Bool)

(declare-fun res!830917 () Bool)

(assert (=> b!1245433 (=> (not res!830917) (not e!706194))))

(assert (=> b!1245433 (= res!830917 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39213 a!3892)) (not (= newFrom!287 (size!39213 a!3892)))))))

(declare-fun b!1245434 () Bool)

(declare-fun res!830919 () Bool)

(assert (=> b!1245434 (=> (not res!830919) (not e!706194))))

(declare-datatypes ((List!27480 0))(
  ( (Nil!27477) (Cons!27476 (h!28685 (_ BitVec 64)) (t!40949 List!27480)) )
))
(declare-fun arrayNoDuplicates!0 (array!80185 (_ BitVec 32) List!27480) Bool)

(assert (=> b!1245434 (= res!830919 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27477))))

(declare-fun b!1245435 () Bool)

(declare-fun res!830920 () Bool)

(assert (=> b!1245435 (=> (not res!830920) (not e!706194))))

(assert (=> b!1245435 (= res!830920 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1245436 () Bool)

(declare-fun noDuplicate!2025 (List!27480) Bool)

(assert (=> b!1245436 (= e!706194 (not (noDuplicate!2025 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477))))))

(declare-fun b!1245437 () Bool)

(declare-fun res!830916 () Bool)

(assert (=> b!1245437 (=> (not res!830916) (not e!706194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245437 (= res!830916 (validKeyInArray!0 (select (arr!38677 a!3892) from!3270)))))

(assert (= (and start!104236 res!830918) b!1245434))

(assert (= (and b!1245434 res!830919) b!1245433))

(assert (= (and b!1245433 res!830917) b!1245437))

(assert (= (and b!1245437 res!830916) b!1245435))

(assert (= (and b!1245435 res!830920) b!1245436))

(declare-fun m!1147493 () Bool)

(assert (=> start!104236 m!1147493))

(declare-fun m!1147495 () Bool)

(assert (=> b!1245434 m!1147495))

(declare-fun m!1147497 () Bool)

(assert (=> b!1245436 m!1147497))

(declare-fun m!1147499 () Bool)

(assert (=> b!1245436 m!1147499))

(assert (=> b!1245437 m!1147497))

(assert (=> b!1245437 m!1147497))

(declare-fun m!1147501 () Bool)

(assert (=> b!1245437 m!1147501))

(push 1)

(assert (not start!104236))

(assert (not b!1245434))

(assert (not b!1245437))

(assert (not b!1245436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137371 () Bool)

(assert (=> d!137371 (= (array_inv!29525 a!3892) (bvsge (size!39213 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104236 d!137371))

(declare-fun b!1245490 () Bool)

(declare-fun e!706242 () Bool)

(declare-fun e!706239 () Bool)

(assert (=> b!1245490 (= e!706242 e!706239)))

(declare-fun c!121951 () Bool)

(assert (=> b!1245490 (= c!121951 (validKeyInArray!0 (select (arr!38677 a!3892) from!3270)))))

(declare-fun b!1245491 () Bool)

(declare-fun call!61483 () Bool)

(assert (=> b!1245491 (= e!706239 call!61483)))

(declare-fun d!137373 () Bool)

(declare-fun res!830959 () Bool)

(declare-fun e!706240 () Bool)

(assert (=> d!137373 (=> res!830959 e!706240)))

(assert (=> d!137373 (= res!830959 (bvsge from!3270 (size!39213 a!3892)))))

(assert (=> d!137373 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27477) e!706240)))

(declare-fun bm!61480 () Bool)

(assert (=> bm!61480 (= call!61483 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121951 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477) Nil!27477)))))

(declare-fun b!1245492 () Bool)

(declare-fun e!706241 () Bool)

(declare-fun contains!7446 (List!27480 (_ BitVec 64)) Bool)

(assert (=> b!1245492 (= e!706241 (contains!7446 Nil!27477 (select (arr!38677 a!3892) from!3270)))))

(declare-fun b!1245493 () Bool)

(assert (=> b!1245493 (= e!706240 e!706242)))

(declare-fun res!830958 () Bool)

(assert (=> b!1245493 (=> (not res!830958) (not e!706242))))

(assert (=> b!1245493 (= res!830958 (not e!706241))))

(declare-fun res!830957 () Bool)

(assert (=> b!1245493 (=> (not res!830957) (not e!706241))))

(assert (=> b!1245493 (= res!830957 (validKeyInArray!0 (select (arr!38677 a!3892) from!3270)))))

(declare-fun b!1245494 () Bool)

(assert (=> b!1245494 (= e!706239 call!61483)))

(assert (= (and d!137373 (not res!830959)) b!1245493))

(assert (= (and b!1245493 res!830957) b!1245492))

(assert (= (and b!1245493 res!830958) b!1245490))

(assert (= (and b!1245490 c!121951) b!1245494))

(assert (= (and b!1245490 (not c!121951)) b!1245491))

(assert (= (or b!1245494 b!1245491) bm!61480))

(assert (=> b!1245490 m!1147497))

(assert (=> b!1245490 m!1147497))

(assert (=> b!1245490 m!1147501))

(assert (=> bm!61480 m!1147497))

(declare-fun m!1147519 () Bool)

(assert (=> bm!61480 m!1147519))

(assert (=> b!1245492 m!1147497))

(assert (=> b!1245492 m!1147497))

(declare-fun m!1147521 () Bool)

(assert (=> b!1245492 m!1147521))

(assert (=> b!1245493 m!1147497))

(assert (=> b!1245493 m!1147497))

(assert (=> b!1245493 m!1147501))

(assert (=> b!1245434 d!137373))

(declare-fun d!137377 () Bool)

(assert (=> d!137377 (= (validKeyInArray!0 (select (arr!38677 a!3892) from!3270)) (and (not (= (select (arr!38677 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38677 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245437 d!137377))

(declare-fun d!137379 () Bool)

(declare-fun res!830964 () Bool)

(declare-fun e!706247 () Bool)

(assert (=> d!137379 (=> res!830964 e!706247)))

(assert (=> d!137379 (= res!830964 (is-Nil!27477 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477)))))

(assert (=> d!137379 (= (noDuplicate!2025 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477)) e!706247)))

(declare-fun b!1245499 () Bool)

(declare-fun e!706248 () Bool)

(assert (=> b!1245499 (= e!706247 e!706248)))

(declare-fun res!830965 () Bool)

(assert (=> b!1245499 (=> (not res!830965) (not e!706248))))

(assert (=> b!1245499 (= res!830965 (not (contains!7446 (t!40949 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477)) (h!28685 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477)))))))

(declare-fun b!1245500 () Bool)

(assert (=> b!1245500 (= e!706248 (noDuplicate!2025 (t!40949 (Cons!27476 (select (arr!38677 a!3892) from!3270) Nil!27477))))))

(assert (= (and d!137379 (not res!830964)) b!1245499))

(assert (= (and b!1245499 res!830965) b!1245500))

(declare-fun m!1147523 () Bool)

(assert (=> b!1245499 m!1147523))

(declare-fun m!1147525 () Bool)

(assert (=> b!1245500 m!1147525))

(assert (=> b!1245436 d!137379))

(push 1)

(assert (not b!1245492))

(assert (not b!1245490))

(assert (not b!1245499))

(assert (not bm!61480))

(assert (not b!1245493))

(assert (not b!1245500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

