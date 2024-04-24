; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114452 () Bool)

(assert start!114452)

(declare-fun b!1358288 () Bool)

(declare-fun res!902271 () Bool)

(declare-fun e!771069 () Bool)

(assert (=> b!1358288 (=> (not res!902271) (not e!771069))))

(declare-datatypes ((List!31734 0))(
  ( (Nil!31731) (Cons!31730 (h!32948 (_ BitVec 64)) (t!46384 List!31734)) )
))
(declare-fun acc!759 () List!31734)

(declare-fun contains!9446 (List!31734 (_ BitVec 64)) Bool)

(assert (=> b!1358288 (= res!902271 (not (contains!9446 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358289 () Bool)

(declare-fun res!902264 () Bool)

(assert (=> b!1358289 (=> (not res!902264) (not e!771069))))

(assert (=> b!1358289 (= res!902264 (not (contains!9446 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358290 () Bool)

(declare-fun res!902265 () Bool)

(assert (=> b!1358290 (=> (not res!902265) (not e!771069))))

(declare-datatypes ((array!92525 0))(
  ( (array!92526 (arr!44706 (Array (_ BitVec 32) (_ BitVec 64))) (size!45257 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92525)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358290 (= res!902265 (validKeyInArray!0 (select (arr!44706 a!3742) from!3120)))))

(declare-fun b!1358291 () Bool)

(assert (=> b!1358291 (= e!771069 (not true))))

(declare-fun subseq!805 (List!31734 List!31734) Bool)

(assert (=> b!1358291 (subseq!805 acc!759 acc!759)))

(declare-datatypes ((Unit!44580 0))(
  ( (Unit!44581) )
))
(declare-fun lt!599583 () Unit!44580)

(declare-fun lemmaListSubSeqRefl!0 (List!31734) Unit!44580)

(assert (=> b!1358291 (= lt!599583 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358292 () Bool)

(declare-fun res!902262 () Bool)

(assert (=> b!1358292 (=> (not res!902262) (not e!771069))))

(declare-fun noDuplicate!2277 (List!31734) Bool)

(assert (=> b!1358292 (= res!902262 (noDuplicate!2277 acc!759))))

(declare-fun b!1358293 () Bool)

(declare-fun res!902270 () Bool)

(assert (=> b!1358293 (=> (not res!902270) (not e!771069))))

(declare-fun arrayNoDuplicates!0 (array!92525 (_ BitVec 32) List!31734) Bool)

(assert (=> b!1358293 (= res!902270 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31731))))

(declare-fun b!1358294 () Bool)

(declare-fun res!902266 () Bool)

(assert (=> b!1358294 (=> (not res!902266) (not e!771069))))

(assert (=> b!1358294 (= res!902266 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45257 a!3742)))))

(declare-fun res!902268 () Bool)

(assert (=> start!114452 (=> (not res!902268) (not e!771069))))

(assert (=> start!114452 (= res!902268 (and (bvslt (size!45257 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45257 a!3742))))))

(assert (=> start!114452 e!771069))

(assert (=> start!114452 true))

(declare-fun array_inv!33987 (array!92525) Bool)

(assert (=> start!114452 (array_inv!33987 a!3742)))

(declare-fun b!1358287 () Bool)

(declare-fun res!902263 () Bool)

(assert (=> b!1358287 (=> (not res!902263) (not e!771069))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358287 (= res!902263 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358295 () Bool)

(declare-fun res!902267 () Bool)

(assert (=> b!1358295 (=> (not res!902267) (not e!771069))))

(assert (=> b!1358295 (= res!902267 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358296 () Bool)

(declare-fun res!902269 () Bool)

(assert (=> b!1358296 (=> (not res!902269) (not e!771069))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358296 (= res!902269 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45257 a!3742))))))

(assert (= (and start!114452 res!902268) b!1358292))

(assert (= (and b!1358292 res!902262) b!1358288))

(assert (= (and b!1358288 res!902271) b!1358289))

(assert (= (and b!1358289 res!902264) b!1358293))

(assert (= (and b!1358293 res!902270) b!1358295))

(assert (= (and b!1358295 res!902267) b!1358296))

(assert (= (and b!1358296 res!902269) b!1358287))

(assert (= (and b!1358287 res!902263) b!1358294))

(assert (= (and b!1358294 res!902266) b!1358290))

(assert (= (and b!1358290 res!902265) b!1358291))

(declare-fun m!1244439 () Bool)

(assert (=> b!1358289 m!1244439))

(declare-fun m!1244441 () Bool)

(assert (=> b!1358290 m!1244441))

(assert (=> b!1358290 m!1244441))

(declare-fun m!1244443 () Bool)

(assert (=> b!1358290 m!1244443))

(declare-fun m!1244445 () Bool)

(assert (=> b!1358291 m!1244445))

(declare-fun m!1244447 () Bool)

(assert (=> b!1358291 m!1244447))

(declare-fun m!1244449 () Bool)

(assert (=> start!114452 m!1244449))

(declare-fun m!1244451 () Bool)

(assert (=> b!1358292 m!1244451))

(declare-fun m!1244453 () Bool)

(assert (=> b!1358293 m!1244453))

(declare-fun m!1244455 () Bool)

(assert (=> b!1358287 m!1244455))

(declare-fun m!1244457 () Bool)

(assert (=> b!1358288 m!1244457))

(declare-fun m!1244459 () Bool)

(assert (=> b!1358295 m!1244459))

(push 1)

(assert (not b!1358291))

(assert (not b!1358290))

(assert (not b!1358293))

(assert (not start!114452))

(assert (not b!1358289))

(assert (not b!1358287))

(assert (not b!1358288))

(assert (not b!1358295))

(assert (not b!1358292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

