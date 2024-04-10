; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114040 () Bool)

(assert start!114040)

(declare-fun b!1353514 () Bool)

(declare-datatypes ((Unit!44418 0))(
  ( (Unit!44419) )
))
(declare-fun e!769148 () Unit!44418)

(declare-fun lt!597906 () Unit!44418)

(assert (=> b!1353514 (= e!769148 lt!597906)))

(declare-fun lt!597909 () Unit!44418)

(declare-datatypes ((List!31600 0))(
  ( (Nil!31597) (Cons!31596 (h!32805 (_ BitVec 64)) (t!46258 List!31600)) )
))
(declare-fun acc!759 () List!31600)

(declare-fun lemmaListSubSeqRefl!0 (List!31600) Unit!44418)

(assert (=> b!1353514 (= lt!597909 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!729 (List!31600 List!31600) Bool)

(assert (=> b!1353514 (subseq!729 acc!759 acc!759)))

(declare-datatypes ((array!92222 0))(
  ( (array!92223 (arr!44559 (Array (_ BitVec 32) (_ BitVec 64))) (size!45109 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92222)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92222 List!31600 List!31600 (_ BitVec 32)) Unit!44418)

(declare-fun $colon$colon!744 (List!31600 (_ BitVec 64)) List!31600)

(assert (=> b!1353514 (= lt!597906 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!744 acc!759 (select (arr!44559 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92222 (_ BitVec 32) List!31600) Bool)

(assert (=> b!1353514 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353516 () Bool)

(declare-fun e!769147 () Bool)

(declare-fun e!769149 () Bool)

(assert (=> b!1353516 (= e!769147 e!769149)))

(declare-fun res!898703 () Bool)

(assert (=> b!1353516 (=> (not res!898703) (not e!769149))))

(declare-fun lt!597907 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353516 (= res!898703 (and (not (= from!3120 i!1404)) lt!597907))))

(declare-fun lt!597910 () Unit!44418)

(assert (=> b!1353516 (= lt!597910 e!769148)))

(declare-fun c!126851 () Bool)

(assert (=> b!1353516 (= c!126851 lt!597907)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353516 (= lt!597907 (validKeyInArray!0 (select (arr!44559 a!3742) from!3120)))))

(declare-fun b!1353517 () Bool)

(declare-fun res!898697 () Bool)

(assert (=> b!1353517 (=> (not res!898697) (not e!769147))))

(assert (=> b!1353517 (= res!898697 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45109 a!3742)))))

(declare-fun b!1353518 () Bool)

(declare-fun res!898700 () Bool)

(assert (=> b!1353518 (=> (not res!898700) (not e!769147))))

(declare-fun noDuplicate!2166 (List!31600) Bool)

(assert (=> b!1353518 (= res!898700 (noDuplicate!2166 acc!759))))

(declare-fun b!1353519 () Bool)

(declare-fun res!898698 () Bool)

(assert (=> b!1353519 (=> (not res!898698) (not e!769147))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353519 (= res!898698 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353520 () Bool)

(declare-fun res!898692 () Bool)

(declare-fun e!769150 () Bool)

(assert (=> b!1353520 (=> (not res!898692) (not e!769150))))

(declare-fun lt!597908 () List!31600)

(assert (=> b!1353520 (= res!898692 (noDuplicate!2166 lt!597908))))

(declare-fun b!1353521 () Bool)

(declare-fun res!898702 () Bool)

(assert (=> b!1353521 (=> (not res!898702) (not e!769147))))

(declare-fun contains!9309 (List!31600 (_ BitVec 64)) Bool)

(assert (=> b!1353521 (= res!898702 (not (contains!9309 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353522 () Bool)

(declare-fun res!898701 () Bool)

(assert (=> b!1353522 (=> (not res!898701) (not e!769147))))

(assert (=> b!1353522 (= res!898701 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45109 a!3742))))))

(declare-fun b!1353523 () Bool)

(assert (=> b!1353523 (= e!769149 e!769150)))

(declare-fun res!898695 () Bool)

(assert (=> b!1353523 (=> (not res!898695) (not e!769150))))

(assert (=> b!1353523 (= res!898695 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353523 (= lt!597908 ($colon$colon!744 acc!759 (select (arr!44559 a!3742) from!3120)))))

(declare-fun b!1353515 () Bool)

(declare-fun res!898693 () Bool)

(assert (=> b!1353515 (=> (not res!898693) (not e!769150))))

(assert (=> b!1353515 (= res!898693 (not (contains!9309 lt!597908 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898699 () Bool)

(assert (=> start!114040 (=> (not res!898699) (not e!769147))))

(assert (=> start!114040 (= res!898699 (and (bvslt (size!45109 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45109 a!3742))))))

(assert (=> start!114040 e!769147))

(assert (=> start!114040 true))

(declare-fun array_inv!33587 (array!92222) Bool)

(assert (=> start!114040 (array_inv!33587 a!3742)))

(declare-fun b!1353524 () Bool)

(declare-fun res!898704 () Bool)

(assert (=> b!1353524 (=> (not res!898704) (not e!769147))))

(assert (=> b!1353524 (= res!898704 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31597))))

(declare-fun b!1353525 () Bool)

(declare-fun res!898696 () Bool)

(assert (=> b!1353525 (=> (not res!898696) (not e!769147))))

(assert (=> b!1353525 (= res!898696 (not (contains!9309 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353526 () Bool)

(declare-fun res!898694 () Bool)

(assert (=> b!1353526 (=> (not res!898694) (not e!769150))))

(assert (=> b!1353526 (= res!898694 (not (contains!9309 lt!597908 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353527 () Bool)

(declare-fun res!898705 () Bool)

(assert (=> b!1353527 (=> (not res!898705) (not e!769147))))

(assert (=> b!1353527 (= res!898705 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353528 () Bool)

(assert (=> b!1353528 (= e!769150 false)))

(declare-fun lt!597905 () Bool)

(assert (=> b!1353528 (= lt!597905 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597908))))

(declare-fun b!1353529 () Bool)

(declare-fun Unit!44420 () Unit!44418)

(assert (=> b!1353529 (= e!769148 Unit!44420)))

(assert (= (and start!114040 res!898699) b!1353518))

(assert (= (and b!1353518 res!898700) b!1353525))

(assert (= (and b!1353525 res!898696) b!1353521))

(assert (= (and b!1353521 res!898702) b!1353524))

(assert (= (and b!1353524 res!898704) b!1353527))

(assert (= (and b!1353527 res!898705) b!1353522))

(assert (= (and b!1353522 res!898701) b!1353519))

(assert (= (and b!1353519 res!898698) b!1353517))

(assert (= (and b!1353517 res!898697) b!1353516))

(assert (= (and b!1353516 c!126851) b!1353514))

(assert (= (and b!1353516 (not c!126851)) b!1353529))

(assert (= (and b!1353516 res!898703) b!1353523))

(assert (= (and b!1353523 res!898695) b!1353520))

(assert (= (and b!1353520 res!898692) b!1353515))

(assert (= (and b!1353515 res!898693) b!1353526))

(assert (= (and b!1353526 res!898694) b!1353528))

(declare-fun m!1240117 () Bool)

(assert (=> b!1353526 m!1240117))

(declare-fun m!1240119 () Bool)

(assert (=> start!114040 m!1240119))

(declare-fun m!1240121 () Bool)

(assert (=> b!1353523 m!1240121))

(assert (=> b!1353523 m!1240121))

(declare-fun m!1240123 () Bool)

(assert (=> b!1353523 m!1240123))

(declare-fun m!1240125 () Bool)

(assert (=> b!1353514 m!1240125))

(assert (=> b!1353514 m!1240121))

(assert (=> b!1353514 m!1240123))

(declare-fun m!1240127 () Bool)

(assert (=> b!1353514 m!1240127))

(declare-fun m!1240129 () Bool)

(assert (=> b!1353514 m!1240129))

(assert (=> b!1353514 m!1240121))

(assert (=> b!1353514 m!1240123))

(declare-fun m!1240131 () Bool)

(assert (=> b!1353514 m!1240131))

(declare-fun m!1240133 () Bool)

(assert (=> b!1353515 m!1240133))

(declare-fun m!1240135 () Bool)

(assert (=> b!1353520 m!1240135))

(declare-fun m!1240137 () Bool)

(assert (=> b!1353528 m!1240137))

(declare-fun m!1240139 () Bool)

(assert (=> b!1353527 m!1240139))

(assert (=> b!1353516 m!1240121))

(assert (=> b!1353516 m!1240121))

(declare-fun m!1240141 () Bool)

(assert (=> b!1353516 m!1240141))

(declare-fun m!1240143 () Bool)

(assert (=> b!1353521 m!1240143))

(declare-fun m!1240145 () Bool)

(assert (=> b!1353519 m!1240145))

(declare-fun m!1240147 () Bool)

(assert (=> b!1353524 m!1240147))

(declare-fun m!1240149 () Bool)

(assert (=> b!1353518 m!1240149))

(declare-fun m!1240151 () Bool)

(assert (=> b!1353525 m!1240151))

(check-sat (not b!1353523) (not b!1353524) (not b!1353527) (not b!1353518) (not b!1353526) (not b!1353519) (not b!1353514) (not b!1353520) (not b!1353515) (not start!114040) (not b!1353521) (not b!1353528) (not b!1353516) (not b!1353525))
(check-sat)
