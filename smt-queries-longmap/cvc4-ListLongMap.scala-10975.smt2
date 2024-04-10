; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128518 () Bool)

(assert start!128518)

(declare-fun b!1506960 () Bool)

(declare-fun res!1027288 () Bool)

(declare-fun e!842055 () Bool)

(assert (=> b!1506960 (=> (not res!1027288) (not e!842055))))

(declare-datatypes ((array!100530 0))(
  ( (array!100531 (arr!48508 (Array (_ BitVec 32) (_ BitVec 64))) (size!49058 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100530)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506960 (= res!1027288 (validKeyInArray!0 (select (arr!48508 a!2804) j!70)))))

(declare-fun b!1506961 () Bool)

(declare-fun e!842056 () Bool)

(assert (=> b!1506961 (= e!842055 e!842056)))

(declare-fun res!1027285 () Bool)

(assert (=> b!1506961 (=> (not res!1027285) (not e!842056))))

(declare-datatypes ((SeekEntryResult!12679 0))(
  ( (MissingZero!12679 (index!53111 (_ BitVec 32))) (Found!12679 (index!53112 (_ BitVec 32))) (Intermediate!12679 (undefined!13491 Bool) (index!53113 (_ BitVec 32)) (x!134861 (_ BitVec 32))) (Undefined!12679) (MissingVacant!12679 (index!53114 (_ BitVec 32))) )
))
(declare-fun lt!654286 () SeekEntryResult!12679)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100530 (_ BitVec 32)) SeekEntryResult!12679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506961 (= res!1027285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48508 a!2804) j!70) mask!2512) (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654286))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506961 (= lt!654286 (Intermediate!12679 false resIndex!21 resX!21))))

(declare-fun b!1506962 () Bool)

(declare-fun res!1027290 () Bool)

(assert (=> b!1506962 (=> (not res!1027290) (not e!842055))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506962 (= res!1027290 (validKeyInArray!0 (select (arr!48508 a!2804) i!961)))))

(declare-fun res!1027291 () Bool)

(assert (=> start!128518 (=> (not res!1027291) (not e!842055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128518 (= res!1027291 (validMask!0 mask!2512))))

(assert (=> start!128518 e!842055))

(assert (=> start!128518 true))

(declare-fun array_inv!37536 (array!100530) Bool)

(assert (=> start!128518 (array_inv!37536 a!2804)))

(declare-fun b!1506963 () Bool)

(declare-fun res!1027287 () Bool)

(assert (=> b!1506963 (=> (not res!1027287) (not e!842055))))

(declare-datatypes ((List!34991 0))(
  ( (Nil!34988) (Cons!34987 (h!36387 (_ BitVec 64)) (t!49685 List!34991)) )
))
(declare-fun arrayNoDuplicates!0 (array!100530 (_ BitVec 32) List!34991) Bool)

(assert (=> b!1506963 (= res!1027287 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34988))))

(declare-fun b!1506964 () Bool)

(declare-fun res!1027289 () Bool)

(assert (=> b!1506964 (=> (not res!1027289) (not e!842055))))

(assert (=> b!1506964 (= res!1027289 (and (= (size!49058 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49058 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49058 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506965 () Bool)

(declare-fun res!1027284 () Bool)

(assert (=> b!1506965 (=> (not res!1027284) (not e!842056))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506965 (= res!1027284 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48508 a!2804) j!70) a!2804 mask!2512) lt!654286))))

(declare-fun b!1506966 () Bool)

(assert (=> b!1506966 (= e!842056 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506967 () Bool)

(declare-fun res!1027283 () Bool)

(assert (=> b!1506967 (=> (not res!1027283) (not e!842055))))

(assert (=> b!1506967 (= res!1027283 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49058 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49058 a!2804))))))

(declare-fun b!1506968 () Bool)

(declare-fun res!1027286 () Bool)

(assert (=> b!1506968 (=> (not res!1027286) (not e!842055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100530 (_ BitVec 32)) Bool)

(assert (=> b!1506968 (= res!1027286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128518 res!1027291) b!1506964))

(assert (= (and b!1506964 res!1027289) b!1506962))

(assert (= (and b!1506962 res!1027290) b!1506960))

(assert (= (and b!1506960 res!1027288) b!1506968))

(assert (= (and b!1506968 res!1027286) b!1506963))

(assert (= (and b!1506963 res!1027287) b!1506967))

(assert (= (and b!1506967 res!1027283) b!1506961))

(assert (= (and b!1506961 res!1027285) b!1506965))

(assert (= (and b!1506965 res!1027284) b!1506966))

(declare-fun m!1389843 () Bool)

(assert (=> b!1506962 m!1389843))

(assert (=> b!1506962 m!1389843))

(declare-fun m!1389845 () Bool)

(assert (=> b!1506962 m!1389845))

(declare-fun m!1389847 () Bool)

(assert (=> b!1506968 m!1389847))

(declare-fun m!1389849 () Bool)

(assert (=> b!1506965 m!1389849))

(assert (=> b!1506965 m!1389849))

(declare-fun m!1389851 () Bool)

(assert (=> b!1506965 m!1389851))

(assert (=> b!1506961 m!1389849))

(assert (=> b!1506961 m!1389849))

(declare-fun m!1389853 () Bool)

(assert (=> b!1506961 m!1389853))

(assert (=> b!1506961 m!1389853))

(assert (=> b!1506961 m!1389849))

(declare-fun m!1389855 () Bool)

(assert (=> b!1506961 m!1389855))

(declare-fun m!1389857 () Bool)

(assert (=> b!1506963 m!1389857))

(declare-fun m!1389859 () Bool)

(assert (=> start!128518 m!1389859))

(declare-fun m!1389861 () Bool)

(assert (=> start!128518 m!1389861))

(assert (=> b!1506960 m!1389849))

(assert (=> b!1506960 m!1389849))

(declare-fun m!1389863 () Bool)

(assert (=> b!1506960 m!1389863))

(push 1)

(assert (not b!1506963))

(assert (not b!1506960))

(assert (not b!1506968))

(assert (not b!1506965))

(assert (not b!1506961))

(assert (not b!1506962))

(assert (not start!128518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

