; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102150 () Bool)

(assert start!102150)

(declare-fun b!1228379 () Bool)

(declare-fun res!816238 () Bool)

(declare-fun e!697640 () Bool)

(assert (=> b!1228379 (=> (not res!816238) (not e!697640))))

(declare-datatypes ((array!79256 0))(
  ( (array!79257 (arr!38246 (Array (_ BitVec 32) (_ BitVec 64))) (size!38783 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79256)

(declare-datatypes ((List!27032 0))(
  ( (Nil!27029) (Cons!27028 (h!28246 (_ BitVec 64)) (t!40487 List!27032)) )
))
(declare-fun acc!823 () List!27032)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79256 (_ BitVec 32) List!27032) Bool)

(assert (=> b!1228379 (= res!816238 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228380 () Bool)

(declare-fun res!816237 () Bool)

(assert (=> b!1228380 (=> (not res!816237) (not e!697640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228380 (= res!816237 (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)))))

(declare-fun b!1228381 () Bool)

(declare-fun e!697642 () Bool)

(assert (=> b!1228381 (= e!697640 e!697642)))

(declare-fun res!816239 () Bool)

(assert (=> b!1228381 (=> (not res!816239) (not e!697642))))

(assert (=> b!1228381 (= res!816239 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!559359 () List!27032)

(assert (=> b!1228381 (= lt!559359 (Cons!27028 (select (arr!38246 a!3806) from!3184) acc!823))))

(declare-fun b!1228382 () Bool)

(declare-fun res!816235 () Bool)

(assert (=> b!1228382 (=> (not res!816235) (not e!697640))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1228382 (= res!816235 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228383 () Bool)

(declare-fun res!816228 () Bool)

(assert (=> b!1228383 (=> (not res!816228) (not e!697640))))

(declare-fun arrayContainsKey!0 (array!79256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228383 (= res!816228 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228384 () Bool)

(declare-fun res!816234 () Bool)

(assert (=> b!1228384 (=> (not res!816234) (not e!697640))))

(declare-fun contains!7103 (List!27032 (_ BitVec 64)) Bool)

(assert (=> b!1228384 (= res!816234 (not (contains!7103 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228385 () Bool)

(declare-fun e!697643 () Bool)

(assert (=> b!1228385 (= e!697643 (contains!7103 lt!559359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228386 () Bool)

(assert (=> b!1228386 (= e!697642 e!697643)))

(declare-fun res!816232 () Bool)

(assert (=> b!1228386 (=> res!816232 e!697643)))

(assert (=> b!1228386 (= res!816232 (contains!7103 lt!559359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228387 () Bool)

(declare-fun res!816236 () Bool)

(assert (=> b!1228387 (=> (not res!816236) (not e!697640))))

(assert (=> b!1228387 (= res!816236 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38783 a!3806)) (bvslt from!3184 (size!38783 a!3806))))))

(declare-fun b!1228388 () Bool)

(declare-fun res!816233 () Bool)

(assert (=> b!1228388 (=> (not res!816233) (not e!697640))))

(assert (=> b!1228388 (= res!816233 (not (contains!7103 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228389 () Bool)

(declare-fun res!816230 () Bool)

(assert (=> b!1228389 (=> (not res!816230) (not e!697642))))

(declare-fun noDuplicate!1684 (List!27032) Bool)

(assert (=> b!1228389 (= res!816230 (noDuplicate!1684 lt!559359))))

(declare-fun res!816229 () Bool)

(assert (=> start!102150 (=> (not res!816229) (not e!697640))))

(assert (=> start!102150 (= res!816229 (bvslt (size!38783 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102150 e!697640))

(declare-fun array_inv!29184 (array!79256) Bool)

(assert (=> start!102150 (array_inv!29184 a!3806)))

(assert (=> start!102150 true))

(declare-fun b!1228390 () Bool)

(declare-fun res!816231 () Bool)

(assert (=> b!1228390 (=> (not res!816231) (not e!697640))))

(assert (=> b!1228390 (= res!816231 (noDuplicate!1684 acc!823))))

(assert (= (and start!102150 res!816229) b!1228382))

(assert (= (and b!1228382 res!816235) b!1228387))

(assert (= (and b!1228387 res!816236) b!1228390))

(assert (= (and b!1228390 res!816231) b!1228388))

(assert (= (and b!1228388 res!816233) b!1228384))

(assert (= (and b!1228384 res!816234) b!1228383))

(assert (= (and b!1228383 res!816228) b!1228379))

(assert (= (and b!1228379 res!816238) b!1228380))

(assert (= (and b!1228380 res!816237) b!1228381))

(assert (= (and b!1228381 res!816239) b!1228389))

(assert (= (and b!1228389 res!816230) b!1228386))

(assert (= (and b!1228386 (not res!816232)) b!1228385))

(declare-fun m!1133553 () Bool)

(assert (=> b!1228386 m!1133553))

(declare-fun m!1133555 () Bool)

(assert (=> b!1228382 m!1133555))

(declare-fun m!1133557 () Bool)

(assert (=> b!1228380 m!1133557))

(assert (=> b!1228380 m!1133557))

(declare-fun m!1133559 () Bool)

(assert (=> b!1228380 m!1133559))

(declare-fun m!1133561 () Bool)

(assert (=> b!1228383 m!1133561))

(declare-fun m!1133563 () Bool)

(assert (=> b!1228389 m!1133563))

(declare-fun m!1133565 () Bool)

(assert (=> b!1228388 m!1133565))

(declare-fun m!1133567 () Bool)

(assert (=> b!1228384 m!1133567))

(declare-fun m!1133569 () Bool)

(assert (=> b!1228379 m!1133569))

(declare-fun m!1133571 () Bool)

(assert (=> b!1228385 m!1133571))

(declare-fun m!1133573 () Bool)

(assert (=> b!1228390 m!1133573))

(declare-fun m!1133575 () Bool)

(assert (=> start!102150 m!1133575))

(assert (=> b!1228381 m!1133557))

(check-sat (not b!1228384) (not b!1228379) (not b!1228389) (not start!102150) (not b!1228383) (not b!1228390) (not b!1228382) (not b!1228388) (not b!1228386) (not b!1228385) (not b!1228380))
(check-sat)
(get-model)

(declare-fun call!60867 () Bool)

(declare-fun bm!60864 () Bool)

(declare-fun c!120945 () Bool)

(assert (=> bm!60864 (= call!60867 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120945 (Cons!27028 (select (arr!38246 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun e!697677 () Bool)

(declare-fun b!1228473 () Bool)

(assert (=> b!1228473 (= e!697677 (contains!7103 acc!823 (select (arr!38246 a!3806) from!3184)))))

(declare-fun b!1228474 () Bool)

(declare-fun e!697676 () Bool)

(assert (=> b!1228474 (= e!697676 call!60867)))

(declare-fun b!1228476 () Bool)

(assert (=> b!1228476 (= e!697676 call!60867)))

(declare-fun b!1228477 () Bool)

(declare-fun e!697678 () Bool)

(declare-fun e!697679 () Bool)

(assert (=> b!1228477 (= e!697678 e!697679)))

(declare-fun res!816318 () Bool)

(assert (=> b!1228477 (=> (not res!816318) (not e!697679))))

(assert (=> b!1228477 (= res!816318 (not e!697677))))

(declare-fun res!816320 () Bool)

(assert (=> b!1228477 (=> (not res!816320) (not e!697677))))

(assert (=> b!1228477 (= res!816320 (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)))))

(declare-fun b!1228475 () Bool)

(assert (=> b!1228475 (= e!697679 e!697676)))

(assert (=> b!1228475 (= c!120945 (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)))))

(declare-fun d!134555 () Bool)

(declare-fun res!816319 () Bool)

(assert (=> d!134555 (=> res!816319 e!697678)))

(assert (=> d!134555 (= res!816319 (bvsge from!3184 (size!38783 a!3806)))))

(assert (=> d!134555 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697678)))

(assert (= (and d!134555 (not res!816319)) b!1228477))

(assert (= (and b!1228477 res!816320) b!1228473))

(assert (= (and b!1228477 res!816318) b!1228475))

(assert (= (and b!1228475 c!120945) b!1228474))

(assert (= (and b!1228475 (not c!120945)) b!1228476))

(assert (= (or b!1228474 b!1228476) bm!60864))

(assert (=> bm!60864 m!1133557))

(declare-fun m!1133625 () Bool)

(assert (=> bm!60864 m!1133625))

(assert (=> b!1228473 m!1133557))

(assert (=> b!1228473 m!1133557))

(declare-fun m!1133627 () Bool)

(assert (=> b!1228473 m!1133627))

(assert (=> b!1228477 m!1133557))

(assert (=> b!1228477 m!1133557))

(assert (=> b!1228477 m!1133559))

(assert (=> b!1228475 m!1133557))

(assert (=> b!1228475 m!1133557))

(assert (=> b!1228475 m!1133559))

(assert (=> b!1228379 d!134555))

(declare-fun d!134557 () Bool)

(declare-fun lt!559370 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!553 (List!27032) (InoxSet (_ BitVec 64)))

(assert (=> d!134557 (= lt!559370 (select (content!553 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697687 () Bool)

(assert (=> d!134557 (= lt!559370 e!697687)))

(declare-fun res!816327 () Bool)

(assert (=> d!134557 (=> (not res!816327) (not e!697687))))

(get-info :version)

(assert (=> d!134557 (= res!816327 ((_ is Cons!27028) acc!823))))

(assert (=> d!134557 (= (contains!7103 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559370)))

(declare-fun b!1228484 () Bool)

(declare-fun e!697686 () Bool)

(assert (=> b!1228484 (= e!697687 e!697686)))

(declare-fun res!816328 () Bool)

(assert (=> b!1228484 (=> res!816328 e!697686)))

(assert (=> b!1228484 (= res!816328 (= (h!28246 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228487 () Bool)

(assert (=> b!1228487 (= e!697686 (contains!7103 (t!40487 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134557 res!816327) b!1228484))

(assert (= (and b!1228484 (not res!816328)) b!1228487))

(declare-fun m!1133629 () Bool)

(assert (=> d!134557 m!1133629))

(declare-fun m!1133631 () Bool)

(assert (=> d!134557 m!1133631))

(declare-fun m!1133633 () Bool)

(assert (=> b!1228487 m!1133633))

(assert (=> b!1228384 d!134557))

(declare-fun d!134563 () Bool)

(declare-fun res!816343 () Bool)

(declare-fun e!697702 () Bool)

(assert (=> d!134563 (=> res!816343 e!697702)))

(assert (=> d!134563 (= res!816343 ((_ is Nil!27029) lt!559359))))

(assert (=> d!134563 (= (noDuplicate!1684 lt!559359) e!697702)))

(declare-fun b!1228500 () Bool)

(declare-fun e!697703 () Bool)

(assert (=> b!1228500 (= e!697702 e!697703)))

(declare-fun res!816344 () Bool)

(assert (=> b!1228500 (=> (not res!816344) (not e!697703))))

(assert (=> b!1228500 (= res!816344 (not (contains!7103 (t!40487 lt!559359) (h!28246 lt!559359))))))

(declare-fun b!1228501 () Bool)

(assert (=> b!1228501 (= e!697703 (noDuplicate!1684 (t!40487 lt!559359)))))

(assert (= (and d!134563 (not res!816343)) b!1228500))

(assert (= (and b!1228500 res!816344) b!1228501))

(declare-fun m!1133645 () Bool)

(assert (=> b!1228500 m!1133645))

(declare-fun m!1133647 () Bool)

(assert (=> b!1228501 m!1133647))

(assert (=> b!1228389 d!134563))

(declare-fun d!134569 () Bool)

(declare-fun res!816355 () Bool)

(declare-fun e!697716 () Bool)

(assert (=> d!134569 (=> res!816355 e!697716)))

(assert (=> d!134569 (= res!816355 (= (select (arr!38246 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134569 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697716)))

(declare-fun b!1228516 () Bool)

(declare-fun e!697717 () Bool)

(assert (=> b!1228516 (= e!697716 e!697717)))

(declare-fun res!816356 () Bool)

(assert (=> b!1228516 (=> (not res!816356) (not e!697717))))

(assert (=> b!1228516 (= res!816356 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38783 a!3806)))))

(declare-fun b!1228517 () Bool)

(assert (=> b!1228517 (= e!697717 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134569 (not res!816355)) b!1228516))

(assert (= (and b!1228516 res!816356) b!1228517))

(declare-fun m!1133649 () Bool)

(assert (=> d!134569 m!1133649))

(declare-fun m!1133651 () Bool)

(assert (=> b!1228517 m!1133651))

(assert (=> b!1228383 d!134569))

(declare-fun d!134571 () Bool)

(declare-fun lt!559372 () Bool)

(assert (=> d!134571 (= lt!559372 (select (content!553 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697725 () Bool)

(assert (=> d!134571 (= lt!559372 e!697725)))

(declare-fun res!816363 () Bool)

(assert (=> d!134571 (=> (not res!816363) (not e!697725))))

(assert (=> d!134571 (= res!816363 ((_ is Cons!27028) acc!823))))

(assert (=> d!134571 (= (contains!7103 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559372)))

(declare-fun b!1228522 () Bool)

(declare-fun e!697724 () Bool)

(assert (=> b!1228522 (= e!697725 e!697724)))

(declare-fun res!816364 () Bool)

(assert (=> b!1228522 (=> res!816364 e!697724)))

(assert (=> b!1228522 (= res!816364 (= (h!28246 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228523 () Bool)

(assert (=> b!1228523 (= e!697724 (contains!7103 (t!40487 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134571 res!816363) b!1228522))

(assert (= (and b!1228522 (not res!816364)) b!1228523))

(assert (=> d!134571 m!1133629))

(declare-fun m!1133653 () Bool)

(assert (=> d!134571 m!1133653))

(declare-fun m!1133655 () Bool)

(assert (=> b!1228523 m!1133655))

(assert (=> b!1228388 d!134571))

(declare-fun d!134573 () Bool)

(assert (=> d!134573 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228382 d!134573))

(declare-fun d!134575 () Bool)

(assert (=> d!134575 (= (array_inv!29184 a!3806) (bvsge (size!38783 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102150 d!134575))

(declare-fun d!134577 () Bool)

(declare-fun lt!559373 () Bool)

(assert (=> d!134577 (= lt!559373 (select (content!553 lt!559359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697729 () Bool)

(assert (=> d!134577 (= lt!559373 e!697729)))

(declare-fun res!816365 () Bool)

(assert (=> d!134577 (=> (not res!816365) (not e!697729))))

(assert (=> d!134577 (= res!816365 ((_ is Cons!27028) lt!559359))))

(assert (=> d!134577 (= (contains!7103 lt!559359 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559373)))

(declare-fun b!1228530 () Bool)

(declare-fun e!697728 () Bool)

(assert (=> b!1228530 (= e!697729 e!697728)))

(declare-fun res!816366 () Bool)

(assert (=> b!1228530 (=> res!816366 e!697728)))

(assert (=> b!1228530 (= res!816366 (= (h!28246 lt!559359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228531 () Bool)

(assert (=> b!1228531 (= e!697728 (contains!7103 (t!40487 lt!559359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134577 res!816365) b!1228530))

(assert (= (and b!1228530 (not res!816366)) b!1228531))

(declare-fun m!1133657 () Bool)

(assert (=> d!134577 m!1133657))

(declare-fun m!1133659 () Bool)

(assert (=> d!134577 m!1133659))

(declare-fun m!1133661 () Bool)

(assert (=> b!1228531 m!1133661))

(assert (=> b!1228386 d!134577))

(declare-fun d!134579 () Bool)

(assert (=> d!134579 (= (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)) (and (not (= (select (arr!38246 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38246 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228380 d!134579))

(declare-fun d!134581 () Bool)

(declare-fun lt!559374 () Bool)

(assert (=> d!134581 (= lt!559374 (select (content!553 lt!559359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697735 () Bool)

(assert (=> d!134581 (= lt!559374 e!697735)))

(declare-fun res!816370 () Bool)

(assert (=> d!134581 (=> (not res!816370) (not e!697735))))

(assert (=> d!134581 (= res!816370 ((_ is Cons!27028) lt!559359))))

(assert (=> d!134581 (= (contains!7103 lt!559359 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559374)))

(declare-fun b!1228537 () Bool)

(declare-fun e!697734 () Bool)

(assert (=> b!1228537 (= e!697735 e!697734)))

(declare-fun res!816371 () Bool)

(assert (=> b!1228537 (=> res!816371 e!697734)))

(assert (=> b!1228537 (= res!816371 (= (h!28246 lt!559359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228538 () Bool)

(assert (=> b!1228538 (= e!697734 (contains!7103 (t!40487 lt!559359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134581 res!816370) b!1228537))

(assert (= (and b!1228537 (not res!816371)) b!1228538))

(assert (=> d!134581 m!1133657))

(declare-fun m!1133663 () Bool)

(assert (=> d!134581 m!1133663))

(declare-fun m!1133665 () Bool)

(assert (=> b!1228538 m!1133665))

(assert (=> b!1228385 d!134581))

(declare-fun d!134583 () Bool)

(declare-fun res!816372 () Bool)

(declare-fun e!697736 () Bool)

(assert (=> d!134583 (=> res!816372 e!697736)))

(assert (=> d!134583 (= res!816372 ((_ is Nil!27029) acc!823))))

(assert (=> d!134583 (= (noDuplicate!1684 acc!823) e!697736)))

(declare-fun b!1228539 () Bool)

(declare-fun e!697737 () Bool)

(assert (=> b!1228539 (= e!697736 e!697737)))

(declare-fun res!816373 () Bool)

(assert (=> b!1228539 (=> (not res!816373) (not e!697737))))

(assert (=> b!1228539 (= res!816373 (not (contains!7103 (t!40487 acc!823) (h!28246 acc!823))))))

(declare-fun b!1228540 () Bool)

(assert (=> b!1228540 (= e!697737 (noDuplicate!1684 (t!40487 acc!823)))))

(assert (= (and d!134583 (not res!816372)) b!1228539))

(assert (= (and b!1228539 res!816373) b!1228540))

(declare-fun m!1133671 () Bool)

(assert (=> b!1228539 m!1133671))

(declare-fun m!1133673 () Bool)

(assert (=> b!1228540 m!1133673))

(assert (=> b!1228390 d!134583))

(check-sat (not d!134557) (not b!1228477) (not b!1228538) (not d!134571) (not b!1228475) (not b!1228487) (not b!1228500) (not d!134581) (not bm!60864) (not b!1228531) (not b!1228517) (not b!1228501) (not b!1228523) (not b!1228539) (not d!134577) (not b!1228473) (not b!1228540))
(check-sat)
