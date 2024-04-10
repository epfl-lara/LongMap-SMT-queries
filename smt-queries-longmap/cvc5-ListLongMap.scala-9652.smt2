; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114050 () Bool)

(assert start!114050)

(declare-fun b!1353754 () Bool)

(declare-datatypes ((Unit!44433 0))(
  ( (Unit!44434) )
))
(declare-fun e!769221 () Unit!44433)

(declare-fun lt!597998 () Unit!44433)

(assert (=> b!1353754 (= e!769221 lt!597998)))

(declare-fun lt!597996 () Unit!44433)

(declare-datatypes ((List!31605 0))(
  ( (Nil!31602) (Cons!31601 (h!32810 (_ BitVec 64)) (t!46263 List!31605)) )
))
(declare-fun acc!759 () List!31605)

(declare-fun lemmaListSubSeqRefl!0 (List!31605) Unit!44433)

(assert (=> b!1353754 (= lt!597996 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!734 (List!31605 List!31605) Bool)

(assert (=> b!1353754 (subseq!734 acc!759 acc!759)))

(declare-datatypes ((array!92232 0))(
  ( (array!92233 (arr!44564 (Array (_ BitVec 32) (_ BitVec 64))) (size!45114 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92232)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92232 List!31605 List!31605 (_ BitVec 32)) Unit!44433)

(declare-fun $colon$colon!749 (List!31605 (_ BitVec 64)) List!31605)

(assert (=> b!1353754 (= lt!597998 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!749 acc!759 (select (arr!44564 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92232 (_ BitVec 32) List!31605) Bool)

(assert (=> b!1353754 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353755 () Bool)

(declare-fun res!898910 () Bool)

(declare-fun e!769223 () Bool)

(assert (=> b!1353755 (=> (not res!898910) (not e!769223))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353755 (= res!898910 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353756 () Bool)

(declare-fun res!898904 () Bool)

(assert (=> b!1353756 (=> (not res!898904) (not e!769223))))

(declare-fun noDuplicate!2171 (List!31605) Bool)

(assert (=> b!1353756 (= res!898904 (noDuplicate!2171 acc!759))))

(declare-fun b!1353757 () Bool)

(declare-fun e!769224 () Bool)

(assert (=> b!1353757 (= e!769223 e!769224)))

(declare-fun res!898906 () Bool)

(assert (=> b!1353757 (=> (not res!898906) (not e!769224))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!597999 () Bool)

(assert (=> b!1353757 (= res!898906 (and (not (= from!3120 i!1404)) lt!597999))))

(declare-fun lt!598000 () Unit!44433)

(assert (=> b!1353757 (= lt!598000 e!769221)))

(declare-fun c!126866 () Bool)

(assert (=> b!1353757 (= c!126866 lt!597999)))

(assert (=> b!1353757 (= lt!597999 (validKeyInArray!0 (select (arr!44564 a!3742) from!3120)))))

(declare-fun b!1353758 () Bool)

(declare-fun res!898913 () Bool)

(assert (=> b!1353758 (=> (not res!898913) (not e!769223))))

(declare-fun contains!9314 (List!31605 (_ BitVec 64)) Bool)

(assert (=> b!1353758 (= res!898913 (not (contains!9314 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898909 () Bool)

(assert (=> start!114050 (=> (not res!898909) (not e!769223))))

(assert (=> start!114050 (= res!898909 (and (bvslt (size!45114 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45114 a!3742))))))

(assert (=> start!114050 e!769223))

(assert (=> start!114050 true))

(declare-fun array_inv!33592 (array!92232) Bool)

(assert (=> start!114050 (array_inv!33592 a!3742)))

(declare-fun b!1353759 () Bool)

(declare-fun res!898905 () Bool)

(declare-fun e!769225 () Bool)

(assert (=> b!1353759 (=> (not res!898905) (not e!769225))))

(declare-fun lt!597997 () List!31605)

(assert (=> b!1353759 (= res!898905 (noDuplicate!2171 lt!597997))))

(declare-fun b!1353760 () Bool)

(assert (=> b!1353760 (= e!769225 false)))

(declare-fun lt!597995 () Bool)

(assert (=> b!1353760 (= lt!597995 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597997))))

(declare-fun b!1353761 () Bool)

(declare-fun res!898902 () Bool)

(assert (=> b!1353761 (=> (not res!898902) (not e!769223))))

(assert (=> b!1353761 (= res!898902 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353762 () Bool)

(declare-fun res!898914 () Bool)

(assert (=> b!1353762 (=> (not res!898914) (not e!769223))))

(assert (=> b!1353762 (= res!898914 (not (contains!9314 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353763 () Bool)

(declare-fun res!898912 () Bool)

(assert (=> b!1353763 (=> (not res!898912) (not e!769223))))

(assert (=> b!1353763 (= res!898912 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45114 a!3742))))))

(declare-fun b!1353764 () Bool)

(declare-fun res!898903 () Bool)

(assert (=> b!1353764 (=> (not res!898903) (not e!769225))))

(assert (=> b!1353764 (= res!898903 (not (contains!9314 lt!597997 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353765 () Bool)

(declare-fun res!898911 () Bool)

(assert (=> b!1353765 (=> (not res!898911) (not e!769223))))

(assert (=> b!1353765 (= res!898911 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31602))))

(declare-fun b!1353766 () Bool)

(declare-fun Unit!44435 () Unit!44433)

(assert (=> b!1353766 (= e!769221 Unit!44435)))

(declare-fun b!1353767 () Bool)

(declare-fun res!898915 () Bool)

(assert (=> b!1353767 (=> (not res!898915) (not e!769225))))

(assert (=> b!1353767 (= res!898915 (not (contains!9314 lt!597997 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353768 () Bool)

(declare-fun res!898908 () Bool)

(assert (=> b!1353768 (=> (not res!898908) (not e!769223))))

(assert (=> b!1353768 (= res!898908 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45114 a!3742)))))

(declare-fun b!1353769 () Bool)

(assert (=> b!1353769 (= e!769224 e!769225)))

(declare-fun res!898907 () Bool)

(assert (=> b!1353769 (=> (not res!898907) (not e!769225))))

(assert (=> b!1353769 (= res!898907 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353769 (= lt!597997 ($colon$colon!749 acc!759 (select (arr!44564 a!3742) from!3120)))))

(assert (= (and start!114050 res!898909) b!1353756))

(assert (= (and b!1353756 res!898904) b!1353762))

(assert (= (and b!1353762 res!898914) b!1353758))

(assert (= (and b!1353758 res!898913) b!1353765))

(assert (= (and b!1353765 res!898911) b!1353761))

(assert (= (and b!1353761 res!898902) b!1353763))

(assert (= (and b!1353763 res!898912) b!1353755))

(assert (= (and b!1353755 res!898910) b!1353768))

(assert (= (and b!1353768 res!898908) b!1353757))

(assert (= (and b!1353757 c!126866) b!1353754))

(assert (= (and b!1353757 (not c!126866)) b!1353766))

(assert (= (and b!1353757 res!898906) b!1353769))

(assert (= (and b!1353769 res!898907) b!1353759))

(assert (= (and b!1353759 res!898905) b!1353767))

(assert (= (and b!1353767 res!898915) b!1353764))

(assert (= (and b!1353764 res!898903) b!1353760))

(declare-fun m!1240297 () Bool)

(assert (=> b!1353755 m!1240297))

(declare-fun m!1240299 () Bool)

(assert (=> b!1353758 m!1240299))

(declare-fun m!1240301 () Bool)

(assert (=> start!114050 m!1240301))

(declare-fun m!1240303 () Bool)

(assert (=> b!1353767 m!1240303))

(declare-fun m!1240305 () Bool)

(assert (=> b!1353760 m!1240305))

(declare-fun m!1240307 () Bool)

(assert (=> b!1353769 m!1240307))

(assert (=> b!1353769 m!1240307))

(declare-fun m!1240309 () Bool)

(assert (=> b!1353769 m!1240309))

(declare-fun m!1240311 () Bool)

(assert (=> b!1353762 m!1240311))

(declare-fun m!1240313 () Bool)

(assert (=> b!1353754 m!1240313))

(assert (=> b!1353754 m!1240307))

(assert (=> b!1353754 m!1240309))

(declare-fun m!1240315 () Bool)

(assert (=> b!1353754 m!1240315))

(declare-fun m!1240317 () Bool)

(assert (=> b!1353754 m!1240317))

(assert (=> b!1353754 m!1240307))

(assert (=> b!1353754 m!1240309))

(declare-fun m!1240319 () Bool)

(assert (=> b!1353754 m!1240319))

(declare-fun m!1240321 () Bool)

(assert (=> b!1353765 m!1240321))

(declare-fun m!1240323 () Bool)

(assert (=> b!1353761 m!1240323))

(assert (=> b!1353757 m!1240307))

(assert (=> b!1353757 m!1240307))

(declare-fun m!1240325 () Bool)

(assert (=> b!1353757 m!1240325))

(declare-fun m!1240327 () Bool)

(assert (=> b!1353764 m!1240327))

(declare-fun m!1240329 () Bool)

(assert (=> b!1353759 m!1240329))

(declare-fun m!1240331 () Bool)

(assert (=> b!1353756 m!1240331))

(push 1)

