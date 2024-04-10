; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130562 () Bool)

(assert start!130562)

(declare-fun b!1532353 () Bool)

(declare-fun res!1049494 () Bool)

(declare-fun e!853785 () Bool)

(assert (=> b!1532353 (=> (not res!1049494) (not e!853785))))

(declare-datatypes ((array!101741 0))(
  ( (array!101742 (arr!49091 (Array (_ BitVec 32) (_ BitVec 64))) (size!49641 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101741)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532353 (= res!1049494 (and (= (size!49641 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49641 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49641 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532354 () Bool)

(declare-fun res!1049496 () Bool)

(assert (=> b!1532354 (=> (not res!1049496) (not e!853785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101741 (_ BitVec 32)) Bool)

(assert (=> b!1532354 (= res!1049496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049493 () Bool)

(assert (=> start!130562 (=> (not res!1049493) (not e!853785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130562 (= res!1049493 (validMask!0 mask!2480))))

(assert (=> start!130562 e!853785))

(assert (=> start!130562 true))

(declare-fun array_inv!38119 (array!101741) Bool)

(assert (=> start!130562 (array_inv!38119 a!2792)))

(declare-fun b!1532355 () Bool)

(assert (=> b!1532355 (= e!853785 (bvsgt #b00000000000000000000000000000000 (size!49641 a!2792)))))

(declare-fun b!1532356 () Bool)

(declare-fun res!1049495 () Bool)

(assert (=> b!1532356 (=> (not res!1049495) (not e!853785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532356 (= res!1049495 (validKeyInArray!0 (select (arr!49091 a!2792) i!951)))))

(declare-fun b!1532357 () Bool)

(declare-fun res!1049497 () Bool)

(assert (=> b!1532357 (=> (not res!1049497) (not e!853785))))

(assert (=> b!1532357 (= res!1049497 (validKeyInArray!0 (select (arr!49091 a!2792) j!64)))))

(assert (= (and start!130562 res!1049493) b!1532353))

(assert (= (and b!1532353 res!1049494) b!1532356))

(assert (= (and b!1532356 res!1049495) b!1532357))

(assert (= (and b!1532357 res!1049497) b!1532354))

(assert (= (and b!1532354 res!1049496) b!1532355))

(declare-fun m!1415085 () Bool)

(assert (=> b!1532354 m!1415085))

(declare-fun m!1415087 () Bool)

(assert (=> start!130562 m!1415087))

(declare-fun m!1415089 () Bool)

(assert (=> start!130562 m!1415089))

(declare-fun m!1415091 () Bool)

(assert (=> b!1532356 m!1415091))

(assert (=> b!1532356 m!1415091))

(declare-fun m!1415093 () Bool)

(assert (=> b!1532356 m!1415093))

(declare-fun m!1415095 () Bool)

(assert (=> b!1532357 m!1415095))

(assert (=> b!1532357 m!1415095))

(declare-fun m!1415097 () Bool)

(assert (=> b!1532357 m!1415097))

(push 1)

(assert (not b!1532357))

(assert (not start!130562))

(assert (not b!1532354))

