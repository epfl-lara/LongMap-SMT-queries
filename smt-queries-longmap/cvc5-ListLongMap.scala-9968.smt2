; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117708 () Bool)

(assert start!117708)

(declare-fun res!922755 () Bool)

(declare-fun e!782776 () Bool)

(assert (=> start!117708 (=> (not res!922755) (not e!782776))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94190 0))(
  ( (array!94191 (arr!45485 (Array (_ BitVec 32) (_ BitVec 64))) (size!46035 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94190)

(assert (=> start!117708 (= res!922755 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46035 a!3464)) (bvslt (size!46035 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117708 e!782776))

(assert (=> start!117708 true))

(declare-fun array_inv!34513 (array!94190) Bool)

(assert (=> start!117708 (array_inv!34513 a!3464)))

(declare-fun b!1381055 () Bool)

(declare-fun res!922756 () Bool)

(assert (=> b!1381055 (=> (not res!922756) (not e!782776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381055 (= res!922756 (not (validKeyInArray!0 (select (arr!45485 a!3464) from!2839))))))

(declare-fun b!1381056 () Bool)

(assert (=> b!1381056 (= e!782776 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117708 res!922755) b!1381055))

(assert (= (and b!1381055 res!922756) b!1381056))

(declare-fun m!1266273 () Bool)

(assert (=> start!117708 m!1266273))

(declare-fun m!1266275 () Bool)

(assert (=> b!1381055 m!1266275))

(assert (=> b!1381055 m!1266275))

(declare-fun m!1266277 () Bool)

(assert (=> b!1381055 m!1266277))

(push 1)

(assert (not b!1381055))

(assert (not start!117708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

