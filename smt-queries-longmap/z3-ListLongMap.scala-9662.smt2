; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114110 () Bool)

(assert start!114110)

(declare-fun b!1355116 () Bool)

(declare-fun res!900133 () Bool)

(declare-fun e!769628 () Bool)

(assert (=> b!1355116 (=> (not res!900133) (not e!769628))))

(declare-datatypes ((List!31688 0))(
  ( (Nil!31685) (Cons!31684 (h!32893 (_ BitVec 64)) (t!46338 List!31688)) )
))
(declare-fun acc!759 () List!31688)

(declare-fun noDuplicate!2223 (List!31688) Bool)

(assert (=> b!1355116 (= res!900133 (noDuplicate!2223 acc!759))))

(declare-fun b!1355117 () Bool)

(declare-datatypes ((Unit!44364 0))(
  ( (Unit!44365) )
))
(declare-fun e!769630 () Unit!44364)

(declare-fun lt!598342 () Unit!44364)

(assert (=> b!1355117 (= e!769630 lt!598342)))

(declare-fun lt!598340 () Unit!44364)

(declare-fun lemmaListSubSeqRefl!0 (List!31688) Unit!44364)

(assert (=> b!1355117 (= lt!598340 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!764 (List!31688 List!31688) Bool)

(assert (=> b!1355117 (subseq!764 acc!759 acc!759)))

(declare-datatypes ((array!92241 0))(
  ( (array!92242 (arr!44569 (Array (_ BitVec 32) (_ BitVec 64))) (size!45121 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92241)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92241 List!31688 List!31688 (_ BitVec 32)) Unit!44364)

(declare-fun $colon$colon!781 (List!31688 (_ BitVec 64)) List!31688)

(assert (=> b!1355117 (= lt!598342 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!781 acc!759 (select (arr!44569 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92241 (_ BitVec 32) List!31688) Bool)

(assert (=> b!1355117 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355118 () Bool)

(declare-fun res!900129 () Bool)

(assert (=> b!1355118 (=> (not res!900129) (not e!769628))))

(declare-fun contains!9308 (List!31688 (_ BitVec 64)) Bool)

(assert (=> b!1355118 (= res!900129 (not (contains!9308 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355119 () Bool)

(declare-fun e!769627 () Bool)

(assert (=> b!1355119 (= e!769627 false)))

(declare-fun lt!598339 () Bool)

(assert (=> b!1355119 (= lt!598339 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355120 () Bool)

(declare-fun res!900125 () Bool)

(assert (=> b!1355120 (=> (not res!900125) (not e!769628))))

(assert (=> b!1355120 (= res!900125 (not (contains!9308 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355121 () Bool)

(declare-fun res!900128 () Bool)

(assert (=> b!1355121 (=> (not res!900128) (not e!769628))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355121 (= res!900128 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355122 () Bool)

(declare-fun res!900132 () Bool)

(assert (=> b!1355122 (=> (not res!900132) (not e!769628))))

(assert (=> b!1355122 (= res!900132 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45121 a!3742)))))

(declare-fun b!1355123 () Bool)

(declare-fun Unit!44366 () Unit!44364)

(assert (=> b!1355123 (= e!769630 Unit!44366)))

(declare-fun b!1355124 () Bool)

(assert (=> b!1355124 (= e!769628 e!769627)))

(declare-fun res!900130 () Bool)

(assert (=> b!1355124 (=> (not res!900130) (not e!769627))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598338 () Bool)

(assert (=> b!1355124 (= res!900130 (and (not (= from!3120 i!1404)) (not lt!598338) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598341 () Unit!44364)

(assert (=> b!1355124 (= lt!598341 e!769630)))

(declare-fun c!126938 () Bool)

(assert (=> b!1355124 (= c!126938 lt!598338)))

(assert (=> b!1355124 (= lt!598338 (validKeyInArray!0 (select (arr!44569 a!3742) from!3120)))))

(declare-fun b!1355126 () Bool)

(declare-fun res!900127 () Bool)

(assert (=> b!1355126 (=> (not res!900127) (not e!769628))))

(assert (=> b!1355126 (= res!900127 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45121 a!3742))))))

(declare-fun b!1355127 () Bool)

(declare-fun res!900134 () Bool)

(assert (=> b!1355127 (=> (not res!900134) (not e!769628))))

(assert (=> b!1355127 (= res!900134 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!900131 () Bool)

(assert (=> start!114110 (=> (not res!900131) (not e!769628))))

(assert (=> start!114110 (= res!900131 (and (bvslt (size!45121 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45121 a!3742))))))

(assert (=> start!114110 e!769628))

(assert (=> start!114110 true))

(declare-fun array_inv!33802 (array!92241) Bool)

(assert (=> start!114110 (array_inv!33802 a!3742)))

(declare-fun b!1355125 () Bool)

(declare-fun res!900126 () Bool)

(assert (=> b!1355125 (=> (not res!900126) (not e!769628))))

(assert (=> b!1355125 (= res!900126 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31685))))

(assert (= (and start!114110 res!900131) b!1355116))

(assert (= (and b!1355116 res!900133) b!1355120))

(assert (= (and b!1355120 res!900125) b!1355118))

(assert (= (and b!1355118 res!900129) b!1355125))

(assert (= (and b!1355125 res!900126) b!1355127))

(assert (= (and b!1355127 res!900134) b!1355126))

(assert (= (and b!1355126 res!900127) b!1355121))

(assert (= (and b!1355121 res!900128) b!1355122))

(assert (= (and b!1355122 res!900132) b!1355124))

(assert (= (and b!1355124 c!126938) b!1355117))

(assert (= (and b!1355124 (not c!126938)) b!1355123))

(assert (= (and b!1355124 res!900130) b!1355119))

(declare-fun m!1240909 () Bool)

(assert (=> b!1355127 m!1240909))

(declare-fun m!1240911 () Bool)

(assert (=> b!1355119 m!1240911))

(declare-fun m!1240913 () Bool)

(assert (=> b!1355125 m!1240913))

(declare-fun m!1240915 () Bool)

(assert (=> b!1355124 m!1240915))

(assert (=> b!1355124 m!1240915))

(declare-fun m!1240917 () Bool)

(assert (=> b!1355124 m!1240917))

(declare-fun m!1240919 () Bool)

(assert (=> b!1355116 m!1240919))

(declare-fun m!1240921 () Bool)

(assert (=> b!1355118 m!1240921))

(declare-fun m!1240923 () Bool)

(assert (=> b!1355117 m!1240923))

(assert (=> b!1355117 m!1240915))

(declare-fun m!1240925 () Bool)

(assert (=> b!1355117 m!1240925))

(declare-fun m!1240927 () Bool)

(assert (=> b!1355117 m!1240927))

(assert (=> b!1355117 m!1240911))

(assert (=> b!1355117 m!1240915))

(assert (=> b!1355117 m!1240925))

(declare-fun m!1240929 () Bool)

(assert (=> b!1355117 m!1240929))

(declare-fun m!1240931 () Bool)

(assert (=> b!1355121 m!1240931))

(declare-fun m!1240933 () Bool)

(assert (=> b!1355120 m!1240933))

(declare-fun m!1240935 () Bool)

(assert (=> start!114110 m!1240935))

(check-sat (not b!1355125) (not b!1355117) (not b!1355127) (not b!1355116) (not b!1355124) (not b!1355121) (not b!1355120) (not b!1355118) (not start!114110) (not b!1355119))
(check-sat)
