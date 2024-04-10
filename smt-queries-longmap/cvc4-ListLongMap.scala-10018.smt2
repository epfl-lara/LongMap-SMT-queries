; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118216 () Bool)

(assert start!118216)

(declare-fun b!1383031 () Bool)

(declare-fun res!924622 () Bool)

(declare-fun e!783898 () Bool)

(assert (=> b!1383031 (=> (not res!924622) (not e!783898))))

(declare-datatypes ((array!94519 0))(
  ( (array!94520 (arr!45637 (Array (_ BitVec 32) (_ BitVec 64))) (size!46187 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94519)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383031 (= res!924622 (validKeyInArray!0 (select (arr!45637 a!2938) i!1065)))))

(declare-fun b!1383032 () Bool)

(declare-fun res!924625 () Bool)

(assert (=> b!1383032 (=> (not res!924625) (not e!783898))))

(declare-datatypes ((List!32165 0))(
  ( (Nil!32162) (Cons!32161 (h!33370 (_ BitVec 64)) (t!46859 List!32165)) )
))
(declare-fun arrayNoDuplicates!0 (array!94519 (_ BitVec 32) List!32165) Bool)

(assert (=> b!1383032 (= res!924625 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32162))))

(declare-fun res!924624 () Bool)

(assert (=> start!118216 (=> (not res!924624) (not e!783898))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118216 (= res!924624 (validMask!0 mask!2987))))

(assert (=> start!118216 e!783898))

(assert (=> start!118216 true))

(declare-fun array_inv!34665 (array!94519) Bool)

(assert (=> start!118216 (array_inv!34665 a!2938)))

(declare-fun b!1383033 () Bool)

(assert (=> b!1383033 (= e!783898 (bvsgt #b00000000000000000000000000000000 (size!46187 a!2938)))))

(declare-fun b!1383030 () Bool)

(declare-fun res!924623 () Bool)

(assert (=> b!1383030 (=> (not res!924623) (not e!783898))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383030 (= res!924623 (and (= (size!46187 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46187 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46187 a!2938))))))

(assert (= (and start!118216 res!924624) b!1383030))

(assert (= (and b!1383030 res!924623) b!1383031))

(assert (= (and b!1383031 res!924622) b!1383032))

(assert (= (and b!1383032 res!924625) b!1383033))

(declare-fun m!1268135 () Bool)

(assert (=> b!1383031 m!1268135))

(assert (=> b!1383031 m!1268135))

(declare-fun m!1268137 () Bool)

(assert (=> b!1383031 m!1268137))

(declare-fun m!1268139 () Bool)

(assert (=> b!1383032 m!1268139))

(declare-fun m!1268141 () Bool)

(assert (=> start!118216 m!1268141))

(declare-fun m!1268143 () Bool)

(assert (=> start!118216 m!1268143))

(push 1)

(assert (not start!118216))

(assert (not b!1383031))

(assert (not b!1383032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

