; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114026 () Bool)

(assert start!114026)

(declare-fun b!1353178 () Bool)

(declare-fun res!898401 () Bool)

(declare-fun e!769042 () Bool)

(assert (=> b!1353178 (=> (not res!898401) (not e!769042))))

(declare-datatypes ((array!92208 0))(
  ( (array!92209 (arr!44552 (Array (_ BitVec 32) (_ BitVec 64))) (size!45102 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92208)

(declare-datatypes ((List!31593 0))(
  ( (Nil!31590) (Cons!31589 (h!32798 (_ BitVec 64)) (t!46251 List!31593)) )
))
(declare-fun arrayNoDuplicates!0 (array!92208 (_ BitVec 32) List!31593) Bool)

(assert (=> b!1353178 (= res!898401 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31590))))

(declare-fun b!1353179 () Bool)

(declare-fun e!769043 () Bool)

(assert (=> b!1353179 (= e!769043 false)))

(declare-fun lt!597780 () List!31593)

(declare-fun lt!597783 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353179 (= lt!597783 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597780))))

(declare-fun b!1353180 () Bool)

(declare-datatypes ((Unit!44397 0))(
  ( (Unit!44398) )
))
(declare-fun e!769041 () Unit!44397)

(declare-fun lt!597782 () Unit!44397)

(assert (=> b!1353180 (= e!769041 lt!597782)))

(declare-fun lt!597781 () Unit!44397)

(declare-fun acc!759 () List!31593)

(declare-fun lemmaListSubSeqRefl!0 (List!31593) Unit!44397)

(assert (=> b!1353180 (= lt!597781 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!722 (List!31593 List!31593) Bool)

(assert (=> b!1353180 (subseq!722 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92208 List!31593 List!31593 (_ BitVec 32)) Unit!44397)

(declare-fun $colon$colon!737 (List!31593 (_ BitVec 64)) List!31593)

(assert (=> b!1353180 (= lt!597782 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!737 acc!759 (select (arr!44552 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353180 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353181 () Bool)

(declare-fun res!898402 () Bool)

(assert (=> b!1353181 (=> (not res!898402) (not e!769042))))

(declare-fun noDuplicate!2159 (List!31593) Bool)

(assert (=> b!1353181 (= res!898402 (noDuplicate!2159 acc!759))))

(declare-fun b!1353182 () Bool)

(declare-fun res!898404 () Bool)

(assert (=> b!1353182 (=> (not res!898404) (not e!769042))))

(assert (=> b!1353182 (= res!898404 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45102 a!3742)))))

(declare-fun b!1353183 () Bool)

(declare-fun res!898411 () Bool)

(assert (=> b!1353183 (=> (not res!898411) (not e!769042))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353183 (= res!898411 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45102 a!3742))))))

(declare-fun b!1353184 () Bool)

(declare-fun res!898408 () Bool)

(assert (=> b!1353184 (=> (not res!898408) (not e!769042))))

(assert (=> b!1353184 (= res!898408 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353185 () Bool)

(declare-fun res!898400 () Bool)

(assert (=> b!1353185 (=> (not res!898400) (not e!769042))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353185 (= res!898400 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!898406 () Bool)

(assert (=> start!114026 (=> (not res!898406) (not e!769042))))

(assert (=> start!114026 (= res!898406 (and (bvslt (size!45102 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45102 a!3742))))))

(assert (=> start!114026 e!769042))

(assert (=> start!114026 true))

(declare-fun array_inv!33580 (array!92208) Bool)

(assert (=> start!114026 (array_inv!33580 a!3742)))

(declare-fun b!1353186 () Bool)

(declare-fun res!898405 () Bool)

(assert (=> b!1353186 (=> (not res!898405) (not e!769043))))

(assert (=> b!1353186 (= res!898405 (noDuplicate!2159 lt!597780))))

(declare-fun b!1353187 () Bool)

(declare-fun e!769045 () Bool)

(assert (=> b!1353187 (= e!769045 e!769043)))

(declare-fun res!898399 () Bool)

(assert (=> b!1353187 (=> (not res!898399) (not e!769043))))

(assert (=> b!1353187 (= res!898399 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353187 (= lt!597780 ($colon$colon!737 acc!759 (select (arr!44552 a!3742) from!3120)))))

(declare-fun b!1353188 () Bool)

(declare-fun res!898407 () Bool)

(assert (=> b!1353188 (=> (not res!898407) (not e!769043))))

(declare-fun contains!9302 (List!31593 (_ BitVec 64)) Bool)

(assert (=> b!1353188 (= res!898407 (not (contains!9302 lt!597780 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353189 () Bool)

(assert (=> b!1353189 (= e!769042 e!769045)))

(declare-fun res!898398 () Bool)

(assert (=> b!1353189 (=> (not res!898398) (not e!769045))))

(declare-fun lt!597779 () Bool)

(assert (=> b!1353189 (= res!898398 (and (not (= from!3120 i!1404)) lt!597779))))

(declare-fun lt!597784 () Unit!44397)

(assert (=> b!1353189 (= lt!597784 e!769041)))

(declare-fun c!126830 () Bool)

(assert (=> b!1353189 (= c!126830 lt!597779)))

(assert (=> b!1353189 (= lt!597779 (validKeyInArray!0 (select (arr!44552 a!3742) from!3120)))))

(declare-fun b!1353190 () Bool)

(declare-fun res!898410 () Bool)

(assert (=> b!1353190 (=> (not res!898410) (not e!769042))))

(assert (=> b!1353190 (= res!898410 (not (contains!9302 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353191 () Bool)

(declare-fun res!898403 () Bool)

(assert (=> b!1353191 (=> (not res!898403) (not e!769043))))

(assert (=> b!1353191 (= res!898403 (not (contains!9302 lt!597780 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353192 () Bool)

(declare-fun Unit!44399 () Unit!44397)

(assert (=> b!1353192 (= e!769041 Unit!44399)))

(declare-fun b!1353193 () Bool)

(declare-fun res!898409 () Bool)

(assert (=> b!1353193 (=> (not res!898409) (not e!769042))))

(assert (=> b!1353193 (= res!898409 (not (contains!9302 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114026 res!898406) b!1353181))

(assert (= (and b!1353181 res!898402) b!1353190))

(assert (= (and b!1353190 res!898410) b!1353193))

(assert (= (and b!1353193 res!898409) b!1353178))

(assert (= (and b!1353178 res!898401) b!1353184))

(assert (= (and b!1353184 res!898408) b!1353183))

(assert (= (and b!1353183 res!898411) b!1353185))

(assert (= (and b!1353185 res!898400) b!1353182))

(assert (= (and b!1353182 res!898404) b!1353189))

(assert (= (and b!1353189 c!126830) b!1353180))

(assert (= (and b!1353189 (not c!126830)) b!1353192))

(assert (= (and b!1353189 res!898398) b!1353187))

(assert (= (and b!1353187 res!898399) b!1353186))

(assert (= (and b!1353186 res!898405) b!1353188))

(assert (= (and b!1353188 res!898407) b!1353191))

(assert (= (and b!1353191 res!898403) b!1353179))

(declare-fun m!1239865 () Bool)

(assert (=> b!1353193 m!1239865))

(declare-fun m!1239867 () Bool)

(assert (=> b!1353181 m!1239867))

(declare-fun m!1239869 () Bool)

(assert (=> b!1353189 m!1239869))

(assert (=> b!1353189 m!1239869))

(declare-fun m!1239871 () Bool)

(assert (=> b!1353189 m!1239871))

(assert (=> b!1353187 m!1239869))

(assert (=> b!1353187 m!1239869))

(declare-fun m!1239873 () Bool)

(assert (=> b!1353187 m!1239873))

(declare-fun m!1239875 () Bool)

(assert (=> b!1353185 m!1239875))

(declare-fun m!1239877 () Bool)

(assert (=> b!1353190 m!1239877))

(declare-fun m!1239879 () Bool)

(assert (=> b!1353186 m!1239879))

(declare-fun m!1239881 () Bool)

(assert (=> b!1353191 m!1239881))

(declare-fun m!1239883 () Bool)

(assert (=> start!114026 m!1239883))

(declare-fun m!1239885 () Bool)

(assert (=> b!1353178 m!1239885))

(declare-fun m!1239887 () Bool)

(assert (=> b!1353179 m!1239887))

(declare-fun m!1239889 () Bool)

(assert (=> b!1353180 m!1239889))

(assert (=> b!1353180 m!1239869))

(assert (=> b!1353180 m!1239873))

(declare-fun m!1239891 () Bool)

(assert (=> b!1353180 m!1239891))

(declare-fun m!1239893 () Bool)

(assert (=> b!1353180 m!1239893))

(assert (=> b!1353180 m!1239869))

(assert (=> b!1353180 m!1239873))

(declare-fun m!1239895 () Bool)

(assert (=> b!1353180 m!1239895))

(declare-fun m!1239897 () Bool)

(assert (=> b!1353188 m!1239897))

(declare-fun m!1239899 () Bool)

(assert (=> b!1353184 m!1239899))

(push 1)

