; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119888 () Bool)

(assert start!119888)

(declare-fun b!1395499 () Bool)

(declare-fun res!934229 () Bool)

(declare-fun e!790205 () Bool)

(assert (=> b!1395499 (=> (not res!934229) (not e!790205))))

(declare-datatypes ((array!95492 0))(
  ( (array!95493 (arr!46102 (Array (_ BitVec 32) (_ BitVec 64))) (size!46653 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95492)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395499 (= res!934229 (validKeyInArray!0 (select (arr!46102 a!2901) j!112)))))

(declare-fun b!1395500 () Bool)

(declare-fun res!934227 () Bool)

(assert (=> b!1395500 (=> (not res!934227) (not e!790205))))

(declare-datatypes ((List!32608 0))(
  ( (Nil!32605) (Cons!32604 (h!33845 (_ BitVec 64)) (t!47294 List!32608)) )
))
(declare-fun arrayNoDuplicates!0 (array!95492 (_ BitVec 32) List!32608) Bool)

(assert (=> b!1395500 (= res!934227 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32605))))

(declare-fun b!1395501 () Bool)

(declare-fun res!934223 () Bool)

(assert (=> b!1395501 (=> (not res!934223) (not e!790205))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395501 (= res!934223 (validKeyInArray!0 (select (arr!46102 a!2901) i!1037)))))

(declare-fun res!934230 () Bool)

(assert (=> start!119888 (=> (not res!934230) (not e!790205))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119888 (= res!934230 (validMask!0 mask!2840))))

(assert (=> start!119888 e!790205))

(assert (=> start!119888 true))

(declare-fun array_inv!35383 (array!95492) Bool)

(assert (=> start!119888 (array_inv!35383 a!2901)))

(declare-fun b!1395502 () Bool)

(declare-fun e!790208 () Bool)

(assert (=> b!1395502 (= e!790208 true)))

(declare-datatypes ((SeekEntryResult!10322 0))(
  ( (MissingZero!10322 (index!43659 (_ BitVec 32))) (Found!10322 (index!43660 (_ BitVec 32))) (Intermediate!10322 (undefined!11134 Bool) (index!43661 (_ BitVec 32)) (x!125481 (_ BitVec 32))) (Undefined!10322) (MissingVacant!10322 (index!43662 (_ BitVec 32))) )
))
(declare-fun lt!612806 () SeekEntryResult!10322)

(declare-fun lt!612811 () array!95492)

(declare-fun lt!612810 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95492 (_ BitVec 32)) SeekEntryResult!10322)

(assert (=> b!1395502 (= lt!612806 (seekEntryOrOpen!0 lt!612810 lt!612811 mask!2840))))

(declare-fun lt!612809 () SeekEntryResult!10322)

(declare-datatypes ((Unit!46675 0))(
  ( (Unit!46676) )
))
(declare-fun lt!612807 () Unit!46675)

(declare-fun lt!612808 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46675)

(assert (=> b!1395502 (= lt!612807 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612808 (x!125481 lt!612809) (index!43661 lt!612809) mask!2840))))

(declare-fun b!1395503 () Bool)

(declare-fun res!934226 () Bool)

(assert (=> b!1395503 (=> res!934226 e!790208)))

(assert (=> b!1395503 (= res!934226 (or (bvslt (x!125481 lt!612809) #b00000000000000000000000000000000) (bvsgt (x!125481 lt!612809) #b01111111111111111111111111111110) (bvslt lt!612808 #b00000000000000000000000000000000) (bvsge lt!612808 (size!46653 a!2901)) (bvslt (index!43661 lt!612809) #b00000000000000000000000000000000) (bvsge (index!43661 lt!612809) (size!46653 a!2901)) (not (= lt!612809 (Intermediate!10322 false (index!43661 lt!612809) (x!125481 lt!612809))))))))

(declare-fun b!1395504 () Bool)

(declare-fun res!934228 () Bool)

(assert (=> b!1395504 (=> (not res!934228) (not e!790205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95492 (_ BitVec 32)) Bool)

(assert (=> b!1395504 (= res!934228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395505 () Bool)

(declare-fun res!934231 () Bool)

(assert (=> b!1395505 (=> (not res!934231) (not e!790205))))

(assert (=> b!1395505 (= res!934231 (and (= (size!46653 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46653 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46653 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395506 () Bool)

(declare-fun e!790207 () Bool)

(assert (=> b!1395506 (= e!790207 e!790208)))

(declare-fun res!934225 () Bool)

(assert (=> b!1395506 (=> res!934225 e!790208)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95492 (_ BitVec 32)) SeekEntryResult!10322)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395506 (= res!934225 (not (= lt!612809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612810 mask!2840) lt!612810 lt!612811 mask!2840))))))

(assert (=> b!1395506 (= lt!612810 (select (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395506 (= lt!612811 (array!95493 (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46653 a!2901)))))

(declare-fun b!1395507 () Bool)

(assert (=> b!1395507 (= e!790205 (not e!790207))))

(declare-fun res!934224 () Bool)

(assert (=> b!1395507 (=> res!934224 e!790207)))

(get-info :version)

(assert (=> b!1395507 (= res!934224 (or (not ((_ is Intermediate!10322) lt!612809)) (undefined!11134 lt!612809)))))

(assert (=> b!1395507 (= lt!612806 (Found!10322 j!112))))

(assert (=> b!1395507 (= lt!612806 (seekEntryOrOpen!0 (select (arr!46102 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395507 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612812 () Unit!46675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46675)

(assert (=> b!1395507 (= lt!612812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395507 (= lt!612809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612808 (select (arr!46102 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395507 (= lt!612808 (toIndex!0 (select (arr!46102 a!2901) j!112) mask!2840))))

(assert (= (and start!119888 res!934230) b!1395505))

(assert (= (and b!1395505 res!934231) b!1395501))

(assert (= (and b!1395501 res!934223) b!1395499))

(assert (= (and b!1395499 res!934229) b!1395504))

(assert (= (and b!1395504 res!934228) b!1395500))

(assert (= (and b!1395500 res!934227) b!1395507))

(assert (= (and b!1395507 (not res!934224)) b!1395506))

(assert (= (and b!1395506 (not res!934225)) b!1395503))

(assert (= (and b!1395503 (not res!934226)) b!1395502))

(declare-fun m!1282021 () Bool)

(assert (=> b!1395500 m!1282021))

(declare-fun m!1282023 () Bool)

(assert (=> b!1395501 m!1282023))

(assert (=> b!1395501 m!1282023))

(declare-fun m!1282025 () Bool)

(assert (=> b!1395501 m!1282025))

(declare-fun m!1282027 () Bool)

(assert (=> b!1395507 m!1282027))

(declare-fun m!1282029 () Bool)

(assert (=> b!1395507 m!1282029))

(declare-fun m!1282031 () Bool)

(assert (=> b!1395507 m!1282031))

(assert (=> b!1395507 m!1282027))

(declare-fun m!1282033 () Bool)

(assert (=> b!1395507 m!1282033))

(declare-fun m!1282035 () Bool)

(assert (=> b!1395507 m!1282035))

(assert (=> b!1395507 m!1282027))

(declare-fun m!1282037 () Bool)

(assert (=> b!1395507 m!1282037))

(assert (=> b!1395507 m!1282027))

(declare-fun m!1282039 () Bool)

(assert (=> b!1395506 m!1282039))

(assert (=> b!1395506 m!1282039))

(declare-fun m!1282041 () Bool)

(assert (=> b!1395506 m!1282041))

(declare-fun m!1282043 () Bool)

(assert (=> b!1395506 m!1282043))

(declare-fun m!1282045 () Bool)

(assert (=> b!1395506 m!1282045))

(declare-fun m!1282047 () Bool)

(assert (=> b!1395504 m!1282047))

(assert (=> b!1395499 m!1282027))

(assert (=> b!1395499 m!1282027))

(declare-fun m!1282049 () Bool)

(assert (=> b!1395499 m!1282049))

(declare-fun m!1282051 () Bool)

(assert (=> start!119888 m!1282051))

(declare-fun m!1282053 () Bool)

(assert (=> start!119888 m!1282053))

(declare-fun m!1282055 () Bool)

(assert (=> b!1395502 m!1282055))

(declare-fun m!1282057 () Bool)

(assert (=> b!1395502 m!1282057))

(check-sat (not b!1395500) (not b!1395504) (not b!1395502) (not b!1395501) (not start!119888) (not b!1395506) (not b!1395507) (not b!1395499))
(check-sat)
