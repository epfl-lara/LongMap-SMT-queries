; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120946 () Bool)

(assert start!120946)

(declare-fun b!1406256 () Bool)

(declare-fun res!943789 () Bool)

(declare-fun e!796157 () Bool)

(assert (=> b!1406256 (=> (not res!943789) (not e!796157))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96175 0))(
  ( (array!96176 (arr!46433 (Array (_ BitVec 32) (_ BitVec 64))) (size!46984 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96175)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406256 (= res!943789 (and (= (size!46984 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46984 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46984 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!796156 () Bool)

(declare-fun b!1406257 () Bool)

(declare-datatypes ((SeekEntryResult!10647 0))(
  ( (MissingZero!10647 (index!44965 (_ BitVec 32))) (Found!10647 (index!44966 (_ BitVec 32))) (Intermediate!10647 (undefined!11459 Bool) (index!44967 (_ BitVec 32)) (x!126737 (_ BitVec 32))) (Undefined!10647) (MissingVacant!10647 (index!44968 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96175 (_ BitVec 32)) SeekEntryResult!10647)

(assert (=> b!1406257 (= e!796156 (= (seekEntryOrOpen!0 (select (arr!46433 a!2901) j!112) a!2901 mask!2840) (Found!10647 j!112)))))

(declare-fun b!1406258 () Bool)

(declare-fun res!943793 () Bool)

(assert (=> b!1406258 (=> (not res!943793) (not e!796157))))

(declare-datatypes ((List!32939 0))(
  ( (Nil!32936) (Cons!32935 (h!34197 (_ BitVec 64)) (t!47625 List!32939)) )
))
(declare-fun arrayNoDuplicates!0 (array!96175 (_ BitVec 32) List!32939) Bool)

(assert (=> b!1406258 (= res!943793 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32936))))

(declare-fun res!943790 () Bool)

(assert (=> start!120946 (=> (not res!943790) (not e!796157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120946 (= res!943790 (validMask!0 mask!2840))))

(assert (=> start!120946 e!796157))

(assert (=> start!120946 true))

(declare-fun array_inv!35714 (array!96175) Bool)

(assert (=> start!120946 (array_inv!35714 a!2901)))

(declare-fun b!1406259 () Bool)

(assert (=> b!1406259 (= e!796157 (not true))))

(assert (=> b!1406259 e!796156))

(declare-fun res!943792 () Bool)

(assert (=> b!1406259 (=> (not res!943792) (not e!796156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96175 (_ BitVec 32)) Bool)

(assert (=> b!1406259 (= res!943792 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47295 0))(
  ( (Unit!47296) )
))
(declare-fun lt!619333 () Unit!47295)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47295)

(assert (=> b!1406259 (= lt!619333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619334 () SeekEntryResult!10647)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96175 (_ BitVec 32)) SeekEntryResult!10647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406259 (= lt!619334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46433 a!2901) j!112) mask!2840) (select (arr!46433 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406260 () Bool)

(declare-fun res!943791 () Bool)

(assert (=> b!1406260 (=> (not res!943791) (not e!796157))))

(assert (=> b!1406260 (= res!943791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406261 () Bool)

(declare-fun res!943794 () Bool)

(assert (=> b!1406261 (=> (not res!943794) (not e!796157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406261 (= res!943794 (validKeyInArray!0 (select (arr!46433 a!2901) j!112)))))

(declare-fun b!1406262 () Bool)

(declare-fun res!943795 () Bool)

(assert (=> b!1406262 (=> (not res!943795) (not e!796157))))

(assert (=> b!1406262 (= res!943795 (validKeyInArray!0 (select (arr!46433 a!2901) i!1037)))))

(assert (= (and start!120946 res!943790) b!1406256))

(assert (= (and b!1406256 res!943789) b!1406262))

(assert (= (and b!1406262 res!943795) b!1406261))

(assert (= (and b!1406261 res!943794) b!1406260))

(assert (= (and b!1406260 res!943791) b!1406258))

(assert (= (and b!1406258 res!943793) b!1406259))

(assert (= (and b!1406259 res!943792) b!1406257))

(declare-fun m!1295193 () Bool)

(assert (=> b!1406262 m!1295193))

(assert (=> b!1406262 m!1295193))

(declare-fun m!1295195 () Bool)

(assert (=> b!1406262 m!1295195))

(declare-fun m!1295197 () Bool)

(assert (=> b!1406260 m!1295197))

(declare-fun m!1295199 () Bool)

(assert (=> b!1406258 m!1295199))

(declare-fun m!1295201 () Bool)

(assert (=> b!1406259 m!1295201))

(declare-fun m!1295203 () Bool)

(assert (=> b!1406259 m!1295203))

(assert (=> b!1406259 m!1295201))

(declare-fun m!1295205 () Bool)

(assert (=> b!1406259 m!1295205))

(assert (=> b!1406259 m!1295203))

(assert (=> b!1406259 m!1295201))

(declare-fun m!1295207 () Bool)

(assert (=> b!1406259 m!1295207))

(declare-fun m!1295209 () Bool)

(assert (=> b!1406259 m!1295209))

(assert (=> b!1406261 m!1295201))

(assert (=> b!1406261 m!1295201))

(declare-fun m!1295211 () Bool)

(assert (=> b!1406261 m!1295211))

(assert (=> b!1406257 m!1295201))

(assert (=> b!1406257 m!1295201))

(declare-fun m!1295213 () Bool)

(assert (=> b!1406257 m!1295213))

(declare-fun m!1295215 () Bool)

(assert (=> start!120946 m!1295215))

(declare-fun m!1295217 () Bool)

(assert (=> start!120946 m!1295217))

(push 1)

(assert (not b!1406258))

(assert (not start!120946))

(assert (not b!1406262))

(assert (not b!1406261))

(assert (not b!1406257))

(assert (not b!1406259))

(assert (not b!1406260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

