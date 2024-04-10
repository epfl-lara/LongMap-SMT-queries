; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118282 () Bool)

(assert start!118282)

(declare-fun b!1383426 () Bool)

(declare-fun res!925020 () Bool)

(declare-fun e!784096 () Bool)

(assert (=> b!1383426 (=> (not res!925020) (not e!784096))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94585 0))(
  ( (array!94586 (arr!45670 (Array (_ BitVec 32) (_ BitVec 64))) (size!46220 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94585)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383426 (= res!925020 (and (= (size!46220 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46220 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46220 a!2938))))))

(declare-fun b!1383429 () Bool)

(assert (=> b!1383429 (= e!784096 false)))

(declare-fun lt!608613 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94585 (_ BitVec 32)) Bool)

(assert (=> b!1383429 (= lt!608613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383428 () Bool)

(declare-fun res!925018 () Bool)

(assert (=> b!1383428 (=> (not res!925018) (not e!784096))))

(declare-datatypes ((List!32198 0))(
  ( (Nil!32195) (Cons!32194 (h!33403 (_ BitVec 64)) (t!46892 List!32198)) )
))
(declare-fun arrayNoDuplicates!0 (array!94585 (_ BitVec 32) List!32198) Bool)

(assert (=> b!1383428 (= res!925018 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32195))))

(declare-fun b!1383427 () Bool)

(declare-fun res!925019 () Bool)

(assert (=> b!1383427 (=> (not res!925019) (not e!784096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383427 (= res!925019 (validKeyInArray!0 (select (arr!45670 a!2938) i!1065)))))

(declare-fun res!925021 () Bool)

(assert (=> start!118282 (=> (not res!925021) (not e!784096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118282 (= res!925021 (validMask!0 mask!2987))))

(assert (=> start!118282 e!784096))

(assert (=> start!118282 true))

(declare-fun array_inv!34698 (array!94585) Bool)

(assert (=> start!118282 (array_inv!34698 a!2938)))

(assert (= (and start!118282 res!925021) b!1383426))

(assert (= (and b!1383426 res!925020) b!1383427))

(assert (= (and b!1383427 res!925019) b!1383428))

(assert (= (and b!1383428 res!925018) b!1383429))

(declare-fun m!1268529 () Bool)

(assert (=> b!1383429 m!1268529))

(declare-fun m!1268531 () Bool)

(assert (=> b!1383428 m!1268531))

(declare-fun m!1268533 () Bool)

(assert (=> b!1383427 m!1268533))

(assert (=> b!1383427 m!1268533))

(declare-fun m!1268535 () Bool)

(assert (=> b!1383427 m!1268535))

(declare-fun m!1268537 () Bool)

(assert (=> start!118282 m!1268537))

(declare-fun m!1268539 () Bool)

(assert (=> start!118282 m!1268539))

(push 1)

(assert (not start!118282))

(assert (not b!1383428))

(assert (not b!1383427))

(assert (not b!1383429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

