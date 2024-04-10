; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118198 () Bool)

(assert start!118198)

(declare-fun res!924533 () Bool)

(declare-fun e!783844 () Bool)

(assert (=> start!118198 (=> (not res!924533) (not e!783844))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118198 (= res!924533 (validMask!0 mask!2987))))

(assert (=> start!118198 e!783844))

(assert (=> start!118198 true))

(declare-datatypes ((array!94501 0))(
  ( (array!94502 (arr!45628 (Array (_ BitVec 32) (_ BitVec 64))) (size!46178 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94501)

(declare-fun array_inv!34656 (array!94501) Bool)

(assert (=> start!118198 (array_inv!34656 a!2938)))

(declare-fun b!1382941 () Bool)

(declare-fun res!924534 () Bool)

(assert (=> b!1382941 (=> (not res!924534) (not e!783844))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382941 (= res!924534 (and (= (size!46178 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46178 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46178 a!2938))))))

(declare-fun b!1382942 () Bool)

(declare-fun res!924535 () Bool)

(assert (=> b!1382942 (=> (not res!924535) (not e!783844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382942 (= res!924535 (validKeyInArray!0 (select (arr!45628 a!2938) i!1065)))))

(declare-fun b!1382943 () Bool)

(assert (=> b!1382943 (= e!783844 false)))

(declare-fun lt!608496 () Bool)

(declare-datatypes ((List!32156 0))(
  ( (Nil!32153) (Cons!32152 (h!33361 (_ BitVec 64)) (t!46850 List!32156)) )
))
(declare-fun arrayNoDuplicates!0 (array!94501 (_ BitVec 32) List!32156) Bool)

(assert (=> b!1382943 (= lt!608496 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32153))))

(assert (= (and start!118198 res!924533) b!1382941))

(assert (= (and b!1382941 res!924534) b!1382942))

(assert (= (and b!1382942 res!924535) b!1382943))

(declare-fun m!1268045 () Bool)

(assert (=> start!118198 m!1268045))

(declare-fun m!1268047 () Bool)

(assert (=> start!118198 m!1268047))

(declare-fun m!1268049 () Bool)

(assert (=> b!1382942 m!1268049))

(assert (=> b!1382942 m!1268049))

(declare-fun m!1268051 () Bool)

(assert (=> b!1382942 m!1268051))

(declare-fun m!1268053 () Bool)

(assert (=> b!1382943 m!1268053))

(push 1)

(assert (not b!1382942))

(assert (not b!1382943))

(assert (not start!118198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

