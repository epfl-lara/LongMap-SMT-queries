; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104132 () Bool)

(assert start!104132)

(declare-fun res!830557 () Bool)

(declare-fun e!705834 () Bool)

(assert (=> start!104132 (=> (not res!830557) (not e!705834))))

(declare-datatypes ((array!80042 0))(
  ( (array!80043 (arr!38609 (Array (_ BitVec 32) (_ BitVec 64))) (size!39147 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80042)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104132 (= res!830557 (and (bvslt (size!39147 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39147 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39147 a!3892))))))

(assert (=> start!104132 e!705834))

(declare-fun array_inv!29592 (array!80042) Bool)

(assert (=> start!104132 (array_inv!29592 a!3892)))

(assert (=> start!104132 true))

(declare-fun b!1244996 () Bool)

(declare-fun res!830558 () Bool)

(assert (=> b!1244996 (=> (not res!830558) (not e!705834))))

(declare-datatypes ((List!27513 0))(
  ( (Nil!27510) (Cons!27509 (h!28718 (_ BitVec 64)) (t!40973 List!27513)) )
))
(declare-fun arrayNoDuplicates!0 (array!80042 (_ BitVec 32) List!27513) Bool)

(assert (=> b!1244996 (= res!830558 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27510))))

(declare-fun b!1244997 () Bool)

(declare-fun res!830559 () Bool)

(assert (=> b!1244997 (=> (not res!830559) (not e!705834))))

(assert (=> b!1244997 (= res!830559 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244998 () Bool)

(declare-fun noDuplicate!2035 (List!27513) Bool)

(assert (=> b!1244998 (= e!705834 (not (noDuplicate!2035 Nil!27510)))))

(assert (= (and start!104132 res!830557) b!1244996))

(assert (= (and b!1244996 res!830558) b!1244997))

(assert (= (and b!1244997 res!830559) b!1244998))

(declare-fun m!1146705 () Bool)

(assert (=> start!104132 m!1146705))

(declare-fun m!1146707 () Bool)

(assert (=> b!1244996 m!1146707))

(declare-fun m!1146709 () Bool)

(assert (=> b!1244998 m!1146709))

(check-sat (not b!1244996) (not b!1244998) (not start!104132))
(check-sat)
(get-model)

(declare-fun b!1245042 () Bool)

(declare-fun e!705870 () Bool)

(declare-fun call!61443 () Bool)

(assert (=> b!1245042 (= e!705870 call!61443)))

(declare-fun c!121912 () Bool)

(declare-fun bm!61440 () Bool)

(assert (=> bm!61440 (= call!61443 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121912 (Cons!27509 (select (arr!38609 a!3892) from!3270) Nil!27510) Nil!27510)))))

(declare-fun d!137163 () Bool)

(declare-fun res!830594 () Bool)

(declare-fun e!705867 () Bool)

(assert (=> d!137163 (=> res!830594 e!705867)))

(assert (=> d!137163 (= res!830594 (bvsge from!3270 (size!39147 a!3892)))))

(assert (=> d!137163 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27510) e!705867)))

(declare-fun b!1245043 () Bool)

(declare-fun e!705869 () Bool)

(assert (=> b!1245043 (= e!705869 e!705870)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245043 (= c!121912 (validKeyInArray!0 (select (arr!38609 a!3892) from!3270)))))

(declare-fun b!1245044 () Bool)

(assert (=> b!1245044 (= e!705867 e!705869)))

(declare-fun res!830593 () Bool)

(assert (=> b!1245044 (=> (not res!830593) (not e!705869))))

(declare-fun e!705868 () Bool)

(assert (=> b!1245044 (= res!830593 (not e!705868))))

(declare-fun res!830595 () Bool)

(assert (=> b!1245044 (=> (not res!830595) (not e!705868))))

(assert (=> b!1245044 (= res!830595 (validKeyInArray!0 (select (arr!38609 a!3892) from!3270)))))

(declare-fun b!1245045 () Bool)

(declare-fun contains!7411 (List!27513 (_ BitVec 64)) Bool)

(assert (=> b!1245045 (= e!705868 (contains!7411 Nil!27510 (select (arr!38609 a!3892) from!3270)))))

(declare-fun b!1245046 () Bool)

(assert (=> b!1245046 (= e!705870 call!61443)))

(assert (= (and d!137163 (not res!830594)) b!1245044))

(assert (= (and b!1245044 res!830595) b!1245045))

(assert (= (and b!1245044 res!830593) b!1245043))

(assert (= (and b!1245043 c!121912) b!1245042))

(assert (= (and b!1245043 (not c!121912)) b!1245046))

(assert (= (or b!1245042 b!1245046) bm!61440))

(declare-fun m!1146731 () Bool)

(assert (=> bm!61440 m!1146731))

(declare-fun m!1146733 () Bool)

(assert (=> bm!61440 m!1146733))

(assert (=> b!1245043 m!1146731))

(assert (=> b!1245043 m!1146731))

(declare-fun m!1146735 () Bool)

(assert (=> b!1245043 m!1146735))

(assert (=> b!1245044 m!1146731))

(assert (=> b!1245044 m!1146731))

(assert (=> b!1245044 m!1146735))

(assert (=> b!1245045 m!1146731))

(assert (=> b!1245045 m!1146731))

(declare-fun m!1146737 () Bool)

(assert (=> b!1245045 m!1146737))

(assert (=> b!1244996 d!137163))

(declare-fun d!137171 () Bool)

(declare-fun res!830612 () Bool)

(declare-fun e!705889 () Bool)

(assert (=> d!137171 (=> res!830612 e!705889)))

(get-info :version)

(assert (=> d!137171 (= res!830612 ((_ is Nil!27510) Nil!27510))))

(assert (=> d!137171 (= (noDuplicate!2035 Nil!27510) e!705889)))

(declare-fun b!1245067 () Bool)

(declare-fun e!705890 () Bool)

(assert (=> b!1245067 (= e!705889 e!705890)))

(declare-fun res!830613 () Bool)

(assert (=> b!1245067 (=> (not res!830613) (not e!705890))))

(assert (=> b!1245067 (= res!830613 (not (contains!7411 (t!40973 Nil!27510) (h!28718 Nil!27510))))))

(declare-fun b!1245068 () Bool)

(assert (=> b!1245068 (= e!705890 (noDuplicate!2035 (t!40973 Nil!27510)))))

(assert (= (and d!137171 (not res!830612)) b!1245067))

(assert (= (and b!1245067 res!830613) b!1245068))

(declare-fun m!1146743 () Bool)

(assert (=> b!1245067 m!1146743))

(declare-fun m!1146745 () Bool)

(assert (=> b!1245068 m!1146745))

(assert (=> b!1244998 d!137171))

(declare-fun d!137173 () Bool)

(assert (=> d!137173 (= (array_inv!29592 a!3892) (bvsge (size!39147 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104132 d!137173))

(check-sat (not b!1245068) (not b!1245043) (not b!1245045) (not bm!61440) (not b!1245044) (not b!1245067))
(check-sat)
