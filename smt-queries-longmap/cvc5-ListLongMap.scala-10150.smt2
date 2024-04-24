; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119856 () Bool)

(assert start!119856)

(declare-fun b!1395095 () Bool)

(declare-fun e!790013 () Bool)

(assert (=> b!1395095 (= e!790013 true)))

(declare-datatypes ((array!95460 0))(
  ( (array!95461 (arr!46086 (Array (_ BitVec 32) (_ BitVec 64))) (size!46637 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95460)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10306 0))(
  ( (MissingZero!10306 (index!43595 (_ BitVec 32))) (Found!10306 (index!43596 (_ BitVec 32))) (Intermediate!10306 (undefined!11118 Bool) (index!43597 (_ BitVec 32)) (x!125417 (_ BitVec 32))) (Undefined!10306) (MissingVacant!10306 (index!43598 (_ BitVec 32))) )
))
(declare-fun lt!612584 () SeekEntryResult!10306)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395095 (= lt!612584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95461 (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46637 a!2901)) mask!2840))))

(declare-fun b!1395096 () Bool)

(declare-fun res!933821 () Bool)

(declare-fun e!790014 () Bool)

(assert (=> b!1395096 (=> (not res!933821) (not e!790014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95460 (_ BitVec 32)) Bool)

(assert (=> b!1395096 (= res!933821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395097 () Bool)

(declare-fun res!933825 () Bool)

(assert (=> b!1395097 (=> (not res!933825) (not e!790014))))

(assert (=> b!1395097 (= res!933825 (and (= (size!46637 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46637 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46637 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933819 () Bool)

(assert (=> start!119856 (=> (not res!933819) (not e!790014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119856 (= res!933819 (validMask!0 mask!2840))))

(assert (=> start!119856 e!790014))

(assert (=> start!119856 true))

(declare-fun array_inv!35367 (array!95460) Bool)

(assert (=> start!119856 (array_inv!35367 a!2901)))

(declare-fun b!1395098 () Bool)

(assert (=> b!1395098 (= e!790014 (not e!790013))))

(declare-fun res!933824 () Bool)

(assert (=> b!1395098 (=> res!933824 e!790013)))

(declare-fun lt!612583 () SeekEntryResult!10306)

(assert (=> b!1395098 (= res!933824 (or (not (is-Intermediate!10306 lt!612583)) (undefined!11118 lt!612583)))))

(declare-fun e!790016 () Bool)

(assert (=> b!1395098 e!790016))

(declare-fun res!933826 () Bool)

(assert (=> b!1395098 (=> (not res!933826) (not e!790016))))

(assert (=> b!1395098 (= res!933826 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46643 0))(
  ( (Unit!46644) )
))
(declare-fun lt!612582 () Unit!46643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46643)

(assert (=> b!1395098 (= lt!612582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395098 (= lt!612583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46086 a!2901) j!112) mask!2840) (select (arr!46086 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395099 () Bool)

(declare-fun res!933822 () Bool)

(assert (=> b!1395099 (=> (not res!933822) (not e!790014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395099 (= res!933822 (validKeyInArray!0 (select (arr!46086 a!2901) i!1037)))))

(declare-fun b!1395100 () Bool)

(declare-fun res!933820 () Bool)

(assert (=> b!1395100 (=> (not res!933820) (not e!790014))))

(declare-datatypes ((List!32592 0))(
  ( (Nil!32589) (Cons!32588 (h!33829 (_ BitVec 64)) (t!47278 List!32592)) )
))
(declare-fun arrayNoDuplicates!0 (array!95460 (_ BitVec 32) List!32592) Bool)

(assert (=> b!1395100 (= res!933820 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32589))))

(declare-fun b!1395101 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10306)

(assert (=> b!1395101 (= e!790016 (= (seekEntryOrOpen!0 (select (arr!46086 a!2901) j!112) a!2901 mask!2840) (Found!10306 j!112)))))

(declare-fun b!1395102 () Bool)

(declare-fun res!933823 () Bool)

(assert (=> b!1395102 (=> (not res!933823) (not e!790014))))

(assert (=> b!1395102 (= res!933823 (validKeyInArray!0 (select (arr!46086 a!2901) j!112)))))

(assert (= (and start!119856 res!933819) b!1395097))

(assert (= (and b!1395097 res!933825) b!1395099))

(assert (= (and b!1395099 res!933822) b!1395102))

(assert (= (and b!1395102 res!933823) b!1395096))

(assert (= (and b!1395096 res!933821) b!1395100))

(assert (= (and b!1395100 res!933820) b!1395098))

(assert (= (and b!1395098 res!933826) b!1395101))

(assert (= (and b!1395098 (not res!933824)) b!1395095))

(declare-fun m!1281453 () Bool)

(assert (=> b!1395102 m!1281453))

(assert (=> b!1395102 m!1281453))

(declare-fun m!1281455 () Bool)

(assert (=> b!1395102 m!1281455))

(declare-fun m!1281457 () Bool)

(assert (=> b!1395099 m!1281457))

(assert (=> b!1395099 m!1281457))

(declare-fun m!1281459 () Bool)

(assert (=> b!1395099 m!1281459))

(declare-fun m!1281461 () Bool)

(assert (=> b!1395096 m!1281461))

(assert (=> b!1395098 m!1281453))

(declare-fun m!1281463 () Bool)

(assert (=> b!1395098 m!1281463))

(assert (=> b!1395098 m!1281453))

(declare-fun m!1281465 () Bool)

(assert (=> b!1395098 m!1281465))

(assert (=> b!1395098 m!1281463))

(assert (=> b!1395098 m!1281453))

(declare-fun m!1281467 () Bool)

(assert (=> b!1395098 m!1281467))

(declare-fun m!1281469 () Bool)

(assert (=> b!1395098 m!1281469))

(assert (=> b!1395101 m!1281453))

(assert (=> b!1395101 m!1281453))

(declare-fun m!1281471 () Bool)

(assert (=> b!1395101 m!1281471))

(declare-fun m!1281473 () Bool)

(assert (=> b!1395095 m!1281473))

(declare-fun m!1281475 () Bool)

(assert (=> b!1395095 m!1281475))

(assert (=> b!1395095 m!1281475))

(declare-fun m!1281477 () Bool)

(assert (=> b!1395095 m!1281477))

(assert (=> b!1395095 m!1281477))

(assert (=> b!1395095 m!1281475))

(declare-fun m!1281479 () Bool)

(assert (=> b!1395095 m!1281479))

(declare-fun m!1281481 () Bool)

(assert (=> start!119856 m!1281481))

(declare-fun m!1281483 () Bool)

(assert (=> start!119856 m!1281483))

(declare-fun m!1281485 () Bool)

(assert (=> b!1395100 m!1281485))

(push 1)

(assert (not b!1395098))

(assert (not start!119856))

(assert (not b!1395101))

(assert (not b!1395100))

(assert (not b!1395099))

(assert (not b!1395095))

(assert (not b!1395096))

(assert (not b!1395102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

