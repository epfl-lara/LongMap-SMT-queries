; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114202 () Bool)

(assert start!114202)

(declare-fun b!1353569 () Bool)

(declare-fun res!898161 () Bool)

(declare-fun e!769594 () Bool)

(assert (=> b!1353569 (=> (not res!898161) (not e!769594))))

(declare-datatypes ((List!31609 0))(
  ( (Nil!31606) (Cons!31605 (h!32823 (_ BitVec 64)) (t!46259 List!31609)) )
))
(declare-fun acc!759 () List!31609)

(declare-fun contains!9321 (List!31609 (_ BitVec 64)) Bool)

(assert (=> b!1353569 (= res!898161 (not (contains!9321 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353570 () Bool)

(declare-fun e!769596 () Bool)

(assert (=> b!1353570 (= e!769594 e!769596)))

(declare-fun res!898156 () Bool)

(assert (=> b!1353570 (=> (not res!898156) (not e!769596))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353570 (= res!898156 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44264 0))(
  ( (Unit!44265) )
))
(declare-fun lt!597965 () Unit!44264)

(declare-fun e!769595 () Unit!44264)

(assert (=> b!1353570 (= lt!597965 e!769595)))

(declare-fun c!127156 () Bool)

(declare-datatypes ((array!92275 0))(
  ( (array!92276 (arr!44581 (Array (_ BitVec 32) (_ BitVec 64))) (size!45132 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92275)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353570 (= c!127156 (validKeyInArray!0 (select (arr!44581 a!3742) from!3120)))))

(declare-fun b!1353571 () Bool)

(declare-fun res!898160 () Bool)

(assert (=> b!1353571 (=> (not res!898160) (not e!769594))))

(assert (=> b!1353571 (= res!898160 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45132 a!3742)))))

(declare-fun b!1353572 () Bool)

(declare-fun lt!597966 () Unit!44264)

(assert (=> b!1353572 (= e!769595 lt!597966)))

(declare-fun lt!597963 () Unit!44264)

(declare-fun lemmaListSubSeqRefl!0 (List!31609) Unit!44264)

(assert (=> b!1353572 (= lt!597963 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!698 (List!31609 List!31609) Bool)

(assert (=> b!1353572 (subseq!698 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92275 List!31609 List!31609 (_ BitVec 32)) Unit!44264)

(declare-fun $colon$colon!712 (List!31609 (_ BitVec 64)) List!31609)

(assert (=> b!1353572 (= lt!597966 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!712 acc!759 (select (arr!44581 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92275 (_ BitVec 32) List!31609) Bool)

(assert (=> b!1353572 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353573 () Bool)

(declare-fun res!898158 () Bool)

(assert (=> b!1353573 (=> (not res!898158) (not e!769594))))

(declare-fun noDuplicate!2152 (List!31609) Bool)

(assert (=> b!1353573 (= res!898158 (noDuplicate!2152 acc!759))))

(declare-fun b!1353574 () Bool)

(declare-fun Unit!44266 () Unit!44264)

(assert (=> b!1353574 (= e!769595 Unit!44266)))

(declare-fun b!1353575 () Bool)

(declare-fun res!898157 () Bool)

(assert (=> b!1353575 (=> (not res!898157) (not e!769594))))

(assert (=> b!1353575 (= res!898157 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353577 () Bool)

(assert (=> b!1353577 (= e!769596 false)))

(declare-fun lt!597964 () Bool)

(assert (=> b!1353577 (= lt!597964 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353578 () Bool)

(declare-fun res!898153 () Bool)

(assert (=> b!1353578 (=> (not res!898153) (not e!769594))))

(assert (=> b!1353578 (= res!898153 (not (contains!9321 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353579 () Bool)

(declare-fun res!898159 () Bool)

(assert (=> b!1353579 (=> (not res!898159) (not e!769594))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353579 (= res!898159 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353580 () Bool)

(declare-fun res!898152 () Bool)

(assert (=> b!1353580 (=> (not res!898152) (not e!769594))))

(assert (=> b!1353580 (= res!898152 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31606))))

(declare-fun res!898155 () Bool)

(assert (=> start!114202 (=> (not res!898155) (not e!769594))))

(assert (=> start!114202 (= res!898155 (and (bvslt (size!45132 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45132 a!3742))))))

(assert (=> start!114202 e!769594))

(assert (=> start!114202 true))

(declare-fun array_inv!33862 (array!92275) Bool)

(assert (=> start!114202 (array_inv!33862 a!3742)))

(declare-fun b!1353576 () Bool)

(declare-fun res!898154 () Bool)

(assert (=> b!1353576 (=> (not res!898154) (not e!769594))))

(assert (=> b!1353576 (= res!898154 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45132 a!3742))))))

(assert (= (and start!114202 res!898155) b!1353573))

(assert (= (and b!1353573 res!898158) b!1353578))

(assert (= (and b!1353578 res!898153) b!1353569))

(assert (= (and b!1353569 res!898161) b!1353580))

(assert (= (and b!1353580 res!898152) b!1353575))

(assert (= (and b!1353575 res!898157) b!1353576))

(assert (= (and b!1353576 res!898154) b!1353579))

(assert (= (and b!1353579 res!898159) b!1353571))

(assert (= (and b!1353571 res!898160) b!1353570))

(assert (= (and b!1353570 c!127156) b!1353572))

(assert (= (and b!1353570 (not c!127156)) b!1353574))

(assert (= (and b!1353570 res!898156) b!1353577))

(declare-fun m!1240717 () Bool)

(assert (=> b!1353579 m!1240717))

(declare-fun m!1240719 () Bool)

(assert (=> b!1353569 m!1240719))

(declare-fun m!1240721 () Bool)

(assert (=> b!1353575 m!1240721))

(declare-fun m!1240723 () Bool)

(assert (=> b!1353570 m!1240723))

(assert (=> b!1353570 m!1240723))

(declare-fun m!1240725 () Bool)

(assert (=> b!1353570 m!1240725))

(declare-fun m!1240727 () Bool)

(assert (=> b!1353580 m!1240727))

(declare-fun m!1240729 () Bool)

(assert (=> b!1353573 m!1240729))

(declare-fun m!1240731 () Bool)

(assert (=> b!1353577 m!1240731))

(declare-fun m!1240733 () Bool)

(assert (=> start!114202 m!1240733))

(declare-fun m!1240735 () Bool)

(assert (=> b!1353572 m!1240735))

(assert (=> b!1353572 m!1240723))

(declare-fun m!1240737 () Bool)

(assert (=> b!1353572 m!1240737))

(declare-fun m!1240739 () Bool)

(assert (=> b!1353572 m!1240739))

(assert (=> b!1353572 m!1240731))

(assert (=> b!1353572 m!1240723))

(assert (=> b!1353572 m!1240737))

(declare-fun m!1240741 () Bool)

(assert (=> b!1353572 m!1240741))

(declare-fun m!1240743 () Bool)

(assert (=> b!1353578 m!1240743))

(check-sat (not b!1353575) (not b!1353579) (not b!1353572) (not b!1353577) (not start!114202) (not b!1353573) (not b!1353580) (not b!1353570) (not b!1353569) (not b!1353578))
(check-sat)
