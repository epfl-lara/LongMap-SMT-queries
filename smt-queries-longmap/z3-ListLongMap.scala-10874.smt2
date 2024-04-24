; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127774 () Bool)

(assert start!127774)

(declare-fun b!1499799 () Bool)

(declare-fun res!1019780 () Bool)

(declare-fun e!839954 () Bool)

(assert (=> b!1499799 (=> (not res!1019780) (not e!839954))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100000 0))(
  ( (array!100001 (arr!48256 (Array (_ BitVec 32) (_ BitVec 64))) (size!48807 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100000)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499799 (= res!1019780 (and (= (size!48807 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48807 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48807 a!2850)) (not (= i!996 j!87))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1499800 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499800 (= e!839954 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48807 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48807 a!2850)) (= (select (arr!48256 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48256 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48807 a!2850)) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1499801 () Bool)

(declare-fun res!1019775 () Bool)

(assert (=> b!1499801 (=> (not res!1019775) (not e!839954))))

(declare-datatypes ((List!34735 0))(
  ( (Nil!34732) (Cons!34731 (h!36143 (_ BitVec 64)) (t!49421 List!34735)) )
))
(declare-fun arrayNoDuplicates!0 (array!100000 (_ BitVec 32) List!34735) Bool)

(assert (=> b!1499801 (= res!1019775 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34732))))

(declare-fun b!1499802 () Bool)

(declare-fun res!1019779 () Bool)

(assert (=> b!1499802 (=> (not res!1019779) (not e!839954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100000 (_ BitVec 32)) Bool)

(assert (=> b!1499802 (= res!1019779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499803 () Bool)

(declare-fun res!1019776 () Bool)

(assert (=> b!1499803 (=> (not res!1019776) (not e!839954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499803 (= res!1019776 (validKeyInArray!0 (select (arr!48256 a!2850) j!87)))))

(declare-fun res!1019778 () Bool)

(assert (=> start!127774 (=> (not res!1019778) (not e!839954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127774 (= res!1019778 (validMask!0 mask!2661))))

(assert (=> start!127774 e!839954))

(assert (=> start!127774 true))

(declare-fun array_inv!37537 (array!100000) Bool)

(assert (=> start!127774 (array_inv!37537 a!2850)))

(declare-fun b!1499798 () Bool)

(declare-fun res!1019777 () Bool)

(assert (=> b!1499798 (=> (not res!1019777) (not e!839954))))

(assert (=> b!1499798 (= res!1019777 (validKeyInArray!0 (select (arr!48256 a!2850) i!996)))))

(assert (= (and start!127774 res!1019778) b!1499799))

(assert (= (and b!1499799 res!1019780) b!1499798))

(assert (= (and b!1499798 res!1019777) b!1499803))

(assert (= (and b!1499803 res!1019776) b!1499802))

(assert (= (and b!1499802 res!1019779) b!1499801))

(assert (= (and b!1499801 res!1019775) b!1499800))

(declare-fun m!1382879 () Bool)

(assert (=> b!1499802 m!1382879))

(declare-fun m!1382881 () Bool)

(assert (=> b!1499798 m!1382881))

(assert (=> b!1499798 m!1382881))

(declare-fun m!1382883 () Bool)

(assert (=> b!1499798 m!1382883))

(declare-fun m!1382885 () Bool)

(assert (=> b!1499800 m!1382885))

(declare-fun m!1382887 () Bool)

(assert (=> b!1499800 m!1382887))

(declare-fun m!1382889 () Bool)

(assert (=> b!1499800 m!1382889))

(declare-fun m!1382891 () Bool)

(assert (=> start!127774 m!1382891))

(declare-fun m!1382893 () Bool)

(assert (=> start!127774 m!1382893))

(declare-fun m!1382895 () Bool)

(assert (=> b!1499803 m!1382895))

(assert (=> b!1499803 m!1382895))

(declare-fun m!1382897 () Bool)

(assert (=> b!1499803 m!1382897))

(declare-fun m!1382899 () Bool)

(assert (=> b!1499801 m!1382899))

(check-sat (not b!1499803) (not b!1499801) (not b!1499798) (not b!1499802) (not start!127774))
(check-sat)
