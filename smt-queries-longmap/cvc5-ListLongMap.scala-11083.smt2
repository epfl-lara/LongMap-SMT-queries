; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129330 () Bool)

(assert start!129330)

(declare-fun b!1519246 () Bool)

(declare-fun res!1039158 () Bool)

(declare-fun e!847477 () Bool)

(assert (=> b!1519246 (=> (not res!1039158) (not e!847477))))

(declare-datatypes ((SeekEntryResult!13001 0))(
  ( (MissingZero!13001 (index!54399 (_ BitVec 32))) (Found!13001 (index!54400 (_ BitVec 32))) (Intermediate!13001 (undefined!13813 Bool) (index!54401 (_ BitVec 32)) (x!136071 (_ BitVec 32))) (Undefined!13001) (MissingVacant!13001 (index!54402 (_ BitVec 32))) )
))
(declare-fun lt!658572 () SeekEntryResult!13001)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101186 0))(
  ( (array!101187 (arr!48830 (Array (_ BitVec 32) (_ BitVec 64))) (size!49380 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101186)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101186 (_ BitVec 32)) SeekEntryResult!13001)

(assert (=> b!1519246 (= res!1039158 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48830 a!2804) j!70) a!2804 mask!2512) lt!658572))))

(declare-fun b!1519247 () Bool)

(declare-fun res!1039156 () Bool)

(declare-fun e!847483 () Bool)

(assert (=> b!1519247 (=> (not res!1039156) (not e!847483))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519247 (= res!1039156 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49380 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49380 a!2804))))))

(declare-fun b!1519248 () Bool)

(declare-fun e!847481 () Bool)

(declare-fun e!847480 () Bool)

(assert (=> b!1519248 (= e!847481 (not e!847480))))

(declare-fun res!1039157 () Bool)

(assert (=> b!1519248 (=> res!1039157 e!847480)))

(declare-fun lt!658576 () (_ BitVec 64))

(assert (=> b!1519248 (= res!1039157 (or (not (= (select (arr!48830 a!2804) j!70) lt!658576)) (= x!534 resX!21)))))

(declare-fun e!847482 () Bool)

(assert (=> b!1519248 e!847482))

(declare-fun res!1039151 () Bool)

(assert (=> b!1519248 (=> (not res!1039151) (not e!847482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101186 (_ BitVec 32)) Bool)

(assert (=> b!1519248 (= res!1039151 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50870 0))(
  ( (Unit!50871) )
))
(declare-fun lt!658574 () Unit!50870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50870)

(assert (=> b!1519248 (= lt!658574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519249 () Bool)

(declare-fun res!1039161 () Bool)

(declare-fun e!847479 () Bool)

(assert (=> b!1519249 (=> res!1039161 e!847479)))

(declare-fun lt!658571 () (_ BitVec 32))

(assert (=> b!1519249 (= res!1039161 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658571 (select (arr!48830 a!2804) j!70) a!2804 mask!2512) lt!658572)))))

(declare-fun b!1519250 () Bool)

(declare-fun res!1039159 () Bool)

(assert (=> b!1519250 (=> (not res!1039159) (not e!847483))))

(declare-datatypes ((List!35313 0))(
  ( (Nil!35310) (Cons!35309 (h!36721 (_ BitVec 64)) (t!50007 List!35313)) )
))
(declare-fun arrayNoDuplicates!0 (array!101186 (_ BitVec 32) List!35313) Bool)

(assert (=> b!1519250 (= res!1039159 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35310))))

(declare-fun b!1519251 () Bool)

(assert (=> b!1519251 (= e!847479 true)))

(declare-fun lt!658575 () array!101186)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101186 (_ BitVec 32)) SeekEntryResult!13001)

(assert (=> b!1519251 (= (seekEntryOrOpen!0 (select (arr!48830 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658576 lt!658575 mask!2512))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!658573 () Unit!50870)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50870)

(assert (=> b!1519251 (= lt!658573 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658571 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519252 () Bool)

(assert (=> b!1519252 (= e!847480 e!847479)))

(declare-fun res!1039149 () Bool)

(assert (=> b!1519252 (=> res!1039149 e!847479)))

(assert (=> b!1519252 (= res!1039149 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658571 #b00000000000000000000000000000000) (bvsge lt!658571 (size!49380 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519252 (= lt!658571 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519253 () Bool)

(declare-fun res!1039154 () Bool)

(assert (=> b!1519253 (=> (not res!1039154) (not e!847483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519253 (= res!1039154 (validKeyInArray!0 (select (arr!48830 a!2804) j!70)))))

(declare-fun b!1519254 () Bool)

(declare-fun res!1039152 () Bool)

(assert (=> b!1519254 (=> (not res!1039152) (not e!847483))))

(assert (=> b!1519254 (= res!1039152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519255 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101186 (_ BitVec 32)) SeekEntryResult!13001)

(assert (=> b!1519255 (= e!847482 (= (seekEntry!0 (select (arr!48830 a!2804) j!70) a!2804 mask!2512) (Found!13001 j!70)))))

(declare-fun b!1519256 () Bool)

(declare-fun res!1039162 () Bool)

(assert (=> b!1519256 (=> (not res!1039162) (not e!847483))))

(assert (=> b!1519256 (= res!1039162 (validKeyInArray!0 (select (arr!48830 a!2804) i!961)))))

(declare-fun b!1519257 () Bool)

(declare-fun res!1039150 () Bool)

(assert (=> b!1519257 (=> (not res!1039150) (not e!847483))))

(assert (=> b!1519257 (= res!1039150 (and (= (size!49380 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49380 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49380 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1039153 () Bool)

(assert (=> start!129330 (=> (not res!1039153) (not e!847483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129330 (= res!1039153 (validMask!0 mask!2512))))

(assert (=> start!129330 e!847483))

(assert (=> start!129330 true))

(declare-fun array_inv!37858 (array!101186) Bool)

(assert (=> start!129330 (array_inv!37858 a!2804)))

(declare-fun b!1519258 () Bool)

(assert (=> b!1519258 (= e!847477 e!847481)))

(declare-fun res!1039160 () Bool)

(assert (=> b!1519258 (=> (not res!1039160) (not e!847481))))

(declare-fun lt!658570 () SeekEntryResult!13001)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519258 (= res!1039160 (= lt!658570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658576 mask!2512) lt!658576 lt!658575 mask!2512)))))

(assert (=> b!1519258 (= lt!658576 (select (store (arr!48830 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519258 (= lt!658575 (array!101187 (store (arr!48830 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49380 a!2804)))))

(declare-fun b!1519259 () Bool)

(assert (=> b!1519259 (= e!847483 e!847477)))

(declare-fun res!1039155 () Bool)

(assert (=> b!1519259 (=> (not res!1039155) (not e!847477))))

(assert (=> b!1519259 (= res!1039155 (= lt!658570 lt!658572))))

(assert (=> b!1519259 (= lt!658572 (Intermediate!13001 false resIndex!21 resX!21))))

(assert (=> b!1519259 (= lt!658570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48830 a!2804) j!70) mask!2512) (select (arr!48830 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129330 res!1039153) b!1519257))

(assert (= (and b!1519257 res!1039150) b!1519256))

(assert (= (and b!1519256 res!1039162) b!1519253))

(assert (= (and b!1519253 res!1039154) b!1519254))

(assert (= (and b!1519254 res!1039152) b!1519250))

(assert (= (and b!1519250 res!1039159) b!1519247))

(assert (= (and b!1519247 res!1039156) b!1519259))

(assert (= (and b!1519259 res!1039155) b!1519246))

(assert (= (and b!1519246 res!1039158) b!1519258))

(assert (= (and b!1519258 res!1039160) b!1519248))

(assert (= (and b!1519248 res!1039151) b!1519255))

(assert (= (and b!1519248 (not res!1039157)) b!1519252))

(assert (= (and b!1519252 (not res!1039149)) b!1519249))

(assert (= (and b!1519249 (not res!1039161)) b!1519251))

(declare-fun m!1402633 () Bool)

(assert (=> b!1519246 m!1402633))

(assert (=> b!1519246 m!1402633))

(declare-fun m!1402635 () Bool)

(assert (=> b!1519246 m!1402635))

(declare-fun m!1402637 () Bool)

(assert (=> b!1519254 m!1402637))

(declare-fun m!1402639 () Bool)

(assert (=> start!129330 m!1402639))

(declare-fun m!1402641 () Bool)

(assert (=> start!129330 m!1402641))

(assert (=> b!1519248 m!1402633))

(declare-fun m!1402643 () Bool)

(assert (=> b!1519248 m!1402643))

(declare-fun m!1402645 () Bool)

(assert (=> b!1519248 m!1402645))

(assert (=> b!1519249 m!1402633))

(assert (=> b!1519249 m!1402633))

(declare-fun m!1402647 () Bool)

(assert (=> b!1519249 m!1402647))

(assert (=> b!1519253 m!1402633))

(assert (=> b!1519253 m!1402633))

(declare-fun m!1402649 () Bool)

(assert (=> b!1519253 m!1402649))

(declare-fun m!1402651 () Bool)

(assert (=> b!1519252 m!1402651))

(declare-fun m!1402653 () Bool)

(assert (=> b!1519258 m!1402653))

(assert (=> b!1519258 m!1402653))

(declare-fun m!1402655 () Bool)

(assert (=> b!1519258 m!1402655))

(declare-fun m!1402657 () Bool)

(assert (=> b!1519258 m!1402657))

(declare-fun m!1402659 () Bool)

(assert (=> b!1519258 m!1402659))

(declare-fun m!1402661 () Bool)

(assert (=> b!1519256 m!1402661))

(assert (=> b!1519256 m!1402661))

(declare-fun m!1402663 () Bool)

(assert (=> b!1519256 m!1402663))

(declare-fun m!1402665 () Bool)

(assert (=> b!1519250 m!1402665))

(assert (=> b!1519259 m!1402633))

(assert (=> b!1519259 m!1402633))

(declare-fun m!1402667 () Bool)

(assert (=> b!1519259 m!1402667))

(assert (=> b!1519259 m!1402667))

(assert (=> b!1519259 m!1402633))

(declare-fun m!1402669 () Bool)

(assert (=> b!1519259 m!1402669))

(assert (=> b!1519251 m!1402633))

(assert (=> b!1519251 m!1402633))

(declare-fun m!1402671 () Bool)

(assert (=> b!1519251 m!1402671))

(declare-fun m!1402673 () Bool)

(assert (=> b!1519251 m!1402673))

(declare-fun m!1402675 () Bool)

(assert (=> b!1519251 m!1402675))

(assert (=> b!1519255 m!1402633))

(assert (=> b!1519255 m!1402633))

(declare-fun m!1402677 () Bool)

(assert (=> b!1519255 m!1402677))

(push 1)

