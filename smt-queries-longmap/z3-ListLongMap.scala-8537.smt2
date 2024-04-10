; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104138 () Bool)

(assert start!104138)

(declare-fun res!830608 () Bool)

(declare-fun e!705884 () Bool)

(assert (=> start!104138 (=> (not res!830608) (not e!705884))))

(declare-datatypes ((array!80123 0))(
  ( (array!80124 (arr!38649 (Array (_ BitVec 32) (_ BitVec 64))) (size!39185 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80123)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104138 (= res!830608 (and (bvslt (size!39185 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39185 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39185 a!3892))))))

(assert (=> start!104138 e!705884))

(declare-fun array_inv!29497 (array!80123) Bool)

(assert (=> start!104138 (array_inv!29497 a!3892)))

(assert (=> start!104138 true))

(declare-fun b!1245087 () Bool)

(declare-fun res!830606 () Bool)

(assert (=> b!1245087 (=> (not res!830606) (not e!705884))))

(declare-datatypes ((List!27452 0))(
  ( (Nil!27449) (Cons!27448 (h!28657 (_ BitVec 64)) (t!40921 List!27452)) )
))
(declare-fun arrayNoDuplicates!0 (array!80123 (_ BitVec 32) List!27452) Bool)

(assert (=> b!1245087 (= res!830606 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27449))))

(declare-fun b!1245088 () Bool)

(declare-fun res!830607 () Bool)

(assert (=> b!1245088 (=> (not res!830607) (not e!705884))))

(assert (=> b!1245088 (= res!830607 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245089 () Bool)

(declare-fun noDuplicate!2018 (List!27452) Bool)

(assert (=> b!1245089 (= e!705884 (not (noDuplicate!2018 Nil!27449)))))

(assert (= (and start!104138 res!830608) b!1245087))

(assert (= (and b!1245087 res!830606) b!1245088))

(assert (= (and b!1245088 res!830607) b!1245089))

(declare-fun m!1147233 () Bool)

(assert (=> start!104138 m!1147233))

(declare-fun m!1147235 () Bool)

(assert (=> b!1245087 m!1147235))

(declare-fun m!1147237 () Bool)

(assert (=> b!1245089 m!1147237))

(check-sat (not b!1245089) (not start!104138) (not b!1245087))
(check-sat)
(get-model)

(declare-fun d!137301 () Bool)

(declare-fun res!830652 () Bool)

(declare-fun e!705932 () Bool)

(assert (=> d!137301 (=> res!830652 e!705932)))

(get-info :version)

(assert (=> d!137301 (= res!830652 ((_ is Nil!27449) Nil!27449))))

(assert (=> d!137301 (= (noDuplicate!2018 Nil!27449) e!705932)))

(declare-fun b!1245145 () Bool)

(declare-fun e!705933 () Bool)

(assert (=> b!1245145 (= e!705932 e!705933)))

(declare-fun res!830653 () Bool)

(assert (=> b!1245145 (=> (not res!830653) (not e!705933))))

(declare-fun contains!7440 (List!27452 (_ BitVec 64)) Bool)

(assert (=> b!1245145 (= res!830653 (not (contains!7440 (t!40921 Nil!27449) (h!28657 Nil!27449))))))

(declare-fun b!1245146 () Bool)

(assert (=> b!1245146 (= e!705933 (noDuplicate!2018 (t!40921 Nil!27449)))))

(assert (= (and d!137301 (not res!830652)) b!1245145))

(assert (= (and b!1245145 res!830653) b!1245146))

(declare-fun m!1147269 () Bool)

(assert (=> b!1245145 m!1147269))

(declare-fun m!1147271 () Bool)

(assert (=> b!1245146 m!1147271))

(assert (=> b!1245089 d!137301))

(declare-fun d!137305 () Bool)

(assert (=> d!137305 (= (array_inv!29497 a!3892) (bvsge (size!39185 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104138 d!137305))

(declare-fun c!121933 () Bool)

(declare-fun bm!61462 () Bool)

(declare-fun call!61465 () Bool)

(assert (=> bm!61462 (= call!61465 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121933 (Cons!27448 (select (arr!38649 a!3892) from!3270) Nil!27449) Nil!27449)))))

(declare-fun b!1245157 () Bool)

