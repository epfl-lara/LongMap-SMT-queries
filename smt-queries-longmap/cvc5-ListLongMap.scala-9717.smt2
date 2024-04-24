; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115202 () Bool)

(assert start!115202)

(declare-fun b!1364136 () Bool)

(declare-fun res!907273 () Bool)

(declare-fun e!773836 () Bool)

(assert (=> b!1364136 (=> (not res!907273) (not e!773836))))

(declare-datatypes ((array!92771 0))(
  ( (array!92772 (arr!44814 (Array (_ BitVec 32) (_ BitVec 64))) (size!45365 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92771)

(declare-datatypes ((List!31842 0))(
  ( (Nil!31839) (Cons!31838 (h!33056 (_ BitVec 64)) (t!46522 List!31842)) )
))
(declare-fun arrayNoDuplicates!0 (array!92771 (_ BitVec 32) List!31842) Bool)

(assert (=> b!1364136 (= res!907273 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31839))))

(declare-fun b!1364137 () Bool)

(declare-datatypes ((Unit!44882 0))(
  ( (Unit!44883) )
))
(declare-fun e!773835 () Unit!44882)

(declare-fun lt!601079 () Unit!44882)

(assert (=> b!1364137 (= e!773835 lt!601079)))

(declare-fun lt!601078 () Unit!44882)

(declare-fun acc!759 () List!31842)

(declare-fun lemmaListSubSeqRefl!0 (List!31842) Unit!44882)

(assert (=> b!1364137 (= lt!601078 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!913 (List!31842 List!31842) Bool)

(assert (=> b!1364137 (subseq!913 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92771 List!31842 List!31842 (_ BitVec 32)) Unit!44882)

(declare-fun $colon$colon!915 (List!31842 (_ BitVec 64)) List!31842)

(assert (=> b!1364137 (= lt!601079 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!915 acc!759 (select (arr!44814 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1364137 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364138 () Bool)

(declare-fun res!907278 () Bool)

(assert (=> b!1364138 (=> (not res!907278) (not e!773836))))

(declare-fun contains!9554 (List!31842 (_ BitVec 64)) Bool)

(assert (=> b!1364138 (= res!907278 (not (contains!9554 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364139 () Bool)

(declare-fun res!907280 () Bool)

(assert (=> b!1364139 (=> (not res!907280) (not e!773836))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364139 (= res!907280 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364140 () Bool)

(declare-fun Unit!44884 () Unit!44882)

(assert (=> b!1364140 (= e!773835 Unit!44884)))

(declare-fun b!1364141 () Bool)

(declare-fun res!907276 () Bool)

(assert (=> b!1364141 (=> (not res!907276) (not e!773836))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364141 (= res!907276 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45365 a!3742))))))

(declare-fun b!1364142 () Bool)

(declare-fun res!907279 () Bool)

(assert (=> b!1364142 (=> (not res!907279) (not e!773836))))

(assert (=> b!1364142 (= res!907279 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45365 a!3742)))))

(declare-fun b!1364143 () Bool)

(declare-fun res!907274 () Bool)

(assert (=> b!1364143 (=> (not res!907274) (not e!773836))))

(declare-fun noDuplicate!2385 (List!31842) Bool)

(assert (=> b!1364143 (= res!907274 (noDuplicate!2385 acc!759))))

(declare-fun b!1364144 () Bool)

(assert (=> b!1364144 (= e!773836 false)))

(declare-fun lt!601080 () Unit!44882)

(assert (=> b!1364144 (= lt!601080 e!773835)))

(declare-fun c!127879 () Bool)

(assert (=> b!1364144 (= c!127879 (validKeyInArray!0 (select (arr!44814 a!3742) from!3120)))))

(declare-fun res!907281 () Bool)

(assert (=> start!115202 (=> (not res!907281) (not e!773836))))

(assert (=> start!115202 (= res!907281 (and (bvslt (size!45365 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45365 a!3742))))))

(assert (=> start!115202 e!773836))

(assert (=> start!115202 true))

(declare-fun array_inv!34095 (array!92771) Bool)

(assert (=> start!115202 (array_inv!34095 a!3742)))

(declare-fun b!1364145 () Bool)

(declare-fun res!907275 () Bool)

(assert (=> b!1364145 (=> (not res!907275) (not e!773836))))

(assert (=> b!1364145 (= res!907275 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364146 () Bool)

(declare-fun res!907277 () Bool)

(assert (=> b!1364146 (=> (not res!907277) (not e!773836))))

(assert (=> b!1364146 (= res!907277 (not (contains!9554 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115202 res!907281) b!1364143))

(assert (= (and b!1364143 res!907274) b!1364138))

(assert (= (and b!1364138 res!907278) b!1364146))

(assert (= (and b!1364146 res!907277) b!1364136))

(assert (= (and b!1364136 res!907273) b!1364145))

(assert (= (and b!1364145 res!907275) b!1364141))

(assert (= (and b!1364141 res!907276) b!1364139))

(assert (= (and b!1364139 res!907280) b!1364142))

(assert (= (and b!1364142 res!907279) b!1364144))

(assert (= (and b!1364144 c!127879) b!1364137))

(assert (= (and b!1364144 (not c!127879)) b!1364140))

(declare-fun m!1249347 () Bool)

(assert (=> b!1364138 m!1249347))

(declare-fun m!1249349 () Bool)

(assert (=> b!1364143 m!1249349))

(declare-fun m!1249351 () Bool)

(assert (=> b!1364137 m!1249351))

(declare-fun m!1249353 () Bool)

(assert (=> b!1364137 m!1249353))

(declare-fun m!1249355 () Bool)

(assert (=> b!1364137 m!1249355))

(declare-fun m!1249357 () Bool)

(assert (=> b!1364137 m!1249357))

(declare-fun m!1249359 () Bool)

(assert (=> b!1364137 m!1249359))

(assert (=> b!1364137 m!1249353))

(assert (=> b!1364137 m!1249355))

(declare-fun m!1249361 () Bool)

(assert (=> b!1364137 m!1249361))

(declare-fun m!1249363 () Bool)

(assert (=> b!1364146 m!1249363))

(declare-fun m!1249365 () Bool)

(assert (=> start!115202 m!1249365))

(declare-fun m!1249367 () Bool)

(assert (=> b!1364136 m!1249367))

(declare-fun m!1249369 () Bool)

(assert (=> b!1364145 m!1249369))

(assert (=> b!1364144 m!1249353))

(assert (=> b!1364144 m!1249353))

(declare-fun m!1249371 () Bool)

(assert (=> b!1364144 m!1249371))

(declare-fun m!1249373 () Bool)

(assert (=> b!1364139 m!1249373))

(push 1)

(assert (not b!1364138))

(assert (not b!1364145))

(assert (not b!1364144))

(assert (not start!115202))

(assert (not b!1364136))

(assert (not b!1364139))

(assert (not b!1364137))

(assert (not b!1364143))

(assert (not b!1364146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

