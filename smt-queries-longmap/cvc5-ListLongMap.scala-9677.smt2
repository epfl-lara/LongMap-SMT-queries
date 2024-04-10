; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114200 () Bool)

(assert start!114200)

(declare-fun b!1356666 () Bool)

(declare-fun res!901425 () Bool)

(declare-fun e!770143 () Bool)

(assert (=> b!1356666 (=> (not res!901425) (not e!770143))))

(declare-datatypes ((List!31680 0))(
  ( (Nil!31677) (Cons!31676 (h!32885 (_ BitVec 64)) (t!46338 List!31680)) )
))
(declare-fun acc!759 () List!31680)

(declare-fun contains!9389 (List!31680 (_ BitVec 64)) Bool)

(assert (=> b!1356666 (= res!901425 (not (contains!9389 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356667 () Bool)

(declare-fun res!901423 () Bool)

(assert (=> b!1356667 (=> (not res!901423) (not e!770143))))

(assert (=> b!1356667 (= res!901423 (not (contains!9389 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356668 () Bool)

(declare-fun res!901424 () Bool)

(assert (=> b!1356668 (=> (not res!901424) (not e!770143))))

(declare-datatypes ((array!92382 0))(
  ( (array!92383 (arr!44639 (Array (_ BitVec 32) (_ BitVec 64))) (size!45189 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92382)

(declare-fun arrayNoDuplicates!0 (array!92382 (_ BitVec 32) List!31680) Bool)

(assert (=> b!1356668 (= res!901424 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31677))))

(declare-fun b!1356669 () Bool)

(assert (=> b!1356669 (= e!770143 false)))

(declare-fun lt!599074 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356669 (= lt!599074 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!901422 () Bool)

(assert (=> start!114200 (=> (not res!901422) (not e!770143))))

(assert (=> start!114200 (= res!901422 (and (bvslt (size!45189 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45189 a!3742))))))

(assert (=> start!114200 e!770143))

(declare-fun array_inv!33667 (array!92382) Bool)

(assert (=> start!114200 (array_inv!33667 a!3742)))

(assert (=> start!114200 true))

(declare-fun b!1356670 () Bool)

(declare-fun res!901426 () Bool)

(assert (=> b!1356670 (=> (not res!901426) (not e!770143))))

(declare-fun noDuplicate!2246 (List!31680) Bool)

(assert (=> b!1356670 (= res!901426 (noDuplicate!2246 acc!759))))

(assert (= (and start!114200 res!901422) b!1356670))

(assert (= (and b!1356670 res!901426) b!1356666))

(assert (= (and b!1356666 res!901425) b!1356667))

(assert (= (and b!1356667 res!901423) b!1356668))

(assert (= (and b!1356668 res!901424) b!1356669))

(declare-fun m!1242619 () Bool)

(assert (=> b!1356670 m!1242619))

(declare-fun m!1242621 () Bool)

(assert (=> start!114200 m!1242621))

(declare-fun m!1242623 () Bool)

(assert (=> b!1356667 m!1242623))

(declare-fun m!1242625 () Bool)

(assert (=> b!1356669 m!1242625))

(declare-fun m!1242627 () Bool)

(assert (=> b!1356668 m!1242627))

(declare-fun m!1242629 () Bool)

(assert (=> b!1356666 m!1242629))

(push 1)

(assert (not start!114200))

(assert (not b!1356669))

(assert (not b!1356667))

(assert (not b!1356668))

(assert (not b!1356666))

(assert (not b!1356670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

