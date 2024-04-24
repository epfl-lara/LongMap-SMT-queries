; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118476 () Bool)

(assert start!118476)

(declare-fun b!1384629 () Bool)

(declare-fun e!784891 () Bool)

(assert (=> b!1384629 (= e!784891 false)))

(declare-fun lt!609066 () Bool)

(declare-datatypes ((array!94677 0))(
  ( (array!94678 (arr!45714 (Array (_ BitVec 32) (_ BitVec 64))) (size!46265 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94677)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94677 (_ BitVec 32)) Bool)

(assert (=> b!1384629 (= lt!609066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925431 () Bool)

(assert (=> start!118476 (=> (not res!925431) (not e!784891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118476 (= res!925431 (validMask!0 mask!2987))))

(assert (=> start!118476 e!784891))

(assert (=> start!118476 true))

(declare-fun array_inv!34995 (array!94677) Bool)

(assert (=> start!118476 (array_inv!34995 a!2938)))

(declare-fun b!1384627 () Bool)

(declare-fun res!925432 () Bool)

(assert (=> b!1384627 (=> (not res!925432) (not e!784891))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384627 (= res!925432 (validKeyInArray!0 (select (arr!45714 a!2938) i!1065)))))

(declare-fun b!1384628 () Bool)

(declare-fun res!925430 () Bool)

(assert (=> b!1384628 (=> (not res!925430) (not e!784891))))

(declare-datatypes ((List!32229 0))(
  ( (Nil!32226) (Cons!32225 (h!33443 (_ BitVec 64)) (t!46915 List!32229)) )
))
(declare-fun arrayNoDuplicates!0 (array!94677 (_ BitVec 32) List!32229) Bool)

(assert (=> b!1384628 (= res!925430 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32226))))

(declare-fun b!1384626 () Bool)

(declare-fun res!925429 () Bool)

(assert (=> b!1384626 (=> (not res!925429) (not e!784891))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384626 (= res!925429 (and (= (size!46265 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46265 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46265 a!2938))))))

(assert (= (and start!118476 res!925431) b!1384626))

(assert (= (and b!1384626 res!925429) b!1384627))

(assert (= (and b!1384627 res!925432) b!1384628))

(assert (= (and b!1384628 res!925430) b!1384629))

(declare-fun m!1270053 () Bool)

(assert (=> b!1384629 m!1270053))

(declare-fun m!1270055 () Bool)

(assert (=> start!118476 m!1270055))

(declare-fun m!1270057 () Bool)

(assert (=> start!118476 m!1270057))

(declare-fun m!1270059 () Bool)

(assert (=> b!1384627 m!1270059))

(assert (=> b!1384627 m!1270059))

(declare-fun m!1270061 () Bool)

(assert (=> b!1384627 m!1270061))

(declare-fun m!1270063 () Bool)

(assert (=> b!1384628 m!1270063))

(push 1)

(assert (not b!1384629))

(assert (not b!1384627))

(assert (not start!118476))

(assert (not b!1384628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

