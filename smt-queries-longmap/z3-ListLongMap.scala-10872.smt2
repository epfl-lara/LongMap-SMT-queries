; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127460 () Bool)

(assert start!127460)

(declare-fun b!1497925 () Bool)

(declare-fun res!1019023 () Bool)

(declare-fun e!838793 () Bool)

(assert (=> b!1497925 (=> (not res!1019023) (not e!838793))))

(declare-datatypes ((array!99874 0))(
  ( (array!99875 (arr!48198 (Array (_ BitVec 32) (_ BitVec 64))) (size!48748 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99874)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497925 (= res!1019023 (validKeyInArray!0 (select (arr!48198 a!2850) i!996)))))

(declare-fun b!1497926 () Bool)

(declare-fun e!838794 () Bool)

(declare-datatypes ((List!34690 0))(
  ( (Nil!34687) (Cons!34686 (h!36083 (_ BitVec 64)) (t!49384 List!34690)) )
))
(declare-fun contains!9939 (List!34690 (_ BitVec 64)) Bool)

(assert (=> b!1497926 (= e!838794 (contains!9939 Nil!34687 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497927 () Bool)

(declare-fun res!1019024 () Bool)

(assert (=> b!1497927 (=> (not res!1019024) (not e!838793))))

(assert (=> b!1497927 (= res!1019024 (and (bvsle #b00000000000000000000000000000000 (size!48748 a!2850)) (bvslt (size!48748 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1497928 () Bool)

(assert (=> b!1497928 (= e!838793 e!838794)))

(declare-fun res!1019022 () Bool)

(assert (=> b!1497928 (=> res!1019022 e!838794)))

(assert (=> b!1497928 (= res!1019022 (contains!9939 Nil!34687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1019021 () Bool)

(assert (=> start!127460 (=> (not res!1019021) (not e!838793))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127460 (= res!1019021 (validMask!0 mask!2661))))

(assert (=> start!127460 e!838793))

(assert (=> start!127460 true))

(declare-fun array_inv!37226 (array!99874) Bool)

(assert (=> start!127460 (array_inv!37226 a!2850)))

(declare-fun b!1497929 () Bool)

(declare-fun res!1019026 () Bool)

(assert (=> b!1497929 (=> (not res!1019026) (not e!838793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99874 (_ BitVec 32)) Bool)

(assert (=> b!1497929 (= res!1019026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497930 () Bool)

(declare-fun res!1019019 () Bool)

(assert (=> b!1497930 (=> (not res!1019019) (not e!838793))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497930 (= res!1019019 (validKeyInArray!0 (select (arr!48198 a!2850) j!87)))))

(declare-fun b!1497931 () Bool)

(declare-fun res!1019025 () Bool)

(assert (=> b!1497931 (=> (not res!1019025) (not e!838793))))

(declare-fun noDuplicate!2622 (List!34690) Bool)

(assert (=> b!1497931 (= res!1019025 (noDuplicate!2622 Nil!34687))))

(declare-fun b!1497932 () Bool)

(declare-fun res!1019020 () Bool)

(assert (=> b!1497932 (=> (not res!1019020) (not e!838793))))

(assert (=> b!1497932 (= res!1019020 (and (= (size!48748 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48748 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48748 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127460 res!1019021) b!1497932))

(assert (= (and b!1497932 res!1019020) b!1497925))

(assert (= (and b!1497925 res!1019023) b!1497930))

(assert (= (and b!1497930 res!1019019) b!1497929))

(assert (= (and b!1497929 res!1019026) b!1497927))

(assert (= (and b!1497927 res!1019024) b!1497931))

(assert (= (and b!1497931 res!1019025) b!1497928))

(assert (= (and b!1497928 (not res!1019022)) b!1497926))

(declare-fun m!1380987 () Bool)

(assert (=> b!1497925 m!1380987))

(assert (=> b!1497925 m!1380987))

(declare-fun m!1380989 () Bool)

(assert (=> b!1497925 m!1380989))

(declare-fun m!1380991 () Bool)

(assert (=> b!1497926 m!1380991))

(declare-fun m!1380993 () Bool)

(assert (=> b!1497929 m!1380993))

(declare-fun m!1380995 () Bool)

(assert (=> b!1497931 m!1380995))

(declare-fun m!1380997 () Bool)

(assert (=> b!1497928 m!1380997))

(declare-fun m!1380999 () Bool)

(assert (=> b!1497930 m!1380999))

(assert (=> b!1497930 m!1380999))

(declare-fun m!1381001 () Bool)

(assert (=> b!1497930 m!1381001))

(declare-fun m!1381003 () Bool)

(assert (=> start!127460 m!1381003))

(declare-fun m!1381005 () Bool)

(assert (=> start!127460 m!1381005))

(check-sat (not b!1497930) (not b!1497925) (not b!1497926) (not b!1497928) (not start!127460) (not b!1497929) (not b!1497931))
(check-sat)
(get-model)

(declare-fun d!157499 () Bool)

(declare-fun lt!652561 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!782 (List!34690) (InoxSet (_ BitVec 64)))

(assert (=> d!157499 (= lt!652561 (select (content!782 Nil!34687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838810 () Bool)

(assert (=> d!157499 (= lt!652561 e!838810)))

(declare-fun res!1019056 () Bool)

(assert (=> d!157499 (=> (not res!1019056) (not e!838810))))

(get-info :version)

(assert (=> d!157499 (= res!1019056 ((_ is Cons!34686) Nil!34687))))

(assert (=> d!157499 (= (contains!9939 Nil!34687 #b0000000000000000000000000000000000000000000000000000000000000000) lt!652561)))

(declare-fun b!1497961 () Bool)

(declare-fun e!838809 () Bool)

(assert (=> b!1497961 (= e!838810 e!838809)))

(declare-fun res!1019055 () Bool)

(assert (=> b!1497961 (=> res!1019055 e!838809)))

(assert (=> b!1497961 (= res!1019055 (= (h!36083 Nil!34687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497962 () Bool)

(assert (=> b!1497962 (= e!838809 (contains!9939 (t!49384 Nil!34687) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157499 res!1019056) b!1497961))

(assert (= (and b!1497961 (not res!1019055)) b!1497962))

(declare-fun m!1381027 () Bool)

(assert (=> d!157499 m!1381027))

(declare-fun m!1381029 () Bool)

(assert (=> d!157499 m!1381029))

(declare-fun m!1381031 () Bool)

(assert (=> b!1497962 m!1381031))

(assert (=> b!1497928 d!157499))

(declare-fun d!157503 () Bool)

(assert (=> d!157503 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127460 d!157503))

(declare-fun d!157514 () Bool)

(assert (=> d!157514 (= (array_inv!37226 a!2850) (bvsge (size!48748 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127460 d!157514))

(declare-fun b!1498011 () Bool)

(declare-fun e!838854 () Bool)

(declare-fun call!68064 () Bool)

(assert (=> b!1498011 (= e!838854 call!68064)))

(declare-fun d!157522 () Bool)

(declare-fun res!1019095 () Bool)

(declare-fun e!838856 () Bool)

(assert (=> d!157522 (=> res!1019095 e!838856)))

(assert (=> d!157522 (= res!1019095 (bvsge #b00000000000000000000000000000000 (size!48748 a!2850)))))

(assert (=> d!157522 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838856)))

(declare-fun bm!68061 () Bool)

(assert (=> bm!68061 (= call!68064 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1498012 () Bool)

(declare-fun e!838855 () Bool)

(assert (=> b!1498012 (= e!838856 e!838855)))

(declare-fun c!138992 () Bool)

(assert (=> b!1498012 (= c!138992 (validKeyInArray!0 (select (arr!48198 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1498013 () Bool)

(assert (=> b!1498013 (= e!838855 call!68064)))

(declare-fun b!1498014 () Bool)

(assert (=> b!1498014 (= e!838855 e!838854)))

(declare-fun lt!652585 () (_ BitVec 64))

(assert (=> b!1498014 (= lt!652585 (select (arr!48198 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50202 0))(
  ( (Unit!50203) )
))
(declare-fun lt!652587 () Unit!50202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99874 (_ BitVec 64) (_ BitVec 32)) Unit!50202)

(assert (=> b!1498014 (= lt!652587 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652585 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1498014 (arrayContainsKey!0 a!2850 lt!652585 #b00000000000000000000000000000000)))

(declare-fun lt!652586 () Unit!50202)

(assert (=> b!1498014 (= lt!652586 lt!652587)))

(declare-fun res!1019096 () Bool)

(declare-datatypes ((SeekEntryResult!12431 0))(
  ( (MissingZero!12431 (index!52116 (_ BitVec 32))) (Found!12431 (index!52117 (_ BitVec 32))) (Intermediate!12431 (undefined!13243 Bool) (index!52118 (_ BitVec 32)) (x!133753 (_ BitVec 32))) (Undefined!12431) (MissingVacant!12431 (index!52119 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99874 (_ BitVec 32)) SeekEntryResult!12431)

(assert (=> b!1498014 (= res!1019096 (= (seekEntryOrOpen!0 (select (arr!48198 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12431 #b00000000000000000000000000000000)))))

(assert (=> b!1498014 (=> (not res!1019096) (not e!838854))))

(assert (= (and d!157522 (not res!1019095)) b!1498012))

(assert (= (and b!1498012 c!138992) b!1498014))

(assert (= (and b!1498012 (not c!138992)) b!1498013))

(assert (= (and b!1498014 res!1019096) b!1498011))

(assert (= (or b!1498011 b!1498013) bm!68061))

(declare-fun m!1381073 () Bool)

(assert (=> bm!68061 m!1381073))

(declare-fun m!1381075 () Bool)

(assert (=> b!1498012 m!1381075))

(assert (=> b!1498012 m!1381075))

(declare-fun m!1381077 () Bool)

(assert (=> b!1498012 m!1381077))

(assert (=> b!1498014 m!1381075))

(declare-fun m!1381079 () Bool)

(assert (=> b!1498014 m!1381079))

(declare-fun m!1381081 () Bool)

(assert (=> b!1498014 m!1381081))

(assert (=> b!1498014 m!1381075))

(declare-fun m!1381083 () Bool)

(assert (=> b!1498014 m!1381083))

(assert (=> b!1497929 d!157522))

(declare-fun d!157537 () Bool)

(assert (=> d!157537 (= (validKeyInArray!0 (select (arr!48198 a!2850) j!87)) (and (not (= (select (arr!48198 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48198 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497930 d!157537))

(declare-fun d!157539 () Bool)

(assert (=> d!157539 (= (validKeyInArray!0 (select (arr!48198 a!2850) i!996)) (and (not (= (select (arr!48198 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48198 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497925 d!157539))

(declare-fun d!157541 () Bool)

(declare-fun lt!652588 () Bool)

(assert (=> d!157541 (= lt!652588 (select (content!782 Nil!34687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838858 () Bool)

(assert (=> d!157541 (= lt!652588 e!838858)))

(declare-fun res!1019098 () Bool)

(assert (=> d!157541 (=> (not res!1019098) (not e!838858))))

(assert (=> d!157541 (= res!1019098 ((_ is Cons!34686) Nil!34687))))

(assert (=> d!157541 (= (contains!9939 Nil!34687 #b1000000000000000000000000000000000000000000000000000000000000000) lt!652588)))

(declare-fun b!1498015 () Bool)

(declare-fun e!838857 () Bool)

(assert (=> b!1498015 (= e!838858 e!838857)))

(declare-fun res!1019097 () Bool)

(assert (=> b!1498015 (=> res!1019097 e!838857)))

(assert (=> b!1498015 (= res!1019097 (= (h!36083 Nil!34687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1498016 () Bool)

(assert (=> b!1498016 (= e!838857 (contains!9939 (t!49384 Nil!34687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157541 res!1019098) b!1498015))

(assert (= (and b!1498015 (not res!1019097)) b!1498016))

(assert (=> d!157541 m!1381027))

(declare-fun m!1381085 () Bool)

(assert (=> d!157541 m!1381085))

(declare-fun m!1381087 () Bool)

(assert (=> b!1498016 m!1381087))

(assert (=> b!1497926 d!157541))

(declare-fun d!157543 () Bool)

(declare-fun res!1019105 () Bool)

(declare-fun e!838867 () Bool)

(assert (=> d!157543 (=> res!1019105 e!838867)))

(assert (=> d!157543 (= res!1019105 ((_ is Nil!34687) Nil!34687))))

(assert (=> d!157543 (= (noDuplicate!2622 Nil!34687) e!838867)))

(declare-fun b!1498027 () Bool)

(declare-fun e!838868 () Bool)

(assert (=> b!1498027 (= e!838867 e!838868)))

(declare-fun res!1019106 () Bool)

(assert (=> b!1498027 (=> (not res!1019106) (not e!838868))))

(assert (=> b!1498027 (= res!1019106 (not (contains!9939 (t!49384 Nil!34687) (h!36083 Nil!34687))))))

(declare-fun b!1498028 () Bool)

(assert (=> b!1498028 (= e!838868 (noDuplicate!2622 (t!49384 Nil!34687)))))

(assert (= (and d!157543 (not res!1019105)) b!1498027))

(assert (= (and b!1498027 res!1019106) b!1498028))

(declare-fun m!1381089 () Bool)

(assert (=> b!1498027 m!1381089))

(declare-fun m!1381091 () Bool)

(assert (=> b!1498028 m!1381091))

(assert (=> b!1497931 d!157543))

(check-sat (not b!1498028) (not b!1498014) (not bm!68061) (not b!1498016) (not b!1498027) (not b!1498012) (not d!157541) (not b!1497962) (not d!157499))
(check-sat)
