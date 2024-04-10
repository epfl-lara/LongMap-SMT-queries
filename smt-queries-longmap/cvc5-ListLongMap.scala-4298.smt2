; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59816 () Bool)

(assert start!59816)

(declare-fun b!660880 () Bool)

(declare-fun e!379742 () Bool)

(declare-datatypes ((List!12665 0))(
  ( (Nil!12662) (Cons!12661 (h!13706 (_ BitVec 64)) (t!18893 List!12665)) )
))
(declare-fun acc!681 () List!12665)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3242 (List!12665 (_ BitVec 64)) Bool)

(assert (=> b!660880 (= e!379742 (contains!3242 acc!681 k!2843))))

(declare-fun b!660881 () Bool)

(declare-fun res!428944 () Bool)

(declare-fun e!379744 () Bool)

(assert (=> b!660881 (=> (not res!428944) (not e!379744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660881 (= res!428944 (validKeyInArray!0 k!2843))))

(declare-fun b!660882 () Bool)

(declare-fun res!428952 () Bool)

(assert (=> b!660882 (=> (not res!428952) (not e!379744))))

(declare-fun e!379743 () Bool)

(assert (=> b!660882 (= res!428952 e!379743)))

(declare-fun res!428946 () Bool)

(assert (=> b!660882 (=> res!428946 e!379743)))

(assert (=> b!660882 (= res!428946 e!379742)))

(declare-fun res!428947 () Bool)

(assert (=> b!660882 (=> (not res!428947) (not e!379742))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660882 (= res!428947 (bvsgt from!3004 i!1382))))

(declare-fun b!660883 () Bool)

(declare-fun res!428956 () Bool)

(assert (=> b!660883 (=> (not res!428956) (not e!379744))))

(assert (=> b!660883 (= res!428956 (not (contains!3242 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660884 () Bool)

(declare-fun res!428954 () Bool)

(assert (=> b!660884 (=> (not res!428954) (not e!379744))))

(declare-datatypes ((array!38863 0))(
  ( (array!38864 (arr!18624 (Array (_ BitVec 32) (_ BitVec 64))) (size!18988 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38863)

(assert (=> b!660884 (= res!428954 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18988 a!3626))))))

(declare-fun b!660885 () Bool)

(declare-fun res!428953 () Bool)

(assert (=> b!660885 (=> (not res!428953) (not e!379744))))

(declare-fun arrayContainsKey!0 (array!38863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660885 (= res!428953 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660886 () Bool)

(declare-fun e!379745 () Bool)

(assert (=> b!660886 (= e!379743 e!379745)))

(declare-fun res!428957 () Bool)

(assert (=> b!660886 (=> (not res!428957) (not e!379745))))

(assert (=> b!660886 (= res!428957 (bvsle from!3004 i!1382))))

(declare-fun res!428950 () Bool)

(assert (=> start!59816 (=> (not res!428950) (not e!379744))))

(assert (=> start!59816 (= res!428950 (and (bvslt (size!18988 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18988 a!3626))))))

(assert (=> start!59816 e!379744))

(assert (=> start!59816 true))

(declare-fun array_inv!14420 (array!38863) Bool)

(assert (=> start!59816 (array_inv!14420 a!3626)))

(declare-fun b!660887 () Bool)

(declare-fun res!428948 () Bool)

(assert (=> b!660887 (=> (not res!428948) (not e!379744))))

(declare-fun noDuplicate!489 (List!12665) Bool)

(assert (=> b!660887 (= res!428948 (noDuplicate!489 acc!681))))

(declare-fun b!660888 () Bool)

(assert (=> b!660888 (= e!379744 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(assert (=> b!660888 (arrayContainsKey!0 (array!38864 (store (arr!18624 a!3626) i!1382 k!2843) (size!18988 a!3626)) k!2843 from!3004)))

(declare-fun b!660889 () Bool)

(declare-fun res!428945 () Bool)

(assert (=> b!660889 (=> (not res!428945) (not e!379744))))

(assert (=> b!660889 (= res!428945 (not (contains!3242 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660890 () Bool)

(declare-fun res!428955 () Bool)

(assert (=> b!660890 (=> (not res!428955) (not e!379744))))

(declare-fun arrayNoDuplicates!0 (array!38863 (_ BitVec 32) List!12665) Bool)

(assert (=> b!660890 (= res!428955 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12662))))

(declare-fun b!660891 () Bool)

(declare-fun res!428951 () Bool)

(assert (=> b!660891 (=> (not res!428951) (not e!379744))))

(assert (=> b!660891 (= res!428951 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18988 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!660892 () Bool)

(declare-fun res!428949 () Bool)

(assert (=> b!660892 (=> (not res!428949) (not e!379744))))

(assert (=> b!660892 (= res!428949 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660893 () Bool)

(assert (=> b!660893 (= e!379745 (not (contains!3242 acc!681 k!2843)))))

(assert (= (and start!59816 res!428950) b!660887))

(assert (= (and b!660887 res!428948) b!660889))

(assert (= (and b!660889 res!428945) b!660883))

(assert (= (and b!660883 res!428956) b!660882))

(assert (= (and b!660882 res!428947) b!660880))

(assert (= (and b!660882 (not res!428946)) b!660886))

(assert (= (and b!660886 res!428957) b!660893))

(assert (= (and b!660882 res!428952) b!660890))

(assert (= (and b!660890 res!428955) b!660892))

(assert (= (and b!660892 res!428949) b!660884))

(assert (= (and b!660884 res!428954) b!660881))

(assert (= (and b!660881 res!428944) b!660885))

(assert (= (and b!660885 res!428953) b!660891))

(assert (= (and b!660891 res!428951) b!660888))

(declare-fun m!633335 () Bool)

(assert (=> b!660888 m!633335))

(declare-fun m!633337 () Bool)

(assert (=> b!660888 m!633337))

(declare-fun m!633339 () Bool)

(assert (=> b!660881 m!633339))

(declare-fun m!633341 () Bool)

(assert (=> b!660893 m!633341))

(assert (=> b!660880 m!633341))

(declare-fun m!633343 () Bool)

(assert (=> b!660887 m!633343))

(declare-fun m!633345 () Bool)

(assert (=> b!660890 m!633345))

(declare-fun m!633347 () Bool)

(assert (=> b!660885 m!633347))

(declare-fun m!633349 () Bool)

(assert (=> b!660883 m!633349))

(declare-fun m!633351 () Bool)

(assert (=> b!660892 m!633351))

(declare-fun m!633353 () Bool)

(assert (=> b!660889 m!633353))

(declare-fun m!633355 () Bool)

(assert (=> start!59816 m!633355))

(push 1)

