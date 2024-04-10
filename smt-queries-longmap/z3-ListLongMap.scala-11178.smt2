; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130702 () Bool)

(assert start!130702)

(declare-fun b!1532950 () Bool)

(declare-fun res!1050036 () Bool)

(declare-fun e!854086 () Bool)

(assert (=> b!1532950 (=> (not res!1050036) (not e!854086))))

(declare-datatypes ((array!101800 0))(
  ( (array!101801 (arr!49116 (Array (_ BitVec 32) (_ BitVec 64))) (size!49666 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101800)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532950 (= res!1050036 (validKeyInArray!0 (select (arr!49116 a!2792) j!64)))))

(declare-fun b!1532951 () Bool)

(declare-fun res!1050038 () Bool)

(assert (=> b!1532951 (=> (not res!1050038) (not e!854086))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532951 (= res!1050038 (and (= (size!49666 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49666 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49666 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532952 () Bool)

(declare-fun res!1050040 () Bool)

(assert (=> b!1532952 (=> (not res!1050040) (not e!854086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101800 (_ BitVec 32)) Bool)

(assert (=> b!1532952 (= res!1050040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050037 () Bool)

(assert (=> start!130702 (=> (not res!1050037) (not e!854086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130702 (= res!1050037 (validMask!0 mask!2480))))

(assert (=> start!130702 e!854086))

(assert (=> start!130702 true))

(declare-fun array_inv!38144 (array!101800) Bool)

(assert (=> start!130702 (array_inv!38144 a!2792)))

(declare-fun b!1532953 () Bool)

(assert (=> b!1532953 (= e!854086 false)))

(declare-fun lt!663754 () Bool)

(declare-datatypes ((List!35590 0))(
  ( (Nil!35587) (Cons!35586 (h!37031 (_ BitVec 64)) (t!50284 List!35590)) )
))
(declare-fun arrayNoDuplicates!0 (array!101800 (_ BitVec 32) List!35590) Bool)

(assert (=> b!1532953 (= lt!663754 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35587))))

(declare-fun b!1532954 () Bool)

(declare-fun res!1050039 () Bool)

(assert (=> b!1532954 (=> (not res!1050039) (not e!854086))))

(assert (=> b!1532954 (= res!1050039 (validKeyInArray!0 (select (arr!49116 a!2792) i!951)))))

(assert (= (and start!130702 res!1050037) b!1532951))

(assert (= (and b!1532951 res!1050038) b!1532954))

(assert (= (and b!1532954 res!1050039) b!1532950))

(assert (= (and b!1532950 res!1050036) b!1532952))

(assert (= (and b!1532952 res!1050040) b!1532953))

(declare-fun m!1415659 () Bool)

(assert (=> b!1532952 m!1415659))

(declare-fun m!1415661 () Bool)

(assert (=> b!1532950 m!1415661))

(assert (=> b!1532950 m!1415661))

(declare-fun m!1415663 () Bool)

(assert (=> b!1532950 m!1415663))

(declare-fun m!1415665 () Bool)

(assert (=> b!1532954 m!1415665))

(assert (=> b!1532954 m!1415665))

(declare-fun m!1415667 () Bool)

(assert (=> b!1532954 m!1415667))

(declare-fun m!1415669 () Bool)

(assert (=> b!1532953 m!1415669))

(declare-fun m!1415671 () Bool)

(assert (=> start!130702 m!1415671))

(declare-fun m!1415673 () Bool)

(assert (=> start!130702 m!1415673))

(check-sat (not start!130702) (not b!1532953) (not b!1532950) (not b!1532952) (not b!1532954))
