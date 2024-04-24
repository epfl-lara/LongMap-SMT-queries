; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61834 () Bool)

(assert start!61834)

(declare-fun b!691650 () Bool)

(declare-fun res!455911 () Bool)

(declare-fun e!393651 () Bool)

(assert (=> b!691650 (=> (not res!455911) (not e!393651))))

(declare-datatypes ((array!39793 0))(
  ( (array!39794 (arr!19062 (Array (_ BitVec 32) (_ BitVec 64))) (size!19445 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39793)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691650 (= res!455911 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691651 () Bool)

(assert (=> b!691651 (= e!393651 false)))

(declare-datatypes ((Unit!24365 0))(
  ( (Unit!24366) )
))
(declare-fun lt!316567 () Unit!24365)

(declare-fun e!393648 () Unit!24365)

(assert (=> b!691651 (= lt!316567 e!393648)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun c!78242 () Bool)

(assert (=> b!691651 (= c!78242 (= (select (arr!19062 a!3626) from!3004) k!2843))))

(declare-fun b!691652 () Bool)

(declare-fun e!393650 () Bool)

(declare-datatypes ((List!13010 0))(
  ( (Nil!13007) (Cons!13006 (h!14054 (_ BitVec 64)) (t!19269 List!13010)) )
))
(declare-fun acc!681 () List!13010)

(declare-fun contains!3662 (List!13010 (_ BitVec 64)) Bool)

(assert (=> b!691652 (= e!393650 (not (contains!3662 acc!681 k!2843)))))

(declare-fun b!691653 () Bool)

(declare-fun res!455908 () Bool)

(assert (=> b!691653 (=> (not res!455908) (not e!393651))))

(assert (=> b!691653 (= res!455908 (not (contains!3662 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691654 () Bool)

(declare-fun res!455907 () Bool)

(assert (=> b!691654 (=> (not res!455907) (not e!393651))))

(declare-fun arrayNoDuplicates!0 (array!39793 (_ BitVec 32) List!13010) Bool)

(assert (=> b!691654 (= res!455907 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13007))))

(declare-fun res!455915 () Bool)

(assert (=> start!61834 (=> (not res!455915) (not e!393651))))

(assert (=> start!61834 (= res!455915 (and (bvslt (size!19445 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19445 a!3626))))))

(assert (=> start!61834 e!393651))

(assert (=> start!61834 true))

(declare-fun array_inv!14921 (array!39793) Bool)

(assert (=> start!61834 (array_inv!14921 a!3626)))

(declare-fun b!691655 () Bool)

(declare-fun res!455905 () Bool)

(assert (=> b!691655 (=> (not res!455905) (not e!393651))))

(declare-fun e!393647 () Bool)

(assert (=> b!691655 (= res!455905 e!393647)))

(declare-fun res!455910 () Bool)

(assert (=> b!691655 (=> res!455910 e!393647)))

(declare-fun e!393649 () Bool)

(assert (=> b!691655 (= res!455910 e!393649)))

(declare-fun res!455916 () Bool)

(assert (=> b!691655 (=> (not res!455916) (not e!393649))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691655 (= res!455916 (bvsgt from!3004 i!1382))))

(declare-fun b!691656 () Bool)

(declare-fun res!455917 () Bool)

(assert (=> b!691656 (=> (not res!455917) (not e!393651))))

(assert (=> b!691656 (= res!455917 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691657 () Bool)

(declare-fun res!455913 () Bool)

(assert (=> b!691657 (=> (not res!455913) (not e!393651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691657 (= res!455913 (validKeyInArray!0 k!2843))))

(declare-fun b!691658 () Bool)

(declare-fun res!455914 () Bool)

(assert (=> b!691658 (=> (not res!455914) (not e!393651))))

(assert (=> b!691658 (= res!455914 (validKeyInArray!0 (select (arr!19062 a!3626) from!3004)))))

(declare-fun b!691659 () Bool)

(declare-fun Unit!24367 () Unit!24365)

(assert (=> b!691659 (= e!393648 Unit!24367)))

(assert (=> b!691659 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316566 () Unit!24365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39793 (_ BitVec 64) (_ BitVec 32)) Unit!24365)

(assert (=> b!691659 (= lt!316566 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691659 false))

(declare-fun b!691660 () Bool)

(declare-fun res!455906 () Bool)

(assert (=> b!691660 (=> (not res!455906) (not e!393651))))

(assert (=> b!691660 (= res!455906 (not (contains!3662 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691661 () Bool)

(declare-fun res!455909 () Bool)

(assert (=> b!691661 (=> (not res!455909) (not e!393651))))

(assert (=> b!691661 (= res!455909 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19445 a!3626))))))

(declare-fun b!691662 () Bool)

(declare-fun res!455904 () Bool)

(assert (=> b!691662 (=> (not res!455904) (not e!393651))))

(declare-fun noDuplicate!936 (List!13010) Bool)

(assert (=> b!691662 (= res!455904 (noDuplicate!936 acc!681))))

(declare-fun b!691663 () Bool)

(assert (=> b!691663 (= e!393649 (contains!3662 acc!681 k!2843))))

(declare-fun b!691664 () Bool)

(declare-fun res!455903 () Bool)

(assert (=> b!691664 (=> (not res!455903) (not e!393651))))

(assert (=> b!691664 (= res!455903 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19445 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691665 () Bool)

(assert (=> b!691665 (= e!393647 e!393650)))

(declare-fun res!455912 () Bool)

(assert (=> b!691665 (=> (not res!455912) (not e!393650))))

(assert (=> b!691665 (= res!455912 (bvsle from!3004 i!1382))))

(declare-fun b!691666 () Bool)

(declare-fun Unit!24368 () Unit!24365)

(assert (=> b!691666 (= e!393648 Unit!24368)))

(assert (= (and start!61834 res!455915) b!691662))

(assert (= (and b!691662 res!455904) b!691660))

(assert (= (and b!691660 res!455906) b!691653))

(assert (= (and b!691653 res!455908) b!691655))

(assert (= (and b!691655 res!455916) b!691663))

(assert (= (and b!691655 (not res!455910)) b!691665))

(assert (= (and b!691665 res!455912) b!691652))

(assert (= (and b!691655 res!455905) b!691654))

(assert (= (and b!691654 res!455907) b!691656))

(assert (= (and b!691656 res!455917) b!691661))

(assert (= (and b!691661 res!455909) b!691657))

(assert (= (and b!691657 res!455913) b!691650))

(assert (= (and b!691650 res!455911) b!691664))

(assert (= (and b!691664 res!455903) b!691658))

(assert (= (and b!691658 res!455914) b!691651))

(assert (= (and b!691651 c!78242) b!691659))

(assert (= (and b!691651 (not c!78242)) b!691666))

(declare-fun m!655157 () Bool)

(assert (=> b!691653 m!655157))

(declare-fun m!655159 () Bool)

(assert (=> b!691660 m!655159))

(declare-fun m!655161 () Bool)

(assert (=> b!691662 m!655161))

(declare-fun m!655163 () Bool)

(assert (=> b!691659 m!655163))

(declare-fun m!655165 () Bool)

(assert (=> b!691659 m!655165))

(declare-fun m!655167 () Bool)

(assert (=> b!691656 m!655167))

(declare-fun m!655169 () Bool)

(assert (=> b!691651 m!655169))

(declare-fun m!655171 () Bool)

(assert (=> b!691657 m!655171))

(declare-fun m!655173 () Bool)

(assert (=> b!691650 m!655173))

(declare-fun m!655175 () Bool)

(assert (=> start!61834 m!655175))

(assert (=> b!691658 m!655169))

(assert (=> b!691658 m!655169))

(declare-fun m!655177 () Bool)

(assert (=> b!691658 m!655177))

(declare-fun m!655179 () Bool)

(assert (=> b!691663 m!655179))

(declare-fun m!655181 () Bool)

(assert (=> b!691654 m!655181))

(assert (=> b!691652 m!655179))

(push 1)

(assert (not b!691659))

(assert (not b!691652))

(assert (not b!691650))

(assert (not b!691660))

(assert (not b!691657))

(assert (not b!691662))

(assert (not b!691653))

(assert (not b!691663))

(assert (not start!61834))

(assert (not b!691656))

(assert (not b!691658))

(assert (not b!691654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

