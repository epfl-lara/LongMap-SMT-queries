; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127790 () Bool)

(assert start!127790)

(declare-fun b!1501822 () Bool)

(declare-fun res!1022902 () Bool)

(declare-fun e!840073 () Bool)

(assert (=> b!1501822 (=> (not res!1022902) (not e!840073))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100171 0))(
  ( (array!100172 (arr!48345 (Array (_ BitVec 32) (_ BitVec 64))) (size!48895 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100171)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501822 (= res!1022902 (and (= (size!48895 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48895 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48895 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022898 () Bool)

(assert (=> start!127790 (=> (not res!1022898) (not e!840073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127790 (= res!1022898 (validMask!0 mask!2661))))

(assert (=> start!127790 e!840073))

(assert (=> start!127790 true))

(declare-fun array_inv!37373 (array!100171) Bool)

(assert (=> start!127790 (array_inv!37373 a!2850)))

(declare-fun b!1501823 () Bool)

(declare-fun res!1022899 () Bool)

(assert (=> b!1501823 (=> (not res!1022899) (not e!840073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501823 (= res!1022899 (validKeyInArray!0 (select (arr!48345 a!2850) i!996)))))

(declare-fun b!1501824 () Bool)

(declare-fun res!1022901 () Bool)

(assert (=> b!1501824 (=> (not res!1022901) (not e!840073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100171 (_ BitVec 32)) Bool)

(assert (=> b!1501824 (= res!1022901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501825 () Bool)

(declare-fun res!1022900 () Bool)

(assert (=> b!1501825 (=> (not res!1022900) (not e!840073))))

(assert (=> b!1501825 (= res!1022900 (validKeyInArray!0 (select (arr!48345 a!2850) j!87)))))

(declare-fun b!1501826 () Bool)

(assert (=> b!1501826 (= e!840073 false)))

(declare-fun lt!653269 () Bool)

(declare-datatypes ((List!34837 0))(
  ( (Nil!34834) (Cons!34833 (h!36230 (_ BitVec 64)) (t!49531 List!34837)) )
))
(declare-fun arrayNoDuplicates!0 (array!100171 (_ BitVec 32) List!34837) Bool)

(assert (=> b!1501826 (= lt!653269 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34834))))

(assert (= (and start!127790 res!1022898) b!1501822))

(assert (= (and b!1501822 res!1022902) b!1501823))

(assert (= (and b!1501823 res!1022899) b!1501825))

(assert (= (and b!1501825 res!1022900) b!1501824))

(assert (= (and b!1501824 res!1022901) b!1501826))

(declare-fun m!1385099 () Bool)

(assert (=> b!1501826 m!1385099))

(declare-fun m!1385101 () Bool)

(assert (=> start!127790 m!1385101))

(declare-fun m!1385103 () Bool)

(assert (=> start!127790 m!1385103))

(declare-fun m!1385105 () Bool)

(assert (=> b!1501824 m!1385105))

(declare-fun m!1385107 () Bool)

(assert (=> b!1501823 m!1385107))

(assert (=> b!1501823 m!1385107))

(declare-fun m!1385109 () Bool)

(assert (=> b!1501823 m!1385109))

(declare-fun m!1385111 () Bool)

(assert (=> b!1501825 m!1385111))

(assert (=> b!1501825 m!1385111))

(declare-fun m!1385113 () Bool)

(assert (=> b!1501825 m!1385113))

(check-sat (not b!1501824) (not b!1501826) (not b!1501825) (not b!1501823) (not start!127790))
