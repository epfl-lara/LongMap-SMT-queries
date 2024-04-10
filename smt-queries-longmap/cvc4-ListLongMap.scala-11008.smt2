; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128884 () Bool)

(assert start!128884)

(declare-fun b!1510576 () Bool)

(declare-fun res!1030479 () Bool)

(declare-fun e!843510 () Bool)

(assert (=> b!1510576 (=> (not res!1030479) (not e!843510))))

(declare-datatypes ((array!100740 0))(
  ( (array!100741 (arr!48607 (Array (_ BitVec 32) (_ BitVec 64))) (size!49157 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100740)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100740 (_ BitVec 32)) Bool)

(assert (=> b!1510576 (= res!1030479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510577 () Bool)

(declare-fun res!1030483 () Bool)

(declare-fun e!843511 () Bool)

(assert (=> b!1510577 (=> (not res!1030483) (not e!843511))))

(declare-datatypes ((SeekEntryResult!12778 0))(
  ( (MissingZero!12778 (index!53507 (_ BitVec 32))) (Found!12778 (index!53508 (_ BitVec 32))) (Intermediate!12778 (undefined!13590 Bool) (index!53509 (_ BitVec 32)) (x!135248 (_ BitVec 32))) (Undefined!12778) (MissingVacant!12778 (index!53510 (_ BitVec 32))) )
))
(declare-fun lt!655206 () SeekEntryResult!12778)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100740 (_ BitVec 32)) SeekEntryResult!12778)

(assert (=> b!1510577 (= res!1030483 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48607 a!2804) j!70) a!2804 mask!2512) lt!655206))))

(declare-fun b!1510578 () Bool)

(declare-fun res!1030486 () Bool)

(assert (=> b!1510578 (=> (not res!1030486) (not e!843510))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510578 (= res!1030486 (validKeyInArray!0 (select (arr!48607 a!2804) i!961)))))

(declare-fun res!1030487 () Bool)

(assert (=> start!128884 (=> (not res!1030487) (not e!843510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128884 (= res!1030487 (validMask!0 mask!2512))))

(assert (=> start!128884 e!843510))

(assert (=> start!128884 true))

(declare-fun array_inv!37635 (array!100740) Bool)

(assert (=> start!128884 (array_inv!37635 a!2804)))

(declare-fun b!1510579 () Bool)

(declare-fun e!843509 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100740 (_ BitVec 32)) SeekEntryResult!12778)

(assert (=> b!1510579 (= e!843509 (= (seekEntry!0 (select (arr!48607 a!2804) j!70) a!2804 mask!2512) (Found!12778 j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1510580 () Bool)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510580 (= e!843511 (not (or (not (= (select (arr!48607 a!2804) j!70) (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48607 a!2804) index!487) (select (arr!48607 a!2804) j!70)) (not (= (select (arr!48607 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510580 e!843509))

(declare-fun res!1030481 () Bool)

(assert (=> b!1510580 (=> (not res!1030481) (not e!843509))))

(assert (=> b!1510580 (= res!1030481 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50424 0))(
  ( (Unit!50425) )
))
(declare-fun lt!655207 () Unit!50424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50424)

(assert (=> b!1510580 (= lt!655207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510581 () Bool)

(declare-fun res!1030484 () Bool)

(assert (=> b!1510581 (=> (not res!1030484) (not e!843511))))

(declare-fun lt!655205 () SeekEntryResult!12778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510581 (= res!1030484 (= lt!655205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100741 (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49157 a!2804)) mask!2512)))))

(declare-fun b!1510582 () Bool)

(declare-fun res!1030488 () Bool)

(assert (=> b!1510582 (=> (not res!1030488) (not e!843510))))

(assert (=> b!1510582 (= res!1030488 (and (= (size!49157 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49157 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49157 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510583 () Bool)

(declare-fun res!1030482 () Bool)

(assert (=> b!1510583 (=> (not res!1030482) (not e!843510))))

(assert (=> b!1510583 (= res!1030482 (validKeyInArray!0 (select (arr!48607 a!2804) j!70)))))

(declare-fun b!1510584 () Bool)

(assert (=> b!1510584 (= e!843510 e!843511)))

(declare-fun res!1030480 () Bool)

(assert (=> b!1510584 (=> (not res!1030480) (not e!843511))))

(assert (=> b!1510584 (= res!1030480 (= lt!655205 lt!655206))))

(assert (=> b!1510584 (= lt!655206 (Intermediate!12778 false resIndex!21 resX!21))))

(assert (=> b!1510584 (= lt!655205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48607 a!2804) j!70) mask!2512) (select (arr!48607 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510585 () Bool)

(declare-fun res!1030489 () Bool)

(assert (=> b!1510585 (=> (not res!1030489) (not e!843510))))

(assert (=> b!1510585 (= res!1030489 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49157 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49157 a!2804))))))

(declare-fun b!1510586 () Bool)

(declare-fun res!1030485 () Bool)

(assert (=> b!1510586 (=> (not res!1030485) (not e!843510))))

(declare-datatypes ((List!35090 0))(
  ( (Nil!35087) (Cons!35086 (h!36498 (_ BitVec 64)) (t!49784 List!35090)) )
))
(declare-fun arrayNoDuplicates!0 (array!100740 (_ BitVec 32) List!35090) Bool)

(assert (=> b!1510586 (= res!1030485 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35087))))

(assert (= (and start!128884 res!1030487) b!1510582))

(assert (= (and b!1510582 res!1030488) b!1510578))

(assert (= (and b!1510578 res!1030486) b!1510583))

(assert (= (and b!1510583 res!1030482) b!1510576))

(assert (= (and b!1510576 res!1030479) b!1510586))

(assert (= (and b!1510586 res!1030485) b!1510585))

(assert (= (and b!1510585 res!1030489) b!1510584))

(assert (= (and b!1510584 res!1030480) b!1510577))

(assert (= (and b!1510577 res!1030483) b!1510581))

(assert (= (and b!1510581 res!1030484) b!1510580))

(assert (= (and b!1510580 res!1030481) b!1510579))

(declare-fun m!1393181 () Bool)

(assert (=> b!1510581 m!1393181))

(declare-fun m!1393183 () Bool)

(assert (=> b!1510581 m!1393183))

(assert (=> b!1510581 m!1393183))

(declare-fun m!1393185 () Bool)

(assert (=> b!1510581 m!1393185))

(assert (=> b!1510581 m!1393185))

(assert (=> b!1510581 m!1393183))

(declare-fun m!1393187 () Bool)

(assert (=> b!1510581 m!1393187))

(declare-fun m!1393189 () Bool)

(assert (=> b!1510580 m!1393189))

(declare-fun m!1393191 () Bool)

(assert (=> b!1510580 m!1393191))

(assert (=> b!1510580 m!1393181))

(declare-fun m!1393193 () Bool)

(assert (=> b!1510580 m!1393193))

(assert (=> b!1510580 m!1393183))

(declare-fun m!1393195 () Bool)

(assert (=> b!1510580 m!1393195))

(declare-fun m!1393197 () Bool)

(assert (=> b!1510586 m!1393197))

(assert (=> b!1510583 m!1393189))

(assert (=> b!1510583 m!1393189))

(declare-fun m!1393199 () Bool)

(assert (=> b!1510583 m!1393199))

(assert (=> b!1510577 m!1393189))

(assert (=> b!1510577 m!1393189))

(declare-fun m!1393201 () Bool)

(assert (=> b!1510577 m!1393201))

(assert (=> b!1510584 m!1393189))

(assert (=> b!1510584 m!1393189))

(declare-fun m!1393203 () Bool)

(assert (=> b!1510584 m!1393203))

(assert (=> b!1510584 m!1393203))

(assert (=> b!1510584 m!1393189))

(declare-fun m!1393205 () Bool)

(assert (=> b!1510584 m!1393205))

(declare-fun m!1393207 () Bool)

(assert (=> b!1510576 m!1393207))

(declare-fun m!1393209 () Bool)

(assert (=> start!128884 m!1393209))

(declare-fun m!1393211 () Bool)

(assert (=> start!128884 m!1393211))

(assert (=> b!1510579 m!1393189))

(assert (=> b!1510579 m!1393189))

(declare-fun m!1393213 () Bool)

(assert (=> b!1510579 m!1393213))

(declare-fun m!1393215 () Bool)

(assert (=> b!1510578 m!1393215))

(assert (=> b!1510578 m!1393215))

(declare-fun m!1393217 () Bool)

(assert (=> b!1510578 m!1393217))

(push 1)

(assert (not b!1510577))

(assert (not b!1510579))

(assert (not b!1510580))

(assert (not b!1510576))

(assert (not b!1510581))

(assert (not b!1510583))

(assert (not b!1510578))

(assert (not b!1510584))

(assert (not start!128884))

(assert (not b!1510586))

(check-sat)

