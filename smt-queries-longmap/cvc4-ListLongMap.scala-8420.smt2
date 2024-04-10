; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102460 () Bool)

(assert start!102460)

(declare-fun b!1232470 () Bool)

(declare-fun res!820851 () Bool)

(declare-fun e!699008 () Bool)

(assert (=> b!1232470 (=> (not res!820851) (not e!699008))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232470 (= res!820851 (validKeyInArray!0 k!2913))))

(declare-fun b!1232471 () Bool)

(declare-fun e!699007 () Bool)

(declare-datatypes ((array!79491 0))(
  ( (array!79492 (arr!38359 (Array (_ BitVec 32) (_ BitVec 64))) (size!38895 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79491)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27132 0))(
  ( (Nil!27129) (Cons!27128 (h!28337 (_ BitVec 64)) (t!40595 List!27132)) )
))
(declare-fun arrayNoDuplicates!0 (array!79491 (_ BitVec 32) List!27132) Bool)

(assert (=> b!1232471 (= e!699007 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)))))

(declare-fun b!1232472 () Bool)

(declare-fun res!820858 () Bool)

(assert (=> b!1232472 (=> (not res!820858) (not e!699008))))

(declare-fun acc!823 () List!27132)

(declare-fun contains!7194 (List!27132 (_ BitVec 64)) Bool)

(assert (=> b!1232472 (= res!820858 (not (contains!7194 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232473 () Bool)

(declare-fun res!820849 () Bool)

(assert (=> b!1232473 (=> (not res!820849) (not e!699008))))

(assert (=> b!1232473 (= res!820849 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!820855 () Bool)

(assert (=> start!102460 (=> (not res!820855) (not e!699008))))

(assert (=> start!102460 (= res!820855 (bvslt (size!38895 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102460 e!699008))

(declare-fun array_inv!29207 (array!79491) Bool)

(assert (=> start!102460 (array_inv!29207 a!3806)))

(assert (=> start!102460 true))

(declare-fun b!1232474 () Bool)

(declare-fun res!820853 () Bool)

(assert (=> b!1232474 (=> (not res!820853) (not e!699008))))

(assert (=> b!1232474 (= res!820853 (not (contains!7194 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232475 () Bool)

(declare-fun res!820850 () Bool)

(assert (=> b!1232475 (=> (not res!820850) (not e!699008))))

(assert (=> b!1232475 (= res!820850 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38895 a!3806)) (bvslt from!3184 (size!38895 a!3806))))))

(declare-fun b!1232476 () Bool)

(declare-fun res!820852 () Bool)

(assert (=> b!1232476 (=> (not res!820852) (not e!699008))))

(declare-fun arrayContainsKey!0 (array!79491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232476 (= res!820852 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232477 () Bool)

(declare-fun e!699006 () Bool)

(assert (=> b!1232477 (= e!699008 (not e!699006))))

(declare-fun res!820857 () Bool)

(assert (=> b!1232477 (=> res!820857 e!699006)))

(assert (=> b!1232477 (= res!820857 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1232477 e!699007))

(declare-fun res!820856 () Bool)

(assert (=> b!1232477 (=> (not res!820856) (not e!699007))))

(assert (=> b!1232477 (= res!820856 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27129))))

(declare-datatypes ((Unit!40824 0))(
  ( (Unit!40825) )
))
(declare-fun lt!559520 () Unit!40824)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79491 List!27132 List!27132 (_ BitVec 32)) Unit!40824)

(assert (=> b!1232477 (= lt!559520 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27129 from!3184))))

(assert (=> b!1232477 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823))))

(declare-fun b!1232478 () Bool)

(declare-fun res!820854 () Bool)

(assert (=> b!1232478 (=> (not res!820854) (not e!699008))))

(declare-fun noDuplicate!1791 (List!27132) Bool)

(assert (=> b!1232478 (= res!820854 (noDuplicate!1791 acc!823))))

(declare-fun b!1232479 () Bool)

(declare-fun res!820848 () Bool)

(assert (=> b!1232479 (=> (not res!820848) (not e!699008))))

(assert (=> b!1232479 (= res!820848 (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)))))

(declare-fun b!1232480 () Bool)

(assert (=> b!1232480 (= e!699006 (noDuplicate!1791 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)))))

(assert (= (and start!102460 res!820855) b!1232470))

(assert (= (and b!1232470 res!820851) b!1232475))

(assert (= (and b!1232475 res!820850) b!1232478))

(assert (= (and b!1232478 res!820854) b!1232472))

(assert (= (and b!1232472 res!820858) b!1232474))

(assert (= (and b!1232474 res!820853) b!1232476))

(assert (= (and b!1232476 res!820852) b!1232473))

(assert (= (and b!1232473 res!820849) b!1232479))

(assert (= (and b!1232479 res!820848) b!1232477))

(assert (= (and b!1232477 res!820856) b!1232471))

(assert (= (and b!1232477 (not res!820857)) b!1232480))

(declare-fun m!1136451 () Bool)

(assert (=> b!1232477 m!1136451))

(declare-fun m!1136453 () Bool)

(assert (=> b!1232477 m!1136453))

(declare-fun m!1136455 () Bool)

(assert (=> b!1232477 m!1136455))

(declare-fun m!1136457 () Bool)

(assert (=> b!1232477 m!1136457))

(declare-fun m!1136459 () Bool)

(assert (=> b!1232474 m!1136459))

(declare-fun m!1136461 () Bool)

(assert (=> b!1232472 m!1136461))

(assert (=> b!1232480 m!1136455))

(declare-fun m!1136463 () Bool)

(assert (=> b!1232480 m!1136463))

(declare-fun m!1136465 () Bool)

(assert (=> b!1232470 m!1136465))

(declare-fun m!1136467 () Bool)

(assert (=> b!1232473 m!1136467))

(assert (=> b!1232471 m!1136455))

(declare-fun m!1136469 () Bool)

(assert (=> b!1232471 m!1136469))

(assert (=> b!1232479 m!1136455))

(assert (=> b!1232479 m!1136455))

(declare-fun m!1136471 () Bool)

(assert (=> b!1232479 m!1136471))

(declare-fun m!1136473 () Bool)

(assert (=> b!1232476 m!1136473))

(declare-fun m!1136475 () Bool)

(assert (=> start!102460 m!1136475))

(declare-fun m!1136477 () Bool)

(assert (=> b!1232478 m!1136477))

(push 1)

(assert (not start!102460))

(assert (not b!1232480))

(assert (not b!1232472))

(assert (not b!1232473))

(assert (not b!1232474))

(assert (not b!1232476))

(assert (not b!1232477))

(assert (not b!1232471))

(assert (not b!1232478))

(assert (not b!1232470))

(assert (not b!1232479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134867 () Bool)

(assert (=> d!134867 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232470 d!134867))

(declare-fun d!134869 () Bool)

(declare-fun res!820882 () Bool)

(declare-fun e!699036 () Bool)

(assert (=> d!134869 (=> res!820882 e!699036)))

(assert (=> d!134869 (= res!820882 (= (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134869 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699036)))

(declare-fun b!1232508 () Bool)

(declare-fun e!699037 () Bool)

(assert (=> b!1232508 (= e!699036 e!699037)))

(declare-fun res!820883 () Bool)

(assert (=> b!1232508 (=> (not res!820883) (not e!699037))))

(assert (=> b!1232508 (= res!820883 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38895 a!3806)))))

(declare-fun b!1232509 () Bool)

(assert (=> b!1232509 (= e!699037 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134869 (not res!820882)) b!1232508))

(assert (= (and b!1232508 res!820883) b!1232509))

(declare-fun m!1136483 () Bool)

(assert (=> d!134869 m!1136483))

(declare-fun m!1136485 () Bool)

(assert (=> b!1232509 m!1136485))

(assert (=> b!1232476 d!134869))

(declare-fun d!134871 () Bool)

(declare-fun res!820903 () Bool)

(declare-fun e!699063 () Bool)

(assert (=> d!134871 (=> res!820903 e!699063)))

(assert (=> d!134871 (= res!820903 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38895 a!3806)))))

(assert (=> d!134871 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)) e!699063)))

(declare-fun b!1232539 () Bool)

(declare-fun e!699061 () Bool)

(declare-fun call!60916 () Bool)

(assert (=> b!1232539 (= e!699061 call!60916)))

(declare-fun b!1232540 () Bool)

(declare-fun e!699062 () Bool)

(assert (=> b!1232540 (= e!699062 e!699061)))

(declare-fun c!120679 () Bool)

(assert (=> b!1232540 (= c!120679 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60913 () Bool)

(assert (=> bm!60913 (= call!60916 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120679 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)) (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129))))))

(declare-fun b!1232541 () Bool)

(assert (=> b!1232541 (= e!699061 call!60916)))

(declare-fun b!1232542 () Bool)

(assert (=> b!1232542 (= e!699063 e!699062)))

(declare-fun res!820902 () Bool)

(assert (=> b!1232542 (=> (not res!820902) (not e!699062))))

(declare-fun e!699060 () Bool)

(assert (=> b!1232542 (= res!820902 (not e!699060))))

(declare-fun res!820901 () Bool)

(assert (=> b!1232542 (=> (not res!820901) (not e!699060))))

(assert (=> b!1232542 (= res!820901 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232543 () Bool)

(assert (=> b!1232543 (= e!699060 (contains!7194 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134871 (not res!820903)) b!1232542))

(assert (= (and b!1232542 res!820901) b!1232543))

(assert (= (and b!1232542 res!820902) b!1232540))

(assert (= (and b!1232540 c!120679) b!1232541))

(assert (= (and b!1232540 (not c!120679)) b!1232539))

(assert (= (or b!1232541 b!1232539) bm!60913))

(assert (=> b!1232540 m!1136483))

(assert (=> b!1232540 m!1136483))

(declare-fun m!1136501 () Bool)

(assert (=> b!1232540 m!1136501))

(assert (=> bm!60913 m!1136483))

(declare-fun m!1136503 () Bool)

(assert (=> bm!60913 m!1136503))

(assert (=> b!1232542 m!1136483))

(assert (=> b!1232542 m!1136483))

(assert (=> b!1232542 m!1136501))

(assert (=> b!1232543 m!1136483))

(assert (=> b!1232543 m!1136483))

(declare-fun m!1136505 () Bool)

(assert (=> b!1232543 m!1136505))

(assert (=> b!1232471 d!134871))

(declare-fun d!134881 () Bool)

(declare-fun lt!559527 () Bool)

(declare-fun content!570 (List!27132) (Set (_ BitVec 64)))

(assert (=> d!134881 (= lt!559527 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!570 acc!823)))))

(declare-fun e!699086 () Bool)

(assert (=> d!134881 (= lt!559527 e!699086)))

(declare-fun res!820926 () Bool)

(assert (=> d!134881 (=> (not res!820926) (not e!699086))))

(assert (=> d!134881 (= res!820926 (is-Cons!27128 acc!823))))

(assert (=> d!134881 (= (contains!7194 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559527)))

(declare-fun b!1232567 () Bool)

(declare-fun e!699087 () Bool)

(assert (=> b!1232567 (= e!699086 e!699087)))

(declare-fun res!820925 () Bool)

(assert (=> b!1232567 (=> res!820925 e!699087)))

(assert (=> b!1232567 (= res!820925 (= (h!28337 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232568 () Bool)

(assert (=> b!1232568 (= e!699087 (contains!7194 (t!40595 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134881 res!820926) b!1232567))

(assert (= (and b!1232567 (not res!820925)) b!1232568))

(declare-fun m!1136519 () Bool)

(assert (=> d!134881 m!1136519))

(declare-fun m!1136521 () Bool)

(assert (=> d!134881 m!1136521))

(declare-fun m!1136525 () Bool)

(assert (=> b!1232568 m!1136525))

(assert (=> b!1232474 d!134881))

(declare-fun d!134889 () Bool)

(declare-fun res!820936 () Bool)

(declare-fun e!699098 () Bool)

(assert (=> d!134889 (=> res!820936 e!699098)))

(assert (=> d!134889 (= res!820936 (is-Nil!27129 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)))))

(assert (=> d!134889 (= (noDuplicate!1791 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)) e!699098)))

(declare-fun b!1232580 () Bool)

(declare-fun e!699099 () Bool)

(assert (=> b!1232580 (= e!699098 e!699099)))

(declare-fun res!820937 () Bool)

(assert (=> b!1232580 (=> (not res!820937) (not e!699099))))

(assert (=> b!1232580 (= res!820937 (not (contains!7194 (t!40595 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)) (h!28337 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129)))))))

(declare-fun b!1232581 () Bool)

(assert (=> b!1232581 (= e!699099 (noDuplicate!1791 (t!40595 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129))))))

(assert (= (and d!134889 (not res!820936)) b!1232580))

(assert (= (and b!1232580 res!820937) b!1232581))

(declare-fun m!1136537 () Bool)

(assert (=> b!1232580 m!1136537))

(declare-fun m!1136539 () Bool)

(assert (=> b!1232581 m!1136539))

(assert (=> b!1232480 d!134889))

(declare-fun d!134899 () Bool)

(assert (=> d!134899 (= (array_inv!29207 a!3806) (bvsge (size!38895 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102460 d!134899))

(declare-fun d!134901 () Bool)

(declare-fun res!820938 () Bool)

(declare-fun e!699100 () Bool)

(assert (=> d!134901 (=> res!820938 e!699100)))

(assert (=> d!134901 (= res!820938 (is-Nil!27129 acc!823))))

(assert (=> d!134901 (= (noDuplicate!1791 acc!823) e!699100)))

(declare-fun b!1232582 () Bool)

(declare-fun e!699101 () Bool)

(assert (=> b!1232582 (= e!699100 e!699101)))

(declare-fun res!820939 () Bool)

(assert (=> b!1232582 (=> (not res!820939) (not e!699101))))

(assert (=> b!1232582 (= res!820939 (not (contains!7194 (t!40595 acc!823) (h!28337 acc!823))))))

(declare-fun b!1232583 () Bool)

(assert (=> b!1232583 (= e!699101 (noDuplicate!1791 (t!40595 acc!823)))))

(assert (= (and d!134901 (not res!820938)) b!1232582))

(assert (= (and b!1232582 res!820939) b!1232583))

(declare-fun m!1136547 () Bool)

(assert (=> b!1232582 m!1136547))

(declare-fun m!1136549 () Bool)

(assert (=> b!1232583 m!1136549))

(assert (=> b!1232478 d!134901))

(declare-fun d!134905 () Bool)

(declare-fun res!820946 () Bool)

(declare-fun e!699111 () Bool)

(assert (=> d!134905 (=> res!820946 e!699111)))

(assert (=> d!134905 (= res!820946 (bvsge from!3184 (size!38895 a!3806)))))

(assert (=> d!134905 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699111)))

(declare-fun b!1232589 () Bool)

(declare-fun e!699107 () Bool)

(declare-fun call!60920 () Bool)

(assert (=> b!1232589 (= e!699107 call!60920)))

(declare-fun b!1232590 () Bool)

(declare-fun e!699108 () Bool)

(assert (=> b!1232590 (= e!699108 e!699107)))

(declare-fun c!120683 () Bool)

(assert (=> b!1232590 (= c!120683 (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)))))

(declare-fun bm!60917 () Bool)

(assert (=> bm!60917 (= call!60920 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120683 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1232591 () Bool)

(assert (=> b!1232591 (= e!699107 call!60920)))

(declare-fun b!1232592 () Bool)

(assert (=> b!1232592 (= e!699111 e!699108)))

(declare-fun res!820944 () Bool)

(assert (=> b!1232592 (=> (not res!820944) (not e!699108))))

(declare-fun e!699106 () Bool)

(assert (=> b!1232592 (= res!820944 (not e!699106))))

(declare-fun res!820943 () Bool)

(assert (=> b!1232592 (=> (not res!820943) (not e!699106))))

(assert (=> b!1232592 (= res!820943 (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)))))

(declare-fun b!1232593 () Bool)

(assert (=> b!1232593 (= e!699106 (contains!7194 acc!823 (select (arr!38359 a!3806) from!3184)))))

(assert (= (and d!134905 (not res!820946)) b!1232592))

(assert (= (and b!1232592 res!820943) b!1232593))

(assert (= (and b!1232592 res!820944) b!1232590))

(assert (= (and b!1232590 c!120683) b!1232591))

(assert (= (and b!1232590 (not c!120683)) b!1232589))

(assert (= (or b!1232591 b!1232589) bm!60917))

(assert (=> b!1232590 m!1136455))

(assert (=> b!1232590 m!1136455))

(assert (=> b!1232590 m!1136471))

(assert (=> bm!60917 m!1136455))

(declare-fun m!1136551 () Bool)

(assert (=> bm!60917 m!1136551))

(assert (=> b!1232592 m!1136455))

(assert (=> b!1232592 m!1136455))

(assert (=> b!1232592 m!1136471))

(assert (=> b!1232593 m!1136455))

(assert (=> b!1232593 m!1136455))

(declare-fun m!1136553 () Bool)

(assert (=> b!1232593 m!1136553))

(assert (=> b!1232473 d!134905))

(declare-fun d!134907 () Bool)

(assert (=> d!134907 (= (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)) (and (not (= (select (arr!38359 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38359 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232479 d!134907))

(declare-fun d!134909 () Bool)

(declare-fun res!820952 () Bool)

(declare-fun e!699117 () Bool)

(assert (=> d!134909 (=> res!820952 e!699117)))

(assert (=> d!134909 (= res!820952 (bvsge from!3184 (size!38895 a!3806)))))

(assert (=> d!134909 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27129) e!699117)))

(declare-fun b!1232598 () Bool)

(declare-fun e!699115 () Bool)

(declare-fun call!60921 () Bool)

(assert (=> b!1232598 (= e!699115 call!60921)))

(declare-fun b!1232599 () Bool)

(declare-fun e!699116 () Bool)

(assert (=> b!1232599 (= e!699116 e!699115)))

(declare-fun c!120684 () Bool)

(assert (=> b!1232599 (= c!120684 (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)))))

(declare-fun bm!60918 () Bool)

(assert (=> bm!60918 (= call!60921 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120684 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) Nil!27129)))))

(declare-fun b!1232600 () Bool)

(assert (=> b!1232600 (= e!699115 call!60921)))

(declare-fun b!1232601 () Bool)

(assert (=> b!1232601 (= e!699117 e!699116)))

(declare-fun res!820951 () Bool)

(assert (=> b!1232601 (=> (not res!820951) (not e!699116))))

(declare-fun e!699114 () Bool)

(assert (=> b!1232601 (= res!820951 (not e!699114))))

(declare-fun res!820950 () Bool)

(assert (=> b!1232601 (=> (not res!820950) (not e!699114))))

(assert (=> b!1232601 (= res!820950 (validKeyInArray!0 (select (arr!38359 a!3806) from!3184)))))

(declare-fun b!1232602 () Bool)

(assert (=> b!1232602 (= e!699114 (contains!7194 Nil!27129 (select (arr!38359 a!3806) from!3184)))))

(assert (= (and d!134909 (not res!820952)) b!1232601))

(assert (= (and b!1232601 res!820950) b!1232602))

(assert (= (and b!1232601 res!820951) b!1232599))

(assert (= (and b!1232599 c!120684) b!1232600))

(assert (= (and b!1232599 (not c!120684)) b!1232598))

(assert (= (or b!1232600 b!1232598) bm!60918))

(assert (=> b!1232599 m!1136455))

(assert (=> b!1232599 m!1136455))

(assert (=> b!1232599 m!1136471))

(assert (=> bm!60918 m!1136455))

(declare-fun m!1136559 () Bool)

(assert (=> bm!60918 m!1136559))

(assert (=> b!1232601 m!1136455))

(assert (=> b!1232601 m!1136455))

(assert (=> b!1232601 m!1136471))

(assert (=> b!1232602 m!1136455))

(assert (=> b!1232602 m!1136455))

(declare-fun m!1136561 () Bool)

(assert (=> b!1232602 m!1136561))

(assert (=> b!1232477 d!134909))

(declare-fun d!134913 () Bool)

(assert (=> d!134913 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27129)))

(declare-fun lt!559535 () Unit!40824)

(declare-fun choose!80 (array!79491 List!27132 List!27132 (_ BitVec 32)) Unit!40824)

(assert (=> d!134913 (= lt!559535 (choose!80 a!3806 acc!823 Nil!27129 from!3184))))

(assert (=> d!134913 (bvslt (size!38895 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134913 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27129 from!3184) lt!559535)))

(declare-fun bs!34637 () Bool)

(assert (= bs!34637 d!134913))

(assert (=> bs!34637 m!1136451))

(declare-fun m!1136573 () Bool)

(assert (=> bs!34637 m!1136573))

(assert (=> b!1232477 d!134913))

(declare-fun d!134919 () Bool)

(declare-fun res!820960 () Bool)

(declare-fun e!699127 () Bool)

(assert (=> d!134919 (=> res!820960 e!699127)))

(assert (=> d!134919 (= res!820960 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38895 a!3806)))))

(assert (=> d!134919 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) e!699127)))

(declare-fun b!1232610 () Bool)

(declare-fun e!699125 () Bool)

(declare-fun call!60923 () Bool)

(assert (=> b!1232610 (= e!699125 call!60923)))

(declare-fun b!1232611 () Bool)

(declare-fun e!699126 () Bool)

(assert (=> b!1232611 (= e!699126 e!699125)))

(declare-fun c!120686 () Bool)

(assert (=> b!1232611 (= c!120686 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60920 () Bool)

(assert (=> bm!60920 (= call!60923 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120686 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823))))))

(declare-fun b!1232612 () Bool)

(assert (=> b!1232612 (= e!699125 call!60923)))

(declare-fun b!1232613 () Bool)

(assert (=> b!1232613 (= e!699127 e!699126)))

(declare-fun res!820959 () Bool)

(assert (=> b!1232613 (=> (not res!820959) (not e!699126))))

(declare-fun e!699124 () Bool)

(assert (=> b!1232613 (= res!820959 (not e!699124))))

(declare-fun res!820958 () Bool)

(assert (=> b!1232613 (=> (not res!820958) (not e!699124))))

(assert (=> b!1232613 (= res!820958 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232614 () Bool)

(assert (=> b!1232614 (= e!699124 (contains!7194 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134919 (not res!820960)) b!1232613))

(assert (= (and b!1232613 res!820958) b!1232614))

(assert (= (and b!1232613 res!820959) b!1232611))

(assert (= (and b!1232611 c!120686) b!1232612))

(assert (= (and b!1232611 (not c!120686)) b!1232610))

(assert (= (or b!1232612 b!1232610) bm!60920))

(assert (=> b!1232611 m!1136483))

(assert (=> b!1232611 m!1136483))

(assert (=> b!1232611 m!1136501))

(assert (=> bm!60920 m!1136483))

(declare-fun m!1136577 () Bool)

(assert (=> bm!60920 m!1136577))

(assert (=> b!1232613 m!1136483))

(assert (=> b!1232613 m!1136483))

(assert (=> b!1232613 m!1136501))

(assert (=> b!1232614 m!1136483))

(assert (=> b!1232614 m!1136483))

(declare-fun m!1136579 () Bool)

(assert (=> b!1232614 m!1136579))

(assert (=> b!1232477 d!134919))

(declare-fun d!134923 () Bool)

(declare-fun lt!559537 () Bool)

(assert (=> d!134923 (= lt!559537 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!570 acc!823)))))

(declare-fun e!699132 () Bool)

(assert (=> d!134923 (= lt!559537 e!699132)))

(declare-fun res!820965 () Bool)

(assert (=> d!134923 (=> (not res!820965) (not e!699132))))

(assert (=> d!134923 (= res!820965 (is-Cons!27128 acc!823))))

(assert (=> d!134923 (= (contains!7194 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559537)))

(declare-fun b!1232620 () Bool)

(declare-fun e!699133 () Bool)

(assert (=> b!1232620 (= e!699132 e!699133)))

(declare-fun res!820964 () Bool)

(assert (=> b!1232620 (=> res!820964 e!699133)))

(assert (=> b!1232620 (= res!820964 (= (h!28337 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232621 () Bool)

(assert (=> b!1232621 (= e!699133 (contains!7194 (t!40595 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134923 res!820965) b!1232620))

(assert (= (and b!1232620 (not res!820964)) b!1232621))

(assert (=> d!134923 m!1136519))

(declare-fun m!1136581 () Bool)

(assert (=> d!134923 m!1136581))

(declare-fun m!1136583 () Bool)

(assert (=> b!1232621 m!1136583))

(assert (=> b!1232472 d!134923))

(push 1)

(assert (not b!1232592))

(assert (not bm!60913))

(assert (not b!1232580))

(assert (not b!1232611))

(assert (not b!1232590))

(assert (not b!1232614))

(assert (not d!134881))

(assert (not b!1232542))

(assert (not b!1232621))

(assert (not d!134923))

(assert (not b!1232581))

(assert (not b!1232543))

(assert (not d!134913))

(assert (not b!1232613))

(assert (not b!1232602))

(assert (not bm!60920))

(assert (not b!1232582))

(assert (not b!1232583))

(assert (not b!1232593))

(assert (not bm!60917))

(assert (not b!1232601))

(assert (not b!1232568))

(assert (not b!1232540))

(assert (not b!1232599))

(assert (not b!1232509))

(assert (not bm!60918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135001 () Bool)

(declare-fun res!821038 () Bool)

(declare-fun e!699221 () Bool)

(assert (=> d!135001 (=> res!821038 e!699221)))

(assert (=> d!135001 (= res!821038 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38895 a!3806)))))

(assert (=> d!135001 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120686 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823))) e!699221)))

(declare-fun b!1232720 () Bool)

(declare-fun e!699219 () Bool)

(declare-fun call!60933 () Bool)

(assert (=> b!1232720 (= e!699219 call!60933)))

(declare-fun b!1232721 () Bool)

(declare-fun e!699220 () Bool)

(assert (=> b!1232721 (= e!699220 e!699219)))

(declare-fun c!120702 () Bool)

(assert (=> b!1232721 (= c!120702 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60930 () Bool)

(assert (=> bm!60930 (= call!60933 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120702 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120686 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823))) (ite c!120686 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)))))))

(declare-fun b!1232722 () Bool)

(assert (=> b!1232722 (= e!699219 call!60933)))

(declare-fun b!1232723 () Bool)

(assert (=> b!1232723 (= e!699221 e!699220)))

(declare-fun res!821037 () Bool)

(assert (=> b!1232723 (=> (not res!821037) (not e!699220))))

(declare-fun e!699218 () Bool)

(assert (=> b!1232723 (= res!821037 (not e!699218))))

(declare-fun res!821036 () Bool)

(assert (=> b!1232723 (=> (not res!821036) (not e!699218))))

(assert (=> b!1232723 (= res!821036 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232724 () Bool)

(assert (=> b!1232724 (= e!699218 (contains!7194 (ite c!120686 (Cons!27128 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135001 (not res!821038)) b!1232723))

(assert (= (and b!1232723 res!821036) b!1232724))

(assert (= (and b!1232723 res!821037) b!1232721))

(assert (= (and b!1232721 c!120702) b!1232722))

(assert (= (and b!1232721 (not c!120702)) b!1232720))

(assert (= (or b!1232722 b!1232720) bm!60930))

(declare-fun m!1136737 () Bool)

(assert (=> b!1232721 m!1136737))

(assert (=> b!1232721 m!1136737))

(declare-fun m!1136739 () Bool)

(assert (=> b!1232721 m!1136739))

(assert (=> bm!60930 m!1136737))

(declare-fun m!1136741 () Bool)

(assert (=> bm!60930 m!1136741))

(assert (=> b!1232723 m!1136737))

(assert (=> b!1232723 m!1136737))

(assert (=> b!1232723 m!1136739))

(assert (=> b!1232724 m!1136737))

(assert (=> b!1232724 m!1136737))

(declare-fun m!1136745 () Bool)

(assert (=> b!1232724 m!1136745))

(assert (=> bm!60920 d!135001))

(declare-fun d!135003 () Bool)

(assert (=> d!135003 (= (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232611 d!135003))

(declare-fun d!135007 () Bool)

(declare-fun lt!559555 () Bool)

(assert (=> d!135007 (= lt!559555 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!570 (t!40595 acc!823))))))

(declare-fun e!699223 () Bool)

(assert (=> d!135007 (= lt!559555 e!699223)))

(declare-fun res!821041 () Bool)

(assert (=> d!135007 (=> (not res!821041) (not e!699223))))

(assert (=> d!135007 (= res!821041 (is-Cons!27128 (t!40595 acc!823)))))

(assert (=> d!135007 (= (contains!7194 (t!40595 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559555)))

(declare-fun b!1232726 () Bool)

(declare-fun e!699225 () Bool)

(assert (=> b!1232726 (= e!699223 e!699225)))

(declare-fun res!821039 () Bool)

(assert (=> b!1232726 (=> res!821039 e!699225)))

(assert (=> b!1232726 (= res!821039 (= (h!28337 (t!40595 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232728 () Bool)

(assert (=> b!1232728 (= e!699225 (contains!7194 (t!40595 (t!40595 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135007 res!821041) b!1232726))

(assert (= (and b!1232726 (not res!821039)) b!1232728))

(declare-fun m!1136747 () Bool)

(assert (=> d!135007 m!1136747))

(declare-fun m!1136749 () Bool)

(assert (=> d!135007 m!1136749))

(declare-fun m!1136751 () Bool)

(assert (=> b!1232728 m!1136751))

(assert (=> b!1232568 d!135007))

(assert (=> b!1232599 d!134907))

(declare-fun d!135009 () Bool)

(declare-fun res!821043 () Bool)

(declare-fun e!699226 () Bool)

(assert (=> d!135009 (=> res!821043 e!699226)))

(assert (=> d!135009 (= res!821043 (= (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k!2913))))

(assert (=> d!135009 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!699226)))

(declare-fun b!1232729 () Bool)

(declare-fun e!699227 () Bool)

(assert (=> b!1232729 (= e!699226 e!699227)))

(declare-fun res!821044 () Bool)

(assert (=> b!1232729 (=> (not res!821044) (not e!699227))))

(assert (=> b!1232729 (= res!821044 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38895 a!3806)))))

(declare-fun b!1232730 () Bool)

(assert (=> b!1232730 (= e!699227 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!135009 (not res!821043)) b!1232729))

(assert (= (and b!1232729 res!821044) b!1232730))

(assert (=> d!135009 m!1136737))

(declare-fun m!1136757 () Bool)

(assert (=> b!1232730 m!1136757))

(assert (=> b!1232509 d!135009))

(declare-fun d!135013 () Bool)

(declare-fun c!120706 () Bool)

(assert (=> d!135013 (= c!120706 (is-Nil!27129 acc!823))))

(declare-fun e!699234 () (Set (_ BitVec 64)))

(assert (=> d!135013 (= (content!570 acc!823) e!699234)))

(declare-fun b!1232740 () Bool)

(assert (=> b!1232740 (= e!699234 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!1232741 () Bool)

(assert (=> b!1232741 (= e!699234 (union (insert (h!28337 acc!823) (as emptyset (Set (_ BitVec 64)))) (content!570 (t!40595 acc!823))))))

(assert (= (and d!135013 c!120706) b!1232740))

(assert (= (and d!135013 (not c!120706)) b!1232741))

(declare-fun m!1136763 () Bool)

(assert (=> b!1232741 m!1136763))

(assert (=> b!1232741 m!1136747))

(assert (=> d!134923 d!135013))

(declare-fun d!135017 () Bool)

(declare-fun res!821052 () Bool)

(declare-fun e!699240 () Bool)

(assert (=> d!135017 (=> res!821052 e!699240)))

(assert (=> d!135017 (= res!821052 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38895 a!3806)))))

(assert (=> d!135017 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120684 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) Nil!27129)) e!699240)))

(declare-fun b!1232744 () Bool)

(declare-fun e!699238 () Bool)

(declare-fun call!60935 () Bool)

(assert (=> b!1232744 (= e!699238 call!60935)))

(declare-fun b!1232745 () Bool)

(declare-fun e!699239 () Bool)

(assert (=> b!1232745 (= e!699239 e!699238)))

(declare-fun c!120707 () Bool)

(assert (=> b!1232745 (= c!120707 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60932 () Bool)

(assert (=> bm!60932 (= call!60935 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120707 (Cons!27128 (select (arr!38359 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120684 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) Nil!27129)) (ite c!120684 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) Nil!27129))))))

(declare-fun b!1232746 () Bool)

(assert (=> b!1232746 (= e!699238 call!60935)))

(declare-fun b!1232747 () Bool)

(assert (=> b!1232747 (= e!699240 e!699239)))

(declare-fun res!821051 () Bool)

(assert (=> b!1232747 (=> (not res!821051) (not e!699239))))

(declare-fun e!699237 () Bool)

(assert (=> b!1232747 (= res!821051 (not e!699237))))

(declare-fun res!821050 () Bool)

(assert (=> b!1232747 (=> (not res!821050) (not e!699237))))

(assert (=> b!1232747 (= res!821050 (validKeyInArray!0 (select (arr!38359 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232748 () Bool)

(assert (=> b!1232748 (= e!699237 (contains!7194 (ite c!120684 (Cons!27128 (select (arr!38359 a!3806) from!3184) Nil!27129) Nil!27129) (select (arr!38359 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135017 (not res!821052)) b!1232747))

(assert (= (and b!1232747 res!821050) b!1232748))

(assert (= (and b!1232747 res!821051) b!1232745))

(assert (= (and b!1232745 c!120707) b!1232746))

(assert (= (and b!1232745 (not c!120707)) b!1232744))

(assert (= (or b!1232746 b!1232744) bm!60932))

(declare-fun m!1136771 () Bool)

(assert (=> b!1232745 m!1136771))

(assert (=> b!1232745 m!1136771))

(declare-fun m!1136773 () Bool)

(assert (=> b!1232745 m!1136773))

(assert (=> bm!60932 m!1136771))

(declare-fun m!1136775 () Bool)

(assert (=> bm!60932 m!1136775))

(assert (=> b!1232747 m!1136771))

(assert (=> b!1232747 m!1136771))

(assert (=> b!1232747 m!1136773))

(assert (=> b!1232748 m!1136771))

(assert (=> b!1232748 m!1136771))

(declare-fun m!1136777 () Bool)

(assert (=> b!1232748 m!1136777))

(assert (=> bm!60918 d!135017))

(assert (=> b!1232613 d!135003))

(declare-fun lt!559558 () Bool)

(declare-fun d!135021 () Bool)

(assert (=> d!135021 (= lt!559558 (member (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (content!570 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823))))))

(declare-fun e!699243 () Bool)

(assert (=> d!135021 (= lt!559558 e!699243)))

(declare-fun res!821056 () Bool)

(assert (=> d!135021 (=> (not res!821056) (not e!699243))))

(assert (=> d!135021 (= res!821056 (is-Cons!27128 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)))))

(assert (=> d!135021 (= (contains!7194 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559558)))

(declare-fun b!1232751 () Bool)

(declare-fun e!699244 () Bool)

(assert (=> b!1232751 (= e!699243 e!699244)))

(declare-fun res!821055 () Bool)

(assert (=> b!1232751 (=> res!821055 e!699244)))

(assert (=> b!1232751 (= res!821055 (= (h!28337 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232752 () Bool)

(assert (=> b!1232752 (= e!699244 (contains!7194 (t!40595 (Cons!27128 (select (arr!38359 a!3806) from!3184) acc!823)) (select (arr!38359 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135021 res!821056) b!1232751))

(assert (= (and b!1232751 (not res!821055)) b!1232752))

(declare-fun m!1136783 () Bool)

(assert (=> d!135021 m!1136783))

(assert (=> d!135021 m!1136483))

(declare-fun m!1136785 () Bool)

(assert (=> d!135021 m!1136785))

(assert (=> b!1232752 m!1136483))

(declare-fun m!1136787 () Bool)

(assert (=> b!1232752 m!1136787))

(assert (=> b!1232614 d!135021))

(declare-fun d!135025 () Bool)

(declare-fun lt!559560 () Bool)

(assert (=> d!135025 (= lt!559560 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!570 (t!40595 acc!823))))))

(declare-fun e!699247 () Bool)

(assert (=> d!135025 (= lt!559560 e!699247)))

(declare-fun res!821060 () Bool)

(assert (=> d!135025 (=> (not res!821060) (not e!699247))))

(assert (=> d!135025 (= res!821060 (is-Cons!27128 (t!40595 acc!823)))))

(assert (=> d!135025 (= (contains!7194 (t!40595 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559560)))

(declare-fun b!1232755 () Bool)

(declare-fun e!699248 () Bool)

(assert (=> b!1232755 (= e!699247 e!699248)))

(declare-fun res!821059 () Bool)

(assert (=> b!1232755 (=> res!821059 e!699248)))

(assert (=> b!1232755 (= res!821059 (= (h!28337 (t!40595 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232756 () Bool)

(assert (=> b!1232756 (= e!699248 (contains!7194 (t!40595 (t!40595 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

