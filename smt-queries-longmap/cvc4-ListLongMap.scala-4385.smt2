; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60342 () Bool)

(assert start!60342)

(declare-fun b!677979 () Bool)

(declare-fun res!444410 () Bool)

(declare-fun e!386398 () Bool)

(assert (=> b!677979 (=> (not res!444410) (not e!386398))))

(declare-datatypes ((List!12928 0))(
  ( (Nil!12925) (Cons!12924 (h!13969 (_ BitVec 64)) (t!19156 List!12928)) )
))
(declare-fun acc!681 () List!12928)

(declare-fun contains!3505 (List!12928 (_ BitVec 64)) Bool)

(assert (=> b!677979 (= res!444410 (not (contains!3505 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677980 () Bool)

(declare-fun e!386399 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677980 (= e!386399 (contains!3505 acc!681 k!2843))))

(declare-fun b!677981 () Bool)

(declare-fun res!444406 () Bool)

(assert (=> b!677981 (=> (not res!444406) (not e!386398))))

(declare-datatypes ((array!39389 0))(
  ( (array!39390 (arr!18887 (Array (_ BitVec 32) (_ BitVec 64))) (size!19251 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39389)

(declare-fun arrayNoDuplicates!0 (array!39389 (_ BitVec 32) List!12928) Bool)

(assert (=> b!677981 (= res!444406 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12925))))

(declare-fun b!677982 () Bool)

(declare-fun res!444407 () Bool)

(assert (=> b!677982 (=> (not res!444407) (not e!386398))))

(declare-fun noDuplicate!752 (List!12928) Bool)

(assert (=> b!677982 (= res!444407 (noDuplicate!752 acc!681))))

(declare-fun b!677983 () Bool)

(declare-fun e!386400 () Bool)

(assert (=> b!677983 (= e!386400 (not (contains!3505 acc!681 k!2843)))))

(declare-fun b!677985 () Bool)

(declare-fun res!444408 () Bool)

(assert (=> b!677985 (=> (not res!444408) (not e!386398))))

(declare-fun e!386396 () Bool)

(assert (=> b!677985 (= res!444408 e!386396)))

(declare-fun res!444411 () Bool)

(assert (=> b!677985 (=> res!444411 e!386396)))

(assert (=> b!677985 (= res!444411 e!386399)))

(declare-fun res!444405 () Bool)

(assert (=> b!677985 (=> (not res!444405) (not e!386399))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677985 (= res!444405 (bvsgt from!3004 i!1382))))

(declare-fun b!677986 () Bool)

(assert (=> b!677986 (= e!386398 false)))

(declare-fun lt!312850 () Bool)

(assert (=> b!677986 (= lt!312850 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677987 () Bool)

(assert (=> b!677987 (= e!386396 e!386400)))

(declare-fun res!444413 () Bool)

(assert (=> b!677987 (=> (not res!444413) (not e!386400))))

(assert (=> b!677987 (= res!444413 (bvsle from!3004 i!1382))))

(declare-fun b!677984 () Bool)

(declare-fun res!444412 () Bool)

(assert (=> b!677984 (=> (not res!444412) (not e!386398))))

(assert (=> b!677984 (= res!444412 (not (contains!3505 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444409 () Bool)

(assert (=> start!60342 (=> (not res!444409) (not e!386398))))

(assert (=> start!60342 (= res!444409 (and (bvslt (size!19251 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19251 a!3626))))))

(assert (=> start!60342 e!386398))

(assert (=> start!60342 true))

(declare-fun array_inv!14683 (array!39389) Bool)

(assert (=> start!60342 (array_inv!14683 a!3626)))

(assert (= (and start!60342 res!444409) b!677982))

(assert (= (and b!677982 res!444407) b!677979))

(assert (= (and b!677979 res!444410) b!677984))

(assert (= (and b!677984 res!444412) b!677985))

(assert (= (and b!677985 res!444405) b!677980))

(assert (= (and b!677985 (not res!444411)) b!677987))

(assert (= (and b!677987 res!444413) b!677983))

(assert (= (and b!677985 res!444408) b!677981))

(assert (= (and b!677981 res!444406) b!677986))

(declare-fun m!643989 () Bool)

(assert (=> b!677981 m!643989))

(declare-fun m!643991 () Bool)

(assert (=> b!677982 m!643991))

(declare-fun m!643993 () Bool)

(assert (=> b!677979 m!643993))

(declare-fun m!643995 () Bool)

(assert (=> b!677986 m!643995))

(declare-fun m!643997 () Bool)

(assert (=> b!677983 m!643997))

(assert (=> b!677980 m!643997))

(declare-fun m!643999 () Bool)

(assert (=> b!677984 m!643999))

(declare-fun m!644001 () Bool)

(assert (=> start!60342 m!644001))

(push 1)

(assert (not b!677984))

(assert (not b!677981))

(assert (not b!677980))

(assert (not b!677982))

(assert (not b!677986))

(assert (not b!677983))

(assert (not b!677979))

(assert (not start!60342))

(check-sat)

