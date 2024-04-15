; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114002 () Bool)

(assert start!114002)

(declare-fun b!1352634 () Bool)

(declare-fun res!897972 () Bool)

(declare-fun e!768862 () Bool)

(assert (=> b!1352634 (=> (not res!897972) (not e!768862))))

(declare-datatypes ((List!31634 0))(
  ( (Nil!31631) (Cons!31630 (h!32839 (_ BitVec 64)) (t!46284 List!31634)) )
))
(declare-fun acc!759 () List!31634)

(declare-datatypes ((array!92133 0))(
  ( (array!92134 (arr!44515 (Array (_ BitVec 32) (_ BitVec 64))) (size!45067 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92133)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92133 (_ BitVec 32) List!31634) Bool)

(assert (=> b!1352634 (= res!897972 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352635 () Bool)

(declare-fun e!768864 () Bool)

(assert (=> b!1352635 (= e!768864 e!768862)))

(declare-fun res!897976 () Bool)

(assert (=> b!1352635 (=> (not res!897976) (not e!768862))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352635 (= res!897976 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44202 0))(
  ( (Unit!44203) )
))
(declare-fun lt!597447 () Unit!44202)

(declare-fun e!768863 () Unit!44202)

(assert (=> b!1352635 (= lt!597447 e!768863)))

(declare-fun c!126776 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352635 (= c!126776 (validKeyInArray!0 (select (arr!44515 a!3742) from!3120)))))

(declare-fun b!1352636 () Bool)

(declare-fun res!897967 () Bool)

(assert (=> b!1352636 (=> (not res!897967) (not e!768864))))

(assert (=> b!1352636 (= res!897967 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45067 a!3742))))))

(declare-fun b!1352637 () Bool)

(declare-fun res!897971 () Bool)

(assert (=> b!1352637 (=> (not res!897971) (not e!768864))))

(declare-fun contains!9254 (List!31634 (_ BitVec 64)) Bool)

(assert (=> b!1352637 (= res!897971 (not (contains!9254 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352638 () Bool)

(assert (=> b!1352638 (= e!768862 (not (bvsle from!3120 (size!45067 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352638 (arrayNoDuplicates!0 (array!92134 (store (arr!44515 a!3742) i!1404 l!3587) (size!45067 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597445 () Unit!44202)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31634) Unit!44202)

(assert (=> b!1352638 (= lt!597445 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352639 () Bool)

(declare-fun res!897970 () Bool)

(assert (=> b!1352639 (=> (not res!897970) (not e!768864))))

(assert (=> b!1352639 (= res!897970 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352640 () Bool)

(declare-fun Unit!44204 () Unit!44202)

(assert (=> b!1352640 (= e!768863 Unit!44204)))

(declare-fun b!1352641 () Bool)

(declare-fun res!897969 () Bool)

(assert (=> b!1352641 (=> (not res!897969) (not e!768864))))

(assert (=> b!1352641 (= res!897969 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31631))))

(declare-fun res!897973 () Bool)

(assert (=> start!114002 (=> (not res!897973) (not e!768864))))

(assert (=> start!114002 (= res!897973 (and (bvslt (size!45067 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45067 a!3742))))))

(assert (=> start!114002 e!768864))

(assert (=> start!114002 true))

(declare-fun array_inv!33748 (array!92133) Bool)

(assert (=> start!114002 (array_inv!33748 a!3742)))

(declare-fun b!1352642 () Bool)

(declare-fun lt!597446 () Unit!44202)

(assert (=> b!1352642 (= e!768863 lt!597446)))

(declare-fun lt!597448 () Unit!44202)

(declare-fun lemmaListSubSeqRefl!0 (List!31634) Unit!44202)

(assert (=> b!1352642 (= lt!597448 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!710 (List!31634 List!31634) Bool)

(assert (=> b!1352642 (subseq!710 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92133 List!31634 List!31634 (_ BitVec 32)) Unit!44202)

(declare-fun $colon$colon!727 (List!31634 (_ BitVec 64)) List!31634)

(assert (=> b!1352642 (= lt!597446 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!727 acc!759 (select (arr!44515 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352642 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352643 () Bool)

(declare-fun res!897968 () Bool)

(assert (=> b!1352643 (=> (not res!897968) (not e!768864))))

(assert (=> b!1352643 (= res!897968 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45067 a!3742)))))

(declare-fun b!1352644 () Bool)

(declare-fun res!897975 () Bool)

(assert (=> b!1352644 (=> (not res!897975) (not e!768864))))

(assert (=> b!1352644 (= res!897975 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352645 () Bool)

(declare-fun res!897974 () Bool)

(assert (=> b!1352645 (=> (not res!897974) (not e!768864))))

(assert (=> b!1352645 (= res!897974 (not (contains!9254 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352646 () Bool)

(declare-fun res!897977 () Bool)

(assert (=> b!1352646 (=> (not res!897977) (not e!768864))))

(declare-fun noDuplicate!2169 (List!31634) Bool)

(assert (=> b!1352646 (= res!897977 (noDuplicate!2169 acc!759))))

(assert (= (and start!114002 res!897973) b!1352646))

(assert (= (and b!1352646 res!897977) b!1352645))

(assert (= (and b!1352645 res!897974) b!1352637))

(assert (= (and b!1352637 res!897971) b!1352641))

(assert (= (and b!1352641 res!897969) b!1352644))

(assert (= (and b!1352644 res!897975) b!1352636))

(assert (= (and b!1352636 res!897967) b!1352639))

(assert (= (and b!1352639 res!897970) b!1352643))

(assert (= (and b!1352643 res!897968) b!1352635))

(assert (= (and b!1352635 c!126776) b!1352642))

(assert (= (and b!1352635 (not c!126776)) b!1352640))

(assert (= (and b!1352635 res!897976) b!1352634))

(assert (= (and b!1352634 res!897972) b!1352638))

(declare-fun m!1238941 () Bool)

(assert (=> b!1352641 m!1238941))

(declare-fun m!1238943 () Bool)

(assert (=> b!1352645 m!1238943))

(declare-fun m!1238945 () Bool)

(assert (=> start!114002 m!1238945))

(declare-fun m!1238947 () Bool)

(assert (=> b!1352634 m!1238947))

(declare-fun m!1238949 () Bool)

(assert (=> b!1352637 m!1238949))

(declare-fun m!1238951 () Bool)

(assert (=> b!1352642 m!1238951))

(declare-fun m!1238953 () Bool)

(assert (=> b!1352642 m!1238953))

(declare-fun m!1238955 () Bool)

(assert (=> b!1352642 m!1238955))

(declare-fun m!1238957 () Bool)

(assert (=> b!1352642 m!1238957))

(assert (=> b!1352642 m!1238947))

(assert (=> b!1352642 m!1238953))

(assert (=> b!1352642 m!1238955))

(declare-fun m!1238959 () Bool)

(assert (=> b!1352642 m!1238959))

(declare-fun m!1238961 () Bool)

(assert (=> b!1352644 m!1238961))

(assert (=> b!1352635 m!1238953))

(assert (=> b!1352635 m!1238953))

(declare-fun m!1238963 () Bool)

(assert (=> b!1352635 m!1238963))

(declare-fun m!1238965 () Bool)

(assert (=> b!1352639 m!1238965))

(declare-fun m!1238967 () Bool)

(assert (=> b!1352646 m!1238967))

(declare-fun m!1238969 () Bool)

(assert (=> b!1352638 m!1238969))

(declare-fun m!1238971 () Bool)

(assert (=> b!1352638 m!1238971))

(declare-fun m!1238973 () Bool)

(assert (=> b!1352638 m!1238973))

(check-sat (not b!1352642) (not b!1352639) (not start!114002) (not b!1352641) (not b!1352637) (not b!1352644) (not b!1352635) (not b!1352646) (not b!1352634) (not b!1352645) (not b!1352638))
(check-sat)
