; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60234 () Bool)

(assert start!60234)

(declare-fun b!674918 () Bool)

(declare-fun e!385110 () Bool)

(declare-fun e!385109 () Bool)

(assert (=> b!674918 (= e!385110 e!385109)))

(declare-fun res!441523 () Bool)

(assert (=> b!674918 (=> (not res!441523) (not e!385109))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674918 (= res!441523 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674919 () Bool)

(declare-fun res!441509 () Bool)

(declare-fun e!385106 () Bool)

(assert (=> b!674919 (=> (not res!441509) (not e!385106))))

(declare-datatypes ((array!39292 0))(
  ( (array!39293 (arr!18838 (Array (_ BitVec 32) (_ BitVec 64))) (size!19203 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39292)

(declare-datatypes ((List!12918 0))(
  ( (Nil!12915) (Cons!12914 (h!13959 (_ BitVec 64)) (t!19137 List!12918)) )
))
(declare-fun acc!681 () List!12918)

(declare-fun arrayNoDuplicates!0 (array!39292 (_ BitVec 32) List!12918) Bool)

(assert (=> b!674919 (= res!441509 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!441517 () Bool)

(assert (=> start!60234 (=> (not res!441517) (not e!385106))))

(assert (=> start!60234 (= res!441517 (and (bvslt (size!19203 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19203 a!3626))))))

(assert (=> start!60234 e!385106))

(assert (=> start!60234 true))

(declare-fun array_inv!14721 (array!39292) Bool)

(assert (=> start!60234 (array_inv!14721 a!3626)))

(declare-fun b!674920 () Bool)

(declare-fun e!385111 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3440 (List!12918 (_ BitVec 64)) Bool)

(assert (=> b!674920 (= e!385111 (contains!3440 acc!681 k!2843))))

(declare-fun b!674921 () Bool)

(declare-fun res!441519 () Bool)

(assert (=> b!674921 (=> (not res!441519) (not e!385106))))

(assert (=> b!674921 (= res!441519 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12915))))

(declare-fun b!674922 () Bool)

(declare-fun res!441521 () Bool)

(assert (=> b!674922 (=> (not res!441521) (not e!385106))))

(declare-fun noDuplicate!709 (List!12918) Bool)

(assert (=> b!674922 (= res!441521 (noDuplicate!709 acc!681))))

(declare-fun b!674923 () Bool)

(declare-fun res!441520 () Bool)

(assert (=> b!674923 (=> (not res!441520) (not e!385106))))

(assert (=> b!674923 (= res!441520 e!385110)))

(declare-fun res!441507 () Bool)

(assert (=> b!674923 (=> res!441507 e!385110)))

(assert (=> b!674923 (= res!441507 e!385111)))

(declare-fun res!441515 () Bool)

(assert (=> b!674923 (=> (not res!441515) (not e!385111))))

(assert (=> b!674923 (= res!441515 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674924 () Bool)

(declare-fun res!441522 () Bool)

(assert (=> b!674924 (=> (not res!441522) (not e!385106))))

(declare-fun arrayContainsKey!0 (array!39292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674924 (= res!441522 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674925 () Bool)

(declare-fun res!441516 () Bool)

(assert (=> b!674925 (=> (not res!441516) (not e!385106))))

(declare-fun e!385112 () Bool)

(assert (=> b!674925 (= res!441516 e!385112)))

(declare-fun res!441508 () Bool)

(assert (=> b!674925 (=> res!441508 e!385112)))

(declare-fun e!385105 () Bool)

(assert (=> b!674925 (= res!441508 e!385105)))

(declare-fun res!441505 () Bool)

(assert (=> b!674925 (=> (not res!441505) (not e!385105))))

(assert (=> b!674925 (= res!441505 (bvsgt from!3004 i!1382))))

(declare-fun b!674926 () Bool)

(declare-fun res!441512 () Bool)

(assert (=> b!674926 (=> (not res!441512) (not e!385106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674926 (= res!441512 (validKeyInArray!0 k!2843))))

(declare-fun b!674927 () Bool)

(declare-fun res!441513 () Bool)

(assert (=> b!674927 (=> (not res!441513) (not e!385106))))

(assert (=> b!674927 (= res!441513 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19203 a!3626))))))

(declare-fun b!674928 () Bool)

(declare-fun res!441518 () Bool)

(assert (=> b!674928 (=> (not res!441518) (not e!385106))))

(assert (=> b!674928 (= res!441518 (not (contains!3440 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674929 () Bool)

(assert (=> b!674929 (= e!385106 false)))

(declare-fun lt!312459 () Bool)

(assert (=> b!674929 (= lt!312459 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!674930 () Bool)

(assert (=> b!674930 (= e!385105 (contains!3440 acc!681 k!2843))))

(declare-fun b!674931 () Bool)

(declare-fun e!385107 () Bool)

(assert (=> b!674931 (= e!385112 e!385107)))

(declare-fun res!441510 () Bool)

(assert (=> b!674931 (=> (not res!441510) (not e!385107))))

(assert (=> b!674931 (= res!441510 (bvsle from!3004 i!1382))))

(declare-fun b!674932 () Bool)

(assert (=> b!674932 (= e!385109 (not (contains!3440 acc!681 k!2843)))))

(declare-fun b!674933 () Bool)

(declare-fun res!441514 () Bool)

(assert (=> b!674933 (=> (not res!441514) (not e!385106))))

(assert (=> b!674933 (= res!441514 (not (contains!3440 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674934 () Bool)

(declare-fun res!441511 () Bool)

(assert (=> b!674934 (=> (not res!441511) (not e!385106))))

(assert (=> b!674934 (= res!441511 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!674935 () Bool)

(assert (=> b!674935 (= e!385107 (not (contains!3440 acc!681 k!2843)))))

(declare-fun b!674936 () Bool)

(declare-fun res!441504 () Bool)

(assert (=> b!674936 (=> (not res!441504) (not e!385106))))

(assert (=> b!674936 (= res!441504 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19203 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674937 () Bool)

(declare-fun res!441506 () Bool)

(assert (=> b!674937 (=> (not res!441506) (not e!385106))))

(assert (=> b!674937 (= res!441506 (not (validKeyInArray!0 (select (arr!18838 a!3626) from!3004))))))

(assert (= (and start!60234 res!441517) b!674922))

(assert (= (and b!674922 res!441521) b!674928))

(assert (= (and b!674928 res!441518) b!674933))

(assert (= (and b!674933 res!441514) b!674925))

(assert (= (and b!674925 res!441505) b!674930))

(assert (= (and b!674925 (not res!441508)) b!674931))

(assert (= (and b!674931 res!441510) b!674935))

(assert (= (and b!674925 res!441516) b!674921))

(assert (= (and b!674921 res!441519) b!674919))

(assert (= (and b!674919 res!441509) b!674927))

(assert (= (and b!674927 res!441513) b!674926))

(assert (= (and b!674926 res!441512) b!674924))

(assert (= (and b!674924 res!441522) b!674936))

(assert (= (and b!674936 res!441504) b!674937))

(assert (= (and b!674937 res!441506) b!674934))

(assert (= (and b!674934 res!441511) b!674923))

(assert (= (and b!674923 res!441515) b!674920))

(assert (= (and b!674923 (not res!441507)) b!674918))

(assert (= (and b!674918 res!441523) b!674932))

(assert (= (and b!674923 res!441520) b!674929))

(declare-fun m!642021 () Bool)

(assert (=> b!674929 m!642021))

(declare-fun m!642023 () Bool)

(assert (=> b!674919 m!642023))

(declare-fun m!642025 () Bool)

(assert (=> b!674924 m!642025))

(declare-fun m!642027 () Bool)

(assert (=> b!674922 m!642027))

(declare-fun m!642029 () Bool)

(assert (=> b!674933 m!642029))

(declare-fun m!642031 () Bool)

(assert (=> b!674928 m!642031))

(declare-fun m!642033 () Bool)

(assert (=> b!674935 m!642033))

(declare-fun m!642035 () Bool)

(assert (=> start!60234 m!642035))

(declare-fun m!642037 () Bool)

(assert (=> b!674937 m!642037))

(assert (=> b!674937 m!642037))

(declare-fun m!642039 () Bool)

(assert (=> b!674937 m!642039))

(declare-fun m!642041 () Bool)

(assert (=> b!674926 m!642041))

(assert (=> b!674932 m!642033))

(assert (=> b!674920 m!642033))

(assert (=> b!674930 m!642033))

(declare-fun m!642043 () Bool)

(assert (=> b!674921 m!642043))

(push 1)

(assert (not b!674921))

(assert (not b!674928))

(assert (not b!674919))

(assert (not b!674937))

(assert (not b!674924))

(assert (not b!674922))

(assert (not b!674929))

(assert (not b!674935))

(assert (not b!674932))

(assert (not b!674926))

(assert (not b!674930))

(assert (not start!60234))

(assert (not b!674920))

(assert (not b!674933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

