; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118204 () Bool)

(assert start!118204)

(declare-fun res!924562 () Bool)

(declare-fun e!783862 () Bool)

(assert (=> start!118204 (=> (not res!924562) (not e!783862))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118204 (= res!924562 (validMask!0 mask!2987))))

(assert (=> start!118204 e!783862))

(assert (=> start!118204 true))

(declare-datatypes ((array!94507 0))(
  ( (array!94508 (arr!45631 (Array (_ BitVec 32) (_ BitVec 64))) (size!46181 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94507)

(declare-fun array_inv!34659 (array!94507) Bool)

(assert (=> start!118204 (array_inv!34659 a!2938)))

(declare-fun b!1382968 () Bool)

(declare-fun res!924561 () Bool)

(assert (=> b!1382968 (=> (not res!924561) (not e!783862))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382968 (= res!924561 (and (= (size!46181 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46181 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46181 a!2938))))))

(declare-fun b!1382969 () Bool)

(declare-fun res!924560 () Bool)

(assert (=> b!1382969 (=> (not res!924560) (not e!783862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382969 (= res!924560 (validKeyInArray!0 (select (arr!45631 a!2938) i!1065)))))

(declare-fun b!1382970 () Bool)

(assert (=> b!1382970 (= e!783862 false)))

(declare-fun lt!608505 () Bool)

(declare-datatypes ((List!32159 0))(
  ( (Nil!32156) (Cons!32155 (h!33364 (_ BitVec 64)) (t!46853 List!32159)) )
))
(declare-fun arrayNoDuplicates!0 (array!94507 (_ BitVec 32) List!32159) Bool)

(assert (=> b!1382970 (= lt!608505 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32156))))

(assert (= (and start!118204 res!924562) b!1382968))

(assert (= (and b!1382968 res!924561) b!1382969))

(assert (= (and b!1382969 res!924560) b!1382970))

(declare-fun m!1268075 () Bool)

(assert (=> start!118204 m!1268075))

(declare-fun m!1268077 () Bool)

(assert (=> start!118204 m!1268077))

(declare-fun m!1268079 () Bool)

(assert (=> b!1382969 m!1268079))

(assert (=> b!1382969 m!1268079))

(declare-fun m!1268081 () Bool)

(assert (=> b!1382969 m!1268081))

(declare-fun m!1268083 () Bool)

(assert (=> b!1382970 m!1268083))

(push 1)

(assert (not start!118204))

(assert (not b!1382969))

(assert (not b!1382970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

