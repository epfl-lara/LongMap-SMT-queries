; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118194 () Bool)

(assert start!118194)

(declare-fun res!924517 () Bool)

(declare-fun e!783832 () Bool)

(assert (=> start!118194 (=> (not res!924517) (not e!783832))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118194 (= res!924517 (validMask!0 mask!2987))))

(assert (=> start!118194 e!783832))

(assert (=> start!118194 true))

(declare-datatypes ((array!94497 0))(
  ( (array!94498 (arr!45626 (Array (_ BitVec 32) (_ BitVec 64))) (size!46176 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94497)

(declare-fun array_inv!34654 (array!94497) Bool)

(assert (=> start!118194 (array_inv!34654 a!2938)))

(declare-fun b!1382923 () Bool)

(declare-fun res!924516 () Bool)

(assert (=> b!1382923 (=> (not res!924516) (not e!783832))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382923 (= res!924516 (and (= (size!46176 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46176 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46176 a!2938))))))

(declare-fun b!1382924 () Bool)

(declare-fun res!924515 () Bool)

(assert (=> b!1382924 (=> (not res!924515) (not e!783832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382924 (= res!924515 (validKeyInArray!0 (select (arr!45626 a!2938) i!1065)))))

(declare-fun b!1382925 () Bool)

(assert (=> b!1382925 (= e!783832 false)))

(declare-fun lt!608490 () Bool)

(declare-datatypes ((List!32154 0))(
  ( (Nil!32151) (Cons!32150 (h!33359 (_ BitVec 64)) (t!46848 List!32154)) )
))
(declare-fun arrayNoDuplicates!0 (array!94497 (_ BitVec 32) List!32154) Bool)

(assert (=> b!1382925 (= lt!608490 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32151))))

(assert (= (and start!118194 res!924517) b!1382923))

(assert (= (and b!1382923 res!924516) b!1382924))

(assert (= (and b!1382924 res!924515) b!1382925))

(declare-fun m!1268025 () Bool)

(assert (=> start!118194 m!1268025))

(declare-fun m!1268027 () Bool)

(assert (=> start!118194 m!1268027))

(declare-fun m!1268029 () Bool)

(assert (=> b!1382924 m!1268029))

(assert (=> b!1382924 m!1268029))

(declare-fun m!1268031 () Bool)

(assert (=> b!1382924 m!1268031))

(declare-fun m!1268033 () Bool)

(assert (=> b!1382925 m!1268033))

(push 1)

(assert (not b!1382925))

(assert (not b!1382924))

(assert (not start!118194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

