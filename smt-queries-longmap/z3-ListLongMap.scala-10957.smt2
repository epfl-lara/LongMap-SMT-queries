; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128198 () Bool)

(assert start!128198)

(declare-fun res!1025786 () Bool)

(declare-fun e!841220 () Bool)

(assert (=> start!128198 (=> (not res!1025786) (not e!841220))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128198 (= res!1025786 (validMask!0 mask!2512))))

(assert (=> start!128198 e!841220))

(assert (=> start!128198 true))

(declare-datatypes ((array!100351 0))(
  ( (array!100352 (arr!48427 (Array (_ BitVec 32) (_ BitVec 64))) (size!48979 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100351)

(declare-fun array_inv!37660 (array!100351) Bool)

(assert (=> start!128198 (array_inv!37660 a!2804)))

(declare-fun b!1505130 () Bool)

(declare-fun res!1025783 () Bool)

(assert (=> b!1505130 (=> (not res!1025783) (not e!841220))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505130 (= res!1025783 (validKeyInArray!0 (select (arr!48427 a!2804) j!70)))))

(declare-fun b!1505131 () Bool)

(declare-fun res!1025782 () Bool)

(assert (=> b!1505131 (=> (not res!1025782) (not e!841220))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505131 (= res!1025782 (and (= (size!48979 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48979 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48979 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505132 () Bool)

(assert (=> b!1505132 (= e!841220 (bvsgt #b00000000000000000000000000000000 (size!48979 a!2804)))))

(declare-fun b!1505133 () Bool)

(declare-fun res!1025785 () Bool)

(assert (=> b!1505133 (=> (not res!1025785) (not e!841220))))

(assert (=> b!1505133 (= res!1025785 (validKeyInArray!0 (select (arr!48427 a!2804) i!961)))))

(declare-fun b!1505134 () Bool)

(declare-fun res!1025784 () Bool)

(assert (=> b!1505134 (=> (not res!1025784) (not e!841220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100351 (_ BitVec 32)) Bool)

(assert (=> b!1505134 (= res!1025784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128198 res!1025786) b!1505131))

(assert (= (and b!1505131 res!1025782) b!1505133))

(assert (= (and b!1505133 res!1025785) b!1505130))

(assert (= (and b!1505130 res!1025783) b!1505134))

(assert (= (and b!1505134 res!1025784) b!1505132))

(declare-fun m!1387661 () Bool)

(assert (=> start!128198 m!1387661))

(declare-fun m!1387663 () Bool)

(assert (=> start!128198 m!1387663))

(declare-fun m!1387665 () Bool)

(assert (=> b!1505130 m!1387665))

(assert (=> b!1505130 m!1387665))

(declare-fun m!1387667 () Bool)

(assert (=> b!1505130 m!1387667))

(declare-fun m!1387669 () Bool)

(assert (=> b!1505133 m!1387669))

(assert (=> b!1505133 m!1387669))

(declare-fun m!1387671 () Bool)

(assert (=> b!1505133 m!1387671))

(declare-fun m!1387673 () Bool)

(assert (=> b!1505134 m!1387673))

(check-sat (not b!1505134) (not start!128198) (not b!1505130) (not b!1505133))
(check-sat)
