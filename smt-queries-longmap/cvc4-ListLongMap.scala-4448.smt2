; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61794 () Bool)

(assert start!61794)

(declare-fun b!691885 () Bool)

(declare-datatypes ((Unit!24422 0))(
  ( (Unit!24423) )
))
(declare-fun e!393668 () Unit!24422)

(declare-fun Unit!24424 () Unit!24422)

(assert (=> b!691885 (= e!393668 Unit!24424)))

(declare-fun res!456199 () Bool)

(declare-fun e!393667 () Bool)

(assert (=> start!61794 (=> (not res!456199) (not e!393667))))

(declare-datatypes ((array!39815 0))(
  ( (array!39816 (arr!19076 (Array (_ BitVec 32) (_ BitVec 64))) (size!19461 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39815)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61794 (= res!456199 (and (bvslt (size!19461 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19461 a!3626))))))

(assert (=> start!61794 e!393667))

(assert (=> start!61794 true))

(declare-fun array_inv!14872 (array!39815) Bool)

(assert (=> start!61794 (array_inv!14872 a!3626)))

(declare-fun b!691886 () Bool)

(declare-fun e!393670 () Bool)

(declare-fun e!393669 () Bool)

(assert (=> b!691886 (= e!393670 e!393669)))

(declare-fun res!456201 () Bool)

(assert (=> b!691886 (=> (not res!456201) (not e!393669))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691886 (= res!456201 (bvsle from!3004 i!1382))))

(declare-fun b!691887 () Bool)

(declare-datatypes ((List!13117 0))(
  ( (Nil!13114) (Cons!13113 (h!14158 (_ BitVec 64)) (t!19384 List!13117)) )
))
(declare-fun acc!681 () List!13117)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3694 (List!13117 (_ BitVec 64)) Bool)

(assert (=> b!691887 (= e!393669 (not (contains!3694 acc!681 k!2843)))))

(declare-fun b!691888 () Bool)

(declare-fun e!393671 () Bool)

(assert (=> b!691888 (= e!393671 (contains!3694 acc!681 k!2843))))

(declare-fun b!691889 () Bool)

(declare-fun res!456207 () Bool)

(assert (=> b!691889 (=> (not res!456207) (not e!393667))))

(assert (=> b!691889 (= res!456207 (not (contains!3694 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691890 () Bool)

(declare-fun res!456202 () Bool)

(assert (=> b!691890 (=> (not res!456202) (not e!393667))))

(assert (=> b!691890 (= res!456202 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19461 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691891 () Bool)

(declare-fun res!456203 () Bool)

(assert (=> b!691891 (=> (not res!456203) (not e!393667))))

(assert (=> b!691891 (= res!456203 e!393670)))

(declare-fun res!456198 () Bool)

(assert (=> b!691891 (=> res!456198 e!393670)))

(assert (=> b!691891 (= res!456198 e!393671)))

(declare-fun res!456195 () Bool)

(assert (=> b!691891 (=> (not res!456195) (not e!393671))))

(assert (=> b!691891 (= res!456195 (bvsgt from!3004 i!1382))))

(declare-fun b!691892 () Bool)

(declare-fun res!456205 () Bool)

(assert (=> b!691892 (=> (not res!456205) (not e!393667))))

(assert (=> b!691892 (= res!456205 (not (contains!3694 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691893 () Bool)

(declare-fun res!456208 () Bool)

(assert (=> b!691893 (=> (not res!456208) (not e!393667))))

(assert (=> b!691893 (= res!456208 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19461 a!3626))))))

(declare-fun b!691894 () Bool)

(declare-fun res!456209 () Bool)

(assert (=> b!691894 (=> (not res!456209) (not e!393667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691894 (= res!456209 (validKeyInArray!0 k!2843))))

(declare-fun b!691895 () Bool)

(declare-fun Unit!24425 () Unit!24422)

(assert (=> b!691895 (= e!393668 Unit!24425)))

(declare-fun arrayContainsKey!0 (array!39815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691895 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316518 () Unit!24422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39815 (_ BitVec 64) (_ BitVec 32)) Unit!24422)

(assert (=> b!691895 (= lt!316518 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691895 false))

(declare-fun b!691896 () Bool)

(declare-fun res!456200 () Bool)

(assert (=> b!691896 (=> (not res!456200) (not e!393667))))

(declare-fun noDuplicate!941 (List!13117) Bool)

(assert (=> b!691896 (= res!456200 (noDuplicate!941 acc!681))))

(declare-fun b!691897 () Bool)

(declare-fun res!456206 () Bool)

(assert (=> b!691897 (=> (not res!456206) (not e!393667))))

(declare-fun arrayNoDuplicates!0 (array!39815 (_ BitVec 32) List!13117) Bool)

(assert (=> b!691897 (= res!456206 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691898 () Bool)

(declare-fun res!456197 () Bool)

(assert (=> b!691898 (=> (not res!456197) (not e!393667))))

(assert (=> b!691898 (= res!456197 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691899 () Bool)

(assert (=> b!691899 (= e!393667 (and (not (= (select (arr!19076 a!3626) from!3004) k!2843)) (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316519 () Unit!24422)

(assert (=> b!691899 (= lt!316519 e!393668)))

(declare-fun c!78212 () Bool)

(assert (=> b!691899 (= c!78212 (= (select (arr!19076 a!3626) from!3004) k!2843))))

(declare-fun b!691900 () Bool)

(declare-fun res!456204 () Bool)

(assert (=> b!691900 (=> (not res!456204) (not e!393667))))

(assert (=> b!691900 (= res!456204 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13114))))

(declare-fun b!691901 () Bool)

(declare-fun res!456196 () Bool)

(assert (=> b!691901 (=> (not res!456196) (not e!393667))))

(assert (=> b!691901 (= res!456196 (validKeyInArray!0 (select (arr!19076 a!3626) from!3004)))))

(assert (= (and start!61794 res!456199) b!691896))

(assert (= (and b!691896 res!456200) b!691889))

(assert (= (and b!691889 res!456207) b!691892))

(assert (= (and b!691892 res!456205) b!691891))

(assert (= (and b!691891 res!456195) b!691888))

(assert (= (and b!691891 (not res!456198)) b!691886))

(assert (= (and b!691886 res!456201) b!691887))

(assert (= (and b!691891 res!456203) b!691900))

(assert (= (and b!691900 res!456204) b!691897))

(assert (= (and b!691897 res!456206) b!691893))

(assert (= (and b!691893 res!456208) b!691894))

(assert (= (and b!691894 res!456209) b!691898))

(assert (= (and b!691898 res!456197) b!691890))

(assert (= (and b!691890 res!456202) b!691901))

(assert (= (and b!691901 res!456196) b!691899))

(assert (= (and b!691899 c!78212) b!691895))

(assert (= (and b!691899 (not c!78212)) b!691885))

(declare-fun m!654693 () Bool)

(assert (=> b!691888 m!654693))

(declare-fun m!654695 () Bool)

(assert (=> b!691895 m!654695))

(declare-fun m!654697 () Bool)

(assert (=> b!691895 m!654697))

(declare-fun m!654699 () Bool)

(assert (=> b!691899 m!654699))

(declare-fun m!654701 () Bool)

(assert (=> b!691896 m!654701))

(declare-fun m!654703 () Bool)

(assert (=> b!691898 m!654703))

(declare-fun m!654705 () Bool)

(assert (=> b!691892 m!654705))

(assert (=> b!691887 m!654693))

(assert (=> b!691901 m!654699))

(assert (=> b!691901 m!654699))

(declare-fun m!654707 () Bool)

(assert (=> b!691901 m!654707))

(declare-fun m!654709 () Bool)

(assert (=> start!61794 m!654709))

(declare-fun m!654711 () Bool)

(assert (=> b!691889 m!654711))

(declare-fun m!654713 () Bool)

(assert (=> b!691894 m!654713))

(declare-fun m!654715 () Bool)

(assert (=> b!691897 m!654715))

(declare-fun m!654717 () Bool)

(assert (=> b!691900 m!654717))

(push 1)

(assert (not b!691888))

(assert (not b!691897))

(assert (not b!691889))

(assert (not b!691895))

(assert (not b!691896))

