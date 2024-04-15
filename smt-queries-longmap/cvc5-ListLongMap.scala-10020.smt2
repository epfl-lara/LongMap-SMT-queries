; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118224 () Bool)

(assert start!118224)

(declare-fun b!1383033 () Bool)

(declare-fun res!924668 () Bool)

(declare-fun e!783903 () Bool)

(assert (=> b!1383033 (=> (not res!924668) (not e!783903))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94480 0))(
  ( (array!94481 (arr!45618 (Array (_ BitVec 32) (_ BitVec 64))) (size!46170 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94480)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383033 (= res!924668 (and (= (size!46170 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46170 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46170 a!2938))))))

(declare-fun b!1383034 () Bool)

(declare-fun res!924670 () Bool)

(assert (=> b!1383034 (=> (not res!924670) (not e!783903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383034 (= res!924670 (validKeyInArray!0 (select (arr!45618 a!2938) i!1065)))))

(declare-fun res!924669 () Bool)

(assert (=> start!118224 (=> (not res!924669) (not e!783903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118224 (= res!924669 (validMask!0 mask!2987))))

(assert (=> start!118224 e!783903))

(assert (=> start!118224 true))

(declare-fun array_inv!34851 (array!94480) Bool)

(assert (=> start!118224 (array_inv!34851 a!2938)))

(declare-fun b!1383036 () Bool)

(assert (=> b!1383036 (= e!783903 false)))

(declare-fun lt!608348 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94480 (_ BitVec 32)) Bool)

(assert (=> b!1383036 (= lt!608348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383035 () Bool)

(declare-fun res!924671 () Bool)

(assert (=> b!1383035 (=> (not res!924671) (not e!783903))))

(declare-datatypes ((List!32224 0))(
  ( (Nil!32221) (Cons!32220 (h!33429 (_ BitVec 64)) (t!46910 List!32224)) )
))
(declare-fun arrayNoDuplicates!0 (array!94480 (_ BitVec 32) List!32224) Bool)

(assert (=> b!1383035 (= res!924671 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32221))))

(assert (= (and start!118224 res!924669) b!1383033))

(assert (= (and b!1383033 res!924668) b!1383034))

(assert (= (and b!1383034 res!924670) b!1383035))

(assert (= (and b!1383035 res!924671) b!1383036))

(declare-fun m!1267701 () Bool)

(assert (=> b!1383034 m!1267701))

(assert (=> b!1383034 m!1267701))

(declare-fun m!1267703 () Bool)

(assert (=> b!1383034 m!1267703))

(declare-fun m!1267705 () Bool)

(assert (=> start!118224 m!1267705))

(declare-fun m!1267707 () Bool)

(assert (=> start!118224 m!1267707))

(declare-fun m!1267709 () Bool)

(assert (=> b!1383036 m!1267709))

(declare-fun m!1267711 () Bool)

(assert (=> b!1383035 m!1267711))

(push 1)

(assert (not b!1383036))

(assert (not start!118224))

(assert (not b!1383035))

(assert (not b!1383034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

