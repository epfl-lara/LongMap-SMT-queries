; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117928 () Bool)

(assert start!117928)

(declare-fun b!1381651 () Bool)

(declare-fun res!923278 () Bool)

(declare-fun e!783197 () Bool)

(assert (=> b!1381651 (=> (not res!923278) (not e!783197))))

(declare-datatypes ((array!94319 0))(
  ( (array!94320 (arr!45542 (Array (_ BitVec 32) (_ BitVec 64))) (size!46092 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94319)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381651 (= res!923278 (validKeyInArray!0 (select (arr!45542 a!2971) i!1094)))))

(declare-fun b!1381653 () Bool)

(assert (=> b!1381653 (= e!783197 false)))

(declare-fun lt!608253 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94319 (_ BitVec 32)) Bool)

(assert (=> b!1381653 (= lt!608253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381652 () Bool)

(declare-fun res!923280 () Bool)

(assert (=> b!1381652 (=> (not res!923280) (not e!783197))))

(declare-datatypes ((List!32076 0))(
  ( (Nil!32073) (Cons!32072 (h!33281 (_ BitVec 64)) (t!46770 List!32076)) )
))
(declare-fun arrayNoDuplicates!0 (array!94319 (_ BitVec 32) List!32076) Bool)

(assert (=> b!1381652 (= res!923280 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32073))))

(declare-fun b!1381650 () Bool)

(declare-fun res!923281 () Bool)

(assert (=> b!1381650 (=> (not res!923281) (not e!783197))))

(assert (=> b!1381650 (= res!923281 (and (= (size!46092 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46092 a!2971))))))

(declare-fun res!923279 () Bool)

(assert (=> start!117928 (=> (not res!923279) (not e!783197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117928 (= res!923279 (validMask!0 mask!3034))))

(assert (=> start!117928 e!783197))

(assert (=> start!117928 true))

(declare-fun array_inv!34570 (array!94319) Bool)

(assert (=> start!117928 (array_inv!34570 a!2971)))

(assert (= (and start!117928 res!923279) b!1381650))

(assert (= (and b!1381650 res!923281) b!1381651))

(assert (= (and b!1381651 res!923278) b!1381652))

(assert (= (and b!1381652 res!923280) b!1381653))

(declare-fun m!1266831 () Bool)

(assert (=> b!1381651 m!1266831))

(assert (=> b!1381651 m!1266831))

(declare-fun m!1266833 () Bool)

(assert (=> b!1381651 m!1266833))

(declare-fun m!1266835 () Bool)

(assert (=> b!1381653 m!1266835))

(declare-fun m!1266837 () Bool)

(assert (=> b!1381652 m!1266837))

(declare-fun m!1266839 () Bool)

(assert (=> start!117928 m!1266839))

(declare-fun m!1266841 () Bool)

(assert (=> start!117928 m!1266841))

(push 1)

(assert (not start!117928))

(assert (not b!1381652))

(assert (not b!1381651))

(assert (not b!1381653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

