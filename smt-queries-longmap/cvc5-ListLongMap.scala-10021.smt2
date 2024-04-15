; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118230 () Bool)

(assert start!118230)

(declare-fun b!1383070 () Bool)

(declare-fun res!924705 () Bool)

(declare-fun e!783922 () Bool)

(assert (=> b!1383070 (=> (not res!924705) (not e!783922))))

(declare-datatypes ((array!94486 0))(
  ( (array!94487 (arr!45621 (Array (_ BitVec 32) (_ BitVec 64))) (size!46173 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94486)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383070 (= res!924705 (validKeyInArray!0 (select (arr!45621 a!2938) i!1065)))))

(declare-fun res!924704 () Bool)

(assert (=> start!118230 (=> (not res!924704) (not e!783922))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118230 (= res!924704 (validMask!0 mask!2987))))

(assert (=> start!118230 e!783922))

(assert (=> start!118230 true))

(declare-fun array_inv!34854 (array!94486) Bool)

(assert (=> start!118230 (array_inv!34854 a!2938)))

(declare-fun b!1383071 () Bool)

(declare-fun res!924706 () Bool)

(assert (=> b!1383071 (=> (not res!924706) (not e!783922))))

(declare-datatypes ((List!32227 0))(
  ( (Nil!32224) (Cons!32223 (h!33432 (_ BitVec 64)) (t!46913 List!32227)) )
))
(declare-fun arrayNoDuplicates!0 (array!94486 (_ BitVec 32) List!32227) Bool)

(assert (=> b!1383071 (= res!924706 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32224))))

(declare-fun b!1383069 () Bool)

(declare-fun res!924707 () Bool)

(assert (=> b!1383069 (=> (not res!924707) (not e!783922))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383069 (= res!924707 (and (= (size!46173 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46173 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46173 a!2938))))))

(declare-fun b!1383072 () Bool)

(assert (=> b!1383072 (= e!783922 false)))

(declare-fun lt!608357 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94486 (_ BitVec 32)) Bool)

(assert (=> b!1383072 (= lt!608357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118230 res!924704) b!1383069))

(assert (= (and b!1383069 res!924707) b!1383070))

(assert (= (and b!1383070 res!924705) b!1383071))

(assert (= (and b!1383071 res!924706) b!1383072))

(declare-fun m!1267737 () Bool)

(assert (=> b!1383070 m!1267737))

(assert (=> b!1383070 m!1267737))

(declare-fun m!1267739 () Bool)

(assert (=> b!1383070 m!1267739))

(declare-fun m!1267741 () Bool)

(assert (=> start!118230 m!1267741))

(declare-fun m!1267743 () Bool)

(assert (=> start!118230 m!1267743))

(declare-fun m!1267745 () Bool)

(assert (=> b!1383071 m!1267745))

(declare-fun m!1267747 () Bool)

(assert (=> b!1383072 m!1267747))

(push 1)

(assert (not start!118230))

(assert (not b!1383071))

(assert (not b!1383072))

(assert (not b!1383070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

