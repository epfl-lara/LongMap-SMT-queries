; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130690 () Bool)

(assert start!130690)

(declare-fun b!1532851 () Bool)

(declare-fun e!854049 () Bool)

(assert (=> b!1532851 (= e!854049 false)))

(declare-fun lt!663745 () Bool)

(declare-datatypes ((array!101788 0))(
  ( (array!101789 (arr!49110 (Array (_ BitVec 32) (_ BitVec 64))) (size!49660 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101788)

(declare-datatypes ((List!35584 0))(
  ( (Nil!35581) (Cons!35580 (h!37025 (_ BitVec 64)) (t!50278 List!35584)) )
))
(declare-fun arrayNoDuplicates!0 (array!101788 (_ BitVec 32) List!35584) Bool)

(assert (=> b!1532851 (= lt!663745 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35581))))

(declare-fun b!1532852 () Bool)

(declare-fun res!1049938 () Bool)

(assert (=> b!1532852 (=> (not res!1049938) (not e!854049))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532852 (= res!1049938 (and (= (size!49660 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49660 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49660 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532854 () Bool)

(declare-fun res!1049939 () Bool)

(assert (=> b!1532854 (=> (not res!1049939) (not e!854049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532854 (= res!1049939 (validKeyInArray!0 (select (arr!49110 a!2792) i!951)))))

(declare-fun b!1532855 () Bool)

(declare-fun res!1049940 () Bool)

(assert (=> b!1532855 (=> (not res!1049940) (not e!854049))))

(assert (=> b!1532855 (= res!1049940 (validKeyInArray!0 (select (arr!49110 a!2792) j!64)))))

(declare-fun res!1049937 () Bool)

(assert (=> start!130690 (=> (not res!1049937) (not e!854049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130690 (= res!1049937 (validMask!0 mask!2480))))

(assert (=> start!130690 e!854049))

(assert (=> start!130690 true))

(declare-fun array_inv!38138 (array!101788) Bool)

(assert (=> start!130690 (array_inv!38138 a!2792)))

(declare-fun b!1532853 () Bool)

(declare-fun res!1049941 () Bool)

(assert (=> b!1532853 (=> (not res!1049941) (not e!854049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101788 (_ BitVec 32)) Bool)

(assert (=> b!1532853 (= res!1049941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130690 res!1049937) b!1532852))

(assert (= (and b!1532852 res!1049938) b!1532854))

(assert (= (and b!1532854 res!1049939) b!1532855))

(assert (= (and b!1532855 res!1049940) b!1532853))

(assert (= (and b!1532853 res!1049941) b!1532851))

(declare-fun m!1415557 () Bool)

(assert (=> b!1532854 m!1415557))

(assert (=> b!1532854 m!1415557))

(declare-fun m!1415559 () Bool)

(assert (=> b!1532854 m!1415559))

(declare-fun m!1415561 () Bool)

(assert (=> b!1532853 m!1415561))

(declare-fun m!1415563 () Bool)

(assert (=> start!130690 m!1415563))

(declare-fun m!1415565 () Bool)

(assert (=> start!130690 m!1415565))

(declare-fun m!1415567 () Bool)

(assert (=> b!1532851 m!1415567))

(declare-fun m!1415569 () Bool)

(assert (=> b!1532855 m!1415569))

(assert (=> b!1532855 m!1415569))

(declare-fun m!1415571 () Bool)

(assert (=> b!1532855 m!1415571))

(check-sat (not b!1532855) (not start!130690) (not b!1532853) (not b!1532851) (not b!1532854))
