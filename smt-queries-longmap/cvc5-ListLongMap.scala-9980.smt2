; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118104 () Bool)

(assert start!118104)

(declare-fun res!923590 () Bool)

(declare-fun e!783931 () Bool)

(assert (=> start!118104 (=> (not res!923590) (not e!783931))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118104 (= res!923590 (validMask!0 mask!3034))))

(assert (=> start!118104 e!783931))

(assert (=> start!118104 true))

(declare-datatypes ((array!94391 0))(
  ( (array!94392 (arr!45576 (Array (_ BitVec 32) (_ BitVec 64))) (size!46127 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94391)

(declare-fun array_inv!34857 (array!94391) Bool)

(assert (=> start!118104 (array_inv!34857 a!2971)))

(declare-fun b!1382749 () Bool)

(declare-fun res!923588 () Bool)

(assert (=> b!1382749 (=> (not res!923588) (not e!783931))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382749 (= res!923588 (and (= (size!46127 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46127 a!2971))))))

(declare-fun b!1382750 () Bool)

(declare-fun res!923589 () Bool)

(assert (=> b!1382750 (=> (not res!923589) (not e!783931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382750 (= res!923589 (validKeyInArray!0 (select (arr!45576 a!2971) i!1094)))))

(declare-fun b!1382751 () Bool)

(assert (=> b!1382751 (= e!783931 false)))

(declare-fun lt!608685 () Bool)

(declare-datatypes ((List!32097 0))(
  ( (Nil!32094) (Cons!32093 (h!33311 (_ BitVec 64)) (t!46783 List!32097)) )
))
(declare-fun arrayNoDuplicates!0 (array!94391 (_ BitVec 32) List!32097) Bool)

(assert (=> b!1382751 (= lt!608685 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32094))))

(assert (= (and start!118104 res!923590) b!1382749))

(assert (= (and b!1382749 res!923588) b!1382750))

(assert (= (and b!1382750 res!923589) b!1382751))

(declare-fun m!1268255 () Bool)

(assert (=> start!118104 m!1268255))

(declare-fun m!1268257 () Bool)

(assert (=> start!118104 m!1268257))

(declare-fun m!1268259 () Bool)

(assert (=> b!1382750 m!1268259))

(assert (=> b!1382750 m!1268259))

(declare-fun m!1268261 () Bool)

(assert (=> b!1382750 m!1268261))

(declare-fun m!1268263 () Bool)

(assert (=> b!1382751 m!1268263))

(push 1)

(assert (not b!1382750))

(assert (not start!118104))

(assert (not b!1382751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

