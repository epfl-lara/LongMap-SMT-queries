; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104066 () Bool)

(assert start!104066)

(declare-fun res!830344 () Bool)

(declare-fun e!705620 () Bool)

(assert (=> start!104066 (=> (not res!830344) (not e!705620))))

(declare-datatypes ((array!80012 0))(
  ( (array!80013 (arr!38597 (Array (_ BitVec 32) (_ BitVec 64))) (size!39135 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80012)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104066 (= res!830344 (and (bvslt (size!39135 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39135 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39135 a!3892))))))

(assert (=> start!104066 e!705620))

(declare-fun array_inv!29580 (array!80012) Bool)

(assert (=> start!104066 (array_inv!29580 a!3892)))

(assert (=> start!104066 true))

(declare-fun b!1244747 () Bool)

(declare-fun res!830346 () Bool)

(assert (=> b!1244747 (=> (not res!830346) (not e!705620))))

(declare-datatypes ((List!27501 0))(
  ( (Nil!27498) (Cons!27497 (h!28706 (_ BitVec 64)) (t!40961 List!27501)) )
))
(declare-fun arrayNoDuplicates!0 (array!80012 (_ BitVec 32) List!27501) Bool)

(assert (=> b!1244747 (= res!830346 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27498))))

(declare-fun b!1244748 () Bool)

(declare-fun res!830345 () Bool)

(assert (=> b!1244748 (=> (not res!830345) (not e!705620))))

(assert (=> b!1244748 (= res!830345 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39135 a!3892)) (= newFrom!287 (size!39135 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244749 () Bool)

(declare-fun noDuplicate!2029 (List!27501) Bool)

(assert (=> b!1244749 (= e!705620 (not (noDuplicate!2029 Nil!27498)))))

(assert (= (and start!104066 res!830344) b!1244747))

(assert (= (and b!1244747 res!830346) b!1244748))

(assert (= (and b!1244748 res!830345) b!1244749))

(declare-fun m!1146531 () Bool)

(assert (=> start!104066 m!1146531))

(declare-fun m!1146533 () Bool)

(assert (=> b!1244747 m!1146533))

(declare-fun m!1146535 () Bool)

(assert (=> b!1244749 m!1146535))

(check-sat (not b!1244749) (not b!1244747) (not start!104066))
(check-sat)
(get-model)

(declare-fun d!137103 () Bool)

(declare-fun res!830369 () Bool)

(declare-fun e!705638 () Bool)

(assert (=> d!137103 (=> res!830369 e!705638)))

(get-info :version)

(assert (=> d!137103 (= res!830369 ((_ is Nil!27498) Nil!27498))))

(assert (=> d!137103 (= (noDuplicate!2029 Nil!27498) e!705638)))

(declare-fun b!1244772 () Bool)

(declare-fun e!705639 () Bool)

(assert (=> b!1244772 (= e!705638 e!705639)))

(declare-fun res!830370 () Bool)

(assert (=> b!1244772 (=> (not res!830370) (not e!705639))))

(declare-fun contains!7404 (List!27501 (_ BitVec 64)) Bool)

(assert (=> b!1244772 (= res!830370 (not (contains!7404 (t!40961 Nil!27498) (h!28706 Nil!27498))))))

(declare-fun b!1244773 () Bool)

(assert (=> b!1244773 (= e!705639 (noDuplicate!2029 (t!40961 Nil!27498)))))

(assert (= (and d!137103 (not res!830369)) b!1244772))

(assert (= (and b!1244772 res!830370) b!1244773))

(declare-fun m!1146549 () Bool)

(assert (=> b!1244772 m!1146549))

(declare-fun m!1146551 () Bool)

(assert (=> b!1244773 m!1146551))

(assert (=> b!1244749 d!137103))

(declare-fun b!1244806 () Bool)

(declare-fun e!705671 () Bool)

(declare-fun e!705670 () Bool)

(assert (=> b!1244806 (= e!705671 e!705670)))

(declare-fun c!121893 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244806 (= c!121893 (validKeyInArray!0 (select (arr!38597 a!3892) from!3270)))))

(declare-fun call!61424 () Bool)

(declare-fun bm!61421 () Bool)

(assert (=> bm!61421 (= call!61424 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121893 (Cons!27497 (select (arr!38597 a!3892) from!3270) Nil!27498) Nil!27498)))))

(declare-fun d!137107 () Bool)

(declare-fun res!830395 () Bool)

(declare-fun e!705668 () Bool)

(assert (=> d!137107 (=> res!830395 e!705668)))

(assert (=> d!137107 (= res!830395 (bvsge from!3270 (size!39135 a!3892)))))

(assert (=> d!137107 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27498) e!705668)))

(declare-fun b!1244807 () Bool)

(assert (=> b!1244807 (= e!705670 call!61424)))

(declare-fun b!1244808 () Bool)

(assert (=> b!1244808 (= e!705668 e!705671)))

(declare-fun res!830397 () Bool)

(assert (=> b!1244808 (=> (not res!830397) (not e!705671))))

(declare-fun e!705669 () Bool)

(assert (=> b!1244808 (= res!830397 (not e!705669))))

(declare-fun res!830396 () Bool)

(assert (=> b!1244808 (=> (not res!830396) (not e!705669))))

(assert (=> b!1244808 (= res!830396 (validKeyInArray!0 (select (arr!38597 a!3892) from!3270)))))

(declare-fun b!1244809 () Bool)

(assert (=> b!1244809 (= e!705669 (contains!7404 Nil!27498 (select (arr!38597 a!3892) from!3270)))))

(declare-fun b!1244810 () Bool)

(assert (=> b!1244810 (= e!705670 call!61424)))

(assert (= (and d!137107 (not res!830395)) b!1244808))

(assert (= (and b!1244808 res!830396) b!1244809))

(assert (= (and b!1244808 res!830397) b!1244806))

(assert (= (and b!1244806 c!121893) b!1244810))

(assert (= (and b!1244806 (not c!121893)) b!1244807))

(assert (= (or b!1244810 b!1244807) bm!61421))

(declare-fun m!1146561 () Bool)

(assert (=> b!1244806 m!1146561))

(assert (=> b!1244806 m!1146561))

(declare-fun m!1146563 () Bool)

(assert (=> b!1244806 m!1146563))

(assert (=> bm!61421 m!1146561))

(declare-fun m!1146565 () Bool)

(assert (=> bm!61421 m!1146565))

(assert (=> b!1244808 m!1146561))

(assert (=> b!1244808 m!1146561))

(assert (=> b!1244808 m!1146563))

(assert (=> b!1244809 m!1146561))

(assert (=> b!1244809 m!1146561))

(declare-fun m!1146567 () Bool)

(assert (=> b!1244809 m!1146567))

(assert (=> b!1244747 d!137107))

(declare-fun d!137119 () Bool)

(assert (=> d!137119 (= (array_inv!29580 a!3892) (bvsge (size!39135 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104066 d!137119))

(check-sat (not b!1244772) (not b!1244809) (not b!1244808) (not b!1244773) (not b!1244806) (not bm!61421))
(check-sat)
