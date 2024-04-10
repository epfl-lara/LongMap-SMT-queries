; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129298 () Bool)

(assert start!129298)

(declare-fun b!1518574 () Bool)

(declare-fun e!847145 () Bool)

(declare-fun e!847143 () Bool)

(assert (=> b!1518574 (= e!847145 e!847143)))

(declare-fun res!1038482 () Bool)

(assert (=> b!1518574 (=> (not res!1038482) (not e!847143))))

(declare-datatypes ((SeekEntryResult!12985 0))(
  ( (MissingZero!12985 (index!54335 (_ BitVec 32))) (Found!12985 (index!54336 (_ BitVec 32))) (Intermediate!12985 (undefined!13797 Bool) (index!54337 (_ BitVec 32)) (x!136007 (_ BitVec 32))) (Undefined!12985) (MissingVacant!12985 (index!54338 (_ BitVec 32))) )
))
(declare-fun lt!658238 () SeekEntryResult!12985)

(declare-fun lt!658235 () SeekEntryResult!12985)

(assert (=> b!1518574 (= res!1038482 (= lt!658238 lt!658235))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518574 (= lt!658235 (Intermediate!12985 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101154 0))(
  ( (array!101155 (arr!48814 (Array (_ BitVec 32) (_ BitVec 64))) (size!49364 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101154)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101154 (_ BitVec 32)) SeekEntryResult!12985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518574 (= lt!658238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518575 () Bool)

(declare-fun res!1038481 () Bool)

(assert (=> b!1518575 (=> (not res!1038481) (not e!847145))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518575 (= res!1038481 (validKeyInArray!0 (select (arr!48814 a!2804) i!961)))))

(declare-fun b!1518576 () Bool)

(declare-fun res!1038484 () Bool)

(assert (=> b!1518576 (=> (not res!1038484) (not e!847145))))

(assert (=> b!1518576 (= res!1038484 (validKeyInArray!0 (select (arr!48814 a!2804) j!70)))))

(declare-fun res!1038490 () Bool)

(assert (=> start!129298 (=> (not res!1038490) (not e!847145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129298 (= res!1038490 (validMask!0 mask!2512))))

(assert (=> start!129298 e!847145))

(assert (=> start!129298 true))

(declare-fun array_inv!37842 (array!101154) Bool)

(assert (=> start!129298 (array_inv!37842 a!2804)))

(declare-fun b!1518577 () Bool)

(declare-fun e!847146 () Bool)

(declare-fun e!847142 () Bool)

(assert (=> b!1518577 (= e!847146 (not e!847142))))

(declare-fun res!1038480 () Bool)

(assert (=> b!1518577 (=> res!1038480 e!847142)))

(declare-fun lt!658240 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518577 (= res!1038480 (or (not (= (select (arr!48814 a!2804) j!70) lt!658240)) (= x!534 resX!21)))))

(declare-fun e!847141 () Bool)

(assert (=> b!1518577 e!847141))

(declare-fun res!1038488 () Bool)

(assert (=> b!1518577 (=> (not res!1038488) (not e!847141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101154 (_ BitVec 32)) Bool)

(assert (=> b!1518577 (= res!1038488 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50838 0))(
  ( (Unit!50839) )
))
(declare-fun lt!658237 () Unit!50838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50838)

(assert (=> b!1518577 (= lt!658237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518578 () Bool)

(declare-fun res!1038489 () Bool)

(assert (=> b!1518578 (=> (not res!1038489) (not e!847145))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518578 (= res!1038489 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49364 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49364 a!2804))))))

(declare-fun b!1518579 () Bool)

(declare-fun res!1038479 () Bool)

(declare-fun e!847147 () Bool)

(assert (=> b!1518579 (=> res!1038479 e!847147)))

(declare-fun lt!658236 () (_ BitVec 32))

(assert (=> b!1518579 (= res!1038479 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658236 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658235)))))

(declare-fun b!1518580 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101154 (_ BitVec 32)) SeekEntryResult!12985)

(assert (=> b!1518580 (= e!847141 (= (seekEntry!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) (Found!12985 j!70)))))

(declare-fun b!1518581 () Bool)

(declare-fun res!1038485 () Bool)

(assert (=> b!1518581 (=> (not res!1038485) (not e!847145))))

(declare-datatypes ((List!35297 0))(
  ( (Nil!35294) (Cons!35293 (h!36705 (_ BitVec 64)) (t!49991 List!35297)) )
))
(declare-fun arrayNoDuplicates!0 (array!101154 (_ BitVec 32) List!35297) Bool)

(assert (=> b!1518581 (= res!1038485 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35294))))

(declare-fun b!1518582 () Bool)

(declare-fun res!1038478 () Bool)

(assert (=> b!1518582 (=> (not res!1038478) (not e!847145))))

(assert (=> b!1518582 (= res!1038478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518583 () Bool)

(declare-fun res!1038486 () Bool)

(assert (=> b!1518583 (=> (not res!1038486) (not e!847145))))

(assert (=> b!1518583 (= res!1038486 (and (= (size!49364 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49364 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49364 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518584 () Bool)

(assert (=> b!1518584 (= e!847143 e!847146)))

(declare-fun res!1038487 () Bool)

(assert (=> b!1518584 (=> (not res!1038487) (not e!847146))))

(declare-fun lt!658239 () array!101154)

(assert (=> b!1518584 (= res!1038487 (= lt!658238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658240 mask!2512) lt!658240 lt!658239 mask!2512)))))

(assert (=> b!1518584 (= lt!658240 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518584 (= lt!658239 (array!101155 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49364 a!2804)))))

(declare-fun b!1518585 () Bool)

(assert (=> b!1518585 (= e!847142 e!847147)))

(declare-fun res!1038483 () Bool)

(assert (=> b!1518585 (=> res!1038483 e!847147)))

(assert (=> b!1518585 (= res!1038483 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658236 #b00000000000000000000000000000000) (bvsge lt!658236 (size!49364 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518585 (= lt!658236 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518586 () Bool)

(declare-fun res!1038477 () Bool)

(assert (=> b!1518586 (=> (not res!1038477) (not e!847143))))

(assert (=> b!1518586 (= res!1038477 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658235))))

(declare-fun b!1518587 () Bool)

(assert (=> b!1518587 (= e!847147 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101154 (_ BitVec 32)) SeekEntryResult!12985)

(assert (=> b!1518587 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658240 lt!658239 mask!2512))))

(declare-fun lt!658234 () Unit!50838)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50838)

(assert (=> b!1518587 (= lt!658234 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658236 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!129298 res!1038490) b!1518583))

(assert (= (and b!1518583 res!1038486) b!1518575))

(assert (= (and b!1518575 res!1038481) b!1518576))

(assert (= (and b!1518576 res!1038484) b!1518582))

(assert (= (and b!1518582 res!1038478) b!1518581))

(assert (= (and b!1518581 res!1038485) b!1518578))

(assert (= (and b!1518578 res!1038489) b!1518574))

(assert (= (and b!1518574 res!1038482) b!1518586))

(assert (= (and b!1518586 res!1038477) b!1518584))

(assert (= (and b!1518584 res!1038487) b!1518577))

(assert (= (and b!1518577 res!1038488) b!1518580))

(assert (= (and b!1518577 (not res!1038480)) b!1518585))

(assert (= (and b!1518585 (not res!1038483)) b!1518579))

(assert (= (and b!1518579 (not res!1038479)) b!1518587))

(declare-fun m!1401897 () Bool)

(assert (=> b!1518576 m!1401897))

(assert (=> b!1518576 m!1401897))

(declare-fun m!1401899 () Bool)

(assert (=> b!1518576 m!1401899))

(declare-fun m!1401901 () Bool)

(assert (=> b!1518575 m!1401901))

(assert (=> b!1518575 m!1401901))

(declare-fun m!1401903 () Bool)

(assert (=> b!1518575 m!1401903))

(declare-fun m!1401905 () Bool)

(assert (=> b!1518585 m!1401905))

(declare-fun m!1401907 () Bool)

(assert (=> b!1518582 m!1401907))

(assert (=> b!1518577 m!1401897))

(declare-fun m!1401909 () Bool)

(assert (=> b!1518577 m!1401909))

(declare-fun m!1401911 () Bool)

(assert (=> b!1518577 m!1401911))

(assert (=> b!1518579 m!1401897))

(assert (=> b!1518579 m!1401897))

(declare-fun m!1401913 () Bool)

(assert (=> b!1518579 m!1401913))

(assert (=> b!1518586 m!1401897))

(assert (=> b!1518586 m!1401897))

(declare-fun m!1401915 () Bool)

(assert (=> b!1518586 m!1401915))

(assert (=> b!1518580 m!1401897))

(assert (=> b!1518580 m!1401897))

(declare-fun m!1401917 () Bool)

(assert (=> b!1518580 m!1401917))

(declare-fun m!1401919 () Bool)

(assert (=> b!1518584 m!1401919))

(assert (=> b!1518584 m!1401919))

(declare-fun m!1401921 () Bool)

(assert (=> b!1518584 m!1401921))

(declare-fun m!1401923 () Bool)

(assert (=> b!1518584 m!1401923))

(declare-fun m!1401925 () Bool)

(assert (=> b!1518584 m!1401925))

(declare-fun m!1401927 () Bool)

(assert (=> start!129298 m!1401927))

(declare-fun m!1401929 () Bool)

(assert (=> start!129298 m!1401929))

(assert (=> b!1518574 m!1401897))

(assert (=> b!1518574 m!1401897))

(declare-fun m!1401931 () Bool)

(assert (=> b!1518574 m!1401931))

(assert (=> b!1518574 m!1401931))

(assert (=> b!1518574 m!1401897))

(declare-fun m!1401933 () Bool)

(assert (=> b!1518574 m!1401933))

(assert (=> b!1518587 m!1401897))

(assert (=> b!1518587 m!1401897))

(declare-fun m!1401935 () Bool)

(assert (=> b!1518587 m!1401935))

(declare-fun m!1401937 () Bool)

(assert (=> b!1518587 m!1401937))

(declare-fun m!1401939 () Bool)

(assert (=> b!1518587 m!1401939))

(declare-fun m!1401941 () Bool)

(assert (=> b!1518581 m!1401941))

(push 1)

(assert (not b!1518575))

(assert (not b!1518587))

(assert (not b!1518586))

(assert (not start!129298))

(assert (not b!1518576))

(assert (not b!1518584))

(assert (not b!1518582))

(assert (not b!1518580))

(assert (not b!1518579))

(assert (not b!1518574))

(assert (not b!1518585))

(assert (not b!1518577))

(assert (not b!1518581))

(check-sat)

(pop 1)

