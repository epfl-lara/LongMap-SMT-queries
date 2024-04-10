; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122112 () Bool)

(assert start!122112)

(declare-fun b!1417022 () Bool)

(declare-fun res!952906 () Bool)

(declare-fun e!801981 () Bool)

(assert (=> b!1417022 (=> (not res!952906) (not e!801981))))

(declare-datatypes ((array!96747 0))(
  ( (array!96748 (arr!46703 (Array (_ BitVec 32) (_ BitVec 64))) (size!47253 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96747)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96747 (_ BitVec 32)) Bool)

(assert (=> b!1417022 (= res!952906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417023 () Bool)

(declare-fun e!801982 () Bool)

(assert (=> b!1417023 (= e!801982 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11014 0))(
  ( (MissingZero!11014 (index!46448 (_ BitVec 32))) (Found!11014 (index!46449 (_ BitVec 32))) (Intermediate!11014 (undefined!11826 Bool) (index!46450 (_ BitVec 32)) (x!128051 (_ BitVec 32))) (Undefined!11014) (MissingVacant!11014 (index!46451 (_ BitVec 32))) )
))
(declare-fun lt!625204 () SeekEntryResult!11014)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96747 (_ BitVec 32)) SeekEntryResult!11014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417023 (= lt!625204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46703 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46703 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96748 (store (arr!46703 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47253 a!2901)) mask!2840))))

(declare-fun b!1417024 () Bool)

(assert (=> b!1417024 (= e!801981 (not e!801982))))

(declare-fun res!952903 () Bool)

(assert (=> b!1417024 (=> res!952903 e!801982)))

(declare-fun lt!625205 () SeekEntryResult!11014)

(assert (=> b!1417024 (= res!952903 (or (not (is-Intermediate!11014 lt!625205)) (undefined!11826 lt!625205)))))

(declare-fun e!801980 () Bool)

(assert (=> b!1417024 e!801980))

(declare-fun res!952902 () Bool)

(assert (=> b!1417024 (=> (not res!952902) (not e!801980))))

(assert (=> b!1417024 (= res!952902 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48002 0))(
  ( (Unit!48003) )
))
(declare-fun lt!625206 () Unit!48002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48002)

(assert (=> b!1417024 (= lt!625206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417024 (= lt!625205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46703 a!2901) j!112) mask!2840) (select (arr!46703 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417026 () Bool)

(declare-fun res!952904 () Bool)

(assert (=> b!1417026 (=> (not res!952904) (not e!801981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417026 (= res!952904 (validKeyInArray!0 (select (arr!46703 a!2901) i!1037)))))

(declare-fun b!1417027 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96747 (_ BitVec 32)) SeekEntryResult!11014)

(assert (=> b!1417027 (= e!801980 (= (seekEntryOrOpen!0 (select (arr!46703 a!2901) j!112) a!2901 mask!2840) (Found!11014 j!112)))))

(declare-fun b!1417028 () Bool)

(declare-fun res!952899 () Bool)

(assert (=> b!1417028 (=> (not res!952899) (not e!801981))))

(assert (=> b!1417028 (= res!952899 (validKeyInArray!0 (select (arr!46703 a!2901) j!112)))))

(declare-fun b!1417029 () Bool)

(declare-fun res!952900 () Bool)

(assert (=> b!1417029 (=> (not res!952900) (not e!801981))))

(declare-datatypes ((List!33222 0))(
  ( (Nil!33219) (Cons!33218 (h!34508 (_ BitVec 64)) (t!47916 List!33222)) )
))
(declare-fun arrayNoDuplicates!0 (array!96747 (_ BitVec 32) List!33222) Bool)

(assert (=> b!1417029 (= res!952900 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33219))))

(declare-fun res!952905 () Bool)

(assert (=> start!122112 (=> (not res!952905) (not e!801981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122112 (= res!952905 (validMask!0 mask!2840))))

(assert (=> start!122112 e!801981))

(assert (=> start!122112 true))

(declare-fun array_inv!35731 (array!96747) Bool)

(assert (=> start!122112 (array_inv!35731 a!2901)))

(declare-fun b!1417025 () Bool)

(declare-fun res!952901 () Bool)

(assert (=> b!1417025 (=> (not res!952901) (not e!801981))))

(assert (=> b!1417025 (= res!952901 (and (= (size!47253 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47253 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47253 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122112 res!952905) b!1417025))

(assert (= (and b!1417025 res!952901) b!1417026))

(assert (= (and b!1417026 res!952904) b!1417028))

(assert (= (and b!1417028 res!952899) b!1417022))

(assert (= (and b!1417022 res!952906) b!1417029))

(assert (= (and b!1417029 res!952900) b!1417024))

(assert (= (and b!1417024 res!952902) b!1417027))

(assert (= (and b!1417024 (not res!952903)) b!1417023))

(declare-fun m!1307781 () Bool)

(assert (=> b!1417024 m!1307781))

(declare-fun m!1307783 () Bool)

(assert (=> b!1417024 m!1307783))

(assert (=> b!1417024 m!1307781))

(declare-fun m!1307785 () Bool)

(assert (=> b!1417024 m!1307785))

(assert (=> b!1417024 m!1307783))

(assert (=> b!1417024 m!1307781))

(declare-fun m!1307787 () Bool)

(assert (=> b!1417024 m!1307787))

(declare-fun m!1307789 () Bool)

(assert (=> b!1417024 m!1307789))

(declare-fun m!1307791 () Bool)

(assert (=> start!122112 m!1307791))

(declare-fun m!1307793 () Bool)

(assert (=> start!122112 m!1307793))

(assert (=> b!1417028 m!1307781))

(assert (=> b!1417028 m!1307781))

(declare-fun m!1307795 () Bool)

(assert (=> b!1417028 m!1307795))

(declare-fun m!1307797 () Bool)

(assert (=> b!1417029 m!1307797))

(declare-fun m!1307799 () Bool)

(assert (=> b!1417022 m!1307799))

(declare-fun m!1307801 () Bool)

(assert (=> b!1417023 m!1307801))

(declare-fun m!1307803 () Bool)

(assert (=> b!1417023 m!1307803))

(assert (=> b!1417023 m!1307803))

(declare-fun m!1307805 () Bool)

(assert (=> b!1417023 m!1307805))

(assert (=> b!1417023 m!1307805))

(assert (=> b!1417023 m!1307803))

(declare-fun m!1307807 () Bool)

(assert (=> b!1417023 m!1307807))

(assert (=> b!1417027 m!1307781))

(assert (=> b!1417027 m!1307781))

(declare-fun m!1307809 () Bool)

(assert (=> b!1417027 m!1307809))

(declare-fun m!1307811 () Bool)

(assert (=> b!1417026 m!1307811))

(assert (=> b!1417026 m!1307811))

(declare-fun m!1307813 () Bool)

(assert (=> b!1417026 m!1307813))

(push 1)

(assert (not b!1417029))

(assert (not b!1417027))

(assert (not b!1417028))

(assert (not b!1417024))

(assert (not b!1417022))

(assert (not start!122112))

(assert (not b!1417026))

(assert (not b!1417023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

