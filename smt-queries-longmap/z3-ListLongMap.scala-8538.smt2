; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104156 () Bool)

(assert start!104156)

(declare-fun b!1245090 () Bool)

(declare-fun res!830635 () Bool)

(declare-fun e!705908 () Bool)

(assert (=> b!1245090 (=> (not res!830635) (not e!705908))))

(declare-datatypes ((List!27516 0))(
  ( (Nil!27513) (Cons!27512 (h!28721 (_ BitVec 64)) (t!40976 List!27516)) )
))
(declare-fun noDuplicate!2038 (List!27516) Bool)

(assert (=> b!1245090 (= res!830635 (noDuplicate!2038 Nil!27513))))

(declare-fun b!1245091 () Bool)

(declare-fun res!830636 () Bool)

(assert (=> b!1245091 (=> (not res!830636) (not e!705908))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245091 (= res!830636 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245092 () Bool)

(declare-fun e!705907 () Bool)

(declare-fun contains!7413 (List!27516 (_ BitVec 64)) Bool)

(assert (=> b!1245092 (= e!705907 (contains!7413 Nil!27513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245093 () Bool)

(declare-fun res!830637 () Bool)

(assert (=> b!1245093 (=> (not res!830637) (not e!705908))))

(declare-datatypes ((array!80051 0))(
  ( (array!80052 (arr!38612 (Array (_ BitVec 32) (_ BitVec 64))) (size!39150 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80051)

(declare-fun arrayNoDuplicates!0 (array!80051 (_ BitVec 32) List!27516) Bool)

(assert (=> b!1245093 (= res!830637 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27513))))

(declare-fun b!1245094 () Bool)

(assert (=> b!1245094 (= e!705908 e!705907)))

(declare-fun res!830634 () Bool)

(assert (=> b!1245094 (=> res!830634 e!705907)))

(assert (=> b!1245094 (= res!830634 (contains!7413 Nil!27513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!830633 () Bool)

(assert (=> start!104156 (=> (not res!830633) (not e!705908))))

(assert (=> start!104156 (= res!830633 (and (bvslt (size!39150 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39150 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39150 a!3892))))))

(assert (=> start!104156 e!705908))

(declare-fun array_inv!29595 (array!80051) Bool)

(assert (=> start!104156 (array_inv!29595 a!3892)))

(assert (=> start!104156 true))

(assert (= (and start!104156 res!830633) b!1245093))

(assert (= (and b!1245093 res!830637) b!1245091))

(assert (= (and b!1245091 res!830636) b!1245090))

(assert (= (and b!1245090 res!830635) b!1245094))

(assert (= (and b!1245094 (not res!830634)) b!1245092))

(declare-fun m!1146759 () Bool)

(assert (=> b!1245090 m!1146759))

(declare-fun m!1146761 () Bool)

(assert (=> b!1245092 m!1146761))

(declare-fun m!1146763 () Bool)

(assert (=> start!104156 m!1146763))

(declare-fun m!1146765 () Bool)

(assert (=> b!1245093 m!1146765))

(declare-fun m!1146767 () Bool)

(assert (=> b!1245094 m!1146767))

(check-sat (not b!1245093) (not b!1245090) (not start!104156) (not b!1245094) (not b!1245092))
(check-sat)
(get-model)

(declare-fun d!137179 () Bool)

(assert (=> d!137179 (= (array_inv!29595 a!3892) (bvsge (size!39150 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104156 d!137179))

(declare-fun d!137183 () Bool)

(declare-fun lt!562692 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!615 (List!27516) (InoxSet (_ BitVec 64)))

(assert (=> d!137183 (= lt!562692 (select (content!615 Nil!27513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705940 () Bool)

(assert (=> d!137183 (= lt!562692 e!705940)))

(declare-fun res!830678 () Bool)

(assert (=> d!137183 (=> (not res!830678) (not e!705940))))

(get-info :version)

(assert (=> d!137183 (= res!830678 ((_ is Cons!27512) Nil!27513))))

(assert (=> d!137183 (= (contains!7413 Nil!27513 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562692)))

(declare-fun b!1245139 () Bool)

(declare-fun e!705941 () Bool)

(assert (=> b!1245139 (= e!705940 e!705941)))

(declare-fun res!830679 () Bool)

(assert (=> b!1245139 (=> res!830679 e!705941)))

(assert (=> b!1245139 (= res!830679 (= (h!28721 Nil!27513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245140 () Bool)

(assert (=> b!1245140 (= e!705941 (contains!7413 (t!40976 Nil!27513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137183 res!830678) b!1245139))

(assert (= (and b!1245139 (not res!830679)) b!1245140))

(declare-fun m!1146789 () Bool)

(assert (=> d!137183 m!1146789))

(declare-fun m!1146791 () Bool)

(assert (=> d!137183 m!1146791))

(declare-fun m!1146793 () Bool)

(assert (=> b!1245140 m!1146793))

(assert (=> b!1245092 d!137183))

(declare-fun b!1245177 () Bool)

(declare-fun e!705972 () Bool)

(declare-fun call!61455 () Bool)

(assert (=> b!1245177 (= e!705972 call!61455)))

(declare-fun b!1245178 () Bool)

(declare-fun e!705973 () Bool)

(assert (=> b!1245178 (= e!705973 e!705972)))

(declare-fun c!121924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245178 (= c!121924 (validKeyInArray!0 (select (arr!38612 a!3892) from!3270)))))

(declare-fun d!137187 () Bool)

(declare-fun res!830705 () Bool)

(declare-fun e!705974 () Bool)

(assert (=> d!137187 (=> res!830705 e!705974)))

(assert (=> d!137187 (= res!830705 (bvsge from!3270 (size!39150 a!3892)))))

(assert (=> d!137187 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27513) e!705974)))

(declare-fun b!1245179 () Bool)

(declare-fun e!705975 () Bool)

(assert (=> b!1245179 (= e!705975 (contains!7413 Nil!27513 (select (arr!38612 a!3892) from!3270)))))

(declare-fun b!1245180 () Bool)

(assert (=> b!1245180 (= e!705974 e!705973)))

(declare-fun res!830704 () Bool)

(assert (=> b!1245180 (=> (not res!830704) (not e!705973))))

(assert (=> b!1245180 (= res!830704 (not e!705975))))

(declare-fun res!830706 () Bool)

(assert (=> b!1245180 (=> (not res!830706) (not e!705975))))

(assert (=> b!1245180 (= res!830706 (validKeyInArray!0 (select (arr!38612 a!3892) from!3270)))))

(declare-fun bm!61452 () Bool)

(assert (=> bm!61452 (= call!61455 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121924 (Cons!27512 (select (arr!38612 a!3892) from!3270) Nil!27513) Nil!27513)))))

(declare-fun b!1245181 () Bool)

(assert (=> b!1245181 (= e!705972 call!61455)))

(assert (= (and d!137187 (not res!830705)) b!1245180))

(assert (= (and b!1245180 res!830706) b!1245179))

(assert (= (and b!1245180 res!830704) b!1245178))

(assert (= (and b!1245178 c!121924) b!1245177))

(assert (= (and b!1245178 (not c!121924)) b!1245181))

(assert (= (or b!1245177 b!1245181) bm!61452))

(declare-fun m!1146815 () Bool)

(assert (=> b!1245178 m!1146815))

(assert (=> b!1245178 m!1146815))

(declare-fun m!1146817 () Bool)

(assert (=> b!1245178 m!1146817))

(assert (=> b!1245179 m!1146815))

(assert (=> b!1245179 m!1146815))

(declare-fun m!1146819 () Bool)

(assert (=> b!1245179 m!1146819))

(assert (=> b!1245180 m!1146815))

(assert (=> b!1245180 m!1146815))

(assert (=> b!1245180 m!1146817))

(assert (=> bm!61452 m!1146815))

(declare-fun m!1146821 () Bool)

(assert (=> bm!61452 m!1146821))

(assert (=> b!1245093 d!137187))

(declare-fun d!137197 () Bool)

(declare-fun lt!562693 () Bool)

(assert (=> d!137197 (= lt!562693 (select (content!615 Nil!27513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705976 () Bool)

(assert (=> d!137197 (= lt!562693 e!705976)))

(declare-fun res!830707 () Bool)

(assert (=> d!137197 (=> (not res!830707) (not e!705976))))

(assert (=> d!137197 (= res!830707 ((_ is Cons!27512) Nil!27513))))

(assert (=> d!137197 (= (contains!7413 Nil!27513 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562693)))

(declare-fun b!1245182 () Bool)

(declare-fun e!705977 () Bool)

(assert (=> b!1245182 (= e!705976 e!705977)))

(declare-fun res!830708 () Bool)

(assert (=> b!1245182 (=> res!830708 e!705977)))

(assert (=> b!1245182 (= res!830708 (= (h!28721 Nil!27513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245183 () Bool)

(assert (=> b!1245183 (= e!705977 (contains!7413 (t!40976 Nil!27513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137197 res!830707) b!1245182))

(assert (= (and b!1245182 (not res!830708)) b!1245183))

(assert (=> d!137197 m!1146789))

(declare-fun m!1146823 () Bool)

(assert (=> d!137197 m!1146823))

(declare-fun m!1146825 () Bool)

(assert (=> b!1245183 m!1146825))

(assert (=> b!1245094 d!137197))

(declare-fun d!137199 () Bool)

(declare-fun res!830727 () Bool)

(declare-fun e!705996 () Bool)

(assert (=> d!137199 (=> res!830727 e!705996)))

(assert (=> d!137199 (= res!830727 ((_ is Nil!27513) Nil!27513))))

(assert (=> d!137199 (= (noDuplicate!2038 Nil!27513) e!705996)))

(declare-fun b!1245202 () Bool)

(declare-fun e!705997 () Bool)

(assert (=> b!1245202 (= e!705996 e!705997)))

(declare-fun res!830728 () Bool)

(assert (=> b!1245202 (=> (not res!830728) (not e!705997))))

(assert (=> b!1245202 (= res!830728 (not (contains!7413 (t!40976 Nil!27513) (h!28721 Nil!27513))))))

(declare-fun b!1245203 () Bool)

(assert (=> b!1245203 (= e!705997 (noDuplicate!2038 (t!40976 Nil!27513)))))

(assert (= (and d!137199 (not res!830727)) b!1245202))

(assert (= (and b!1245202 res!830728) b!1245203))

(declare-fun m!1146843 () Bool)

(assert (=> b!1245202 m!1146843))

(declare-fun m!1146845 () Bool)

(assert (=> b!1245203 m!1146845))

(assert (=> b!1245090 d!137199))

(check-sat (not b!1245202) (not b!1245179) (not b!1245203) (not d!137183) (not d!137197) (not b!1245183) (not b!1245178) (not b!1245140) (not b!1245180) (not bm!61452))
(check-sat)
