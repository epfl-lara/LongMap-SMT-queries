; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102204 () Bool)

(assert start!102204)

(declare-fun b!1228846 () Bool)

(declare-fun res!816685 () Bool)

(declare-fun e!697844 () Bool)

(assert (=> b!1228846 (=> (not res!816685) (not e!697844))))

(declare-datatypes ((array!79277 0))(
  ( (array!79278 (arr!38255 (Array (_ BitVec 32) (_ BitVec 64))) (size!38792 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79277)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228846 (= res!816685 (validKeyInArray!0 (select (arr!38255 a!3806) from!3184)))))

(declare-fun b!1228847 () Bool)

(declare-fun res!816688 () Bool)

(declare-fun e!697842 () Bool)

(assert (=> b!1228847 (=> res!816688 e!697842)))

(declare-datatypes ((List!27041 0))(
  ( (Nil!27038) (Cons!27037 (h!28255 (_ BitVec 64)) (t!40496 List!27041)) )
))
(declare-fun acc!823 () List!27041)

(declare-fun subseq!482 (List!27041 List!27041) Bool)

(assert (=> b!1228847 (= res!816688 (not (subseq!482 Nil!27038 acc!823)))))

(declare-fun b!1228848 () Bool)

(declare-fun res!816686 () Bool)

(assert (=> b!1228848 (=> (not res!816686) (not e!697844))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228848 (= res!816686 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228850 () Bool)

(declare-fun res!816680 () Bool)

(assert (=> b!1228850 (=> (not res!816680) (not e!697844))))

(declare-fun noDuplicate!1693 (List!27041) Bool)

(assert (=> b!1228850 (= res!816680 (noDuplicate!1693 acc!823))))

(declare-fun b!1228851 () Bool)

(declare-fun res!816677 () Bool)

(assert (=> b!1228851 (=> (not res!816677) (not e!697844))))

(assert (=> b!1228851 (= res!816677 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228852 () Bool)

(assert (=> b!1228852 (= e!697844 (not e!697842))))

(declare-fun res!816681 () Bool)

(assert (=> b!1228852 (=> res!816681 e!697842)))

(assert (=> b!1228852 (= res!816681 (bvsgt from!3184 (size!38792 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79277 (_ BitVec 32) List!27041) Bool)

(assert (=> b!1228852 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27037 (select (arr!38255 a!3806) from!3184) acc!823))))

(declare-fun b!1228853 () Bool)

(declare-fun res!816687 () Bool)

(assert (=> b!1228853 (=> res!816687 e!697842)))

(declare-fun contains!7112 (List!27041 (_ BitVec 64)) Bool)

(assert (=> b!1228853 (= res!816687 (contains!7112 Nil!27038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228854 () Bool)

(declare-fun res!816678 () Bool)

(assert (=> b!1228854 (=> (not res!816678) (not e!697844))))

(assert (=> b!1228854 (= res!816678 (not (contains!7112 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228855 () Bool)

(assert (=> b!1228855 (= e!697842 true)))

(declare-datatypes ((Unit!40625 0))(
  ( (Unit!40626) )
))
(declare-fun lt!559404 () Unit!40625)

(declare-fun noDuplicateSubseq!35 (List!27041 List!27041) Unit!40625)

(assert (=> b!1228855 (= lt!559404 (noDuplicateSubseq!35 Nil!27038 acc!823))))

(declare-fun b!1228856 () Bool)

(declare-fun res!816679 () Bool)

(assert (=> b!1228856 (=> (not res!816679) (not e!697844))))

(assert (=> b!1228856 (= res!816679 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38792 a!3806)) (bvslt from!3184 (size!38792 a!3806))))))

(declare-fun b!1228857 () Bool)

(declare-fun res!816684 () Bool)

(assert (=> b!1228857 (=> (not res!816684) (not e!697844))))

(assert (=> b!1228857 (= res!816684 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228858 () Bool)

(declare-fun res!816689 () Bool)

(assert (=> b!1228858 (=> res!816689 e!697842)))

(assert (=> b!1228858 (= res!816689 (contains!7112 Nil!27038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!816683 () Bool)

(assert (=> start!102204 (=> (not res!816683) (not e!697844))))

(assert (=> start!102204 (= res!816683 (bvslt (size!38792 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102204 e!697844))

(declare-fun array_inv!29193 (array!79277) Bool)

(assert (=> start!102204 (array_inv!29193 a!3806)))

(assert (=> start!102204 true))

(declare-fun b!1228849 () Bool)

(declare-fun res!816682 () Bool)

(assert (=> b!1228849 (=> (not res!816682) (not e!697844))))

(assert (=> b!1228849 (= res!816682 (not (contains!7112 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102204 res!816683) b!1228851))

(assert (= (and b!1228851 res!816677) b!1228856))

(assert (= (and b!1228856 res!816679) b!1228850))

(assert (= (and b!1228850 res!816680) b!1228854))

(assert (= (and b!1228854 res!816678) b!1228849))

(assert (= (and b!1228849 res!816682) b!1228848))

(assert (= (and b!1228848 res!816686) b!1228857))

(assert (= (and b!1228857 res!816684) b!1228846))

(assert (= (and b!1228846 res!816685) b!1228852))

(assert (= (and b!1228852 (not res!816681)) b!1228858))

(assert (= (and b!1228858 (not res!816689)) b!1228853))

(assert (= (and b!1228853 (not res!816687)) b!1228847))

(assert (= (and b!1228847 (not res!816688)) b!1228855))

(declare-fun m!1133901 () Bool)

(assert (=> b!1228851 m!1133901))

(declare-fun m!1133903 () Bool)

(assert (=> b!1228857 m!1133903))

(declare-fun m!1133905 () Bool)

(assert (=> b!1228853 m!1133905))

(declare-fun m!1133907 () Bool)

(assert (=> b!1228858 m!1133907))

(declare-fun m!1133909 () Bool)

(assert (=> b!1228852 m!1133909))

(declare-fun m!1133911 () Bool)

(assert (=> b!1228852 m!1133911))

(declare-fun m!1133913 () Bool)

(assert (=> b!1228855 m!1133913))

(declare-fun m!1133915 () Bool)

(assert (=> start!102204 m!1133915))

(declare-fun m!1133917 () Bool)

(assert (=> b!1228848 m!1133917))

(declare-fun m!1133919 () Bool)

(assert (=> b!1228849 m!1133919))

(declare-fun m!1133921 () Bool)

(assert (=> b!1228850 m!1133921))

(assert (=> b!1228846 m!1133909))

(assert (=> b!1228846 m!1133909))

(declare-fun m!1133923 () Bool)

(assert (=> b!1228846 m!1133923))

(declare-fun m!1133925 () Bool)

(assert (=> b!1228854 m!1133925))

(declare-fun m!1133927 () Bool)

(assert (=> b!1228847 m!1133927))

(check-sat (not b!1228850) (not b!1228853) (not b!1228852) (not b!1228857) (not b!1228847) (not b!1228854) (not b!1228858) (not b!1228848) (not b!1228851) (not b!1228855) (not b!1228849) (not start!102204) (not b!1228846))
(check-sat)
