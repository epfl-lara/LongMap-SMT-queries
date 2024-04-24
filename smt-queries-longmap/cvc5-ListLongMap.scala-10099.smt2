; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119280 () Bool)

(assert start!119280)

(declare-fun b!1390573 () Bool)

(declare-fun res!930055 () Bool)

(declare-fun e!787777 () Bool)

(assert (=> b!1390573 (=> (not res!930055) (not e!787777))))

(declare-datatypes ((array!95139 0))(
  ( (array!95140 (arr!45933 (Array (_ BitVec 32) (_ BitVec 64))) (size!46484 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95139)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95139 (_ BitVec 32)) Bool)

(assert (=> b!1390573 (= res!930055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930051 () Bool)

(assert (=> start!119280 (=> (not res!930051) (not e!787777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119280 (= res!930051 (validMask!0 mask!2840))))

(assert (=> start!119280 e!787777))

(assert (=> start!119280 true))

(declare-fun array_inv!35214 (array!95139) Bool)

(assert (=> start!119280 (array_inv!35214 a!2901)))

(declare-fun b!1390574 () Bool)

(declare-fun res!930052 () Bool)

(assert (=> b!1390574 (=> (not res!930052) (not e!787777))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390574 (= res!930052 (and (= (size!46484 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46484 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46484 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390575 () Bool)

(assert (=> b!1390575 (= e!787777 false)))

(declare-fun lt!610964 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390575 (= lt!610964 (toIndex!0 (select (arr!45933 a!2901) j!112) mask!2840))))

(declare-fun b!1390576 () Bool)

(declare-fun res!930054 () Bool)

(assert (=> b!1390576 (=> (not res!930054) (not e!787777))))

(declare-datatypes ((List!32439 0))(
  ( (Nil!32436) (Cons!32435 (h!33661 (_ BitVec 64)) (t!47125 List!32439)) )
))
(declare-fun arrayNoDuplicates!0 (array!95139 (_ BitVec 32) List!32439) Bool)

(assert (=> b!1390576 (= res!930054 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32436))))

(declare-fun b!1390577 () Bool)

(declare-fun res!930053 () Bool)

(assert (=> b!1390577 (=> (not res!930053) (not e!787777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390577 (= res!930053 (validKeyInArray!0 (select (arr!45933 a!2901) j!112)))))

(declare-fun b!1390578 () Bool)

(declare-fun res!930050 () Bool)

(assert (=> b!1390578 (=> (not res!930050) (not e!787777))))

(assert (=> b!1390578 (= res!930050 (validKeyInArray!0 (select (arr!45933 a!2901) i!1037)))))

(assert (= (and start!119280 res!930051) b!1390574))

(assert (= (and b!1390574 res!930052) b!1390578))

(assert (= (and b!1390578 res!930050) b!1390577))

(assert (= (and b!1390577 res!930053) b!1390573))

(assert (= (and b!1390573 res!930055) b!1390576))

(assert (= (and b!1390576 res!930054) b!1390575))

(declare-fun m!1276447 () Bool)

(assert (=> b!1390578 m!1276447))

(assert (=> b!1390578 m!1276447))

(declare-fun m!1276449 () Bool)

(assert (=> b!1390578 m!1276449))

(declare-fun m!1276451 () Bool)

(assert (=> b!1390575 m!1276451))

(assert (=> b!1390575 m!1276451))

(declare-fun m!1276453 () Bool)

(assert (=> b!1390575 m!1276453))

(declare-fun m!1276455 () Bool)

(assert (=> start!119280 m!1276455))

(declare-fun m!1276457 () Bool)

(assert (=> start!119280 m!1276457))

(declare-fun m!1276459 () Bool)

(assert (=> b!1390573 m!1276459))

(assert (=> b!1390577 m!1276451))

(assert (=> b!1390577 m!1276451))

(declare-fun m!1276461 () Bool)

(assert (=> b!1390577 m!1276461))

(declare-fun m!1276463 () Bool)

(assert (=> b!1390576 m!1276463))

(push 1)

(assert (not b!1390573))

(assert (not b!1390575))

(assert (not b!1390578))

(assert (not b!1390576))

(assert (not b!1390577))

(assert (not start!119280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

