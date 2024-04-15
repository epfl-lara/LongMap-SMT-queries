; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119088 () Bool)

(assert start!119088)

(declare-fun b!1389352 () Bool)

(declare-fun res!929565 () Bool)

(declare-fun e!787000 () Bool)

(assert (=> b!1389352 (=> (not res!929565) (not e!787000))))

(declare-datatypes ((array!94978 0))(
  ( (array!94979 (arr!45855 (Array (_ BitVec 32) (_ BitVec 64))) (size!46407 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94978)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389352 (= res!929565 (validKeyInArray!0 (select (arr!45855 a!2901) j!112)))))

(declare-fun b!1389353 () Bool)

(assert (=> b!1389353 (= e!787000 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610376 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389353 (= lt!610376 (toIndex!0 (select (arr!45855 a!2901) j!112) mask!2840))))

(declare-fun b!1389354 () Bool)

(declare-fun res!929566 () Bool)

(assert (=> b!1389354 (=> (not res!929566) (not e!787000))))

(declare-datatypes ((List!32452 0))(
  ( (Nil!32449) (Cons!32448 (h!33666 (_ BitVec 64)) (t!47138 List!32452)) )
))
(declare-fun arrayNoDuplicates!0 (array!94978 (_ BitVec 32) List!32452) Bool)

(assert (=> b!1389354 (= res!929566 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32449))))

(declare-fun b!1389355 () Bool)

(declare-fun res!929567 () Bool)

(assert (=> b!1389355 (=> (not res!929567) (not e!787000))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389355 (= res!929567 (and (= (size!46407 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46407 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46407 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389356 () Bool)

(declare-fun res!929569 () Bool)

(assert (=> b!1389356 (=> (not res!929569) (not e!787000))))

(assert (=> b!1389356 (= res!929569 (validKeyInArray!0 (select (arr!45855 a!2901) i!1037)))))

(declare-fun res!929564 () Bool)

(assert (=> start!119088 (=> (not res!929564) (not e!787000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119088 (= res!929564 (validMask!0 mask!2840))))

(assert (=> start!119088 e!787000))

(assert (=> start!119088 true))

(declare-fun array_inv!35088 (array!94978) Bool)

(assert (=> start!119088 (array_inv!35088 a!2901)))

(declare-fun b!1389357 () Bool)

(declare-fun res!929568 () Bool)

(assert (=> b!1389357 (=> (not res!929568) (not e!787000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94978 (_ BitVec 32)) Bool)

(assert (=> b!1389357 (= res!929568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119088 res!929564) b!1389355))

(assert (= (and b!1389355 res!929567) b!1389356))

(assert (= (and b!1389356 res!929569) b!1389352))

(assert (= (and b!1389352 res!929565) b!1389357))

(assert (= (and b!1389357 res!929568) b!1389354))

(assert (= (and b!1389354 res!929566) b!1389353))

(declare-fun m!1274539 () Bool)

(assert (=> b!1389354 m!1274539))

(declare-fun m!1274541 () Bool)

(assert (=> b!1389353 m!1274541))

(assert (=> b!1389353 m!1274541))

(declare-fun m!1274543 () Bool)

(assert (=> b!1389353 m!1274543))

(declare-fun m!1274545 () Bool)

(assert (=> b!1389357 m!1274545))

(declare-fun m!1274547 () Bool)

(assert (=> start!119088 m!1274547))

(declare-fun m!1274549 () Bool)

(assert (=> start!119088 m!1274549))

(declare-fun m!1274551 () Bool)

(assert (=> b!1389356 m!1274551))

(assert (=> b!1389356 m!1274551))

(declare-fun m!1274553 () Bool)

(assert (=> b!1389356 m!1274553))

(assert (=> b!1389352 m!1274541))

(assert (=> b!1389352 m!1274541))

(declare-fun m!1274555 () Bool)

(assert (=> b!1389352 m!1274555))

(push 1)

(assert (not b!1389353))

(assert (not start!119088))

(assert (not b!1389354))

(assert (not b!1389352))

(assert (not b!1389356))

(assert (not b!1389357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

