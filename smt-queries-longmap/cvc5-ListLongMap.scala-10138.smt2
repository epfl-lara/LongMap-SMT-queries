; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119592 () Bool)

(assert start!119592)

(declare-fun b!1393043 () Bool)

(declare-fun res!932457 () Bool)

(declare-fun e!788822 () Bool)

(assert (=> b!1393043 (=> (not res!932457) (not e!788822))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95274 0))(
  ( (array!95275 (arr!45995 (Array (_ BitVec 32) (_ BitVec 64))) (size!46545 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95274)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393043 (= res!932457 (and (= (size!46545 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46545 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46545 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!932453 () Bool)

(assert (=> start!119592 (=> (not res!932453) (not e!788822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119592 (= res!932453 (validMask!0 mask!2840))))

(assert (=> start!119592 e!788822))

(assert (=> start!119592 true))

(declare-fun array_inv!35023 (array!95274) Bool)

(assert (=> start!119592 (array_inv!35023 a!2901)))

(declare-fun b!1393044 () Bool)

(declare-fun res!932451 () Bool)

(assert (=> b!1393044 (=> (not res!932451) (not e!788822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393044 (= res!932451 (validKeyInArray!0 (select (arr!45995 a!2901) i!1037)))))

(declare-fun e!788821 () Bool)

(declare-fun b!1393045 () Bool)

(declare-datatypes ((SeekEntryResult!10312 0))(
  ( (MissingZero!10312 (index!43619 (_ BitVec 32))) (Found!10312 (index!43620 (_ BitVec 32))) (Intermediate!10312 (undefined!11124 Bool) (index!43621 (_ BitVec 32)) (x!125308 (_ BitVec 32))) (Undefined!10312) (MissingVacant!10312 (index!43622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95274 (_ BitVec 32)) SeekEntryResult!10312)

(assert (=> b!1393045 (= e!788821 (= (seekEntryOrOpen!0 (select (arr!45995 a!2901) j!112) a!2901 mask!2840) (Found!10312 j!112)))))

(declare-fun b!1393046 () Bool)

(declare-fun res!932456 () Bool)

(assert (=> b!1393046 (=> (not res!932456) (not e!788822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95274 (_ BitVec 32)) Bool)

(assert (=> b!1393046 (= res!932456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393047 () Bool)

(declare-fun res!932452 () Bool)

(assert (=> b!1393047 (=> (not res!932452) (not e!788822))))

(declare-datatypes ((List!32514 0))(
  ( (Nil!32511) (Cons!32510 (h!33743 (_ BitVec 64)) (t!47208 List!32514)) )
))
(declare-fun arrayNoDuplicates!0 (array!95274 (_ BitVec 32) List!32514) Bool)

(assert (=> b!1393047 (= res!932452 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32511))))

(declare-fun b!1393048 () Bool)

(declare-fun e!788819 () Bool)

(assert (=> b!1393048 (= e!788819 true)))

(declare-fun lt!611842 () SeekEntryResult!10312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95274 (_ BitVec 32)) SeekEntryResult!10312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393048 (= lt!611842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45995 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45995 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95275 (store (arr!45995 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46545 a!2901)) mask!2840))))

(declare-fun b!1393049 () Bool)

(declare-fun res!932455 () Bool)

(assert (=> b!1393049 (=> (not res!932455) (not e!788822))))

(assert (=> b!1393049 (= res!932455 (validKeyInArray!0 (select (arr!45995 a!2901) j!112)))))

(declare-fun b!1393050 () Bool)

(assert (=> b!1393050 (= e!788822 (not e!788819))))

(declare-fun res!932458 () Bool)

(assert (=> b!1393050 (=> res!932458 e!788819)))

(declare-fun lt!611843 () SeekEntryResult!10312)

(assert (=> b!1393050 (= res!932458 (or (not (is-Intermediate!10312 lt!611843)) (undefined!11124 lt!611843)))))

(assert (=> b!1393050 e!788821))

(declare-fun res!932454 () Bool)

(assert (=> b!1393050 (=> (not res!932454) (not e!788821))))

(assert (=> b!1393050 (= res!932454 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46628 0))(
  ( (Unit!46629) )
))
(declare-fun lt!611844 () Unit!46628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46628)

(assert (=> b!1393050 (= lt!611844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393050 (= lt!611843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45995 a!2901) j!112) mask!2840) (select (arr!45995 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119592 res!932453) b!1393043))

(assert (= (and b!1393043 res!932457) b!1393044))

(assert (= (and b!1393044 res!932451) b!1393049))

(assert (= (and b!1393049 res!932455) b!1393046))

(assert (= (and b!1393046 res!932456) b!1393047))

(assert (= (and b!1393047 res!932452) b!1393050))

(assert (= (and b!1393050 res!932454) b!1393045))

(assert (= (and b!1393050 (not res!932458)) b!1393048))

(declare-fun m!1278789 () Bool)

(assert (=> b!1393048 m!1278789))

(declare-fun m!1278791 () Bool)

(assert (=> b!1393048 m!1278791))

(assert (=> b!1393048 m!1278791))

(declare-fun m!1278793 () Bool)

(assert (=> b!1393048 m!1278793))

(assert (=> b!1393048 m!1278793))

(assert (=> b!1393048 m!1278791))

(declare-fun m!1278795 () Bool)

(assert (=> b!1393048 m!1278795))

(declare-fun m!1278797 () Bool)

(assert (=> b!1393047 m!1278797))

(declare-fun m!1278799 () Bool)

(assert (=> b!1393044 m!1278799))

(assert (=> b!1393044 m!1278799))

(declare-fun m!1278801 () Bool)

(assert (=> b!1393044 m!1278801))

(declare-fun m!1278803 () Bool)

(assert (=> b!1393050 m!1278803))

(declare-fun m!1278805 () Bool)

(assert (=> b!1393050 m!1278805))

(assert (=> b!1393050 m!1278803))

(declare-fun m!1278807 () Bool)

(assert (=> b!1393050 m!1278807))

(assert (=> b!1393050 m!1278805))

(assert (=> b!1393050 m!1278803))

(declare-fun m!1278809 () Bool)

(assert (=> b!1393050 m!1278809))

(declare-fun m!1278811 () Bool)

(assert (=> b!1393050 m!1278811))

(declare-fun m!1278813 () Bool)

(assert (=> b!1393046 m!1278813))

(assert (=> b!1393045 m!1278803))

(assert (=> b!1393045 m!1278803))

(declare-fun m!1278815 () Bool)

(assert (=> b!1393045 m!1278815))

(assert (=> b!1393049 m!1278803))

(assert (=> b!1393049 m!1278803))

(declare-fun m!1278817 () Bool)

(assert (=> b!1393049 m!1278817))

(declare-fun m!1278819 () Bool)

(assert (=> start!119592 m!1278819))

(declare-fun m!1278821 () Bool)

(assert (=> start!119592 m!1278821))

(push 1)

(assert (not start!119592))

(assert (not b!1393045))

(assert (not b!1393047))

(assert (not b!1393046))

(assert (not b!1393049))

(assert (not b!1393048))

(assert (not b!1393044))

(assert (not b!1393050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

