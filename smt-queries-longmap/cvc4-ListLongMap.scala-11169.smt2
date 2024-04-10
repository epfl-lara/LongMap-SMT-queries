; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130560 () Bool)

(assert start!130560)

(declare-fun b!1532340 () Bool)

(declare-fun res!1049481 () Bool)

(declare-fun e!853780 () Bool)

(assert (=> b!1532340 (=> (not res!1049481) (not e!853780))))

(declare-datatypes ((array!101739 0))(
  ( (array!101740 (arr!49090 (Array (_ BitVec 32) (_ BitVec 64))) (size!49640 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101739)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532340 (= res!1049481 (validKeyInArray!0 (select (arr!49090 a!2792) i!951)))))

(declare-fun b!1532342 () Bool)

(assert (=> b!1532342 (= e!853780 (bvsgt #b00000000000000000000000000000000 (size!49640 a!2792)))))

(declare-fun b!1532339 () Bool)

(declare-fun res!1049480 () Bool)

(assert (=> b!1532339 (=> (not res!1049480) (not e!853780))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532339 (= res!1049480 (and (= (size!49640 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49640 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49640 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532341 () Bool)

(declare-fun res!1049479 () Bool)

(assert (=> b!1532341 (=> (not res!1049479) (not e!853780))))

(assert (=> b!1532341 (= res!1049479 (validKeyInArray!0 (select (arr!49090 a!2792) j!64)))))

(declare-fun res!1049482 () Bool)

(assert (=> start!130560 (=> (not res!1049482) (not e!853780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130560 (= res!1049482 (validMask!0 mask!2480))))

(assert (=> start!130560 e!853780))

(assert (=> start!130560 true))

(declare-fun array_inv!38118 (array!101739) Bool)

(assert (=> start!130560 (array_inv!38118 a!2792)))

(assert (= (and start!130560 res!1049482) b!1532339))

(assert (= (and b!1532339 res!1049480) b!1532340))

(assert (= (and b!1532340 res!1049481) b!1532341))

(assert (= (and b!1532341 res!1049479) b!1532342))

(declare-fun m!1415073 () Bool)

(assert (=> b!1532340 m!1415073))

(assert (=> b!1532340 m!1415073))

(declare-fun m!1415075 () Bool)

(assert (=> b!1532340 m!1415075))

(declare-fun m!1415077 () Bool)

(assert (=> b!1532341 m!1415077))

(assert (=> b!1532341 m!1415077))

(declare-fun m!1415079 () Bool)

(assert (=> b!1532341 m!1415079))

(declare-fun m!1415081 () Bool)

(assert (=> start!130560 m!1415081))

(declare-fun m!1415083 () Bool)

(assert (=> start!130560 m!1415083))

(push 1)

(assert (not start!130560))

(assert (not b!1532340))

(assert (not b!1532341))

(check-sat)

(pop 1)

(push 1)

