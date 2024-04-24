; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118456 () Bool)

(assert start!118456)

(declare-fun b!1384506 () Bool)

(declare-fun res!925310 () Bool)

(declare-fun e!784830 () Bool)

(assert (=> b!1384506 (=> (not res!925310) (not e!784830))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94657 0))(
  ( (array!94658 (arr!45704 (Array (_ BitVec 32) (_ BitVec 64))) (size!46255 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94657)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384506 (= res!925310 (and (= (size!46255 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46255 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46255 a!2938))))))

(declare-fun b!1384507 () Bool)

(declare-fun res!925312 () Bool)

(assert (=> b!1384507 (=> (not res!925312) (not e!784830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384507 (= res!925312 (validKeyInArray!0 (select (arr!45704 a!2938) i!1065)))))

(declare-fun b!1384509 () Bool)

(assert (=> b!1384509 (= e!784830 false)))

(declare-fun lt!609036 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94657 (_ BitVec 32)) Bool)

(assert (=> b!1384509 (= lt!609036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384508 () Bool)

(declare-fun res!925309 () Bool)

(assert (=> b!1384508 (=> (not res!925309) (not e!784830))))

(declare-datatypes ((List!32219 0))(
  ( (Nil!32216) (Cons!32215 (h!33433 (_ BitVec 64)) (t!46905 List!32219)) )
))
(declare-fun arrayNoDuplicates!0 (array!94657 (_ BitVec 32) List!32219) Bool)

(assert (=> b!1384508 (= res!925309 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32216))))

(declare-fun res!925311 () Bool)

(assert (=> start!118456 (=> (not res!925311) (not e!784830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118456 (= res!925311 (validMask!0 mask!2987))))

(assert (=> start!118456 e!784830))

(assert (=> start!118456 true))

(declare-fun array_inv!34985 (array!94657) Bool)

(assert (=> start!118456 (array_inv!34985 a!2938)))

(assert (= (and start!118456 res!925311) b!1384506))

(assert (= (and b!1384506 res!925310) b!1384507))

(assert (= (and b!1384507 res!925312) b!1384508))

(assert (= (and b!1384508 res!925309) b!1384509))

(declare-fun m!1269933 () Bool)

(assert (=> b!1384507 m!1269933))

(assert (=> b!1384507 m!1269933))

(declare-fun m!1269935 () Bool)

(assert (=> b!1384507 m!1269935))

(declare-fun m!1269937 () Bool)

(assert (=> b!1384509 m!1269937))

(declare-fun m!1269939 () Bool)

(assert (=> b!1384508 m!1269939))

(declare-fun m!1269941 () Bool)

(assert (=> start!118456 m!1269941))

(declare-fun m!1269943 () Bool)

(assert (=> start!118456 m!1269943))

(push 1)

(assert (not b!1384507))

(assert (not b!1384509))

(assert (not start!118456))

(assert (not b!1384508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

