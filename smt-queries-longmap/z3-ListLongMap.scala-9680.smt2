; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114218 () Bool)

(assert start!114218)

(declare-fun b!1356768 () Bool)

(declare-fun res!901574 () Bool)

(declare-fun e!770164 () Bool)

(assert (=> b!1356768 (=> (not res!901574) (not e!770164))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92349 0))(
  ( (array!92350 (arr!44623 (Array (_ BitVec 32) (_ BitVec 64))) (size!45175 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92349)

(assert (=> b!1356768 (= res!901574 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45175 a!3742))))))

(declare-fun b!1356769 () Bool)

(declare-fun res!901571 () Bool)

(assert (=> b!1356769 (=> (not res!901571) (not e!770164))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356769 (= res!901571 (validKeyInArray!0 (select (arr!44623 a!3742) from!3120)))))

(declare-fun res!901565 () Bool)

(assert (=> start!114218 (=> (not res!901565) (not e!770164))))

(assert (=> start!114218 (= res!901565 (and (bvslt (size!45175 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45175 a!3742))))))

(assert (=> start!114218 e!770164))

(assert (=> start!114218 true))

(declare-fun array_inv!33856 (array!92349) Bool)

(assert (=> start!114218 (array_inv!33856 a!3742)))

(declare-fun b!1356770 () Bool)

(declare-fun res!901568 () Bool)

(assert (=> b!1356770 (=> (not res!901568) (not e!770164))))

(declare-datatypes ((List!31742 0))(
  ( (Nil!31739) (Cons!31738 (h!32947 (_ BitVec 64)) (t!46392 List!31742)) )
))
(declare-fun acc!759 () List!31742)

(declare-fun contains!9362 (List!31742 (_ BitVec 64)) Bool)

(assert (=> b!1356770 (= res!901568 (not (contains!9362 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356771 () Bool)

(declare-fun res!901569 () Bool)

(assert (=> b!1356771 (=> (not res!901569) (not e!770164))))

(declare-fun arrayNoDuplicates!0 (array!92349 (_ BitVec 32) List!31742) Bool)

(assert (=> b!1356771 (= res!901569 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31739))))

(declare-fun b!1356772 () Bool)

(declare-fun res!901573 () Bool)

(assert (=> b!1356772 (=> (not res!901573) (not e!770164))))

(assert (=> b!1356772 (= res!901573 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45175 a!3742)))))

(declare-fun b!1356773 () Bool)

(declare-fun res!901572 () Bool)

(assert (=> b!1356773 (=> (not res!901572) (not e!770164))))

(assert (=> b!1356773 (= res!901572 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356774 () Bool)

(assert (=> b!1356774 (= e!770164 (not true))))

(declare-fun subseq!800 (List!31742 List!31742) Bool)

(assert (=> b!1356774 (subseq!800 acc!759 acc!759)))

(declare-datatypes ((Unit!44472 0))(
  ( (Unit!44473) )
))
(declare-fun lt!598906 () Unit!44472)

(declare-fun lemmaListSubSeqRefl!0 (List!31742) Unit!44472)

(assert (=> b!1356774 (= lt!598906 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356775 () Bool)

(declare-fun res!901567 () Bool)

(assert (=> b!1356775 (=> (not res!901567) (not e!770164))))

(assert (=> b!1356775 (= res!901567 (not (contains!9362 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356776 () Bool)

(declare-fun res!901570 () Bool)

(assert (=> b!1356776 (=> (not res!901570) (not e!770164))))

(declare-fun noDuplicate!2277 (List!31742) Bool)

(assert (=> b!1356776 (= res!901570 (noDuplicate!2277 acc!759))))

(declare-fun b!1356777 () Bool)

(declare-fun res!901566 () Bool)

(assert (=> b!1356777 (=> (not res!901566) (not e!770164))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356777 (= res!901566 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114218 res!901565) b!1356776))

(assert (= (and b!1356776 res!901570) b!1356770))

(assert (= (and b!1356770 res!901568) b!1356775))

(assert (= (and b!1356775 res!901567) b!1356771))

(assert (= (and b!1356771 res!901569) b!1356773))

(assert (= (and b!1356773 res!901572) b!1356768))

(assert (= (and b!1356768 res!901574) b!1356777))

(assert (= (and b!1356777 res!901566) b!1356772))

(assert (= (and b!1356772 res!901573) b!1356769))

(assert (= (and b!1356769 res!901571) b!1356774))

(declare-fun m!1242217 () Bool)

(assert (=> b!1356775 m!1242217))

(declare-fun m!1242219 () Bool)

(assert (=> b!1356769 m!1242219))

(assert (=> b!1356769 m!1242219))

(declare-fun m!1242221 () Bool)

(assert (=> b!1356769 m!1242221))

(declare-fun m!1242223 () Bool)

(assert (=> b!1356776 m!1242223))

(declare-fun m!1242225 () Bool)

(assert (=> b!1356771 m!1242225))

(declare-fun m!1242227 () Bool)

(assert (=> b!1356777 m!1242227))

(declare-fun m!1242229 () Bool)

(assert (=> b!1356770 m!1242229))

(declare-fun m!1242231 () Bool)

(assert (=> b!1356774 m!1242231))

(declare-fun m!1242233 () Bool)

(assert (=> b!1356774 m!1242233))

(declare-fun m!1242235 () Bool)

(assert (=> b!1356773 m!1242235))

(declare-fun m!1242237 () Bool)

(assert (=> start!114218 m!1242237))

(check-sat (not b!1356777) (not b!1356773) (not b!1356775) (not b!1356776) (not start!114218) (not b!1356774) (not b!1356771) (not b!1356769) (not b!1356770))
(check-sat)
