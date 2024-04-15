; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117660 () Bool)

(assert start!117660)

(declare-fun b!1380889 () Bool)

(declare-fun e!782658 () Bool)

(declare-fun e!782659 () Bool)

(assert (=> b!1380889 (= e!782658 e!782659)))

(declare-fun c!128534 () Bool)

(declare-datatypes ((array!94111 0))(
  ( (array!94112 (arr!45447 (Array (_ BitVec 32) (_ BitVec 64))) (size!45999 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94111)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380889 (= c!128534 (validKeyInArray!0 (select (arr!45447 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380890 () Bool)

(declare-fun call!66462 () (_ BitVec 32))

(declare-fun call!66461 () (_ BitVec 32))

(assert (=> b!1380890 (= e!782659 (not (= call!66462 call!66461)))))

(declare-fun res!922706 () Bool)

(assert (=> start!117660 (=> (not res!922706) (not e!782658))))

(declare-fun from!3309 () (_ BitVec 32))

(assert (=> start!117660 (= res!922706 (and (bvslt (size!45999 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45999 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117660 e!782658))

(declare-fun array_inv!34680 (array!94111) Bool)

(assert (=> start!117660 (array_inv!34680 a!3931)))

(assert (=> start!117660 true))

(declare-fun b!1380891 () Bool)

(assert (=> b!1380891 (= e!782659 (not (= (bvadd #b00000000000000000000000000000001 call!66462) call!66461)))))

(declare-fun bm!66458 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94111 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66458 (= call!66461 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun bm!66459 () Bool)

(assert (=> bm!66459 (= call!66462 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117660 res!922706) b!1380889))

(assert (= (and b!1380889 c!128534) b!1380891))

(assert (= (and b!1380889 (not c!128534)) b!1380890))

(assert (= (or b!1380891 b!1380890) bm!66458))

(assert (= (or b!1380891 b!1380890) bm!66459))

(declare-fun m!1265675 () Bool)

(assert (=> b!1380889 m!1265675))

(assert (=> b!1380889 m!1265675))

(declare-fun m!1265677 () Bool)

(assert (=> b!1380889 m!1265677))

(declare-fun m!1265679 () Bool)

(assert (=> start!117660 m!1265679))

(declare-fun m!1265681 () Bool)

(assert (=> bm!66458 m!1265681))

(declare-fun m!1265683 () Bool)

(assert (=> bm!66459 m!1265683))

(push 1)

(assert (not start!117660))

(assert (not b!1380889))

(assert (not bm!66459))

(assert (not bm!66458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148805 () Bool)

(assert (=> d!148805 (= (array_inv!34680 a!3931) (bvsge (size!45999 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117660 d!148805))

(declare-fun d!148809 () Bool)

(assert (=> d!148809 (= (validKeyInArray!0 (select (arr!45447 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45447 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45447 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380889 d!148809))

(declare-fun b!1380924 () Bool)

(declare-fun e!782677 () (_ BitVec 32))

(declare-fun e!782676 () (_ BitVec 32))

(assert (=> b!1380924 (= e!782677 e!782676)))

(declare-fun c!128552 () Bool)

(assert (=> b!1380924 (= c!128552 (validKeyInArray!0 (select (arr!45447 a!3931) from!3309)))))

(declare-fun bm!66468 () Bool)

(declare-fun call!66471 () (_ BitVec 32))

(assert (=> bm!66468 (= call!66471 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380926 () Bool)

(assert (=> b!1380926 (= e!782677 #b00000000000000000000000000000000)))

(declare-fun b!1380927 () Bool)

(assert (=> b!1380927 (= e!782676 (bvadd #b00000000000000000000000000000001 call!66471))))

(declare-fun b!1380925 () Bool)

(assert (=> b!1380925 (= e!782676 call!66471)))

(declare-fun d!148813 () Bool)

(declare-fun lt!607955 () (_ BitVec 32))

(assert (=> d!148813 (and (bvsge lt!607955 #b00000000000000000000000000000000) (bvsle lt!607955 (bvsub (size!45999 a!3931) from!3309)))))

(assert (=> d!148813 (= lt!607955 e!782677)))

(declare-fun c!128551 () Bool)

(assert (=> d!148813 (= c!128551 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148813 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45999 a!3931)))))

(assert (=> d!148813 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!607955)))

(assert (= (and d!148813 c!128551) b!1380926))

(assert (= (and d!148813 (not c!128551)) b!1380924))

(assert (= (and b!1380924 c!128552) b!1380927))

(assert (= (and b!1380924 (not c!128552)) b!1380925))

(assert (= (or b!1380927 b!1380925) bm!66468))

(declare-fun m!1265693 () Bool)

(assert (=> b!1380924 m!1265693))

(assert (=> b!1380924 m!1265693))

(declare-fun m!1265695 () Bool)

(assert (=> b!1380924 m!1265695))

(declare-fun m!1265697 () Bool)

(assert (=> bm!66468 m!1265697))

(assert (=> bm!66459 d!148813))

(declare-fun b!1380928 () Bool)

(declare-fun e!782679 () (_ BitVec 32))

(declare-fun e!782678 () (_ BitVec 32))

(assert (=> b!1380928 (= e!782679 e!782678)))

(declare-fun c!128554 () Bool)

(assert (=> b!1380928 (= c!128554 (validKeyInArray!0 (select (arr!45447 a!3931) from!3309)))))

(declare-fun call!66472 () (_ BitVec 32))

(declare-fun bm!66469 () Bool)

(assert (=> bm!66469 (= call!66472 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380930 () Bool)

(assert (=> b!1380930 (= e!782679 #b00000000000000000000000000000000)))

(declare-fun b!1380931 () Bool)

(assert (=> b!1380931 (= e!782678 (bvadd #b00000000000000000000000000000001 call!66472))))

(declare-fun b!1380929 () Bool)

(assert (=> b!1380929 (= e!782678 call!66472)))

(declare-fun d!148817 () Bool)

(declare-fun lt!607956 () (_ BitVec 32))

(assert (=> d!148817 (and (bvsge lt!607956 #b00000000000000000000000000000000) (bvsle lt!607956 (bvsub (size!45999 a!3931) from!3309)))))

(assert (=> d!148817 (= lt!607956 e!782679)))

(declare-fun c!128553 () Bool)

(assert (=> d!148817 (= c!128553 (bvsge from!3309 to!105))))

(assert (=> d!148817 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!45999 a!3931)))))

(assert (=> d!148817 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!607956)))

(assert (= (and d!148817 c!128553) b!1380930))

(assert (= (and d!148817 (not c!128553)) b!1380928))

(assert (= (and b!1380928 c!128554) b!1380931))

(assert (= (and b!1380928 (not c!128554)) b!1380929))

(assert (= (or b!1380931 b!1380929) bm!66469))

(assert (=> b!1380928 m!1265693))

(assert (=> b!1380928 m!1265693))

(assert (=> b!1380928 m!1265695))

(declare-fun m!1265699 () Bool)

(assert (=> bm!66469 m!1265699))

(assert (=> bm!66458 d!148817))

(push 1)

(assert (not bm!66468))

(assert (not b!1380924))

(assert (not bm!66469))

(assert (not b!1380928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1380948 () Bool)

(declare-fun e!782689 () (_ BitVec 32))

(declare-fun e!782688 () (_ BitVec 32))

(assert (=> b!1380948 (= e!782689 e!782688)))

(declare-fun c!128564 () Bool)

(assert (=> b!1380948 (= c!128564 (validKeyInArray!0 (select (arr!45447 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun call!66477 () (_ BitVec 32))

(declare-fun bm!66474 () Bool)

(assert (=> bm!66474 (= call!66477 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380950 () Bool)

(assert (=> b!1380950 (= e!782689 #b00000000000000000000000000000000)))

(declare-fun b!1380951 () Bool)

(assert (=> b!1380951 (= e!782688 (bvadd #b00000000000000000000000000000001 call!66477))))

(declare-fun b!1380949 () Bool)

(assert (=> b!1380949 (= e!782688 call!66477)))

(declare-fun d!148831 () Bool)

(declare-fun lt!607961 () (_ BitVec 32))

(assert (=> d!148831 (and (bvsge lt!607961 #b00000000000000000000000000000000) (bvsle lt!607961 (bvsub (size!45999 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(assert (=> d!148831 (= lt!607961 e!782689)))

(declare-fun c!128563 () Bool)

(assert (=> d!148831 (= c!128563 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148831 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45999 a!3931)))))

(assert (=> d!148831 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) lt!607961)))

(assert (= (and d!148831 c!128563) b!1380950))

(assert (= (and d!148831 (not c!128563)) b!1380948))

(assert (= (and b!1380948 c!128564) b!1380951))

(assert (= (and b!1380948 (not c!128564)) b!1380949))

(assert (= (or b!1380951 b!1380949) bm!66474))

(declare-fun m!1265717 () Bool)

(assert (=> b!1380948 m!1265717))

(assert (=> b!1380948 m!1265717))

(declare-fun m!1265719 () Bool)

(assert (=> b!1380948 m!1265719))

(declare-fun m!1265721 () Bool)

(assert (=> bm!66474 m!1265721))

(assert (=> bm!66468 d!148831))

(declare-fun d!148833 () Bool)

(assert (=> d!148833 (= (validKeyInArray!0 (select (arr!45447 a!3931) from!3309)) (and (not (= (select (arr!45447 a!3931) from!3309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45447 a!3931) from!3309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380924 d!148833))

(declare-fun b!1380952 () Bool)

(declare-fun e!782691 () (_ BitVec 32))

(declare-fun e!782690 () (_ BitVec 32))

(assert (=> b!1380952 (= e!782691 e!782690)))

(declare-fun c!128566 () Bool)

(assert (=> b!1380952 (= c!128566 (validKeyInArray!0 (select (arr!45447 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun call!66478 () (_ BitVec 32))

(declare-fun bm!66475 () Bool)

(assert (=> bm!66475 (= call!66478 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380954 () Bool)

(assert (=> b!1380954 (= e!782691 #b00000000000000000000000000000000)))

(declare-fun b!1380955 () Bool)

(assert (=> b!1380955 (= e!782690 (bvadd #b00000000000000000000000000000001 call!66478))))

(declare-fun b!1380953 () Bool)

(assert (=> b!1380953 (= e!782690 call!66478)))

(declare-fun d!148835 () Bool)

(declare-fun lt!607962 () (_ BitVec 32))

(assert (=> d!148835 (and (bvsge lt!607962 #b00000000000000000000000000000000) (bvsle lt!607962 (bvsub (size!45999 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(assert (=> d!148835 (= lt!607962 e!782691)))

(declare-fun c!128565 () Bool)

(assert (=> d!148835 (= c!128565 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (=> d!148835 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) to!105) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!105 (size!45999 a!3931)))))

(assert (=> d!148835 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105) lt!607962)))

(assert (= (and d!148835 c!128565) b!1380954))

(assert (= (and d!148835 (not c!128565)) b!1380952))

(assert (= (and b!1380952 c!128566) b!1380955))

(assert (= (and b!1380952 (not c!128566)) b!1380953))

(assert (= (or b!1380955 b!1380953) bm!66475))

(assert (=> b!1380952 m!1265717))

(assert (=> b!1380952 m!1265717))

(assert (=> b!1380952 m!1265719))

(declare-fun m!1265723 () Bool)

(assert (=> bm!66475 m!1265723))

(assert (=> bm!66469 d!148835))

(assert (=> b!1380928 d!148833))

(push 1)

(assert (not bm!66475))

(assert (not bm!66474))

(assert (not b!1380948))

(assert (not b!1380952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

