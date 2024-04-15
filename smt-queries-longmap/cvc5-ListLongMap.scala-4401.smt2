; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60498 () Bool)

(assert start!60498)

(declare-fun b!679994 () Bool)

(declare-fun e!387286 () Bool)

(declare-datatypes ((List!13014 0))(
  ( (Nil!13011) (Cons!13010 (h!14055 (_ BitVec 64)) (t!19233 List!13014)) )
))
(declare-fun acc!681 () List!13014)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3536 (List!13014 (_ BitVec 64)) Bool)

(assert (=> b!679994 (= e!387286 (not (contains!3536 acc!681 k!2843)))))

(declare-fun b!679996 () Bool)

(declare-fun e!387290 () Bool)

(declare-fun e!387288 () Bool)

(assert (=> b!679996 (= e!387290 (not e!387288))))

(declare-fun res!446435 () Bool)

(assert (=> b!679996 (=> res!446435 e!387288)))

(declare-datatypes ((array!39490 0))(
  ( (array!39491 (arr!18934 (Array (_ BitVec 32) (_ BitVec 64))) (size!19299 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39490)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679996 (= res!446435 (not (validKeyInArray!0 (select (arr!18934 a!3626) from!3004))))))

(declare-datatypes ((Unit!23836 0))(
  ( (Unit!23837) )
))
(declare-fun lt!312802 () Unit!23836)

(declare-fun e!387289 () Unit!23836)

(assert (=> b!679996 (= lt!312802 e!387289)))

(declare-fun c!77151 () Bool)

(declare-fun arrayContainsKey!0 (array!39490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679996 (= c!77151 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679996 (arrayContainsKey!0 (array!39491 (store (arr!18934 a!3626) i!1382 k!2843) (size!19299 a!3626)) k!2843 from!3004)))

(declare-fun b!679997 () Bool)

(declare-fun res!446427 () Bool)

(assert (=> b!679997 (=> (not res!446427) (not e!387290))))

(assert (=> b!679997 (= res!446427 (validKeyInArray!0 k!2843))))

(declare-fun b!679998 () Bool)

(declare-fun res!446437 () Bool)

(assert (=> b!679998 (=> (not res!446437) (not e!387290))))

(declare-fun arrayNoDuplicates!0 (array!39490 (_ BitVec 32) List!13014) Bool)

(assert (=> b!679998 (= res!446437 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13011))))

(declare-fun b!679999 () Bool)

(declare-fun res!446426 () Bool)

(assert (=> b!679999 (=> (not res!446426) (not e!387290))))

(assert (=> b!679999 (= res!446426 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680000 () Bool)

(declare-fun res!446436 () Bool)

(assert (=> b!680000 (=> (not res!446436) (not e!387290))))

(assert (=> b!680000 (= res!446436 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19299 a!3626))))))

(declare-fun b!680001 () Bool)

(declare-fun res!446434 () Bool)

(assert (=> b!680001 (=> (not res!446434) (not e!387290))))

(assert (=> b!680001 (= res!446434 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19299 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680002 () Bool)

(declare-fun Unit!23838 () Unit!23836)

(assert (=> b!680002 (= e!387289 Unit!23838)))

(declare-fun lt!312804 () Unit!23836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39490 (_ BitVec 64) (_ BitVec 32)) Unit!23836)

(assert (=> b!680002 (= lt!312804 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680002 false))

(declare-fun b!680003 () Bool)

(declare-fun res!446429 () Bool)

(assert (=> b!680003 (=> (not res!446429) (not e!387290))))

(assert (=> b!680003 (= res!446429 (not (contains!3536 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680004 () Bool)

(declare-fun res!446430 () Bool)

(assert (=> b!680004 (=> (not res!446430) (not e!387290))))

(declare-fun e!387284 () Bool)

(assert (=> b!680004 (= res!446430 e!387284)))

(declare-fun res!446439 () Bool)

(assert (=> b!680004 (=> res!446439 e!387284)))

(declare-fun e!387285 () Bool)

(assert (=> b!680004 (= res!446439 e!387285)))

(declare-fun res!446428 () Bool)

(assert (=> b!680004 (=> (not res!446428) (not e!387285))))

(assert (=> b!680004 (= res!446428 (bvsgt from!3004 i!1382))))

(declare-fun b!680005 () Bool)

(declare-fun Unit!23839 () Unit!23836)

(assert (=> b!680005 (= e!387289 Unit!23839)))

(declare-fun b!680006 () Bool)

(assert (=> b!680006 (= e!387288 true)))

(declare-fun subseq!139 (List!13014 List!13014) Bool)

(assert (=> b!680006 (subseq!139 acc!681 acc!681)))

(declare-fun lt!312803 () Unit!23836)

(declare-fun lemmaListSubSeqRefl!0 (List!13014) Unit!23836)

(assert (=> b!680006 (= lt!312803 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680007 () Bool)

(assert (=> b!680007 (= e!387284 e!387286)))

(declare-fun res!446431 () Bool)

(assert (=> b!680007 (=> (not res!446431) (not e!387286))))

(assert (=> b!680007 (= res!446431 (bvsle from!3004 i!1382))))

(declare-fun b!680008 () Bool)

(assert (=> b!680008 (= e!387285 (contains!3536 acc!681 k!2843))))

(declare-fun res!446438 () Bool)

(assert (=> start!60498 (=> (not res!446438) (not e!387290))))

(assert (=> start!60498 (= res!446438 (and (bvslt (size!19299 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19299 a!3626))))))

(assert (=> start!60498 e!387290))

(assert (=> start!60498 true))

(declare-fun array_inv!14817 (array!39490) Bool)

(assert (=> start!60498 (array_inv!14817 a!3626)))

(declare-fun b!679995 () Bool)

(declare-fun res!446432 () Bool)

(assert (=> b!679995 (=> (not res!446432) (not e!387290))))

(assert (=> b!679995 (= res!446432 (not (contains!3536 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680009 () Bool)

(declare-fun res!446433 () Bool)

(assert (=> b!680009 (=> (not res!446433) (not e!387290))))

(assert (=> b!680009 (= res!446433 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680010 () Bool)

(declare-fun res!446440 () Bool)

(assert (=> b!680010 (=> (not res!446440) (not e!387290))))

(declare-fun noDuplicate!805 (List!13014) Bool)

(assert (=> b!680010 (= res!446440 (noDuplicate!805 acc!681))))

(assert (= (and start!60498 res!446438) b!680010))

(assert (= (and b!680010 res!446440) b!679995))

(assert (= (and b!679995 res!446432) b!680003))

(assert (= (and b!680003 res!446429) b!680004))

(assert (= (and b!680004 res!446428) b!680008))

(assert (= (and b!680004 (not res!446439)) b!680007))

(assert (= (and b!680007 res!446431) b!679994))

(assert (= (and b!680004 res!446430) b!679998))

(assert (= (and b!679998 res!446437) b!680009))

(assert (= (and b!680009 res!446433) b!680000))

(assert (= (and b!680000 res!446436) b!679997))

(assert (= (and b!679997 res!446427) b!679999))

(assert (= (and b!679999 res!446426) b!680001))

(assert (= (and b!680001 res!446434) b!679996))

(assert (= (and b!679996 c!77151) b!680002))

(assert (= (and b!679996 (not c!77151)) b!680005))

(assert (= (and b!679996 (not res!446435)) b!680006))

(declare-fun m!644609 () Bool)

(assert (=> b!680006 m!644609))

(declare-fun m!644611 () Bool)

(assert (=> b!680006 m!644611))

(declare-fun m!644613 () Bool)

(assert (=> b!679994 m!644613))

(declare-fun m!644615 () Bool)

(assert (=> b!680009 m!644615))

(declare-fun m!644617 () Bool)

(assert (=> b!680003 m!644617))

(declare-fun m!644619 () Bool)

(assert (=> b!679995 m!644619))

(declare-fun m!644621 () Bool)

(assert (=> b!679997 m!644621))

(declare-fun m!644623 () Bool)

(assert (=> b!679996 m!644623))

(declare-fun m!644625 () Bool)

(assert (=> b!679996 m!644625))

(declare-fun m!644627 () Bool)

(assert (=> b!679996 m!644627))

(assert (=> b!679996 m!644623))

(declare-fun m!644629 () Bool)

(assert (=> b!679996 m!644629))

(declare-fun m!644631 () Bool)

(assert (=> b!679996 m!644631))

(assert (=> b!680008 m!644613))

(declare-fun m!644633 () Bool)

(assert (=> start!60498 m!644633))

(declare-fun m!644635 () Bool)

(assert (=> b!680010 m!644635))

(declare-fun m!644637 () Bool)

(assert (=> b!679998 m!644637))

(declare-fun m!644639 () Bool)

(assert (=> b!679999 m!644639))

(declare-fun m!644641 () Bool)

(assert (=> b!680002 m!644641))

(push 1)

(assert (not b!680008))

(assert (not b!679998))

(assert (not b!679997))

(assert (not b!679994))

(assert (not b!679999))

(assert (not b!680002))

(assert (not b!679996))

(assert (not b!680006))

(assert (not b!680010))

(assert (not start!60498))

(assert (not b!680003))

(assert (not b!679995))

(assert (not b!680009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

