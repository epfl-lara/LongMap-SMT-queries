; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102318 () Bool)

(assert start!102318)

(declare-fun b!1231251 () Bool)

(declare-fun res!819694 () Bool)

(declare-fun e!698467 () Bool)

(assert (=> b!1231251 (=> (not res!819694) (not e!698467))))

(declare-datatypes ((List!27103 0))(
  ( (Nil!27100) (Cons!27099 (h!28308 (_ BitVec 64)) (t!40566 List!27103)) )
))
(declare-fun acc!823 () List!27103)

(declare-fun noDuplicate!1762 (List!27103) Bool)

(assert (=> b!1231251 (= res!819694 (noDuplicate!1762 acc!823))))

(declare-fun b!1231252 () Bool)

(declare-fun res!819693 () Bool)

(assert (=> b!1231252 (=> (not res!819693) (not e!698467))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79427 0))(
  ( (array!79428 (arr!38330 (Array (_ BitVec 32) (_ BitVec 64))) (size!38866 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79427)

(assert (=> b!1231252 (= res!819693 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38866 a!3806)) (bvslt from!3184 (size!38866 a!3806))))))

(declare-fun b!1231253 () Bool)

(declare-fun res!819691 () Bool)

(assert (=> b!1231253 (=> (not res!819691) (not e!698467))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231253 (= res!819691 (validKeyInArray!0 k!2913))))

(declare-fun res!819698 () Bool)

(assert (=> start!102318 (=> (not res!819698) (not e!698467))))

(assert (=> start!102318 (= res!819698 (bvslt (size!38866 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102318 e!698467))

(declare-fun array_inv!29178 (array!79427) Bool)

(assert (=> start!102318 (array_inv!29178 a!3806)))

(assert (=> start!102318 true))

(declare-fun b!1231254 () Bool)

(declare-fun res!819692 () Bool)

(assert (=> b!1231254 (=> (not res!819692) (not e!698467))))

(declare-fun arrayContainsKey!0 (array!79427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231254 (= res!819692 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231255 () Bool)

(declare-fun res!819699 () Bool)

(assert (=> b!1231255 (=> (not res!819699) (not e!698467))))

(assert (=> b!1231255 (= res!819699 (validKeyInArray!0 (select (arr!38330 a!3806) from!3184)))))

(declare-fun b!1231256 () Bool)

(declare-fun e!698468 () Bool)

(assert (=> b!1231256 (= e!698467 (not e!698468))))

(declare-fun res!819689 () Bool)

(assert (=> b!1231256 (=> res!819689 e!698468)))

(assert (=> b!1231256 (= res!819689 (bvsgt from!3184 (size!38866 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79427 (_ BitVec 32) List!27103) Bool)

(assert (=> b!1231256 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27099 (select (arr!38330 a!3806) from!3184) acc!823))))

(declare-fun b!1231257 () Bool)

(declare-fun res!819700 () Bool)

(assert (=> b!1231257 (=> res!819700 e!698468)))

(declare-fun contains!7165 (List!27103 (_ BitVec 64)) Bool)

(assert (=> b!1231257 (= res!819700 (contains!7165 Nil!27100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231258 () Bool)

(declare-fun res!819690 () Bool)

(assert (=> b!1231258 (=> (not res!819690) (not e!698467))))

(assert (=> b!1231258 (= res!819690 (not (contains!7165 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231259 () Bool)

(declare-fun res!819695 () Bool)

(assert (=> b!1231259 (=> (not res!819695) (not e!698467))))

(assert (=> b!1231259 (= res!819695 (not (contains!7165 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231260 () Bool)

(declare-fun res!819697 () Bool)

(assert (=> b!1231260 (=> (not res!819697) (not e!698467))))

(assert (=> b!1231260 (= res!819697 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231261 () Bool)

(declare-fun res!819696 () Bool)

(assert (=> b!1231261 (=> res!819696 e!698468)))

(assert (=> b!1231261 (= res!819696 (contains!7165 Nil!27100 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231262 () Bool)

(declare-fun subseq!500 (List!27103 List!27103) Bool)

(assert (=> b!1231262 (= e!698468 (subseq!500 Nil!27100 acc!823))))

(assert (= (and start!102318 res!819698) b!1231253))

(assert (= (and b!1231253 res!819691) b!1231252))

(assert (= (and b!1231252 res!819693) b!1231251))

(assert (= (and b!1231251 res!819694) b!1231259))

(assert (= (and b!1231259 res!819695) b!1231258))

(assert (= (and b!1231258 res!819690) b!1231254))

(assert (= (and b!1231254 res!819692) b!1231260))

(assert (= (and b!1231260 res!819697) b!1231255))

(assert (= (and b!1231255 res!819699) b!1231256))

(assert (= (and b!1231256 (not res!819689)) b!1231257))

(assert (= (and b!1231257 (not res!819700)) b!1231261))

(assert (= (and b!1231261 (not res!819696)) b!1231262))

(declare-fun m!1135453 () Bool)

(assert (=> b!1231260 m!1135453))

(declare-fun m!1135455 () Bool)

(assert (=> b!1231261 m!1135455))

(declare-fun m!1135457 () Bool)

(assert (=> b!1231259 m!1135457))

(declare-fun m!1135459 () Bool)

(assert (=> b!1231253 m!1135459))

(declare-fun m!1135461 () Bool)

(assert (=> b!1231256 m!1135461))

(declare-fun m!1135463 () Bool)

(assert (=> b!1231256 m!1135463))

(declare-fun m!1135465 () Bool)

(assert (=> b!1231254 m!1135465))

(assert (=> b!1231255 m!1135461))

(assert (=> b!1231255 m!1135461))

(declare-fun m!1135467 () Bool)

(assert (=> b!1231255 m!1135467))

(declare-fun m!1135469 () Bool)

(assert (=> start!102318 m!1135469))

(declare-fun m!1135471 () Bool)

(assert (=> b!1231251 m!1135471))

(declare-fun m!1135473 () Bool)

(assert (=> b!1231257 m!1135473))

(declare-fun m!1135475 () Bool)

(assert (=> b!1231258 m!1135475))

(declare-fun m!1135477 () Bool)

(assert (=> b!1231262 m!1135477))

(push 1)

(assert (not start!102318))

(assert (not b!1231258))

(assert (not b!1231251))

(assert (not b!1231260))

(assert (not b!1231253))

(assert (not b!1231261))

(assert (not b!1231259))

(assert (not b!1231256))

(assert (not b!1231254))

(assert (not b!1231255))

(assert (not b!1231262))

(assert (not b!1231257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134705 () Bool)

(assert (=> d!134705 (= (array_inv!29178 a!3806) (bvsge (size!38866 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102318 d!134705))

(declare-fun b!1231388 () Bool)

(declare-fun e!698539 () Bool)

(declare-fun call!60883 () Bool)

(assert (=> b!1231388 (= e!698539 call!60883)))

(declare-fun d!134711 () Bool)

(declare-fun res!819818 () Bool)

(declare-fun e!698538 () Bool)

(assert (=> d!134711 (=> res!819818 e!698538)))

(assert (=> d!134711 (= res!819818 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38866 a!3806)))))

(assert (=> d!134711 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27099 (select (arr!38330 a!3806) from!3184) acc!823)) e!698538)))

(declare-fun b!1231389 () Bool)

(assert (=> b!1231389 (= e!698539 call!60883)))

(declare-fun b!1231390 () Bool)

(declare-fun e!698536 () Bool)

(assert (=> b!1231390 (= e!698536 (contains!7165 (Cons!27099 (select (arr!38330 a!3806) from!3184) acc!823) (select (arr!38330 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231391 () Bool)

(declare-fun e!698537 () Bool)

(assert (=> b!1231391 (= e!698538 e!698537)))

(declare-fun res!819816 () Bool)

(assert (=> b!1231391 (=> (not res!819816) (not e!698537))))

(assert (=> b!1231391 (= res!819816 (not e!698536))))

(declare-fun res!819817 () Bool)

(assert (=> b!1231391 (=> (not res!819817) (not e!698536))))

(assert (=> b!1231391 (= res!819817 (validKeyInArray!0 (select (arr!38330 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231392 () Bool)

(assert (=> b!1231392 (= e!698537 e!698539)))

(declare-fun c!120646 () Bool)

(assert (=> b!1231392 (= c!120646 (validKeyInArray!0 (select (arr!38330 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60880 () Bool)

(assert (=> bm!60880 (= call!60883 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120646 (Cons!27099 (select (arr!38330 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27099 (select (arr!38330 a!3806) from!3184) acc!823)) (Cons!27099 (select (arr!38330 a!3806) from!3184) acc!823))))))

(assert (= (and d!134711 (not res!819818)) b!1231391))

(assert (= (and b!1231391 res!819817) b!1231390))

(assert (= (and b!1231391 res!819816) b!1231392))

(assert (= (and b!1231392 c!120646) b!1231389))

(assert (= (and b!1231392 (not c!120646)) b!1231388))

(assert (= (or b!1231389 b!1231388) bm!60880))

(declare-fun m!1135555 () Bool)

(assert (=> b!1231390 m!1135555))

(assert (=> b!1231390 m!1135555))

(declare-fun m!1135559 () Bool)

(assert (=> b!1231390 m!1135559))

(assert (=> b!1231391 m!1135555))

(assert (=> b!1231391 m!1135555))

(declare-fun m!1135563 () Bool)

(assert (=> b!1231391 m!1135563))

(assert (=> b!1231392 m!1135555))

(assert (=> b!1231392 m!1135555))

(assert (=> b!1231392 m!1135563))

(assert (=> bm!60880 m!1135555))

(declare-fun m!1135569 () Bool)

(assert (=> bm!60880 m!1135569))

(assert (=> b!1231256 d!134711))

(declare-fun d!134721 () Bool)

(assert (=> d!134721 (= (validKeyInArray!0 (select (arr!38330 a!3806) from!3184)) (and (not (= (select (arr!38330 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38330 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231255 d!134721))

(declare-fun d!134725 () Bool)

(declare-fun lt!559411 () Bool)

(declare-fun content!564 (List!27103) (Set (_ BitVec 64)))

(assert (=> d!134725 (= lt!559411 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!564 Nil!27100)))))

(declare-fun e!698562 () Bool)

(assert (=> d!134725 (= lt!559411 e!698562)))

(declare-fun res!819838 () Bool)

(assert (=> d!134725 (=> (not res!819838) (not e!698562))))

(assert (=> d!134725 (= res!819838 (is-Cons!27099 Nil!27100))))

(assert (=> d!134725 (= (contains!7165 Nil!27100 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559411)))

(declare-fun b!1231418 () Bool)

(declare-fun e!698563 () Bool)

(assert (=> b!1231418 (= e!698562 e!698563)))

(declare-fun res!819839 () Bool)

(assert (=> b!1231418 (=> res!819839 e!698563)))

(assert (=> b!1231418 (= res!819839 (= (h!28308 Nil!27100) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231419 () Bool)

(assert (=> b!1231419 (= e!698563 (contains!7165 (t!40566 Nil!27100) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134725 res!819838) b!1231418))

(assert (= (and b!1231418 (not res!819839)) b!1231419))

(declare-fun m!1135581 () Bool)

(assert (=> d!134725 m!1135581))

(declare-fun m!1135585 () Bool)

(assert (=> d!134725 m!1135585))

(declare-fun m!1135587 () Bool)

(assert (=> b!1231419 m!1135587))

(assert (=> b!1231257 d!134725))

(declare-fun d!134735 () Bool)

(assert (=> d!134735 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231253 d!134735))

(declare-fun d!134737 () Bool)

(declare-fun res!819853 () Bool)

(declare-fun e!698578 () Bool)

(assert (=> d!134737 (=> res!819853 e!698578)))

(assert (=> d!134737 (= res!819853 (= (select (arr!38330 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134737 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698578)))

(declare-fun b!1231435 () Bool)

(declare-fun e!698579 () Bool)

(assert (=> b!1231435 (= e!698578 e!698579)))

(declare-fun res!819854 () Bool)

(assert (=> b!1231435 (=> (not res!819854) (not e!698579))))

(assert (=> b!1231435 (= res!819854 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38866 a!3806)))))

(declare-fun b!1231436 () Bool)

(assert (=> b!1231436 (= e!698579 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134737 (not res!819853)) b!1231435))

(assert (= (and b!1231435 res!819854) b!1231436))

(assert (=> d!134737 m!1135555))

(declare-fun m!1135597 () Bool)

(assert (=> b!1231436 m!1135597))

(assert (=> b!1231254 d!134737))

(declare-fun d!134745 () Bool)

(declare-fun lt!559413 () Bool)

(assert (=> d!134745 (= lt!559413 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!564 Nil!27100)))))

(declare-fun e!698588 () Bool)

(assert (=> d!134745 (= lt!559413 e!698588)))

(declare-fun res!819863 () Bool)

(assert (=> d!134745 (=> (not res!819863) (not e!698588))))

(assert (=> d!134745 (= res!819863 (is-Cons!27099 Nil!27100))))

(assert (=> d!134745 (= (contains!7165 Nil!27100 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559413)))

(declare-fun b!1231445 () Bool)

(declare-fun e!698589 () Bool)

(assert (=> b!1231445 (= e!698588 e!698589)))

(declare-fun res!819864 () Bool)

(assert (=> b!1231445 (=> res!819864 e!698589)))

(assert (=> b!1231445 (= res!819864 (= (h!28308 Nil!27100) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231446 () Bool)

(assert (=> b!1231446 (= e!698589 (contains!7165 (t!40566 Nil!27100) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134745 res!819863) b!1231445))

(assert (= (and b!1231445 (not res!819864)) b!1231446))

(assert (=> d!134745 m!1135581))

(declare-fun m!1135599 () Bool)

(assert (=> d!134745 m!1135599))

(declare-fun m!1135601 () Bool)

(assert (=> b!1231446 m!1135601))

(assert (=> b!1231261 d!134745))

(declare-fun d!134747 () Bool)

(declare-fun res!819877 () Bool)

(declare-fun e!698602 () Bool)

(assert (=> d!134747 (=> res!819877 e!698602)))

(assert (=> d!134747 (= res!819877 (is-Nil!27100 acc!823))))

(assert (=> d!134747 (= (noDuplicate!1762 acc!823) e!698602)))

(declare-fun b!1231459 () Bool)

(declare-fun e!698603 () Bool)

(assert (=> b!1231459 (= e!698602 e!698603)))

(declare-fun res!819878 () Bool)

(assert (=> b!1231459 (=> (not res!819878) (not e!698603))))

(assert (=> b!1231459 (= res!819878 (not (contains!7165 (t!40566 acc!823) (h!28308 acc!823))))))

(declare-fun b!1231460 () Bool)

(assert (=> b!1231460 (= e!698603 (noDuplicate!1762 (t!40566 acc!823)))))

(assert (= (and d!134747 (not res!819877)) b!1231459))

(assert (= (and b!1231459 res!819878) b!1231460))

(declare-fun m!1135617 () Bool)

(assert (=> b!1231459 m!1135617))

(declare-fun m!1135621 () Bool)

(assert (=> b!1231460 m!1135621))

(assert (=> b!1231251 d!134747))

(declare-fun b!1231487 () Bool)

(declare-fun e!698629 () Bool)

(assert (=> b!1231487 (= e!698629 (subseq!500 Nil!27100 (t!40566 acc!823)))))

(declare-fun b!1231484 () Bool)

(declare-fun e!698628 () Bool)

(declare-fun e!698626 () Bool)

(assert (=> b!1231484 (= e!698628 e!698626)))

(declare-fun res!819903 () Bool)

(assert (=> b!1231484 (=> (not res!819903) (not e!698626))))

(assert (=> b!1231484 (= res!819903 (is-Cons!27099 acc!823))))

(declare-fun b!1231486 () Bool)

(declare-fun e!698627 () Bool)

(assert (=> b!1231486 (= e!698627 (subseq!500 (t!40566 Nil!27100) (t!40566 acc!823)))))

(declare-fun b!1231485 () Bool)

(assert (=> b!1231485 (= e!698626 e!698629)))

(declare-fun res!819900 () Bool)

(assert (=> b!1231485 (=> res!819900 e!698629)))

(assert (=> b!1231485 (= res!819900 e!698627)))

(declare-fun res!819901 () Bool)

(assert (=> b!1231485 (=> (not res!819901) (not e!698627))))

(assert (=> b!1231485 (= res!819901 (= (h!28308 Nil!27100) (h!28308 acc!823)))))

(declare-fun d!134755 () Bool)

(declare-fun res!819902 () Bool)

(assert (=> d!134755 (=> res!819902 e!698628)))

(assert (=> d!134755 (= res!819902 (is-Nil!27100 Nil!27100))))

(assert (=> d!134755 (= (subseq!500 Nil!27100 acc!823) e!698628)))

(assert (= (and d!134755 (not res!819902)) b!1231484))

(assert (= (and b!1231484 res!819903) b!1231485))

(assert (= (and b!1231485 res!819901) b!1231486))

(assert (= (and b!1231485 (not res!819900)) b!1231487))

(declare-fun m!1135637 () Bool)

(assert (=> b!1231487 m!1135637))

(declare-fun m!1135639 () Bool)

(assert (=> b!1231486 m!1135639))

(assert (=> b!1231262 d!134755))

(declare-fun d!134765 () Bool)

(declare-fun lt!559417 () Bool)

(assert (=> d!134765 (= lt!559417 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!564 acc!823)))))

(declare-fun e!698630 () Bool)

(assert (=> d!134765 (= lt!559417 e!698630)))

(declare-fun res!819904 () Bool)

(assert (=> d!134765 (=> (not res!819904) (not e!698630))))

(assert (=> d!134765 (= res!819904 (is-Cons!27099 acc!823))))

(assert (=> d!134765 (= (contains!7165 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559417)))

(declare-fun b!1231488 () Bool)

(declare-fun e!698631 () Bool)

(assert (=> b!1231488 (= e!698630 e!698631)))

(declare-fun res!819905 () Bool)

(assert (=> b!1231488 (=> res!819905 e!698631)))

(assert (=> b!1231488 (= res!819905 (= (h!28308 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231489 () Bool)

(assert (=> b!1231489 (= e!698631 (contains!7165 (t!40566 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134765 res!819904) b!1231488))

(assert (= (and b!1231488 (not res!819905)) b!1231489))

(declare-fun m!1135641 () Bool)

(assert (=> d!134765 m!1135641))

(declare-fun m!1135643 () Bool)

(assert (=> d!134765 m!1135643))

(declare-fun m!1135645 () Bool)

(assert (=> b!1231489 m!1135645))

(assert (=> b!1231258 d!134765))

(declare-fun b!1231490 () Bool)

(declare-fun e!698635 () Bool)

