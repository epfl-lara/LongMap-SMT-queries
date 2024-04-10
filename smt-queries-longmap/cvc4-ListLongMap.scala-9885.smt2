; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117058 () Bool)

(assert start!117058)

(declare-fun res!920626 () Bool)

(declare-fun e!780670 () Bool)

(assert (=> start!117058 (=> (not res!920626) (not e!780670))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93675 0))(
  ( (array!93676 (arr!45238 (Array (_ BitVec 32) (_ BitVec 64))) (size!45788 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93675)

(assert (=> start!117058 (= res!920626 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45788 a!4094))))))

(assert (=> start!117058 e!780670))

(assert (=> start!117058 true))

(declare-fun array_inv!34266 (array!93675) Bool)

(assert (=> start!117058 (array_inv!34266 a!4094)))

(declare-fun b!1378090 () Bool)

(declare-fun res!920625 () Bool)

(assert (=> b!1378090 (=> (not res!920625) (not e!780670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378090 (= res!920625 (validKeyInArray!0 (select (arr!45238 a!4094) i!1451)))))

(declare-fun b!1378091 () Bool)

(declare-fun res!920624 () Bool)

(assert (=> b!1378091 (=> (not res!920624) (not e!780670))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378091 (= res!920624 (not (validKeyInArray!0 k!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378092 () Bool)

(assert (=> b!1378092 (= e!780670 (and (bvslt (size!45788 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45788 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117058 res!920626) b!1378090))

(assert (= (and b!1378090 res!920625) b!1378091))

(assert (= (and b!1378091 res!920624) b!1378092))

(declare-fun m!1262533 () Bool)

(assert (=> start!117058 m!1262533))

(declare-fun m!1262535 () Bool)

(assert (=> b!1378090 m!1262535))

(assert (=> b!1378090 m!1262535))

(declare-fun m!1262537 () Bool)

(assert (=> b!1378090 m!1262537))

(declare-fun m!1262539 () Bool)

(assert (=> b!1378091 m!1262539))

(push 1)

(assert (not start!117058))

(assert (not b!1378090))

(assert (not b!1378091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

