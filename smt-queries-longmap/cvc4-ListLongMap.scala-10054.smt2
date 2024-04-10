; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118462 () Bool)

(assert start!118462)

(declare-fun res!926614 () Bool)

(declare-fun e!784952 () Bool)

(assert (=> start!118462 (=> (not res!926614) (not e!784952))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118462 (= res!926614 (validMask!0 mask!2987))))

(assert (=> start!118462 e!784952))

(assert (=> start!118462 true))

(declare-datatypes ((array!94738 0))(
  ( (array!94739 (arr!45745 (Array (_ BitVec 32) (_ BitVec 64))) (size!46295 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94738)

(declare-fun array_inv!34773 (array!94738) Bool)

(assert (=> start!118462 (array_inv!34773 a!2938)))

(declare-fun b!1385364 () Bool)

(assert (=> b!1385364 (= e!784952 false)))

(declare-fun lt!609225 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94738 (_ BitVec 32)) Bool)

(assert (=> b!1385364 (= lt!609225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385362 () Bool)

(declare-fun res!926612 () Bool)

(assert (=> b!1385362 (=> (not res!926612) (not e!784952))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385362 (= res!926612 (validKeyInArray!0 (select (arr!45745 a!2938) i!1065)))))

(declare-fun b!1385361 () Bool)

(declare-fun res!926613 () Bool)

(assert (=> b!1385361 (=> (not res!926613) (not e!784952))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385361 (= res!926613 (and (= (size!46295 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46295 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46295 a!2938))))))

(declare-fun b!1385363 () Bool)

(declare-fun res!926611 () Bool)

(assert (=> b!1385363 (=> (not res!926611) (not e!784952))))

(declare-datatypes ((List!32273 0))(
  ( (Nil!32270) (Cons!32269 (h!33478 (_ BitVec 64)) (t!46967 List!32273)) )
))
(declare-fun arrayNoDuplicates!0 (array!94738 (_ BitVec 32) List!32273) Bool)

(assert (=> b!1385363 (= res!926611 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32270))))

(assert (= (and start!118462 res!926614) b!1385361))

(assert (= (and b!1385361 res!926613) b!1385362))

(assert (= (and b!1385362 res!926612) b!1385363))

(assert (= (and b!1385363 res!926611) b!1385364))

(declare-fun m!1270653 () Bool)

(assert (=> start!118462 m!1270653))

(declare-fun m!1270655 () Bool)

(assert (=> start!118462 m!1270655))

(declare-fun m!1270657 () Bool)

(assert (=> b!1385364 m!1270657))

(declare-fun m!1270659 () Bool)

(assert (=> b!1385362 m!1270659))

(assert (=> b!1385362 m!1270659))

(declare-fun m!1270661 () Bool)

(assert (=> b!1385362 m!1270661))

(declare-fun m!1270663 () Bool)

(assert (=> b!1385363 m!1270663))

(push 1)

(assert (not b!1385364))

(assert (not b!1385362))

(assert (not b!1385363))

(assert (not start!118462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

