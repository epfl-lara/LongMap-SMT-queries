; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118546 () Bool)

(assert start!118546)

(declare-fun res!927145 () Bool)

(declare-fun e!785204 () Bool)

(assert (=> start!118546 (=> (not res!927145) (not e!785204))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118546 (= res!927145 (validMask!0 mask!2987))))

(assert (=> start!118546 e!785204))

(assert (=> start!118546 true))

(declare-datatypes ((array!94822 0))(
  ( (array!94823 (arr!45787 (Array (_ BitVec 32) (_ BitVec 64))) (size!46337 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94822)

(declare-fun array_inv!34815 (array!94822) Bool)

(assert (=> start!118546 (array_inv!34815 a!2938)))

(declare-fun b!1385894 () Bool)

(declare-fun res!927143 () Bool)

(assert (=> b!1385894 (=> (not res!927143) (not e!785204))))

(declare-datatypes ((List!32315 0))(
  ( (Nil!32312) (Cons!32311 (h!33520 (_ BitVec 64)) (t!47009 List!32315)) )
))
(declare-fun arrayNoDuplicates!0 (array!94822 (_ BitVec 32) List!32315) Bool)

(assert (=> b!1385894 (= res!927143 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32312))))

(declare-fun b!1385893 () Bool)

(declare-fun res!927144 () Bool)

(assert (=> b!1385893 (=> (not res!927144) (not e!785204))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385893 (= res!927144 (validKeyInArray!0 (select (arr!45787 a!2938) i!1065)))))

(declare-fun b!1385895 () Bool)

(assert (=> b!1385895 (= e!785204 false)))

(declare-fun lt!609342 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94822 (_ BitVec 32)) Bool)

(assert (=> b!1385895 (= lt!609342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385892 () Bool)

(declare-fun res!927142 () Bool)

(assert (=> b!1385892 (=> (not res!927142) (not e!785204))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385892 (= res!927142 (and (= (size!46337 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46337 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46337 a!2938))))))

(assert (= (and start!118546 res!927145) b!1385892))

(assert (= (and b!1385892 res!927142) b!1385893))

(assert (= (and b!1385893 res!927144) b!1385894))

(assert (= (and b!1385894 res!927143) b!1385895))

(declare-fun m!1271169 () Bool)

(assert (=> start!118546 m!1271169))

(declare-fun m!1271171 () Bool)

(assert (=> start!118546 m!1271171))

(declare-fun m!1271173 () Bool)

(assert (=> b!1385894 m!1271173))

(declare-fun m!1271175 () Bool)

(assert (=> b!1385893 m!1271175))

(assert (=> b!1385893 m!1271175))

(declare-fun m!1271177 () Bool)

(assert (=> b!1385893 m!1271177))

(declare-fun m!1271179 () Bool)

(assert (=> b!1385895 m!1271179))

(push 1)

(assert (not b!1385895))

(assert (not start!118546))

(assert (not b!1385894))

(assert (not b!1385893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

