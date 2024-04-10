; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119654 () Bool)

(assert start!119654)

(declare-fun b!1393787 () Bool)

(declare-fun res!933201 () Bool)

(declare-fun e!789194 () Bool)

(assert (=> b!1393787 (=> (not res!933201) (not e!789194))))

(declare-datatypes ((array!95336 0))(
  ( (array!95337 (arr!46026 (Array (_ BitVec 32) (_ BitVec 64))) (size!46576 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95336)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95336 (_ BitVec 32)) Bool)

(assert (=> b!1393787 (= res!933201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393788 () Bool)

(declare-fun res!933197 () Bool)

(assert (=> b!1393788 (=> (not res!933197) (not e!789194))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393788 (= res!933197 (validKeyInArray!0 (select (arr!46026 a!2901) j!112)))))

(declare-fun b!1393789 () Bool)

(declare-fun e!789191 () Bool)

(assert (=> b!1393789 (= e!789194 (not e!789191))))

(declare-fun res!933196 () Bool)

(assert (=> b!1393789 (=> res!933196 e!789191)))

(declare-datatypes ((SeekEntryResult!10343 0))(
  ( (MissingZero!10343 (index!43743 (_ BitVec 32))) (Found!10343 (index!43744 (_ BitVec 32))) (Intermediate!10343 (undefined!11155 Bool) (index!43745 (_ BitVec 32)) (x!125419 (_ BitVec 32))) (Undefined!10343) (MissingVacant!10343 (index!43746 (_ BitVec 32))) )
))
(declare-fun lt!612122 () SeekEntryResult!10343)

(get-info :version)

(assert (=> b!1393789 (= res!933196 (or (not ((_ is Intermediate!10343) lt!612122)) (undefined!11155 lt!612122)))))

(declare-fun e!789192 () Bool)

(assert (=> b!1393789 e!789192))

(declare-fun res!933199 () Bool)

(assert (=> b!1393789 (=> (not res!933199) (not e!789192))))

(assert (=> b!1393789 (= res!933199 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46690 0))(
  ( (Unit!46691) )
))
(declare-fun lt!612123 () Unit!46690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46690)

(assert (=> b!1393789 (= lt!612123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95336 (_ BitVec 32)) SeekEntryResult!10343)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393789 (= lt!612122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46026 a!2901) j!112) mask!2840) (select (arr!46026 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393790 () Bool)

(assert (=> b!1393790 (= e!789191 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612121 () SeekEntryResult!10343)

(assert (=> b!1393790 (= lt!612121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46026 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46026 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95337 (store (arr!46026 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46576 a!2901)) mask!2840))))

(declare-fun b!1393791 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95336 (_ BitVec 32)) SeekEntryResult!10343)

(assert (=> b!1393791 (= e!789192 (= (seekEntryOrOpen!0 (select (arr!46026 a!2901) j!112) a!2901 mask!2840) (Found!10343 j!112)))))

(declare-fun res!933198 () Bool)

(assert (=> start!119654 (=> (not res!933198) (not e!789194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119654 (= res!933198 (validMask!0 mask!2840))))

(assert (=> start!119654 e!789194))

(assert (=> start!119654 true))

(declare-fun array_inv!35054 (array!95336) Bool)

(assert (=> start!119654 (array_inv!35054 a!2901)))

(declare-fun b!1393792 () Bool)

(declare-fun res!933200 () Bool)

(assert (=> b!1393792 (=> (not res!933200) (not e!789194))))

(assert (=> b!1393792 (= res!933200 (validKeyInArray!0 (select (arr!46026 a!2901) i!1037)))))

(declare-fun b!1393793 () Bool)

(declare-fun res!933202 () Bool)

(assert (=> b!1393793 (=> (not res!933202) (not e!789194))))

(assert (=> b!1393793 (= res!933202 (and (= (size!46576 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46576 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46576 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393794 () Bool)

(declare-fun res!933195 () Bool)

(assert (=> b!1393794 (=> (not res!933195) (not e!789194))))

(declare-datatypes ((List!32545 0))(
  ( (Nil!32542) (Cons!32541 (h!33774 (_ BitVec 64)) (t!47239 List!32545)) )
))
(declare-fun arrayNoDuplicates!0 (array!95336 (_ BitVec 32) List!32545) Bool)

(assert (=> b!1393794 (= res!933195 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32542))))

(assert (= (and start!119654 res!933198) b!1393793))

(assert (= (and b!1393793 res!933202) b!1393792))

(assert (= (and b!1393792 res!933200) b!1393788))

(assert (= (and b!1393788 res!933197) b!1393787))

(assert (= (and b!1393787 res!933201) b!1393794))

(assert (= (and b!1393794 res!933195) b!1393789))

(assert (= (and b!1393789 res!933199) b!1393791))

(assert (= (and b!1393789 (not res!933196)) b!1393790))

(declare-fun m!1279843 () Bool)

(assert (=> start!119654 m!1279843))

(declare-fun m!1279845 () Bool)

(assert (=> start!119654 m!1279845))

(declare-fun m!1279847 () Bool)

(assert (=> b!1393792 m!1279847))

(assert (=> b!1393792 m!1279847))

(declare-fun m!1279849 () Bool)

(assert (=> b!1393792 m!1279849))

(declare-fun m!1279851 () Bool)

(assert (=> b!1393787 m!1279851))

(declare-fun m!1279853 () Bool)

(assert (=> b!1393790 m!1279853))

(declare-fun m!1279855 () Bool)

(assert (=> b!1393790 m!1279855))

(assert (=> b!1393790 m!1279855))

(declare-fun m!1279857 () Bool)

(assert (=> b!1393790 m!1279857))

(assert (=> b!1393790 m!1279857))

(assert (=> b!1393790 m!1279855))

(declare-fun m!1279859 () Bool)

(assert (=> b!1393790 m!1279859))

(declare-fun m!1279861 () Bool)

(assert (=> b!1393794 m!1279861))

(declare-fun m!1279863 () Bool)

(assert (=> b!1393789 m!1279863))

(declare-fun m!1279865 () Bool)

(assert (=> b!1393789 m!1279865))

(assert (=> b!1393789 m!1279863))

(declare-fun m!1279867 () Bool)

(assert (=> b!1393789 m!1279867))

(assert (=> b!1393789 m!1279865))

(assert (=> b!1393789 m!1279863))

(declare-fun m!1279869 () Bool)

(assert (=> b!1393789 m!1279869))

(declare-fun m!1279871 () Bool)

(assert (=> b!1393789 m!1279871))

(assert (=> b!1393791 m!1279863))

(assert (=> b!1393791 m!1279863))

(declare-fun m!1279873 () Bool)

(assert (=> b!1393791 m!1279873))

(assert (=> b!1393788 m!1279863))

(assert (=> b!1393788 m!1279863))

(declare-fun m!1279875 () Bool)

(assert (=> b!1393788 m!1279875))

(check-sat (not b!1393794) (not b!1393789) (not b!1393787) (not start!119654) (not b!1393788) (not b!1393790) (not b!1393791) (not b!1393792))
