; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113816 () Bool)

(assert start!113816)

(declare-fun b!1350202 () Bool)

(declare-fun res!895661 () Bool)

(declare-fun e!768090 () Bool)

(assert (=> b!1350202 (=> (not res!895661) (not e!768090))))

(declare-datatypes ((List!31506 0))(
  ( (Nil!31503) (Cons!31502 (h!32711 (_ BitVec 64)) (t!46164 List!31506)) )
))
(declare-fun acc!759 () List!31506)

(declare-fun noDuplicate!2072 (List!31506) Bool)

(assert (=> b!1350202 (= res!895661 (noDuplicate!2072 acc!759))))

(declare-fun b!1350203 () Bool)

(declare-fun res!895660 () Bool)

(assert (=> b!1350203 (=> (not res!895660) (not e!768090))))

(declare-fun contains!9215 (List!31506 (_ BitVec 64)) Bool)

(assert (=> b!1350203 (= res!895660 (not (contains!9215 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895662 () Bool)

(assert (=> start!113816 (=> (not res!895662) (not e!768090))))

(declare-datatypes ((array!92028 0))(
  ( (array!92029 (arr!44465 (Array (_ BitVec 32) (_ BitVec 64))) (size!45015 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92028)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113816 (= res!895662 (and (bvslt (size!45015 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45015 a!3742))))))

(assert (=> start!113816 e!768090))

(declare-fun array_inv!33493 (array!92028) Bool)

(assert (=> start!113816 (array_inv!33493 a!3742)))

(assert (=> start!113816 true))

(declare-fun b!1350204 () Bool)

(declare-fun res!895663 () Bool)

(assert (=> b!1350204 (=> (not res!895663) (not e!768090))))

(assert (=> b!1350204 (= res!895663 (not (contains!9215 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350205 () Bool)

(assert (=> b!1350205 (= e!768090 (bvsgt #b00000000000000000000000000000000 (size!45015 a!3742)))))

(assert (= (and start!113816 res!895662) b!1350202))

(assert (= (and b!1350202 res!895661) b!1350203))

(assert (= (and b!1350203 res!895660) b!1350204))

(assert (= (and b!1350204 res!895663) b!1350205))

(declare-fun m!1237459 () Bool)

(assert (=> b!1350202 m!1237459))

(declare-fun m!1237461 () Bool)

(assert (=> b!1350203 m!1237461))

(declare-fun m!1237463 () Bool)

(assert (=> start!113816 m!1237463))

(declare-fun m!1237465 () Bool)

(assert (=> b!1350204 m!1237465))

(push 1)

