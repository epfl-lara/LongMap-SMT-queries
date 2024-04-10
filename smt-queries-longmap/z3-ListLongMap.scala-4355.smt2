; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60160 () Bool)

(assert start!60160)

(declare-fun b!671872 () Bool)

(declare-fun e!383910 () Bool)

(declare-datatypes ((List!12837 0))(
  ( (Nil!12834) (Cons!12833 (h!13878 (_ BitVec 64)) (t!19065 List!12837)) )
))
(declare-fun acc!681 () List!12837)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3414 (List!12837 (_ BitVec 64)) Bool)

(assert (=> b!671872 (= e!383910 (not (contains!3414 acc!681 k0!2843)))))

(declare-fun b!671873 () Bool)

(declare-fun e!383906 () Bool)

(assert (=> b!671873 (= e!383906 false)))

(declare-datatypes ((array!39207 0))(
  ( (array!39208 (arr!18796 (Array (_ BitVec 32) (_ BitVec 64))) (size!19160 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39207)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!312226 () Bool)

(declare-fun lt!312224 () List!12837)

(declare-fun arrayNoDuplicates!0 (array!39207 (_ BitVec 32) List!12837) Bool)

(assert (=> b!671873 (= lt!312226 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312224))))

(declare-fun b!671875 () Bool)

(declare-fun res!438543 () Bool)

(declare-fun e!383903 () Bool)

(assert (=> b!671875 (=> (not res!438543) (not e!383903))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671875 (= res!438543 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19160 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671876 () Bool)

(declare-fun res!438549 () Bool)

(assert (=> b!671876 (=> (not res!438549) (not e!383906))))

(assert (=> b!671876 (= res!438549 (not (contains!3414 lt!312224 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671877 () Bool)

(declare-fun e!383905 () Bool)

(declare-fun e!383909 () Bool)

(assert (=> b!671877 (= e!383905 e!383909)))

(declare-fun res!438562 () Bool)

(assert (=> b!671877 (=> (not res!438562) (not e!383909))))

(assert (=> b!671877 (= res!438562 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671878 () Bool)

(declare-fun res!438557 () Bool)

(assert (=> b!671878 (=> (not res!438557) (not e!383903))))

(declare-fun e!383904 () Bool)

(assert (=> b!671878 (= res!438557 e!383904)))

(declare-fun res!438563 () Bool)

(assert (=> b!671878 (=> res!438563 e!383904)))

(declare-fun e!383900 () Bool)

(assert (=> b!671878 (= res!438563 e!383900)))

(declare-fun res!438558 () Bool)

(assert (=> b!671878 (=> (not res!438558) (not e!383900))))

(assert (=> b!671878 (= res!438558 (bvsgt from!3004 i!1382))))

(declare-fun b!671879 () Bool)

(assert (=> b!671879 (= e!383900 (contains!3414 acc!681 k0!2843))))

(declare-fun b!671880 () Bool)

(assert (=> b!671880 (= e!383904 e!383910)))

(declare-fun res!438555 () Bool)

(assert (=> b!671880 (=> (not res!438555) (not e!383910))))

(assert (=> b!671880 (= res!438555 (bvsle from!3004 i!1382))))

(declare-fun b!671881 () Bool)

(declare-fun e!383901 () Bool)

(assert (=> b!671881 (= e!383903 e!383901)))

(declare-fun res!438540 () Bool)

(assert (=> b!671881 (=> (not res!438540) (not e!383901))))

(assert (=> b!671881 (= res!438540 (not (= (select (arr!18796 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23596 0))(
  ( (Unit!23597) )
))
(declare-fun lt!312223 () Unit!23596)

(declare-fun e!383908 () Unit!23596)

(assert (=> b!671881 (= lt!312223 e!383908)))

(declare-fun c!77033 () Bool)

(assert (=> b!671881 (= c!77033 (= (select (arr!18796 a!3626) from!3004) k0!2843))))

(declare-fun b!671882 () Bool)

(declare-fun Unit!23598 () Unit!23596)

(assert (=> b!671882 (= e!383908 Unit!23598)))

(declare-fun arrayContainsKey!0 (array!39207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671882 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312225 () Unit!23596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39207 (_ BitVec 64) (_ BitVec 32)) Unit!23596)

(assert (=> b!671882 (= lt!312225 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671882 false))

(declare-fun b!671883 () Bool)

(declare-fun res!438541 () Bool)

(assert (=> b!671883 (=> (not res!438541) (not e!383903))))

(assert (=> b!671883 (= res!438541 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19160 a!3626))))))

(declare-fun b!671884 () Bool)

(declare-fun res!438560 () Bool)

(assert (=> b!671884 (=> (not res!438560) (not e!383906))))

(assert (=> b!671884 (= res!438560 (not (contains!3414 lt!312224 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671885 () Bool)

(declare-fun res!438561 () Bool)

(assert (=> b!671885 (=> (not res!438561) (not e!383903))))

(declare-fun noDuplicate!661 (List!12837) Bool)

(assert (=> b!671885 (= res!438561 (noDuplicate!661 acc!681))))

(declare-fun res!438553 () Bool)

(assert (=> start!60160 (=> (not res!438553) (not e!383903))))

(assert (=> start!60160 (= res!438553 (and (bvslt (size!19160 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19160 a!3626))))))

(assert (=> start!60160 e!383903))

(assert (=> start!60160 true))

(declare-fun array_inv!14592 (array!39207) Bool)

(assert (=> start!60160 (array_inv!14592 a!3626)))

(declare-fun b!671874 () Bool)

(declare-fun res!438554 () Bool)

(assert (=> b!671874 (=> (not res!438554) (not e!383903))))

(assert (=> b!671874 (= res!438554 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671886 () Bool)

(declare-fun e!383902 () Bool)

(assert (=> b!671886 (= e!383902 (contains!3414 lt!312224 k0!2843))))

(declare-fun b!671887 () Bool)

(declare-fun res!438551 () Bool)

(assert (=> b!671887 (=> (not res!438551) (not e!383903))))

(assert (=> b!671887 (= res!438551 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12834))))

(declare-fun b!671888 () Bool)

(declare-fun res!438547 () Bool)

(assert (=> b!671888 (=> (not res!438547) (not e!383903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671888 (= res!438547 (validKeyInArray!0 (select (arr!18796 a!3626) from!3004)))))

(declare-fun b!671889 () Bool)

(declare-fun res!438550 () Bool)

(assert (=> b!671889 (=> (not res!438550) (not e!383903))))

(assert (=> b!671889 (= res!438550 (validKeyInArray!0 k0!2843))))

(declare-fun b!671890 () Bool)

(declare-fun res!438556 () Bool)

(assert (=> b!671890 (=> (not res!438556) (not e!383903))))

(assert (=> b!671890 (= res!438556 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671891 () Bool)

(assert (=> b!671891 (= e!383909 (not (contains!3414 lt!312224 k0!2843)))))

(declare-fun b!671892 () Bool)

(declare-fun res!438559 () Bool)

(assert (=> b!671892 (=> (not res!438559) (not e!383903))))

(assert (=> b!671892 (= res!438559 (not (contains!3414 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671893 () Bool)

(declare-fun res!438544 () Bool)

(assert (=> b!671893 (=> (not res!438544) (not e!383906))))

(assert (=> b!671893 (= res!438544 e!383905)))

(declare-fun res!438548 () Bool)

(assert (=> b!671893 (=> res!438548 e!383905)))

(assert (=> b!671893 (= res!438548 e!383902)))

(declare-fun res!438542 () Bool)

(assert (=> b!671893 (=> (not res!438542) (not e!383902))))

(assert (=> b!671893 (= res!438542 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671894 () Bool)

(declare-fun res!438552 () Bool)

(assert (=> b!671894 (=> (not res!438552) (not e!383903))))

(assert (=> b!671894 (= res!438552 (not (contains!3414 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671895 () Bool)

(declare-fun Unit!23599 () Unit!23596)

(assert (=> b!671895 (= e!383908 Unit!23599)))

(declare-fun b!671896 () Bool)

(assert (=> b!671896 (= e!383901 e!383906)))

(declare-fun res!438545 () Bool)

(assert (=> b!671896 (=> (not res!438545) (not e!383906))))

(assert (=> b!671896 (= res!438545 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!264 (List!12837 (_ BitVec 64)) List!12837)

(assert (=> b!671896 (= lt!312224 ($colon$colon!264 acc!681 (select (arr!18796 a!3626) from!3004)))))

(declare-fun b!671897 () Bool)

(declare-fun res!438546 () Bool)

(assert (=> b!671897 (=> (not res!438546) (not e!383906))))

(assert (=> b!671897 (= res!438546 (noDuplicate!661 lt!312224))))

(assert (= (and start!60160 res!438553) b!671885))

(assert (= (and b!671885 res!438561) b!671894))

(assert (= (and b!671894 res!438552) b!671892))

(assert (= (and b!671892 res!438559) b!671878))

(assert (= (and b!671878 res!438558) b!671879))

(assert (= (and b!671878 (not res!438563)) b!671880))

(assert (= (and b!671880 res!438555) b!671872))

(assert (= (and b!671878 res!438557) b!671887))

(assert (= (and b!671887 res!438551) b!671890))

(assert (= (and b!671890 res!438556) b!671883))

(assert (= (and b!671883 res!438541) b!671889))

(assert (= (and b!671889 res!438550) b!671874))

(assert (= (and b!671874 res!438554) b!671875))

(assert (= (and b!671875 res!438543) b!671888))

(assert (= (and b!671888 res!438547) b!671881))

(assert (= (and b!671881 c!77033) b!671882))

(assert (= (and b!671881 (not c!77033)) b!671895))

(assert (= (and b!671881 res!438540) b!671896))

(assert (= (and b!671896 res!438545) b!671897))

(assert (= (and b!671897 res!438546) b!671876))

(assert (= (and b!671876 res!438549) b!671884))

(assert (= (and b!671884 res!438560) b!671893))

(assert (= (and b!671893 res!438542) b!671886))

(assert (= (and b!671893 (not res!438548)) b!671877))

(assert (= (and b!671877 res!438562) b!671891))

(assert (= (and b!671893 res!438544) b!671873))

(declare-fun m!641125 () Bool)

(assert (=> b!671886 m!641125))

(assert (=> b!671891 m!641125))

(declare-fun m!641127 () Bool)

(assert (=> b!671882 m!641127))

(declare-fun m!641129 () Bool)

(assert (=> b!671882 m!641129))

(declare-fun m!641131 () Bool)

(assert (=> b!671888 m!641131))

(assert (=> b!671888 m!641131))

(declare-fun m!641133 () Bool)

(assert (=> b!671888 m!641133))

(declare-fun m!641135 () Bool)

(assert (=> b!671890 m!641135))

(declare-fun m!641137 () Bool)

(assert (=> b!671873 m!641137))

(declare-fun m!641139 () Bool)

(assert (=> b!671879 m!641139))

(declare-fun m!641141 () Bool)

(assert (=> b!671884 m!641141))

(assert (=> b!671896 m!641131))

(assert (=> b!671896 m!641131))

(declare-fun m!641143 () Bool)

(assert (=> b!671896 m!641143))

(declare-fun m!641145 () Bool)

(assert (=> b!671889 m!641145))

(declare-fun m!641147 () Bool)

(assert (=> b!671874 m!641147))

(declare-fun m!641149 () Bool)

(assert (=> start!60160 m!641149))

(declare-fun m!641151 () Bool)

(assert (=> b!671887 m!641151))

(declare-fun m!641153 () Bool)

(assert (=> b!671876 m!641153))

(assert (=> b!671881 m!641131))

(declare-fun m!641155 () Bool)

(assert (=> b!671892 m!641155))

(declare-fun m!641157 () Bool)

(assert (=> b!671894 m!641157))

(assert (=> b!671872 m!641139))

(declare-fun m!641159 () Bool)

(assert (=> b!671897 m!641159))

(declare-fun m!641161 () Bool)

(assert (=> b!671885 m!641161))

(check-sat (not start!60160) (not b!671885) (not b!671896) (not b!671894) (not b!671884) (not b!671882) (not b!671873) (not b!671879) (not b!671888) (not b!671890) (not b!671876) (not b!671887) (not b!671886) (not b!671872) (not b!671891) (not b!671897) (not b!671889) (not b!671874) (not b!671892))
(check-sat)
