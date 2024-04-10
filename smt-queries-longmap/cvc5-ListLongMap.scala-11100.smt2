; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129622 () Bool)

(assert start!129622)

(declare-fun b!1521705 () Bool)

(declare-fun res!1040935 () Bool)

(declare-fun e!848617 () Bool)

(assert (=> b!1521705 (=> (not res!1040935) (not e!848617))))

(declare-datatypes ((array!101297 0))(
  ( (array!101298 (arr!48881 (Array (_ BitVec 32) (_ BitVec 64))) (size!49431 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101297)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101297 (_ BitVec 32)) Bool)

(assert (=> b!1521705 (= res!1040935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521706 () Bool)

(declare-fun e!848615 () Bool)

(assert (=> b!1521706 (= e!848615 false)))

(declare-datatypes ((SeekEntryResult!13046 0))(
  ( (MissingZero!13046 (index!54579 (_ BitVec 32))) (Found!13046 (index!54580 (_ BitVec 32))) (Intermediate!13046 (undefined!13858 Bool) (index!54581 (_ BitVec 32)) (x!136274 (_ BitVec 32))) (Undefined!13046) (MissingVacant!13046 (index!54582 (_ BitVec 32))) )
))
(declare-fun lt!659410 () SeekEntryResult!13046)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101297 (_ BitVec 32)) SeekEntryResult!13046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521706 (= lt!659410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48881 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48881 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101298 (store (arr!48881 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49431 a!2804)) mask!2512))))

(declare-fun b!1521707 () Bool)

(assert (=> b!1521707 (= e!848617 e!848615)))

(declare-fun res!1040931 () Bool)

(assert (=> b!1521707 (=> (not res!1040931) (not e!848615))))

(declare-fun lt!659409 () SeekEntryResult!13046)

(assert (=> b!1521707 (= res!1040931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48881 a!2804) j!70) mask!2512) (select (arr!48881 a!2804) j!70) a!2804 mask!2512) lt!659409))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521707 (= lt!659409 (Intermediate!13046 false resIndex!21 resX!21))))

(declare-fun b!1521708 () Bool)

(declare-fun res!1040934 () Bool)

(assert (=> b!1521708 (=> (not res!1040934) (not e!848617))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521708 (= res!1040934 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49431 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49431 a!2804))))))

(declare-fun b!1521709 () Bool)

(declare-fun res!1040932 () Bool)

(assert (=> b!1521709 (=> (not res!1040932) (not e!848615))))

(assert (=> b!1521709 (= res!1040932 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48881 a!2804) j!70) a!2804 mask!2512) lt!659409))))

(declare-fun b!1521711 () Bool)

(declare-fun res!1040933 () Bool)

(assert (=> b!1521711 (=> (not res!1040933) (not e!848617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521711 (= res!1040933 (validKeyInArray!0 (select (arr!48881 a!2804) i!961)))))

(declare-fun b!1521712 () Bool)

(declare-fun res!1040928 () Bool)

(assert (=> b!1521712 (=> (not res!1040928) (not e!848617))))

(assert (=> b!1521712 (= res!1040928 (validKeyInArray!0 (select (arr!48881 a!2804) j!70)))))

(declare-fun b!1521713 () Bool)

(declare-fun res!1040929 () Bool)

(assert (=> b!1521713 (=> (not res!1040929) (not e!848617))))

(declare-datatypes ((List!35364 0))(
  ( (Nil!35361) (Cons!35360 (h!36781 (_ BitVec 64)) (t!50058 List!35364)) )
))
(declare-fun arrayNoDuplicates!0 (array!101297 (_ BitVec 32) List!35364) Bool)

(assert (=> b!1521713 (= res!1040929 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35361))))

(declare-fun b!1521710 () Bool)

(declare-fun res!1040927 () Bool)

(assert (=> b!1521710 (=> (not res!1040927) (not e!848617))))

(assert (=> b!1521710 (= res!1040927 (and (= (size!49431 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49431 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49431 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1040930 () Bool)

(assert (=> start!129622 (=> (not res!1040930) (not e!848617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129622 (= res!1040930 (validMask!0 mask!2512))))

(assert (=> start!129622 e!848617))

(assert (=> start!129622 true))

(declare-fun array_inv!37909 (array!101297) Bool)

(assert (=> start!129622 (array_inv!37909 a!2804)))

(assert (= (and start!129622 res!1040930) b!1521710))

(assert (= (and b!1521710 res!1040927) b!1521711))

(assert (= (and b!1521711 res!1040933) b!1521712))

(assert (= (and b!1521712 res!1040928) b!1521705))

(assert (= (and b!1521705 res!1040935) b!1521713))

(assert (= (and b!1521713 res!1040929) b!1521708))

(assert (= (and b!1521708 res!1040934) b!1521707))

(assert (= (and b!1521707 res!1040931) b!1521709))

(assert (= (and b!1521709 res!1040932) b!1521706))

(declare-fun m!1404809 () Bool)

(assert (=> b!1521705 m!1404809))

(declare-fun m!1404811 () Bool)

(assert (=> b!1521709 m!1404811))

(assert (=> b!1521709 m!1404811))

(declare-fun m!1404813 () Bool)

(assert (=> b!1521709 m!1404813))

(assert (=> b!1521712 m!1404811))

(assert (=> b!1521712 m!1404811))

(declare-fun m!1404815 () Bool)

(assert (=> b!1521712 m!1404815))

(declare-fun m!1404817 () Bool)

(assert (=> b!1521706 m!1404817))

(declare-fun m!1404819 () Bool)

(assert (=> b!1521706 m!1404819))

(assert (=> b!1521706 m!1404819))

(declare-fun m!1404821 () Bool)

(assert (=> b!1521706 m!1404821))

(assert (=> b!1521706 m!1404821))

(assert (=> b!1521706 m!1404819))

(declare-fun m!1404823 () Bool)

(assert (=> b!1521706 m!1404823))

(declare-fun m!1404825 () Bool)

(assert (=> b!1521711 m!1404825))

(assert (=> b!1521711 m!1404825))

(declare-fun m!1404827 () Bool)

(assert (=> b!1521711 m!1404827))

(declare-fun m!1404829 () Bool)

(assert (=> start!129622 m!1404829))

(declare-fun m!1404831 () Bool)

(assert (=> start!129622 m!1404831))

(declare-fun m!1404833 () Bool)

(assert (=> b!1521713 m!1404833))

(assert (=> b!1521707 m!1404811))

(assert (=> b!1521707 m!1404811))

(declare-fun m!1404835 () Bool)

(assert (=> b!1521707 m!1404835))

(assert (=> b!1521707 m!1404835))

(assert (=> b!1521707 m!1404811))

(declare-fun m!1404837 () Bool)

(assert (=> b!1521707 m!1404837))

(push 1)

