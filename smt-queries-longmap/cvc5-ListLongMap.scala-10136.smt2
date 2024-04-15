; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119580 () Bool)

(assert start!119580)

(declare-fun b!1392867 () Bool)

(declare-fun e!788732 () Bool)

(declare-fun e!788733 () Bool)

(assert (=> b!1392867 (= e!788732 (not e!788733))))

(declare-fun res!932331 () Bool)

(assert (=> b!1392867 (=> res!932331 e!788733)))

(declare-datatypes ((SeekEntryResult!10309 0))(
  ( (MissingZero!10309 (index!43607 (_ BitVec 32))) (Found!10309 (index!43608 (_ BitVec 32))) (Intermediate!10309 (undefined!11121 Bool) (index!43609 (_ BitVec 32)) (x!125286 (_ BitVec 32))) (Undefined!10309) (MissingVacant!10309 (index!43610 (_ BitVec 32))) )
))
(declare-fun lt!611618 () SeekEntryResult!10309)

(assert (=> b!1392867 (= res!932331 (or (not (is-Intermediate!10309 lt!611618)) (undefined!11121 lt!611618)))))

(declare-fun e!788734 () Bool)

(assert (=> b!1392867 e!788734))

(declare-fun res!932326 () Bool)

(assert (=> b!1392867 (=> (not res!932326) (not e!788734))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95215 0))(
  ( (array!95216 (arr!45966 (Array (_ BitVec 32) (_ BitVec 64))) (size!46518 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95215)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95215 (_ BitVec 32)) Bool)

(assert (=> b!1392867 (= res!932326 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46465 0))(
  ( (Unit!46466) )
))
(declare-fun lt!611616 () Unit!46465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46465)

(assert (=> b!1392867 (= lt!611616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95215 (_ BitVec 32)) SeekEntryResult!10309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392867 (= lt!611618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45966 a!2901) j!112) mask!2840) (select (arr!45966 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392868 () Bool)

(declare-fun res!932325 () Bool)

(assert (=> b!1392868 (=> (not res!932325) (not e!788732))))

(assert (=> b!1392868 (= res!932325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392869 () Bool)

(declare-fun res!932328 () Bool)

(assert (=> b!1392869 (=> (not res!932328) (not e!788732))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392869 (= res!932328 (and (= (size!46518 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46518 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46518 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392870 () Bool)

(declare-fun res!932327 () Bool)

(assert (=> b!1392870 (=> (not res!932327) (not e!788732))))

(declare-datatypes ((List!32563 0))(
  ( (Nil!32560) (Cons!32559 (h!33792 (_ BitVec 64)) (t!47249 List!32563)) )
))
(declare-fun arrayNoDuplicates!0 (array!95215 (_ BitVec 32) List!32563) Bool)

(assert (=> b!1392870 (= res!932327 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32560))))

(declare-fun b!1392871 () Bool)

(declare-fun res!932332 () Bool)

(assert (=> b!1392871 (=> (not res!932332) (not e!788732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392871 (= res!932332 (validKeyInArray!0 (select (arr!45966 a!2901) i!1037)))))

(declare-fun b!1392872 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95215 (_ BitVec 32)) SeekEntryResult!10309)

(assert (=> b!1392872 (= e!788734 (= (seekEntryOrOpen!0 (select (arr!45966 a!2901) j!112) a!2901 mask!2840) (Found!10309 j!112)))))

(declare-fun b!1392873 () Bool)

(assert (=> b!1392873 (= e!788733 true)))

(declare-fun lt!611617 () SeekEntryResult!10309)

(assert (=> b!1392873 (= lt!611617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45966 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45966 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95216 (store (arr!45966 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46518 a!2901)) mask!2840))))

(declare-fun b!1392866 () Bool)

(declare-fun res!932330 () Bool)

(assert (=> b!1392866 (=> (not res!932330) (not e!788732))))

(assert (=> b!1392866 (= res!932330 (validKeyInArray!0 (select (arr!45966 a!2901) j!112)))))

(declare-fun res!932329 () Bool)

(assert (=> start!119580 (=> (not res!932329) (not e!788732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119580 (= res!932329 (validMask!0 mask!2840))))

(assert (=> start!119580 e!788732))

(assert (=> start!119580 true))

(declare-fun array_inv!35199 (array!95215) Bool)

(assert (=> start!119580 (array_inv!35199 a!2901)))

(assert (= (and start!119580 res!932329) b!1392869))

(assert (= (and b!1392869 res!932328) b!1392871))

(assert (= (and b!1392871 res!932332) b!1392866))

(assert (= (and b!1392866 res!932330) b!1392868))

(assert (= (and b!1392868 res!932325) b!1392870))

(assert (= (and b!1392870 res!932327) b!1392867))

(assert (= (and b!1392867 res!932326) b!1392872))

(assert (= (and b!1392867 (not res!932331)) b!1392873))

(declare-fun m!1278117 () Bool)

(assert (=> start!119580 m!1278117))

(declare-fun m!1278119 () Bool)

(assert (=> start!119580 m!1278119))

(declare-fun m!1278121 () Bool)

(assert (=> b!1392871 m!1278121))

(assert (=> b!1392871 m!1278121))

(declare-fun m!1278123 () Bool)

(assert (=> b!1392871 m!1278123))

(declare-fun m!1278125 () Bool)

(assert (=> b!1392873 m!1278125))

(declare-fun m!1278127 () Bool)

(assert (=> b!1392873 m!1278127))

(assert (=> b!1392873 m!1278127))

(declare-fun m!1278129 () Bool)

(assert (=> b!1392873 m!1278129))

(assert (=> b!1392873 m!1278129))

(assert (=> b!1392873 m!1278127))

(declare-fun m!1278131 () Bool)

(assert (=> b!1392873 m!1278131))

(declare-fun m!1278133 () Bool)

(assert (=> b!1392868 m!1278133))

(declare-fun m!1278135 () Bool)

(assert (=> b!1392867 m!1278135))

(declare-fun m!1278137 () Bool)

(assert (=> b!1392867 m!1278137))

(assert (=> b!1392867 m!1278135))

(declare-fun m!1278139 () Bool)

(assert (=> b!1392867 m!1278139))

(assert (=> b!1392867 m!1278137))

(assert (=> b!1392867 m!1278135))

(declare-fun m!1278141 () Bool)

(assert (=> b!1392867 m!1278141))

(declare-fun m!1278143 () Bool)

(assert (=> b!1392867 m!1278143))

(assert (=> b!1392872 m!1278135))

(assert (=> b!1392872 m!1278135))

(declare-fun m!1278145 () Bool)

(assert (=> b!1392872 m!1278145))

(declare-fun m!1278147 () Bool)

(assert (=> b!1392870 m!1278147))

(assert (=> b!1392866 m!1278135))

(assert (=> b!1392866 m!1278135))

(declare-fun m!1278149 () Bool)

(assert (=> b!1392866 m!1278149))

(push 1)

(assert (not b!1392866))

(assert (not b!1392872))

(assert (not b!1392868))

(assert (not b!1392873))

(assert (not start!119580))

(assert (not b!1392870))

(assert (not b!1392871))

(assert (not b!1392867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

