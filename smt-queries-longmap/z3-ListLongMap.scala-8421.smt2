; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102756 () Bool)

(assert start!102756)

(declare-fun b!1234135 () Bool)

(declare-fun res!821652 () Bool)

(declare-fun e!700151 () Bool)

(assert (=> b!1234135 (=> (not res!821652) (not e!700151))))

(declare-datatypes ((array!79532 0))(
  ( (array!79533 (arr!38372 (Array (_ BitVec 32) (_ BitVec 64))) (size!38909 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79532)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234135 (= res!821652 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234136 () Bool)

(declare-fun res!821647 () Bool)

(assert (=> b!1234136 (=> (not res!821647) (not e!700151))))

(declare-datatypes ((List!27158 0))(
  ( (Nil!27155) (Cons!27154 (h!28372 (_ BitVec 64)) (t!40613 List!27158)) )
))
(declare-fun acc!823 () List!27158)

(declare-fun contains!7229 (List!27158 (_ BitVec 64)) Bool)

(assert (=> b!1234136 (= res!821647 (not (contains!7229 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234137 () Bool)

(declare-fun res!821646 () Bool)

(assert (=> b!1234137 (=> (not res!821646) (not e!700151))))

(assert (=> b!1234137 (= res!821646 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38909 a!3806)) (bvslt from!3184 (size!38909 a!3806))))))

(declare-fun b!1234138 () Bool)

(declare-fun e!700150 () Bool)

(declare-fun e!700147 () Bool)

(assert (=> b!1234138 (= e!700150 e!700147)))

(declare-fun res!821653 () Bool)

(assert (=> b!1234138 (=> (not res!821653) (not e!700147))))

(declare-fun lt!560057 () List!27158)

(assert (=> b!1234138 (= res!821653 (not (contains!7229 lt!560057 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234139 () Bool)

(declare-fun res!821650 () Bool)

(assert (=> b!1234139 (=> (not res!821650) (not e!700151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234139 (= res!821650 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234140 () Bool)

(declare-fun res!821645 () Bool)

(assert (=> b!1234140 (=> (not res!821645) (not e!700151))))

(assert (=> b!1234140 (= res!821645 (validKeyInArray!0 k0!2913))))

(declare-fun b!1234141 () Bool)

(declare-fun res!821654 () Bool)

(assert (=> b!1234141 (=> (not res!821654) (not e!700151))))

(declare-fun noDuplicate!1810 (List!27158) Bool)

(assert (=> b!1234141 (= res!821654 (noDuplicate!1810 acc!823))))

(declare-fun b!1234142 () Bool)

(declare-fun res!821644 () Bool)

(assert (=> b!1234142 (=> res!821644 e!700150)))

(assert (=> b!1234142 (= res!821644 (not (noDuplicate!1810 lt!560057)))))

(declare-fun b!1234144 () Bool)

(assert (=> b!1234144 (= e!700147 (not (contains!7229 lt!560057 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234145 () Bool)

(declare-fun e!700148 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79532 (_ BitVec 32) List!27158) Bool)

(assert (=> b!1234145 (= e!700148 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)))))

(declare-fun b!1234146 () Bool)

(assert (=> b!1234146 (= e!700151 (not e!700150))))

(declare-fun res!821651 () Bool)

(assert (=> b!1234146 (=> res!821651 e!700150)))

(assert (=> b!1234146 (= res!821651 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1234146 (= lt!560057 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155))))

(assert (=> b!1234146 e!700148))

(declare-fun res!821648 () Bool)

(assert (=> b!1234146 (=> (not res!821648) (not e!700148))))

(assert (=> b!1234146 (= res!821648 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27155))))

(declare-datatypes ((Unit!40799 0))(
  ( (Unit!40800) )
))
(declare-fun lt!560058 () Unit!40799)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79532 List!27158 List!27158 (_ BitVec 32)) Unit!40799)

(assert (=> b!1234146 (= lt!560058 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27155 from!3184))))

(assert (=> b!1234146 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823))))

(declare-fun b!1234147 () Bool)

(declare-fun res!821643 () Bool)

(assert (=> b!1234147 (=> (not res!821643) (not e!700151))))

(assert (=> b!1234147 (= res!821643 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234143 () Bool)

(declare-fun res!821649 () Bool)

(assert (=> b!1234143 (=> (not res!821649) (not e!700151))))

(assert (=> b!1234143 (= res!821649 (not (contains!7229 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!821642 () Bool)

(assert (=> start!102756 (=> (not res!821642) (not e!700151))))

(assert (=> start!102756 (= res!821642 (bvslt (size!38909 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102756 e!700151))

(declare-fun array_inv!29310 (array!79532) Bool)

(assert (=> start!102756 (array_inv!29310 a!3806)))

(assert (=> start!102756 true))

(assert (= (and start!102756 res!821642) b!1234140))

(assert (= (and b!1234140 res!821645) b!1234137))

(assert (= (and b!1234137 res!821646) b!1234141))

(assert (= (and b!1234141 res!821654) b!1234143))

(assert (= (and b!1234143 res!821649) b!1234136))

(assert (= (and b!1234136 res!821647) b!1234135))

(assert (= (and b!1234135 res!821652) b!1234147))

(assert (= (and b!1234147 res!821643) b!1234139))

(assert (= (and b!1234139 res!821650) b!1234146))

(assert (= (and b!1234146 res!821648) b!1234145))

(assert (= (and b!1234146 (not res!821651)) b!1234142))

(assert (= (and b!1234142 (not res!821644)) b!1234138))

(assert (= (and b!1234138 res!821653) b!1234144))

(declare-fun m!1138497 () Bool)

(assert (=> b!1234143 m!1138497))

(declare-fun m!1138499 () Bool)

(assert (=> b!1234141 m!1138499))

(declare-fun m!1138501 () Bool)

(assert (=> b!1234136 m!1138501))

(declare-fun m!1138503 () Bool)

(assert (=> b!1234140 m!1138503))

(declare-fun m!1138505 () Bool)

(assert (=> b!1234142 m!1138505))

(declare-fun m!1138507 () Bool)

(assert (=> start!102756 m!1138507))

(declare-fun m!1138509 () Bool)

(assert (=> b!1234139 m!1138509))

(assert (=> b!1234139 m!1138509))

(declare-fun m!1138511 () Bool)

(assert (=> b!1234139 m!1138511))

(assert (=> b!1234145 m!1138509))

(declare-fun m!1138513 () Bool)

(assert (=> b!1234145 m!1138513))

(declare-fun m!1138515 () Bool)

(assert (=> b!1234147 m!1138515))

(declare-fun m!1138517 () Bool)

(assert (=> b!1234144 m!1138517))

(declare-fun m!1138519 () Bool)

(assert (=> b!1234138 m!1138519))

(declare-fun m!1138521 () Bool)

(assert (=> b!1234135 m!1138521))

(assert (=> b!1234146 m!1138509))

(declare-fun m!1138523 () Bool)

(assert (=> b!1234146 m!1138523))

(declare-fun m!1138525 () Bool)

(assert (=> b!1234146 m!1138525))

(declare-fun m!1138527 () Bool)

(assert (=> b!1234146 m!1138527))

(check-sat (not b!1234147) (not start!102756) (not b!1234145) (not b!1234136) (not b!1234141) (not b!1234135) (not b!1234144) (not b!1234146) (not b!1234139) (not b!1234142) (not b!1234138) (not b!1234143) (not b!1234140))
(check-sat)
(get-model)

(declare-fun d!135521 () Bool)

(assert (=> d!135521 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234140 d!135521))

(declare-fun d!135523 () Bool)

(declare-fun lt!560073 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!573 (List!27158) (InoxSet (_ BitVec 64)))

(assert (=> d!135523 (= lt!560073 (select (content!573 lt!560057) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700187 () Bool)

(assert (=> d!135523 (= lt!560073 e!700187)))

(declare-fun res!821737 () Bool)

(assert (=> d!135523 (=> (not res!821737) (not e!700187))))

(get-info :version)

(assert (=> d!135523 (= res!821737 ((_ is Cons!27154) lt!560057))))

(assert (=> d!135523 (= (contains!7229 lt!560057 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560073)))

(declare-fun b!1234230 () Bool)

(declare-fun e!700186 () Bool)

(assert (=> b!1234230 (= e!700187 e!700186)))

(declare-fun res!821738 () Bool)

(assert (=> b!1234230 (=> res!821738 e!700186)))

(assert (=> b!1234230 (= res!821738 (= (h!28372 lt!560057) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234231 () Bool)

(assert (=> b!1234231 (= e!700186 (contains!7229 (t!40613 lt!560057) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135523 res!821737) b!1234230))

(assert (= (and b!1234230 (not res!821738)) b!1234231))

(declare-fun m!1138593 () Bool)

(assert (=> d!135523 m!1138593))

(declare-fun m!1138595 () Bool)

(assert (=> d!135523 m!1138595))

(declare-fun m!1138597 () Bool)

(assert (=> b!1234231 m!1138597))

(assert (=> b!1234138 d!135523))

(declare-fun d!135525 () Bool)

(assert (=> d!135525 (= (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)) (and (not (= (select (arr!38372 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38372 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234139 d!135525))

(declare-fun b!1234248 () Bool)

(declare-fun e!700202 () Bool)

(declare-fun e!700205 () Bool)

(assert (=> b!1234248 (= e!700202 e!700205)))

(declare-fun c!121116 () Bool)

(assert (=> b!1234248 (= c!121116 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(declare-fun d!135527 () Bool)

(declare-fun res!821752 () Bool)

(declare-fun e!700204 () Bool)

(assert (=> d!135527 (=> res!821752 e!700204)))

(assert (=> d!135527 (= res!821752 (bvsge from!3184 (size!38909 a!3806)))))

(assert (=> d!135527 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27155) e!700204)))

(declare-fun call!61008 () Bool)

(declare-fun bm!61005 () Bool)

(assert (=> bm!61005 (= call!61008 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121116 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) Nil!27155)))))

(declare-fun b!1234249 () Bool)

(declare-fun e!700203 () Bool)

(assert (=> b!1234249 (= e!700203 (contains!7229 Nil!27155 (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234250 () Bool)

(assert (=> b!1234250 (= e!700205 call!61008)))

(declare-fun b!1234251 () Bool)

(assert (=> b!1234251 (= e!700204 e!700202)))

(declare-fun res!821753 () Bool)

(assert (=> b!1234251 (=> (not res!821753) (not e!700202))))

(assert (=> b!1234251 (= res!821753 (not e!700203))))

(declare-fun res!821751 () Bool)

(assert (=> b!1234251 (=> (not res!821751) (not e!700203))))

(assert (=> b!1234251 (= res!821751 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234252 () Bool)

(assert (=> b!1234252 (= e!700205 call!61008)))

(assert (= (and d!135527 (not res!821752)) b!1234251))

(assert (= (and b!1234251 res!821751) b!1234249))

(assert (= (and b!1234251 res!821753) b!1234248))

(assert (= (and b!1234248 c!121116) b!1234252))

(assert (= (and b!1234248 (not c!121116)) b!1234250))

(assert (= (or b!1234252 b!1234250) bm!61005))

(assert (=> b!1234248 m!1138509))

(assert (=> b!1234248 m!1138509))

(assert (=> b!1234248 m!1138511))

(assert (=> bm!61005 m!1138509))

(declare-fun m!1138603 () Bool)

(assert (=> bm!61005 m!1138603))

(assert (=> b!1234249 m!1138509))

(assert (=> b!1234249 m!1138509))

(declare-fun m!1138605 () Bool)

(assert (=> b!1234249 m!1138605))

(assert (=> b!1234251 m!1138509))

(assert (=> b!1234251 m!1138509))

(assert (=> b!1234251 m!1138511))

(assert (=> b!1234146 d!135527))

(declare-fun d!135537 () Bool)

(assert (=> d!135537 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27155)))

(declare-fun lt!560081 () Unit!40799)

(declare-fun choose!80 (array!79532 List!27158 List!27158 (_ BitVec 32)) Unit!40799)

(assert (=> d!135537 (= lt!560081 (choose!80 a!3806 acc!823 Nil!27155 from!3184))))

(assert (=> d!135537 (bvslt (size!38909 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135537 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27155 from!3184) lt!560081)))

(declare-fun bs!34665 () Bool)

(assert (= bs!34665 d!135537))

(assert (=> bs!34665 m!1138523))

(declare-fun m!1138613 () Bool)

(assert (=> bs!34665 m!1138613))

(assert (=> b!1234146 d!135537))

(declare-fun b!1234265 () Bool)

(declare-fun e!700218 () Bool)

(declare-fun e!700221 () Bool)

(assert (=> b!1234265 (= e!700218 e!700221)))

(declare-fun c!121117 () Bool)

(assert (=> b!1234265 (= c!121117 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135543 () Bool)

(declare-fun res!821767 () Bool)

(declare-fun e!700220 () Bool)

(assert (=> d!135543 (=> res!821767 e!700220)))

(assert (=> d!135543 (= res!821767 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38909 a!3806)))))

(assert (=> d!135543 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) e!700220)))

(declare-fun call!61009 () Bool)

(declare-fun bm!61006 () Bool)

(assert (=> bm!61006 (= call!61009 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121117 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823))))))

(declare-fun e!700219 () Bool)

(declare-fun b!1234266 () Bool)

(assert (=> b!1234266 (= e!700219 (contains!7229 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234267 () Bool)

(assert (=> b!1234267 (= e!700221 call!61009)))

(declare-fun b!1234268 () Bool)

(assert (=> b!1234268 (= e!700220 e!700218)))

(declare-fun res!821768 () Bool)

(assert (=> b!1234268 (=> (not res!821768) (not e!700218))))

(assert (=> b!1234268 (= res!821768 (not e!700219))))

(declare-fun res!821766 () Bool)

(assert (=> b!1234268 (=> (not res!821766) (not e!700219))))

(assert (=> b!1234268 (= res!821766 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234269 () Bool)

(assert (=> b!1234269 (= e!700221 call!61009)))

(assert (= (and d!135543 (not res!821767)) b!1234268))

(assert (= (and b!1234268 res!821766) b!1234266))

(assert (= (and b!1234268 res!821768) b!1234265))

(assert (= (and b!1234265 c!121117) b!1234269))

(assert (= (and b!1234265 (not c!121117)) b!1234267))

(assert (= (or b!1234269 b!1234267) bm!61006))

(declare-fun m!1138621 () Bool)

(assert (=> b!1234265 m!1138621))

(assert (=> b!1234265 m!1138621))

(declare-fun m!1138625 () Bool)

(assert (=> b!1234265 m!1138625))

(assert (=> bm!61006 m!1138621))

(declare-fun m!1138629 () Bool)

(assert (=> bm!61006 m!1138629))

(assert (=> b!1234266 m!1138621))

(assert (=> b!1234266 m!1138621))

(declare-fun m!1138631 () Bool)

(assert (=> b!1234266 m!1138631))

(assert (=> b!1234268 m!1138621))

(assert (=> b!1234268 m!1138621))

(assert (=> b!1234268 m!1138625))

(assert (=> b!1234146 d!135543))

(declare-fun d!135549 () Bool)

(declare-fun lt!560085 () Bool)

(assert (=> d!135549 (= lt!560085 (select (content!573 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700227 () Bool)

(assert (=> d!135549 (= lt!560085 e!700227)))

(declare-fun res!821773 () Bool)

(assert (=> d!135549 (=> (not res!821773) (not e!700227))))

(assert (=> d!135549 (= res!821773 ((_ is Cons!27154) acc!823))))

(assert (=> d!135549 (= (contains!7229 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560085)))

(declare-fun b!1234274 () Bool)

(declare-fun e!700226 () Bool)

(assert (=> b!1234274 (= e!700227 e!700226)))

(declare-fun res!821774 () Bool)

(assert (=> b!1234274 (=> res!821774 e!700226)))

(assert (=> b!1234274 (= res!821774 (= (h!28372 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234275 () Bool)

(assert (=> b!1234275 (= e!700226 (contains!7229 (t!40613 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135549 res!821773) b!1234274))

(assert (= (and b!1234274 (not res!821774)) b!1234275))

(declare-fun m!1138639 () Bool)

(assert (=> d!135549 m!1138639))

(declare-fun m!1138641 () Bool)

(assert (=> d!135549 m!1138641))

(declare-fun m!1138643 () Bool)

(assert (=> b!1234275 m!1138643))

(assert (=> b!1234136 d!135549))

(declare-fun b!1234276 () Bool)

(declare-fun e!700228 () Bool)

(declare-fun e!700231 () Bool)

(assert (=> b!1234276 (= e!700228 e!700231)))

(declare-fun c!121118 () Bool)

(assert (=> b!1234276 (= c!121118 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(declare-fun d!135553 () Bool)

(declare-fun res!821776 () Bool)

(declare-fun e!700230 () Bool)

(assert (=> d!135553 (=> res!821776 e!700230)))

(assert (=> d!135553 (= res!821776 (bvsge from!3184 (size!38909 a!3806)))))

(assert (=> d!135553 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!700230)))

(declare-fun bm!61007 () Bool)

(declare-fun call!61010 () Bool)

(assert (=> bm!61007 (= call!61010 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121118 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun e!700229 () Bool)

(declare-fun b!1234277 () Bool)

(assert (=> b!1234277 (= e!700229 (contains!7229 acc!823 (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234278 () Bool)

(assert (=> b!1234278 (= e!700231 call!61010)))

(declare-fun b!1234279 () Bool)

(assert (=> b!1234279 (= e!700230 e!700228)))

(declare-fun res!821777 () Bool)

(assert (=> b!1234279 (=> (not res!821777) (not e!700228))))

(assert (=> b!1234279 (= res!821777 (not e!700229))))

(declare-fun res!821775 () Bool)

(assert (=> b!1234279 (=> (not res!821775) (not e!700229))))

(assert (=> b!1234279 (= res!821775 (validKeyInArray!0 (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234280 () Bool)

(assert (=> b!1234280 (= e!700231 call!61010)))

(assert (= (and d!135553 (not res!821776)) b!1234279))

(assert (= (and b!1234279 res!821775) b!1234277))

(assert (= (and b!1234279 res!821777) b!1234276))

(assert (= (and b!1234276 c!121118) b!1234280))

(assert (= (and b!1234276 (not c!121118)) b!1234278))

(assert (= (or b!1234280 b!1234278) bm!61007))

(assert (=> b!1234276 m!1138509))

(assert (=> b!1234276 m!1138509))

(assert (=> b!1234276 m!1138511))

(assert (=> bm!61007 m!1138509))

(declare-fun m!1138645 () Bool)

(assert (=> bm!61007 m!1138645))

(assert (=> b!1234277 m!1138509))

(assert (=> b!1234277 m!1138509))

(declare-fun m!1138647 () Bool)

(assert (=> b!1234277 m!1138647))

(assert (=> b!1234279 m!1138509))

(assert (=> b!1234279 m!1138509))

(assert (=> b!1234279 m!1138511))

(assert (=> b!1234147 d!135553))

(declare-fun b!1234283 () Bool)

(declare-fun e!700234 () Bool)

(declare-fun e!700237 () Bool)

(assert (=> b!1234283 (= e!700234 e!700237)))

(declare-fun c!121119 () Bool)

(assert (=> b!1234283 (= c!121119 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135557 () Bool)

(declare-fun res!821781 () Bool)

(declare-fun e!700236 () Bool)

(assert (=> d!135557 (=> res!821781 e!700236)))

(assert (=> d!135557 (= res!821781 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38909 a!3806)))))

(assert (=> d!135557 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) e!700236)))

(declare-fun bm!61008 () Bool)

(declare-fun call!61011 () Bool)

(assert (=> bm!61008 (= call!61011 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121119 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155))))))

(declare-fun b!1234284 () Bool)

(declare-fun e!700235 () Bool)

(assert (=> b!1234284 (= e!700235 (contains!7229 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234285 () Bool)

(assert (=> b!1234285 (= e!700237 call!61011)))

(declare-fun b!1234286 () Bool)

(assert (=> b!1234286 (= e!700236 e!700234)))

(declare-fun res!821782 () Bool)

(assert (=> b!1234286 (=> (not res!821782) (not e!700234))))

(assert (=> b!1234286 (= res!821782 (not e!700235))))

(declare-fun res!821780 () Bool)

(assert (=> b!1234286 (=> (not res!821780) (not e!700235))))

(assert (=> b!1234286 (= res!821780 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234287 () Bool)

(assert (=> b!1234287 (= e!700237 call!61011)))

(assert (= (and d!135557 (not res!821781)) b!1234286))

(assert (= (and b!1234286 res!821780) b!1234284))

(assert (= (and b!1234286 res!821782) b!1234283))

(assert (= (and b!1234283 c!121119) b!1234287))

(assert (= (and b!1234283 (not c!121119)) b!1234285))

(assert (= (or b!1234287 b!1234285) bm!61008))

(assert (=> b!1234283 m!1138621))

(assert (=> b!1234283 m!1138621))

(assert (=> b!1234283 m!1138625))

(assert (=> bm!61008 m!1138621))

(declare-fun m!1138653 () Bool)

(assert (=> bm!61008 m!1138653))

(assert (=> b!1234284 m!1138621))

(assert (=> b!1234284 m!1138621))

(declare-fun m!1138655 () Bool)

(assert (=> b!1234284 m!1138655))

(assert (=> b!1234286 m!1138621))

(assert (=> b!1234286 m!1138621))

(assert (=> b!1234286 m!1138625))

(assert (=> b!1234145 d!135557))

(declare-fun d!135561 () Bool)

(declare-fun res!821801 () Bool)

(declare-fun e!700258 () Bool)

(assert (=> d!135561 (=> res!821801 e!700258)))

(assert (=> d!135561 (= res!821801 (= (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135561 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!700258)))

(declare-fun b!1234310 () Bool)

(declare-fun e!700259 () Bool)

(assert (=> b!1234310 (= e!700258 e!700259)))

(declare-fun res!821802 () Bool)

(assert (=> b!1234310 (=> (not res!821802) (not e!700259))))

(assert (=> b!1234310 (= res!821802 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(declare-fun b!1234311 () Bool)

(assert (=> b!1234311 (= e!700259 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135561 (not res!821801)) b!1234310))

(assert (= (and b!1234310 res!821802) b!1234311))

(assert (=> d!135561 m!1138621))

(declare-fun m!1138665 () Bool)

(assert (=> b!1234311 m!1138665))

(assert (=> b!1234135 d!135561))

(declare-fun d!135567 () Bool)

(declare-fun lt!560087 () Bool)

(assert (=> d!135567 (= lt!560087 (select (content!573 lt!560057) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700265 () Bool)

(assert (=> d!135567 (= lt!560087 e!700265)))

(declare-fun res!821806 () Bool)

(assert (=> d!135567 (=> (not res!821806) (not e!700265))))

(assert (=> d!135567 (= res!821806 ((_ is Cons!27154) lt!560057))))

(assert (=> d!135567 (= (contains!7229 lt!560057 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560087)))

(declare-fun b!1234317 () Bool)

(declare-fun e!700264 () Bool)

(assert (=> b!1234317 (= e!700265 e!700264)))

(declare-fun res!821807 () Bool)

(assert (=> b!1234317 (=> res!821807 e!700264)))

(assert (=> b!1234317 (= res!821807 (= (h!28372 lt!560057) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234318 () Bool)

(assert (=> b!1234318 (= e!700264 (contains!7229 (t!40613 lt!560057) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135567 res!821806) b!1234317))

(assert (= (and b!1234317 (not res!821807)) b!1234318))

(assert (=> d!135567 m!1138593))

(declare-fun m!1138667 () Bool)

(assert (=> d!135567 m!1138667))

(declare-fun m!1138669 () Bool)

(assert (=> b!1234318 m!1138669))

(assert (=> b!1234144 d!135567))

(declare-fun d!135569 () Bool)

(declare-fun res!821818 () Bool)

(declare-fun e!700276 () Bool)

(assert (=> d!135569 (=> res!821818 e!700276)))

(assert (=> d!135569 (= res!821818 ((_ is Nil!27155) lt!560057))))

(assert (=> d!135569 (= (noDuplicate!1810 lt!560057) e!700276)))

(declare-fun b!1234325 () Bool)

(declare-fun e!700277 () Bool)

(assert (=> b!1234325 (= e!700276 e!700277)))

(declare-fun res!821819 () Bool)

(assert (=> b!1234325 (=> (not res!821819) (not e!700277))))

(assert (=> b!1234325 (= res!821819 (not (contains!7229 (t!40613 lt!560057) (h!28372 lt!560057))))))

(declare-fun b!1234326 () Bool)

(assert (=> b!1234326 (= e!700277 (noDuplicate!1810 (t!40613 lt!560057)))))

(assert (= (and d!135569 (not res!821818)) b!1234325))

(assert (= (and b!1234325 res!821819) b!1234326))

(declare-fun m!1138675 () Bool)

(assert (=> b!1234325 m!1138675))

(declare-fun m!1138677 () Bool)

(assert (=> b!1234326 m!1138677))

(assert (=> b!1234142 d!135569))

(declare-fun d!135573 () Bool)

(assert (=> d!135573 (= (array_inv!29310 a!3806) (bvsge (size!38909 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102756 d!135573))

(declare-fun d!135577 () Bool)

(declare-fun lt!560091 () Bool)

(assert (=> d!135577 (= lt!560091 (select (content!573 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700285 () Bool)

(assert (=> d!135577 (= lt!560091 e!700285)))

(declare-fun res!821823 () Bool)

(assert (=> d!135577 (=> (not res!821823) (not e!700285))))

(assert (=> d!135577 (= res!821823 ((_ is Cons!27154) acc!823))))

(assert (=> d!135577 (= (contains!7229 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560091)))

(declare-fun b!1234340 () Bool)

(declare-fun e!700284 () Bool)

(assert (=> b!1234340 (= e!700285 e!700284)))

(declare-fun res!821824 () Bool)

(assert (=> b!1234340 (=> res!821824 e!700284)))

(assert (=> b!1234340 (= res!821824 (= (h!28372 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234341 () Bool)

(assert (=> b!1234341 (= e!700284 (contains!7229 (t!40613 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135577 res!821823) b!1234340))

(assert (= (and b!1234340 (not res!821824)) b!1234341))

(assert (=> d!135577 m!1138639))

(declare-fun m!1138681 () Bool)

(assert (=> d!135577 m!1138681))

(declare-fun m!1138683 () Bool)

(assert (=> b!1234341 m!1138683))

(assert (=> b!1234143 d!135577))

(declare-fun d!135579 () Bool)

(declare-fun res!821825 () Bool)

(declare-fun e!700286 () Bool)

(assert (=> d!135579 (=> res!821825 e!700286)))

(assert (=> d!135579 (= res!821825 ((_ is Nil!27155) acc!823))))

(assert (=> d!135579 (= (noDuplicate!1810 acc!823) e!700286)))

(declare-fun b!1234342 () Bool)

(declare-fun e!700287 () Bool)

(assert (=> b!1234342 (= e!700286 e!700287)))

(declare-fun res!821826 () Bool)

(assert (=> b!1234342 (=> (not res!821826) (not e!700287))))

(assert (=> b!1234342 (= res!821826 (not (contains!7229 (t!40613 acc!823) (h!28372 acc!823))))))

(declare-fun b!1234343 () Bool)

(assert (=> b!1234343 (= e!700287 (noDuplicate!1810 (t!40613 acc!823)))))

(assert (= (and d!135579 (not res!821825)) b!1234342))

(assert (= (and b!1234342 res!821826) b!1234343))

(declare-fun m!1138691 () Bool)

(assert (=> b!1234342 m!1138691))

(declare-fun m!1138693 () Bool)

(assert (=> b!1234343 m!1138693))

(assert (=> b!1234141 d!135579))

(check-sat (not d!135567) (not d!135523) (not bm!61005) (not b!1234266) (not b!1234249) (not bm!61007) (not b!1234283) (not d!135577) (not b!1234277) (not b!1234276) (not b!1234279) (not bm!61006) (not b!1234275) (not b!1234231) (not b!1234325) (not d!135537) (not d!135549) (not b!1234342) (not b!1234326) (not b!1234343) (not b!1234286) (not b!1234341) (not b!1234251) (not b!1234248) (not b!1234265) (not b!1234318) (not b!1234311) (not bm!61008) (not b!1234268) (not b!1234284))
(check-sat)
(get-model)

(assert (=> b!1234279 d!135525))

(assert (=> d!135537 d!135527))

(declare-fun d!135611 () Bool)

(assert (=> d!135611 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27155)))

(assert (=> d!135611 true))

(declare-fun _$70!101 () Unit!40799)

(assert (=> d!135611 (= (choose!80 a!3806 acc!823 Nil!27155 from!3184) _$70!101)))

(declare-fun bs!34668 () Bool)

(assert (= bs!34668 d!135611))

(assert (=> bs!34668 m!1138523))

(assert (=> d!135537 d!135611))

(declare-fun d!135613 () Bool)

(declare-fun res!821865 () Bool)

(declare-fun e!700332 () Bool)

(assert (=> d!135613 (=> res!821865 e!700332)))

(assert (=> d!135613 (= res!821865 ((_ is Nil!27155) (t!40613 acc!823)))))

(assert (=> d!135613 (= (noDuplicate!1810 (t!40613 acc!823)) e!700332)))

(declare-fun b!1234394 () Bool)

(declare-fun e!700333 () Bool)

(assert (=> b!1234394 (= e!700332 e!700333)))

(declare-fun res!821866 () Bool)

(assert (=> b!1234394 (=> (not res!821866) (not e!700333))))

(assert (=> b!1234394 (= res!821866 (not (contains!7229 (t!40613 (t!40613 acc!823)) (h!28372 (t!40613 acc!823)))))))

(declare-fun b!1234395 () Bool)

(assert (=> b!1234395 (= e!700333 (noDuplicate!1810 (t!40613 (t!40613 acc!823))))))

(assert (= (and d!135613 (not res!821865)) b!1234394))

(assert (= (and b!1234394 res!821866) b!1234395))

(declare-fun m!1138749 () Bool)

(assert (=> b!1234394 m!1138749))

(declare-fun m!1138751 () Bool)

(assert (=> b!1234395 m!1138751))

(assert (=> b!1234343 d!135613))

(declare-fun d!135615 () Bool)

(declare-fun lt!560098 () Bool)

(assert (=> d!135615 (= lt!560098 (select (content!573 (t!40613 lt!560057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700335 () Bool)

(assert (=> d!135615 (= lt!560098 e!700335)))

(declare-fun res!821867 () Bool)

(assert (=> d!135615 (=> (not res!821867) (not e!700335))))

(assert (=> d!135615 (= res!821867 ((_ is Cons!27154) (t!40613 lt!560057)))))

(assert (=> d!135615 (= (contains!7229 (t!40613 lt!560057) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560098)))

(declare-fun b!1234396 () Bool)

(declare-fun e!700334 () Bool)

(assert (=> b!1234396 (= e!700335 e!700334)))

(declare-fun res!821868 () Bool)

(assert (=> b!1234396 (=> res!821868 e!700334)))

(assert (=> b!1234396 (= res!821868 (= (h!28372 (t!40613 lt!560057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234397 () Bool)

(assert (=> b!1234397 (= e!700334 (contains!7229 (t!40613 (t!40613 lt!560057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135615 res!821867) b!1234396))

(assert (= (and b!1234396 (not res!821868)) b!1234397))

(declare-fun m!1138753 () Bool)

(assert (=> d!135615 m!1138753))

(declare-fun m!1138755 () Bool)

(assert (=> d!135615 m!1138755))

(declare-fun m!1138757 () Bool)

(assert (=> b!1234397 m!1138757))

(assert (=> b!1234318 d!135615))

(declare-fun lt!560099 () Bool)

(declare-fun d!135617 () Bool)

(assert (=> d!135617 (= lt!560099 (select (content!573 acc!823) (select (arr!38372 a!3806) from!3184)))))

(declare-fun e!700337 () Bool)

(assert (=> d!135617 (= lt!560099 e!700337)))

(declare-fun res!821869 () Bool)

(assert (=> d!135617 (=> (not res!821869) (not e!700337))))

(assert (=> d!135617 (= res!821869 ((_ is Cons!27154) acc!823))))

(assert (=> d!135617 (= (contains!7229 acc!823 (select (arr!38372 a!3806) from!3184)) lt!560099)))

(declare-fun b!1234398 () Bool)

(declare-fun e!700336 () Bool)

(assert (=> b!1234398 (= e!700337 e!700336)))

(declare-fun res!821870 () Bool)

(assert (=> b!1234398 (=> res!821870 e!700336)))

(assert (=> b!1234398 (= res!821870 (= (h!28372 acc!823) (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234399 () Bool)

(assert (=> b!1234399 (= e!700336 (contains!7229 (t!40613 acc!823) (select (arr!38372 a!3806) from!3184)))))

(assert (= (and d!135617 res!821869) b!1234398))

(assert (= (and b!1234398 (not res!821870)) b!1234399))

(assert (=> d!135617 m!1138639))

(assert (=> d!135617 m!1138509))

(declare-fun m!1138759 () Bool)

(assert (=> d!135617 m!1138759))

(assert (=> b!1234399 m!1138509))

(declare-fun m!1138761 () Bool)

(assert (=> b!1234399 m!1138761))

(assert (=> b!1234277 d!135617))

(declare-fun d!135619 () Bool)

(declare-fun res!821871 () Bool)

(declare-fun e!700338 () Bool)

(assert (=> d!135619 (=> res!821871 e!700338)))

(assert (=> d!135619 (= res!821871 ((_ is Nil!27155) (t!40613 lt!560057)))))

(assert (=> d!135619 (= (noDuplicate!1810 (t!40613 lt!560057)) e!700338)))

(declare-fun b!1234400 () Bool)

(declare-fun e!700339 () Bool)

(assert (=> b!1234400 (= e!700338 e!700339)))

(declare-fun res!821872 () Bool)

(assert (=> b!1234400 (=> (not res!821872) (not e!700339))))

(assert (=> b!1234400 (= res!821872 (not (contains!7229 (t!40613 (t!40613 lt!560057)) (h!28372 (t!40613 lt!560057)))))))

(declare-fun b!1234401 () Bool)

(assert (=> b!1234401 (= e!700339 (noDuplicate!1810 (t!40613 (t!40613 lt!560057))))))

(assert (= (and d!135619 (not res!821871)) b!1234400))

(assert (= (and b!1234400 res!821872) b!1234401))

(declare-fun m!1138763 () Bool)

(assert (=> b!1234400 m!1138763))

(declare-fun m!1138765 () Bool)

(assert (=> b!1234401 m!1138765))

(assert (=> b!1234326 d!135619))

(assert (=> b!1234276 d!135525))

(declare-fun d!135621 () Bool)

(declare-fun lt!560100 () Bool)

(assert (=> d!135621 (= lt!560100 (select (content!573 (t!40613 acc!823)) (h!28372 acc!823)))))

(declare-fun e!700341 () Bool)

(assert (=> d!135621 (= lt!560100 e!700341)))

(declare-fun res!821873 () Bool)

(assert (=> d!135621 (=> (not res!821873) (not e!700341))))

(assert (=> d!135621 (= res!821873 ((_ is Cons!27154) (t!40613 acc!823)))))

(assert (=> d!135621 (= (contains!7229 (t!40613 acc!823) (h!28372 acc!823)) lt!560100)))

(declare-fun b!1234402 () Bool)

(declare-fun e!700340 () Bool)

(assert (=> b!1234402 (= e!700341 e!700340)))

(declare-fun res!821874 () Bool)

(assert (=> b!1234402 (=> res!821874 e!700340)))

(assert (=> b!1234402 (= res!821874 (= (h!28372 (t!40613 acc!823)) (h!28372 acc!823)))))

(declare-fun b!1234403 () Bool)

(assert (=> b!1234403 (= e!700340 (contains!7229 (t!40613 (t!40613 acc!823)) (h!28372 acc!823)))))

(assert (= (and d!135621 res!821873) b!1234402))

(assert (= (and b!1234402 (not res!821874)) b!1234403))

(declare-fun m!1138767 () Bool)

(assert (=> d!135621 m!1138767))

(declare-fun m!1138769 () Bool)

(assert (=> d!135621 m!1138769))

(declare-fun m!1138771 () Bool)

(assert (=> b!1234403 m!1138771))

(assert (=> b!1234342 d!135621))

(declare-fun b!1234404 () Bool)

(declare-fun e!700342 () Bool)

(declare-fun e!700345 () Bool)

(assert (=> b!1234404 (= e!700342 e!700345)))

(declare-fun c!121132 () Bool)

(assert (=> b!1234404 (= c!121132 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!135623 () Bool)

(declare-fun res!821876 () Bool)

(declare-fun e!700344 () Bool)

(assert (=> d!135623 (=> res!821876 e!700344)))

(assert (=> d!135623 (= res!821876 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(assert (=> d!135623 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121118 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) acc!823)) e!700344)))

(declare-fun bm!61021 () Bool)

(declare-fun call!61024 () Bool)

(assert (=> bm!61021 (= call!61024 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121132 (Cons!27154 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!121118 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) acc!823)) (ite c!121118 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1234405 () Bool)

(declare-fun e!700343 () Bool)

(assert (=> b!1234405 (= e!700343 (contains!7229 (ite c!121118 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) acc!823) (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234406 () Bool)

(assert (=> b!1234406 (= e!700345 call!61024)))

(declare-fun b!1234407 () Bool)

(assert (=> b!1234407 (= e!700344 e!700342)))

(declare-fun res!821877 () Bool)

(assert (=> b!1234407 (=> (not res!821877) (not e!700342))))

(assert (=> b!1234407 (= res!821877 (not e!700343))))

(declare-fun res!821875 () Bool)

(assert (=> b!1234407 (=> (not res!821875) (not e!700343))))

(assert (=> b!1234407 (= res!821875 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234408 () Bool)

(assert (=> b!1234408 (= e!700345 call!61024)))

(assert (= (and d!135623 (not res!821876)) b!1234407))

(assert (= (and b!1234407 res!821875) b!1234405))

(assert (= (and b!1234407 res!821877) b!1234404))

(assert (= (and b!1234404 c!121132) b!1234408))

(assert (= (and b!1234404 (not c!121132)) b!1234406))

(assert (= (or b!1234408 b!1234406) bm!61021))

(declare-fun m!1138773 () Bool)

(assert (=> b!1234404 m!1138773))

(assert (=> b!1234404 m!1138773))

(declare-fun m!1138775 () Bool)

(assert (=> b!1234404 m!1138775))

(assert (=> bm!61021 m!1138773))

(declare-fun m!1138777 () Bool)

(assert (=> bm!61021 m!1138777))

(assert (=> b!1234405 m!1138773))

(assert (=> b!1234405 m!1138773))

(declare-fun m!1138779 () Bool)

(assert (=> b!1234405 m!1138779))

(assert (=> b!1234407 m!1138773))

(assert (=> b!1234407 m!1138773))

(assert (=> b!1234407 m!1138775))

(assert (=> bm!61007 d!135623))

(declare-fun d!135625 () Bool)

(assert (=> d!135625 (= (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234265 d!135625))

(declare-fun d!135627 () Bool)

(declare-fun c!121135 () Bool)

(assert (=> d!135627 (= c!121135 ((_ is Nil!27155) acc!823))))

(declare-fun e!700348 () (InoxSet (_ BitVec 64)))

(assert (=> d!135627 (= (content!573 acc!823) e!700348)))

(declare-fun b!1234413 () Bool)

(assert (=> b!1234413 (= e!700348 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1234414 () Bool)

(assert (=> b!1234414 (= e!700348 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28372 acc!823) true) (content!573 (t!40613 acc!823))))))

(assert (= (and d!135627 c!121135) b!1234413))

(assert (= (and d!135627 (not c!121135)) b!1234414))

(declare-fun m!1138781 () Bool)

(assert (=> b!1234414 m!1138781))

(assert (=> b!1234414 m!1138767))

(assert (=> d!135549 d!135627))

(declare-fun b!1234415 () Bool)

(declare-fun e!700349 () Bool)

(declare-fun e!700352 () Bool)

(assert (=> b!1234415 (= e!700349 e!700352)))

(declare-fun c!121136 () Bool)

(assert (=> b!1234415 (= c!121136 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!135629 () Bool)

(declare-fun res!821879 () Bool)

(declare-fun e!700351 () Bool)

(assert (=> d!135629 (=> res!821879 e!700351)))

(assert (=> d!135629 (= res!821879 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(assert (=> d!135629 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121117 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823))) e!700351)))

(declare-fun bm!61022 () Bool)

(declare-fun call!61025 () Bool)

(assert (=> bm!61022 (= call!61025 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121136 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!121117 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823))) (ite c!121117 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)))))))

(declare-fun b!1234416 () Bool)

(declare-fun e!700350 () Bool)

(assert (=> b!1234416 (= e!700350 (contains!7229 (ite c!121117 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234417 () Bool)

(assert (=> b!1234417 (= e!700352 call!61025)))

(declare-fun b!1234418 () Bool)

(assert (=> b!1234418 (= e!700351 e!700349)))

(declare-fun res!821880 () Bool)

(assert (=> b!1234418 (=> (not res!821880) (not e!700349))))

(assert (=> b!1234418 (= res!821880 (not e!700350))))

(declare-fun res!821878 () Bool)

(assert (=> b!1234418 (=> (not res!821878) (not e!700350))))

(assert (=> b!1234418 (= res!821878 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234419 () Bool)

(assert (=> b!1234419 (= e!700352 call!61025)))

(assert (= (and d!135629 (not res!821879)) b!1234418))

(assert (= (and b!1234418 res!821878) b!1234416))

(assert (= (and b!1234418 res!821880) b!1234415))

(assert (= (and b!1234415 c!121136) b!1234419))

(assert (= (and b!1234415 (not c!121136)) b!1234417))

(assert (= (or b!1234419 b!1234417) bm!61022))

(declare-fun m!1138783 () Bool)

(assert (=> b!1234415 m!1138783))

(assert (=> b!1234415 m!1138783))

(declare-fun m!1138785 () Bool)

(assert (=> b!1234415 m!1138785))

(assert (=> bm!61022 m!1138783))

(declare-fun m!1138787 () Bool)

(assert (=> bm!61022 m!1138787))

(assert (=> b!1234416 m!1138783))

(assert (=> b!1234416 m!1138783))

(declare-fun m!1138789 () Bool)

(assert (=> b!1234416 m!1138789))

(assert (=> b!1234418 m!1138783))

(assert (=> b!1234418 m!1138783))

(assert (=> b!1234418 m!1138785))

(assert (=> bm!61006 d!135629))

(declare-fun d!135631 () Bool)

(declare-fun c!121137 () Bool)

(assert (=> d!135631 (= c!121137 ((_ is Nil!27155) lt!560057))))

(declare-fun e!700353 () (InoxSet (_ BitVec 64)))

(assert (=> d!135631 (= (content!573 lt!560057) e!700353)))

(declare-fun b!1234420 () Bool)

(assert (=> b!1234420 (= e!700353 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1234421 () Bool)

(assert (=> b!1234421 (= e!700353 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28372 lt!560057) true) (content!573 (t!40613 lt!560057))))))

(assert (= (and d!135631 c!121137) b!1234420))

(assert (= (and d!135631 (not c!121137)) b!1234421))

(declare-fun m!1138791 () Bool)

(assert (=> b!1234421 m!1138791))

(assert (=> b!1234421 m!1138753))

(assert (=> d!135523 d!135631))

(assert (=> d!135577 d!135627))

(declare-fun d!135633 () Bool)

(declare-fun lt!560101 () Bool)

(assert (=> d!135633 (= lt!560101 (select (content!573 Nil!27155) (select (arr!38372 a!3806) from!3184)))))

(declare-fun e!700355 () Bool)

(assert (=> d!135633 (= lt!560101 e!700355)))

(declare-fun res!821881 () Bool)

(assert (=> d!135633 (=> (not res!821881) (not e!700355))))

(assert (=> d!135633 (= res!821881 ((_ is Cons!27154) Nil!27155))))

(assert (=> d!135633 (= (contains!7229 Nil!27155 (select (arr!38372 a!3806) from!3184)) lt!560101)))

(declare-fun b!1234422 () Bool)

(declare-fun e!700354 () Bool)

(assert (=> b!1234422 (= e!700355 e!700354)))

(declare-fun res!821882 () Bool)

(assert (=> b!1234422 (=> res!821882 e!700354)))

(assert (=> b!1234422 (= res!821882 (= (h!28372 Nil!27155) (select (arr!38372 a!3806) from!3184)))))

(declare-fun b!1234423 () Bool)

(assert (=> b!1234423 (= e!700354 (contains!7229 (t!40613 Nil!27155) (select (arr!38372 a!3806) from!3184)))))

(assert (= (and d!135633 res!821881) b!1234422))

(assert (= (and b!1234422 (not res!821882)) b!1234423))

(declare-fun m!1138793 () Bool)

(assert (=> d!135633 m!1138793))

(assert (=> d!135633 m!1138509))

(declare-fun m!1138795 () Bool)

(assert (=> d!135633 m!1138795))

(assert (=> b!1234423 m!1138509))

(declare-fun m!1138797 () Bool)

(assert (=> b!1234423 m!1138797))

(assert (=> b!1234249 d!135633))

(assert (=> b!1234283 d!135625))

(assert (=> b!1234268 d!135625))

(declare-fun b!1234424 () Bool)

(declare-fun e!700356 () Bool)

(declare-fun e!700359 () Bool)

(assert (=> b!1234424 (= e!700356 e!700359)))

(declare-fun c!121138 () Bool)

(assert (=> b!1234424 (= c!121138 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!135635 () Bool)

(declare-fun res!821884 () Bool)

(declare-fun e!700358 () Bool)

(assert (=> d!135635 (=> res!821884 e!700358)))

(assert (=> d!135635 (= res!821884 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(assert (=> d!135635 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121116 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) Nil!27155)) e!700358)))

(declare-fun bm!61023 () Bool)

(declare-fun call!61026 () Bool)

(assert (=> bm!61023 (= call!61026 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121138 (Cons!27154 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!121116 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) Nil!27155)) (ite c!121116 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) Nil!27155))))))

(declare-fun b!1234425 () Bool)

(declare-fun e!700357 () Bool)

(assert (=> b!1234425 (= e!700357 (contains!7229 (ite c!121116 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) Nil!27155) (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234426 () Bool)

(assert (=> b!1234426 (= e!700359 call!61026)))

(declare-fun b!1234427 () Bool)

(assert (=> b!1234427 (= e!700358 e!700356)))

(declare-fun res!821885 () Bool)

(assert (=> b!1234427 (=> (not res!821885) (not e!700356))))

(assert (=> b!1234427 (= res!821885 (not e!700357))))

(declare-fun res!821883 () Bool)

(assert (=> b!1234427 (=> (not res!821883) (not e!700357))))

(assert (=> b!1234427 (= res!821883 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234428 () Bool)

(assert (=> b!1234428 (= e!700359 call!61026)))

(assert (= (and d!135635 (not res!821884)) b!1234427))

(assert (= (and b!1234427 res!821883) b!1234425))

(assert (= (and b!1234427 res!821885) b!1234424))

(assert (= (and b!1234424 c!121138) b!1234428))

(assert (= (and b!1234424 (not c!121138)) b!1234426))

(assert (= (or b!1234428 b!1234426) bm!61023))

(assert (=> b!1234424 m!1138773))

(assert (=> b!1234424 m!1138773))

(assert (=> b!1234424 m!1138775))

(assert (=> bm!61023 m!1138773))

(declare-fun m!1138799 () Bool)

(assert (=> bm!61023 m!1138799))

(assert (=> b!1234425 m!1138773))

(assert (=> b!1234425 m!1138773))

(declare-fun m!1138801 () Bool)

(assert (=> b!1234425 m!1138801))

(assert (=> b!1234427 m!1138773))

(assert (=> b!1234427 m!1138773))

(assert (=> b!1234427 m!1138775))

(assert (=> bm!61005 d!135635))

(declare-fun d!135637 () Bool)

(declare-fun lt!560102 () Bool)

(assert (=> d!135637 (= lt!560102 (select (content!573 (t!40613 lt!560057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700361 () Bool)

(assert (=> d!135637 (= lt!560102 e!700361)))

(declare-fun res!821886 () Bool)

(assert (=> d!135637 (=> (not res!821886) (not e!700361))))

(assert (=> d!135637 (= res!821886 ((_ is Cons!27154) (t!40613 lt!560057)))))

(assert (=> d!135637 (= (contains!7229 (t!40613 lt!560057) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560102)))

(declare-fun b!1234429 () Bool)

(declare-fun e!700360 () Bool)

(assert (=> b!1234429 (= e!700361 e!700360)))

(declare-fun res!821887 () Bool)

(assert (=> b!1234429 (=> res!821887 e!700360)))

(assert (=> b!1234429 (= res!821887 (= (h!28372 (t!40613 lt!560057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234430 () Bool)

(assert (=> b!1234430 (= e!700360 (contains!7229 (t!40613 (t!40613 lt!560057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135637 res!821886) b!1234429))

(assert (= (and b!1234429 (not res!821887)) b!1234430))

(assert (=> d!135637 m!1138753))

(declare-fun m!1138803 () Bool)

(assert (=> d!135637 m!1138803))

(declare-fun m!1138805 () Bool)

(assert (=> b!1234430 m!1138805))

(assert (=> b!1234231 d!135637))

(assert (=> b!1234248 d!135525))

(declare-fun d!135639 () Bool)

(declare-fun lt!560103 () Bool)

(assert (=> d!135639 (= lt!560103 (select (content!573 (t!40613 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700363 () Bool)

(assert (=> d!135639 (= lt!560103 e!700363)))

(declare-fun res!821888 () Bool)

(assert (=> d!135639 (=> (not res!821888) (not e!700363))))

(assert (=> d!135639 (= res!821888 ((_ is Cons!27154) (t!40613 acc!823)))))

(assert (=> d!135639 (= (contains!7229 (t!40613 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560103)))

(declare-fun b!1234431 () Bool)

(declare-fun e!700362 () Bool)

(assert (=> b!1234431 (= e!700363 e!700362)))

(declare-fun res!821889 () Bool)

(assert (=> b!1234431 (=> res!821889 e!700362)))

(assert (=> b!1234431 (= res!821889 (= (h!28372 (t!40613 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234432 () Bool)

(assert (=> b!1234432 (= e!700362 (contains!7229 (t!40613 (t!40613 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135639 res!821888) b!1234431))

(assert (= (and b!1234431 (not res!821889)) b!1234432))

(assert (=> d!135639 m!1138767))

(declare-fun m!1138807 () Bool)

(assert (=> d!135639 m!1138807))

(declare-fun m!1138809 () Bool)

(assert (=> b!1234432 m!1138809))

(assert (=> b!1234341 d!135639))

(declare-fun d!135641 () Bool)

(declare-fun lt!560104 () Bool)

(assert (=> d!135641 (= lt!560104 (select (content!573 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!700365 () Bool)

(assert (=> d!135641 (= lt!560104 e!700365)))

(declare-fun res!821890 () Bool)

(assert (=> d!135641 (=> (not res!821890) (not e!700365))))

(assert (=> d!135641 (= res!821890 ((_ is Cons!27154) (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)))))

(assert (=> d!135641 (= (contains!7229 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!560104)))

(declare-fun b!1234433 () Bool)

(declare-fun e!700364 () Bool)

(assert (=> b!1234433 (= e!700365 e!700364)))

(declare-fun res!821891 () Bool)

(assert (=> b!1234433 (=> res!821891 e!700364)))

(assert (=> b!1234433 (= res!821891 (= (h!28372 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234434 () Bool)

(assert (=> b!1234434 (= e!700364 (contains!7229 (t!40613 (Cons!27154 (select (arr!38372 a!3806) from!3184) acc!823)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135641 res!821890) b!1234433))

(assert (= (and b!1234433 (not res!821891)) b!1234434))

(declare-fun m!1138811 () Bool)

(assert (=> d!135641 m!1138811))

(assert (=> d!135641 m!1138621))

(declare-fun m!1138813 () Bool)

(assert (=> d!135641 m!1138813))

(assert (=> b!1234434 m!1138621))

(declare-fun m!1138815 () Bool)

(assert (=> b!1234434 m!1138815))

(assert (=> b!1234266 d!135641))

(declare-fun d!135643 () Bool)

(declare-fun lt!560105 () Bool)

(assert (=> d!135643 (= lt!560105 (select (content!573 (t!40613 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700367 () Bool)

(assert (=> d!135643 (= lt!560105 e!700367)))

(declare-fun res!821892 () Bool)

(assert (=> d!135643 (=> (not res!821892) (not e!700367))))

(assert (=> d!135643 (= res!821892 ((_ is Cons!27154) (t!40613 acc!823)))))

(assert (=> d!135643 (= (contains!7229 (t!40613 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560105)))

(declare-fun b!1234435 () Bool)

(declare-fun e!700366 () Bool)

(assert (=> b!1234435 (= e!700367 e!700366)))

(declare-fun res!821893 () Bool)

(assert (=> b!1234435 (=> res!821893 e!700366)))

(assert (=> b!1234435 (= res!821893 (= (h!28372 (t!40613 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234436 () Bool)

(assert (=> b!1234436 (= e!700366 (contains!7229 (t!40613 (t!40613 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135643 res!821892) b!1234435))

(assert (= (and b!1234435 (not res!821893)) b!1234436))

(assert (=> d!135643 m!1138767))

(declare-fun m!1138817 () Bool)

(assert (=> d!135643 m!1138817))

(declare-fun m!1138819 () Bool)

(assert (=> b!1234436 m!1138819))

(assert (=> b!1234275 d!135643))

(assert (=> d!135567 d!135631))

(declare-fun d!135645 () Bool)

(declare-fun res!821894 () Bool)

(declare-fun e!700368 () Bool)

(assert (=> d!135645 (=> res!821894 e!700368)))

(assert (=> d!135645 (= res!821894 (= (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!135645 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!700368)))

(declare-fun b!1234437 () Bool)

(declare-fun e!700369 () Bool)

(assert (=> b!1234437 (= e!700368 e!700369)))

(declare-fun res!821895 () Bool)

(assert (=> b!1234437 (=> (not res!821895) (not e!700369))))

(assert (=> b!1234437 (= res!821895 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(declare-fun b!1234438 () Bool)

(assert (=> b!1234438 (= e!700369 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!135645 (not res!821894)) b!1234437))

(assert (= (and b!1234437 res!821895) b!1234438))

(assert (=> d!135645 m!1138783))

(declare-fun m!1138821 () Bool)

(assert (=> b!1234438 m!1138821))

(assert (=> b!1234311 d!135645))

(declare-fun d!135647 () Bool)

(declare-fun lt!560106 () Bool)

(assert (=> d!135647 (= lt!560106 (select (content!573 (t!40613 lt!560057)) (h!28372 lt!560057)))))

(declare-fun e!700371 () Bool)

(assert (=> d!135647 (= lt!560106 e!700371)))

(declare-fun res!821896 () Bool)

(assert (=> d!135647 (=> (not res!821896) (not e!700371))))

(assert (=> d!135647 (= res!821896 ((_ is Cons!27154) (t!40613 lt!560057)))))

(assert (=> d!135647 (= (contains!7229 (t!40613 lt!560057) (h!28372 lt!560057)) lt!560106)))

(declare-fun b!1234439 () Bool)

(declare-fun e!700370 () Bool)

(assert (=> b!1234439 (= e!700371 e!700370)))

(declare-fun res!821897 () Bool)

(assert (=> b!1234439 (=> res!821897 e!700370)))

(assert (=> b!1234439 (= res!821897 (= (h!28372 (t!40613 lt!560057)) (h!28372 lt!560057)))))

(declare-fun b!1234440 () Bool)

(assert (=> b!1234440 (= e!700370 (contains!7229 (t!40613 (t!40613 lt!560057)) (h!28372 lt!560057)))))

(assert (= (and d!135647 res!821896) b!1234439))

(assert (= (and b!1234439 (not res!821897)) b!1234440))

(assert (=> d!135647 m!1138753))

(declare-fun m!1138823 () Bool)

(assert (=> d!135647 m!1138823))

(declare-fun m!1138825 () Bool)

(assert (=> b!1234440 m!1138825))

(assert (=> b!1234325 d!135647))

(assert (=> b!1234286 d!135625))

(declare-fun d!135649 () Bool)

(declare-fun lt!560107 () Bool)

(assert (=> d!135649 (= lt!560107 (select (content!573 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!700373 () Bool)

(assert (=> d!135649 (= lt!560107 e!700373)))

(declare-fun res!821898 () Bool)

(assert (=> d!135649 (=> (not res!821898) (not e!700373))))

(assert (=> d!135649 (= res!821898 ((_ is Cons!27154) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)))))

(assert (=> d!135649 (= (contains!7229 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!560107)))

(declare-fun b!1234441 () Bool)

(declare-fun e!700372 () Bool)

(assert (=> b!1234441 (= e!700373 e!700372)))

(declare-fun res!821899 () Bool)

(assert (=> b!1234441 (=> res!821899 e!700372)))

(assert (=> b!1234441 (= res!821899 (= (h!28372 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234442 () Bool)

(assert (=> b!1234442 (= e!700372 (contains!7229 (t!40613 (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135649 res!821898) b!1234441))

(assert (= (and b!1234441 (not res!821899)) b!1234442))

(declare-fun m!1138827 () Bool)

(assert (=> d!135649 m!1138827))

(assert (=> d!135649 m!1138621))

(declare-fun m!1138829 () Bool)

(assert (=> d!135649 m!1138829))

(assert (=> b!1234442 m!1138621))

(declare-fun m!1138831 () Bool)

(assert (=> b!1234442 m!1138831))

(assert (=> b!1234284 d!135649))

(declare-fun b!1234443 () Bool)

(declare-fun e!700374 () Bool)

(declare-fun e!700377 () Bool)

(assert (=> b!1234443 (= e!700374 e!700377)))

(declare-fun c!121139 () Bool)

(assert (=> b!1234443 (= c!121139 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!135651 () Bool)

(declare-fun res!821901 () Bool)

(declare-fun e!700376 () Bool)

(assert (=> d!135651 (=> res!821901 e!700376)))

(assert (=> d!135651 (= res!821901 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38909 a!3806)))))

(assert (=> d!135651 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121119 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155))) e!700376)))

(declare-fun call!61027 () Bool)

(declare-fun bm!61024 () Bool)

(assert (=> bm!61024 (= call!61027 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121139 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!121119 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155))) (ite c!121119 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)))))))

(declare-fun e!700375 () Bool)

(declare-fun b!1234444 () Bool)

(assert (=> b!1234444 (= e!700375 (contains!7229 (ite c!121119 (Cons!27154 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (Cons!27154 (select (arr!38372 a!3806) from!3184) Nil!27155)) (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234445 () Bool)

(assert (=> b!1234445 (= e!700377 call!61027)))

(declare-fun b!1234446 () Bool)

(assert (=> b!1234446 (= e!700376 e!700374)))

(declare-fun res!821902 () Bool)

(assert (=> b!1234446 (=> (not res!821902) (not e!700374))))

(assert (=> b!1234446 (= res!821902 (not e!700375))))

(declare-fun res!821900 () Bool)

(assert (=> b!1234446 (=> (not res!821900) (not e!700375))))

(assert (=> b!1234446 (= res!821900 (validKeyInArray!0 (select (arr!38372 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234447 () Bool)

(assert (=> b!1234447 (= e!700377 call!61027)))

(assert (= (and d!135651 (not res!821901)) b!1234446))

(assert (= (and b!1234446 res!821900) b!1234444))

(assert (= (and b!1234446 res!821902) b!1234443))

(assert (= (and b!1234443 c!121139) b!1234447))

(assert (= (and b!1234443 (not c!121139)) b!1234445))

(assert (= (or b!1234447 b!1234445) bm!61024))

(assert (=> b!1234443 m!1138783))

(assert (=> b!1234443 m!1138783))

(assert (=> b!1234443 m!1138785))

(assert (=> bm!61024 m!1138783))

(declare-fun m!1138833 () Bool)

(assert (=> bm!61024 m!1138833))

(assert (=> b!1234444 m!1138783))

(assert (=> b!1234444 m!1138783))

(declare-fun m!1138835 () Bool)

(assert (=> b!1234444 m!1138835))

(assert (=> b!1234446 m!1138783))

(assert (=> b!1234446 m!1138783))

(assert (=> b!1234446 m!1138785))

(assert (=> bm!61008 d!135651))

(assert (=> b!1234251 d!135525))

(check-sat (not b!1234399) (not b!1234416) (not b!1234425) (not d!135637) (not b!1234397) (not d!135641) (not b!1234394) (not b!1234438) (not d!135647) (not b!1234421) (not d!135615) (not b!1234418) (not bm!61021) (not b!1234434) (not b!1234414) (not bm!61022) (not b!1234427) (not b!1234446) (not b!1234407) (not d!135621) (not b!1234436) (not d!135611) (not d!135633) (not b!1234430) (not d!135643) (not b!1234432) (not b!1234400) (not b!1234440) (not b!1234403) (not bm!61023) (not d!135649) (not b!1234423) (not b!1234405) (not b!1234442) (not bm!61024) (not b!1234404) (not d!135639) (not b!1234415) (not b!1234401) (not b!1234444) (not d!135617) (not b!1234443) (not b!1234424) (not b!1234395))
(check-sat)
