; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127970 () Bool)

(assert start!127970)

(declare-fun b!1501819 () Bool)

(declare-fun res!1021718 () Bool)

(declare-fun e!840596 () Bool)

(assert (=> b!1501819 (=> (not res!1021718) (not e!840596))))

(declare-datatypes ((array!100165 0))(
  ( (array!100166 (arr!48337 (Array (_ BitVec 32) (_ BitVec 64))) (size!48888 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100165)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100165 (_ BitVec 32)) Bool)

(assert (=> b!1501819 (= res!1021718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501820 () Bool)

(declare-fun res!1021713 () Bool)

(assert (=> b!1501820 (=> (not res!1021713) (not e!840596))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12440 0))(
  ( (MissingZero!12440 (index!52152 (_ BitVec 32))) (Found!12440 (index!52153 (_ BitVec 32))) (Intermediate!12440 (undefined!13252 Bool) (index!52154 (_ BitVec 32)) (x!134031 (_ BitVec 32))) (Undefined!12440) (MissingVacant!12440 (index!52155 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100165 (_ BitVec 32)) SeekEntryResult!12440)

(assert (=> b!1501820 (= res!1021713 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661) (Found!12440 j!87)))))

(declare-fun b!1501821 () Bool)

(declare-fun res!1021714 () Bool)

(assert (=> b!1501821 (=> (not res!1021714) (not e!840596))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501821 (= res!1021714 (and (= (size!48888 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48888 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48888 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501822 () Bool)

(declare-fun res!1021716 () Bool)

(assert (=> b!1501822 (=> (not res!1021716) (not e!840596))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501822 (= res!1021716 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48888 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48888 a!2850)) (= (select (arr!48337 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48337 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48888 a!2850))))))

(declare-fun b!1501823 () Bool)

(declare-fun res!1021717 () Bool)

(assert (=> b!1501823 (=> (not res!1021717) (not e!840596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501823 (= res!1021717 (validKeyInArray!0 (select (arr!48337 a!2850) j!87)))))

(declare-fun b!1501824 () Bool)

(declare-fun res!1021721 () Bool)

(assert (=> b!1501824 (=> (not res!1021721) (not e!840596))))

(assert (=> b!1501824 (= res!1021721 (validKeyInArray!0 (select (arr!48337 a!2850) i!996)))))

(declare-fun b!1501825 () Bool)

(declare-fun e!840597 () Bool)

(assert (=> b!1501825 (= e!840597 false)))

(declare-fun lt!653510 () (_ BitVec 32))

(declare-fun lt!653511 () SeekEntryResult!12440)

(assert (=> b!1501825 (= lt!653511 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653510 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501826 () Bool)

(declare-fun res!1021720 () Bool)

(assert (=> b!1501826 (=> (not res!1021720) (not e!840596))))

(declare-datatypes ((List!34816 0))(
  ( (Nil!34813) (Cons!34812 (h!36224 (_ BitVec 64)) (t!49502 List!34816)) )
))
(declare-fun arrayNoDuplicates!0 (array!100165 (_ BitVec 32) List!34816) Bool)

(assert (=> b!1501826 (= res!1021720 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34813))))

(declare-fun res!1021712 () Bool)

(assert (=> start!127970 (=> (not res!1021712) (not e!840596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127970 (= res!1021712 (validMask!0 mask!2661))))

(assert (=> start!127970 e!840596))

(assert (=> start!127970 true))

(declare-fun array_inv!37618 (array!100165) Bool)

(assert (=> start!127970 (array_inv!37618 a!2850)))

(declare-fun b!1501827 () Bool)

(declare-fun res!1021719 () Bool)

(assert (=> b!1501827 (=> (not res!1021719) (not e!840596))))

(assert (=> b!1501827 (= res!1021719 (not (= (select (arr!48337 a!2850) index!625) (select (arr!48337 a!2850) j!87))))))

(declare-fun b!1501828 () Bool)

(assert (=> b!1501828 (= e!840596 e!840597)))

(declare-fun res!1021715 () Bool)

(assert (=> b!1501828 (=> (not res!1021715) (not e!840597))))

(assert (=> b!1501828 (= res!1021715 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653510 #b00000000000000000000000000000000) (bvslt lt!653510 (size!48888 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501828 (= lt!653510 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (= (and start!127970 res!1021712) b!1501821))

(assert (= (and b!1501821 res!1021714) b!1501824))

(assert (= (and b!1501824 res!1021721) b!1501823))

(assert (= (and b!1501823 res!1021717) b!1501819))

(assert (= (and b!1501819 res!1021718) b!1501826))

(assert (= (and b!1501826 res!1021720) b!1501822))

(assert (= (and b!1501822 res!1021716) b!1501820))

(assert (= (and b!1501820 res!1021713) b!1501827))

(assert (= (and b!1501827 res!1021719) b!1501828))

(assert (= (and b!1501828 res!1021715) b!1501825))

(declare-fun m!1384963 () Bool)

(assert (=> b!1501825 m!1384963))

(assert (=> b!1501825 m!1384963))

(declare-fun m!1384965 () Bool)

(assert (=> b!1501825 m!1384965))

(assert (=> b!1501820 m!1384963))

(assert (=> b!1501820 m!1384963))

(declare-fun m!1384967 () Bool)

(assert (=> b!1501820 m!1384967))

(declare-fun m!1384969 () Bool)

(assert (=> b!1501828 m!1384969))

(declare-fun m!1384971 () Bool)

(assert (=> b!1501824 m!1384971))

(assert (=> b!1501824 m!1384971))

(declare-fun m!1384973 () Bool)

(assert (=> b!1501824 m!1384973))

(assert (=> b!1501823 m!1384963))

(assert (=> b!1501823 m!1384963))

(declare-fun m!1384975 () Bool)

(assert (=> b!1501823 m!1384975))

(declare-fun m!1384977 () Bool)

(assert (=> start!127970 m!1384977))

(declare-fun m!1384979 () Bool)

(assert (=> start!127970 m!1384979))

(declare-fun m!1384981 () Bool)

(assert (=> b!1501826 m!1384981))

(declare-fun m!1384983 () Bool)

(assert (=> b!1501819 m!1384983))

(declare-fun m!1384985 () Bool)

(assert (=> b!1501822 m!1384985))

(declare-fun m!1384987 () Bool)

(assert (=> b!1501822 m!1384987))

(declare-fun m!1384989 () Bool)

(assert (=> b!1501822 m!1384989))

(declare-fun m!1384991 () Bool)

(assert (=> b!1501827 m!1384991))

(assert (=> b!1501827 m!1384963))

(check-sat (not b!1501823) (not b!1501824) (not b!1501819) (not start!127970) (not b!1501826) (not b!1501828) (not b!1501825) (not b!1501820))
(check-sat)
