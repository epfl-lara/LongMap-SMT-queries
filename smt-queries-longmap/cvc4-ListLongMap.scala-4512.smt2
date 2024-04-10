; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62544 () Bool)

(assert start!62544)

(declare-fun b!704890 () Bool)

(declare-fun res!468716 () Bool)

(declare-fun e!397771 () Bool)

(assert (=> b!704890 (=> (not res!468716) (not e!397771))))

(declare-datatypes ((List!13309 0))(
  ( (Nil!13306) (Cons!13305 (h!14350 (_ BitVec 64)) (t!19591 List!13309)) )
))
(declare-fun acc!652 () List!13309)

(declare-fun noDuplicate!1133 (List!13309) Bool)

(assert (=> b!704890 (= res!468716 (noDuplicate!1133 acc!652))))

(declare-fun b!704891 () Bool)

(declare-fun res!468704 () Bool)

(assert (=> b!704891 (=> (not res!468704) (not e!397771))))

(declare-fun newAcc!49 () List!13309)

(declare-fun contains!3886 (List!13309 (_ BitVec 64)) Bool)

(assert (=> b!704891 (= res!468704 (not (contains!3886 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704892 () Bool)

(declare-fun res!468705 () Bool)

(assert (=> b!704892 (=> (not res!468705) (not e!397771))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704892 (= res!468705 (validKeyInArray!0 k!2824))))

(declare-fun b!704893 () Bool)

(declare-fun res!468700 () Bool)

(assert (=> b!704893 (=> (not res!468700) (not e!397771))))

(assert (=> b!704893 (= res!468700 (noDuplicate!1133 newAcc!49))))

(declare-fun b!704894 () Bool)

(declare-fun res!468715 () Bool)

(assert (=> b!704894 (=> (not res!468715) (not e!397771))))

(assert (=> b!704894 (= res!468715 (not (contains!3886 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704895 () Bool)

(declare-fun res!468710 () Bool)

(assert (=> b!704895 (=> (not res!468710) (not e!397771))))

(declare-datatypes ((array!40223 0))(
  ( (array!40224 (arr!19268 (Array (_ BitVec 32) (_ BitVec 64))) (size!19653 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40223)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704895 (= res!468710 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704896 () Bool)

(declare-fun res!468714 () Bool)

(assert (=> b!704896 (=> (not res!468714) (not e!397771))))

(assert (=> b!704896 (= res!468714 (not (contains!3886 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704897 () Bool)

(declare-fun res!468707 () Bool)

(assert (=> b!704897 (=> (not res!468707) (not e!397771))))

(assert (=> b!704897 (= res!468707 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704898 () Bool)

(declare-fun res!468701 () Bool)

(assert (=> b!704898 (=> (not res!468701) (not e!397771))))

(assert (=> b!704898 (= res!468701 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19653 a!3591)))))

(declare-fun b!704899 () Bool)

(declare-fun res!468717 () Bool)

(assert (=> b!704899 (=> (not res!468717) (not e!397771))))

(assert (=> b!704899 (= res!468717 (not (contains!3886 acc!652 k!2824)))))

(declare-fun b!704900 () Bool)

(declare-fun res!468706 () Bool)

(assert (=> b!704900 (=> (not res!468706) (not e!397771))))

(declare-fun subseq!331 (List!13309 List!13309) Bool)

(assert (=> b!704900 (= res!468706 (subseq!331 acc!652 newAcc!49))))

(declare-fun b!704901 () Bool)

(declare-fun res!468709 () Bool)

(assert (=> b!704901 (=> (not res!468709) (not e!397771))))

(assert (=> b!704901 (= res!468709 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704902 () Bool)

(declare-fun res!468711 () Bool)

(assert (=> b!704902 (=> (not res!468711) (not e!397771))))

(declare-fun arrayNoDuplicates!0 (array!40223 (_ BitVec 32) List!13309) Bool)

(assert (=> b!704902 (= res!468711 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704903 () Bool)

(declare-fun res!468713 () Bool)

(assert (=> b!704903 (=> (not res!468713) (not e!397771))))

(assert (=> b!704903 (= res!468713 (not (validKeyInArray!0 (select (arr!19268 a!3591) from!2969))))))

(declare-fun b!704904 () Bool)

(assert (=> b!704904 (= e!397771 false)))

(declare-fun lt!317868 () Bool)

(assert (=> b!704904 (= lt!317868 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704905 () Bool)

(declare-fun res!468712 () Bool)

(assert (=> b!704905 (=> (not res!468712) (not e!397771))))

(declare-fun -!296 (List!13309 (_ BitVec 64)) List!13309)

(assert (=> b!704905 (= res!468712 (= (-!296 newAcc!49 k!2824) acc!652))))

(declare-fun res!468708 () Bool)

(assert (=> start!62544 (=> (not res!468708) (not e!397771))))

(assert (=> start!62544 (= res!468708 (and (bvslt (size!19653 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19653 a!3591))))))

(assert (=> start!62544 e!397771))

(assert (=> start!62544 true))

(declare-fun array_inv!15064 (array!40223) Bool)

(assert (=> start!62544 (array_inv!15064 a!3591)))

(declare-fun b!704906 () Bool)

(declare-fun res!468703 () Bool)

(assert (=> b!704906 (=> (not res!468703) (not e!397771))))

(assert (=> b!704906 (= res!468703 (not (contains!3886 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704907 () Bool)

(declare-fun res!468702 () Bool)

(assert (=> b!704907 (=> (not res!468702) (not e!397771))))

(assert (=> b!704907 (= res!468702 (contains!3886 newAcc!49 k!2824))))

(assert (= (and start!62544 res!468708) b!704890))

(assert (= (and b!704890 res!468716) b!704893))

(assert (= (and b!704893 res!468700) b!704906))

(assert (= (and b!704906 res!468703) b!704894))

(assert (= (and b!704894 res!468715) b!704901))

(assert (= (and b!704901 res!468709) b!704899))

(assert (= (and b!704899 res!468717) b!704892))

(assert (= (and b!704892 res!468705) b!704902))

(assert (= (and b!704902 res!468711) b!704900))

(assert (= (and b!704900 res!468706) b!704907))

(assert (= (and b!704907 res!468702) b!704905))

(assert (= (and b!704905 res!468712) b!704896))

(assert (= (and b!704896 res!468714) b!704891))

(assert (= (and b!704891 res!468704) b!704898))

(assert (= (and b!704898 res!468701) b!704903))

(assert (= (and b!704903 res!468713) b!704897))

(assert (= (and b!704897 res!468707) b!704895))

(assert (= (and b!704895 res!468710) b!704904))

(declare-fun m!663235 () Bool)

(assert (=> b!704907 m!663235))

(declare-fun m!663237 () Bool)

(assert (=> b!704896 m!663237))

(declare-fun m!663239 () Bool)

(assert (=> b!704893 m!663239))

(declare-fun m!663241 () Bool)

(assert (=> b!704890 m!663241))

(declare-fun m!663243 () Bool)

(assert (=> b!704891 m!663243))

(declare-fun m!663245 () Bool)

(assert (=> b!704903 m!663245))

(assert (=> b!704903 m!663245))

(declare-fun m!663247 () Bool)

(assert (=> b!704903 m!663247))

(declare-fun m!663249 () Bool)

(assert (=> b!704901 m!663249))

(declare-fun m!663251 () Bool)

(assert (=> b!704902 m!663251))

(declare-fun m!663253 () Bool)

(assert (=> b!704900 m!663253))

(declare-fun m!663255 () Bool)

(assert (=> b!704904 m!663255))

(declare-fun m!663257 () Bool)

(assert (=> start!62544 m!663257))

(declare-fun m!663259 () Bool)

(assert (=> b!704894 m!663259))

(declare-fun m!663261 () Bool)

(assert (=> b!704906 m!663261))

(declare-fun m!663263 () Bool)

(assert (=> b!704892 m!663263))

(declare-fun m!663265 () Bool)

(assert (=> b!704905 m!663265))

(declare-fun m!663267 () Bool)

(assert (=> b!704895 m!663267))

(declare-fun m!663269 () Bool)

(assert (=> b!704899 m!663269))

(push 1)

(assert (not b!704896))

(assert (not b!704906))

(assert (not b!704893))

(assert (not b!704900))

(assert (not b!704901))

(assert (not b!704907))

(assert (not b!704903))

(assert (not b!704904))

(assert (not b!704902))

(assert (not start!62544))

(assert (not b!704899))

(assert (not b!704891))

(assert (not b!704895))

(assert (not b!704892))

(assert (not b!704894))

(assert (not b!704905))

(assert (not b!704890))

(check-sat)

