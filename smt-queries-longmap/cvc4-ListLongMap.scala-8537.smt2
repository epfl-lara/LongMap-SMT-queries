; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104140 () Bool)

(assert start!104140)

(declare-fun res!830616 () Bool)

(declare-fun e!705890 () Bool)

(assert (=> start!104140 (=> (not res!830616) (not e!705890))))

(declare-datatypes ((array!80125 0))(
  ( (array!80126 (arr!38650 (Array (_ BitVec 32) (_ BitVec 64))) (size!39186 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80125)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104140 (= res!830616 (and (bvslt (size!39186 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39186 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39186 a!3892))))))

(assert (=> start!104140 e!705890))

(declare-fun array_inv!29498 (array!80125) Bool)

(assert (=> start!104140 (array_inv!29498 a!3892)))

(assert (=> start!104140 true))

(declare-fun b!1245096 () Bool)

(declare-fun res!830615 () Bool)

(assert (=> b!1245096 (=> (not res!830615) (not e!705890))))

(declare-datatypes ((List!27453 0))(
  ( (Nil!27450) (Cons!27449 (h!28658 (_ BitVec 64)) (t!40922 List!27453)) )
))
(declare-fun arrayNoDuplicates!0 (array!80125 (_ BitVec 32) List!27453) Bool)

(assert (=> b!1245096 (= res!830615 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27450))))

(declare-fun b!1245097 () Bool)

(declare-fun res!830617 () Bool)

(assert (=> b!1245097 (=> (not res!830617) (not e!705890))))

(assert (=> b!1245097 (= res!830617 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245098 () Bool)

(declare-fun noDuplicate!2019 (List!27453) Bool)

(assert (=> b!1245098 (= e!705890 (not (noDuplicate!2019 Nil!27450)))))

(assert (= (and start!104140 res!830616) b!1245096))

(assert (= (and b!1245096 res!830615) b!1245097))

(assert (= (and b!1245097 res!830617) b!1245098))

(declare-fun m!1147239 () Bool)

(assert (=> start!104140 m!1147239))

(declare-fun m!1147241 () Bool)

(assert (=> b!1245096 m!1147241))

(declare-fun m!1147243 () Bool)

(assert (=> b!1245098 m!1147243))

(push 1)

(assert (not b!1245098))

(assert (not start!104140))

(assert (not b!1245096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137293 () Bool)

(declare-fun res!830622 () Bool)

(declare-fun e!705896 () Bool)

(assert (=> d!137293 (=> res!830622 e!705896)))

(assert (=> d!137293 (= res!830622 (is-Nil!27450 Nil!27450))))

(assert (=> d!137293 (= (noDuplicate!2019 Nil!27450) e!705896)))

(declare-fun b!1245103 () Bool)

(declare-fun e!705897 () Bool)

(assert (=> b!1245103 (= e!705896 e!705897)))

(declare-fun res!830623 () Bool)

(assert (=> b!1245103 (=> (not res!830623) (not e!705897))))

(declare-fun contains!7439 (List!27453 (_ BitVec 64)) Bool)

(assert (=> b!1245103 (= res!830623 (not (contains!7439 (t!40922 Nil!27450) (h!28658 Nil!27450))))))

(declare-fun b!1245104 () Bool)

(assert (=> b!1245104 (= e!705897 (noDuplicate!2019 (t!40922 Nil!27450)))))

(assert (= (and d!137293 (not res!830622)) b!1245103))

(assert (= (and b!1245103 res!830623) b!1245104))

(declare-fun m!1147245 () Bool)

(assert (=> b!1245103 m!1147245))

(declare-fun m!1147247 () Bool)

(assert (=> b!1245104 m!1147247))

(assert (=> b!1245098 d!137293))

(declare-fun d!137297 () Bool)

(assert (=> d!137297 (= (array_inv!29498 a!3892) (bvsge (size!39186 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104140 d!137297))

(declare-fun bm!61459 () Bool)

(declare-fun call!61462 () Bool)

(declare-fun c!121930 () Bool)

(assert (=> bm!61459 (= call!61462 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121930 (Cons!27449 (select (arr!38650 a!3892) from!3270) Nil!27450) Nil!27450)))))

(declare-fun b!1245138 () Bool)

(declare-fun e!705929 () Bool)

(declare-fun e!705926 () Bool)

(assert (=> b!1245138 (= e!705929 e!705926)))

(declare-fun res!830648 () Bool)

(assert (=> b!1245138 (=> (not res!830648) (not e!705926))))

(declare-fun e!705927 () Bool)

(assert (=> b!1245138 (= res!830648 (not e!705927))))

(declare-fun res!830649 () Bool)

(assert (=> b!1245138 (=> (not res!830649) (not e!705927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245138 (= res!830649 (validKeyInArray!0 (select (arr!38650 a!3892) from!3270)))))

(declare-fun b!1245139 () Bool)

(declare-fun e!705928 () Bool)

(assert (=> b!1245139 (= e!705928 call!61462)))

(declare-fun d!137299 () Bool)

(declare-fun res!830647 () Bool)

(assert (=> d!137299 (=> res!830647 e!705929)))

(assert (=> d!137299 (= res!830647 (bvsge from!3270 (size!39186 a!3892)))))

(assert (=> d!137299 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27450) e!705929)))

(declare-fun b!1245140 () Bool)

(assert (=> b!1245140 (= e!705927 (contains!7439 Nil!27450 (select (arr!38650 a!3892) from!3270)))))

(declare-fun b!1245141 () Bool)

(assert (=> b!1245141 (= e!705926 e!705928)))

(assert (=> b!1245141 (= c!121930 (validKeyInArray!0 (select (arr!38650 a!3892) from!3270)))))

(declare-fun b!1245142 () Bool)

(assert (=> b!1245142 (= e!705928 call!61462)))

(assert (= (and d!137299 (not res!830647)) b!1245138))

(assert (= (and b!1245138 res!830649) b!1245140))

(assert (= (and b!1245138 res!830648) b!1245141))

(assert (= (and b!1245141 c!121930) b!1245142))

(assert (= (and b!1245141 (not c!121930)) b!1245139))

(assert (= (or b!1245142 b!1245139) bm!61459))

(declare-fun m!1147257 () Bool)

(assert (=> bm!61459 m!1147257))

(declare-fun m!1147259 () Bool)

(assert (=> bm!61459 m!1147259))

(assert (=> b!1245138 m!1147257))

(assert (=> b!1245138 m!1147257))

(declare-fun m!1147261 () Bool)

(assert (=> b!1245138 m!1147261))

(assert (=> b!1245140 m!1147257))

(assert (=> b!1245140 m!1147257))

(declare-fun m!1147263 () Bool)

(assert (=> b!1245140 m!1147263))

(assert (=> b!1245141 m!1147257))

(assert (=> b!1245141 m!1147257))

(assert (=> b!1245141 m!1147261))

(assert (=> b!1245096 d!137299))

(push 1)

(assert (not b!1245104))

(assert (not bm!61459))

