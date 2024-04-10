; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130544 () Bool)

(assert start!130544)

(declare-fun b!1532083 () Bool)

(declare-fun res!1049230 () Bool)

(declare-fun e!853652 () Bool)

(assert (=> b!1532083 (=> (not res!1049230) (not e!853652))))

(declare-datatypes ((array!101723 0))(
  ( (array!101724 (arr!49082 (Array (_ BitVec 32) (_ BitVec 64))) (size!49632 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101723)

(declare-datatypes ((List!35565 0))(
  ( (Nil!35562) (Cons!35561 (h!37006 (_ BitVec 64)) (t!50259 List!35565)) )
))
(declare-fun arrayNoDuplicates!0 (array!101723 (_ BitVec 32) List!35565) Bool)

(assert (=> b!1532083 (= res!1049230 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35562))))

(declare-fun b!1532084 () Bool)

(declare-fun res!1049234 () Bool)

(assert (=> b!1532084 (=> (not res!1049234) (not e!853652))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532084 (= res!1049234 (validKeyInArray!0 (select (arr!49082 a!2804) i!961)))))

(declare-fun b!1532085 () Bool)

(declare-fun e!853656 () Bool)

(declare-fun e!853653 () Bool)

(assert (=> b!1532085 (= e!853656 e!853653)))

(declare-fun res!1049233 () Bool)

(assert (=> b!1532085 (=> res!1049233 e!853653)))

(declare-fun lt!663531 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532085 (= res!1049233 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663531 #b00000000000000000000000000000000) (bvsge lt!663531 (size!49632 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532085 (= lt!663531 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532086 () Bool)

(declare-fun e!853654 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13247 0))(
  ( (MissingZero!13247 (index!55383 (_ BitVec 32))) (Found!13247 (index!55384 (_ BitVec 32))) (Intermediate!13247 (undefined!14059 Bool) (index!55385 (_ BitVec 32)) (x!137081 (_ BitVec 32))) (Undefined!13247) (MissingVacant!13247 (index!55386 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101723 (_ BitVec 32)) SeekEntryResult!13247)

(assert (=> b!1532086 (= e!853654 (= (seekEntry!0 (select (arr!49082 a!2804) j!70) a!2804 mask!2512) (Found!13247 j!70)))))

(declare-fun b!1532087 () Bool)

(declare-fun e!853657 () Bool)

(assert (=> b!1532087 (= e!853657 (not e!853656))))

(declare-fun res!1049228 () Bool)

(assert (=> b!1532087 (=> res!1049228 e!853656)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!663526 () (_ BitVec 64))

(assert (=> b!1532087 (= res!1049228 (or (not (= (select (arr!49082 a!2804) j!70) lt!663526)) (= x!534 resX!21)))))

(assert (=> b!1532087 e!853654))

(declare-fun res!1049224 () Bool)

(assert (=> b!1532087 (=> (not res!1049224) (not e!853654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101723 (_ BitVec 32)) Bool)

(assert (=> b!1532087 (= res!1049224 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51278 0))(
  ( (Unit!51279) )
))
(declare-fun lt!663530 () Unit!51278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51278)

(assert (=> b!1532087 (= lt!663530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532088 () Bool)

(declare-fun res!1049236 () Bool)

(assert (=> b!1532088 (=> (not res!1049236) (not e!853652))))

(assert (=> b!1532088 (= res!1049236 (validKeyInArray!0 (select (arr!49082 a!2804) j!70)))))

(declare-fun b!1532089 () Bool)

(declare-fun res!1049235 () Bool)

(declare-fun e!853651 () Bool)

(assert (=> b!1532089 (=> (not res!1049235) (not e!853651))))

(declare-fun lt!663529 () SeekEntryResult!13247)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101723 (_ BitVec 32)) SeekEntryResult!13247)

(assert (=> b!1532089 (= res!1049235 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49082 a!2804) j!70) a!2804 mask!2512) lt!663529))))

(declare-fun b!1532090 () Bool)

(declare-fun res!1049223 () Bool)

(assert (=> b!1532090 (=> (not res!1049223) (not e!853652))))

(assert (=> b!1532090 (= res!1049223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532091 () Bool)

(assert (=> b!1532091 (= e!853652 e!853651)))

(declare-fun res!1049231 () Bool)

(assert (=> b!1532091 (=> (not res!1049231) (not e!853651))))

(declare-fun lt!663532 () SeekEntryResult!13247)

(assert (=> b!1532091 (= res!1049231 (= lt!663532 lt!663529))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1532091 (= lt!663529 (Intermediate!13247 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532091 (= lt!663532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49082 a!2804) j!70) mask!2512) (select (arr!49082 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1049229 () Bool)

(assert (=> start!130544 (=> (not res!1049229) (not e!853652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130544 (= res!1049229 (validMask!0 mask!2512))))

(assert (=> start!130544 e!853652))

(assert (=> start!130544 true))

(declare-fun array_inv!38110 (array!101723) Bool)

(assert (=> start!130544 (array_inv!38110 a!2804)))

(declare-fun b!1532092 () Bool)

(declare-fun res!1049227 () Bool)

(assert (=> b!1532092 (=> (not res!1049227) (not e!853652))))

(assert (=> b!1532092 (= res!1049227 (and (= (size!49632 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49632 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49632 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532093 () Bool)

(declare-fun res!1049226 () Bool)

(assert (=> b!1532093 (=> res!1049226 e!853653)))

(assert (=> b!1532093 (= res!1049226 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663531 (select (arr!49082 a!2804) j!70) a!2804 mask!2512) lt!663529)))))

(declare-fun b!1532094 () Bool)

(assert (=> b!1532094 (= e!853653 true)))

(declare-fun lt!663528 () array!101723)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101723 (_ BitVec 32)) SeekEntryResult!13247)

(assert (=> b!1532094 (= (seekEntryOrOpen!0 (select (arr!49082 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663526 lt!663528 mask!2512))))

(declare-fun lt!663527 () Unit!51278)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51278)

(assert (=> b!1532094 (= lt!663527 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663531 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532095 () Bool)

(declare-fun res!1049232 () Bool)

(assert (=> b!1532095 (=> (not res!1049232) (not e!853652))))

(assert (=> b!1532095 (= res!1049232 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49632 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49632 a!2804))))))

(declare-fun b!1532096 () Bool)

(assert (=> b!1532096 (= e!853651 e!853657)))

(declare-fun res!1049225 () Bool)

(assert (=> b!1532096 (=> (not res!1049225) (not e!853657))))

(assert (=> b!1532096 (= res!1049225 (= lt!663532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663526 mask!2512) lt!663526 lt!663528 mask!2512)))))

(assert (=> b!1532096 (= lt!663526 (select (store (arr!49082 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532096 (= lt!663528 (array!101724 (store (arr!49082 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49632 a!2804)))))

(assert (= (and start!130544 res!1049229) b!1532092))

(assert (= (and b!1532092 res!1049227) b!1532084))

(assert (= (and b!1532084 res!1049234) b!1532088))

(assert (= (and b!1532088 res!1049236) b!1532090))

(assert (= (and b!1532090 res!1049223) b!1532083))

(assert (= (and b!1532083 res!1049230) b!1532095))

(assert (= (and b!1532095 res!1049232) b!1532091))

(assert (= (and b!1532091 res!1049231) b!1532089))

(assert (= (and b!1532089 res!1049235) b!1532096))

(assert (= (and b!1532096 res!1049225) b!1532087))

(assert (= (and b!1532087 res!1049224) b!1532086))

(assert (= (and b!1532087 (not res!1049228)) b!1532085))

(assert (= (and b!1532085 (not res!1049233)) b!1532093))

(assert (= (and b!1532093 (not res!1049226)) b!1532094))

(declare-fun m!1414773 () Bool)

(assert (=> b!1532090 m!1414773))

(declare-fun m!1414775 () Bool)

(assert (=> b!1532089 m!1414775))

(assert (=> b!1532089 m!1414775))

(declare-fun m!1414777 () Bool)

(assert (=> b!1532089 m!1414777))

(declare-fun m!1414779 () Bool)

(assert (=> start!130544 m!1414779))

(declare-fun m!1414781 () Bool)

(assert (=> start!130544 m!1414781))

(declare-fun m!1414783 () Bool)

(assert (=> b!1532096 m!1414783))

(assert (=> b!1532096 m!1414783))

(declare-fun m!1414785 () Bool)

(assert (=> b!1532096 m!1414785))

(declare-fun m!1414787 () Bool)

(assert (=> b!1532096 m!1414787))

(declare-fun m!1414789 () Bool)

(assert (=> b!1532096 m!1414789))

(declare-fun m!1414791 () Bool)

(assert (=> b!1532085 m!1414791))

(assert (=> b!1532086 m!1414775))

(assert (=> b!1532086 m!1414775))

(declare-fun m!1414793 () Bool)

(assert (=> b!1532086 m!1414793))

(assert (=> b!1532093 m!1414775))

(assert (=> b!1532093 m!1414775))

(declare-fun m!1414795 () Bool)

(assert (=> b!1532093 m!1414795))

(assert (=> b!1532087 m!1414775))

(declare-fun m!1414797 () Bool)

(assert (=> b!1532087 m!1414797))

(declare-fun m!1414799 () Bool)

(assert (=> b!1532087 m!1414799))

(declare-fun m!1414801 () Bool)

(assert (=> b!1532083 m!1414801))

(declare-fun m!1414803 () Bool)

(assert (=> b!1532084 m!1414803))

(assert (=> b!1532084 m!1414803))

(declare-fun m!1414805 () Bool)

(assert (=> b!1532084 m!1414805))

(assert (=> b!1532094 m!1414775))

(assert (=> b!1532094 m!1414775))

(declare-fun m!1414807 () Bool)

(assert (=> b!1532094 m!1414807))

(declare-fun m!1414809 () Bool)

(assert (=> b!1532094 m!1414809))

(declare-fun m!1414811 () Bool)

(assert (=> b!1532094 m!1414811))

(assert (=> b!1532088 m!1414775))

(assert (=> b!1532088 m!1414775))

(declare-fun m!1414813 () Bool)

(assert (=> b!1532088 m!1414813))

(assert (=> b!1532091 m!1414775))

(assert (=> b!1532091 m!1414775))

(declare-fun m!1414815 () Bool)

(assert (=> b!1532091 m!1414815))

(assert (=> b!1532091 m!1414815))

(assert (=> b!1532091 m!1414775))

(declare-fun m!1414817 () Bool)

(assert (=> b!1532091 m!1414817))

(push 1)

