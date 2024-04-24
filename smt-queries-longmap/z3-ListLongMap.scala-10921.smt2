; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128090 () Bool)

(assert start!128090)

(declare-fun b!1503645 () Bool)

(declare-fun res!1023539 () Bool)

(declare-fun e!841205 () Bool)

(assert (=> b!1503645 (=> (not res!1023539) (not e!841205))))

(declare-datatypes ((array!100285 0))(
  ( (array!100286 (arr!48397 (Array (_ BitVec 32) (_ BitVec 64))) (size!48948 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100285)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503645 (= res!1023539 (validKeyInArray!0 (select (arr!48397 a!2850) i!996)))))

(declare-fun b!1503646 () Bool)

(declare-fun res!1023542 () Bool)

(assert (=> b!1503646 (=> (not res!1023542) (not e!841205))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503646 (= res!1023542 (validKeyInArray!0 (select (arr!48397 a!2850) j!87)))))

(declare-fun b!1503647 () Bool)

(declare-fun res!1023538 () Bool)

(assert (=> b!1503647 (=> (not res!1023538) (not e!841205))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100285 (_ BitVec 32)) Bool)

(assert (=> b!1503647 (= res!1023538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503649 () Bool)

(assert (=> b!1503649 (= e!841205 false)))

(declare-fun lt!653931 () Bool)

(declare-datatypes ((List!34876 0))(
  ( (Nil!34873) (Cons!34872 (h!36284 (_ BitVec 64)) (t!49562 List!34876)) )
))
(declare-fun arrayNoDuplicates!0 (array!100285 (_ BitVec 32) List!34876) Bool)

(assert (=> b!1503649 (= lt!653931 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34873))))

(declare-fun res!1023540 () Bool)

(assert (=> start!128090 (=> (not res!1023540) (not e!841205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128090 (= res!1023540 (validMask!0 mask!2661))))

(assert (=> start!128090 e!841205))

(assert (=> start!128090 true))

(declare-fun array_inv!37678 (array!100285) Bool)

(assert (=> start!128090 (array_inv!37678 a!2850)))

(declare-fun b!1503648 () Bool)

(declare-fun res!1023541 () Bool)

(assert (=> b!1503648 (=> (not res!1023541) (not e!841205))))

(assert (=> b!1503648 (= res!1023541 (and (= (size!48948 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48948 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48948 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128090 res!1023540) b!1503648))

(assert (= (and b!1503648 res!1023541) b!1503645))

(assert (= (and b!1503645 res!1023539) b!1503646))

(assert (= (and b!1503646 res!1023542) b!1503647))

(assert (= (and b!1503647 res!1023538) b!1503649))

(declare-fun m!1386871 () Bool)

(assert (=> b!1503645 m!1386871))

(assert (=> b!1503645 m!1386871))

(declare-fun m!1386873 () Bool)

(assert (=> b!1503645 m!1386873))

(declare-fun m!1386875 () Bool)

(assert (=> b!1503649 m!1386875))

(declare-fun m!1386877 () Bool)

(assert (=> start!128090 m!1386877))

(declare-fun m!1386879 () Bool)

(assert (=> start!128090 m!1386879))

(declare-fun m!1386881 () Bool)

(assert (=> b!1503646 m!1386881))

(assert (=> b!1503646 m!1386881))

(declare-fun m!1386883 () Bool)

(assert (=> b!1503646 m!1386883))

(declare-fun m!1386885 () Bool)

(assert (=> b!1503647 m!1386885))

(check-sat (not start!128090) (not b!1503645) (not b!1503649) (not b!1503647) (not b!1503646))
(check-sat)
