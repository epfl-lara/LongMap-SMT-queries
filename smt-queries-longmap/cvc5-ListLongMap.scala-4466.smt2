; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62144 () Bool)

(assert start!62144)

(declare-fun b!695843 () Bool)

(declare-fun res!459801 () Bool)

(declare-fun e!395748 () Bool)

(assert (=> b!695843 (=> (not res!459801) (not e!395748))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!695843 (= res!459801 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!695844 () Bool)

(declare-fun e!395746 () Bool)

(declare-datatypes ((List!13169 0))(
  ( (Nil!13166) (Cons!13165 (h!14210 (_ BitVec 64)) (t!19451 List!13169)) )
))
(declare-fun acc!681 () List!13169)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3746 (List!13169 (_ BitVec 64)) Bool)

(assert (=> b!695844 (= e!395746 (contains!3746 acc!681 k!2843))))

(declare-fun b!695845 () Bool)

(declare-fun e!395749 () Bool)

(assert (=> b!695845 (= e!395748 e!395749)))

(declare-fun res!459796 () Bool)

(assert (=> b!695845 (=> res!459796 e!395749)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695845 (= res!459796 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695846 () Bool)

(declare-fun e!395751 () Bool)

(assert (=> b!695846 (= e!395751 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!695847 () Bool)

(declare-fun res!459797 () Bool)

(assert (=> b!695847 (=> (not res!459797) (not e!395748))))

(declare-fun e!395745 () Bool)

(assert (=> b!695847 (= res!459797 e!395745)))

(declare-fun res!459798 () Bool)

(assert (=> b!695847 (=> res!459798 e!395745)))

(assert (=> b!695847 (= res!459798 e!395746)))

(declare-fun res!459795 () Bool)

(assert (=> b!695847 (=> (not res!459795) (not e!395746))))

(assert (=> b!695847 (= res!459795 (bvsgt from!3004 i!1382))))

(declare-fun b!695848 () Bool)

(assert (=> b!695848 (= e!395745 e!395751)))

(declare-fun res!459809 () Bool)

(assert (=> b!695848 (=> (not res!459809) (not e!395751))))

(assert (=> b!695848 (= res!459809 (bvsle from!3004 i!1382))))

(declare-fun b!695849 () Bool)

(declare-fun e!395750 () Bool)

(assert (=> b!695849 (= e!395750 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!695850 () Bool)

(declare-fun res!459806 () Bool)

(assert (=> b!695850 (=> (not res!459806) (not e!395748))))

(assert (=> b!695850 (= res!459806 e!395750)))

(declare-fun res!459793 () Bool)

(assert (=> b!695850 (=> res!459793 e!395750)))

(assert (=> b!695850 (= res!459793 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695851 () Bool)

(declare-fun res!459791 () Bool)

(assert (=> b!695851 (=> (not res!459791) (not e!395748))))

(declare-datatypes ((array!39934 0))(
  ( (array!39935 (arr!19128 (Array (_ BitVec 32) (_ BitVec 64))) (size!19513 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39934)

(assert (=> b!695851 (= res!459791 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19513 a!3626))))))

(declare-fun b!695852 () Bool)

(declare-fun res!459803 () Bool)

(assert (=> b!695852 (=> (not res!459803) (not e!395748))))

(assert (=> b!695852 (= res!459803 (not (contains!3746 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!459808 () Bool)

(assert (=> start!62144 (=> (not res!459808) (not e!395748))))

(assert (=> start!62144 (= res!459808 (and (bvslt (size!19513 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19513 a!3626))))))

(assert (=> start!62144 e!395748))

(assert (=> start!62144 true))

(declare-fun array_inv!14924 (array!39934) Bool)

(assert (=> start!62144 (array_inv!14924 a!3626)))

(declare-fun b!695853 () Bool)

(declare-fun res!459792 () Bool)

(assert (=> b!695853 (=> (not res!459792) (not e!395748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!695853 (= res!459792 (validKeyInArray!0 k!2843))))

(declare-fun b!695854 () Bool)

(declare-fun res!459807 () Bool)

(assert (=> b!695854 (=> (not res!459807) (not e!395748))))

(assert (=> b!695854 (= res!459807 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19513 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!695855 () Bool)

(declare-fun res!459799 () Bool)

(assert (=> b!695855 (=> (not res!459799) (not e!395748))))

(assert (=> b!695855 (= res!459799 (not (validKeyInArray!0 (select (arr!19128 a!3626) from!3004))))))

(declare-fun b!695856 () Bool)

(declare-fun res!459804 () Bool)

(assert (=> b!695856 (=> (not res!459804) (not e!395748))))

(declare-fun arrayNoDuplicates!0 (array!39934 (_ BitVec 32) List!13169) Bool)

(assert (=> b!695856 (= res!459804 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695857 () Bool)

(declare-fun res!459800 () Bool)

(assert (=> b!695857 (=> (not res!459800) (not e!395748))))

(declare-fun arrayContainsKey!0 (array!39934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!695857 (= res!459800 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!695858 () Bool)

(declare-fun res!459802 () Bool)

(assert (=> b!695858 (=> (not res!459802) (not e!395748))))

(assert (=> b!695858 (= res!459802 (not (contains!3746 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695859 () Bool)

(assert (=> b!695859 (= e!395749 (contains!3746 acc!681 k!2843))))

(declare-fun b!695860 () Bool)

(declare-fun res!459794 () Bool)

(assert (=> b!695860 (=> (not res!459794) (not e!395748))))

(assert (=> b!695860 (= res!459794 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13166))))

(declare-fun b!695861 () Bool)

(declare-fun res!459805 () Bool)

(assert (=> b!695861 (=> (not res!459805) (not e!395748))))

(declare-fun noDuplicate!993 (List!13169) Bool)

(assert (=> b!695861 (= res!459805 (noDuplicate!993 acc!681))))

(assert (= (and start!62144 res!459808) b!695861))

(assert (= (and b!695861 res!459805) b!695858))

(assert (= (and b!695858 res!459802) b!695852))

(assert (= (and b!695852 res!459803) b!695847))

(assert (= (and b!695847 res!459795) b!695844))

(assert (= (and b!695847 (not res!459798)) b!695848))

(assert (= (and b!695848 res!459809) b!695846))

(assert (= (and b!695847 res!459797) b!695860))

(assert (= (and b!695860 res!459794) b!695856))

(assert (= (and b!695856 res!459804) b!695851))

(assert (= (and b!695851 res!459791) b!695853))

(assert (= (and b!695853 res!459792) b!695857))

(assert (= (and b!695857 res!459800) b!695854))

(assert (= (and b!695854 res!459807) b!695855))

(assert (= (and b!695855 res!459799) b!695843))

(assert (= (and b!695843 res!459801) b!695850))

(assert (= (and b!695850 (not res!459793)) b!695849))

(assert (= (and b!695850 res!459806) b!695845))

(assert (= (and b!695845 (not res!459796)) b!695859))

(declare-fun m!657143 () Bool)

(assert (=> b!695857 m!657143))

(declare-fun m!657145 () Bool)

(assert (=> b!695844 m!657145))

(declare-fun m!657147 () Bool)

(assert (=> b!695858 m!657147))

(declare-fun m!657149 () Bool)

(assert (=> start!62144 m!657149))

(assert (=> b!695849 m!657145))

(declare-fun m!657151 () Bool)

(assert (=> b!695853 m!657151))

(declare-fun m!657153 () Bool)

(assert (=> b!695861 m!657153))

(assert (=> b!695846 m!657145))

(declare-fun m!657155 () Bool)

(assert (=> b!695860 m!657155))

(assert (=> b!695859 m!657145))

(declare-fun m!657157 () Bool)

(assert (=> b!695852 m!657157))

(declare-fun m!657159 () Bool)

(assert (=> b!695855 m!657159))

(assert (=> b!695855 m!657159))

(declare-fun m!657161 () Bool)

(assert (=> b!695855 m!657161))

(declare-fun m!657163 () Bool)

(assert (=> b!695856 m!657163))

(push 1)

(assert (not b!695856))

(assert (not b!695859))

(assert (not b!695846))

(assert (not b!695857))

(assert (not b!695861))

(assert (not b!695855))

(assert (not b!695852))

(assert (not start!62144))

(assert (not b!695860))

(assert (not b!695849))

(assert (not b!695858))

(assert (not b!695853))

(assert (not b!695844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

