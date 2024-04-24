; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128102 () Bool)

(assert start!128102)

(declare-fun b!1503735 () Bool)

(declare-fun res!1023630 () Bool)

(declare-fun e!841242 () Bool)

(assert (=> b!1503735 (=> (not res!1023630) (not e!841242))))

(declare-datatypes ((array!100297 0))(
  ( (array!100298 (arr!48403 (Array (_ BitVec 32) (_ BitVec 64))) (size!48954 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100297)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503735 (= res!1023630 (validKeyInArray!0 (select (arr!48403 a!2850) i!996)))))

(declare-fun res!1023629 () Bool)

(assert (=> start!128102 (=> (not res!1023629) (not e!841242))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128102 (= res!1023629 (validMask!0 mask!2661))))

(assert (=> start!128102 e!841242))

(assert (=> start!128102 true))

(declare-fun array_inv!37684 (array!100297) Bool)

(assert (=> start!128102 (array_inv!37684 a!2850)))

(declare-fun b!1503736 () Bool)

(declare-fun res!1023628 () Bool)

(assert (=> b!1503736 (=> (not res!1023628) (not e!841242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100297 (_ BitVec 32)) Bool)

(assert (=> b!1503736 (= res!1023628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503737 () Bool)

(declare-fun res!1023631 () Bool)

(assert (=> b!1503737 (=> (not res!1023631) (not e!841242))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503737 (= res!1023631 (validKeyInArray!0 (select (arr!48403 a!2850) j!87)))))

(declare-fun b!1503738 () Bool)

(declare-fun res!1023632 () Bool)

(assert (=> b!1503738 (=> (not res!1023632) (not e!841242))))

(assert (=> b!1503738 (= res!1023632 (and (= (size!48954 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48954 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48954 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503739 () Bool)

(assert (=> b!1503739 (= e!841242 false)))

(declare-fun lt!653949 () Bool)

(declare-datatypes ((List!34882 0))(
  ( (Nil!34879) (Cons!34878 (h!36290 (_ BitVec 64)) (t!49568 List!34882)) )
))
(declare-fun arrayNoDuplicates!0 (array!100297 (_ BitVec 32) List!34882) Bool)

(assert (=> b!1503739 (= lt!653949 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34879))))

(assert (= (and start!128102 res!1023629) b!1503738))

(assert (= (and b!1503738 res!1023632) b!1503735))

(assert (= (and b!1503735 res!1023630) b!1503737))

(assert (= (and b!1503737 res!1023631) b!1503736))

(assert (= (and b!1503736 res!1023628) b!1503739))

(declare-fun m!1386967 () Bool)

(assert (=> b!1503739 m!1386967))

(declare-fun m!1386969 () Bool)

(assert (=> b!1503737 m!1386969))

(assert (=> b!1503737 m!1386969))

(declare-fun m!1386971 () Bool)

(assert (=> b!1503737 m!1386971))

(declare-fun m!1386973 () Bool)

(assert (=> b!1503736 m!1386973))

(declare-fun m!1386975 () Bool)

(assert (=> start!128102 m!1386975))

(declare-fun m!1386977 () Bool)

(assert (=> start!128102 m!1386977))

(declare-fun m!1386979 () Bool)

(assert (=> b!1503735 m!1386979))

(assert (=> b!1503735 m!1386979))

(declare-fun m!1386981 () Bool)

(assert (=> b!1503735 m!1386981))

(check-sat (not b!1503735) (not b!1503739) (not b!1503737) (not b!1503736) (not start!128102))
(check-sat)
