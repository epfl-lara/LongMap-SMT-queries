; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130564 () Bool)

(assert start!130564)

(declare-fun b!1532369 () Bool)

(declare-fun res!1049508 () Bool)

(declare-fun e!853792 () Bool)

(assert (=> b!1532369 (=> (not res!1049508) (not e!853792))))

(declare-datatypes ((array!101743 0))(
  ( (array!101744 (arr!49092 (Array (_ BitVec 32) (_ BitVec 64))) (size!49642 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101743)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532369 (= res!1049508 (validKeyInArray!0 (select (arr!49092 a!2792) i!951)))))

(declare-fun b!1532370 () Bool)

(assert (=> b!1532370 (= e!853792 (bvsgt #b00000000000000000000000000000000 (size!49642 a!2792)))))

(declare-fun b!1532368 () Bool)

(declare-fun res!1049509 () Bool)

(assert (=> b!1532368 (=> (not res!1049509) (not e!853792))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101743 (_ BitVec 32)) Bool)

(assert (=> b!1532368 (= res!1049509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049512 () Bool)

(assert (=> start!130564 (=> (not res!1049512) (not e!853792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130564 (= res!1049512 (validMask!0 mask!2480))))

(assert (=> start!130564 e!853792))

(assert (=> start!130564 true))

(declare-fun array_inv!38120 (array!101743) Bool)

(assert (=> start!130564 (array_inv!38120 a!2792)))

(declare-fun b!1532371 () Bool)

(declare-fun res!1049511 () Bool)

(assert (=> b!1532371 (=> (not res!1049511) (not e!853792))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532371 (= res!1049511 (validKeyInArray!0 (select (arr!49092 a!2792) j!64)))))

(declare-fun b!1532372 () Bool)

(declare-fun res!1049510 () Bool)

(assert (=> b!1532372 (=> (not res!1049510) (not e!853792))))

(assert (=> b!1532372 (= res!1049510 (and (= (size!49642 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49642 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49642 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130564 res!1049512) b!1532372))

(assert (= (and b!1532372 res!1049510) b!1532369))

(assert (= (and b!1532369 res!1049508) b!1532371))

(assert (= (and b!1532371 res!1049511) b!1532368))

(assert (= (and b!1532368 res!1049509) b!1532370))

(declare-fun m!1415099 () Bool)

(assert (=> b!1532369 m!1415099))

(assert (=> b!1532369 m!1415099))

(declare-fun m!1415101 () Bool)

(assert (=> b!1532369 m!1415101))

(declare-fun m!1415103 () Bool)

(assert (=> b!1532368 m!1415103))

(declare-fun m!1415105 () Bool)

(assert (=> start!130564 m!1415105))

(declare-fun m!1415107 () Bool)

(assert (=> start!130564 m!1415107))

(declare-fun m!1415109 () Bool)

(assert (=> b!1532371 m!1415109))

(assert (=> b!1532371 m!1415109))

(declare-fun m!1415111 () Bool)

(assert (=> b!1532371 m!1415111))

(check-sat (not start!130564) (not b!1532368) (not b!1532369) (not b!1532371))
(check-sat)
