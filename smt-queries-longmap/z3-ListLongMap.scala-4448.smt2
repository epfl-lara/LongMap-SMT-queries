; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61792 () Bool)

(assert start!61792)

(declare-fun b!691834 () Bool)

(declare-fun res!456160 () Bool)

(declare-fun e!393652 () Bool)

(assert (=> b!691834 (=> (not res!456160) (not e!393652))))

(declare-datatypes ((array!39813 0))(
  ( (array!39814 (arr!19075 (Array (_ BitVec 32) (_ BitVec 64))) (size!19460 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39813)

(declare-datatypes ((List!13116 0))(
  ( (Nil!13113) (Cons!13112 (h!14157 (_ BitVec 64)) (t!19383 List!13116)) )
))
(declare-fun arrayNoDuplicates!0 (array!39813 (_ BitVec 32) List!13116) Bool)

(assert (=> b!691834 (= res!456160 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13113))))

(declare-fun b!691835 () Bool)

(declare-datatypes ((Unit!24418 0))(
  ( (Unit!24419) )
))
(declare-fun e!393653 () Unit!24418)

(declare-fun Unit!24420 () Unit!24418)

(assert (=> b!691835 (= e!393653 Unit!24420)))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691835 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316512 () Unit!24418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39813 (_ BitVec 64) (_ BitVec 32)) Unit!24418)

(assert (=> b!691835 (= lt!316512 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691835 false))

(declare-fun b!691836 () Bool)

(declare-fun res!456155 () Bool)

(assert (=> b!691836 (=> (not res!456155) (not e!393652))))

(declare-fun acc!681 () List!13116)

(declare-fun contains!3693 (List!13116 (_ BitVec 64)) Bool)

(assert (=> b!691836 (= res!456155 (not (contains!3693 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691837 () Bool)

(declare-fun res!456158 () Bool)

(assert (=> b!691837 (=> (not res!456158) (not e!393652))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691837 (= res!456158 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19460 a!3626))))))

(declare-fun b!691838 () Bool)

(declare-fun res!456159 () Bool)

(assert (=> b!691838 (=> (not res!456159) (not e!393652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691838 (= res!456159 (validKeyInArray!0 k0!2843))))

(declare-fun b!691839 () Bool)

(declare-fun e!393650 () Bool)

(assert (=> b!691839 (= e!393650 (contains!3693 acc!681 k0!2843))))

(declare-fun b!691840 () Bool)

(declare-fun res!456163 () Bool)

(assert (=> b!691840 (=> (not res!456163) (not e!393652))))

(declare-fun noDuplicate!940 (List!13116) Bool)

(assert (=> b!691840 (= res!456163 (noDuplicate!940 acc!681))))

(declare-fun b!691841 () Bool)

(declare-fun e!393654 () Bool)

(declare-fun e!393649 () Bool)

(assert (=> b!691841 (= e!393654 e!393649)))

(declare-fun res!456164 () Bool)

(assert (=> b!691841 (=> (not res!456164) (not e!393649))))

(assert (=> b!691841 (= res!456164 (bvsle from!3004 i!1382))))

(declare-fun res!456152 () Bool)

(assert (=> start!61792 (=> (not res!456152) (not e!393652))))

(assert (=> start!61792 (= res!456152 (and (bvslt (size!19460 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19460 a!3626))))))

(assert (=> start!61792 e!393652))

(assert (=> start!61792 true))

(declare-fun array_inv!14871 (array!39813) Bool)

(assert (=> start!61792 (array_inv!14871 a!3626)))

(declare-fun b!691842 () Bool)

(assert (=> b!691842 (= e!393652 (and (not (= (select (arr!19075 a!3626) from!3004) k0!2843)) (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316513 () Unit!24418)

(assert (=> b!691842 (= lt!316513 e!393653)))

(declare-fun c!78209 () Bool)

(assert (=> b!691842 (= c!78209 (= (select (arr!19075 a!3626) from!3004) k0!2843))))

(declare-fun b!691843 () Bool)

(declare-fun res!456162 () Bool)

(assert (=> b!691843 (=> (not res!456162) (not e!393652))))

(assert (=> b!691843 (= res!456162 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19460 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691844 () Bool)

(assert (=> b!691844 (= e!393649 (not (contains!3693 acc!681 k0!2843)))))

(declare-fun b!691845 () Bool)

(declare-fun Unit!24421 () Unit!24418)

(assert (=> b!691845 (= e!393653 Unit!24421)))

(declare-fun b!691846 () Bool)

(declare-fun res!456150 () Bool)

(assert (=> b!691846 (=> (not res!456150) (not e!393652))))

(assert (=> b!691846 (= res!456150 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691847 () Bool)

(declare-fun res!456153 () Bool)

(assert (=> b!691847 (=> (not res!456153) (not e!393652))))

(assert (=> b!691847 (= res!456153 (not (contains!3693 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691848 () Bool)

(declare-fun res!456151 () Bool)

(assert (=> b!691848 (=> (not res!456151) (not e!393652))))

(assert (=> b!691848 (= res!456151 (validKeyInArray!0 (select (arr!19075 a!3626) from!3004)))))

(declare-fun b!691849 () Bool)

(declare-fun res!456156 () Bool)

(assert (=> b!691849 (=> (not res!456156) (not e!393652))))

(assert (=> b!691849 (= res!456156 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691850 () Bool)

(declare-fun res!456157 () Bool)

(assert (=> b!691850 (=> (not res!456157) (not e!393652))))

(assert (=> b!691850 (= res!456157 e!393654)))

(declare-fun res!456154 () Bool)

(assert (=> b!691850 (=> res!456154 e!393654)))

(assert (=> b!691850 (= res!456154 e!393650)))

(declare-fun res!456161 () Bool)

(assert (=> b!691850 (=> (not res!456161) (not e!393650))))

(assert (=> b!691850 (= res!456161 (bvsgt from!3004 i!1382))))

(assert (= (and start!61792 res!456152) b!691840))

(assert (= (and b!691840 res!456163) b!691847))

(assert (= (and b!691847 res!456153) b!691836))

(assert (= (and b!691836 res!456155) b!691850))

(assert (= (and b!691850 res!456161) b!691839))

(assert (= (and b!691850 (not res!456154)) b!691841))

(assert (= (and b!691841 res!456164) b!691844))

(assert (= (and b!691850 res!456157) b!691834))

(assert (= (and b!691834 res!456160) b!691849))

(assert (= (and b!691849 res!456156) b!691837))

(assert (= (and b!691837 res!456158) b!691838))

(assert (= (and b!691838 res!456159) b!691846))

(assert (= (and b!691846 res!456150) b!691843))

(assert (= (and b!691843 res!456162) b!691848))

(assert (= (and b!691848 res!456151) b!691842))

(assert (= (and b!691842 c!78209) b!691835))

(assert (= (and b!691842 (not c!78209)) b!691845))

(declare-fun m!654667 () Bool)

(assert (=> b!691840 m!654667))

(declare-fun m!654669 () Bool)

(assert (=> start!61792 m!654669))

(declare-fun m!654671 () Bool)

(assert (=> b!691846 m!654671))

(declare-fun m!654673 () Bool)

(assert (=> b!691834 m!654673))

(declare-fun m!654675 () Bool)

(assert (=> b!691836 m!654675))

(declare-fun m!654677 () Bool)

(assert (=> b!691835 m!654677))

(declare-fun m!654679 () Bool)

(assert (=> b!691835 m!654679))

(declare-fun m!654681 () Bool)

(assert (=> b!691839 m!654681))

(declare-fun m!654683 () Bool)

(assert (=> b!691842 m!654683))

(assert (=> b!691848 m!654683))

(assert (=> b!691848 m!654683))

(declare-fun m!654685 () Bool)

(assert (=> b!691848 m!654685))

(declare-fun m!654687 () Bool)

(assert (=> b!691849 m!654687))

(assert (=> b!691844 m!654681))

(declare-fun m!654689 () Bool)

(assert (=> b!691838 m!654689))

(declare-fun m!654691 () Bool)

(assert (=> b!691847 m!654691))

(check-sat (not b!691844) (not b!691834) (not b!691840) (not b!691848) (not b!691839) (not start!61792) (not b!691836) (not b!691849) (not b!691835) (not b!691838) (not b!691846) (not b!691847))
(check-sat)
