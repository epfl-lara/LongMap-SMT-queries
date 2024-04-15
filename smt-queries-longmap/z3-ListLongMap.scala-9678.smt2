; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114206 () Bool)

(assert start!114206)

(declare-fun b!1356647 () Bool)

(declare-fun res!901445 () Bool)

(declare-fun e!770127 () Bool)

(assert (=> b!1356647 (=> (not res!901445) (not e!770127))))

(declare-datatypes ((List!31736 0))(
  ( (Nil!31733) (Cons!31732 (h!32941 (_ BitVec 64)) (t!46386 List!31736)) )
))
(declare-fun acc!759 () List!31736)

(declare-fun contains!9356 (List!31736 (_ BitVec 64)) Bool)

(assert (=> b!1356647 (= res!901445 (not (contains!9356 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356648 () Bool)

(declare-fun res!901447 () Bool)

(assert (=> b!1356648 (=> (not res!901447) (not e!770127))))

(assert (=> b!1356648 (= res!901447 (not (contains!9356 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901451 () Bool)

(assert (=> start!114206 (=> (not res!901451) (not e!770127))))

(declare-datatypes ((array!92337 0))(
  ( (array!92338 (arr!44617 (Array (_ BitVec 32) (_ BitVec 64))) (size!45169 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92337)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114206 (= res!901451 (and (bvslt (size!45169 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45169 a!3742))))))

(assert (=> start!114206 e!770127))

(assert (=> start!114206 true))

(declare-fun array_inv!33850 (array!92337) Bool)

(assert (=> start!114206 (array_inv!33850 a!3742)))

(declare-fun b!1356649 () Bool)

(declare-fun res!901446 () Bool)

(assert (=> b!1356649 (=> (not res!901446) (not e!770127))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356649 (= res!901446 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45169 a!3742))))))

(declare-fun b!1356650 () Bool)

(assert (=> b!1356650 (= e!770127 (bvslt (bvsub (size!45169 a!3742) from!3120) #b00000000000000000000000000000000))))

(declare-fun b!1356651 () Bool)

(declare-fun res!901448 () Bool)

(assert (=> b!1356651 (=> (not res!901448) (not e!770127))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356651 (= res!901448 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356652 () Bool)

(declare-fun res!901450 () Bool)

(assert (=> b!1356652 (=> (not res!901450) (not e!770127))))

(declare-fun arrayNoDuplicates!0 (array!92337 (_ BitVec 32) List!31736) Bool)

(assert (=> b!1356652 (= res!901450 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31733))))

(declare-fun b!1356653 () Bool)

(declare-fun res!901444 () Bool)

(assert (=> b!1356653 (=> (not res!901444) (not e!770127))))

(assert (=> b!1356653 (= res!901444 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356654 () Bool)

(declare-fun res!901449 () Bool)

(assert (=> b!1356654 (=> (not res!901449) (not e!770127))))

(declare-fun noDuplicate!2271 (List!31736) Bool)

(assert (=> b!1356654 (= res!901449 (noDuplicate!2271 acc!759))))

(assert (= (and start!114206 res!901451) b!1356654))

(assert (= (and b!1356654 res!901449) b!1356647))

(assert (= (and b!1356647 res!901445) b!1356648))

(assert (= (and b!1356648 res!901447) b!1356652))

(assert (= (and b!1356652 res!901450) b!1356653))

(assert (= (and b!1356653 res!901444) b!1356649))

(assert (= (and b!1356649 res!901446) b!1356651))

(assert (= (and b!1356651 res!901448) b!1356650))

(declare-fun m!1242139 () Bool)

(assert (=> start!114206 m!1242139))

(declare-fun m!1242141 () Bool)

(assert (=> b!1356648 m!1242141))

(declare-fun m!1242143 () Bool)

(assert (=> b!1356653 m!1242143))

(declare-fun m!1242145 () Bool)

(assert (=> b!1356654 m!1242145))

(declare-fun m!1242147 () Bool)

(assert (=> b!1356651 m!1242147))

(declare-fun m!1242149 () Bool)

(assert (=> b!1356647 m!1242149))

(declare-fun m!1242151 () Bool)

(assert (=> b!1356652 m!1242151))

(check-sat (not b!1356652) (not b!1356653) (not b!1356647) (not b!1356654) (not b!1356648) (not start!114206) (not b!1356651))
(check-sat)
