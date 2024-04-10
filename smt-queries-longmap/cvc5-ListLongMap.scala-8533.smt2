; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104072 () Bool)

(assert start!104072)

(declare-fun res!830384 () Bool)

(declare-fun e!705665 () Bool)

(assert (=> start!104072 (=> (not res!830384) (not e!705665))))

(declare-datatypes ((array!80092 0))(
  ( (array!80093 (arr!38636 (Array (_ BitVec 32) (_ BitVec 64))) (size!39172 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80092)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104072 (= res!830384 (and (bvslt (size!39172 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39172 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39172 a!3892))))))

(assert (=> start!104072 e!705665))

(declare-fun array_inv!29484 (array!80092) Bool)

(assert (=> start!104072 (array_inv!29484 a!3892)))

(assert (=> start!104072 true))

(declare-fun b!1244829 () Bool)

(declare-fun res!830386 () Bool)

(assert (=> b!1244829 (=> (not res!830386) (not e!705665))))

(declare-datatypes ((List!27439 0))(
  ( (Nil!27436) (Cons!27435 (h!28644 (_ BitVec 64)) (t!40908 List!27439)) )
))
(declare-fun arrayNoDuplicates!0 (array!80092 (_ BitVec 32) List!27439) Bool)

(assert (=> b!1244829 (= res!830386 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27436))))

(declare-fun b!1244830 () Bool)

(declare-fun res!830385 () Bool)

(assert (=> b!1244830 (=> (not res!830385) (not e!705665))))

(assert (=> b!1244830 (= res!830385 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39172 a!3892)) (= newFrom!287 (size!39172 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244831 () Bool)

(declare-fun noDuplicate!2011 (List!27439) Bool)

(assert (=> b!1244831 (= e!705665 (not (noDuplicate!2011 Nil!27436)))))

(assert (= (and start!104072 res!830384) b!1244829))

(assert (= (and b!1244829 res!830386) b!1244830))

(assert (= (and b!1244830 res!830385) b!1244831))

(declare-fun m!1147061 () Bool)

(assert (=> start!104072 m!1147061))

(declare-fun m!1147063 () Bool)

(assert (=> b!1244829 m!1147063))

(declare-fun m!1147065 () Bool)

(assert (=> b!1244831 m!1147065))

(push 1)

(assert (not b!1244831))

(assert (not start!104072))

(assert (not b!1244829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137239 () Bool)

(declare-fun res!830415 () Bool)

(declare-fun e!705689 () Bool)

(assert (=> d!137239 (=> res!830415 e!705689)))

(assert (=> d!137239 (= res!830415 (is-Nil!27436 Nil!27436))))

(assert (=> d!137239 (= (noDuplicate!2011 Nil!27436) e!705689)))

(declare-fun b!1244860 () Bool)

(declare-fun e!705690 () Bool)

(assert (=> b!1244860 (= e!705689 e!705690)))

(declare-fun res!830416 () Bool)

(assert (=> b!1244860 (=> (not res!830416) (not e!705690))))

(declare-fun contains!7434 (List!27439 (_ BitVec 64)) Bool)

(assert (=> b!1244860 (= res!830416 (not (contains!7434 (t!40908 Nil!27436) (h!28644 Nil!27436))))))

(declare-fun b!1244861 () Bool)

(assert (=> b!1244861 (= e!705690 (noDuplicate!2011 (t!40908 Nil!27436)))))

(assert (= (and d!137239 (not res!830415)) b!1244860))

(assert (= (and b!1244860 res!830416) b!1244861))

(declare-fun m!1147083 () Bool)

(assert (=> b!1244860 m!1147083))

(declare-fun m!1147085 () Bool)

(assert (=> b!1244861 m!1147085))

(assert (=> b!1244831 d!137239))

(declare-fun d!137243 () Bool)

(assert (=> d!137243 (= (array_inv!29484 a!3892) (bvsge (size!39172 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104072 d!137243))

(declare-fun b!1244887 () Bool)

(declare-fun e!705714 () Bool)

(declare-fun e!705712 () Bool)

(assert (=> b!1244887 (= e!705714 e!705712)))

(declare-fun res!830434 () Bool)

(assert (=> b!1244887 (=> (not res!830434) (not e!705712))))

(declare-fun e!705711 () Bool)

(assert (=> b!1244887 (= res!830434 (not e!705711))))

(declare-fun res!830433 () Bool)

(assert (=> b!1244887 (=> (not res!830433) (not e!705711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244887 (= res!830433 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1244888 () Bool)

(declare-fun e!705713 () Bool)

(assert (=> b!1244888 (= e!705712 e!705713)))

(declare-fun c!121912 () Bool)

(assert (=> b!1244888 (= c!121912 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1244889 () Bool)

(assert (=> b!1244889 (= e!705711 (contains!7434 Nil!27436 (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1244890 () Bool)

(declare-fun call!61444 () Bool)

(assert (=> b!1244890 (= e!705713 call!61444)))

(declare-fun d!137245 () Bool)

(declare-fun res!830432 () Bool)

(assert (=> d!137245 (=> res!830432 e!705714)))

(assert (=> d!137245 (= res!830432 (bvsge from!3270 (size!39172 a!3892)))))

(assert (=> d!137245 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27436) e!705714)))

(declare-fun bm!61441 () Bool)

(assert (=> bm!61441 (= call!61444 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121912 (Cons!27435 (select (arr!38636 a!3892) from!3270) Nil!27436) Nil!27436)))))

(declare-fun b!1244891 () Bool)

(assert (=> b!1244891 (= e!705713 call!61444)))

(assert (= (and d!137245 (not res!830432)) b!1244887))

(assert (= (and b!1244887 res!830433) b!1244889))

(assert (= (and b!1244887 res!830434) b!1244888))

(assert (= (and b!1244888 c!121912) b!1244890))

(assert (= (and b!1244888 (not c!121912)) b!1244891))

(assert (= (or b!1244890 b!1244891) bm!61441))

(declare-fun m!1147095 () Bool)

(assert (=> b!1244887 m!1147095))

(assert (=> b!1244887 m!1147095))

(declare-fun m!1147097 () Bool)

(assert (=> b!1244887 m!1147097))

(assert (=> b!1244888 m!1147095))

(assert (=> b!1244888 m!1147095))

(assert (=> b!1244888 m!1147097))

(assert (=> b!1244889 m!1147095))

(assert (=> b!1244889 m!1147095))

(declare-fun m!1147099 () Bool)

(assert (=> b!1244889 m!1147099))

(assert (=> bm!61441 m!1147095))

