; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104462 () Bool)

(assert start!104462)

(declare-fun b!1246627 () Bool)

(declare-datatypes ((Unit!41444 0))(
  ( (Unit!41445) )
))
(declare-fun e!707030 () Unit!41444)

(declare-fun Unit!41446 () Unit!41444)

(assert (=> b!1246627 (= e!707030 Unit!41446)))

(declare-fun b!1246628 () Bool)

(declare-fun e!707033 () Bool)

(declare-fun e!707032 () Bool)

(assert (=> b!1246628 (= e!707033 e!707032)))

(declare-fun res!831906 () Bool)

(assert (=> b!1246628 (=> (not res!831906) (not e!707032))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246628 (= res!831906 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563154 () Unit!41444)

(assert (=> b!1246628 (= lt!563154 e!707030)))

(declare-fun c!122046 () Bool)

(declare-datatypes ((array!80254 0))(
  ( (array!80255 (arr!38704 (Array (_ BitVec 32) (_ BitVec 64))) (size!39240 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80254)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246628 (= c!122046 (validKeyInArray!0 (select (arr!38704 a!3892) from!3270)))))

(declare-fun b!1246629 () Bool)

(declare-fun res!831905 () Bool)

(assert (=> b!1246629 (=> (not res!831905) (not e!707033))))

(assert (=> b!1246629 (= res!831905 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39240 a!3892)) (not (= newFrom!287 (size!39240 a!3892)))))))

(declare-fun b!1246631 () Bool)

(declare-fun lt!563153 () Unit!41444)

(assert (=> b!1246631 (= e!707030 lt!563153)))

(declare-datatypes ((List!27507 0))(
  ( (Nil!27504) (Cons!27503 (h!28712 (_ BitVec 64)) (t!40976 List!27507)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80254 List!27507 List!27507 (_ BitVec 32)) Unit!41444)

(assert (=> b!1246631 (= lt!563153 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27503 (select (arr!38704 a!3892) from!3270) Nil!27504) Nil!27504 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80254 (_ BitVec 32) List!27507) Bool)

(assert (=> b!1246631 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27504)))

(declare-fun b!1246632 () Bool)

(declare-fun res!831904 () Bool)

(assert (=> b!1246632 (=> (not res!831904) (not e!707033))))

(assert (=> b!1246632 (= res!831904 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27504))))

(declare-fun res!831907 () Bool)

(assert (=> start!104462 (=> (not res!831907) (not e!707033))))

(assert (=> start!104462 (= res!831907 (and (bvslt (size!39240 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39240 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39240 a!3892))))))

(assert (=> start!104462 e!707033))

(declare-fun array_inv!29552 (array!80254) Bool)

(assert (=> start!104462 (array_inv!29552 a!3892)))

(assert (=> start!104462 true))

(declare-fun b!1246630 () Bool)

(assert (=> b!1246630 (= e!707032 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27504)))))

(assert (= (and start!104462 res!831907) b!1246632))

(assert (= (and b!1246632 res!831904) b!1246629))

(assert (= (and b!1246629 res!831905) b!1246628))

(assert (= (and b!1246628 c!122046) b!1246631))

(assert (= (and b!1246628 (not c!122046)) b!1246627))

(assert (= (and b!1246628 res!831906) b!1246630))

(declare-fun m!1148417 () Bool)

(assert (=> b!1246628 m!1148417))

(assert (=> b!1246628 m!1148417))

(declare-fun m!1148419 () Bool)

(assert (=> b!1246628 m!1148419))

(assert (=> b!1246631 m!1148417))

(declare-fun m!1148421 () Bool)

(assert (=> b!1246631 m!1148421))

(declare-fun m!1148423 () Bool)

(assert (=> b!1246631 m!1148423))

(declare-fun m!1148425 () Bool)

(assert (=> start!104462 m!1148425))

(assert (=> b!1246630 m!1148423))

(declare-fun m!1148427 () Bool)

(assert (=> b!1246632 m!1148427))

(push 1)

(assert (not b!1246630))

(assert (not start!104462))

(assert (not b!1246632))

(assert (not b!1246628))

(assert (not b!1246631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1246673 () Bool)

(declare-fun e!707066 () Bool)

(declare-fun e!707069 () Bool)

(assert (=> b!1246673 (= e!707066 e!707069)))

(declare-fun c!122055 () Bool)

(assert (=> b!1246673 (= c!122055 (validKeyInArray!0 (select (arr!38704 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246674 () Bool)

(declare-fun e!707067 () Bool)

(assert (=> b!1246674 (= e!707067 e!707066)))

(declare-fun res!831932 () Bool)

(assert (=> b!1246674 (=> (not res!831932) (not e!707066))))

(declare-fun e!707068 () Bool)

(assert (=> b!1246674 (= res!831932 (not e!707068))))

(declare-fun res!831934 () Bool)

(assert (=> b!1246674 (=> (not res!831934) (not e!707068))))

(assert (=> b!1246674 (= res!831934 (validKeyInArray!0 (select (arr!38704 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246676 () Bool)

(declare-fun call!61536 () Bool)

(assert (=> b!1246676 (= e!707069 call!61536)))

(declare-fun b!1246675 () Bool)

(declare-fun contains!7461 (List!27507 (_ BitVec 64)) Bool)

(assert (=> b!1246675 (= e!707068 (contains!7461 Nil!27504 (select (arr!38704 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137659 () Bool)

(declare-fun res!831933 () Bool)

(assert (=> d!137659 (=> res!831933 e!707067)))

(assert (=> d!137659 (= res!831933 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39240 a!3892)))))

(assert (=> d!137659 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27504) e!707067)))

(declare-fun bm!61533 () Bool)

(assert (=> bm!61533 (= call!61536 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122055 (Cons!27503 (select (arr!38704 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27504) Nil!27504)))))

(declare-fun b!1246677 () Bool)

(assert (=> b!1246677 (= e!707069 call!61536)))

(assert (= (and d!137659 (not res!831933)) b!1246674))

(assert (= (and b!1246674 res!831934) b!1246675))

(assert (= (and b!1246674 res!831932) b!1246673))

(assert (= (and b!1246673 c!122055) b!1246676))

(assert (= (and b!1246673 (not c!122055)) b!1246677))

(assert (= (or b!1246676 b!1246677) bm!61533))

(declare-fun m!1148445 () Bool)

(assert (=> b!1246673 m!1148445))

(assert (=> b!1246673 m!1148445))

(declare-fun m!1148447 () Bool)

(assert (=> b!1246673 m!1148447))

(assert (=> b!1246674 m!1148445))

(assert (=> b!1246674 m!1148445))

(assert (=> b!1246674 m!1148447))

(assert (=> b!1246675 m!1148445))

(assert (=> b!1246675 m!1148445))

(declare-fun m!1148449 () Bool)

(assert (=> b!1246675 m!1148449))

(assert (=> bm!61533 m!1148445))

(declare-fun m!1148451 () Bool)

(assert (=> bm!61533 m!1148451))

(assert (=> b!1246630 d!137659))

(declare-fun d!137669 () Bool)

(assert (=> d!137669 (= (array_inv!29552 a!3892) (bvsge (size!39240 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104462 d!137669))

(declare-fun d!137671 () Bool)

(assert (=> d!137671 (= (validKeyInArray!0 (select (arr!38704 a!3892) from!3270)) (and (not (= (select (arr!38704 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38704 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246628 d!137671))

(declare-fun b!1246683 () Bool)

(declare-fun e!707074 () Bool)

(declare-fun e!707077 () Bool)

