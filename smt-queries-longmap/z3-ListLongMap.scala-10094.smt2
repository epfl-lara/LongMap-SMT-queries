; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118988 () Bool)

(assert start!118988)

(declare-fun b!1388884 () Bool)

(declare-fun e!786773 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1388884 (= e!786773 (and (bvsge mask!2840 #b00000000000000000000000000000000) (bvsgt mask!2840 #b00111111111111111111111111111111)))))

(declare-fun res!929169 () Bool)

(assert (=> start!118988 (=> (not res!929169) (not e!786773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118988 (= res!929169 (validMask!0 mask!2840))))

(assert (=> start!118988 e!786773))

(assert (=> start!118988 true))

(declare-datatypes ((array!94938 0))(
  ( (array!94939 (arr!45838 (Array (_ BitVec 32) (_ BitVec 64))) (size!46390 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94938)

(declare-fun array_inv!35071 (array!94938) Bool)

(assert (=> start!118988 (array_inv!35071 a!2901)))

(declare-fun b!1388885 () Bool)

(declare-fun res!929168 () Bool)

(assert (=> b!1388885 (=> (not res!929168) (not e!786773))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388885 (= res!929168 (and (= (size!46390 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46390 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46390 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388886 () Bool)

(declare-fun res!929167 () Bool)

(assert (=> b!1388886 (=> (not res!929167) (not e!786773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388886 (= res!929167 (validKeyInArray!0 (select (arr!45838 a!2901) j!112)))))

(declare-fun b!1388887 () Bool)

(declare-fun res!929170 () Bool)

(assert (=> b!1388887 (=> (not res!929170) (not e!786773))))

(declare-datatypes ((List!32435 0))(
  ( (Nil!32432) (Cons!32431 (h!33646 (_ BitVec 64)) (t!47121 List!32435)) )
))
(declare-fun arrayNoDuplicates!0 (array!94938 (_ BitVec 32) List!32435) Bool)

(assert (=> b!1388887 (= res!929170 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32432))))

(declare-fun b!1388888 () Bool)

(declare-fun res!929166 () Bool)

(assert (=> b!1388888 (=> (not res!929166) (not e!786773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94938 (_ BitVec 32)) Bool)

(assert (=> b!1388888 (= res!929166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388889 () Bool)

(declare-fun res!929165 () Bool)

(assert (=> b!1388889 (=> (not res!929165) (not e!786773))))

(assert (=> b!1388889 (= res!929165 (validKeyInArray!0 (select (arr!45838 a!2901) i!1037)))))

(assert (= (and start!118988 res!929169) b!1388885))

(assert (= (and b!1388885 res!929168) b!1388889))

(assert (= (and b!1388889 res!929165) b!1388886))

(assert (= (and b!1388886 res!929167) b!1388888))

(assert (= (and b!1388888 res!929166) b!1388887))

(assert (= (and b!1388887 res!929170) b!1388884))

(declare-fun m!1274143 () Bool)

(assert (=> b!1388887 m!1274143))

(declare-fun m!1274145 () Bool)

(assert (=> b!1388886 m!1274145))

(assert (=> b!1388886 m!1274145))

(declare-fun m!1274147 () Bool)

(assert (=> b!1388886 m!1274147))

(declare-fun m!1274149 () Bool)

(assert (=> start!118988 m!1274149))

(declare-fun m!1274151 () Bool)

(assert (=> start!118988 m!1274151))

(declare-fun m!1274153 () Bool)

(assert (=> b!1388889 m!1274153))

(assert (=> b!1388889 m!1274153))

(declare-fun m!1274155 () Bool)

(assert (=> b!1388889 m!1274155))

(declare-fun m!1274157 () Bool)

(assert (=> b!1388888 m!1274157))

(check-sat (not b!1388887) (not b!1388886) (not b!1388888) (not start!118988) (not b!1388889))
(check-sat)
(get-model)

(declare-fun d!149945 () Bool)

(assert (=> d!149945 (= (validKeyInArray!0 (select (arr!45838 a!2901) i!1037)) (and (not (= (select (arr!45838 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388889 d!149945))

(declare-fun b!1388934 () Bool)

(declare-fun e!786794 () Bool)

(declare-fun e!786793 () Bool)

(assert (=> b!1388934 (= e!786794 e!786793)))

(declare-fun c!129307 () Bool)

(assert (=> b!1388934 (= c!129307 (validKeyInArray!0 (select (arr!45838 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388935 () Bool)

(declare-fun call!66644 () Bool)

(assert (=> b!1388935 (= e!786793 call!66644)))

(declare-fun b!1388936 () Bool)

(declare-fun e!786792 () Bool)

(assert (=> b!1388936 (= e!786792 call!66644)))

(declare-fun b!1388937 () Bool)

(assert (=> b!1388937 (= e!786793 e!786792)))

(declare-fun lt!610266 () (_ BitVec 64))

(assert (=> b!1388937 (= lt!610266 (select (arr!45838 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46269 0))(
  ( (Unit!46270) )
))
(declare-fun lt!610268 () Unit!46269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94938 (_ BitVec 64) (_ BitVec 32)) Unit!46269)

(assert (=> b!1388937 (= lt!610268 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610266 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388937 (arrayContainsKey!0 a!2901 lt!610266 #b00000000000000000000000000000000)))

(declare-fun lt!610267 () Unit!46269)

(assert (=> b!1388937 (= lt!610267 lt!610268)))

(declare-fun res!929212 () Bool)

(declare-datatypes ((SeekEntryResult!10196 0))(
  ( (MissingZero!10196 (index!43155 (_ BitVec 32))) (Found!10196 (index!43156 (_ BitVec 32))) (Intermediate!10196 (undefined!11008 Bool) (index!43157 (_ BitVec 32)) (x!124804 (_ BitVec 32))) (Undefined!10196) (MissingVacant!10196 (index!43158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94938 (_ BitVec 32)) SeekEntryResult!10196)

(assert (=> b!1388937 (= res!929212 (= (seekEntryOrOpen!0 (select (arr!45838 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10196 #b00000000000000000000000000000000)))))

(assert (=> b!1388937 (=> (not res!929212) (not e!786792))))

(declare-fun bm!66641 () Bool)

(assert (=> bm!66641 (= call!66644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!149947 () Bool)

(declare-fun res!929211 () Bool)

(assert (=> d!149947 (=> res!929211 e!786794)))

(assert (=> d!149947 (= res!929211 (bvsge #b00000000000000000000000000000000 (size!46390 a!2901)))))

(assert (=> d!149947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786794)))

(assert (= (and d!149947 (not res!929211)) b!1388934))

(assert (= (and b!1388934 c!129307) b!1388937))

(assert (= (and b!1388934 (not c!129307)) b!1388935))

(assert (= (and b!1388937 res!929212) b!1388936))

(assert (= (or b!1388936 b!1388935) bm!66641))

(declare-fun m!1274191 () Bool)

(assert (=> b!1388934 m!1274191))

(assert (=> b!1388934 m!1274191))

(declare-fun m!1274193 () Bool)

(assert (=> b!1388934 m!1274193))

(assert (=> b!1388937 m!1274191))

(declare-fun m!1274195 () Bool)

(assert (=> b!1388937 m!1274195))

(declare-fun m!1274197 () Bool)

(assert (=> b!1388937 m!1274197))

(assert (=> b!1388937 m!1274191))

(declare-fun m!1274199 () Bool)

(assert (=> b!1388937 m!1274199))

(declare-fun m!1274201 () Bool)

(assert (=> bm!66641 m!1274201))

(assert (=> b!1388888 d!149947))

(declare-fun b!1388968 () Bool)

(declare-fun e!786820 () Bool)

(declare-fun call!66652 () Bool)

(assert (=> b!1388968 (= e!786820 call!66652)))

(declare-fun b!1388969 () Bool)

(declare-fun e!786821 () Bool)

(declare-fun e!786818 () Bool)

(assert (=> b!1388969 (= e!786821 e!786818)))

(declare-fun res!929230 () Bool)

(assert (=> b!1388969 (=> (not res!929230) (not e!786818))))

(declare-fun e!786819 () Bool)

(assert (=> b!1388969 (= res!929230 (not e!786819))))

(declare-fun res!929231 () Bool)

(assert (=> b!1388969 (=> (not res!929231) (not e!786819))))

(assert (=> b!1388969 (= res!929231 (validKeyInArray!0 (select (arr!45838 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!149959 () Bool)

(declare-fun res!929229 () Bool)

(assert (=> d!149959 (=> res!929229 e!786821)))

(assert (=> d!149959 (= res!929229 (bvsge #b00000000000000000000000000000000 (size!46390 a!2901)))))

(assert (=> d!149959 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32432) e!786821)))

(declare-fun bm!66649 () Bool)

(declare-fun c!129315 () Bool)

(assert (=> bm!66649 (= call!66652 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129315 (Cons!32431 (select (arr!45838 a!2901) #b00000000000000000000000000000000) Nil!32432) Nil!32432)))))

(declare-fun b!1388970 () Bool)

(assert (=> b!1388970 (= e!786820 call!66652)))

(declare-fun b!1388971 () Bool)

(assert (=> b!1388971 (= e!786818 e!786820)))

(assert (=> b!1388971 (= c!129315 (validKeyInArray!0 (select (arr!45838 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388972 () Bool)

(declare-fun contains!9717 (List!32435 (_ BitVec 64)) Bool)

(assert (=> b!1388972 (= e!786819 (contains!9717 Nil!32432 (select (arr!45838 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!149959 (not res!929229)) b!1388969))

(assert (= (and b!1388969 res!929231) b!1388972))

(assert (= (and b!1388969 res!929230) b!1388971))

(assert (= (and b!1388971 c!129315) b!1388968))

(assert (= (and b!1388971 (not c!129315)) b!1388970))

(assert (= (or b!1388968 b!1388970) bm!66649))

(assert (=> b!1388969 m!1274191))

(assert (=> b!1388969 m!1274191))

(assert (=> b!1388969 m!1274193))

(assert (=> bm!66649 m!1274191))

(declare-fun m!1274215 () Bool)

(assert (=> bm!66649 m!1274215))

(assert (=> b!1388971 m!1274191))

(assert (=> b!1388971 m!1274191))

(assert (=> b!1388971 m!1274193))

(assert (=> b!1388972 m!1274191))

(assert (=> b!1388972 m!1274191))

(declare-fun m!1274217 () Bool)

(assert (=> b!1388972 m!1274217))

(assert (=> b!1388887 d!149959))

(declare-fun d!149963 () Bool)

(assert (=> d!149963 (= (validKeyInArray!0 (select (arr!45838 a!2901) j!112)) (and (not (= (select (arr!45838 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388886 d!149963))

(declare-fun d!149965 () Bool)

(assert (=> d!149965 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118988 d!149965))

(declare-fun d!149971 () Bool)

(assert (=> d!149971 (= (array_inv!35071 a!2901) (bvsge (size!46390 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118988 d!149971))

(check-sat (not b!1388972) (not bm!66641) (not bm!66649) (not b!1388934) (not b!1388969) (not b!1388937) (not b!1388971))
(check-sat)
