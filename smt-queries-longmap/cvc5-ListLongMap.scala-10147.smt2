; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119646 () Bool)

(assert start!119646)

(declare-datatypes ((array!95281 0))(
  ( (array!95282 (arr!45999 (Array (_ BitVec 32) (_ BitVec 64))) (size!46551 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95281)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!789129 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1393658 () Bool)

(declare-datatypes ((SeekEntryResult!10342 0))(
  ( (MissingZero!10342 (index!43739 (_ BitVec 32))) (Found!10342 (index!43740 (_ BitVec 32))) (Intermediate!10342 (undefined!11154 Bool) (index!43741 (_ BitVec 32)) (x!125407 (_ BitVec 32))) (Undefined!10342) (MissingVacant!10342 (index!43742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95281 (_ BitVec 32)) SeekEntryResult!10342)

(assert (=> b!1393658 (= e!789129 (= (seekEntryOrOpen!0 (select (arr!45999 a!2901) j!112) a!2901 mask!2840) (Found!10342 j!112)))))

(declare-fun b!1393659 () Bool)

(declare-fun e!789128 () Bool)

(assert (=> b!1393659 (= e!789128 true)))

(declare-fun lt!611914 () SeekEntryResult!10342)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95281 (_ BitVec 32)) SeekEntryResult!10342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393659 (= lt!611914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95282 (store (arr!45999 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46551 a!2901)) mask!2840))))

(declare-fun b!1393660 () Bool)

(declare-fun res!933122 () Bool)

(declare-fun e!789131 () Bool)

(assert (=> b!1393660 (=> (not res!933122) (not e!789131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393660 (= res!933122 (validKeyInArray!0 (select (arr!45999 a!2901) i!1037)))))

(declare-fun res!933120 () Bool)

(assert (=> start!119646 (=> (not res!933120) (not e!789131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119646 (= res!933120 (validMask!0 mask!2840))))

(assert (=> start!119646 e!789131))

(assert (=> start!119646 true))

(declare-fun array_inv!35232 (array!95281) Bool)

(assert (=> start!119646 (array_inv!35232 a!2901)))

(declare-fun b!1393661 () Bool)

(assert (=> b!1393661 (= e!789131 (not e!789128))))

(declare-fun res!933117 () Bool)

(assert (=> b!1393661 (=> res!933117 e!789128)))

(declare-fun lt!611913 () SeekEntryResult!10342)

(assert (=> b!1393661 (= res!933117 (or (not (is-Intermediate!10342 lt!611913)) (undefined!11154 lt!611913)))))

(assert (=> b!1393661 e!789129))

(declare-fun res!933124 () Bool)

(assert (=> b!1393661 (=> (not res!933124) (not e!789129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95281 (_ BitVec 32)) Bool)

(assert (=> b!1393661 (= res!933124 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46531 0))(
  ( (Unit!46532) )
))
(declare-fun lt!611915 () Unit!46531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46531)

(assert (=> b!1393661 (= lt!611915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393661 (= lt!611913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45999 a!2901) j!112) mask!2840) (select (arr!45999 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393662 () Bool)

(declare-fun res!933121 () Bool)

(assert (=> b!1393662 (=> (not res!933121) (not e!789131))))

(assert (=> b!1393662 (= res!933121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393663 () Bool)

(declare-fun res!933118 () Bool)

(assert (=> b!1393663 (=> (not res!933118) (not e!789131))))

(declare-datatypes ((List!32596 0))(
  ( (Nil!32593) (Cons!32592 (h!33825 (_ BitVec 64)) (t!47282 List!32596)) )
))
(declare-fun arrayNoDuplicates!0 (array!95281 (_ BitVec 32) List!32596) Bool)

(assert (=> b!1393663 (= res!933118 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32593))))

(declare-fun b!1393664 () Bool)

(declare-fun res!933123 () Bool)

(assert (=> b!1393664 (=> (not res!933123) (not e!789131))))

(assert (=> b!1393664 (= res!933123 (and (= (size!46551 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46551 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46551 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393665 () Bool)

(declare-fun res!933119 () Bool)

(assert (=> b!1393665 (=> (not res!933119) (not e!789131))))

(assert (=> b!1393665 (= res!933119 (validKeyInArray!0 (select (arr!45999 a!2901) j!112)))))

(assert (= (and start!119646 res!933120) b!1393664))

(assert (= (and b!1393664 res!933123) b!1393660))

(assert (= (and b!1393660 res!933122) b!1393665))

(assert (= (and b!1393665 res!933119) b!1393662))

(assert (= (and b!1393662 res!933121) b!1393663))

(assert (= (and b!1393663 res!933118) b!1393661))

(assert (= (and b!1393661 res!933124) b!1393658))

(assert (= (and b!1393661 (not res!933117)) b!1393659))

(declare-fun m!1279239 () Bool)

(assert (=> b!1393660 m!1279239))

(assert (=> b!1393660 m!1279239))

(declare-fun m!1279241 () Bool)

(assert (=> b!1393660 m!1279241))

(declare-fun m!1279243 () Bool)

(assert (=> b!1393665 m!1279243))

(assert (=> b!1393665 m!1279243))

(declare-fun m!1279245 () Bool)

(assert (=> b!1393665 m!1279245))

(assert (=> b!1393658 m!1279243))

(assert (=> b!1393658 m!1279243))

(declare-fun m!1279247 () Bool)

(assert (=> b!1393658 m!1279247))

(declare-fun m!1279249 () Bool)

(assert (=> start!119646 m!1279249))

(declare-fun m!1279251 () Bool)

(assert (=> start!119646 m!1279251))

(assert (=> b!1393661 m!1279243))

(declare-fun m!1279253 () Bool)

(assert (=> b!1393661 m!1279253))

(assert (=> b!1393661 m!1279243))

(declare-fun m!1279255 () Bool)

(assert (=> b!1393661 m!1279255))

(assert (=> b!1393661 m!1279253))

(assert (=> b!1393661 m!1279243))

(declare-fun m!1279257 () Bool)

(assert (=> b!1393661 m!1279257))

(declare-fun m!1279259 () Bool)

(assert (=> b!1393661 m!1279259))

(declare-fun m!1279261 () Bool)

(assert (=> b!1393662 m!1279261))

(declare-fun m!1279263 () Bool)

(assert (=> b!1393663 m!1279263))

(declare-fun m!1279265 () Bool)

(assert (=> b!1393659 m!1279265))

(declare-fun m!1279267 () Bool)

(assert (=> b!1393659 m!1279267))

(assert (=> b!1393659 m!1279267))

(declare-fun m!1279269 () Bool)

(assert (=> b!1393659 m!1279269))

(assert (=> b!1393659 m!1279269))

(assert (=> b!1393659 m!1279267))

(declare-fun m!1279271 () Bool)

(assert (=> b!1393659 m!1279271))

(push 1)

(assert (not b!1393658))

(assert (not b!1393659))

(assert (not start!119646))

(assert (not b!1393661))

(assert (not b!1393662))

(assert (not b!1393665))

(assert (not b!1393663))

(assert (not b!1393660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

