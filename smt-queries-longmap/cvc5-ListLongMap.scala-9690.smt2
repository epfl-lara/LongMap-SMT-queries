; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114476 () Bool)

(assert start!114476)

(declare-fun b!1358553 () Bool)

(declare-fun res!903185 () Bool)

(declare-fun e!771051 () Bool)

(assert (=> b!1358553 (=> (not res!903185) (not e!771051))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92472 0))(
  ( (array!92473 (arr!44678 (Array (_ BitVec 32) (_ BitVec 64))) (size!45228 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92472)

(assert (=> b!1358553 (= res!903185 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45228 a!3742)))))

(declare-fun b!1358554 () Bool)

(declare-datatypes ((Unit!44694 0))(
  ( (Unit!44695) )
))
(declare-fun e!771050 () Unit!44694)

(declare-fun lt!599371 () Unit!44694)

(assert (=> b!1358554 (= e!771050 lt!599371)))

(declare-fun lt!599370 () Unit!44694)

(declare-datatypes ((List!31719 0))(
  ( (Nil!31716) (Cons!31715 (h!32924 (_ BitVec 64)) (t!46389 List!31719)) )
))
(declare-fun acc!759 () List!31719)

(declare-fun lemmaListSubSeqRefl!0 (List!31719) Unit!44694)

(assert (=> b!1358554 (= lt!599370 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!830 (List!31719 List!31719) Bool)

(assert (=> b!1358554 (subseq!830 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92472 List!31719 List!31719 (_ BitVec 32)) Unit!44694)

(declare-fun $colon$colon!833 (List!31719 (_ BitVec 64)) List!31719)

(assert (=> b!1358554 (= lt!599371 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!833 acc!759 (select (arr!44678 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92472 (_ BitVec 32) List!31719) Bool)

(assert (=> b!1358554 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358555 () Bool)

(declare-fun res!903193 () Bool)

(assert (=> b!1358555 (=> (not res!903193) (not e!771051))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358555 (= res!903193 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358556 () Bool)

(declare-fun res!903186 () Bool)

(assert (=> b!1358556 (=> (not res!903186) (not e!771051))))

(assert (=> b!1358556 (= res!903186 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31716))))

(declare-fun b!1358557 () Bool)

(declare-fun res!903188 () Bool)

(assert (=> b!1358557 (=> (not res!903188) (not e!771051))))

(declare-fun contains!9428 (List!31719 (_ BitVec 64)) Bool)

(assert (=> b!1358557 (= res!903188 (not (contains!9428 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358558 () Bool)

(declare-fun res!903187 () Bool)

(assert (=> b!1358558 (=> (not res!903187) (not e!771051))))

(assert (=> b!1358558 (= res!903187 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358559 () Bool)

(declare-fun res!903189 () Bool)

(assert (=> b!1358559 (=> (not res!903189) (not e!771051))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358559 (= res!903189 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45228 a!3742))))))

(declare-fun b!1358560 () Bool)

(declare-fun Unit!44696 () Unit!44694)

(assert (=> b!1358560 (= e!771050 Unit!44696)))

(declare-fun b!1358561 () Bool)

(declare-fun res!903192 () Bool)

(assert (=> b!1358561 (=> (not res!903192) (not e!771051))))

(assert (=> b!1358561 (= res!903192 (not (contains!9428 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358562 () Bool)

(declare-fun res!903191 () Bool)

(assert (=> b!1358562 (=> (not res!903191) (not e!771051))))

(declare-fun noDuplicate!2285 (List!31719) Bool)

(assert (=> b!1358562 (= res!903191 (noDuplicate!2285 acc!759))))

(declare-fun res!903190 () Bool)

(assert (=> start!114476 (=> (not res!903190) (not e!771051))))

(assert (=> start!114476 (= res!903190 (and (bvslt (size!45228 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45228 a!3742))))))

(assert (=> start!114476 e!771051))

(assert (=> start!114476 true))

(declare-fun array_inv!33706 (array!92472) Bool)

(assert (=> start!114476 (array_inv!33706 a!3742)))

(declare-fun b!1358563 () Bool)

(assert (=> b!1358563 (= e!771051 (and (= from!3120 i!1404) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599369 () Unit!44694)

(assert (=> b!1358563 (= lt!599369 e!771050)))

(declare-fun c!127124 () Bool)

(assert (=> b!1358563 (= c!127124 (validKeyInArray!0 (select (arr!44678 a!3742) from!3120)))))

(assert (= (and start!114476 res!903190) b!1358562))

(assert (= (and b!1358562 res!903191) b!1358561))

(assert (= (and b!1358561 res!903192) b!1358557))

(assert (= (and b!1358557 res!903188) b!1358556))

(assert (= (and b!1358556 res!903186) b!1358558))

(assert (= (and b!1358558 res!903187) b!1358559))

(assert (= (and b!1358559 res!903189) b!1358555))

(assert (= (and b!1358555 res!903193) b!1358553))

(assert (= (and b!1358553 res!903185) b!1358563))

(assert (= (and b!1358563 c!127124) b!1358554))

(assert (= (and b!1358563 (not c!127124)) b!1358560))

(declare-fun m!1244119 () Bool)

(assert (=> b!1358563 m!1244119))

(assert (=> b!1358563 m!1244119))

(declare-fun m!1244121 () Bool)

(assert (=> b!1358563 m!1244121))

(declare-fun m!1244123 () Bool)

(assert (=> b!1358555 m!1244123))

(declare-fun m!1244125 () Bool)

(assert (=> b!1358554 m!1244125))

(assert (=> b!1358554 m!1244119))

(declare-fun m!1244127 () Bool)

(assert (=> b!1358554 m!1244127))

(declare-fun m!1244129 () Bool)

(assert (=> b!1358554 m!1244129))

(declare-fun m!1244131 () Bool)

(assert (=> b!1358554 m!1244131))

(assert (=> b!1358554 m!1244119))

(assert (=> b!1358554 m!1244127))

(declare-fun m!1244133 () Bool)

(assert (=> b!1358554 m!1244133))

(declare-fun m!1244135 () Bool)

(assert (=> b!1358557 m!1244135))

(declare-fun m!1244137 () Bool)

(assert (=> b!1358558 m!1244137))

(declare-fun m!1244139 () Bool)

(assert (=> b!1358556 m!1244139))

(declare-fun m!1244141 () Bool)

(assert (=> b!1358562 m!1244141))

(declare-fun m!1244143 () Bool)

(assert (=> b!1358561 m!1244143))

(declare-fun m!1244145 () Bool)

(assert (=> start!114476 m!1244145))

(push 1)

