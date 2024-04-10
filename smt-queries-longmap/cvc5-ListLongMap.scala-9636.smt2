; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113954 () Bool)

(assert start!113954)

(declare-fun b!1351838 () Bool)

(declare-fun res!897283 () Bool)

(declare-fun e!768610 () Bool)

(assert (=> b!1351838 (=> (not res!897283) (not e!768610))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92136 0))(
  ( (array!92137 (arr!44516 (Array (_ BitVec 32) (_ BitVec 64))) (size!45066 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92136)

(assert (=> b!1351838 (= res!897283 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45066 a!3742)))))

(declare-fun b!1351839 () Bool)

(declare-datatypes ((Unit!44289 0))(
  ( (Unit!44290) )
))
(declare-fun e!768607 () Unit!44289)

(declare-fun Unit!44291 () Unit!44289)

(assert (=> b!1351839 (= e!768607 Unit!44291)))

(declare-fun b!1351840 () Bool)

(declare-fun res!897279 () Bool)

(assert (=> b!1351840 (=> (not res!897279) (not e!768610))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351840 (= res!897279 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351841 () Bool)

(declare-fun e!768608 () Bool)

(assert (=> b!1351841 (= e!768610 e!768608)))

(declare-fun res!897275 () Bool)

(assert (=> b!1351841 (=> (not res!897275) (not e!768608))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351841 (= res!897275 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597346 () Unit!44289)

(assert (=> b!1351841 (= lt!597346 e!768607)))

(declare-fun c!126722 () Bool)

(assert (=> b!1351841 (= c!126722 (validKeyInArray!0 (select (arr!44516 a!3742) from!3120)))))

(declare-fun b!1351842 () Bool)

(declare-fun res!897274 () Bool)

(assert (=> b!1351842 (=> (not res!897274) (not e!768610))))

(declare-datatypes ((List!31557 0))(
  ( (Nil!31554) (Cons!31553 (h!32762 (_ BitVec 64)) (t!46215 List!31557)) )
))
(declare-fun acc!759 () List!31557)

(declare-fun contains!9266 (List!31557 (_ BitVec 64)) Bool)

(assert (=> b!1351842 (= res!897274 (not (contains!9266 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351843 () Bool)

(declare-fun res!897276 () Bool)

(assert (=> b!1351843 (=> (not res!897276) (not e!768610))))

(declare-fun arrayNoDuplicates!0 (array!92136 (_ BitVec 32) List!31557) Bool)

(assert (=> b!1351843 (= res!897276 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31554))))

(declare-fun res!897278 () Bool)

(assert (=> start!113954 (=> (not res!897278) (not e!768610))))

(assert (=> start!113954 (= res!897278 (and (bvslt (size!45066 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45066 a!3742))))))

(assert (=> start!113954 e!768610))

(assert (=> start!113954 true))

(declare-fun array_inv!33544 (array!92136) Bool)

(assert (=> start!113954 (array_inv!33544 a!3742)))

(declare-fun b!1351844 () Bool)

(declare-fun res!897280 () Bool)

(assert (=> b!1351844 (=> (not res!897280) (not e!768610))))

(assert (=> b!1351844 (= res!897280 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45066 a!3742))))))

(declare-fun b!1351845 () Bool)

(declare-fun res!897282 () Bool)

(assert (=> b!1351845 (=> (not res!897282) (not e!768610))))

(assert (=> b!1351845 (= res!897282 (not (contains!9266 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351846 () Bool)

(declare-fun lt!597343 () Unit!44289)

(assert (=> b!1351846 (= e!768607 lt!597343)))

(declare-fun lt!597345 () Unit!44289)

(declare-fun lemmaListSubSeqRefl!0 (List!31557) Unit!44289)

(assert (=> b!1351846 (= lt!597345 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!686 (List!31557 List!31557) Bool)

(assert (=> b!1351846 (subseq!686 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92136 List!31557 List!31557 (_ BitVec 32)) Unit!44289)

(declare-fun $colon$colon!701 (List!31557 (_ BitVec 64)) List!31557)

(assert (=> b!1351846 (= lt!597343 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!701 acc!759 (select (arr!44516 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351846 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351847 () Bool)

(declare-fun res!897281 () Bool)

(assert (=> b!1351847 (=> (not res!897281) (not e!768610))))

(declare-fun noDuplicate!2123 (List!31557) Bool)

(assert (=> b!1351847 (= res!897281 (noDuplicate!2123 acc!759))))

(declare-fun b!1351848 () Bool)

(declare-fun res!897277 () Bool)

(assert (=> b!1351848 (=> (not res!897277) (not e!768610))))

(assert (=> b!1351848 (= res!897277 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351849 () Bool)

(assert (=> b!1351849 (= e!768608 false)))

(declare-fun lt!597344 () Bool)

(assert (=> b!1351849 (= lt!597344 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!113954 res!897278) b!1351847))

(assert (= (and b!1351847 res!897281) b!1351845))

(assert (= (and b!1351845 res!897282) b!1351842))

(assert (= (and b!1351842 res!897274) b!1351843))

(assert (= (and b!1351843 res!897276) b!1351848))

(assert (= (and b!1351848 res!897277) b!1351844))

(assert (= (and b!1351844 res!897280) b!1351840))

(assert (= (and b!1351840 res!897279) b!1351838))

(assert (= (and b!1351838 res!897283) b!1351841))

(assert (= (and b!1351841 c!126722) b!1351846))

(assert (= (and b!1351841 (not c!126722)) b!1351839))

(assert (= (and b!1351841 res!897275) b!1351849))

(declare-fun m!1238785 () Bool)

(assert (=> b!1351845 m!1238785))

(declare-fun m!1238787 () Bool)

(assert (=> b!1351846 m!1238787))

(declare-fun m!1238789 () Bool)

(assert (=> b!1351846 m!1238789))

(declare-fun m!1238791 () Bool)

(assert (=> b!1351846 m!1238791))

(declare-fun m!1238793 () Bool)

(assert (=> b!1351846 m!1238793))

(declare-fun m!1238795 () Bool)

(assert (=> b!1351846 m!1238795))

(assert (=> b!1351846 m!1238789))

(assert (=> b!1351846 m!1238791))

(declare-fun m!1238797 () Bool)

(assert (=> b!1351846 m!1238797))

(declare-fun m!1238799 () Bool)

(assert (=> b!1351842 m!1238799))

(declare-fun m!1238801 () Bool)

(assert (=> b!1351848 m!1238801))

(assert (=> b!1351841 m!1238789))

(assert (=> b!1351841 m!1238789))

(declare-fun m!1238803 () Bool)

(assert (=> b!1351841 m!1238803))

(declare-fun m!1238805 () Bool)

(assert (=> b!1351840 m!1238805))

(assert (=> b!1351849 m!1238795))

(declare-fun m!1238807 () Bool)

(assert (=> b!1351843 m!1238807))

(declare-fun m!1238809 () Bool)

(assert (=> b!1351847 m!1238809))

(declare-fun m!1238811 () Bool)

(assert (=> start!113954 m!1238811))

(push 1)

