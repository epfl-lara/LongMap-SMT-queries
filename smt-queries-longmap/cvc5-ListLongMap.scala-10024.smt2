; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118464 () Bool)

(assert start!118464)

(declare-fun res!925360 () Bool)

(declare-fun e!784855 () Bool)

(assert (=> start!118464 (=> (not res!925360) (not e!784855))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118464 (= res!925360 (validMask!0 mask!2987))))

(assert (=> start!118464 e!784855))

(assert (=> start!118464 true))

(declare-datatypes ((array!94665 0))(
  ( (array!94666 (arr!45708 (Array (_ BitVec 32) (_ BitVec 64))) (size!46259 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94665)

(declare-fun array_inv!34989 (array!94665) Bool)

(assert (=> start!118464 (array_inv!34989 a!2938)))

(declare-fun b!1384557 () Bool)

(assert (=> b!1384557 (= e!784855 false)))

(declare-fun lt!609048 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94665 (_ BitVec 32)) Bool)

(assert (=> b!1384557 (= lt!609048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384556 () Bool)

(declare-fun res!925358 () Bool)

(assert (=> b!1384556 (=> (not res!925358) (not e!784855))))

(declare-datatypes ((List!32223 0))(
  ( (Nil!32220) (Cons!32219 (h!33437 (_ BitVec 64)) (t!46909 List!32223)) )
))
(declare-fun arrayNoDuplicates!0 (array!94665 (_ BitVec 32) List!32223) Bool)

(assert (=> b!1384556 (= res!925358 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32220))))

(declare-fun b!1384555 () Bool)

(declare-fun res!925357 () Bool)

(assert (=> b!1384555 (=> (not res!925357) (not e!784855))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384555 (= res!925357 (validKeyInArray!0 (select (arr!45708 a!2938) i!1065)))))

(declare-fun b!1384554 () Bool)

(declare-fun res!925359 () Bool)

(assert (=> b!1384554 (=> (not res!925359) (not e!784855))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384554 (= res!925359 (and (= (size!46259 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46259 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46259 a!2938))))))

(assert (= (and start!118464 res!925360) b!1384554))

(assert (= (and b!1384554 res!925359) b!1384555))

(assert (= (and b!1384555 res!925357) b!1384556))

(assert (= (and b!1384556 res!925358) b!1384557))

(declare-fun m!1269981 () Bool)

(assert (=> start!118464 m!1269981))

(declare-fun m!1269983 () Bool)

(assert (=> start!118464 m!1269983))

(declare-fun m!1269985 () Bool)

(assert (=> b!1384557 m!1269985))

(declare-fun m!1269987 () Bool)

(assert (=> b!1384556 m!1269987))

(declare-fun m!1269989 () Bool)

(assert (=> b!1384555 m!1269989))

(assert (=> b!1384555 m!1269989))

(declare-fun m!1269991 () Bool)

(assert (=> b!1384555 m!1269991))

(push 1)

(assert (not b!1384555))

(assert (not start!118464))

(assert (not b!1384556))

(assert (not b!1384557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

