; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130590 () Bool)

(assert start!130590)

(declare-fun b!1530566 () Bool)

(declare-fun res!1046797 () Bool)

(declare-fun e!853214 () Bool)

(assert (=> b!1530566 (=> (not res!1046797) (not e!853214))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101677 0))(
  ( (array!101678 (arr!49057 (Array (_ BitVec 32) (_ BitVec 64))) (size!49608 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101677)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530566 (= res!1046797 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49608 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49608 a!2804))))))

(declare-fun res!1046794 () Bool)

(assert (=> start!130590 (=> (not res!1046794) (not e!853214))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130590 (= res!1046794 (validMask!0 mask!2512))))

(assert (=> start!130590 e!853214))

(assert (=> start!130590 true))

(declare-fun array_inv!38338 (array!101677) Bool)

(assert (=> start!130590 (array_inv!38338 a!2804)))

(declare-fun b!1530567 () Bool)

(declare-fun res!1046788 () Bool)

(assert (=> b!1530567 (=> (not res!1046788) (not e!853214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101677 (_ BitVec 32)) Bool)

(assert (=> b!1530567 (= res!1046788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!853211 () Bool)

(declare-fun b!1530568 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13115 0))(
  ( (MissingZero!13115 (index!54855 (_ BitVec 32))) (Found!13115 (index!54856 (_ BitVec 32))) (Intermediate!13115 (undefined!13927 Bool) (index!54857 (_ BitVec 32)) (x!136761 (_ BitVec 32))) (Undefined!13115) (MissingVacant!13115 (index!54858 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1530568 (= e!853211 (= (seekEntry!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) (Found!13115 j!70)))))

(declare-fun b!1530569 () Bool)

(declare-fun res!1046792 () Bool)

(declare-fun e!853210 () Bool)

(assert (=> b!1530569 (=> (not res!1046792) (not e!853210))))

(declare-fun lt!662735 () SeekEntryResult!13115)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1530569 (= res!1046792 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!662735))))

(declare-fun b!1530570 () Bool)

(declare-fun res!1046798 () Bool)

(assert (=> b!1530570 (=> (not res!1046798) (not e!853214))))

(declare-datatypes ((List!35527 0))(
  ( (Nil!35524) (Cons!35523 (h!36977 (_ BitVec 64)) (t!50213 List!35527)) )
))
(declare-fun arrayNoDuplicates!0 (array!101677 (_ BitVec 32) List!35527) Bool)

(assert (=> b!1530570 (= res!1046798 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35524))))

(declare-fun b!1530571 () Bool)

(declare-fun e!853216 () Bool)

(declare-fun e!853213 () Bool)

(assert (=> b!1530571 (= e!853216 (not e!853213))))

(declare-fun res!1046795 () Bool)

(assert (=> b!1530571 (=> res!1046795 e!853213)))

(declare-fun lt!662729 () (_ BitVec 64))

(assert (=> b!1530571 (= res!1046795 (or (not (= (select (arr!49057 a!2804) j!70) lt!662729)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49057 a!2804) index!487) (select (arr!49057 a!2804) j!70)) (not (= (select (arr!49057 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530571 e!853211))

(declare-fun res!1046791 () Bool)

(assert (=> b!1530571 (=> (not res!1046791) (not e!853211))))

(assert (=> b!1530571 (= res!1046791 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51049 0))(
  ( (Unit!51050) )
))
(declare-fun lt!662727 () Unit!51049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51049)

(assert (=> b!1530571 (= lt!662727 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530572 () Bool)

(declare-fun res!1046793 () Bool)

(assert (=> b!1530572 (=> (not res!1046793) (not e!853214))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530572 (= res!1046793 (validKeyInArray!0 (select (arr!49057 a!2804) i!961)))))

(declare-fun b!1530573 () Bool)

(declare-fun e!853212 () Bool)

(assert (=> b!1530573 (= e!853213 e!853212)))

(declare-fun res!1046799 () Bool)

(assert (=> b!1530573 (=> res!1046799 e!853212)))

(declare-fun lt!662731 () SeekEntryResult!13115)

(assert (=> b!1530573 (= res!1046799 (not (= lt!662731 (Found!13115 j!70))))))

(declare-fun lt!662736 () SeekEntryResult!13115)

(declare-fun lt!662730 () SeekEntryResult!13115)

(assert (=> b!1530573 (= lt!662736 lt!662730)))

(declare-fun lt!662728 () array!101677)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1530573 (= lt!662730 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662729 lt!662728 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1530573 (= lt!662736 (seekEntryOrOpen!0 lt!662729 lt!662728 mask!2512))))

(declare-fun lt!662734 () SeekEntryResult!13115)

(assert (=> b!1530573 (= lt!662734 lt!662731)))

(assert (=> b!1530573 (= lt!662731 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1530573 (= lt!662734 (seekEntryOrOpen!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530574 () Bool)

(declare-fun res!1046789 () Bool)

(assert (=> b!1530574 (=> (not res!1046789) (not e!853214))))

(assert (=> b!1530574 (= res!1046789 (and (= (size!49608 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49608 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49608 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530575 () Bool)

(declare-fun res!1046787 () Bool)

(assert (=> b!1530575 (=> (not res!1046787) (not e!853214))))

(assert (=> b!1530575 (= res!1046787 (validKeyInArray!0 (select (arr!49057 a!2804) j!70)))))

(declare-fun b!1530576 () Bool)

(assert (=> b!1530576 (= e!853212 true)))

(assert (=> b!1530576 (= lt!662730 lt!662731)))

(declare-fun lt!662733 () Unit!51049)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51049)

(assert (=> b!1530576 (= lt!662733 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1530577 () Bool)

(assert (=> b!1530577 (= e!853210 e!853216)))

(declare-fun res!1046796 () Bool)

(assert (=> b!1530577 (=> (not res!1046796) (not e!853216))))

(declare-fun lt!662732 () SeekEntryResult!13115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530577 (= res!1046796 (= lt!662732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662729 mask!2512) lt!662729 lt!662728 mask!2512)))))

(assert (=> b!1530577 (= lt!662729 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1530577 (= lt!662728 (array!101678 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49608 a!2804)))))

(declare-fun b!1530578 () Bool)

(assert (=> b!1530578 (= e!853214 e!853210)))

(declare-fun res!1046790 () Bool)

(assert (=> b!1530578 (=> (not res!1046790) (not e!853210))))

(assert (=> b!1530578 (= res!1046790 (= lt!662732 lt!662735))))

(assert (=> b!1530578 (= lt!662735 (Intermediate!13115 false resIndex!21 resX!21))))

(assert (=> b!1530578 (= lt!662732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130590 res!1046794) b!1530574))

(assert (= (and b!1530574 res!1046789) b!1530572))

(assert (= (and b!1530572 res!1046793) b!1530575))

(assert (= (and b!1530575 res!1046787) b!1530567))

(assert (= (and b!1530567 res!1046788) b!1530570))

(assert (= (and b!1530570 res!1046798) b!1530566))

(assert (= (and b!1530566 res!1046797) b!1530578))

(assert (= (and b!1530578 res!1046790) b!1530569))

(assert (= (and b!1530569 res!1046792) b!1530577))

(assert (= (and b!1530577 res!1046796) b!1530571))

(assert (= (and b!1530571 res!1046791) b!1530568))

(assert (= (and b!1530571 (not res!1046795)) b!1530573))

(assert (= (and b!1530573 (not res!1046799)) b!1530576))

(declare-fun m!1413211 () Bool)

(assert (=> b!1530570 m!1413211))

(declare-fun m!1413213 () Bool)

(assert (=> b!1530572 m!1413213))

(assert (=> b!1530572 m!1413213))

(declare-fun m!1413215 () Bool)

(assert (=> b!1530572 m!1413215))

(declare-fun m!1413217 () Bool)

(assert (=> b!1530578 m!1413217))

(assert (=> b!1530578 m!1413217))

(declare-fun m!1413219 () Bool)

(assert (=> b!1530578 m!1413219))

(assert (=> b!1530578 m!1413219))

(assert (=> b!1530578 m!1413217))

(declare-fun m!1413221 () Bool)

(assert (=> b!1530578 m!1413221))

(assert (=> b!1530571 m!1413217))

(declare-fun m!1413223 () Bool)

(assert (=> b!1530571 m!1413223))

(declare-fun m!1413225 () Bool)

(assert (=> b!1530571 m!1413225))

(declare-fun m!1413227 () Bool)

(assert (=> b!1530571 m!1413227))

(declare-fun m!1413229 () Bool)

(assert (=> b!1530576 m!1413229))

(assert (=> b!1530569 m!1413217))

(assert (=> b!1530569 m!1413217))

(declare-fun m!1413231 () Bool)

(assert (=> b!1530569 m!1413231))

(assert (=> b!1530573 m!1413217))

(declare-fun m!1413233 () Bool)

(assert (=> b!1530573 m!1413233))

(assert (=> b!1530573 m!1413217))

(declare-fun m!1413235 () Bool)

(assert (=> b!1530573 m!1413235))

(assert (=> b!1530573 m!1413217))

(declare-fun m!1413237 () Bool)

(assert (=> b!1530573 m!1413237))

(declare-fun m!1413239 () Bool)

(assert (=> b!1530573 m!1413239))

(assert (=> b!1530568 m!1413217))

(assert (=> b!1530568 m!1413217))

(declare-fun m!1413241 () Bool)

(assert (=> b!1530568 m!1413241))

(declare-fun m!1413243 () Bool)

(assert (=> b!1530567 m!1413243))

(declare-fun m!1413245 () Bool)

(assert (=> start!130590 m!1413245))

(declare-fun m!1413247 () Bool)

(assert (=> start!130590 m!1413247))

(assert (=> b!1530575 m!1413217))

(assert (=> b!1530575 m!1413217))

(declare-fun m!1413249 () Bool)

(assert (=> b!1530575 m!1413249))

(declare-fun m!1413251 () Bool)

(assert (=> b!1530577 m!1413251))

(assert (=> b!1530577 m!1413251))

(declare-fun m!1413253 () Bool)

(assert (=> b!1530577 m!1413253))

(declare-fun m!1413255 () Bool)

(assert (=> b!1530577 m!1413255))

(declare-fun m!1413257 () Bool)

(assert (=> b!1530577 m!1413257))

(check-sat (not start!130590) (not b!1530575) (not b!1530573) (not b!1530576) (not b!1530568) (not b!1530578) (not b!1530572) (not b!1530577) (not b!1530567) (not b!1530570) (not b!1530569) (not b!1530571))
(check-sat)
