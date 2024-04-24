; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118746 () Bool)

(assert start!118746)

(declare-fun b!1387128 () Bool)

(declare-fun res!927591 () Bool)

(declare-fun e!786016 () Bool)

(assert (=> b!1387128 (=> (not res!927591) (not e!786016))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94920 0))(
  ( (array!94921 (arr!45834 (Array (_ BitVec 32) (_ BitVec 64))) (size!46385 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94920)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387128 (= res!927591 (and (= (size!46385 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46385 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46385 a!2938))))))

(declare-fun res!927592 () Bool)

(assert (=> start!118746 (=> (not res!927592) (not e!786016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118746 (= res!927592 (validMask!0 mask!2987))))

(assert (=> start!118746 e!786016))

(assert (=> start!118746 true))

(declare-fun array_inv!35115 (array!94920) Bool)

(assert (=> start!118746 (array_inv!35115 a!2938)))

(declare-fun b!1387130 () Bool)

(declare-fun res!927589 () Bool)

(assert (=> b!1387130 (=> (not res!927589) (not e!786016))))

(declare-datatypes ((List!32349 0))(
  ( (Nil!32346) (Cons!32345 (h!33563 (_ BitVec 64)) (t!47035 List!32349)) )
))
(declare-fun arrayNoDuplicates!0 (array!94920 (_ BitVec 32) List!32349) Bool)

(assert (=> b!1387130 (= res!927589 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32346))))

(declare-fun b!1387129 () Bool)

(declare-fun res!927590 () Bool)

(assert (=> b!1387129 (=> (not res!927590) (not e!786016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387129 (= res!927590 (validKeyInArray!0 (select (arr!45834 a!2938) i!1065)))))

(declare-fun b!1387131 () Bool)

(assert (=> b!1387131 (= e!786016 false)))

(declare-fun lt!609804 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94920 (_ BitVec 32)) Bool)

(assert (=> b!1387131 (= lt!609804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118746 res!927592) b!1387128))

(assert (= (and b!1387128 res!927591) b!1387129))

(assert (= (and b!1387129 res!927590) b!1387130))

(assert (= (and b!1387130 res!927589) b!1387131))

(declare-fun m!1272729 () Bool)

(assert (=> start!118746 m!1272729))

(declare-fun m!1272731 () Bool)

(assert (=> start!118746 m!1272731))

(declare-fun m!1272733 () Bool)

(assert (=> b!1387130 m!1272733))

(declare-fun m!1272735 () Bool)

(assert (=> b!1387129 m!1272735))

(assert (=> b!1387129 m!1272735))

(declare-fun m!1272737 () Bool)

(assert (=> b!1387129 m!1272737))

(declare-fun m!1272739 () Bool)

(assert (=> b!1387131 m!1272739))

(push 1)

(assert (not b!1387129))

(assert (not b!1387131))

(assert (not b!1387130))

(assert (not start!118746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

