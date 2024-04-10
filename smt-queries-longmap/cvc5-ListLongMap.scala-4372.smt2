; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60260 () Bool)

(assert start!60260)

(declare-fun b!675634 () Bool)

(declare-fun res!442076 () Bool)

(declare-fun e!385470 () Bool)

(assert (=> b!675634 (=> (not res!442076) (not e!385470))))

(declare-datatypes ((array!39307 0))(
  ( (array!39308 (arr!18846 (Array (_ BitVec 32) (_ BitVec 64))) (size!19210 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39307)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675634 (= res!442076 (not (validKeyInArray!0 (select (arr!18846 a!3626) from!3004))))))

(declare-fun b!675635 () Bool)

(declare-fun res!442061 () Bool)

(assert (=> b!675635 (=> (not res!442061) (not e!385470))))

(declare-datatypes ((List!12887 0))(
  ( (Nil!12884) (Cons!12883 (h!13928 (_ BitVec 64)) (t!19115 List!12887)) )
))
(declare-fun arrayNoDuplicates!0 (array!39307 (_ BitVec 32) List!12887) Bool)

(assert (=> b!675635 (= res!442061 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12884))))

(declare-fun b!675636 () Bool)

(declare-fun e!385463 () Bool)

(declare-fun acc!681 () List!12887)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3464 (List!12887 (_ BitVec 64)) Bool)

(assert (=> b!675636 (= e!385463 (contains!3464 acc!681 k!2843))))

(declare-fun b!675637 () Bool)

(declare-fun res!442070 () Bool)

(assert (=> b!675637 (=> (not res!442070) (not e!385470))))

(declare-fun e!385467 () Bool)

(assert (=> b!675637 (= res!442070 e!385467)))

(declare-fun res!442068 () Bool)

(assert (=> b!675637 (=> res!442068 e!385467)))

(assert (=> b!675637 (= res!442068 e!385463)))

(declare-fun res!442062 () Bool)

(assert (=> b!675637 (=> (not res!442062) (not e!385463))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675637 (= res!442062 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675638 () Bool)

(declare-fun res!442064 () Bool)

(assert (=> b!675638 (=> (not res!442064) (not e!385470))))

(assert (=> b!675638 (= res!442064 (not (contains!3464 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675639 () Bool)

(assert (=> b!675639 (= e!385470 false)))

(declare-fun lt!312736 () Bool)

(assert (=> b!675639 (= lt!312736 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675640 () Bool)

(declare-fun res!442073 () Bool)

(assert (=> b!675640 (=> (not res!442073) (not e!385470))))

(assert (=> b!675640 (= res!442073 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675641 () Bool)

(declare-fun res!442069 () Bool)

(assert (=> b!675641 (=> (not res!442069) (not e!385470))))

(assert (=> b!675641 (= res!442069 (validKeyInArray!0 k!2843))))

(declare-fun b!675642 () Bool)

(declare-fun res!442079 () Bool)

(assert (=> b!675642 (=> (not res!442079) (not e!385470))))

(assert (=> b!675642 (= res!442079 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19210 a!3626))))))

(declare-fun b!675643 () Bool)

(declare-fun res!442078 () Bool)

(assert (=> b!675643 (=> (not res!442078) (not e!385470))))

(declare-fun arrayContainsKey!0 (array!39307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675643 (= res!442078 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675644 () Bool)

(declare-fun e!385469 () Bool)

(assert (=> b!675644 (= e!385469 (contains!3464 acc!681 k!2843))))

(declare-fun b!675645 () Bool)

(declare-fun res!442074 () Bool)

(assert (=> b!675645 (=> (not res!442074) (not e!385470))))

(assert (=> b!675645 (= res!442074 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19210 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!442065 () Bool)

(assert (=> start!60260 (=> (not res!442065) (not e!385470))))

(assert (=> start!60260 (= res!442065 (and (bvslt (size!19210 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19210 a!3626))))))

(assert (=> start!60260 e!385470))

(assert (=> start!60260 true))

(declare-fun array_inv!14642 (array!39307) Bool)

(assert (=> start!60260 (array_inv!14642 a!3626)))

(declare-fun b!675646 () Bool)

(declare-fun e!385468 () Bool)

(assert (=> b!675646 (= e!385468 (not (contains!3464 acc!681 k!2843)))))

(declare-fun b!675647 () Bool)

(declare-fun res!442066 () Bool)

(assert (=> b!675647 (=> (not res!442066) (not e!385470))))

(declare-fun noDuplicate!711 (List!12887) Bool)

(assert (=> b!675647 (= res!442066 (noDuplicate!711 acc!681))))

(declare-fun b!675648 () Bool)

(declare-fun res!442075 () Bool)

(assert (=> b!675648 (=> (not res!442075) (not e!385470))))

(declare-fun e!385465 () Bool)

(assert (=> b!675648 (= res!442075 e!385465)))

(declare-fun res!442063 () Bool)

(assert (=> b!675648 (=> res!442063 e!385465)))

(assert (=> b!675648 (= res!442063 e!385469)))

(declare-fun res!442077 () Bool)

(assert (=> b!675648 (=> (not res!442077) (not e!385469))))

(assert (=> b!675648 (= res!442077 (bvsgt from!3004 i!1382))))

(declare-fun b!675649 () Bool)

(declare-fun e!385466 () Bool)

(assert (=> b!675649 (= e!385467 e!385466)))

(declare-fun res!442060 () Bool)

(assert (=> b!675649 (=> (not res!442060) (not e!385466))))

(assert (=> b!675649 (= res!442060 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675650 () Bool)

(declare-fun res!442071 () Bool)

(assert (=> b!675650 (=> (not res!442071) (not e!385470))))

(assert (=> b!675650 (= res!442071 (not (contains!3464 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675651 () Bool)

(declare-fun res!442072 () Bool)

(assert (=> b!675651 (=> (not res!442072) (not e!385470))))

(assert (=> b!675651 (= res!442072 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675652 () Bool)

(assert (=> b!675652 (= e!385466 (not (contains!3464 acc!681 k!2843)))))

(declare-fun b!675653 () Bool)

(assert (=> b!675653 (= e!385465 e!385468)))

(declare-fun res!442067 () Bool)

(assert (=> b!675653 (=> (not res!442067) (not e!385468))))

(assert (=> b!675653 (= res!442067 (bvsle from!3004 i!1382))))

(assert (= (and start!60260 res!442065) b!675647))

(assert (= (and b!675647 res!442066) b!675650))

(assert (= (and b!675650 res!442071) b!675638))

(assert (= (and b!675638 res!442064) b!675648))

(assert (= (and b!675648 res!442077) b!675644))

(assert (= (and b!675648 (not res!442063)) b!675653))

(assert (= (and b!675653 res!442067) b!675646))

(assert (= (and b!675648 res!442075) b!675635))

(assert (= (and b!675635 res!442061) b!675640))

(assert (= (and b!675640 res!442073) b!675642))

(assert (= (and b!675642 res!442079) b!675641))

(assert (= (and b!675641 res!442069) b!675643))

(assert (= (and b!675643 res!442078) b!675645))

(assert (= (and b!675645 res!442074) b!675634))

(assert (= (and b!675634 res!442076) b!675651))

(assert (= (and b!675651 res!442072) b!675637))

(assert (= (and b!675637 res!442062) b!675636))

(assert (= (and b!675637 (not res!442068)) b!675649))

(assert (= (and b!675649 res!442060) b!675652))

(assert (= (and b!675637 res!442070) b!675639))

(declare-fun m!642971 () Bool)

(assert (=> b!675643 m!642971))

(declare-fun m!642973 () Bool)

(assert (=> b!675638 m!642973))

(declare-fun m!642975 () Bool)

(assert (=> b!675640 m!642975))

(declare-fun m!642977 () Bool)

(assert (=> b!675644 m!642977))

(assert (=> b!675646 m!642977))

(declare-fun m!642979 () Bool)

(assert (=> b!675647 m!642979))

(declare-fun m!642981 () Bool)

(assert (=> b!675641 m!642981))

(assert (=> b!675652 m!642977))

(declare-fun m!642983 () Bool)

(assert (=> b!675639 m!642983))

(declare-fun m!642985 () Bool)

(assert (=> b!675650 m!642985))

(assert (=> b!675636 m!642977))

(declare-fun m!642987 () Bool)

(assert (=> b!675635 m!642987))

(declare-fun m!642989 () Bool)

(assert (=> start!60260 m!642989))

(declare-fun m!642991 () Bool)

(assert (=> b!675634 m!642991))

(assert (=> b!675634 m!642991))

(declare-fun m!642993 () Bool)

(assert (=> b!675634 m!642993))

(push 1)

(assert (not b!675640))

(assert (not b!675652))

(assert (not b!675646))

(assert (not b!675639))

(assert (not b!675650))

(assert (not b!675635))

(assert (not b!675641))

(assert (not start!60260))

(assert (not b!675643))

(assert (not b!675647))

(assert (not b!675644))

(assert (not b!675638))

(assert (not b!675634))

(assert (not b!675636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

