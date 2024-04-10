; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119158 () Bool)

(assert start!119158)

(declare-fun b!1390035 () Bool)

(declare-fun res!930201 () Bool)

(declare-fun e!787246 () Bool)

(assert (=> b!1390035 (=> (not res!930201) (not e!787246))))

(declare-datatypes ((array!95095 0))(
  ( (array!95096 (arr!45913 (Array (_ BitVec 32) (_ BitVec 64))) (size!46463 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95095)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390035 (= res!930201 (validKeyInArray!0 (select (arr!45913 a!2901) i!1037)))))

(declare-fun b!1390036 () Bool)

(declare-fun res!930199 () Bool)

(assert (=> b!1390036 (=> (not res!930199) (not e!787246))))

(declare-datatypes ((List!32432 0))(
  ( (Nil!32429) (Cons!32428 (h!33646 (_ BitVec 64)) (t!47126 List!32432)) )
))
(declare-fun arrayNoDuplicates!0 (array!95095 (_ BitVec 32) List!32432) Bool)

(assert (=> b!1390036 (= res!930199 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32429))))

(declare-fun b!1390037 () Bool)

(declare-fun res!930196 () Bool)

(assert (=> b!1390037 (=> (not res!930196) (not e!787246))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390037 (= res!930196 (and (= (size!46463 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46463 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46463 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390038 () Bool)

(declare-fun res!930202 () Bool)

(assert (=> b!1390038 (=> (not res!930202) (not e!787246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95095 (_ BitVec 32)) Bool)

(assert (=> b!1390038 (= res!930202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930200 () Bool)

(assert (=> start!119158 (=> (not res!930200) (not e!787246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119158 (= res!930200 (validMask!0 mask!2840))))

(assert (=> start!119158 e!787246))

(assert (=> start!119158 true))

(declare-fun array_inv!34941 (array!95095) Bool)

(assert (=> start!119158 (array_inv!34941 a!2901)))

(declare-fun b!1390039 () Bool)

(declare-fun e!787245 () Bool)

(declare-datatypes ((SeekEntryResult!10230 0))(
  ( (MissingZero!10230 (index!43291 (_ BitVec 32))) (Found!10230 (index!43292 (_ BitVec 32))) (Intermediate!10230 (undefined!11042 Bool) (index!43293 (_ BitVec 32)) (x!124972 (_ BitVec 32))) (Undefined!10230) (MissingVacant!10230 (index!43294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95095 (_ BitVec 32)) SeekEntryResult!10230)

(assert (=> b!1390039 (= e!787245 (= (seekEntryOrOpen!0 (select (arr!45913 a!2901) j!112) a!2901 mask!2840) (Found!10230 j!112)))))

(declare-fun b!1390040 () Bool)

(declare-fun res!930198 () Bool)

(assert (=> b!1390040 (=> (not res!930198) (not e!787246))))

(assert (=> b!1390040 (= res!930198 (validKeyInArray!0 (select (arr!45913 a!2901) j!112)))))

(declare-fun b!1390041 () Bool)

(assert (=> b!1390041 (= e!787246 (not true))))

(assert (=> b!1390041 e!787245))

(declare-fun res!930197 () Bool)

(assert (=> b!1390041 (=> (not res!930197) (not e!787245))))

(assert (=> b!1390041 (= res!930197 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46464 0))(
  ( (Unit!46465) )
))
(declare-fun lt!610710 () Unit!46464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46464)

(assert (=> b!1390041 (= lt!610710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610709 () SeekEntryResult!10230)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95095 (_ BitVec 32)) SeekEntryResult!10230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390041 (= lt!610709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45913 a!2901) j!112) mask!2840) (select (arr!45913 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119158 res!930200) b!1390037))

(assert (= (and b!1390037 res!930196) b!1390035))

(assert (= (and b!1390035 res!930201) b!1390040))

(assert (= (and b!1390040 res!930198) b!1390038))

(assert (= (and b!1390038 res!930202) b!1390036))

(assert (= (and b!1390036 res!930199) b!1390041))

(assert (= (and b!1390041 res!930197) b!1390039))

(declare-fun m!1275787 () Bool)

(assert (=> b!1390036 m!1275787))

(declare-fun m!1275789 () Bool)

(assert (=> b!1390040 m!1275789))

(assert (=> b!1390040 m!1275789))

(declare-fun m!1275791 () Bool)

(assert (=> b!1390040 m!1275791))

(declare-fun m!1275793 () Bool)

(assert (=> b!1390038 m!1275793))

(declare-fun m!1275795 () Bool)

(assert (=> b!1390035 m!1275795))

(assert (=> b!1390035 m!1275795))

(declare-fun m!1275797 () Bool)

(assert (=> b!1390035 m!1275797))

(assert (=> b!1390041 m!1275789))

(declare-fun m!1275799 () Bool)

(assert (=> b!1390041 m!1275799))

(assert (=> b!1390041 m!1275789))

(declare-fun m!1275801 () Bool)

(assert (=> b!1390041 m!1275801))

(assert (=> b!1390041 m!1275799))

(assert (=> b!1390041 m!1275789))

(declare-fun m!1275803 () Bool)

(assert (=> b!1390041 m!1275803))

(declare-fun m!1275805 () Bool)

(assert (=> b!1390041 m!1275805))

(assert (=> b!1390039 m!1275789))

(assert (=> b!1390039 m!1275789))

(declare-fun m!1275807 () Bool)

(assert (=> b!1390039 m!1275807))

(declare-fun m!1275809 () Bool)

(assert (=> start!119158 m!1275809))

(declare-fun m!1275811 () Bool)

(assert (=> start!119158 m!1275811))

(push 1)

(assert (not b!1390035))

(assert (not b!1390040))

(assert (not b!1390039))

(assert (not start!119158))

(assert (not b!1390036))

(assert (not b!1390038))

(assert (not b!1390041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

