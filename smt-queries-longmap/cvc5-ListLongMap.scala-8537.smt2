; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104136 () Bool)

(assert start!104136)

(declare-fun res!830598 () Bool)

(declare-fun e!705878 () Bool)

(assert (=> start!104136 (=> (not res!830598) (not e!705878))))

(declare-datatypes ((array!80121 0))(
  ( (array!80122 (arr!38648 (Array (_ BitVec 32) (_ BitVec 64))) (size!39184 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80121)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104136 (= res!830598 (and (bvslt (size!39184 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39184 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39184 a!3892))))))

(assert (=> start!104136 e!705878))

(declare-fun array_inv!29496 (array!80121) Bool)

(assert (=> start!104136 (array_inv!29496 a!3892)))

(assert (=> start!104136 true))

(declare-fun b!1245078 () Bool)

(declare-fun res!830599 () Bool)

(assert (=> b!1245078 (=> (not res!830599) (not e!705878))))

(declare-datatypes ((List!27451 0))(
  ( (Nil!27448) (Cons!27447 (h!28656 (_ BitVec 64)) (t!40920 List!27451)) )
))
(declare-fun arrayNoDuplicates!0 (array!80121 (_ BitVec 32) List!27451) Bool)

(assert (=> b!1245078 (= res!830599 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27448))))

(declare-fun b!1245079 () Bool)

(declare-fun res!830597 () Bool)

(assert (=> b!1245079 (=> (not res!830597) (not e!705878))))

(assert (=> b!1245079 (= res!830597 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245080 () Bool)

(declare-fun noDuplicate!2017 (List!27451) Bool)

(assert (=> b!1245080 (= e!705878 (not (noDuplicate!2017 Nil!27448)))))

(assert (= (and start!104136 res!830598) b!1245078))

(assert (= (and b!1245078 res!830599) b!1245079))

(assert (= (and b!1245079 res!830597) b!1245080))

(declare-fun m!1147227 () Bool)

(assert (=> start!104136 m!1147227))

(declare-fun m!1147229 () Bool)

(assert (=> b!1245078 m!1147229))

(declare-fun m!1147231 () Bool)

(assert (=> b!1245080 m!1147231))

(push 1)

(assert (not start!104136))

(assert (not b!1245078))

(assert (not b!1245080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137291 () Bool)

(assert (=> d!137291 (= (array_inv!29496 a!3892) (bvsge (size!39184 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104136 d!137291))

(declare-fun b!1245125 () Bool)

(declare-fun e!705914 () Bool)

(declare-fun contains!7438 (List!27451 (_ BitVec 64)) Bool)

(assert (=> b!1245125 (= e!705914 (contains!7438 Nil!27448 (select (arr!38648 a!3892) from!3270)))))

(declare-fun d!137295 () Bool)

(declare-fun res!830638 () Bool)

(declare-fun e!705917 () Bool)

(assert (=> d!137295 (=> res!830638 e!705917)))

(assert (=> d!137295 (= res!830638 (bvsge from!3270 (size!39184 a!3892)))))

(assert (=> d!137295 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27448) e!705917)))

(declare-fun b!1245126 () Bool)

(declare-fun e!705915 () Bool)

(declare-fun e!705916 () Bool)

(assert (=> b!1245126 (= e!705915 e!705916)))

(declare-fun c!121929 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245126 (= c!121929 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1245127 () Bool)

(declare-fun call!61461 () Bool)

(assert (=> b!1245127 (= e!705916 call!61461)))

(declare-fun b!1245128 () Bool)

(assert (=> b!1245128 (= e!705916 call!61461)))

(declare-fun bm!61456 () Bool)

(assert (=> bm!61456 (= call!61461 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121929 (Cons!27447 (select (arr!38648 a!3892) from!3270) Nil!27448) Nil!27448)))))

(declare-fun b!1245129 () Bool)

(assert (=> b!1245129 (= e!705917 e!705915)))

(declare-fun res!830636 () Bool)

(assert (=> b!1245129 (=> (not res!830636) (not e!705915))))

(assert (=> b!1245129 (= res!830636 (not e!705914))))

(declare-fun res!830637 () Bool)

(assert (=> b!1245129 (=> (not res!830637) (not e!705914))))

(assert (=> b!1245129 (= res!830637 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(assert (= (and d!137295 (not res!830638)) b!1245129))

(assert (= (and b!1245129 res!830637) b!1245125))

(assert (= (and b!1245129 res!830636) b!1245126))

(assert (= (and b!1245126 c!121929) b!1245128))

(assert (= (and b!1245126 (not c!121929)) b!1245127))

(assert (= (or b!1245128 b!1245127) bm!61456))

(declare-fun m!1147249 () Bool)

(assert (=> b!1245125 m!1147249))

(assert (=> b!1245125 m!1147249))

(declare-fun m!1147251 () Bool)

(assert (=> b!1245125 m!1147251))

(assert (=> b!1245126 m!1147249))

(assert (=> b!1245126 m!1147249))

(declare-fun m!1147253 () Bool)

(assert (=> b!1245126 m!1147253))

(assert (=> bm!61456 m!1147249))

(declare-fun m!1147255 () Bool)

(assert (=> bm!61456 m!1147255))

(assert (=> b!1245129 m!1147249))

(assert (=> b!1245129 m!1147249))

(assert (=> b!1245129 m!1147253))

(assert (=> b!1245078 d!137295))

(declare-fun d!137303 () Bool)

(declare-fun res!830650 () Bool)

(declare-fun e!705930 () Bool)

(assert (=> d!137303 (=> res!830650 e!705930)))

(assert (=> d!137303 (= res!830650 (is-Nil!27448 Nil!27448))))

(assert (=> d!137303 (= (noDuplicate!2017 Nil!27448) e!705930)))

(declare-fun b!1245143 () Bool)

(declare-fun e!705931 () Bool)

(assert (=> b!1245143 (= e!705930 e!705931)))

(declare-fun res!830651 () Bool)

(assert (=> b!1245143 (=> (not res!830651) (not e!705931))))

(assert (=> b!1245143 (= res!830651 (not (contains!7438 (t!40920 Nil!27448) (h!28656 Nil!27448))))))

(declare-fun b!1245144 () Bool)

(assert (=> b!1245144 (= e!705931 (noDuplicate!2017 (t!40920 Nil!27448)))))

(assert (= (and d!137303 (not res!830650)) b!1245143))

(assert (= (and b!1245143 res!830651) b!1245144))

(declare-fun m!1147265 () Bool)

(assert (=> b!1245143 m!1147265))

(declare-fun m!1147267 () Bool)

(assert (=> b!1245144 m!1147267))

(assert (=> b!1245080 d!137303))

(push 1)

(assert (not b!1245126))

(assert (not bm!61456))

(assert (not b!1245125))

(assert (not b!1245144))

(assert (not b!1245129))

(assert (not b!1245143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

