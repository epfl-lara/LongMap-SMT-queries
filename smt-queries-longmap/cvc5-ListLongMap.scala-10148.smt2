; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119652 () Bool)

(assert start!119652)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95334 0))(
  ( (array!95335 (arr!46025 (Array (_ BitVec 32) (_ BitVec 64))) (size!46575 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95334)

(declare-fun e!789182 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1393763 () Bool)

(declare-datatypes ((SeekEntryResult!10342 0))(
  ( (MissingZero!10342 (index!43739 (_ BitVec 32))) (Found!10342 (index!43740 (_ BitVec 32))) (Intermediate!10342 (undefined!11154 Bool) (index!43741 (_ BitVec 32)) (x!125418 (_ BitVec 32))) (Undefined!10342) (MissingVacant!10342 (index!43742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95334 (_ BitVec 32)) SeekEntryResult!10342)

(assert (=> b!1393763 (= e!789182 (= (seekEntryOrOpen!0 (select (arr!46025 a!2901) j!112) a!2901 mask!2840) (Found!10342 j!112)))))

(declare-fun b!1393764 () Bool)

(declare-fun e!789181 () Bool)

(declare-fun e!789180 () Bool)

(assert (=> b!1393764 (= e!789181 (not e!789180))))

(declare-fun res!933171 () Bool)

(assert (=> b!1393764 (=> res!933171 e!789180)))

(declare-fun lt!612112 () SeekEntryResult!10342)

(assert (=> b!1393764 (= res!933171 (or (not (is-Intermediate!10342 lt!612112)) (undefined!11154 lt!612112)))))

(assert (=> b!1393764 e!789182))

(declare-fun res!933172 () Bool)

(assert (=> b!1393764 (=> (not res!933172) (not e!789182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95334 (_ BitVec 32)) Bool)

(assert (=> b!1393764 (= res!933172 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46688 0))(
  ( (Unit!46689) )
))
(declare-fun lt!612114 () Unit!46688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46688)

(assert (=> b!1393764 (= lt!612114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95334 (_ BitVec 32)) SeekEntryResult!10342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393764 (= lt!612112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46025 a!2901) j!112) mask!2840) (select (arr!46025 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933176 () Bool)

(assert (=> start!119652 (=> (not res!933176) (not e!789181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119652 (= res!933176 (validMask!0 mask!2840))))

(assert (=> start!119652 e!789181))

(assert (=> start!119652 true))

(declare-fun array_inv!35053 (array!95334) Bool)

(assert (=> start!119652 (array_inv!35053 a!2901)))

(declare-fun b!1393765 () Bool)

(assert (=> b!1393765 (= e!789180 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612113 () SeekEntryResult!10342)

(assert (=> b!1393765 (= lt!612113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46025 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46025 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95335 (store (arr!46025 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46575 a!2901)) mask!2840))))

(declare-fun b!1393766 () Bool)

(declare-fun res!933175 () Bool)

(assert (=> b!1393766 (=> (not res!933175) (not e!789181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393766 (= res!933175 (validKeyInArray!0 (select (arr!46025 a!2901) i!1037)))))

(declare-fun b!1393767 () Bool)

(declare-fun res!933178 () Bool)

(assert (=> b!1393767 (=> (not res!933178) (not e!789181))))

(assert (=> b!1393767 (= res!933178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393768 () Bool)

(declare-fun res!933177 () Bool)

(assert (=> b!1393768 (=> (not res!933177) (not e!789181))))

(assert (=> b!1393768 (= res!933177 (and (= (size!46575 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46575 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46575 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393769 () Bool)

(declare-fun res!933174 () Bool)

(assert (=> b!1393769 (=> (not res!933174) (not e!789181))))

(assert (=> b!1393769 (= res!933174 (validKeyInArray!0 (select (arr!46025 a!2901) j!112)))))

(declare-fun b!1393770 () Bool)

(declare-fun res!933173 () Bool)

(assert (=> b!1393770 (=> (not res!933173) (not e!789181))))

(declare-datatypes ((List!32544 0))(
  ( (Nil!32541) (Cons!32540 (h!33773 (_ BitVec 64)) (t!47238 List!32544)) )
))
(declare-fun arrayNoDuplicates!0 (array!95334 (_ BitVec 32) List!32544) Bool)

(assert (=> b!1393770 (= res!933173 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32541))))

(assert (= (and start!119652 res!933176) b!1393768))

(assert (= (and b!1393768 res!933177) b!1393766))

(assert (= (and b!1393766 res!933175) b!1393769))

(assert (= (and b!1393769 res!933174) b!1393767))

(assert (= (and b!1393767 res!933178) b!1393770))

(assert (= (and b!1393770 res!933173) b!1393764))

(assert (= (and b!1393764 res!933172) b!1393763))

(assert (= (and b!1393764 (not res!933171)) b!1393765))

(declare-fun m!1279809 () Bool)

(assert (=> b!1393765 m!1279809))

(declare-fun m!1279811 () Bool)

(assert (=> b!1393765 m!1279811))

(assert (=> b!1393765 m!1279811))

(declare-fun m!1279813 () Bool)

(assert (=> b!1393765 m!1279813))

(assert (=> b!1393765 m!1279813))

(assert (=> b!1393765 m!1279811))

(declare-fun m!1279815 () Bool)

(assert (=> b!1393765 m!1279815))

(declare-fun m!1279817 () Bool)

(assert (=> b!1393763 m!1279817))

(assert (=> b!1393763 m!1279817))

(declare-fun m!1279819 () Bool)

(assert (=> b!1393763 m!1279819))

(assert (=> b!1393769 m!1279817))

(assert (=> b!1393769 m!1279817))

(declare-fun m!1279821 () Bool)

(assert (=> b!1393769 m!1279821))

(declare-fun m!1279823 () Bool)

(assert (=> b!1393770 m!1279823))

(declare-fun m!1279825 () Bool)

(assert (=> b!1393767 m!1279825))

(assert (=> b!1393764 m!1279817))

(declare-fun m!1279827 () Bool)

(assert (=> b!1393764 m!1279827))

(assert (=> b!1393764 m!1279817))

(declare-fun m!1279829 () Bool)

(assert (=> b!1393764 m!1279829))

(assert (=> b!1393764 m!1279827))

(assert (=> b!1393764 m!1279817))

(declare-fun m!1279831 () Bool)

(assert (=> b!1393764 m!1279831))

(declare-fun m!1279833 () Bool)

(assert (=> b!1393764 m!1279833))

(declare-fun m!1279835 () Bool)

(assert (=> start!119652 m!1279835))

(declare-fun m!1279837 () Bool)

(assert (=> start!119652 m!1279837))

(declare-fun m!1279839 () Bool)

(assert (=> b!1393766 m!1279839))

(assert (=> b!1393766 m!1279839))

(declare-fun m!1279841 () Bool)

(assert (=> b!1393766 m!1279841))

(push 1)

(assert (not b!1393763))

(assert (not b!1393766))

(assert (not b!1393765))

(assert (not b!1393769))

(assert (not b!1393767))

(assert (not start!119652))

(assert (not b!1393770))

(assert (not b!1393764))

(check-sat)

