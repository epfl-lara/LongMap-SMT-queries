; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128716 () Bool)

(assert start!128716)

(declare-fun b!1508463 () Bool)

(declare-fun res!1028478 () Bool)

(declare-fun e!842711 () Bool)

(assert (=> b!1508463 (=> (not res!1028478) (not e!842711))))

(declare-datatypes ((array!100611 0))(
  ( (array!100612 (arr!48544 (Array (_ BitVec 32) (_ BitVec 64))) (size!49094 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100611)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508463 (= res!1028478 (validKeyInArray!0 (select (arr!48544 a!2804) i!961)))))

(declare-fun b!1508464 () Bool)

(declare-fun res!1028479 () Bool)

(assert (=> b!1508464 (=> (not res!1028479) (not e!842711))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1508464 (= res!1028479 (and (= (size!49094 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49094 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49094 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508465 () Bool)

(declare-fun e!842713 () Bool)

(assert (=> b!1508465 (= e!842713 false)))

(declare-fun lt!654637 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508465 (= lt!654637 (toIndex!0 (select (store (arr!48544 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508466 () Bool)

(declare-fun res!1028476 () Bool)

(assert (=> b!1508466 (=> (not res!1028476) (not e!842711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100611 (_ BitVec 32)) Bool)

(assert (=> b!1508466 (= res!1028476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1028473 () Bool)

(assert (=> start!128716 (=> (not res!1028473) (not e!842711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128716 (= res!1028473 (validMask!0 mask!2512))))

(assert (=> start!128716 e!842711))

(assert (=> start!128716 true))

(declare-fun array_inv!37572 (array!100611) Bool)

(assert (=> start!128716 (array_inv!37572 a!2804)))

(declare-fun b!1508467 () Bool)

(declare-fun res!1028475 () Bool)

(assert (=> b!1508467 (=> (not res!1028475) (not e!842711))))

(assert (=> b!1508467 (= res!1028475 (validKeyInArray!0 (select (arr!48544 a!2804) j!70)))))

(declare-fun b!1508468 () Bool)

(declare-fun res!1028477 () Bool)

(assert (=> b!1508468 (=> (not res!1028477) (not e!842713))))

(declare-datatypes ((SeekEntryResult!12715 0))(
  ( (MissingZero!12715 (index!53255 (_ BitVec 32))) (Found!12715 (index!53256 (_ BitVec 32))) (Intermediate!12715 (undefined!13527 Bool) (index!53257 (_ BitVec 32)) (x!135011 (_ BitVec 32))) (Undefined!12715) (MissingVacant!12715 (index!53258 (_ BitVec 32))) )
))
(declare-fun lt!654636 () SeekEntryResult!12715)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100611 (_ BitVec 32)) SeekEntryResult!12715)

(assert (=> b!1508468 (= res!1028477 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48544 a!2804) j!70) a!2804 mask!2512) lt!654636))))

(declare-fun b!1508469 () Bool)

(declare-fun res!1028471 () Bool)

(assert (=> b!1508469 (=> (not res!1028471) (not e!842711))))

(declare-datatypes ((List!35027 0))(
  ( (Nil!35024) (Cons!35023 (h!36432 (_ BitVec 64)) (t!49721 List!35027)) )
))
(declare-fun arrayNoDuplicates!0 (array!100611 (_ BitVec 32) List!35027) Bool)

(assert (=> b!1508469 (= res!1028471 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35024))))

(declare-fun b!1508470 () Bool)

(assert (=> b!1508470 (= e!842711 e!842713)))

(declare-fun res!1028474 () Bool)

(assert (=> b!1508470 (=> (not res!1028474) (not e!842713))))

(assert (=> b!1508470 (= res!1028474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48544 a!2804) j!70) mask!2512) (select (arr!48544 a!2804) j!70) a!2804 mask!2512) lt!654636))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508470 (= lt!654636 (Intermediate!12715 false resIndex!21 resX!21))))

(declare-fun b!1508471 () Bool)

(declare-fun res!1028472 () Bool)

(assert (=> b!1508471 (=> (not res!1028472) (not e!842711))))

(assert (=> b!1508471 (= res!1028472 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49094 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49094 a!2804))))))

(assert (= (and start!128716 res!1028473) b!1508464))

(assert (= (and b!1508464 res!1028479) b!1508463))

(assert (= (and b!1508463 res!1028478) b!1508467))

(assert (= (and b!1508467 res!1028475) b!1508466))

(assert (= (and b!1508466 res!1028476) b!1508469))

(assert (= (and b!1508469 res!1028471) b!1508471))

(assert (= (and b!1508471 res!1028472) b!1508470))

(assert (= (and b!1508470 res!1028474) b!1508468))

(assert (= (and b!1508468 res!1028477) b!1508465))

(declare-fun m!1390971 () Bool)

(assert (=> b!1508463 m!1390971))

(assert (=> b!1508463 m!1390971))

(declare-fun m!1390973 () Bool)

(assert (=> b!1508463 m!1390973))

(declare-fun m!1390975 () Bool)

(assert (=> b!1508470 m!1390975))

(assert (=> b!1508470 m!1390975))

(declare-fun m!1390977 () Bool)

(assert (=> b!1508470 m!1390977))

(assert (=> b!1508470 m!1390977))

(assert (=> b!1508470 m!1390975))

(declare-fun m!1390979 () Bool)

(assert (=> b!1508470 m!1390979))

(declare-fun m!1390981 () Bool)

(assert (=> start!128716 m!1390981))

(declare-fun m!1390983 () Bool)

(assert (=> start!128716 m!1390983))

(declare-fun m!1390985 () Bool)

(assert (=> b!1508465 m!1390985))

(declare-fun m!1390987 () Bool)

(assert (=> b!1508465 m!1390987))

(assert (=> b!1508465 m!1390987))

(declare-fun m!1390989 () Bool)

(assert (=> b!1508465 m!1390989))

(assert (=> b!1508467 m!1390975))

(assert (=> b!1508467 m!1390975))

(declare-fun m!1390991 () Bool)

(assert (=> b!1508467 m!1390991))

(declare-fun m!1390993 () Bool)

(assert (=> b!1508466 m!1390993))

(assert (=> b!1508468 m!1390975))

(assert (=> b!1508468 m!1390975))

(declare-fun m!1390995 () Bool)

(assert (=> b!1508468 m!1390995))

(declare-fun m!1390997 () Bool)

(assert (=> b!1508469 m!1390997))

(push 1)

(assert (not b!1508469))

(assert (not b!1508468))

(assert (not b!1508463))

(assert (not b!1508470))

