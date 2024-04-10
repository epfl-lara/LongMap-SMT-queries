; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130566 () Bool)

(assert start!130566)

(declare-fun res!1049524 () Bool)

(declare-fun e!853798 () Bool)

(assert (=> start!130566 (=> (not res!1049524) (not e!853798))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130566 (= res!1049524 (validMask!0 mask!2480))))

(assert (=> start!130566 e!853798))

(assert (=> start!130566 true))

(declare-datatypes ((array!101745 0))(
  ( (array!101746 (arr!49093 (Array (_ BitVec 32) (_ BitVec 64))) (size!49643 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101745)

(declare-fun array_inv!38121 (array!101745) Bool)

(assert (=> start!130566 (array_inv!38121 a!2792)))

(declare-fun b!1532383 () Bool)

(declare-fun res!1049523 () Bool)

(assert (=> b!1532383 (=> (not res!1049523) (not e!853798))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532383 (= res!1049523 (validKeyInArray!0 (select (arr!49093 a!2792) j!64)))))

(declare-fun b!1532384 () Bool)

(declare-fun res!1049526 () Bool)

(assert (=> b!1532384 (=> (not res!1049526) (not e!853798))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532384 (= res!1049526 (and (= (size!49643 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49643 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49643 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532385 () Bool)

(declare-fun res!1049525 () Bool)

(assert (=> b!1532385 (=> (not res!1049525) (not e!853798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101745 (_ BitVec 32)) Bool)

(assert (=> b!1532385 (= res!1049525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532386 () Bool)

(assert (=> b!1532386 (= e!853798 (bvsgt #b00000000000000000000000000000000 (size!49643 a!2792)))))

(declare-fun b!1532387 () Bool)

(declare-fun res!1049527 () Bool)

(assert (=> b!1532387 (=> (not res!1049527) (not e!853798))))

(assert (=> b!1532387 (= res!1049527 (validKeyInArray!0 (select (arr!49093 a!2792) i!951)))))

(assert (= (and start!130566 res!1049524) b!1532384))

(assert (= (and b!1532384 res!1049526) b!1532387))

(assert (= (and b!1532387 res!1049527) b!1532383))

(assert (= (and b!1532383 res!1049523) b!1532385))

(assert (= (and b!1532385 res!1049525) b!1532386))

(declare-fun m!1415113 () Bool)

(assert (=> start!130566 m!1415113))

(declare-fun m!1415115 () Bool)

(assert (=> start!130566 m!1415115))

(declare-fun m!1415117 () Bool)

(assert (=> b!1532383 m!1415117))

(assert (=> b!1532383 m!1415117))

(declare-fun m!1415119 () Bool)

(assert (=> b!1532383 m!1415119))

(declare-fun m!1415121 () Bool)

(assert (=> b!1532385 m!1415121))

(declare-fun m!1415123 () Bool)

(assert (=> b!1532387 m!1415123))

(assert (=> b!1532387 m!1415123))

(declare-fun m!1415125 () Bool)

(assert (=> b!1532387 m!1415125))

(push 1)

(assert (not b!1532385))

(assert (not b!1532387))

(assert (not start!130566))

(assert (not b!1532383))

(check-sat)

(pop 1)

