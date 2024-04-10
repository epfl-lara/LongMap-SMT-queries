; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113876 () Bool)

(assert start!113876)

(declare-fun b!1350483 () Bool)

(declare-fun res!895942 () Bool)

(declare-fun e!768280 () Bool)

(assert (=> b!1350483 (=> (not res!895942) (not e!768280))))

(declare-datatypes ((List!31518 0))(
  ( (Nil!31515) (Cons!31514 (h!32723 (_ BitVec 64)) (t!46176 List!31518)) )
))
(declare-fun acc!759 () List!31518)

(declare-fun contains!9227 (List!31518 (_ BitVec 64)) Bool)

(assert (=> b!1350483 (= res!895942 (not (contains!9227 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350484 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92058 0))(
  ( (array!92059 (arr!44477 (Array (_ BitVec 32) (_ BitVec 64))) (size!45027 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92058)

(assert (=> b!1350484 (= e!768280 (bvsgt from!3120 (size!45027 a!3742)))))

(declare-fun b!1350485 () Bool)

(declare-fun res!895945 () Bool)

(assert (=> b!1350485 (=> (not res!895945) (not e!768280))))

(declare-fun arrayNoDuplicates!0 (array!92058 (_ BitVec 32) List!31518) Bool)

(assert (=> b!1350485 (= res!895945 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31515))))

(declare-fun b!1350486 () Bool)

(declare-fun res!895941 () Bool)

(assert (=> b!1350486 (=> (not res!895941) (not e!768280))))

(assert (=> b!1350486 (= res!895941 (not (contains!9227 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350487 () Bool)

(declare-fun res!895943 () Bool)

(assert (=> b!1350487 (=> (not res!895943) (not e!768280))))

(declare-fun noDuplicate!2084 (List!31518) Bool)

(assert (=> b!1350487 (= res!895943 (noDuplicate!2084 acc!759))))

(declare-fun res!895944 () Bool)

(assert (=> start!113876 (=> (not res!895944) (not e!768280))))

(assert (=> start!113876 (= res!895944 (and (bvslt (size!45027 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45027 a!3742))))))

(assert (=> start!113876 e!768280))

(declare-fun array_inv!33505 (array!92058) Bool)

(assert (=> start!113876 (array_inv!33505 a!3742)))

(assert (=> start!113876 true))

(assert (= (and start!113876 res!895944) b!1350487))

(assert (= (and b!1350487 res!895943) b!1350486))

(assert (= (and b!1350486 res!895941) b!1350483))

(assert (= (and b!1350483 res!895942) b!1350485))

(assert (= (and b!1350485 res!895945) b!1350484))

(declare-fun m!1237717 () Bool)

(assert (=> b!1350485 m!1237717))

(declare-fun m!1237719 () Bool)

(assert (=> b!1350486 m!1237719))

(declare-fun m!1237721 () Bool)

(assert (=> start!113876 m!1237721))

(declare-fun m!1237723 () Bool)

(assert (=> b!1350483 m!1237723))

(declare-fun m!1237725 () Bool)

(assert (=> b!1350487 m!1237725))

(push 1)

(assert (not b!1350487))

(assert (not b!1350483))

(assert (not b!1350485))

(assert (not start!113876))

(assert (not b!1350486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

