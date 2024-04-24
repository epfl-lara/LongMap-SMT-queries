; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59974 () Bool)

(assert start!59974)

(declare-fun b!663848 () Bool)

(declare-fun e!380885 () Bool)

(declare-datatypes ((List!12617 0))(
  ( (Nil!12614) (Cons!12613 (h!13661 (_ BitVec 64)) (t!18837 List!12617)) )
))
(declare-fun acc!681 () List!12617)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3269 (List!12617 (_ BitVec 64)) Bool)

(assert (=> b!663848 (= e!380885 (not (contains!3269 acc!681 k!2843)))))

(declare-fun b!663849 () Bool)

(declare-fun res!431593 () Bool)

(declare-fun e!380887 () Bool)

(assert (=> b!663849 (=> (not res!431593) (not e!380887))))

(declare-datatypes ((array!38959 0))(
  ( (array!38960 (arr!18669 (Array (_ BitVec 32) (_ BitVec 64))) (size!19033 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38959)

(declare-fun arrayNoDuplicates!0 (array!38959 (_ BitVec 32) List!12617) Bool)

(assert (=> b!663849 (= res!431593 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12614))))

(declare-fun b!663850 () Bool)

(declare-fun res!431589 () Bool)

(assert (=> b!663850 (=> (not res!431589) (not e!380887))))

(assert (=> b!663850 (= res!431589 (not (contains!3269 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663851 () Bool)

(declare-fun res!431595 () Bool)

(assert (=> b!663851 (=> (not res!431595) (not e!380887))))

(declare-fun arrayContainsKey!0 (array!38959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663851 (= res!431595 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663852 () Bool)

(declare-fun res!431601 () Bool)

(assert (=> b!663852 (=> (not res!431601) (not e!380887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663852 (= res!431601 (validKeyInArray!0 k!2843))))

(declare-fun b!663853 () Bool)

(declare-fun res!431602 () Bool)

(assert (=> b!663853 (=> (not res!431602) (not e!380887))))

(declare-fun e!380886 () Bool)

(assert (=> b!663853 (= res!431602 e!380886)))

(declare-fun res!431592 () Bool)

(assert (=> b!663853 (=> res!431592 e!380886)))

(declare-fun e!380889 () Bool)

(assert (=> b!663853 (= res!431592 e!380889)))

(declare-fun res!431597 () Bool)

(assert (=> b!663853 (=> (not res!431597) (not e!380889))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663853 (= res!431597 (bvsgt from!3004 i!1382))))

(declare-fun b!663855 () Bool)

(declare-datatypes ((Unit!23074 0))(
  ( (Unit!23075) )
))
(declare-fun e!380888 () Unit!23074)

(declare-fun Unit!23076 () Unit!23074)

(assert (=> b!663855 (= e!380888 Unit!23076)))

(declare-fun lt!309438 () Unit!23074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38959 (_ BitVec 64) (_ BitVec 32)) Unit!23074)

(assert (=> b!663855 (= lt!309438 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663855 false))

(declare-fun b!663856 () Bool)

(declare-fun res!431590 () Bool)

(assert (=> b!663856 (=> (not res!431590) (not e!380887))))

(assert (=> b!663856 (= res!431590 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19033 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663857 () Bool)

(assert (=> b!663857 (= e!380889 (contains!3269 acc!681 k!2843))))

(declare-fun b!663858 () Bool)

(declare-fun Unit!23077 () Unit!23074)

(assert (=> b!663858 (= e!380888 Unit!23077)))

(declare-fun b!663859 () Bool)

(declare-fun e!380884 () Unit!23074)

(declare-fun lt!309440 () Unit!23074)

(assert (=> b!663859 (= e!380884 lt!309440)))

(declare-fun lt!309442 () Unit!23074)

(declare-fun lemmaListSubSeqRefl!0 (List!12617) Unit!23074)

(assert (=> b!663859 (= lt!309442 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!31 (List!12617 List!12617) Bool)

(assert (=> b!663859 (subseq!31 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38959 List!12617 List!12617 (_ BitVec 32)) Unit!23074)

(declare-fun $colon$colon!160 (List!12617 (_ BitVec 64)) List!12617)

(assert (=> b!663859 (= lt!309440 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!160 acc!681 (select (arr!18669 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663859 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663860 () Bool)

(declare-fun res!431596 () Bool)

(assert (=> b!663860 (=> (not res!431596) (not e!380887))))

(assert (=> b!663860 (= res!431596 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19033 a!3626))))))

(declare-fun b!663861 () Bool)

(declare-fun res!431600 () Bool)

(assert (=> b!663861 (=> (not res!431600) (not e!380887))))

(declare-fun noDuplicate!543 (List!12617) Bool)

(assert (=> b!663861 (= res!431600 (noDuplicate!543 acc!681))))

(declare-fun b!663862 () Bool)

(assert (=> b!663862 (= e!380886 e!380885)))

(declare-fun res!431599 () Bool)

(assert (=> b!663862 (=> (not res!431599) (not e!380885))))

(assert (=> b!663862 (= res!431599 (bvsle from!3004 i!1382))))

(declare-fun b!663863 () Bool)

(declare-fun res!431594 () Bool)

(assert (=> b!663863 (=> (not res!431594) (not e!380887))))

(assert (=> b!663863 (= res!431594 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663854 () Bool)

(declare-fun res!431591 () Bool)

(assert (=> b!663854 (=> (not res!431591) (not e!380887))))

(assert (=> b!663854 (= res!431591 (not (contains!3269 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!431598 () Bool)

(assert (=> start!59974 (=> (not res!431598) (not e!380887))))

(assert (=> start!59974 (= res!431598 (and (bvslt (size!19033 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19033 a!3626))))))

(assert (=> start!59974 e!380887))

(assert (=> start!59974 true))

(declare-fun array_inv!14528 (array!38959) Bool)

(assert (=> start!59974 (array_inv!14528 a!3626)))

(declare-fun b!663864 () Bool)

(assert (=> b!663864 (= e!380887 (not true))))

(declare-fun lt!309439 () Unit!23074)

(assert (=> b!663864 (= lt!309439 e!380884)))

(declare-fun c!76498 () Bool)

(assert (=> b!663864 (= c!76498 (validKeyInArray!0 (select (arr!18669 a!3626) from!3004)))))

(declare-fun lt!309441 () Unit!23074)

(assert (=> b!663864 (= lt!309441 e!380888)))

(declare-fun c!76499 () Bool)

(assert (=> b!663864 (= c!76499 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663864 (arrayContainsKey!0 (array!38960 (store (arr!18669 a!3626) i!1382 k!2843) (size!19033 a!3626)) k!2843 from!3004)))

(declare-fun b!663865 () Bool)

(declare-fun Unit!23078 () Unit!23074)

(assert (=> b!663865 (= e!380884 Unit!23078)))

(assert (= (and start!59974 res!431598) b!663861))

(assert (= (and b!663861 res!431600) b!663854))

(assert (= (and b!663854 res!431591) b!663850))

(assert (= (and b!663850 res!431589) b!663853))

(assert (= (and b!663853 res!431597) b!663857))

(assert (= (and b!663853 (not res!431592)) b!663862))

(assert (= (and b!663862 res!431599) b!663848))

(assert (= (and b!663853 res!431602) b!663849))

(assert (= (and b!663849 res!431593) b!663863))

(assert (= (and b!663863 res!431594) b!663860))

(assert (= (and b!663860 res!431596) b!663852))

(assert (= (and b!663852 res!431601) b!663851))

(assert (= (and b!663851 res!431595) b!663856))

(assert (= (and b!663856 res!431590) b!663864))

(assert (= (and b!663864 c!76499) b!663855))

(assert (= (and b!663864 (not c!76499)) b!663858))

(assert (= (and b!663864 c!76498) b!663859))

(assert (= (and b!663864 (not c!76498)) b!663865))

(declare-fun m!635847 () Bool)

(assert (=> start!59974 m!635847))

(declare-fun m!635849 () Bool)

(assert (=> b!663855 m!635849))

(declare-fun m!635851 () Bool)

(assert (=> b!663857 m!635851))

(declare-fun m!635853 () Bool)

(assert (=> b!663863 m!635853))

(declare-fun m!635855 () Bool)

(assert (=> b!663859 m!635855))

(declare-fun m!635857 () Bool)

(assert (=> b!663859 m!635857))

(declare-fun m!635859 () Bool)

(assert (=> b!663859 m!635859))

(declare-fun m!635861 () Bool)

(assert (=> b!663859 m!635861))

(assert (=> b!663859 m!635857))

(assert (=> b!663859 m!635859))

(declare-fun m!635863 () Bool)

(assert (=> b!663859 m!635863))

(declare-fun m!635865 () Bool)

(assert (=> b!663859 m!635865))

(assert (=> b!663864 m!635857))

(declare-fun m!635867 () Bool)

(assert (=> b!663864 m!635867))

(declare-fun m!635869 () Bool)

(assert (=> b!663864 m!635869))

(assert (=> b!663864 m!635857))

(declare-fun m!635871 () Bool)

(assert (=> b!663864 m!635871))

(declare-fun m!635873 () Bool)

(assert (=> b!663864 m!635873))

(declare-fun m!635875 () Bool)

(assert (=> b!663851 m!635875))

(declare-fun m!635877 () Bool)

(assert (=> b!663849 m!635877))

(declare-fun m!635879 () Bool)

(assert (=> b!663852 m!635879))

(declare-fun m!635881 () Bool)

(assert (=> b!663861 m!635881))

(declare-fun m!635883 () Bool)

(assert (=> b!663850 m!635883))

(declare-fun m!635885 () Bool)

(assert (=> b!663854 m!635885))

(assert (=> b!663848 m!635851))

(push 1)

(assert (not b!663849))

(assert (not b!663852))

(assert (not b!663859))

(assert (not b!663850))

(assert (not b!663863))

(assert (not b!663854))

(assert (not b!663861))

(assert (not b!663848))

(assert (not b!663851))

(assert (not b!663864))

(assert (not start!59974))

(assert (not b!663857))

(assert (not b!663855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

