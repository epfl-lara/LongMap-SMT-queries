; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120012 () Bool)

(assert start!120012)

(declare-fun b!1397122 () Bool)

(declare-fun e!790958 () Bool)

(declare-fun e!790954 () Bool)

(assert (=> b!1397122 (= e!790958 e!790954)))

(declare-fun res!936036 () Bool)

(assert (=> b!1397122 (=> res!936036 e!790954)))

(declare-datatypes ((SeekEntryResult!10441 0))(
  ( (MissingZero!10441 (index!44135 (_ BitVec 32))) (Found!10441 (index!44136 (_ BitVec 32))) (Intermediate!10441 (undefined!11253 Bool) (index!44137 (_ BitVec 32)) (x!125799 (_ BitVec 32))) (Undefined!10441) (MissingVacant!10441 (index!44138 (_ BitVec 32))) )
))
(declare-fun lt!613960 () SeekEntryResult!10441)

(declare-fun lt!613956 () SeekEntryResult!10441)

(declare-fun lt!613959 () (_ BitVec 32))

(declare-datatypes ((array!95541 0))(
  ( (array!95542 (arr!46124 (Array (_ BitVec 32) (_ BitVec 64))) (size!46674 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95541)

(assert (=> b!1397122 (= res!936036 (or (= lt!613956 lt!613960) (not (is-Intermediate!10441 lt!613960)) (bvslt (x!125799 lt!613956) #b00000000000000000000000000000000) (bvsgt (x!125799 lt!613956) #b01111111111111111111111111111110) (bvslt lt!613959 #b00000000000000000000000000000000) (bvsge lt!613959 (size!46674 a!2901)) (bvslt (index!44137 lt!613956) #b00000000000000000000000000000000) (bvsge (index!44137 lt!613956) (size!46674 a!2901)) (not (= lt!613956 (Intermediate!10441 false (index!44137 lt!613956) (x!125799 lt!613956)))) (not (= lt!613960 (Intermediate!10441 (undefined!11253 lt!613960) (index!44137 lt!613960) (x!125799 lt!613960))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613961 () (_ BitVec 64))

(declare-fun lt!613962 () array!95541)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95541 (_ BitVec 32)) SeekEntryResult!10441)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397122 (= lt!613960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613961 mask!2840) lt!613961 lt!613962 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397122 (= lt!613961 (select (store (arr!46124 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397122 (= lt!613962 (array!95542 (store (arr!46124 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)))))

(declare-fun b!1397123 () Bool)

(declare-fun e!790957 () Bool)

(assert (=> b!1397123 (= e!790957 (not e!790958))))

(declare-fun res!936041 () Bool)

(assert (=> b!1397123 (=> res!936041 e!790958)))

(assert (=> b!1397123 (= res!936041 (or (not (is-Intermediate!10441 lt!613956)) (undefined!11253 lt!613956)))))

(declare-fun e!790955 () Bool)

(assert (=> b!1397123 e!790955))

(declare-fun res!936040 () Bool)

(assert (=> b!1397123 (=> (not res!936040) (not e!790955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95541 (_ BitVec 32)) Bool)

(assert (=> b!1397123 (= res!936040 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46886 0))(
  ( (Unit!46887) )
))
(declare-fun lt!613957 () Unit!46886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46886)

(assert (=> b!1397123 (= lt!613957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397123 (= lt!613956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613959 (select (arr!46124 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397123 (= lt!613959 (toIndex!0 (select (arr!46124 a!2901) j!112) mask!2840))))

(declare-fun res!936037 () Bool)

(assert (=> start!120012 (=> (not res!936037) (not e!790957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120012 (= res!936037 (validMask!0 mask!2840))))

(assert (=> start!120012 e!790957))

(assert (=> start!120012 true))

(declare-fun array_inv!35152 (array!95541) Bool)

(assert (=> start!120012 (array_inv!35152 a!2901)))

(declare-fun b!1397124 () Bool)

(declare-fun res!936039 () Bool)

(assert (=> b!1397124 (=> (not res!936039) (not e!790957))))

(declare-datatypes ((List!32643 0))(
  ( (Nil!32640) (Cons!32639 (h!33881 (_ BitVec 64)) (t!47337 List!32643)) )
))
(declare-fun arrayNoDuplicates!0 (array!95541 (_ BitVec 32) List!32643) Bool)

(assert (=> b!1397124 (= res!936039 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32640))))

(declare-fun b!1397125 () Bool)

(declare-fun res!936035 () Bool)

(assert (=> b!1397125 (=> (not res!936035) (not e!790957))))

(assert (=> b!1397125 (= res!936035 (and (= (size!46674 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46674 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46674 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397126 () Bool)

(assert (=> b!1397126 (= e!790954 true)))

(declare-fun lt!613958 () SeekEntryResult!10441)

(assert (=> b!1397126 (= lt!613958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613959 lt!613961 lt!613962 mask!2840))))

(declare-fun b!1397127 () Bool)

(declare-fun res!936042 () Bool)

(assert (=> b!1397127 (=> (not res!936042) (not e!790957))))

(assert (=> b!1397127 (= res!936042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397128 () Bool)

(declare-fun res!936038 () Bool)

(assert (=> b!1397128 (=> (not res!936038) (not e!790957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397128 (= res!936038 (validKeyInArray!0 (select (arr!46124 a!2901) j!112)))))

(declare-fun b!1397129 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95541 (_ BitVec 32)) SeekEntryResult!10441)

(assert (=> b!1397129 (= e!790955 (= (seekEntryOrOpen!0 (select (arr!46124 a!2901) j!112) a!2901 mask!2840) (Found!10441 j!112)))))

(declare-fun b!1397130 () Bool)

(declare-fun res!936043 () Bool)

(assert (=> b!1397130 (=> (not res!936043) (not e!790957))))

(assert (=> b!1397130 (= res!936043 (validKeyInArray!0 (select (arr!46124 a!2901) i!1037)))))

(assert (= (and start!120012 res!936037) b!1397125))

(assert (= (and b!1397125 res!936035) b!1397130))

(assert (= (and b!1397130 res!936043) b!1397128))

(assert (= (and b!1397128 res!936038) b!1397127))

(assert (= (and b!1397127 res!936042) b!1397124))

(assert (= (and b!1397124 res!936039) b!1397123))

(assert (= (and b!1397123 res!936040) b!1397129))

(assert (= (and b!1397123 (not res!936041)) b!1397122))

(assert (= (and b!1397122 (not res!936036)) b!1397126))

(declare-fun m!1283787 () Bool)

(assert (=> b!1397124 m!1283787))

(declare-fun m!1283789 () Bool)

(assert (=> b!1397126 m!1283789))

(declare-fun m!1283791 () Bool)

(assert (=> start!120012 m!1283791))

(declare-fun m!1283793 () Bool)

(assert (=> start!120012 m!1283793))

(declare-fun m!1283795 () Bool)

(assert (=> b!1397130 m!1283795))

(assert (=> b!1397130 m!1283795))

(declare-fun m!1283797 () Bool)

(assert (=> b!1397130 m!1283797))

(declare-fun m!1283799 () Bool)

(assert (=> b!1397128 m!1283799))

(assert (=> b!1397128 m!1283799))

(declare-fun m!1283801 () Bool)

(assert (=> b!1397128 m!1283801))

(assert (=> b!1397129 m!1283799))

(assert (=> b!1397129 m!1283799))

(declare-fun m!1283803 () Bool)

(assert (=> b!1397129 m!1283803))

(assert (=> b!1397123 m!1283799))

(declare-fun m!1283805 () Bool)

(assert (=> b!1397123 m!1283805))

(assert (=> b!1397123 m!1283799))

(declare-fun m!1283807 () Bool)

(assert (=> b!1397123 m!1283807))

(assert (=> b!1397123 m!1283799))

(declare-fun m!1283809 () Bool)

(assert (=> b!1397123 m!1283809))

(declare-fun m!1283811 () Bool)

(assert (=> b!1397123 m!1283811))

(declare-fun m!1283813 () Bool)

(assert (=> b!1397127 m!1283813))

(declare-fun m!1283815 () Bool)

(assert (=> b!1397122 m!1283815))

(assert (=> b!1397122 m!1283815))

(declare-fun m!1283817 () Bool)

(assert (=> b!1397122 m!1283817))

(declare-fun m!1283819 () Bool)

(assert (=> b!1397122 m!1283819))

(declare-fun m!1283821 () Bool)

(assert (=> b!1397122 m!1283821))

(push 1)

