; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120034 () Bool)

(assert start!120034)

(declare-fun b!1397420 () Bool)

(declare-fun res!936340 () Bool)

(declare-fun e!791122 () Bool)

(assert (=> b!1397420 (=> (not res!936340) (not e!791122))))

(declare-datatypes ((array!95563 0))(
  ( (array!95564 (arr!46135 (Array (_ BitVec 32) (_ BitVec 64))) (size!46685 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95563)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397420 (= res!936340 (validKeyInArray!0 (select (arr!46135 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!791120 () Bool)

(declare-fun b!1397421 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10452 0))(
  ( (MissingZero!10452 (index!44179 (_ BitVec 32))) (Found!10452 (index!44180 (_ BitVec 32))) (Intermediate!10452 (undefined!11264 Bool) (index!44181 (_ BitVec 32)) (x!125834 (_ BitVec 32))) (Undefined!10452) (MissingVacant!10452 (index!44182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95563 (_ BitVec 32)) SeekEntryResult!10452)

(assert (=> b!1397421 (= e!791120 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) j!112) a!2901 mask!2840) (Found!10452 j!112)))))

(declare-fun b!1397422 () Bool)

(declare-fun res!936333 () Bool)

(assert (=> b!1397422 (=> (not res!936333) (not e!791122))))

(assert (=> b!1397422 (= res!936333 (validKeyInArray!0 (select (arr!46135 a!2901) j!112)))))

(declare-fun b!1397423 () Bool)

(declare-fun e!791121 () Bool)

(declare-fun e!791119 () Bool)

(assert (=> b!1397423 (= e!791121 e!791119)))

(declare-fun res!936332 () Bool)

(assert (=> b!1397423 (=> res!936332 e!791119)))

(declare-fun lt!614193 () SeekEntryResult!10452)

(declare-fun lt!614187 () SeekEntryResult!10452)

(declare-fun lt!614189 () (_ BitVec 32))

(assert (=> b!1397423 (= res!936332 (or (= lt!614193 lt!614187) (not (is-Intermediate!10452 lt!614187)) (bvslt (x!125834 lt!614193) #b00000000000000000000000000000000) (bvsgt (x!125834 lt!614193) #b01111111111111111111111111111110) (bvslt lt!614189 #b00000000000000000000000000000000) (bvsge lt!614189 (size!46685 a!2901)) (bvslt (index!44181 lt!614193) #b00000000000000000000000000000000) (bvsge (index!44181 lt!614193) (size!46685 a!2901)) (not (= lt!614193 (Intermediate!10452 false (index!44181 lt!614193) (x!125834 lt!614193)))) (not (= lt!614187 (Intermediate!10452 (undefined!11264 lt!614187) (index!44181 lt!614187) (x!125834 lt!614187))))))))

(declare-fun lt!614190 () array!95563)

(declare-fun lt!614192 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95563 (_ BitVec 32)) SeekEntryResult!10452)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397423 (= lt!614187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614192 mask!2840) lt!614192 lt!614190 mask!2840))))

(assert (=> b!1397423 (= lt!614192 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397423 (= lt!614190 (array!95564 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46685 a!2901)))))

(declare-fun b!1397424 () Bool)

(assert (=> b!1397424 (= e!791119 true)))

(declare-fun lt!614191 () SeekEntryResult!10452)

(assert (=> b!1397424 (= lt!614191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614189 lt!614192 lt!614190 mask!2840))))

(declare-fun b!1397425 () Bool)

(declare-fun res!936337 () Bool)

(assert (=> b!1397425 (=> (not res!936337) (not e!791122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95563 (_ BitVec 32)) Bool)

(assert (=> b!1397425 (= res!936337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936335 () Bool)

(assert (=> start!120034 (=> (not res!936335) (not e!791122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120034 (= res!936335 (validMask!0 mask!2840))))

(assert (=> start!120034 e!791122))

(assert (=> start!120034 true))

(declare-fun array_inv!35163 (array!95563) Bool)

(assert (=> start!120034 (array_inv!35163 a!2901)))

(declare-fun b!1397419 () Bool)

(declare-fun res!936338 () Bool)

(assert (=> b!1397419 (=> (not res!936338) (not e!791122))))

(declare-datatypes ((List!32654 0))(
  ( (Nil!32651) (Cons!32650 (h!33892 (_ BitVec 64)) (t!47348 List!32654)) )
))
(declare-fun arrayNoDuplicates!0 (array!95563 (_ BitVec 32) List!32654) Bool)

(assert (=> b!1397419 (= res!936338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32651))))

(declare-fun b!1397426 () Bool)

(declare-fun res!936336 () Bool)

(assert (=> b!1397426 (=> (not res!936336) (not e!791122))))

(assert (=> b!1397426 (= res!936336 (and (= (size!46685 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46685 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46685 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397427 () Bool)

(assert (=> b!1397427 (= e!791122 (not e!791121))))

(declare-fun res!936334 () Bool)

(assert (=> b!1397427 (=> res!936334 e!791121)))

(assert (=> b!1397427 (= res!936334 (or (not (is-Intermediate!10452 lt!614193)) (undefined!11264 lt!614193)))))

(assert (=> b!1397427 e!791120))

(declare-fun res!936339 () Bool)

(assert (=> b!1397427 (=> (not res!936339) (not e!791120))))

(assert (=> b!1397427 (= res!936339 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46908 0))(
  ( (Unit!46909) )
))
(declare-fun lt!614188 () Unit!46908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46908)

(assert (=> b!1397427 (= lt!614188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397427 (= lt!614193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614189 (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397427 (= lt!614189 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840))))

(assert (= (and start!120034 res!936335) b!1397426))

(assert (= (and b!1397426 res!936336) b!1397420))

(assert (= (and b!1397420 res!936340) b!1397422))

(assert (= (and b!1397422 res!936333) b!1397425))

(assert (= (and b!1397425 res!936337) b!1397419))

(assert (= (and b!1397419 res!936338) b!1397427))

(assert (= (and b!1397427 res!936339) b!1397421))

(assert (= (and b!1397427 (not res!936334)) b!1397423))

(assert (= (and b!1397423 (not res!936332)) b!1397424))

(declare-fun m!1284183 () Bool)

(assert (=> start!120034 m!1284183))

(declare-fun m!1284185 () Bool)

(assert (=> start!120034 m!1284185))

(declare-fun m!1284187 () Bool)

(assert (=> b!1397427 m!1284187))

(declare-fun m!1284189 () Bool)

(assert (=> b!1397427 m!1284189))

(assert (=> b!1397427 m!1284187))

(declare-fun m!1284191 () Bool)

(assert (=> b!1397427 m!1284191))

(assert (=> b!1397427 m!1284187))

(declare-fun m!1284193 () Bool)

(assert (=> b!1397427 m!1284193))

(declare-fun m!1284195 () Bool)

(assert (=> b!1397427 m!1284195))

(declare-fun m!1284197 () Bool)

(assert (=> b!1397423 m!1284197))

(assert (=> b!1397423 m!1284197))

(declare-fun m!1284199 () Bool)

(assert (=> b!1397423 m!1284199))

(declare-fun m!1284201 () Bool)

(assert (=> b!1397423 m!1284201))

(declare-fun m!1284203 () Bool)

(assert (=> b!1397423 m!1284203))

(declare-fun m!1284205 () Bool)

(assert (=> b!1397424 m!1284205))

(assert (=> b!1397421 m!1284187))

(assert (=> b!1397421 m!1284187))

(declare-fun m!1284207 () Bool)

(assert (=> b!1397421 m!1284207))

(declare-fun m!1284209 () Bool)

(assert (=> b!1397420 m!1284209))

(assert (=> b!1397420 m!1284209))

(declare-fun m!1284211 () Bool)

(assert (=> b!1397420 m!1284211))

(declare-fun m!1284213 () Bool)

(assert (=> b!1397419 m!1284213))

(assert (=> b!1397422 m!1284187))

(assert (=> b!1397422 m!1284187))

(declare-fun m!1284215 () Bool)

(assert (=> b!1397422 m!1284215))

(declare-fun m!1284217 () Bool)

(assert (=> b!1397425 m!1284217))

(push 1)

