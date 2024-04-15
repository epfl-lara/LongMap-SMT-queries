; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129542 () Bool)

(assert start!129542)

(declare-fun res!1040433 () Bool)

(declare-fun e!848289 () Bool)

(assert (=> start!129542 (=> (not res!1040433) (not e!848289))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129542 (= res!1040433 (validMask!0 mask!2512))))

(assert (=> start!129542 e!848289))

(assert (=> start!129542 true))

(declare-datatypes ((array!101217 0))(
  ( (array!101218 (arr!48842 (Array (_ BitVec 32) (_ BitVec 64))) (size!49394 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101217)

(declare-fun array_inv!38075 (array!101217) Bool)

(assert (=> start!129542 (array_inv!38075 a!2804)))

(declare-fun b!1521000 () Bool)

(declare-fun res!1040430 () Bool)

(assert (=> b!1521000 (=> (not res!1040430) (not e!848289))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13030 0))(
  ( (MissingZero!13030 (index!54515 (_ BitVec 32))) (Found!13030 (index!54516 (_ BitVec 32))) (Intermediate!13030 (undefined!13842 Bool) (index!54517 (_ BitVec 32)) (x!136212 (_ BitVec 32))) (Undefined!13030) (MissingVacant!13030 (index!54518 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101217 (_ BitVec 32)) SeekEntryResult!13030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521000 (= res!1040430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48842 a!2804) j!70) mask!2512) (select (arr!48842 a!2804) j!70) a!2804 mask!2512) (Intermediate!13030 false resIndex!21 resX!21)))))

(declare-fun b!1521001 () Bool)

(declare-fun res!1040429 () Bool)

(assert (=> b!1521001 (=> (not res!1040429) (not e!848289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101217 (_ BitVec 32)) Bool)

(assert (=> b!1521001 (= res!1040429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521002 () Bool)

(declare-fun res!1040431 () Bool)

(assert (=> b!1521002 (=> (not res!1040431) (not e!848289))))

(declare-datatypes ((List!35403 0))(
  ( (Nil!35400) (Cons!35399 (h!36821 (_ BitVec 64)) (t!50089 List!35403)) )
))
(declare-fun arrayNoDuplicates!0 (array!101217 (_ BitVec 32) List!35403) Bool)

(assert (=> b!1521002 (= res!1040431 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35400))))

(declare-fun b!1521003 () Bool)

(declare-fun res!1040432 () Bool)

(assert (=> b!1521003 (=> (not res!1040432) (not e!848289))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521003 (= res!1040432 (and (= (size!49394 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49394 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49394 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521004 () Bool)

(declare-fun res!1040434 () Bool)

(assert (=> b!1521004 (=> (not res!1040434) (not e!848289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521004 (= res!1040434 (validKeyInArray!0 (select (arr!48842 a!2804) j!70)))))

(declare-fun b!1521005 () Bool)

(assert (=> b!1521005 (= e!848289 false)))

(declare-fun lt!659043 () SeekEntryResult!13030)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521005 (= lt!659043 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48842 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521006 () Bool)

(declare-fun res!1040428 () Bool)

(assert (=> b!1521006 (=> (not res!1040428) (not e!848289))))

(assert (=> b!1521006 (= res!1040428 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49394 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49394 a!2804))))))

(declare-fun b!1521007 () Bool)

(declare-fun res!1040435 () Bool)

(assert (=> b!1521007 (=> (not res!1040435) (not e!848289))))

(assert (=> b!1521007 (= res!1040435 (validKeyInArray!0 (select (arr!48842 a!2804) i!961)))))

(assert (= (and start!129542 res!1040433) b!1521003))

(assert (= (and b!1521003 res!1040432) b!1521007))

(assert (= (and b!1521007 res!1040435) b!1521004))

(assert (= (and b!1521004 res!1040434) b!1521001))

(assert (= (and b!1521001 res!1040429) b!1521002))

(assert (= (and b!1521002 res!1040431) b!1521006))

(assert (= (and b!1521006 res!1040428) b!1521000))

(assert (= (and b!1521000 res!1040430) b!1521005))

(declare-fun m!1403533 () Bool)

(assert (=> b!1521005 m!1403533))

(assert (=> b!1521005 m!1403533))

(declare-fun m!1403535 () Bool)

(assert (=> b!1521005 m!1403535))

(declare-fun m!1403537 () Bool)

(assert (=> b!1521001 m!1403537))

(declare-fun m!1403539 () Bool)

(assert (=> b!1521002 m!1403539))

(assert (=> b!1521004 m!1403533))

(assert (=> b!1521004 m!1403533))

(declare-fun m!1403541 () Bool)

(assert (=> b!1521004 m!1403541))

(declare-fun m!1403543 () Bool)

(assert (=> b!1521007 m!1403543))

(assert (=> b!1521007 m!1403543))

(declare-fun m!1403545 () Bool)

(assert (=> b!1521007 m!1403545))

(declare-fun m!1403547 () Bool)

(assert (=> start!129542 m!1403547))

(declare-fun m!1403549 () Bool)

(assert (=> start!129542 m!1403549))

(assert (=> b!1521000 m!1403533))

(assert (=> b!1521000 m!1403533))

(declare-fun m!1403551 () Bool)

(assert (=> b!1521000 m!1403551))

(assert (=> b!1521000 m!1403551))

(assert (=> b!1521000 m!1403533))

(declare-fun m!1403553 () Bool)

(assert (=> b!1521000 m!1403553))

(push 1)

(assert (not b!1521004))

(assert (not b!1521007))

(assert (not start!129542))

(assert (not b!1521001))

(assert (not b!1521000))

(assert (not b!1521005))

(assert (not b!1521002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

