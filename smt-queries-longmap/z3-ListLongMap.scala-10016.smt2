; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118202 () Bool)

(assert start!118202)

(declare-fun res!924553 () Bool)

(declare-fun e!783856 () Bool)

(assert (=> start!118202 (=> (not res!924553) (not e!783856))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118202 (= res!924553 (validMask!0 mask!2987))))

(assert (=> start!118202 e!783856))

(assert (=> start!118202 true))

(declare-datatypes ((array!94505 0))(
  ( (array!94506 (arr!45630 (Array (_ BitVec 32) (_ BitVec 64))) (size!46180 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94505)

(declare-fun array_inv!34658 (array!94505) Bool)

(assert (=> start!118202 (array_inv!34658 a!2938)))

(declare-fun b!1382959 () Bool)

(declare-fun res!924551 () Bool)

(assert (=> b!1382959 (=> (not res!924551) (not e!783856))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1382959 (= res!924551 (and (= (size!46180 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46180 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46180 a!2938))))))

(declare-fun b!1382960 () Bool)

(declare-fun res!924552 () Bool)

(assert (=> b!1382960 (=> (not res!924552) (not e!783856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382960 (= res!924552 (validKeyInArray!0 (select (arr!45630 a!2938) i!1065)))))

(declare-fun b!1382961 () Bool)

(assert (=> b!1382961 (= e!783856 false)))

(declare-fun lt!608502 () Bool)

(declare-datatypes ((List!32158 0))(
  ( (Nil!32155) (Cons!32154 (h!33363 (_ BitVec 64)) (t!46852 List!32158)) )
))
(declare-fun arrayNoDuplicates!0 (array!94505 (_ BitVec 32) List!32158) Bool)

(assert (=> b!1382961 (= lt!608502 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32155))))

(assert (= (and start!118202 res!924553) b!1382959))

(assert (= (and b!1382959 res!924551) b!1382960))

(assert (= (and b!1382960 res!924552) b!1382961))

(declare-fun m!1268065 () Bool)

(assert (=> start!118202 m!1268065))

(declare-fun m!1268067 () Bool)

(assert (=> start!118202 m!1268067))

(declare-fun m!1268069 () Bool)

(assert (=> b!1382960 m!1268069))

(assert (=> b!1382960 m!1268069))

(declare-fun m!1268071 () Bool)

(assert (=> b!1382960 m!1268071))

(declare-fun m!1268073 () Bool)

(assert (=> b!1382961 m!1268073))

(check-sat (not b!1382961) (not start!118202) (not b!1382960))
