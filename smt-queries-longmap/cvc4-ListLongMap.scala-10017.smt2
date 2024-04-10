; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118210 () Bool)

(assert start!118210)

(declare-fun res!924587 () Bool)

(declare-fun e!783880 () Bool)

(assert (=> start!118210 (=> (not res!924587) (not e!783880))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118210 (= res!924587 (validMask!0 mask!2987))))

(assert (=> start!118210 e!783880))

(assert (=> start!118210 true))

(declare-datatypes ((array!94513 0))(
  ( (array!94514 (arr!45634 (Array (_ BitVec 32) (_ BitVec 64))) (size!46184 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94513)

(declare-fun array_inv!34662 (array!94513) Bool)

(assert (=> start!118210 (array_inv!34662 a!2938)))

(declare-fun b!1382995 () Bool)

(declare-fun res!924588 () Bool)

(assert (=> b!1382995 (=> (not res!924588) (not e!783880))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382995 (= res!924588 (and (= (size!46184 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46184 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46184 a!2938))))))

(declare-fun b!1382996 () Bool)

(declare-fun res!924589 () Bool)

(assert (=> b!1382996 (=> (not res!924589) (not e!783880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382996 (= res!924589 (validKeyInArray!0 (select (arr!45634 a!2938) i!1065)))))

(declare-fun b!1382997 () Bool)

(assert (=> b!1382997 (= e!783880 false)))

(declare-fun lt!608514 () Bool)

(declare-datatypes ((List!32162 0))(
  ( (Nil!32159) (Cons!32158 (h!33367 (_ BitVec 64)) (t!46856 List!32162)) )
))
(declare-fun arrayNoDuplicates!0 (array!94513 (_ BitVec 32) List!32162) Bool)

(assert (=> b!1382997 (= lt!608514 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32159))))

(assert (= (and start!118210 res!924587) b!1382995))

(assert (= (and b!1382995 res!924588) b!1382996))

(assert (= (and b!1382996 res!924589) b!1382997))

(declare-fun m!1268105 () Bool)

(assert (=> start!118210 m!1268105))

(declare-fun m!1268107 () Bool)

(assert (=> start!118210 m!1268107))

(declare-fun m!1268109 () Bool)

(assert (=> b!1382996 m!1268109))

(assert (=> b!1382996 m!1268109))

(declare-fun m!1268111 () Bool)

(assert (=> b!1382996 m!1268111))

(declare-fun m!1268113 () Bool)

(assert (=> b!1382997 m!1268113))

(push 1)

(assert (not b!1382996))

(assert (not b!1382997))

(assert (not start!118210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

