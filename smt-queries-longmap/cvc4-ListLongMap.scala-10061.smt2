; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118504 () Bool)

(assert start!118504)

(declare-fun res!926866 () Bool)

(declare-fun e!785078 () Bool)

(assert (=> start!118504 (=> (not res!926866) (not e!785078))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118504 (= res!926866 (validMask!0 mask!2987))))

(assert (=> start!118504 e!785078))

(assert (=> start!118504 true))

(declare-datatypes ((array!94780 0))(
  ( (array!94781 (arr!45766 (Array (_ BitVec 32) (_ BitVec 64))) (size!46316 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94780)

(declare-fun array_inv!34794 (array!94780) Bool)

(assert (=> start!118504 (array_inv!34794 a!2938)))

(declare-fun b!1385614 () Bool)

(declare-fun res!926863 () Bool)

(assert (=> b!1385614 (=> (not res!926863) (not e!785078))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385614 (= res!926863 (validKeyInArray!0 (select (arr!45766 a!2938) i!1065)))))

(declare-fun b!1385613 () Bool)

(declare-fun res!926864 () Bool)

(assert (=> b!1385613 (=> (not res!926864) (not e!785078))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385613 (= res!926864 (and (= (size!46316 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46316 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46316 a!2938))))))

(declare-fun b!1385615 () Bool)

(declare-fun res!926865 () Bool)

(assert (=> b!1385615 (=> (not res!926865) (not e!785078))))

(declare-datatypes ((List!32294 0))(
  ( (Nil!32291) (Cons!32290 (h!33499 (_ BitVec 64)) (t!46988 List!32294)) )
))
(declare-fun arrayNoDuplicates!0 (array!94780 (_ BitVec 32) List!32294) Bool)

(assert (=> b!1385615 (= res!926865 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32291))))

(declare-fun b!1385616 () Bool)

(assert (=> b!1385616 (= e!785078 false)))

(declare-fun lt!609288 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94780 (_ BitVec 32)) Bool)

(assert (=> b!1385616 (= lt!609288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118504 res!926866) b!1385613))

(assert (= (and b!1385613 res!926864) b!1385614))

(assert (= (and b!1385614 res!926863) b!1385615))

(assert (= (and b!1385615 res!926865) b!1385616))

(declare-fun m!1270905 () Bool)

(assert (=> start!118504 m!1270905))

(declare-fun m!1270907 () Bool)

(assert (=> start!118504 m!1270907))

(declare-fun m!1270909 () Bool)

(assert (=> b!1385614 m!1270909))

(assert (=> b!1385614 m!1270909))

(declare-fun m!1270911 () Bool)

(assert (=> b!1385614 m!1270911))

(declare-fun m!1270913 () Bool)

(assert (=> b!1385615 m!1270913))

(declare-fun m!1270915 () Bool)

(assert (=> b!1385616 m!1270915))

(push 1)

(assert (not b!1385616))

(assert (not b!1385614))

(assert (not b!1385615))

(assert (not start!118504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

