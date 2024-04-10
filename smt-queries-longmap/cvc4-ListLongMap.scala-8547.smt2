; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104272 () Bool)

(assert start!104272)

(declare-fun b!1245600 () Bool)

(declare-fun e!706322 () Bool)

(declare-fun e!706321 () Bool)

(assert (=> b!1245600 (= e!706322 e!706321)))

(declare-fun res!831060 () Bool)

(assert (=> b!1245600 (=> (not res!831060) (not e!706321))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245600 (= res!831060 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27483 0))(
  ( (Nil!27480) (Cons!27479 (h!28688 (_ BitVec 64)) (t!40952 List!27483)) )
))
(declare-fun lt!562945 () List!27483)

(declare-datatypes ((array!80194 0))(
  ( (array!80195 (arr!38680 (Array (_ BitVec 32) (_ BitVec 64))) (size!39216 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80194)

(assert (=> b!1245600 (= lt!562945 (Cons!27479 (select (arr!38680 a!3892) from!3270) Nil!27480))))

(declare-fun b!1245601 () Bool)

(declare-fun res!831061 () Bool)

(assert (=> b!1245601 (=> (not res!831061) (not e!706321))))

(declare-fun noDuplicate!2028 (List!27483) Bool)

(assert (=> b!1245601 (= res!831061 (noDuplicate!2028 lt!562945))))

(declare-fun b!1245602 () Bool)

(declare-fun res!831063 () Bool)

(assert (=> b!1245602 (=> (not res!831063) (not e!706322))))

(declare-fun arrayNoDuplicates!0 (array!80194 (_ BitVec 32) List!27483) Bool)

(assert (=> b!1245602 (= res!831063 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27480))))

(declare-fun b!1245603 () Bool)

(declare-fun res!831064 () Bool)

(assert (=> b!1245603 (=> (not res!831064) (not e!706322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245603 (= res!831064 (validKeyInArray!0 (select (arr!38680 a!3892) from!3270)))))

(declare-fun b!1245604 () Bool)

(declare-fun e!706323 () Bool)

(assert (=> b!1245604 (= e!706321 e!706323)))

(declare-fun res!831059 () Bool)

(assert (=> b!1245604 (=> res!831059 e!706323)))

(declare-fun contains!7449 (List!27483 (_ BitVec 64)) Bool)

(assert (=> b!1245604 (= res!831059 (contains!7449 lt!562945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245605 () Bool)

(declare-fun res!831062 () Bool)

(assert (=> b!1245605 (=> (not res!831062) (not e!706322))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245605 (= res!831062 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39216 a!3892)) (not (= newFrom!287 (size!39216 a!3892)))))))

(declare-fun res!831065 () Bool)

(assert (=> start!104272 (=> (not res!831065) (not e!706322))))

(assert (=> start!104272 (= res!831065 (and (bvslt (size!39216 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39216 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39216 a!3892))))))

(assert (=> start!104272 e!706322))

(declare-fun array_inv!29528 (array!80194) Bool)

(assert (=> start!104272 (array_inv!29528 a!3892)))

(assert (=> start!104272 true))

(declare-fun b!1245606 () Bool)

(assert (=> b!1245606 (= e!706323 (contains!7449 lt!562945 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104272 res!831065) b!1245602))

(assert (= (and b!1245602 res!831063) b!1245605))

(assert (= (and b!1245605 res!831062) b!1245603))

(assert (= (and b!1245603 res!831064) b!1245600))

(assert (= (and b!1245600 res!831060) b!1245601))

(assert (= (and b!1245601 res!831061) b!1245604))

(assert (= (and b!1245604 (not res!831059)) b!1245606))

(declare-fun m!1147615 () Bool)

(assert (=> b!1245602 m!1147615))

(declare-fun m!1147617 () Bool)

(assert (=> b!1245603 m!1147617))

(assert (=> b!1245603 m!1147617))

(declare-fun m!1147619 () Bool)

(assert (=> b!1245603 m!1147619))

(declare-fun m!1147621 () Bool)

(assert (=> b!1245606 m!1147621))

(assert (=> b!1245600 m!1147617))

(declare-fun m!1147623 () Bool)

(assert (=> b!1245601 m!1147623))

(declare-fun m!1147625 () Bool)

(assert (=> start!104272 m!1147625))

(declare-fun m!1147627 () Bool)

(assert (=> b!1245604 m!1147627))

(push 1)

(assert (not b!1245601))

(assert (not b!1245604))

(assert (not b!1245603))

(assert (not b!1245602))

(assert (not b!1245606))

(assert (not start!104272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137427 () Bool)

(declare-fun res!831119 () Bool)

(declare-fun e!706385 () Bool)

(assert (=> d!137427 (=> res!831119 e!706385)))

(assert (=> d!137427 (= res!831119 (bvsge from!3270 (size!39216 a!3892)))))

(assert (=> d!137427 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27480) e!706385)))

(declare-fun b!1245675 () Bool)

(declare-fun e!706388 () Bool)

(declare-fun call!61495 () Bool)

(assert (=> b!1245675 (= e!706388 call!61495)))

(declare-fun bm!61492 () Bool)

(declare-fun c!121963 () Bool)

(assert (=> bm!61492 (= call!61495 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121963 (Cons!27479 (select (arr!38680 a!3892) from!3270) Nil!27480) Nil!27480)))))

(declare-fun b!1245676 () Bool)

(assert (=> b!1245676 (= e!706388 call!61495)))

(declare-fun b!1245677 () Bool)

(declare-fun e!706386 () Bool)

(assert (=> b!1245677 (= e!706385 e!706386)))

(declare-fun res!831120 () Bool)

(assert (=> b!1245677 (=> (not res!831120) (not e!706386))))

(declare-fun e!706387 () Bool)

(assert (=> b!1245677 (= res!831120 (not e!706387))))

(declare-fun res!831118 () Bool)

(assert (=> b!1245677 (=> (not res!831118) (not e!706387))))

(assert (=> b!1245677 (= res!831118 (validKeyInArray!0 (select (arr!38680 a!3892) from!3270)))))

(declare-fun b!1245678 () Bool)

(assert (=> b!1245678 (= e!706386 e!706388)))

(assert (=> b!1245678 (= c!121963 (validKeyInArray!0 (select (arr!38680 a!3892) from!3270)))))

(declare-fun b!1245679 () Bool)

(assert (=> b!1245679 (= e!706387 (contains!7449 Nil!27480 (select (arr!38680 a!3892) from!3270)))))

(assert (= (and d!137427 (not res!831119)) b!1245677))

(assert (= (and b!1245677 res!831118) b!1245679))

(assert (= (and b!1245677 res!831120) b!1245678))

(assert (= (and b!1245678 c!121963) b!1245675))

(assert (= (and b!1245678 (not c!121963)) b!1245676))

(assert (= (or b!1245675 b!1245676) bm!61492))

(assert (=> bm!61492 m!1147617))

(declare-fun m!1147665 () Bool)

(assert (=> bm!61492 m!1147665))

(assert (=> b!1245677 m!1147617))

(assert (=> b!1245677 m!1147617))

(assert (=> b!1245677 m!1147619))

(assert (=> b!1245678 m!1147617))

(assert (=> b!1245678 m!1147617))

(assert (=> b!1245678 m!1147619))

(assert (=> b!1245679 m!1147617))

(assert (=> b!1245679 m!1147617))

(declare-fun m!1147667 () Bool)

(assert (=> b!1245679 m!1147667))

(assert (=> b!1245602 d!137427))

(declare-fun d!137431 () Bool)

(assert (=> d!137431 (= (array_inv!29528 a!3892) (bvsge (size!39216 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104272 d!137431))

(declare-fun d!137433 () Bool)

(declare-fun lt!562956 () Bool)

(declare-fun content!623 (List!27483) (Set (_ BitVec 64)))

(assert (=> d!137433 (= lt!562956 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!623 lt!562945)))))

(declare-fun e!706393 () Bool)

(assert (=> d!137433 (= lt!562956 e!706393)))

(declare-fun res!831125 () Bool)

(assert (=> d!137433 (=> (not res!831125) (not e!706393))))

(assert (=> d!137433 (= res!831125 (is-Cons!27479 lt!562945))))

(assert (=> d!137433 (= (contains!7449 lt!562945 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562956)))

(declare-fun b!1245684 () Bool)

(declare-fun e!706394 () Bool)

(assert (=> b!1245684 (= e!706393 e!706394)))

(declare-fun res!831126 () Bool)

(assert (=> b!1245684 (=> res!831126 e!706394)))

(assert (=> b!1245684 (= res!831126 (= (h!28688 lt!562945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245685 () Bool)

(assert (=> b!1245685 (= e!706394 (contains!7449 (t!40952 lt!562945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137433 res!831125) b!1245684))

(assert (= (and b!1245684 (not res!831126)) b!1245685))

(declare-fun m!1147669 () Bool)

(assert (=> d!137433 m!1147669))

(declare-fun m!1147671 () Bool)

(assert (=> d!137433 m!1147671))

(declare-fun m!1147673 () Bool)

(assert (=> b!1245685 m!1147673))

(assert (=> b!1245606 d!137433))

(declare-fun d!137435 () Bool)

(declare-fun res!831131 () Bool)

(declare-fun e!706399 () Bool)

(assert (=> d!137435 (=> res!831131 e!706399)))

(assert (=> d!137435 (= res!831131 (is-Nil!27480 lt!562945))))

(assert (=> d!137435 (= (noDuplicate!2028 lt!562945) e!706399)))

(declare-fun b!1245690 () Bool)

(declare-fun e!706400 () Bool)

(assert (=> b!1245690 (= e!706399 e!706400)))

(declare-fun res!831132 () Bool)

(assert (=> b!1245690 (=> (not res!831132) (not e!706400))))

(assert (=> b!1245690 (= res!831132 (not (contains!7449 (t!40952 lt!562945) (h!28688 lt!562945))))))

(declare-fun b!1245691 () Bool)

(assert (=> b!1245691 (= e!706400 (noDuplicate!2028 (t!40952 lt!562945)))))

(assert (= (and d!137435 (not res!831131)) b!1245690))

(assert (= (and b!1245690 res!831132) b!1245691))

(declare-fun m!1147675 () Bool)

(assert (=> b!1245690 m!1147675))

(declare-fun m!1147677 () Bool)

(assert (=> b!1245691 m!1147677))

(assert (=> b!1245601 d!137435))

(declare-fun d!137437 () Bool)

(assert (=> d!137437 (= (validKeyInArray!0 (select (arr!38680 a!3892) from!3270)) (and (not (= (select (arr!38680 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38680 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245603 d!137437))

(declare-fun d!137439 () Bool)

(declare-fun lt!562957 () Bool)

(assert (=> d!137439 (= lt!562957 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!623 lt!562945)))))

(declare-fun e!706401 () Bool)

(assert (=> d!137439 (= lt!562957 e!706401)))

(declare-fun res!831133 () Bool)

(assert (=> d!137439 (=> (not res!831133) (not e!706401))))

(assert (=> d!137439 (= res!831133 (is-Cons!27479 lt!562945))))

(assert (=> d!137439 (= (contains!7449 lt!562945 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562957)))

(declare-fun b!1245692 () Bool)

(declare-fun e!706402 () Bool)

(assert (=> b!1245692 (= e!706401 e!706402)))

(declare-fun res!831134 () Bool)

(assert (=> b!1245692 (=> res!831134 e!706402)))

(assert (=> b!1245692 (= res!831134 (= (h!28688 lt!562945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245693 () Bool)

(assert (=> b!1245693 (= e!706402 (contains!7449 (t!40952 lt!562945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137439 res!831133) b!1245692))

(assert (= (and b!1245692 (not res!831134)) b!1245693))

(assert (=> d!137439 m!1147669))

(declare-fun m!1147679 () Bool)

(assert (=> d!137439 m!1147679))

(declare-fun m!1147681 () Bool)

(assert (=> b!1245693 m!1147681))

(assert (=> b!1245604 d!137439))

(push 1)

(assert (not b!1245678))

(assert (not b!1245679))

(assert (not bm!61492))

(assert (not d!137439))

(assert (not b!1245693))

(assert (not b!1245677))

(assert (not b!1245690))

(assert (not b!1245685))

(assert (not d!137433))

(assert (not b!1245691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

