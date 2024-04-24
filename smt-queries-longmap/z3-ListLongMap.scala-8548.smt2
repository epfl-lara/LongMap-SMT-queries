; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104540 () Bool)

(assert start!104540)

(declare-fun b!1247069 () Bool)

(declare-fun res!831709 () Bool)

(declare-fun e!707302 () Bool)

(assert (=> b!1247069 (=> (not res!831709) (not e!707302))))

(declare-datatypes ((array!80233 0))(
  ( (array!80234 (arr!38693 (Array (_ BitVec 32) (_ BitVec 64))) (size!39230 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80233)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1247069 (= res!831709 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39230 a!3892)) (not (= newFrom!287 (size!39230 a!3892)))))))

(declare-fun b!1247070 () Bool)

(declare-fun res!831705 () Bool)

(assert (=> b!1247070 (=> (not res!831705) (not e!707302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247070 (= res!831705 (validKeyInArray!0 (select (arr!38693 a!3892) from!3270)))))

(declare-fun b!1247071 () Bool)

(declare-fun res!831712 () Bool)

(declare-fun e!707303 () Bool)

(assert (=> b!1247071 (=> (not res!831712) (not e!707303))))

(declare-datatypes ((List!27509 0))(
  ( (Nil!27506) (Cons!27505 (h!28723 (_ BitVec 64)) (t!40970 List!27509)) )
))
(declare-fun lt!563455 () List!27509)

(declare-fun contains!7483 (List!27509 (_ BitVec 64)) Bool)

(assert (=> b!1247071 (= res!831712 (not (contains!7483 lt!563455 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247072 () Bool)

(declare-fun res!831711 () Bool)

(assert (=> b!1247072 (=> (not res!831711) (not e!707303))))

(assert (=> b!1247072 (= res!831711 (not (contains!7483 lt!563455 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831713 () Bool)

(assert (=> start!104540 (=> (not res!831713) (not e!707302))))

(assert (=> start!104540 (= res!831713 (and (bvslt (size!39230 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39230 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39230 a!3892))))))

(assert (=> start!104540 e!707302))

(declare-fun array_inv!29631 (array!80233) Bool)

(assert (=> start!104540 (array_inv!29631 a!3892)))

(assert (=> start!104540 true))

(declare-fun b!1247073 () Bool)

(declare-fun e!707300 () Bool)

(assert (=> b!1247073 (= e!707300 (contains!7483 Nil!27506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247074 () Bool)

(declare-fun res!831706 () Bool)

(assert (=> b!1247074 (=> (not res!831706) (not e!707303))))

(declare-fun noDuplicate!2047 (List!27509) Bool)

(assert (=> b!1247074 (= res!831706 (noDuplicate!2047 lt!563455))))

(declare-fun b!1247075 () Bool)

(declare-fun res!831707 () Bool)

(assert (=> b!1247075 (=> (not res!831707) (not e!707302))))

(declare-fun arrayNoDuplicates!0 (array!80233 (_ BitVec 32) List!27509) Bool)

(assert (=> b!1247075 (= res!831707 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27506))))

(declare-fun b!1247076 () Bool)

(assert (=> b!1247076 (= e!707303 e!707300)))

(declare-fun res!831710 () Bool)

(assert (=> b!1247076 (=> res!831710 e!707300)))

(assert (=> b!1247076 (= res!831710 (contains!7483 Nil!27506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247077 () Bool)

(assert (=> b!1247077 (= e!707302 e!707303)))

(declare-fun res!831708 () Bool)

(assert (=> b!1247077 (=> (not res!831708) (not e!707303))))

(assert (=> b!1247077 (= res!831708 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1247077 (= lt!563455 (Cons!27505 (select (arr!38693 a!3892) from!3270) Nil!27506))))

(assert (= (and start!104540 res!831713) b!1247075))

(assert (= (and b!1247075 res!831707) b!1247069))

(assert (= (and b!1247069 res!831709) b!1247070))

(assert (= (and b!1247070 res!831705) b!1247077))

(assert (= (and b!1247077 res!831708) b!1247074))

(assert (= (and b!1247074 res!831706) b!1247072))

(assert (= (and b!1247072 res!831711) b!1247071))

(assert (= (and b!1247071 res!831712) b!1247076))

(assert (= (and b!1247076 (not res!831710)) b!1247073))

(declare-fun m!1149387 () Bool)

(assert (=> b!1247070 m!1149387))

(assert (=> b!1247070 m!1149387))

(declare-fun m!1149389 () Bool)

(assert (=> b!1247070 m!1149389))

(declare-fun m!1149391 () Bool)

(assert (=> b!1247075 m!1149391))

(declare-fun m!1149393 () Bool)

(assert (=> start!104540 m!1149393))

(declare-fun m!1149395 () Bool)

(assert (=> b!1247071 m!1149395))

(declare-fun m!1149397 () Bool)

(assert (=> b!1247073 m!1149397))

(declare-fun m!1149399 () Bool)

(assert (=> b!1247074 m!1149399))

(declare-fun m!1149401 () Bool)

(assert (=> b!1247076 m!1149401))

(declare-fun m!1149403 () Bool)

(assert (=> b!1247072 m!1149403))

(assert (=> b!1247077 m!1149387))

(check-sat (not start!104540) (not b!1247075) (not b!1247073) (not b!1247070) (not b!1247074) (not b!1247076) (not b!1247071) (not b!1247072))
(check-sat)
(get-model)

(declare-fun d!137931 () Bool)

(assert (=> d!137931 (= (array_inv!29631 a!3892) (bvsge (size!39230 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104540 d!137931))

(declare-fun d!137933 () Bool)

(declare-fun lt!563464 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!624 (List!27509) (InoxSet (_ BitVec 64)))

(assert (=> d!137933 (= lt!563464 (select (content!624 lt!563455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707333 () Bool)

(assert (=> d!137933 (= lt!563464 e!707333)))

(declare-fun res!831772 () Bool)

(assert (=> d!137933 (=> (not res!831772) (not e!707333))))

(get-info :version)

(assert (=> d!137933 (= res!831772 ((_ is Cons!27505) lt!563455))))

(assert (=> d!137933 (= (contains!7483 lt!563455 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563464)))

(declare-fun b!1247136 () Bool)

(declare-fun e!707332 () Bool)

(assert (=> b!1247136 (= e!707333 e!707332)))

(declare-fun res!831773 () Bool)

(assert (=> b!1247136 (=> res!831773 e!707332)))

(assert (=> b!1247136 (= res!831773 (= (h!28723 lt!563455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247137 () Bool)

(assert (=> b!1247137 (= e!707332 (contains!7483 (t!40970 lt!563455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137933 res!831772) b!1247136))

(assert (= (and b!1247136 (not res!831773)) b!1247137))

(declare-fun m!1149441 () Bool)

(assert (=> d!137933 m!1149441))

(declare-fun m!1149443 () Bool)

(assert (=> d!137933 m!1149443))

(declare-fun m!1149445 () Bool)

(assert (=> b!1247137 m!1149445))

(assert (=> b!1247072 d!137933))

(declare-fun d!137935 () Bool)

(declare-fun lt!563465 () Bool)

(assert (=> d!137935 (= lt!563465 (select (content!624 lt!563455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707335 () Bool)

(assert (=> d!137935 (= lt!563465 e!707335)))

(declare-fun res!831774 () Bool)

(assert (=> d!137935 (=> (not res!831774) (not e!707335))))

(assert (=> d!137935 (= res!831774 ((_ is Cons!27505) lt!563455))))

(assert (=> d!137935 (= (contains!7483 lt!563455 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563465)))

(declare-fun b!1247138 () Bool)

(declare-fun e!707334 () Bool)

(assert (=> b!1247138 (= e!707335 e!707334)))

(declare-fun res!831775 () Bool)

(assert (=> b!1247138 (=> res!831775 e!707334)))

(assert (=> b!1247138 (= res!831775 (= (h!28723 lt!563455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247139 () Bool)

(assert (=> b!1247139 (= e!707334 (contains!7483 (t!40970 lt!563455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137935 res!831774) b!1247138))

(assert (= (and b!1247138 (not res!831775)) b!1247139))

(assert (=> d!137935 m!1149441))

(declare-fun m!1149447 () Bool)

(assert (=> d!137935 m!1149447))

(declare-fun m!1149449 () Bool)

(assert (=> b!1247139 m!1149449))

(assert (=> b!1247071 d!137935))

(declare-fun d!137937 () Bool)

(declare-fun lt!563466 () Bool)

(assert (=> d!137937 (= lt!563466 (select (content!624 Nil!27506) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707337 () Bool)

(assert (=> d!137937 (= lt!563466 e!707337)))

(declare-fun res!831776 () Bool)

(assert (=> d!137937 (=> (not res!831776) (not e!707337))))

(assert (=> d!137937 (= res!831776 ((_ is Cons!27505) Nil!27506))))

(assert (=> d!137937 (= (contains!7483 Nil!27506 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563466)))

(declare-fun b!1247140 () Bool)

(declare-fun e!707336 () Bool)

(assert (=> b!1247140 (= e!707337 e!707336)))

(declare-fun res!831777 () Bool)

(assert (=> b!1247140 (=> res!831777 e!707336)))

(assert (=> b!1247140 (= res!831777 (= (h!28723 Nil!27506) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247141 () Bool)

(assert (=> b!1247141 (= e!707336 (contains!7483 (t!40970 Nil!27506) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137937 res!831776) b!1247140))

(assert (= (and b!1247140 (not res!831777)) b!1247141))

(declare-fun m!1149451 () Bool)

(assert (=> d!137937 m!1149451))

(declare-fun m!1149453 () Bool)

(assert (=> d!137937 m!1149453))

(declare-fun m!1149455 () Bool)

(assert (=> b!1247141 m!1149455))

(assert (=> b!1247076 d!137937))

(declare-fun b!1247156 () Bool)

(declare-fun e!707353 () Bool)

(assert (=> b!1247156 (= e!707353 (contains!7483 Nil!27506 (select (arr!38693 a!3892) from!3270)))))

(declare-fun b!1247157 () Bool)

(declare-fun e!707352 () Bool)

(declare-fun e!707351 () Bool)

(assert (=> b!1247157 (= e!707352 e!707351)))

(declare-fun c!122376 () Bool)

(assert (=> b!1247157 (= c!122376 (validKeyInArray!0 (select (arr!38693 a!3892) from!3270)))))

(declare-fun b!1247158 () Bool)

(declare-fun call!61567 () Bool)

(assert (=> b!1247158 (= e!707351 call!61567)))

(declare-fun b!1247159 () Bool)

(assert (=> b!1247159 (= e!707351 call!61567)))

(declare-fun d!137939 () Bool)

(declare-fun res!831788 () Bool)

(declare-fun e!707350 () Bool)

(assert (=> d!137939 (=> res!831788 e!707350)))

(assert (=> d!137939 (= res!831788 (bvsge from!3270 (size!39230 a!3892)))))

(assert (=> d!137939 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27506) e!707350)))

(declare-fun b!1247160 () Bool)

(assert (=> b!1247160 (= e!707350 e!707352)))

(declare-fun res!831789 () Bool)

(assert (=> b!1247160 (=> (not res!831789) (not e!707352))))

(assert (=> b!1247160 (= res!831789 (not e!707353))))

(declare-fun res!831790 () Bool)

(assert (=> b!1247160 (=> (not res!831790) (not e!707353))))

(assert (=> b!1247160 (= res!831790 (validKeyInArray!0 (select (arr!38693 a!3892) from!3270)))))

(declare-fun bm!61564 () Bool)

(assert (=> bm!61564 (= call!61567 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122376 (Cons!27505 (select (arr!38693 a!3892) from!3270) Nil!27506) Nil!27506)))))

(assert (= (and d!137939 (not res!831788)) b!1247160))

(assert (= (and b!1247160 res!831790) b!1247156))

(assert (= (and b!1247160 res!831789) b!1247157))

(assert (= (and b!1247157 c!122376) b!1247159))

(assert (= (and b!1247157 (not c!122376)) b!1247158))

(assert (= (or b!1247159 b!1247158) bm!61564))

(assert (=> b!1247156 m!1149387))

(assert (=> b!1247156 m!1149387))

(declare-fun m!1149457 () Bool)

(assert (=> b!1247156 m!1149457))

(assert (=> b!1247157 m!1149387))

(assert (=> b!1247157 m!1149387))

(assert (=> b!1247157 m!1149389))

(assert (=> b!1247160 m!1149387))

(assert (=> b!1247160 m!1149387))

(assert (=> b!1247160 m!1149389))

(assert (=> bm!61564 m!1149387))

(declare-fun m!1149459 () Bool)

(assert (=> bm!61564 m!1149459))

(assert (=> b!1247075 d!137939))

(declare-fun d!137947 () Bool)

(assert (=> d!137947 (= (validKeyInArray!0 (select (arr!38693 a!3892) from!3270)) (and (not (= (select (arr!38693 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38693 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1247070 d!137947))

(declare-fun d!137953 () Bool)

(declare-fun res!831803 () Bool)

(declare-fun e!707366 () Bool)

(assert (=> d!137953 (=> res!831803 e!707366)))

(assert (=> d!137953 (= res!831803 ((_ is Nil!27506) lt!563455))))

(assert (=> d!137953 (= (noDuplicate!2047 lt!563455) e!707366)))

(declare-fun b!1247173 () Bool)

(declare-fun e!707367 () Bool)

(assert (=> b!1247173 (= e!707366 e!707367)))

(declare-fun res!831804 () Bool)

(assert (=> b!1247173 (=> (not res!831804) (not e!707367))))

(assert (=> b!1247173 (= res!831804 (not (contains!7483 (t!40970 lt!563455) (h!28723 lt!563455))))))

(declare-fun b!1247174 () Bool)

(assert (=> b!1247174 (= e!707367 (noDuplicate!2047 (t!40970 lt!563455)))))

(assert (= (and d!137953 (not res!831803)) b!1247173))

(assert (= (and b!1247173 res!831804) b!1247174))

(declare-fun m!1149471 () Bool)

(assert (=> b!1247173 m!1149471))

(declare-fun m!1149473 () Bool)

(assert (=> b!1247174 m!1149473))

(assert (=> b!1247074 d!137953))

(declare-fun d!137957 () Bool)

(declare-fun lt!563470 () Bool)

(assert (=> d!137957 (= lt!563470 (select (content!624 Nil!27506) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707369 () Bool)

(assert (=> d!137957 (= lt!563470 e!707369)))

(declare-fun res!831805 () Bool)

(assert (=> d!137957 (=> (not res!831805) (not e!707369))))

(assert (=> d!137957 (= res!831805 ((_ is Cons!27505) Nil!27506))))

(assert (=> d!137957 (= (contains!7483 Nil!27506 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563470)))

(declare-fun b!1247175 () Bool)

(declare-fun e!707368 () Bool)

(assert (=> b!1247175 (= e!707369 e!707368)))

(declare-fun res!831806 () Bool)

(assert (=> b!1247175 (=> res!831806 e!707368)))

(assert (=> b!1247175 (= res!831806 (= (h!28723 Nil!27506) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247176 () Bool)

(assert (=> b!1247176 (= e!707368 (contains!7483 (t!40970 Nil!27506) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137957 res!831805) b!1247175))

(assert (= (and b!1247175 (not res!831806)) b!1247176))

(assert (=> d!137957 m!1149451))

(declare-fun m!1149475 () Bool)

(assert (=> d!137957 m!1149475))

(declare-fun m!1149477 () Bool)

(assert (=> b!1247176 m!1149477))

(assert (=> b!1247073 d!137957))

(check-sat (not b!1247176) (not b!1247137) (not b!1247157) (not d!137957) (not b!1247139) (not b!1247141) (not bm!61564) (not b!1247156) (not d!137935) (not b!1247174) (not b!1247173) (not d!137937) (not d!137933) (not b!1247160))
(check-sat)
