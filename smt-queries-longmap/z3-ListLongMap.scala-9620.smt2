; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113822 () Bool)

(assert start!113822)

(declare-fun res!895665 () Bool)

(declare-fun e!768075 () Bool)

(assert (=> start!113822 (=> (not res!895665) (not e!768075))))

(declare-datatypes ((array!91983 0))(
  ( (array!91984 (arr!44443 (Array (_ BitVec 32) (_ BitVec 64))) (size!44995 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!91983)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113822 (= res!895665 (and (bvslt (size!44995 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!44995 a!3742))))))

(assert (=> start!113822 e!768075))

(declare-fun array_inv!33676 (array!91983) Bool)

(assert (=> start!113822 (array_inv!33676 a!3742)))

(assert (=> start!113822 true))

(declare-fun b!1350166 () Bool)

(declare-fun res!895666 () Bool)

(assert (=> b!1350166 (=> (not res!895666) (not e!768075))))

(declare-datatypes ((List!31562 0))(
  ( (Nil!31559) (Cons!31558 (h!32767 (_ BitVec 64)) (t!46212 List!31562)) )
))
(declare-fun acc!759 () List!31562)

(declare-fun noDuplicate!2097 (List!31562) Bool)

(assert (=> b!1350166 (= res!895666 (noDuplicate!2097 acc!759))))

(declare-fun b!1350167 () Bool)

(declare-fun res!895667 () Bool)

(assert (=> b!1350167 (=> (not res!895667) (not e!768075))))

(declare-fun contains!9182 (List!31562 (_ BitVec 64)) Bool)

(assert (=> b!1350167 (= res!895667 (not (contains!9182 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350168 () Bool)

(assert (=> b!1350168 (= e!768075 false)))

(declare-fun lt!596761 () Bool)

(assert (=> b!1350168 (= lt!596761 (contains!9182 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113822 res!895665) b!1350166))

(assert (= (and b!1350166 res!895666) b!1350167))

(assert (= (and b!1350167 res!895667) b!1350168))

(declare-fun m!1236967 () Bool)

(assert (=> start!113822 m!1236967))

(declare-fun m!1236969 () Bool)

(assert (=> b!1350166 m!1236969))

(declare-fun m!1236971 () Bool)

(assert (=> b!1350167 m!1236971))

(declare-fun m!1236973 () Bool)

(assert (=> b!1350168 m!1236973))

(check-sat (not b!1350168) (not b!1350166) (not b!1350167) (not start!113822))
(check-sat)
