; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104016 () Bool)

(assert start!104016)

(declare-fun b!1244669 () Bool)

(declare-fun res!830262 () Bool)

(declare-fun e!705518 () Bool)

(assert (=> b!1244669 (=> res!830262 e!705518)))

(declare-datatypes ((List!27432 0))(
  ( (Nil!27429) (Cons!27428 (h!28637 (_ BitVec 64)) (t!40901 List!27432)) )
))
(declare-fun noDuplicate!2010 (List!27432) Bool)

(assert (=> b!1244669 (= res!830262 (not (noDuplicate!2010 Nil!27429)))))

(declare-fun b!1244670 () Bool)

(declare-fun res!830260 () Bool)

(declare-fun e!705517 () Bool)

(assert (=> b!1244670 (=> (not res!830260) (not e!705517))))

(declare-datatypes ((array!80075 0))(
  ( (array!80076 (arr!38629 (Array (_ BitVec 32) (_ BitVec 64))) (size!39165 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80075)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!80075 (_ BitVec 32) List!27432) Bool)

(assert (=> b!1244670 (= res!830260 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27429))))

(declare-fun b!1244671 () Bool)

(assert (=> b!1244671 (= e!705517 (not e!705518))))

(declare-fun res!830263 () Bool)

(assert (=> b!1244671 (=> res!830263 e!705518)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244671 (= res!830263 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1244671 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27429)))

(declare-datatypes ((Unit!41393 0))(
  ( (Unit!41394) )
))
(declare-fun lt!562807 () Unit!41393)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80075 (_ BitVec 32) (_ BitVec 32)) Unit!41393)

(assert (=> b!1244671 (= lt!562807 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244672 () Bool)

(declare-fun e!705520 () Bool)

(assert (=> b!1244672 (= e!705520 e!705517)))

(declare-fun res!830257 () Bool)

(assert (=> b!1244672 (=> (not res!830257) (not e!705517))))

(assert (=> b!1244672 (= res!830257 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562806 () Unit!41393)

(declare-fun e!705521 () Unit!41393)

(assert (=> b!1244672 (= lt!562806 e!705521)))

(declare-fun c!121891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244672 (= c!121891 (validKeyInArray!0 (select (arr!38629 a!3892) from!3270)))))

(declare-fun b!1244674 () Bool)

(declare-fun e!705519 () Bool)

(declare-fun contains!7432 (List!27432 (_ BitVec 64)) Bool)

(assert (=> b!1244674 (= e!705519 (not (contains!7432 Nil!27429 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244675 () Bool)

(declare-fun Unit!41395 () Unit!41393)

(assert (=> b!1244675 (= e!705521 Unit!41395)))

(declare-fun b!1244676 () Bool)

(declare-fun res!830259 () Bool)

(assert (=> b!1244676 (=> (not res!830259) (not e!705520))))

(assert (=> b!1244676 (= res!830259 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27429))))

(declare-fun b!1244673 () Bool)

(declare-fun res!830256 () Bool)

(assert (=> b!1244673 (=> (not res!830256) (not e!705520))))

(assert (=> b!1244673 (= res!830256 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39165 a!3892)) (not (= newFrom!287 (size!39165 a!3892)))))))

(declare-fun res!830261 () Bool)

(assert (=> start!104016 (=> (not res!830261) (not e!705520))))

(assert (=> start!104016 (= res!830261 (and (bvslt (size!39165 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39165 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39165 a!3892))))))

(assert (=> start!104016 e!705520))

(declare-fun array_inv!29477 (array!80075) Bool)

(assert (=> start!104016 (array_inv!29477 a!3892)))

(assert (=> start!104016 true))

(declare-fun b!1244677 () Bool)

(declare-fun lt!562808 () Unit!41393)

(assert (=> b!1244677 (= e!705521 lt!562808)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80075 List!27432 List!27432 (_ BitVec 32)) Unit!41393)

(assert (=> b!1244677 (= lt!562808 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27428 (select (arr!38629 a!3892) from!3270) Nil!27429) Nil!27429 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244677 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27429)))

(declare-fun b!1244678 () Bool)

(assert (=> b!1244678 (= e!705518 e!705519)))

(declare-fun res!830258 () Bool)

(assert (=> b!1244678 (=> (not res!830258) (not e!705519))))

(assert (=> b!1244678 (= res!830258 (not (contains!7432 Nil!27429 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104016 res!830261) b!1244676))

(assert (= (and b!1244676 res!830259) b!1244673))

(assert (= (and b!1244673 res!830256) b!1244672))

(assert (= (and b!1244672 c!121891) b!1244677))

(assert (= (and b!1244672 (not c!121891)) b!1244675))

(assert (= (and b!1244672 res!830257) b!1244670))

(assert (= (and b!1244670 res!830260) b!1244671))

(assert (= (and b!1244671 (not res!830263)) b!1244669))

(assert (= (and b!1244669 (not res!830262)) b!1244678))

(assert (= (and b!1244678 res!830258) b!1244674))

(declare-fun m!1146901 () Bool)

(assert (=> b!1244671 m!1146901))

(declare-fun m!1146903 () Bool)

(assert (=> b!1244671 m!1146903))

(declare-fun m!1146905 () Bool)

(assert (=> start!104016 m!1146905))

(declare-fun m!1146907 () Bool)

(assert (=> b!1244670 m!1146907))

(declare-fun m!1146909 () Bool)

(assert (=> b!1244674 m!1146909))

(declare-fun m!1146911 () Bool)

(assert (=> b!1244677 m!1146911))

(declare-fun m!1146913 () Bool)

(assert (=> b!1244677 m!1146913))

(assert (=> b!1244677 m!1146907))

(declare-fun m!1146915 () Bool)

(assert (=> b!1244678 m!1146915))

(assert (=> b!1244672 m!1146911))

(assert (=> b!1244672 m!1146911))

(declare-fun m!1146917 () Bool)

(assert (=> b!1244672 m!1146917))

(declare-fun m!1146919 () Bool)

(assert (=> b!1244676 m!1146919))

(declare-fun m!1146921 () Bool)

(assert (=> b!1244669 m!1146921))

(push 1)

(assert (not b!1244676))

(assert (not b!1244669))

(assert (not b!1244677))

(assert (not b!1244678))

(assert (not b!1244671))

(assert (not start!104016))

(assert (not b!1244674))

(assert (not b!1244672))

(assert (not b!1244670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137181 () Bool)

(assert (=> d!137181 (= (array_inv!29477 a!3892) (bvsge (size!39165 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104016 d!137181))

(declare-fun d!137185 () Bool)

(declare-fun lt!562820 () Bool)

(declare-fun content!613 (List!27432) (Set (_ BitVec 64)))

(assert (=> d!137185 (= lt!562820 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!613 Nil!27429)))))

(declare-fun e!705559 () Bool)

(assert (=> d!137185 (= lt!562820 e!705559)))

(declare-fun res!830298 () Bool)

(assert (=> d!137185 (=> (not res!830298) (not e!705559))))

(assert (=> d!137185 (= res!830298 (is-Cons!27428 Nil!27429))))

(assert (=> d!137185 (= (contains!7432 Nil!27429 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562820)))

(declare-fun b!1244718 () Bool)

(declare-fun e!705560 () Bool)

(assert (=> b!1244718 (= e!705559 e!705560)))

(declare-fun res!830297 () Bool)

(assert (=> b!1244718 (=> res!830297 e!705560)))

(assert (=> b!1244718 (= res!830297 (= (h!28637 Nil!27429) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244719 () Bool)

(assert (=> b!1244719 (= e!705560 (contains!7432 (t!40901 Nil!27429) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137185 res!830298) b!1244718))

(assert (= (and b!1244718 (not res!830297)) b!1244719))

(declare-fun m!1146951 () Bool)

(assert (=> d!137185 m!1146951))

(declare-fun m!1146955 () Bool)

(assert (=> d!137185 m!1146955))

(declare-fun m!1146957 () Bool)

(assert (=> b!1244719 m!1146957))

(assert (=> b!1244674 d!137185))

(declare-fun b!1244757 () Bool)

(declare-fun e!705591 () Bool)

(declare-fun call!61434 () Bool)

(assert (=> b!1244757 (= e!705591 call!61434)))

(declare-fun b!1244758 () Bool)

(declare-fun e!705593 () Bool)

(declare-fun e!705592 () Bool)

(assert (=> b!1244758 (= e!705593 e!705592)))

(declare-fun res!830324 () Bool)

(assert (=> b!1244758 (=> (not res!830324) (not e!705592))))

(declare-fun e!705594 () Bool)

(assert (=> b!1244758 (= res!830324 (not e!705594))))

(declare-fun res!830322 () Bool)

(assert (=> b!1244758 (=> (not res!830322) (not e!705594))))

(assert (=> b!1244758 (= res!830322 (validKeyInArray!0 (select (arr!38629 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244759 () Bool)

(assert (=> b!1244759 (= e!705592 e!705591)))

(declare-fun c!121902 () Bool)

(assert (=> b!1244759 (= c!121902 (validKeyInArray!0 (select (arr!38629 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun bm!61431 () Bool)

(assert (=> bm!61431 (= call!61434 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121902 (Cons!27428 (select (arr!38629 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27429) Nil!27429)))))

(declare-fun b!1244760 () Bool)

(assert (=> b!1244760 (= e!705594 (contains!7432 Nil!27429 (select (arr!38629 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244761 () Bool)

(assert (=> b!1244761 (= e!705591 call!61434)))

(declare-fun d!137197 () Bool)

(declare-fun res!830323 () Bool)

(assert (=> d!137197 (=> res!830323 e!705593)))

(assert (=> d!137197 (= res!830323 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39165 a!3892)))))

(assert (=> d!137197 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27429) e!705593)))

(assert (= (and d!137197 (not res!830323)) b!1244758))

(assert (= (and b!1244758 res!830322) b!1244760))

(assert (= (and b!1244758 res!830324) b!1244759))

(assert (= (and b!1244759 c!121902) b!1244757))

(assert (= (and b!1244759 (not c!121902)) b!1244761))

(assert (= (or b!1244757 b!1244761) bm!61431))

(declare-fun m!1146981 () Bool)

(assert (=> b!1244758 m!1146981))

(assert (=> b!1244758 m!1146981))

(declare-fun m!1146985 () Bool)

(assert (=> b!1244758 m!1146985))

(assert (=> b!1244759 m!1146981))

(assert (=> b!1244759 m!1146981))

(assert (=> b!1244759 m!1146985))

(assert (=> bm!61431 m!1146981))

(declare-fun m!1146989 () Bool)

(assert (=> bm!61431 m!1146989))

(assert (=> b!1244760 m!1146981))

(assert (=> b!1244760 m!1146981))

(declare-fun m!1146991 () Bool)

(assert (=> b!1244760 m!1146991))

(assert (=> b!1244670 d!137197))

(declare-fun d!137209 () Bool)

(declare-fun res!830332 () Bool)

(declare-fun e!705603 () Bool)

(assert (=> d!137209 (=> res!830332 e!705603)))

(assert (=> d!137209 (= res!830332 (is-Nil!27429 Nil!27429))))

(assert (=> d!137209 (= (noDuplicate!2010 Nil!27429) e!705603)))

(declare-fun b!1244771 () Bool)

(declare-fun e!705604 () Bool)

(assert (=> b!1244771 (= e!705603 e!705604)))

(declare-fun res!830333 () Bool)

(assert (=> b!1244771 (=> (not res!830333) (not e!705604))))

(assert (=> b!1244771 (= res!830333 (not (contains!7432 (t!40901 Nil!27429) (h!28637 Nil!27429))))))

(declare-fun b!1244772 () Bool)

(assert (=> b!1244772 (= e!705604 (noDuplicate!2010 (t!40901 Nil!27429)))))

(assert (= (and d!137209 (not res!830332)) b!1244771))

(assert (= (and b!1244771 res!830333) b!1244772))

(declare-fun m!1147003 () Bool)

(assert (=> b!1244771 m!1147003))

(declare-fun m!1147005 () Bool)

(assert (=> b!1244772 m!1147005))

(assert (=> b!1244669 d!137209))

(declare-fun b!1244773 () Bool)

(declare-fun e!705605 () Bool)

(declare-fun call!61436 () Bool)

(assert (=> b!1244773 (= e!705605 call!61436)))

(declare-fun b!1244774 () Bool)

(declare-fun e!705607 () Bool)

(declare-fun e!705606 () Bool)

(assert (=> b!1244774 (= e!705607 e!705606)))

(declare-fun res!830336 () Bool)

(assert (=> b!1244774 (=> (not res!830336) (not e!705606))))

(declare-fun e!705608 () Bool)

(assert (=> b!1244774 (= res!830336 (not e!705608))))

(declare-fun res!830334 () Bool)

(assert (=> b!1244774 (=> (not res!830334) (not e!705608))))

(assert (=> b!1244774 (= res!830334 (validKeyInArray!0 (select (arr!38629 a!3892) newFrom!287)))))

(declare-fun b!1244775 () Bool)

(assert (=> b!1244775 (= e!705606 e!705605)))

(declare-fun c!121904 () Bool)

(assert (=> b!1244775 (= c!121904 (validKeyInArray!0 (select (arr!38629 a!3892) newFrom!287)))))

(declare-fun bm!61433 () Bool)

(assert (=> bm!61433 (= call!61436 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121904 (Cons!27428 (select (arr!38629 a!3892) newFrom!287) Nil!27429) Nil!27429)))))

(declare-fun b!1244776 () Bool)

(assert (=> b!1244776 (= e!705608 (contains!7432 Nil!27429 (select (arr!38629 a!3892) newFrom!287)))))

(declare-fun b!1244777 () Bool)

(assert (=> b!1244777 (= e!705605 call!61436)))

(declare-fun d!137213 () Bool)

(declare-fun res!830335 () Bool)

(assert (=> d!137213 (=> res!830335 e!705607)))

(assert (=> d!137213 (= res!830335 (bvsge newFrom!287 (size!39165 a!3892)))))

(assert (=> d!137213 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27429) e!705607)))

(assert (= (and d!137213 (not res!830335)) b!1244774))

(assert (= (and b!1244774 res!830334) b!1244776))

(assert (= (and b!1244774 res!830336) b!1244775))

(assert (= (and b!1244775 c!121904) b!1244773))

(assert (= (and b!1244775 (not c!121904)) b!1244777))

(assert (= (or b!1244773 b!1244777) bm!61433))

(declare-fun m!1147007 () Bool)

(assert (=> b!1244774 m!1147007))

(assert (=> b!1244774 m!1147007))

(declare-fun m!1147009 () Bool)

(assert (=> b!1244774 m!1147009))

