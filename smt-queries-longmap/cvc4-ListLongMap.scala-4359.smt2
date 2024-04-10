; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60186 () Bool)

(assert start!60186)

(declare-fun b!672886 () Bool)

(declare-fun res!439481 () Bool)

(declare-fun e!384331 () Bool)

(assert (=> b!672886 (=> (not res!439481) (not e!384331))))

(declare-datatypes ((List!12850 0))(
  ( (Nil!12847) (Cons!12846 (h!13891 (_ BitVec 64)) (t!19078 List!12850)) )
))
(declare-fun lt!312382 () List!12850)

(declare-fun contains!3427 (List!12850 (_ BitVec 64)) Bool)

(assert (=> b!672886 (= res!439481 (not (contains!3427 lt!312382 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672887 () Bool)

(declare-fun e!384332 () Bool)

(declare-fun e!384339 () Bool)

(assert (=> b!672887 (= e!384332 e!384339)))

(declare-fun res!439492 () Bool)

(assert (=> b!672887 (=> (not res!439492) (not e!384339))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672887 (= res!439492 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672888 () Bool)

(declare-fun res!439476 () Bool)

(declare-fun e!384337 () Bool)

(assert (=> b!672888 (=> (not res!439476) (not e!384337))))

(declare-datatypes ((array!39233 0))(
  ( (array!39234 (arr!18809 (Array (_ BitVec 32) (_ BitVec 64))) (size!19173 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39233)

(assert (=> b!672888 (= res!439476 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19173 a!3626))))))

(declare-fun b!672889 () Bool)

(declare-datatypes ((Unit!23648 0))(
  ( (Unit!23649) )
))
(declare-fun e!384336 () Unit!23648)

(declare-fun Unit!23650 () Unit!23648)

(assert (=> b!672889 (= e!384336 Unit!23650)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672889 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312380 () Unit!23648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39233 (_ BitVec 64) (_ BitVec 32)) Unit!23648)

(assert (=> b!672889 (= lt!312380 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672889 false))

(declare-fun b!672890 () Bool)

(assert (=> b!672890 (= e!384339 (not (contains!3427 lt!312382 k!2843)))))

(declare-fun b!672891 () Bool)

(declare-fun e!384333 () Bool)

(assert (=> b!672891 (= e!384333 e!384331)))

(declare-fun res!439484 () Bool)

(assert (=> b!672891 (=> (not res!439484) (not e!384331))))

(assert (=> b!672891 (= res!439484 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12850)

(declare-fun $colon$colon!277 (List!12850 (_ BitVec 64)) List!12850)

(assert (=> b!672891 (= lt!312382 ($colon$colon!277 acc!681 (select (arr!18809 a!3626) from!3004)))))

(declare-fun res!439496 () Bool)

(assert (=> start!60186 (=> (not res!439496) (not e!384337))))

(assert (=> start!60186 (= res!439496 (and (bvslt (size!19173 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19173 a!3626))))))

(assert (=> start!60186 e!384337))

(assert (=> start!60186 true))

(declare-fun array_inv!14605 (array!39233) Bool)

(assert (=> start!60186 (array_inv!14605 a!3626)))

(declare-fun b!672892 () Bool)

(declare-fun e!384329 () Bool)

(assert (=> b!672892 (= e!384329 (not (contains!3427 acc!681 k!2843)))))

(declare-fun b!672893 () Bool)

(declare-fun res!439487 () Bool)

(assert (=> b!672893 (=> (not res!439487) (not e!384331))))

(assert (=> b!672893 (= res!439487 (not (contains!3427 lt!312382 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672894 () Bool)

(declare-fun res!439486 () Bool)

(assert (=> b!672894 (=> (not res!439486) (not e!384337))))

(declare-fun arrayNoDuplicates!0 (array!39233 (_ BitVec 32) List!12850) Bool)

(assert (=> b!672894 (= res!439486 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12847))))

(declare-fun b!672895 () Bool)

(declare-fun Unit!23651 () Unit!23648)

(assert (=> b!672895 (= e!384336 Unit!23651)))

(declare-fun b!672896 () Bool)

(declare-fun e!384330 () Bool)

(assert (=> b!672896 (= e!384330 e!384329)))

(declare-fun res!439497 () Bool)

(assert (=> b!672896 (=> (not res!439497) (not e!384329))))

(assert (=> b!672896 (= res!439497 (bvsle from!3004 i!1382))))

(declare-fun b!672897 () Bool)

(assert (=> b!672897 (= e!384337 e!384333)))

(declare-fun res!439494 () Bool)

(assert (=> b!672897 (=> (not res!439494) (not e!384333))))

(assert (=> b!672897 (= res!439494 (not (= (select (arr!18809 a!3626) from!3004) k!2843)))))

(declare-fun lt!312381 () Unit!23648)

(assert (=> b!672897 (= lt!312381 e!384336)))

(declare-fun c!77072 () Bool)

(assert (=> b!672897 (= c!77072 (= (select (arr!18809 a!3626) from!3004) k!2843))))

(declare-fun b!672898 () Bool)

(declare-fun res!439499 () Bool)

(assert (=> b!672898 (=> (not res!439499) (not e!384337))))

(assert (=> b!672898 (= res!439499 (not (contains!3427 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672899 () Bool)

(declare-fun res!439479 () Bool)

(assert (=> b!672899 (=> (not res!439479) (not e!384337))))

(assert (=> b!672899 (= res!439479 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672900 () Bool)

(declare-fun res!439491 () Bool)

(assert (=> b!672900 (=> (not res!439491) (not e!384331))))

(declare-fun noDuplicate!674 (List!12850) Bool)

(assert (=> b!672900 (= res!439491 (noDuplicate!674 lt!312382))))

(declare-fun b!672901 () Bool)

(declare-fun e!384334 () Bool)

(assert (=> b!672901 (= e!384334 (contains!3427 acc!681 k!2843))))

(declare-fun b!672902 () Bool)

(declare-fun res!439498 () Bool)

(assert (=> b!672902 (=> (not res!439498) (not e!384337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672902 (= res!439498 (validKeyInArray!0 k!2843))))

(declare-fun b!672903 () Bool)

(declare-fun res!439495 () Bool)

(assert (=> b!672903 (=> (not res!439495) (not e!384337))))

(assert (=> b!672903 (= res!439495 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19173 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672904 () Bool)

(assert (=> b!672904 (= e!384331 false)))

(declare-fun lt!312379 () Bool)

(assert (=> b!672904 (= lt!312379 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312382))))

(declare-fun b!672905 () Bool)

(declare-fun res!439477 () Bool)

(assert (=> b!672905 (=> (not res!439477) (not e!384337))))

(assert (=> b!672905 (= res!439477 (noDuplicate!674 acc!681))))

(declare-fun b!672906 () Bool)

(declare-fun e!384338 () Bool)

(assert (=> b!672906 (= e!384338 (contains!3427 lt!312382 k!2843))))

(declare-fun b!672907 () Bool)

(declare-fun res!439489 () Bool)

(assert (=> b!672907 (=> (not res!439489) (not e!384337))))

(assert (=> b!672907 (= res!439489 e!384330)))

(declare-fun res!439485 () Bool)

(assert (=> b!672907 (=> res!439485 e!384330)))

(assert (=> b!672907 (= res!439485 e!384334)))

(declare-fun res!439480 () Bool)

(assert (=> b!672907 (=> (not res!439480) (not e!384334))))

(assert (=> b!672907 (= res!439480 (bvsgt from!3004 i!1382))))

(declare-fun b!672908 () Bool)

(declare-fun res!439493 () Bool)

(assert (=> b!672908 (=> (not res!439493) (not e!384337))))

(assert (=> b!672908 (= res!439493 (validKeyInArray!0 (select (arr!18809 a!3626) from!3004)))))

(declare-fun b!672909 () Bool)

(declare-fun res!439488 () Bool)

(assert (=> b!672909 (=> (not res!439488) (not e!384337))))

(assert (=> b!672909 (= res!439488 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672910 () Bool)

(declare-fun res!439482 () Bool)

(assert (=> b!672910 (=> (not res!439482) (not e!384337))))

(assert (=> b!672910 (= res!439482 (not (contains!3427 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672911 () Bool)

(declare-fun res!439490 () Bool)

(assert (=> b!672911 (=> (not res!439490) (not e!384331))))

(assert (=> b!672911 (= res!439490 e!384332)))

(declare-fun res!439483 () Bool)

(assert (=> b!672911 (=> res!439483 e!384332)))

(assert (=> b!672911 (= res!439483 e!384338)))

(declare-fun res!439478 () Bool)

(assert (=> b!672911 (=> (not res!439478) (not e!384338))))

(assert (=> b!672911 (= res!439478 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60186 res!439496) b!672905))

(assert (= (and b!672905 res!439477) b!672898))

(assert (= (and b!672898 res!439499) b!672910))

(assert (= (and b!672910 res!439482) b!672907))

(assert (= (and b!672907 res!439480) b!672901))

(assert (= (and b!672907 (not res!439485)) b!672896))

(assert (= (and b!672896 res!439497) b!672892))

(assert (= (and b!672907 res!439489) b!672894))

(assert (= (and b!672894 res!439486) b!672899))

(assert (= (and b!672899 res!439479) b!672888))

(assert (= (and b!672888 res!439476) b!672902))

(assert (= (and b!672902 res!439498) b!672909))

(assert (= (and b!672909 res!439488) b!672903))

(assert (= (and b!672903 res!439495) b!672908))

(assert (= (and b!672908 res!439493) b!672897))

(assert (= (and b!672897 c!77072) b!672889))

(assert (= (and b!672897 (not c!77072)) b!672895))

(assert (= (and b!672897 res!439494) b!672891))

(assert (= (and b!672891 res!439484) b!672900))

(assert (= (and b!672900 res!439491) b!672886))

(assert (= (and b!672886 res!439481) b!672893))

(assert (= (and b!672893 res!439487) b!672911))

(assert (= (and b!672911 res!439478) b!672906))

(assert (= (and b!672911 (not res!439483)) b!672887))

(assert (= (and b!672887 res!439492) b!672890))

(assert (= (and b!672911 res!439490) b!672904))

(declare-fun m!641619 () Bool)

(assert (=> b!672905 m!641619))

(declare-fun m!641621 () Bool)

(assert (=> b!672900 m!641621))

(declare-fun m!641623 () Bool)

(assert (=> b!672893 m!641623))

(declare-fun m!641625 () Bool)

(assert (=> b!672894 m!641625))

(declare-fun m!641627 () Bool)

(assert (=> b!672892 m!641627))

(declare-fun m!641629 () Bool)

(assert (=> b!672890 m!641629))

(declare-fun m!641631 () Bool)

(assert (=> b!672898 m!641631))

(declare-fun m!641633 () Bool)

(assert (=> b!672902 m!641633))

(declare-fun m!641635 () Bool)

(assert (=> b!672891 m!641635))

(assert (=> b!672891 m!641635))

(declare-fun m!641637 () Bool)

(assert (=> b!672891 m!641637))

(declare-fun m!641639 () Bool)

(assert (=> b!672909 m!641639))

(assert (=> b!672897 m!641635))

(declare-fun m!641641 () Bool)

(assert (=> b!672889 m!641641))

(declare-fun m!641643 () Bool)

(assert (=> b!672889 m!641643))

(declare-fun m!641645 () Bool)

(assert (=> b!672910 m!641645))

(declare-fun m!641647 () Bool)

(assert (=> b!672904 m!641647))

(declare-fun m!641649 () Bool)

(assert (=> start!60186 m!641649))

(assert (=> b!672901 m!641627))

(declare-fun m!641651 () Bool)

(assert (=> b!672886 m!641651))

(declare-fun m!641653 () Bool)

(assert (=> b!672899 m!641653))

(assert (=> b!672908 m!641635))

(assert (=> b!672908 m!641635))

(declare-fun m!641655 () Bool)

(assert (=> b!672908 m!641655))

(assert (=> b!672906 m!641629))

(push 1)

