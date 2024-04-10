; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114206 () Bool)

(assert start!114206)

(declare-fun b!1356717 () Bool)

(declare-fun res!901477 () Bool)

(declare-fun e!770161 () Bool)

(assert (=> b!1356717 (=> (not res!901477) (not e!770161))))

(declare-datatypes ((List!31683 0))(
  ( (Nil!31680) (Cons!31679 (h!32888 (_ BitVec 64)) (t!46341 List!31683)) )
))
(declare-fun acc!759 () List!31683)

(declare-datatypes ((array!92388 0))(
  ( (array!92389 (arr!44642 (Array (_ BitVec 32) (_ BitVec 64))) (size!45192 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92388)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92388 (_ BitVec 32) List!31683) Bool)

(assert (=> b!1356717 (= res!901477 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356718 () Bool)

(declare-fun res!901474 () Bool)

(assert (=> b!1356718 (=> (not res!901474) (not e!770161))))

(declare-fun contains!9392 (List!31683 (_ BitVec 64)) Bool)

(assert (=> b!1356718 (= res!901474 (not (contains!9392 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356719 () Bool)

(assert (=> b!1356719 (= e!770161 (bvslt (bvsub (size!45192 a!3742) from!3120) #b00000000000000000000000000000000))))

(declare-fun b!1356720 () Bool)

(declare-fun res!901479 () Bool)

(assert (=> b!1356720 (=> (not res!901479) (not e!770161))))

(assert (=> b!1356720 (= res!901479 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31680))))

(declare-fun b!1356721 () Bool)

(declare-fun res!901478 () Bool)

(assert (=> b!1356721 (=> (not res!901478) (not e!770161))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356721 (= res!901478 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45192 a!3742))))))

(declare-fun b!1356722 () Bool)

(declare-fun res!901480 () Bool)

(assert (=> b!1356722 (=> (not res!901480) (not e!770161))))

(assert (=> b!1356722 (= res!901480 (not (contains!9392 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901476 () Bool)

(assert (=> start!114206 (=> (not res!901476) (not e!770161))))

(assert (=> start!114206 (= res!901476 (and (bvslt (size!45192 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45192 a!3742))))))

(assert (=> start!114206 e!770161))

(assert (=> start!114206 true))

(declare-fun array_inv!33670 (array!92388) Bool)

(assert (=> start!114206 (array_inv!33670 a!3742)))

(declare-fun b!1356723 () Bool)

(declare-fun res!901473 () Bool)

(assert (=> b!1356723 (=> (not res!901473) (not e!770161))))

(declare-fun noDuplicate!2249 (List!31683) Bool)

(assert (=> b!1356723 (= res!901473 (noDuplicate!2249 acc!759))))

(declare-fun b!1356724 () Bool)

(declare-fun res!901475 () Bool)

(assert (=> b!1356724 (=> (not res!901475) (not e!770161))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356724 (= res!901475 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114206 res!901476) b!1356723))

(assert (= (and b!1356723 res!901473) b!1356718))

(assert (= (and b!1356718 res!901474) b!1356722))

(assert (= (and b!1356722 res!901480) b!1356720))

(assert (= (and b!1356720 res!901479) b!1356717))

(assert (= (and b!1356717 res!901477) b!1356721))

(assert (= (and b!1356721 res!901478) b!1356724))

(assert (= (and b!1356724 res!901475) b!1356719))

(declare-fun m!1242655 () Bool)

(assert (=> b!1356718 m!1242655))

(declare-fun m!1242657 () Bool)

(assert (=> b!1356724 m!1242657))

(declare-fun m!1242659 () Bool)

(assert (=> b!1356723 m!1242659))

(declare-fun m!1242661 () Bool)

(assert (=> b!1356717 m!1242661))

(declare-fun m!1242663 () Bool)

(assert (=> b!1356720 m!1242663))

(declare-fun m!1242665 () Bool)

(assert (=> start!114206 m!1242665))

(declare-fun m!1242667 () Bool)

(assert (=> b!1356722 m!1242667))

(push 1)

(assert (not b!1356717))

(assert (not b!1356722))

(assert (not b!1356720))

(assert (not b!1356723))

(assert (not start!114206))

(assert (not b!1356718))

(assert (not b!1356724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

