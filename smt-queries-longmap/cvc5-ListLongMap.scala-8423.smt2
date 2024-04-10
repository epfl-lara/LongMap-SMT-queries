; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102582 () Bool)

(assert start!102582)

(declare-fun b!1233373 () Bool)

(declare-fun res!821595 () Bool)

(declare-fun e!699650 () Bool)

(assert (=> b!1233373 (=> (not res!821595) (not e!699650))))

(declare-datatypes ((List!27139 0))(
  ( (Nil!27136) (Cons!27135 (h!28344 (_ BitVec 64)) (t!40602 List!27139)) )
))
(declare-fun acc!823 () List!27139)

(declare-fun contains!7201 (List!27139 (_ BitVec 64)) Bool)

(assert (=> b!1233373 (= res!821595 (not (contains!7201 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233374 () Bool)

(declare-fun res!821590 () Bool)

(assert (=> b!1233374 (=> (not res!821590) (not e!699650))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79511 0))(
  ( (array!79512 (arr!38366 (Array (_ BitVec 32) (_ BitVec 64))) (size!38902 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79511)

(assert (=> b!1233374 (= res!821590 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38902 a!3806)) (bvslt from!3184 (size!38902 a!3806))))))

(declare-fun b!1233375 () Bool)

(declare-fun e!699651 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79511 (_ BitVec 32) List!27139) Bool)

(assert (=> b!1233375 (= e!699651 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136)))))

(declare-fun b!1233376 () Bool)

(declare-fun res!821589 () Bool)

(assert (=> b!1233376 (=> (not res!821589) (not e!699650))))

(assert (=> b!1233376 (= res!821589 (not (contains!7201 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233377 () Bool)

(declare-fun e!699649 () Bool)

(assert (=> b!1233377 (= e!699650 (not e!699649))))

(declare-fun res!821597 () Bool)

(assert (=> b!1233377 (=> res!821597 e!699649)))

(assert (=> b!1233377 (= res!821597 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!559672 () List!27139)

(assert (=> b!1233377 (= lt!559672 (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136))))

(assert (=> b!1233377 e!699651))

(declare-fun res!821596 () Bool)

(assert (=> b!1233377 (=> (not res!821596) (not e!699651))))

(assert (=> b!1233377 (= res!821596 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27136))))

(declare-datatypes ((Unit!40838 0))(
  ( (Unit!40839) )
))
(declare-fun lt!559673 () Unit!40838)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79511 List!27139 List!27139 (_ BitVec 32)) Unit!40838)

(assert (=> b!1233377 (= lt!559673 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27136 from!3184))))

(assert (=> b!1233377 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823))))

(declare-fun b!1233378 () Bool)

(declare-fun res!821592 () Bool)

(assert (=> b!1233378 (=> (not res!821592) (not e!699650))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233378 (= res!821592 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233379 () Bool)

(declare-fun res!821593 () Bool)

(assert (=> b!1233379 (=> res!821593 e!699649)))

(assert (=> b!1233379 (= res!821593 (contains!7201 lt!559672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!821594 () Bool)

(assert (=> start!102582 (=> (not res!821594) (not e!699650))))

(assert (=> start!102582 (= res!821594 (bvslt (size!38902 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102582 e!699650))

(declare-fun array_inv!29214 (array!79511) Bool)

(assert (=> start!102582 (array_inv!29214 a!3806)))

(assert (=> start!102582 true))

(declare-fun b!1233380 () Bool)

(declare-fun res!821598 () Bool)

(assert (=> b!1233380 (=> (not res!821598) (not e!699650))))

(declare-fun noDuplicate!1798 (List!27139) Bool)

(assert (=> b!1233380 (= res!821598 (noDuplicate!1798 acc!823))))

(declare-fun b!1233381 () Bool)

(declare-fun res!821599 () Bool)

(assert (=> b!1233381 (=> (not res!821599) (not e!699650))))

(assert (=> b!1233381 (= res!821599 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233382 () Bool)

(declare-fun res!821601 () Bool)

(assert (=> b!1233382 (=> res!821601 e!699649)))

(assert (=> b!1233382 (= res!821601 (contains!7201 lt!559672 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233383 () Bool)

(declare-fun res!821602 () Bool)

(assert (=> b!1233383 (=> (not res!821602) (not e!699650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233383 (= res!821602 (validKeyInArray!0 k!2913))))

(declare-fun b!1233384 () Bool)

(declare-fun res!821591 () Bool)

(assert (=> b!1233384 (=> res!821591 e!699649)))

(assert (=> b!1233384 (= res!821591 (not (noDuplicate!1798 lt!559672)))))

(declare-fun b!1233385 () Bool)

(declare-fun res!821600 () Bool)

(assert (=> b!1233385 (=> (not res!821600) (not e!699650))))

(assert (=> b!1233385 (= res!821600 (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233386 () Bool)

(assert (=> b!1233386 (= e!699649 (contains!7201 lt!559672 (select (arr!38366 a!3806) from!3184)))))

(assert (= (and start!102582 res!821594) b!1233383))

(assert (= (and b!1233383 res!821602) b!1233374))

(assert (= (and b!1233374 res!821590) b!1233380))

(assert (= (and b!1233380 res!821598) b!1233373))

(assert (= (and b!1233373 res!821595) b!1233376))

(assert (= (and b!1233376 res!821589) b!1233378))

(assert (= (and b!1233378 res!821592) b!1233381))

(assert (= (and b!1233381 res!821599) b!1233385))

(assert (= (and b!1233385 res!821600) b!1233377))

(assert (= (and b!1233377 res!821596) b!1233375))

(assert (= (and b!1233377 (not res!821597)) b!1233384))

(assert (= (and b!1233384 (not res!821591)) b!1233379))

(assert (= (and b!1233379 (not res!821593)) b!1233382))

(assert (= (and b!1233382 (not res!821601)) b!1233386))

(declare-fun m!1137451 () Bool)

(assert (=> b!1233375 m!1137451))

(declare-fun m!1137453 () Bool)

(assert (=> b!1233375 m!1137453))

(declare-fun m!1137455 () Bool)

(assert (=> b!1233379 m!1137455))

(declare-fun m!1137457 () Bool)

(assert (=> b!1233373 m!1137457))

(declare-fun m!1137459 () Bool)

(assert (=> b!1233382 m!1137459))

(declare-fun m!1137461 () Bool)

(assert (=> b!1233384 m!1137461))

(declare-fun m!1137463 () Bool)

(assert (=> b!1233383 m!1137463))

(declare-fun m!1137465 () Bool)

(assert (=> b!1233381 m!1137465))

(declare-fun m!1137467 () Bool)

(assert (=> b!1233378 m!1137467))

(assert (=> b!1233377 m!1137451))

(declare-fun m!1137469 () Bool)

(assert (=> b!1233377 m!1137469))

(declare-fun m!1137471 () Bool)

(assert (=> b!1233377 m!1137471))

(declare-fun m!1137473 () Bool)

(assert (=> b!1233377 m!1137473))

(assert (=> b!1233386 m!1137451))

(assert (=> b!1233386 m!1137451))

(declare-fun m!1137475 () Bool)

(assert (=> b!1233386 m!1137475))

(declare-fun m!1137477 () Bool)

(assert (=> b!1233376 m!1137477))

(declare-fun m!1137479 () Bool)

(assert (=> start!102582 m!1137479))

(assert (=> b!1233385 m!1137451))

(assert (=> b!1233385 m!1137451))

(declare-fun m!1137481 () Bool)

(assert (=> b!1233385 m!1137481))

(declare-fun m!1137483 () Bool)

(assert (=> b!1233380 m!1137483))

(push 1)

(assert (not b!1233375))

(assert (not b!1233373))

(assert (not start!102582))

(assert (not b!1233379))

(assert (not b!1233382))

(assert (not b!1233385))

(assert (not b!1233386))

(assert (not b!1233377))

(assert (not b!1233380))

(assert (not b!1233378))

(assert (not b!1233384))

(assert (not b!1233381))

(assert (not b!1233383))

(assert (not b!1233376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135273 () Bool)

(declare-fun lt!559693 () Bool)

(declare-fun content!576 (List!27139) (Set (_ BitVec 64)))

(assert (=> d!135273 (= lt!559693 (set.member (select (arr!38366 a!3806) from!3184) (content!576 lt!559672)))))

(declare-fun e!699699 () Bool)

(assert (=> d!135273 (= lt!559693 e!699699)))

(declare-fun res!821705 () Bool)

(assert (=> d!135273 (=> (not res!821705) (not e!699699))))

(assert (=> d!135273 (= res!821705 (is-Cons!27135 lt!559672))))

(assert (=> d!135273 (= (contains!7201 lt!559672 (select (arr!38366 a!3806) from!3184)) lt!559693)))

(declare-fun b!1233493 () Bool)

(declare-fun e!699696 () Bool)

(assert (=> b!1233493 (= e!699699 e!699696)))

(declare-fun res!821708 () Bool)

(assert (=> b!1233493 (=> res!821708 e!699696)))

(assert (=> b!1233493 (= res!821708 (= (h!28344 lt!559672) (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233494 () Bool)

(assert (=> b!1233494 (= e!699696 (contains!7201 (t!40602 lt!559672) (select (arr!38366 a!3806) from!3184)))))

(assert (= (and d!135273 res!821705) b!1233493))

(assert (= (and b!1233493 (not res!821708)) b!1233494))

(declare-fun m!1137559 () Bool)

(assert (=> d!135273 m!1137559))

(assert (=> d!135273 m!1137451))

(declare-fun m!1137561 () Bool)

(assert (=> d!135273 m!1137561))

(assert (=> b!1233494 m!1137451))

(declare-fun m!1137563 () Bool)

(assert (=> b!1233494 m!1137563))

(assert (=> b!1233386 d!135273))

(declare-fun b!1233532 () Bool)

(declare-fun e!699733 () Bool)

(declare-fun call!60975 () Bool)

(assert (=> b!1233532 (= e!699733 call!60975)))

(declare-fun b!1233533 () Bool)

(declare-fun e!699730 () Bool)

(assert (=> b!1233533 (= e!699730 (contains!7201 (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136) (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60972 () Bool)

(declare-fun c!120759 () Bool)

(assert (=> bm!60972 (= call!60975 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120759 (Cons!27135 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136)) (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136))))))

(declare-fun d!135279 () Bool)

(declare-fun res!821736 () Bool)

(declare-fun e!699732 () Bool)

(assert (=> d!135279 (=> res!821736 e!699732)))

(assert (=> d!135279 (= res!821736 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38902 a!3806)))))

(assert (=> d!135279 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136)) e!699732)))

(declare-fun b!1233534 () Bool)

(declare-fun e!699731 () Bool)

(assert (=> b!1233534 (= e!699731 e!699733)))

(assert (=> b!1233534 (= c!120759 (validKeyInArray!0 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233535 () Bool)

(assert (=> b!1233535 (= e!699732 e!699731)))

(declare-fun res!821735 () Bool)

(assert (=> b!1233535 (=> (not res!821735) (not e!699731))))

(assert (=> b!1233535 (= res!821735 (not e!699730))))

(declare-fun res!821734 () Bool)

(assert (=> b!1233535 (=> (not res!821734) (not e!699730))))

(assert (=> b!1233535 (= res!821734 (validKeyInArray!0 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233536 () Bool)

(assert (=> b!1233536 (= e!699733 call!60975)))

(assert (= (and d!135279 (not res!821736)) b!1233535))

(assert (= (and b!1233535 res!821734) b!1233533))

(assert (= (and b!1233535 res!821735) b!1233534))

(assert (= (and b!1233534 c!120759) b!1233532))

(assert (= (and b!1233534 (not c!120759)) b!1233536))

(assert (= (or b!1233532 b!1233536) bm!60972))

(declare-fun m!1137599 () Bool)

(assert (=> b!1233533 m!1137599))

(assert (=> b!1233533 m!1137599))

(declare-fun m!1137601 () Bool)

(assert (=> b!1233533 m!1137601))

(assert (=> bm!60972 m!1137599))

(declare-fun m!1137603 () Bool)

(assert (=> bm!60972 m!1137603))

(assert (=> b!1233534 m!1137599))

(assert (=> b!1233534 m!1137599))

(declare-fun m!1137605 () Bool)

(assert (=> b!1233534 m!1137605))

(assert (=> b!1233535 m!1137599))

(assert (=> b!1233535 m!1137599))

(assert (=> b!1233535 m!1137605))

(assert (=> b!1233375 d!135279))

(declare-fun d!135297 () Bool)

(assert (=> d!135297 (= (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)) (and (not (= (select (arr!38366 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38366 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233385 d!135297))

(declare-fun d!135299 () Bool)

(declare-fun res!821756 () Bool)

(declare-fun e!699756 () Bool)

(assert (=> d!135299 (=> res!821756 e!699756)))

(assert (=> d!135299 (= res!821756 (is-Nil!27136 lt!559672))))

(assert (=> d!135299 (= (noDuplicate!1798 lt!559672) e!699756)))

(declare-fun b!1233562 () Bool)

(declare-fun e!699757 () Bool)

(assert (=> b!1233562 (= e!699756 e!699757)))

(declare-fun res!821757 () Bool)

(assert (=> b!1233562 (=> (not res!821757) (not e!699757))))

(assert (=> b!1233562 (= res!821757 (not (contains!7201 (t!40602 lt!559672) (h!28344 lt!559672))))))

(declare-fun b!1233563 () Bool)

(assert (=> b!1233563 (= e!699757 (noDuplicate!1798 (t!40602 lt!559672)))))

(assert (= (and d!135299 (not res!821756)) b!1233562))

(assert (= (and b!1233562 res!821757) b!1233563))

(declare-fun m!1137609 () Bool)

(assert (=> b!1233562 m!1137609))

(declare-fun m!1137611 () Bool)

(assert (=> b!1233563 m!1137611))

(assert (=> b!1233384 d!135299))

(declare-fun d!135303 () Bool)

(declare-fun lt!559699 () Bool)

(assert (=> d!135303 (= lt!559699 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!576 acc!823)))))

(declare-fun e!699763 () Bool)

(assert (=> d!135303 (= lt!559699 e!699763)))

(declare-fun res!821762 () Bool)

(assert (=> d!135303 (=> (not res!821762) (not e!699763))))

(assert (=> d!135303 (= res!821762 (is-Cons!27135 acc!823))))

(assert (=> d!135303 (= (contains!7201 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559699)))

(declare-fun b!1233568 () Bool)

(declare-fun e!699762 () Bool)

(assert (=> b!1233568 (= e!699763 e!699762)))

(declare-fun res!821763 () Bool)

(assert (=> b!1233568 (=> res!821763 e!699762)))

(assert (=> b!1233568 (= res!821763 (= (h!28344 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233569 () Bool)

(assert (=> b!1233569 (= e!699762 (contains!7201 (t!40602 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135303 res!821762) b!1233568))

(assert (= (and b!1233568 (not res!821763)) b!1233569))

(declare-fun m!1137617 () Bool)

(assert (=> d!135303 m!1137617))

(declare-fun m!1137619 () Bool)

(assert (=> d!135303 m!1137619))

(declare-fun m!1137621 () Bool)

(assert (=> b!1233569 m!1137621))

(assert (=> b!1233373 d!135303))

(declare-fun d!135307 () Bool)

(assert (=> d!135307 (= (array_inv!29214 a!3806) (bvsge (size!38902 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102582 d!135307))

(declare-fun d!135309 () Bool)

(assert (=> d!135309 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233383 d!135309))

(declare-fun d!135311 () Bool)

(declare-fun lt!559700 () Bool)

(assert (=> d!135311 (= lt!559700 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!576 lt!559672)))))

(declare-fun e!699771 () Bool)

(assert (=> d!135311 (= lt!559700 e!699771)))

(declare-fun res!821769 () Bool)

(assert (=> d!135311 (=> (not res!821769) (not e!699771))))

(assert (=> d!135311 (= res!821769 (is-Cons!27135 lt!559672))))

(assert (=> d!135311 (= (contains!7201 lt!559672 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559700)))

(declare-fun b!1233577 () Bool)

(declare-fun e!699770 () Bool)

(assert (=> b!1233577 (= e!699771 e!699770)))

(declare-fun res!821770 () Bool)

(assert (=> b!1233577 (=> res!821770 e!699770)))

(assert (=> b!1233577 (= res!821770 (= (h!28344 lt!559672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233578 () Bool)

(assert (=> b!1233578 (= e!699770 (contains!7201 (t!40602 lt!559672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135311 res!821769) b!1233577))

(assert (= (and b!1233577 (not res!821770)) b!1233578))

(assert (=> d!135311 m!1137559))

(declare-fun m!1137635 () Bool)

(assert (=> d!135311 m!1137635))

(declare-fun m!1137637 () Bool)

(assert (=> b!1233578 m!1137637))

(assert (=> b!1233382 d!135311))

(declare-fun b!1233583 () Bool)

(declare-fun e!699779 () Bool)

(declare-fun call!60980 () Bool)

(assert (=> b!1233583 (= e!699779 call!60980)))

(declare-fun e!699776 () Bool)

(declare-fun b!1233584 () Bool)

(assert (=> b!1233584 (= e!699776 (contains!7201 acc!823 (select (arr!38366 a!3806) from!3184)))))

(declare-fun bm!60977 () Bool)

(declare-fun c!120764 () Bool)

(assert (=> bm!60977 (= call!60980 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120764 (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!135317 () Bool)

(declare-fun res!821777 () Bool)

(declare-fun e!699778 () Bool)

(assert (=> d!135317 (=> res!821777 e!699778)))

(assert (=> d!135317 (= res!821777 (bvsge from!3184 (size!38902 a!3806)))))

(assert (=> d!135317 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699778)))

(declare-fun b!1233585 () Bool)

(declare-fun e!699777 () Bool)

(assert (=> b!1233585 (= e!699777 e!699779)))

(assert (=> b!1233585 (= c!120764 (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233586 () Bool)

(assert (=> b!1233586 (= e!699778 e!699777)))

(declare-fun res!821776 () Bool)

(assert (=> b!1233586 (=> (not res!821776) (not e!699777))))

(assert (=> b!1233586 (= res!821776 (not e!699776))))

(declare-fun res!821775 () Bool)

(assert (=> b!1233586 (=> (not res!821775) (not e!699776))))

(assert (=> b!1233586 (= res!821775 (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233587 () Bool)

(assert (=> b!1233587 (= e!699779 call!60980)))

(assert (= (and d!135317 (not res!821777)) b!1233586))

(assert (= (and b!1233586 res!821775) b!1233584))

(assert (= (and b!1233586 res!821776) b!1233585))

(assert (= (and b!1233585 c!120764) b!1233583))

(assert (= (and b!1233585 (not c!120764)) b!1233587))

(assert (= (or b!1233583 b!1233587) bm!60977))

(assert (=> b!1233584 m!1137451))

(assert (=> b!1233584 m!1137451))

(declare-fun m!1137655 () Bool)

(assert (=> b!1233584 m!1137655))

(assert (=> bm!60977 m!1137451))

(declare-fun m!1137657 () Bool)

(assert (=> bm!60977 m!1137657))

(assert (=> b!1233585 m!1137451))

(assert (=> b!1233585 m!1137451))

(assert (=> b!1233585 m!1137481))

(assert (=> b!1233586 m!1137451))

(assert (=> b!1233586 m!1137451))

(assert (=> b!1233586 m!1137481))

(assert (=> b!1233381 d!135317))

(declare-fun d!135329 () Bool)

(declare-fun res!821786 () Bool)

(declare-fun e!699788 () Bool)

(assert (=> d!135329 (=> res!821786 e!699788)))

(assert (=> d!135329 (= res!821786 (is-Nil!27136 acc!823))))

(assert (=> d!135329 (= (noDuplicate!1798 acc!823) e!699788)))

(declare-fun b!1233596 () Bool)

(declare-fun e!699789 () Bool)

(assert (=> b!1233596 (= e!699788 e!699789)))

(declare-fun res!821787 () Bool)

(assert (=> b!1233596 (=> (not res!821787) (not e!699789))))

(assert (=> b!1233596 (= res!821787 (not (contains!7201 (t!40602 acc!823) (h!28344 acc!823))))))

(declare-fun b!1233597 () Bool)

(assert (=> b!1233597 (= e!699789 (noDuplicate!1798 (t!40602 acc!823)))))

(assert (= (and d!135329 (not res!821786)) b!1233596))

(assert (= (and b!1233596 res!821787) b!1233597))

(declare-fun m!1137665 () Bool)

(assert (=> b!1233596 m!1137665))

(declare-fun m!1137669 () Bool)

(assert (=> b!1233597 m!1137669))

(assert (=> b!1233380 d!135329))

(declare-fun d!135331 () Bool)

(declare-fun lt!559706 () Bool)

(assert (=> d!135331 (= lt!559706 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!576 lt!559672)))))

(declare-fun e!699791 () Bool)

(assert (=> d!135331 (= lt!559706 e!699791)))

(declare-fun res!821788 () Bool)

(assert (=> d!135331 (=> (not res!821788) (not e!699791))))

(assert (=> d!135331 (= res!821788 (is-Cons!27135 lt!559672))))

(assert (=> d!135331 (= (contains!7201 lt!559672 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559706)))

(declare-fun b!1233598 () Bool)

(declare-fun e!699790 () Bool)

(assert (=> b!1233598 (= e!699791 e!699790)))

(declare-fun res!821789 () Bool)

(assert (=> b!1233598 (=> res!821789 e!699790)))

(assert (=> b!1233598 (= res!821789 (= (h!28344 lt!559672) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233599 () Bool)

(assert (=> b!1233599 (= e!699790 (contains!7201 (t!40602 lt!559672) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135331 res!821788) b!1233598))

(assert (= (and b!1233598 (not res!821789)) b!1233599))

(assert (=> d!135331 m!1137559))

(declare-fun m!1137673 () Bool)

(assert (=> d!135331 m!1137673))

(declare-fun m!1137675 () Bool)

(assert (=> b!1233599 m!1137675))

(assert (=> b!1233379 d!135331))

(declare-fun d!135337 () Bool)

(declare-fun res!821806 () Bool)

(declare-fun e!699810 () Bool)

(assert (=> d!135337 (=> res!821806 e!699810)))

(assert (=> d!135337 (= res!821806 (= (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!135337 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699810)))

(declare-fun b!1233620 () Bool)

(declare-fun e!699811 () Bool)

(assert (=> b!1233620 (= e!699810 e!699811)))

(declare-fun res!821807 () Bool)

(assert (=> b!1233620 (=> (not res!821807) (not e!699811))))

(assert (=> b!1233620 (= res!821807 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38902 a!3806)))))

(declare-fun b!1233621 () Bool)

(assert (=> b!1233621 (= e!699811 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135337 (not res!821806)) b!1233620))

(assert (= (and b!1233620 res!821807) b!1233621))

(assert (=> d!135337 m!1137599))

(declare-fun m!1137697 () Bool)

(assert (=> b!1233621 m!1137697))

(assert (=> b!1233378 d!135337))

(declare-fun b!1233622 () Bool)

(declare-fun e!699815 () Bool)

(declare-fun call!60983 () Bool)

(assert (=> b!1233622 (= e!699815 call!60983)))

(declare-fun b!1233623 () Bool)

(declare-fun e!699812 () Bool)

(assert (=> b!1233623 (= e!699812 (contains!7201 Nil!27136 (select (arr!38366 a!3806) from!3184)))))

(declare-fun c!120767 () Bool)

(declare-fun bm!60980 () Bool)

(assert (=> bm!60980 (= call!60983 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120767 (Cons!27135 (select (arr!38366 a!3806) from!3184) Nil!27136) Nil!27136)))))

(declare-fun d!135353 () Bool)

(declare-fun res!821810 () Bool)

(declare-fun e!699814 () Bool)

(assert (=> d!135353 (=> res!821810 e!699814)))

(assert (=> d!135353 (= res!821810 (bvsge from!3184 (size!38902 a!3806)))))

(assert (=> d!135353 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27136) e!699814)))

(declare-fun b!1233624 () Bool)

(declare-fun e!699813 () Bool)

(assert (=> b!1233624 (= e!699813 e!699815)))

(assert (=> b!1233624 (= c!120767 (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233625 () Bool)

(assert (=> b!1233625 (= e!699814 e!699813)))

(declare-fun res!821809 () Bool)

(assert (=> b!1233625 (=> (not res!821809) (not e!699813))))

(assert (=> b!1233625 (= res!821809 (not e!699812))))

(declare-fun res!821808 () Bool)

(assert (=> b!1233625 (=> (not res!821808) (not e!699812))))

(assert (=> b!1233625 (= res!821808 (validKeyInArray!0 (select (arr!38366 a!3806) from!3184)))))

(declare-fun b!1233626 () Bool)

(assert (=> b!1233626 (= e!699815 call!60983)))

(assert (= (and d!135353 (not res!821810)) b!1233625))

(assert (= (and b!1233625 res!821808) b!1233623))

(assert (= (and b!1233625 res!821809) b!1233624))

(assert (= (and b!1233624 c!120767) b!1233622))

(assert (= (and b!1233624 (not c!120767)) b!1233626))

(assert (= (or b!1233622 b!1233626) bm!60980))

(assert (=> b!1233623 m!1137451))

(assert (=> b!1233623 m!1137451))

(declare-fun m!1137699 () Bool)

(assert (=> b!1233623 m!1137699))

(assert (=> bm!60980 m!1137451))

(declare-fun m!1137701 () Bool)

(assert (=> bm!60980 m!1137701))

(assert (=> b!1233624 m!1137451))

(assert (=> b!1233624 m!1137451))

(assert (=> b!1233624 m!1137481))

(assert (=> b!1233625 m!1137451))

(assert (=> b!1233625 m!1137451))

(assert (=> b!1233625 m!1137481))

(assert (=> b!1233377 d!135353))

(declare-fun d!135355 () Bool)

(assert (=> d!135355 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27136)))

(declare-fun lt!559714 () Unit!40838)

(declare-fun choose!80 (array!79511 List!27139 List!27139 (_ BitVec 32)) Unit!40838)

(assert (=> d!135355 (= lt!559714 (choose!80 a!3806 acc!823 Nil!27136 from!3184))))

(assert (=> d!135355 (bvslt (size!38902 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135355 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27136 from!3184) lt!559714)))

(declare-fun bs!34660 () Bool)

(assert (= bs!34660 d!135355))

(assert (=> bs!34660 m!1137469))

(declare-fun m!1137709 () Bool)

(assert (=> bs!34660 m!1137709))

(assert (=> b!1233377 d!135355))

(declare-fun b!1233632 () Bool)

(declare-fun e!699823 () Bool)

(declare-fun call!60985 () Bool)

(assert (=> b!1233632 (= e!699823 call!60985)))

(declare-fun e!699820 () Bool)

(declare-fun b!1233633 () Bool)

(assert (=> b!1233633 (= e!699820 (contains!7201 (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823) (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun c!120769 () Bool)

(declare-fun bm!60982 () Bool)

(assert (=> bm!60982 (= call!60985 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120769 (Cons!27135 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823)) (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823))))))

(declare-fun d!135361 () Bool)

(declare-fun res!821816 () Bool)

(declare-fun e!699822 () Bool)

(assert (=> d!135361 (=> res!821816 e!699822)))

(assert (=> d!135361 (= res!821816 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38902 a!3806)))))

(assert (=> d!135361 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27135 (select (arr!38366 a!3806) from!3184) acc!823)) e!699822)))

(declare-fun b!1233634 () Bool)

(declare-fun e!699821 () Bool)

(assert (=> b!1233634 (= e!699821 e!699823)))

(assert (=> b!1233634 (= c!120769 (validKeyInArray!0 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233635 () Bool)

(assert (=> b!1233635 (= e!699822 e!699821)))

(declare-fun res!821815 () Bool)

(assert (=> b!1233635 (=> (not res!821815) (not e!699821))))

(assert (=> b!1233635 (= res!821815 (not e!699820))))

(declare-fun res!821814 () Bool)

(assert (=> b!1233635 (=> (not res!821814) (not e!699820))))

(assert (=> b!1233635 (= res!821814 (validKeyInArray!0 (select (arr!38366 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233636 () Bool)

(assert (=> b!1233636 (= e!699823 call!60985)))

(assert (= (and d!135361 (not res!821816)) b!1233635))

(assert (= (and b!1233635 res!821814) b!1233633))

(assert (= (and b!1233635 res!821815) b!1233634))

(assert (= (and b!1233634 c!120769) b!1233632))

(assert (= (and b!1233634 (not c!120769)) b!1233636))

(assert (= (or b!1233632 b!1233636) bm!60982))

(assert (=> b!1233633 m!1137599))

(assert (=> b!1233633 m!1137599))

(declare-fun m!1137711 () Bool)

(assert (=> b!1233633 m!1137711))

(assert (=> bm!60982 m!1137599))

(declare-fun m!1137713 () Bool)

(assert (=> bm!60982 m!1137713))

(assert (=> b!1233634 m!1137599))

(assert (=> b!1233634 m!1137599))

(assert (=> b!1233634 m!1137605))

(assert (=> b!1233635 m!1137599))

(assert (=> b!1233635 m!1137599))

(assert (=> b!1233635 m!1137605))

(assert (=> b!1233377 d!135361))

(declare-fun d!135363 () Bool)

(declare-fun lt!559715 () Bool)

(assert (=> d!135363 (= lt!559715 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!576 acc!823)))))

(declare-fun e!699829 () Bool)

(assert (=> d!135363 (= lt!559715 e!699829)))

(declare-fun res!821821 () Bool)

(assert (=> d!135363 (=> (not res!821821) (not e!699829))))

(assert (=> d!135363 (= res!821821 (is-Cons!27135 acc!823))))

(assert (=> d!135363 (= (contains!7201 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559715)))

(declare-fun b!1233641 () Bool)

(declare-fun e!699828 () Bool)

(assert (=> b!1233641 (= e!699829 e!699828)))

(declare-fun res!821822 () Bool)

(assert (=> b!1233641 (=> res!821822 e!699828)))

(assert (=> b!1233641 (= res!821822 (= (h!28344 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233642 () Bool)

(assert (=> b!1233642 (= e!699828 (contains!7201 (t!40602 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135363 res!821821) b!1233641))

(assert (= (and b!1233641 (not res!821822)) b!1233642))

(assert (=> d!135363 m!1137617))

(declare-fun m!1137715 () Bool)

(assert (=> d!135363 m!1137715))

(declare-fun m!1137717 () Bool)

(assert (=> b!1233642 m!1137717))

(assert (=> b!1233376 d!135363))

(push 1)

