; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113948 () Bool)

(assert start!113948)

(declare-fun b!1351660 () Bool)

(declare-fun res!897162 () Bool)

(declare-fun e!768541 () Bool)

(assert (=> b!1351660 (=> (not res!897162) (not e!768541))))

(declare-datatypes ((List!31607 0))(
  ( (Nil!31604) (Cons!31603 (h!32812 (_ BitVec 64)) (t!46257 List!31607)) )
))
(declare-fun acc!759 () List!31607)

(declare-fun contains!9227 (List!31607 (_ BitVec 64)) Bool)

(assert (=> b!1351660 (= res!897162 (not (contains!9227 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351661 () Bool)

(declare-datatypes ((Unit!44121 0))(
  ( (Unit!44122) )
))
(declare-fun e!768538 () Unit!44121)

(declare-fun Unit!44123 () Unit!44121)

(assert (=> b!1351661 (= e!768538 Unit!44123)))

(declare-fun b!1351662 () Bool)

(declare-fun res!897164 () Bool)

(assert (=> b!1351662 (=> (not res!897164) (not e!768541))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351662 (= res!897164 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!897156 () Bool)

(assert (=> start!113948 (=> (not res!897156) (not e!768541))))

(declare-datatypes ((array!92079 0))(
  ( (array!92080 (arr!44488 (Array (_ BitVec 32) (_ BitVec 64))) (size!45040 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92079)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113948 (= res!897156 (and (bvslt (size!45040 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45040 a!3742))))))

(assert (=> start!113948 e!768541))

(assert (=> start!113948 true))

(declare-fun array_inv!33721 (array!92079) Bool)

(assert (=> start!113948 (array_inv!33721 a!3742)))

(declare-fun b!1351663 () Bool)

(declare-fun res!897160 () Bool)

(assert (=> b!1351663 (=> (not res!897160) (not e!768541))))

(declare-fun arrayNoDuplicates!0 (array!92079 (_ BitVec 32) List!31607) Bool)

(assert (=> b!1351663 (= res!897160 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351664 () Bool)

(declare-fun res!897161 () Bool)

(assert (=> b!1351664 (=> (not res!897161) (not e!768541))))

(assert (=> b!1351664 (= res!897161 (not (contains!9227 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351665 () Bool)

(declare-fun res!897159 () Bool)

(assert (=> b!1351665 (=> (not res!897159) (not e!768541))))

(assert (=> b!1351665 (= res!897159 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45040 a!3742)))))

(declare-fun b!1351666 () Bool)

(declare-fun res!897155 () Bool)

(assert (=> b!1351666 (=> (not res!897155) (not e!768541))))

(assert (=> b!1351666 (= res!897155 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31604))))

(declare-fun b!1351667 () Bool)

(declare-fun e!768539 () Bool)

(assert (=> b!1351667 (= e!768539 false)))

(declare-fun lt!597121 () Bool)

(assert (=> b!1351667 (= lt!597121 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351668 () Bool)

(declare-fun lt!597124 () Unit!44121)

(assert (=> b!1351668 (= e!768538 lt!597124)))

(declare-fun lt!597122 () Unit!44121)

(declare-fun lemmaListSubSeqRefl!0 (List!31607) Unit!44121)

(assert (=> b!1351668 (= lt!597122 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!683 (List!31607 List!31607) Bool)

(assert (=> b!1351668 (subseq!683 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92079 List!31607 List!31607 (_ BitVec 32)) Unit!44121)

(declare-fun $colon$colon!700 (List!31607 (_ BitVec 64)) List!31607)

(assert (=> b!1351668 (= lt!597124 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!700 acc!759 (select (arr!44488 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351668 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351669 () Bool)

(assert (=> b!1351669 (= e!768541 e!768539)))

(declare-fun res!897158 () Bool)

(assert (=> b!1351669 (=> (not res!897158) (not e!768539))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351669 (= res!897158 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597123 () Unit!44121)

(assert (=> b!1351669 (= lt!597123 e!768538)))

(declare-fun c!126695 () Bool)

(assert (=> b!1351669 (= c!126695 (validKeyInArray!0 (select (arr!44488 a!3742) from!3120)))))

(declare-fun b!1351670 () Bool)

(declare-fun res!897157 () Bool)

(assert (=> b!1351670 (=> (not res!897157) (not e!768541))))

(declare-fun noDuplicate!2142 (List!31607) Bool)

(assert (=> b!1351670 (= res!897157 (noDuplicate!2142 acc!759))))

(declare-fun b!1351671 () Bool)

(declare-fun res!897163 () Bool)

(assert (=> b!1351671 (=> (not res!897163) (not e!768541))))

(assert (=> b!1351671 (= res!897163 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45040 a!3742))))))

(assert (= (and start!113948 res!897156) b!1351670))

(assert (= (and b!1351670 res!897157) b!1351664))

(assert (= (and b!1351664 res!897161) b!1351660))

(assert (= (and b!1351660 res!897162) b!1351666))

(assert (= (and b!1351666 res!897155) b!1351663))

(assert (= (and b!1351663 res!897160) b!1351671))

(assert (= (and b!1351671 res!897163) b!1351662))

(assert (= (and b!1351662 res!897164) b!1351665))

(assert (= (and b!1351665 res!897159) b!1351669))

(assert (= (and b!1351669 c!126695) b!1351668))

(assert (= (and b!1351669 (not c!126695)) b!1351661))

(assert (= (and b!1351669 res!897158) b!1351667))

(declare-fun m!1238185 () Bool)

(assert (=> b!1351667 m!1238185))

(declare-fun m!1238187 () Bool)

(assert (=> start!113948 m!1238187))

(declare-fun m!1238189 () Bool)

(assert (=> b!1351666 m!1238189))

(declare-fun m!1238191 () Bool)

(assert (=> b!1351664 m!1238191))

(declare-fun m!1238193 () Bool)

(assert (=> b!1351668 m!1238193))

(declare-fun m!1238195 () Bool)

(assert (=> b!1351668 m!1238195))

(declare-fun m!1238197 () Bool)

(assert (=> b!1351668 m!1238197))

(declare-fun m!1238199 () Bool)

(assert (=> b!1351668 m!1238199))

(assert (=> b!1351668 m!1238185))

(assert (=> b!1351668 m!1238195))

(assert (=> b!1351668 m!1238197))

(declare-fun m!1238201 () Bool)

(assert (=> b!1351668 m!1238201))

(assert (=> b!1351669 m!1238195))

(assert (=> b!1351669 m!1238195))

(declare-fun m!1238203 () Bool)

(assert (=> b!1351669 m!1238203))

(declare-fun m!1238205 () Bool)

(assert (=> b!1351662 m!1238205))

(declare-fun m!1238207 () Bool)

(assert (=> b!1351660 m!1238207))

(declare-fun m!1238209 () Bool)

(assert (=> b!1351663 m!1238209))

(declare-fun m!1238211 () Bool)

(assert (=> b!1351670 m!1238211))

(check-sat (not b!1351664) (not b!1351667) (not b!1351669) (not b!1351660) (not b!1351663) (not b!1351666) (not b!1351668) (not b!1351662) (not b!1351670) (not start!113948))
(check-sat)
