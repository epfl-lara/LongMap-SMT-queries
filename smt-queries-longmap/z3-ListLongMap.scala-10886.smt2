; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127580 () Bool)

(assert start!127580)

(declare-fun res!1019874 () Bool)

(declare-fun e!839119 () Bool)

(assert (=> start!127580 (=> (not res!1019874) (not e!839119))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127580 (= res!1019874 (validMask!0 mask!2661))))

(assert (=> start!127580 e!839119))

(assert (=> start!127580 true))

(declare-datatypes ((array!99961 0))(
  ( (array!99962 (arr!48240 (Array (_ BitVec 32) (_ BitVec 64))) (size!48790 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99961)

(declare-fun array_inv!37268 (array!99961) Bool)

(assert (=> start!127580 (array_inv!37268 a!2850)))

(declare-fun b!1498795 () Bool)

(declare-fun res!1019878 () Bool)

(assert (=> b!1498795 (=> (not res!1019878) (not e!839119))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498795 (= res!1019878 (validKeyInArray!0 (select (arr!48240 a!2850) j!87)))))

(declare-fun b!1498796 () Bool)

(declare-fun res!1019875 () Bool)

(assert (=> b!1498796 (=> (not res!1019875) (not e!839119))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498796 (= res!1019875 (validKeyInArray!0 (select (arr!48240 a!2850) i!996)))))

(declare-fun b!1498797 () Bool)

(declare-fun res!1019871 () Bool)

(assert (=> b!1498797 (=> (not res!1019871) (not e!839119))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498797 (= res!1019871 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48790 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48790 a!2850)) (= (select (arr!48240 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48240 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48790 a!2850))))))

(declare-fun b!1498798 () Bool)

(declare-fun res!1019873 () Bool)

(assert (=> b!1498798 (=> (not res!1019873) (not e!839119))))

(assert (=> b!1498798 (= res!1019873 (and (= (size!48790 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48790 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48790 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498799 () Bool)

(declare-fun res!1019876 () Bool)

(assert (=> b!1498799 (=> (not res!1019876) (not e!839119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99961 (_ BitVec 32)) Bool)

(assert (=> b!1498799 (= res!1019876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498800 () Bool)

(declare-fun res!1019877 () Bool)

(assert (=> b!1498800 (=> (not res!1019877) (not e!839119))))

(declare-datatypes ((List!34732 0))(
  ( (Nil!34729) (Cons!34728 (h!36125 (_ BitVec 64)) (t!49426 List!34732)) )
))
(declare-fun arrayNoDuplicates!0 (array!99961 (_ BitVec 32) List!34732) Bool)

(assert (=> b!1498800 (= res!1019877 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34729))))

(declare-fun b!1498801 () Bool)

(assert (=> b!1498801 (= e!839119 (and (= (select (arr!48240 a!2850) index!625) (select (arr!48240 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498802 () Bool)

(declare-fun res!1019872 () Bool)

(assert (=> b!1498802 (=> (not res!1019872) (not e!839119))))

(declare-datatypes ((SeekEntryResult!12450 0))(
  ( (MissingZero!12450 (index!52192 (_ BitVec 32))) (Found!12450 (index!52193 (_ BitVec 32))) (Intermediate!12450 (undefined!13262 Bool) (index!52194 (_ BitVec 32)) (x!133884 (_ BitVec 32))) (Undefined!12450) (MissingVacant!12450 (index!52195 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99961 (_ BitVec 32)) SeekEntryResult!12450)

(assert (=> b!1498802 (= res!1019872 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48240 a!2850) j!87) a!2850 mask!2661) (Found!12450 j!87)))))

(assert (= (and start!127580 res!1019874) b!1498798))

(assert (= (and b!1498798 res!1019873) b!1498796))

(assert (= (and b!1498796 res!1019875) b!1498795))

(assert (= (and b!1498795 res!1019878) b!1498799))

(assert (= (and b!1498799 res!1019876) b!1498800))

(assert (= (and b!1498800 res!1019877) b!1498797))

(assert (= (and b!1498797 res!1019871) b!1498802))

(assert (= (and b!1498802 res!1019872) b!1498801))

(declare-fun m!1381941 () Bool)

(assert (=> b!1498797 m!1381941))

(declare-fun m!1381943 () Bool)

(assert (=> b!1498797 m!1381943))

(declare-fun m!1381945 () Bool)

(assert (=> b!1498797 m!1381945))

(declare-fun m!1381947 () Bool)

(assert (=> b!1498802 m!1381947))

(assert (=> b!1498802 m!1381947))

(declare-fun m!1381949 () Bool)

(assert (=> b!1498802 m!1381949))

(declare-fun m!1381951 () Bool)

(assert (=> b!1498801 m!1381951))

(assert (=> b!1498801 m!1381947))

(declare-fun m!1381953 () Bool)

(assert (=> b!1498796 m!1381953))

(assert (=> b!1498796 m!1381953))

(declare-fun m!1381955 () Bool)

(assert (=> b!1498796 m!1381955))

(declare-fun m!1381957 () Bool)

(assert (=> b!1498800 m!1381957))

(declare-fun m!1381959 () Bool)

(assert (=> b!1498799 m!1381959))

(declare-fun m!1381961 () Bool)

(assert (=> start!127580 m!1381961))

(declare-fun m!1381963 () Bool)

(assert (=> start!127580 m!1381963))

(assert (=> b!1498795 m!1381947))

(assert (=> b!1498795 m!1381947))

(declare-fun m!1381965 () Bool)

(assert (=> b!1498795 m!1381965))

(check-sat (not b!1498796) (not b!1498795) (not start!127580) (not b!1498802) (not b!1498800) (not b!1498799))
(check-sat)
