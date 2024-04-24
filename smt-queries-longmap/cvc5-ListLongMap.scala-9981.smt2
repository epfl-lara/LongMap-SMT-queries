; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118110 () Bool)

(assert start!118110)

(declare-fun res!923616 () Bool)

(declare-fun e!783948 () Bool)

(assert (=> start!118110 (=> (not res!923616) (not e!783948))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118110 (= res!923616 (validMask!0 mask!3034))))

(assert (=> start!118110 e!783948))

(assert (=> start!118110 true))

(declare-datatypes ((array!94397 0))(
  ( (array!94398 (arr!45579 (Array (_ BitVec 32) (_ BitVec 64))) (size!46130 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94397)

(declare-fun array_inv!34860 (array!94397) Bool)

(assert (=> start!118110 (array_inv!34860 a!2971)))

(declare-fun b!1382776 () Bool)

(declare-fun res!923617 () Bool)

(assert (=> b!1382776 (=> (not res!923617) (not e!783948))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382776 (= res!923617 (and (= (size!46130 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46130 a!2971))))))

(declare-fun b!1382777 () Bool)

(declare-fun res!923615 () Bool)

(assert (=> b!1382777 (=> (not res!923615) (not e!783948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382777 (= res!923615 (validKeyInArray!0 (select (arr!45579 a!2971) i!1094)))))

(declare-fun b!1382778 () Bool)

(assert (=> b!1382778 (= e!783948 false)))

(declare-fun lt!608694 () Bool)

(declare-datatypes ((List!32100 0))(
  ( (Nil!32097) (Cons!32096 (h!33314 (_ BitVec 64)) (t!46786 List!32100)) )
))
(declare-fun arrayNoDuplicates!0 (array!94397 (_ BitVec 32) List!32100) Bool)

(assert (=> b!1382778 (= lt!608694 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32097))))

(assert (= (and start!118110 res!923616) b!1382776))

(assert (= (and b!1382776 res!923617) b!1382777))

(assert (= (and b!1382777 res!923615) b!1382778))

(declare-fun m!1268285 () Bool)

(assert (=> start!118110 m!1268285))

(declare-fun m!1268287 () Bool)

(assert (=> start!118110 m!1268287))

(declare-fun m!1268289 () Bool)

(assert (=> b!1382777 m!1268289))

(assert (=> b!1382777 m!1268289))

(declare-fun m!1268291 () Bool)

(assert (=> b!1382777 m!1268291))

(declare-fun m!1268293 () Bool)

(assert (=> b!1382778 m!1268293))

(push 1)

(assert (not b!1382777))

(assert (not start!118110))

(assert (not b!1382778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

