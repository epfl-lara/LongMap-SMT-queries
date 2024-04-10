; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128916 () Bool)

(assert start!128916)

(declare-fun res!1031016 () Bool)

(declare-fun e!843700 () Bool)

(assert (=> start!128916 (=> (not res!1031016) (not e!843700))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128916 (= res!1031016 (validMask!0 mask!2512))))

(assert (=> start!128916 e!843700))

(assert (=> start!128916 true))

(declare-datatypes ((array!100772 0))(
  ( (array!100773 (arr!48623 (Array (_ BitVec 32) (_ BitVec 64))) (size!49173 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100772)

(declare-fun array_inv!37651 (array!100772) Bool)

(assert (=> start!128916 (array_inv!37651 a!2804)))

(declare-fun b!1511104 () Bool)

(declare-fun res!1031013 () Bool)

(assert (=> b!1511104 (=> (not res!1031013) (not e!843700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100772 (_ BitVec 32)) Bool)

(assert (=> b!1511104 (= res!1031013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!843701 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun b!1511105 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511105 (= e!843701 (not (or (not (= (select (arr!48623 a!2804) j!70) (select (store (arr!48623 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48623 a!2804) index!487) (select (arr!48623 a!2804) j!70)) (not (= (select (arr!48623 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!843703 () Bool)

(assert (=> b!1511105 e!843703))

(declare-fun res!1031014 () Bool)

(assert (=> b!1511105 (=> (not res!1031014) (not e!843703))))

(assert (=> b!1511105 (= res!1031014 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50456 0))(
  ( (Unit!50457) )
))
(declare-fun lt!655351 () Unit!50456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50456)

(assert (=> b!1511105 (= lt!655351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511106 () Bool)

(declare-fun res!1031008 () Bool)

(assert (=> b!1511106 (=> (not res!1031008) (not e!843701))))

(declare-datatypes ((SeekEntryResult!12794 0))(
  ( (MissingZero!12794 (index!53571 (_ BitVec 32))) (Found!12794 (index!53572 (_ BitVec 32))) (Intermediate!12794 (undefined!13606 Bool) (index!53573 (_ BitVec 32)) (x!135312 (_ BitVec 32))) (Undefined!12794) (MissingVacant!12794 (index!53574 (_ BitVec 32))) )
))
(declare-fun lt!655350 () SeekEntryResult!12794)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100772 (_ BitVec 32)) SeekEntryResult!12794)

(assert (=> b!1511106 (= res!1031008 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48623 a!2804) j!70) a!2804 mask!2512) lt!655350))))

(declare-fun b!1511107 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100772 (_ BitVec 32)) SeekEntryResult!12794)

(assert (=> b!1511107 (= e!843703 (= (seekEntry!0 (select (arr!48623 a!2804) j!70) a!2804 mask!2512) (Found!12794 j!70)))))

(declare-fun b!1511108 () Bool)

(assert (=> b!1511108 (= e!843700 e!843701)))

(declare-fun res!1031007 () Bool)

(assert (=> b!1511108 (=> (not res!1031007) (not e!843701))))

(declare-fun lt!655349 () SeekEntryResult!12794)

(assert (=> b!1511108 (= res!1031007 (= lt!655349 lt!655350))))

(assert (=> b!1511108 (= lt!655350 (Intermediate!12794 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511108 (= lt!655349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48623 a!2804) j!70) mask!2512) (select (arr!48623 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511109 () Bool)

(declare-fun res!1031011 () Bool)

(assert (=> b!1511109 (=> (not res!1031011) (not e!843700))))

(declare-datatypes ((List!35106 0))(
  ( (Nil!35103) (Cons!35102 (h!36514 (_ BitVec 64)) (t!49800 List!35106)) )
))
(declare-fun arrayNoDuplicates!0 (array!100772 (_ BitVec 32) List!35106) Bool)

(assert (=> b!1511109 (= res!1031011 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35103))))

(declare-fun b!1511110 () Bool)

(declare-fun res!1031010 () Bool)

(assert (=> b!1511110 (=> (not res!1031010) (not e!843700))))

(assert (=> b!1511110 (= res!1031010 (and (= (size!49173 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49173 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49173 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511111 () Bool)

(declare-fun res!1031012 () Bool)

(assert (=> b!1511111 (=> (not res!1031012) (not e!843701))))

(assert (=> b!1511111 (= res!1031012 (= lt!655349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48623 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48623 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100773 (store (arr!48623 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49173 a!2804)) mask!2512)))))

(declare-fun b!1511112 () Bool)

(declare-fun res!1031009 () Bool)

(assert (=> b!1511112 (=> (not res!1031009) (not e!843700))))

(assert (=> b!1511112 (= res!1031009 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49173 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49173 a!2804))))))

(declare-fun b!1511113 () Bool)

(declare-fun res!1031015 () Bool)

(assert (=> b!1511113 (=> (not res!1031015) (not e!843700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511113 (= res!1031015 (validKeyInArray!0 (select (arr!48623 a!2804) j!70)))))

(declare-fun b!1511114 () Bool)

(declare-fun res!1031017 () Bool)

(assert (=> b!1511114 (=> (not res!1031017) (not e!843700))))

(assert (=> b!1511114 (= res!1031017 (validKeyInArray!0 (select (arr!48623 a!2804) i!961)))))

(assert (= (and start!128916 res!1031016) b!1511110))

(assert (= (and b!1511110 res!1031010) b!1511114))

(assert (= (and b!1511114 res!1031017) b!1511113))

(assert (= (and b!1511113 res!1031015) b!1511104))

(assert (= (and b!1511104 res!1031013) b!1511109))

(assert (= (and b!1511109 res!1031011) b!1511112))

(assert (= (and b!1511112 res!1031009) b!1511108))

(assert (= (and b!1511108 res!1031007) b!1511106))

(assert (= (and b!1511106 res!1031008) b!1511111))

(assert (= (and b!1511111 res!1031012) b!1511105))

(assert (= (and b!1511105 res!1031014) b!1511107))

(declare-fun m!1393765 () Bool)

(assert (=> b!1511104 m!1393765))

(declare-fun m!1393767 () Bool)

(assert (=> b!1511114 m!1393767))

(assert (=> b!1511114 m!1393767))

(declare-fun m!1393769 () Bool)

(assert (=> b!1511114 m!1393769))

(declare-fun m!1393771 () Bool)

(assert (=> b!1511107 m!1393771))

(assert (=> b!1511107 m!1393771))

(declare-fun m!1393773 () Bool)

(assert (=> b!1511107 m!1393773))

(assert (=> b!1511106 m!1393771))

(assert (=> b!1511106 m!1393771))

(declare-fun m!1393775 () Bool)

(assert (=> b!1511106 m!1393775))

(assert (=> b!1511113 m!1393771))

(assert (=> b!1511113 m!1393771))

(declare-fun m!1393777 () Bool)

(assert (=> b!1511113 m!1393777))

(assert (=> b!1511105 m!1393771))

(declare-fun m!1393779 () Bool)

(assert (=> b!1511105 m!1393779))

(declare-fun m!1393781 () Bool)

(assert (=> b!1511105 m!1393781))

(declare-fun m!1393783 () Bool)

(assert (=> b!1511105 m!1393783))

(declare-fun m!1393785 () Bool)

(assert (=> b!1511105 m!1393785))

(declare-fun m!1393787 () Bool)

(assert (=> b!1511105 m!1393787))

(declare-fun m!1393789 () Bool)

(assert (=> b!1511109 m!1393789))

(assert (=> b!1511108 m!1393771))

(assert (=> b!1511108 m!1393771))

(declare-fun m!1393791 () Bool)

(assert (=> b!1511108 m!1393791))

(assert (=> b!1511108 m!1393791))

(assert (=> b!1511108 m!1393771))

(declare-fun m!1393793 () Bool)

(assert (=> b!1511108 m!1393793))

(assert (=> b!1511111 m!1393781))

(assert (=> b!1511111 m!1393785))

(assert (=> b!1511111 m!1393785))

(declare-fun m!1393795 () Bool)

(assert (=> b!1511111 m!1393795))

(assert (=> b!1511111 m!1393795))

(assert (=> b!1511111 m!1393785))

(declare-fun m!1393797 () Bool)

(assert (=> b!1511111 m!1393797))

(declare-fun m!1393799 () Bool)

(assert (=> start!128916 m!1393799))

(declare-fun m!1393801 () Bool)

(assert (=> start!128916 m!1393801))

(push 1)

(assert (not b!1511104))

(assert (not b!1511106))

(assert (not b!1511114))

(assert (not b!1511109))

(assert (not b!1511108))

(assert (not start!128916))

(assert (not b!1511107))

(assert (not b!1511113))

(assert (not b!1511105))

(assert (not b!1511111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

