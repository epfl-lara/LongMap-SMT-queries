; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115208 () Bool)

(assert start!115208)

(declare-fun b!1364235 () Bool)

(declare-fun res!907361 () Bool)

(declare-fun e!773862 () Bool)

(assert (=> b!1364235 (=> (not res!907361) (not e!773862))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92777 0))(
  ( (array!92778 (arr!44817 (Array (_ BitVec 32) (_ BitVec 64))) (size!45368 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92777)

(assert (=> b!1364235 (= res!907361 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45368 a!3742))))))

(declare-fun b!1364236 () Bool)

(assert (=> b!1364236 (= e!773862 false)))

(declare-datatypes ((Unit!44891 0))(
  ( (Unit!44892) )
))
(declare-fun lt!601107 () Unit!44891)

(declare-fun e!773861 () Unit!44891)

(assert (=> b!1364236 (= lt!601107 e!773861)))

(declare-fun c!127888 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364236 (= c!127888 (validKeyInArray!0 (select (arr!44817 a!3742) from!3120)))))

(declare-fun b!1364238 () Bool)

(declare-fun res!907358 () Bool)

(assert (=> b!1364238 (=> (not res!907358) (not e!773862))))

(declare-datatypes ((List!31845 0))(
  ( (Nil!31842) (Cons!31841 (h!33059 (_ BitVec 64)) (t!46525 List!31845)) )
))
(declare-fun arrayNoDuplicates!0 (array!92777 (_ BitVec 32) List!31845) Bool)

(assert (=> b!1364238 (= res!907358 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31842))))

(declare-fun b!1364239 () Bool)

(declare-fun lt!601106 () Unit!44891)

(assert (=> b!1364239 (= e!773861 lt!601106)))

(declare-fun lt!601105 () Unit!44891)

(declare-fun acc!759 () List!31845)

(declare-fun lemmaListSubSeqRefl!0 (List!31845) Unit!44891)

(assert (=> b!1364239 (= lt!601105 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!916 (List!31845 List!31845) Bool)

(assert (=> b!1364239 (subseq!916 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92777 List!31845 List!31845 (_ BitVec 32)) Unit!44891)

(declare-fun $colon$colon!918 (List!31845 (_ BitVec 64)) List!31845)

(assert (=> b!1364239 (= lt!601106 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!918 acc!759 (select (arr!44817 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1364239 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364240 () Bool)

(declare-fun res!907362 () Bool)

(assert (=> b!1364240 (=> (not res!907362) (not e!773862))))

(declare-fun contains!9557 (List!31845 (_ BitVec 64)) Bool)

(assert (=> b!1364240 (= res!907362 (not (contains!9557 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364241 () Bool)

(declare-fun res!907359 () Bool)

(assert (=> b!1364241 (=> (not res!907359) (not e!773862))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1364241 (= res!907359 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364242 () Bool)

(declare-fun res!907355 () Bool)

(assert (=> b!1364242 (=> (not res!907355) (not e!773862))))

(assert (=> b!1364242 (= res!907355 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364243 () Bool)

(declare-fun Unit!44893 () Unit!44891)

(assert (=> b!1364243 (= e!773861 Unit!44893)))

(declare-fun b!1364237 () Bool)

(declare-fun res!907356 () Bool)

(assert (=> b!1364237 (=> (not res!907356) (not e!773862))))

(declare-fun noDuplicate!2388 (List!31845) Bool)

(assert (=> b!1364237 (= res!907356 (noDuplicate!2388 acc!759))))

(declare-fun res!907360 () Bool)

(assert (=> start!115208 (=> (not res!907360) (not e!773862))))

(assert (=> start!115208 (= res!907360 (and (bvslt (size!45368 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45368 a!3742))))))

(assert (=> start!115208 e!773862))

(assert (=> start!115208 true))

(declare-fun array_inv!34098 (array!92777) Bool)

(assert (=> start!115208 (array_inv!34098 a!3742)))

(declare-fun b!1364244 () Bool)

(declare-fun res!907354 () Bool)

(assert (=> b!1364244 (=> (not res!907354) (not e!773862))))

(assert (=> b!1364244 (= res!907354 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45368 a!3742)))))

(declare-fun b!1364245 () Bool)

(declare-fun res!907357 () Bool)

(assert (=> b!1364245 (=> (not res!907357) (not e!773862))))

(assert (=> b!1364245 (= res!907357 (not (contains!9557 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115208 res!907360) b!1364237))

(assert (= (and b!1364237 res!907356) b!1364240))

(assert (= (and b!1364240 res!907362) b!1364245))

(assert (= (and b!1364245 res!907357) b!1364238))

(assert (= (and b!1364238 res!907358) b!1364242))

(assert (= (and b!1364242 res!907355) b!1364235))

(assert (= (and b!1364235 res!907361) b!1364241))

(assert (= (and b!1364241 res!907359) b!1364244))

(assert (= (and b!1364244 res!907354) b!1364236))

(assert (= (and b!1364236 c!127888) b!1364239))

(assert (= (and b!1364236 (not c!127888)) b!1364243))

(declare-fun m!1249431 () Bool)

(assert (=> start!115208 m!1249431))

(declare-fun m!1249433 () Bool)

(assert (=> b!1364236 m!1249433))

(assert (=> b!1364236 m!1249433))

(declare-fun m!1249435 () Bool)

(assert (=> b!1364236 m!1249435))

(declare-fun m!1249437 () Bool)

(assert (=> b!1364241 m!1249437))

(declare-fun m!1249439 () Bool)

(assert (=> b!1364242 m!1249439))

(declare-fun m!1249441 () Bool)

(assert (=> b!1364238 m!1249441))

(declare-fun m!1249443 () Bool)

(assert (=> b!1364237 m!1249443))

(declare-fun m!1249445 () Bool)

(assert (=> b!1364239 m!1249445))

(assert (=> b!1364239 m!1249433))

(declare-fun m!1249447 () Bool)

(assert (=> b!1364239 m!1249447))

(declare-fun m!1249449 () Bool)

(assert (=> b!1364239 m!1249449))

(declare-fun m!1249451 () Bool)

(assert (=> b!1364239 m!1249451))

(assert (=> b!1364239 m!1249433))

(assert (=> b!1364239 m!1249447))

(declare-fun m!1249453 () Bool)

(assert (=> b!1364239 m!1249453))

(declare-fun m!1249455 () Bool)

(assert (=> b!1364245 m!1249455))

(declare-fun m!1249457 () Bool)

(assert (=> b!1364240 m!1249457))

(push 1)

(assert (not b!1364238))

(assert (not start!115208))

(assert (not b!1364241))

(assert (not b!1364245))

(assert (not b!1364237))

(assert (not b!1364236))

(assert (not b!1364240))

(assert (not b!1364242))

(assert (not b!1364239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

