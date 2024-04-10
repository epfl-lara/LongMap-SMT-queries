; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117896 () Bool)

(assert start!117896)

(declare-fun res!923098 () Bool)

(declare-fun e!783101 () Bool)

(assert (=> start!117896 (=> (not res!923098) (not e!783101))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117896 (= res!923098 (validMask!0 mask!3034))))

(assert (=> start!117896 e!783101))

(assert (=> start!117896 true))

(declare-datatypes ((array!94287 0))(
  ( (array!94288 (arr!45526 (Array (_ BitVec 32) (_ BitVec 64))) (size!46076 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94287)

(declare-fun array_inv!34554 (array!94287) Bool)

(assert (=> start!117896 (array_inv!34554 a!2971)))

(declare-fun b!1381468 () Bool)

(declare-fun res!923096 () Bool)

(assert (=> b!1381468 (=> (not res!923096) (not e!783101))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381468 (= res!923096 (and (= (size!46076 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46076 a!2971))))))

(declare-fun b!1381469 () Bool)

(declare-fun res!923097 () Bool)

(assert (=> b!1381469 (=> (not res!923097) (not e!783101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381469 (= res!923097 (validKeyInArray!0 (select (arr!45526 a!2971) i!1094)))))

(declare-fun b!1381470 () Bool)

(assert (=> b!1381470 (= e!783101 false)))

(declare-fun lt!608214 () Bool)

(declare-datatypes ((List!32060 0))(
  ( (Nil!32057) (Cons!32056 (h!33265 (_ BitVec 64)) (t!46754 List!32060)) )
))
(declare-fun arrayNoDuplicates!0 (array!94287 (_ BitVec 32) List!32060) Bool)

(assert (=> b!1381470 (= lt!608214 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32057))))

(assert (= (and start!117896 res!923098) b!1381468))

(assert (= (and b!1381468 res!923096) b!1381469))

(assert (= (and b!1381469 res!923097) b!1381470))

(declare-fun m!1266653 () Bool)

(assert (=> start!117896 m!1266653))

(declare-fun m!1266655 () Bool)

(assert (=> start!117896 m!1266655))

(declare-fun m!1266657 () Bool)

(assert (=> b!1381469 m!1266657))

(assert (=> b!1381469 m!1266657))

(declare-fun m!1266659 () Bool)

(assert (=> b!1381469 m!1266659))

(declare-fun m!1266661 () Bool)

(assert (=> b!1381470 m!1266661))

(push 1)

(assert (not b!1381470))

(assert (not start!117896))

(assert (not b!1381469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

