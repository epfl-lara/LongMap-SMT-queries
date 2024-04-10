; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117890 () Bool)

(assert start!117890)

(declare-fun res!923070 () Bool)

(declare-fun e!783083 () Bool)

(assert (=> start!117890 (=> (not res!923070) (not e!783083))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117890 (= res!923070 (validMask!0 mask!3034))))

(assert (=> start!117890 e!783083))

(assert (=> start!117890 true))

(declare-datatypes ((array!94281 0))(
  ( (array!94282 (arr!45523 (Array (_ BitVec 32) (_ BitVec 64))) (size!46073 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94281)

(declare-fun array_inv!34551 (array!94281) Bool)

(assert (=> start!117890 (array_inv!34551 a!2971)))

(declare-fun b!1381441 () Bool)

(declare-fun res!923071 () Bool)

(assert (=> b!1381441 (=> (not res!923071) (not e!783083))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381441 (= res!923071 (and (= (size!46073 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46073 a!2971))))))

(declare-fun b!1381442 () Bool)

(declare-fun res!923069 () Bool)

(assert (=> b!1381442 (=> (not res!923069) (not e!783083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381442 (= res!923069 (validKeyInArray!0 (select (arr!45523 a!2971) i!1094)))))

(declare-fun b!1381443 () Bool)

(assert (=> b!1381443 (= e!783083 false)))

(declare-fun lt!608205 () Bool)

(declare-datatypes ((List!32057 0))(
  ( (Nil!32054) (Cons!32053 (h!33262 (_ BitVec 64)) (t!46751 List!32057)) )
))
(declare-fun arrayNoDuplicates!0 (array!94281 (_ BitVec 32) List!32057) Bool)

(assert (=> b!1381443 (= lt!608205 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32054))))

(assert (= (and start!117890 res!923070) b!1381441))

(assert (= (and b!1381441 res!923071) b!1381442))

(assert (= (and b!1381442 res!923069) b!1381443))

(declare-fun m!1266623 () Bool)

(assert (=> start!117890 m!1266623))

(declare-fun m!1266625 () Bool)

(assert (=> start!117890 m!1266625))

(declare-fun m!1266627 () Bool)

(assert (=> b!1381442 m!1266627))

(assert (=> b!1381442 m!1266627))

(declare-fun m!1266629 () Bool)

(assert (=> b!1381442 m!1266629))

(declare-fun m!1266631 () Bool)

(assert (=> b!1381443 m!1266631))

(push 1)

(assert (not b!1381443))

(assert (not start!117890))

(assert (not b!1381442))

(check-sat)

(pop 1)

