; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61704 () Bool)

(assert start!61704)

(declare-fun b!690422 () Bool)

(declare-fun res!454834 () Bool)

(declare-fun e!393107 () Bool)

(assert (=> b!690422 (=> (not res!454834) (not e!393107))))

(declare-datatypes ((array!39758 0))(
  ( (array!39759 (arr!19049 (Array (_ BitVec 32) (_ BitVec 64))) (size!19434 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39758)

(declare-datatypes ((List!13090 0))(
  ( (Nil!13087) (Cons!13086 (h!14131 (_ BitVec 64)) (t!19357 List!13090)) )
))
(declare-fun arrayNoDuplicates!0 (array!39758 (_ BitVec 32) List!13090) Bool)

(assert (=> b!690422 (= res!454834 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13087))))

(declare-fun b!690423 () Bool)

(declare-fun res!454836 () Bool)

(assert (=> b!690423 (=> (not res!454836) (not e!393107))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690423 (= res!454836 (validKeyInArray!0 k!2843))))

(declare-fun b!690424 () Bool)

(declare-fun res!454832 () Bool)

(assert (=> b!690424 (=> (not res!454832) (not e!393107))))

(declare-fun arrayContainsKey!0 (array!39758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690424 (= res!454832 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690425 () Bool)

(declare-fun res!454840 () Bool)

(assert (=> b!690425 (=> (not res!454840) (not e!393107))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!690425 (= res!454840 (= (select (arr!19049 a!3626) from!3004) k!2843))))

(declare-fun b!690426 () Bool)

(declare-fun e!393108 () Bool)

(declare-fun acc!681 () List!13090)

(declare-fun contains!3667 (List!13090 (_ BitVec 64)) Bool)

(assert (=> b!690426 (= e!393108 (contains!3667 acc!681 k!2843))))

(declare-fun b!690427 () Bool)

(declare-fun e!393110 () Bool)

(declare-fun e!393111 () Bool)

(assert (=> b!690427 (= e!393110 e!393111)))

(declare-fun res!454835 () Bool)

(assert (=> b!690427 (=> (not res!454835) (not e!393111))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690427 (= res!454835 (bvsle from!3004 i!1382))))

(declare-fun b!690429 () Bool)

(declare-fun res!454833 () Bool)

(assert (=> b!690429 (=> (not res!454833) (not e!393107))))

(assert (=> b!690429 (= res!454833 (not (contains!3667 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690430 () Bool)

(declare-fun res!454831 () Bool)

(assert (=> b!690430 (=> (not res!454831) (not e!393107))))

(assert (=> b!690430 (= res!454831 (validKeyInArray!0 (select (arr!19049 a!3626) from!3004)))))

(declare-fun b!690431 () Bool)

(declare-fun res!454827 () Bool)

(assert (=> b!690431 (=> (not res!454827) (not e!393107))))

(assert (=> b!690431 (= res!454827 (not (contains!3667 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690432 () Bool)

(declare-fun res!454838 () Bool)

(assert (=> b!690432 (=> (not res!454838) (not e!393107))))

(assert (=> b!690432 (= res!454838 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19434 a!3626))))))

(declare-fun b!690433 () Bool)

(assert (=> b!690433 (= e!393107 (not (arrayContainsKey!0 a!3626 k!2843 from!3004)))))

(declare-fun b!690434 () Bool)

(assert (=> b!690434 (= e!393111 (not (contains!3667 acc!681 k!2843)))))

(declare-fun b!690435 () Bool)

(declare-fun res!454839 () Bool)

(assert (=> b!690435 (=> (not res!454839) (not e!393107))))

(declare-fun noDuplicate!914 (List!13090) Bool)

(assert (=> b!690435 (= res!454839 (noDuplicate!914 acc!681))))

(declare-fun res!454841 () Bool)

(assert (=> start!61704 (=> (not res!454841) (not e!393107))))

(assert (=> start!61704 (= res!454841 (and (bvslt (size!19434 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19434 a!3626))))))

(assert (=> start!61704 e!393107))

(assert (=> start!61704 true))

(declare-fun array_inv!14845 (array!39758) Bool)

(assert (=> start!61704 (array_inv!14845 a!3626)))

(declare-fun b!690428 () Bool)

(declare-fun res!454828 () Bool)

(assert (=> b!690428 (=> (not res!454828) (not e!393107))))

(assert (=> b!690428 (= res!454828 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690436 () Bool)

(declare-fun res!454826 () Bool)

(assert (=> b!690436 (=> (not res!454826) (not e!393107))))

(assert (=> b!690436 (= res!454826 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19434 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690437 () Bool)

(declare-fun res!454830 () Bool)

(assert (=> b!690437 (=> (not res!454830) (not e!393107))))

(assert (=> b!690437 (= res!454830 e!393110)))

(declare-fun res!454829 () Bool)

(assert (=> b!690437 (=> res!454829 e!393110)))

(assert (=> b!690437 (= res!454829 e!393108)))

(declare-fun res!454837 () Bool)

(assert (=> b!690437 (=> (not res!454837) (not e!393108))))

(assert (=> b!690437 (= res!454837 (bvsgt from!3004 i!1382))))

(assert (= (and start!61704 res!454841) b!690435))

(assert (= (and b!690435 res!454839) b!690431))

(assert (= (and b!690431 res!454827) b!690429))

(assert (= (and b!690429 res!454833) b!690437))

(assert (= (and b!690437 res!454837) b!690426))

(assert (= (and b!690437 (not res!454829)) b!690427))

(assert (= (and b!690427 res!454835) b!690434))

(assert (= (and b!690437 res!454830) b!690422))

(assert (= (and b!690422 res!454834) b!690428))

(assert (= (and b!690428 res!454828) b!690432))

(assert (= (and b!690432 res!454838) b!690423))

(assert (= (and b!690423 res!454836) b!690424))

(assert (= (and b!690424 res!454832) b!690436))

(assert (= (and b!690436 res!454826) b!690430))

(assert (= (and b!690430 res!454831) b!690425))

(assert (= (and b!690425 res!454840) b!690433))

(declare-fun m!653915 () Bool)

(assert (=> start!61704 m!653915))

(declare-fun m!653917 () Bool)

(assert (=> b!690433 m!653917))

(declare-fun m!653919 () Bool)

(assert (=> b!690423 m!653919))

(declare-fun m!653921 () Bool)

(assert (=> b!690435 m!653921))

(declare-fun m!653923 () Bool)

(assert (=> b!690422 m!653923))

(declare-fun m!653925 () Bool)

(assert (=> b!690428 m!653925))

(declare-fun m!653927 () Bool)

(assert (=> b!690434 m!653927))

(assert (=> b!690426 m!653927))

(declare-fun m!653929 () Bool)

(assert (=> b!690425 m!653929))

(declare-fun m!653931 () Bool)

(assert (=> b!690424 m!653931))

(assert (=> b!690430 m!653929))

(assert (=> b!690430 m!653929))

(declare-fun m!653933 () Bool)

(assert (=> b!690430 m!653933))

(declare-fun m!653935 () Bool)

(assert (=> b!690429 m!653935))

(declare-fun m!653937 () Bool)

(assert (=> b!690431 m!653937))

(push 1)

(assert (not b!690431))

(assert (not b!690428))

(assert (not b!690424))

(assert (not b!690433))

(assert (not b!690429))

(assert (not b!690434))

(assert (not start!61704))

(assert (not b!690430))

(assert (not b!690426))

(assert (not b!690435))

(assert (not b!690422))

(assert (not b!690423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95437 () Bool)

(declare-fun lt!316426 () Bool)

(declare-fun content!306 (List!13090) (Set (_ BitVec 64)))

(assert (=> d!95437 (= lt!316426 (member k!2843 (content!306 acc!681)))))

(declare-fun e!393135 () Bool)

(assert (=> d!95437 (= lt!316426 e!393135)))

(declare-fun res!454862 () Bool)

(assert (=> d!95437 (=> (not res!454862) (not e!393135))))

(assert (=> d!95437 (= res!454862 (is-Cons!13086 acc!681))))

(assert (=> d!95437 (= (contains!3667 acc!681 k!2843) lt!316426)))

(declare-fun b!690463 () Bool)

(declare-fun e!393134 () Bool)

(assert (=> b!690463 (= e!393135 e!393134)))

(declare-fun res!454861 () Bool)

(assert (=> b!690463 (=> res!454861 e!393134)))

(assert (=> b!690463 (= res!454861 (= (h!14131 acc!681) k!2843))))

(declare-fun b!690464 () Bool)

(assert (=> b!690464 (= e!393134 (contains!3667 (t!19357 acc!681) k!2843))))

(assert (= (and d!95437 res!454862) b!690463))

(assert (= (and b!690463 (not res!454861)) b!690464))

(declare-fun m!653947 () Bool)

(assert (=> d!95437 m!653947))

(declare-fun m!653949 () Bool)

(assert (=> d!95437 m!653949))

(declare-fun m!653951 () Bool)

(assert (=> b!690464 m!653951))

(assert (=> b!690426 d!95437))

(declare-fun d!95445 () Bool)

(declare-fun res!454880 () Bool)

(declare-fun e!393154 () Bool)

(assert (=> d!95445 (=> res!454880 e!393154)))

(assert (=> d!95445 (= res!454880 (= (select (arr!19049 a!3626) from!3004) k!2843))))

(assert (=> d!95445 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!393154)))

(declare-fun b!690484 () Bool)

(declare-fun e!393155 () Bool)

(assert (=> b!690484 (= e!393154 e!393155)))

(declare-fun res!454881 () Bool)

(assert (=> b!690484 (=> (not res!454881) (not e!393155))))

(assert (=> b!690484 (= res!454881 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19434 a!3626)))))

(declare-fun b!690485 () Bool)

(assert (=> b!690485 (= e!393155 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95445 (not res!454880)) b!690484))

(assert (= (and b!690484 res!454881) b!690485))

(assert (=> d!95445 m!653929))

(declare-fun m!653967 () Bool)

(assert (=> b!690485 m!653967))

(assert (=> b!690433 d!95445))

(declare-fun b!690520 () Bool)

(declare-fun e!393188 () Bool)

(declare-fun call!34223 () Bool)

(assert (=> b!690520 (= e!393188 call!34223)))

(declare-fun b!690521 () Bool)

(assert (=> b!690521 (= e!393188 call!34223)))

(declare-fun b!690522 () Bool)

(declare-fun e!393189 () Bool)

(declare-fun e!393186 () Bool)

(assert (=> b!690522 (= e!393189 e!393186)))

(declare-fun res!454908 () Bool)

(assert (=> b!690522 (=> (not res!454908) (not e!393186))))

(declare-fun e!393187 () Bool)

(assert (=> b!690522 (= res!454908 (not e!393187))))

(declare-fun res!454910 () Bool)

(assert (=> b!690522 (=> (not res!454910) (not e!393187))))

(assert (=> b!690522 (= res!454910 (validKeyInArray!0 (select (arr!19049 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690523 () Bool)

(assert (=> b!690523 (= e!393186 e!393188)))

(declare-fun c!78173 () Bool)

(assert (=> b!690523 (= c!78173 (validKeyInArray!0 (select (arr!19049 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34220 () Bool)

(assert (=> bm!34220 (= call!34223 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78173 (Cons!13086 (select (arr!19049 a!3626) #b00000000000000000000000000000000) Nil!13087) Nil!13087)))))

(declare-fun d!95451 () Bool)

(declare-fun res!454909 () Bool)

(assert (=> d!95451 (=> res!454909 e!393189)))

(assert (=> d!95451 (= res!454909 (bvsge #b00000000000000000000000000000000 (size!19434 a!3626)))))

(assert (=> d!95451 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13087) e!393189)))

(declare-fun b!690524 () Bool)

(assert (=> b!690524 (= e!393187 (contains!3667 Nil!13087 (select (arr!19049 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95451 (not res!454909)) b!690522))

(assert (= (and b!690522 res!454910) b!690524))

(assert (= (and b!690522 res!454908) b!690523))

(assert (= (and b!690523 c!78173) b!690520))

(assert (= (and b!690523 (not c!78173)) b!690521))

(assert (= (or b!690520 b!690521) bm!34220))

(declare-fun m!653981 () Bool)

(assert (=> b!690522 m!653981))

(assert (=> b!690522 m!653981))

(declare-fun m!653983 () Bool)

(assert (=> b!690522 m!653983))

(assert (=> b!690523 m!653981))

(assert (=> b!690523 m!653981))

(assert (=> b!690523 m!653983))

(assert (=> bm!34220 m!653981))

(declare-fun m!653987 () Bool)

(assert (=> bm!34220 m!653987))

(assert (=> b!690524 m!653981))

(assert (=> b!690524 m!653981))

(declare-fun m!653991 () Bool)

(assert (=> b!690524 m!653991))

(assert (=> b!690422 d!95451))

(declare-fun d!95467 () Bool)

(assert (=> d!95467 (= (array_inv!14845 a!3626) (bvsge (size!19434 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61704 d!95467))

(declare-fun d!95471 () Bool)

(assert (=> d!95471 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690423 d!95471))

(assert (=> b!690434 d!95437))

(declare-fun d!95477 () Bool)

(declare-fun res!454929 () Bool)

(declare-fun e!393210 () Bool)

(assert (=> d!95477 (=> res!454929 e!393210)))

(assert (=> d!95477 (= res!454929 (is-Nil!13087 acc!681))))

(assert (=> d!95477 (= (noDuplicate!914 acc!681) e!393210)))

(declare-fun b!690547 () Bool)

(declare-fun e!393211 () Bool)

(assert (=> b!690547 (= e!393210 e!393211)))

(declare-fun res!454930 () Bool)

(assert (=> b!690547 (=> (not res!454930) (not e!393211))))

(assert (=> b!690547 (= res!454930 (not (contains!3667 (t!19357 acc!681) (h!14131 acc!681))))))

(declare-fun b!690548 () Bool)

(assert (=> b!690548 (= e!393211 (noDuplicate!914 (t!19357 acc!681)))))

(assert (= (and d!95477 (not res!454929)) b!690547))

(assert (= (and b!690547 res!454930) b!690548))

(declare-fun m!654011 () Bool)

(assert (=> b!690547 m!654011))

(declare-fun m!654013 () Bool)

(assert (=> b!690548 m!654013))

(assert (=> b!690435 d!95477))

(declare-fun d!95485 () Bool)

(declare-fun res!454933 () Bool)

(declare-fun e!393214 () Bool)

(assert (=> d!95485 (=> res!454933 e!393214)))

(assert (=> d!95485 (= res!454933 (= (select (arr!19049 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95485 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!393214)))

(declare-fun b!690551 () Bool)

(declare-fun e!393215 () Bool)

(assert (=> b!690551 (= e!393214 e!393215)))

(declare-fun res!454934 () Bool)

(assert (=> b!690551 (=> (not res!454934) (not e!393215))))

(assert (=> b!690551 (= res!454934 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19434 a!3626)))))

(declare-fun b!690552 () Bool)

(assert (=> b!690552 (= e!393215 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95485 (not res!454933)) b!690551))

(assert (= (and b!690551 res!454934) b!690552))

(assert (=> d!95485 m!653981))

(declare-fun m!654019 () Bool)

(assert (=> b!690552 m!654019))

(assert (=> b!690424 d!95485))

(declare-fun d!95489 () Bool)

(assert (=> d!95489 (= (validKeyInArray!0 (select (arr!19049 a!3626) from!3004)) (and (not (= (select (arr!19049 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19049 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690430 d!95489))

(declare-fun d!95491 () Bool)

(declare-fun lt!316437 () Bool)

(assert (=> d!95491 (= lt!316437 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!306 acc!681)))))

(declare-fun e!393219 () Bool)

(assert (=> d!95491 (= lt!316437 e!393219)))

(declare-fun res!454938 () Bool)

(assert (=> d!95491 (=> (not res!454938) (not e!393219))))

(assert (=> d!95491 (= res!454938 (is-Cons!13086 acc!681))))

(assert (=> d!95491 (= (contains!3667 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316437)))

(declare-fun b!690555 () Bool)

(declare-fun e!393218 () Bool)

(assert (=> b!690555 (= e!393219 e!393218)))

(declare-fun res!454937 () Bool)

(assert (=> b!690555 (=> res!454937 e!393218)))

(assert (=> b!690555 (= res!454937 (= (h!14131 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690556 () Bool)

(assert (=> b!690556 (= e!393218 (contains!3667 (t!19357 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95491 res!454938) b!690555))

(assert (= (and b!690555 (not res!454937)) b!690556))

(assert (=> d!95491 m!653947))

(declare-fun m!654025 () Bool)

(assert (=> d!95491 m!654025))

(declare-fun m!654027 () Bool)

(assert (=> b!690556 m!654027))

(assert (=> b!690431 d!95491))

(declare-fun b!690557 () Bool)

(declare-fun e!393222 () Bool)

(declare-fun call!34226 () Bool)

