; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128870 () Bool)

(assert start!128870)

(declare-fun b!1510341 () Bool)

(declare-fun res!1030244 () Bool)

(declare-fun e!843422 () Bool)

(assert (=> b!1510341 (=> (not res!1030244) (not e!843422))))

(declare-datatypes ((array!100726 0))(
  ( (array!100727 (arr!48600 (Array (_ BitVec 32) (_ BitVec 64))) (size!49150 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100726)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510341 (= res!1030244 (validKeyInArray!0 (select (arr!48600 a!2804) i!961)))))

(declare-fun b!1510342 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!843424 () Bool)

(assert (=> b!1510342 (= e!843424 (validKeyInArray!0 (select (store (arr!48600 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1510343 () Bool)

(declare-fun res!1030254 () Bool)

(assert (=> b!1510343 (=> (not res!1030254) (not e!843422))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100726 (_ BitVec 32)) Bool)

(assert (=> b!1510343 (= res!1030254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510344 () Bool)

(declare-fun res!1030250 () Bool)

(declare-fun e!843421 () Bool)

(assert (=> b!1510344 (=> (not res!1030250) (not e!843421))))

(declare-datatypes ((SeekEntryResult!12771 0))(
  ( (MissingZero!12771 (index!53479 (_ BitVec 32))) (Found!12771 (index!53480 (_ BitVec 32))) (Intermediate!12771 (undefined!13583 Bool) (index!53481 (_ BitVec 32)) (x!135225 (_ BitVec 32))) (Undefined!12771) (MissingVacant!12771 (index!53482 (_ BitVec 32))) )
))
(declare-fun lt!655143 () SeekEntryResult!12771)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100726 (_ BitVec 32)) SeekEntryResult!12771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510344 (= res!1030250 (= lt!655143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48600 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48600 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100727 (store (arr!48600 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49150 a!2804)) mask!2512)))))

(declare-fun b!1510345 () Bool)

(assert (=> b!1510345 (= e!843422 e!843421)))

(declare-fun res!1030249 () Bool)

(assert (=> b!1510345 (=> (not res!1030249) (not e!843421))))

(declare-fun lt!655142 () SeekEntryResult!12771)

(assert (=> b!1510345 (= res!1030249 (= lt!655143 lt!655142))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510345 (= lt!655142 (Intermediate!12771 false resIndex!21 resX!21))))

(assert (=> b!1510345 (= lt!655143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48600 a!2804) j!70) mask!2512) (select (arr!48600 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510346 () Bool)

(declare-fun e!843423 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100726 (_ BitVec 32)) SeekEntryResult!12771)

(assert (=> b!1510346 (= e!843423 (= (seekEntry!0 (select (arr!48600 a!2804) j!70) a!2804 mask!2512) (Found!12771 j!70)))))

(declare-fun b!1510347 () Bool)

(declare-fun res!1030251 () Bool)

(assert (=> b!1510347 (=> (not res!1030251) (not e!843422))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1510347 (= res!1030251 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49150 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49150 a!2804))))))

(declare-fun b!1510348 () Bool)

(declare-fun res!1030252 () Bool)

(assert (=> b!1510348 (=> (not res!1030252) (not e!843422))))

(assert (=> b!1510348 (= res!1030252 (validKeyInArray!0 (select (arr!48600 a!2804) j!70)))))

(declare-fun res!1030246 () Bool)

(assert (=> start!128870 (=> (not res!1030246) (not e!843422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128870 (= res!1030246 (validMask!0 mask!2512))))

(assert (=> start!128870 e!843422))

(assert (=> start!128870 true))

(declare-fun array_inv!37628 (array!100726) Bool)

(assert (=> start!128870 (array_inv!37628 a!2804)))

(declare-fun b!1510349 () Bool)

(declare-fun res!1030255 () Bool)

(assert (=> b!1510349 (=> (not res!1030255) (not e!843422))))

(assert (=> b!1510349 (= res!1030255 (and (= (size!49150 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49150 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49150 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510350 () Bool)

(declare-fun res!1030248 () Bool)

(assert (=> b!1510350 (=> (not res!1030248) (not e!843421))))

(assert (=> b!1510350 (= res!1030248 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48600 a!2804) j!70) a!2804 mask!2512) lt!655142))))

(declare-fun b!1510351 () Bool)

(declare-fun res!1030245 () Bool)

(assert (=> b!1510351 (=> (not res!1030245) (not e!843422))))

(declare-datatypes ((List!35083 0))(
  ( (Nil!35080) (Cons!35079 (h!36491 (_ BitVec 64)) (t!49777 List!35083)) )
))
(declare-fun arrayNoDuplicates!0 (array!100726 (_ BitVec 32) List!35083) Bool)

(assert (=> b!1510351 (= res!1030245 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35080))))

(declare-fun b!1510352 () Bool)

(assert (=> b!1510352 (= e!843421 (not e!843424))))

(declare-fun res!1030253 () Bool)

(assert (=> b!1510352 (=> res!1030253 e!843424)))

(assert (=> b!1510352 (= res!1030253 (or (not (= (select (arr!48600 a!2804) j!70) (select (store (arr!48600 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48600 a!2804) index!487) (select (arr!48600 a!2804) j!70))) (not (= j!70 index!487)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(assert (=> b!1510352 e!843423))

(declare-fun res!1030247 () Bool)

(assert (=> b!1510352 (=> (not res!1030247) (not e!843423))))

(assert (=> b!1510352 (= res!1030247 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50410 0))(
  ( (Unit!50411) )
))
(declare-fun lt!655144 () Unit!50410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50410)

(assert (=> b!1510352 (= lt!655144 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128870 res!1030246) b!1510349))

(assert (= (and b!1510349 res!1030255) b!1510341))

(assert (= (and b!1510341 res!1030244) b!1510348))

(assert (= (and b!1510348 res!1030252) b!1510343))

(assert (= (and b!1510343 res!1030254) b!1510351))

(assert (= (and b!1510351 res!1030245) b!1510347))

(assert (= (and b!1510347 res!1030251) b!1510345))

(assert (= (and b!1510345 res!1030249) b!1510350))

(assert (= (and b!1510350 res!1030248) b!1510344))

(assert (= (and b!1510344 res!1030250) b!1510352))

(assert (= (and b!1510352 res!1030247) b!1510346))

(assert (= (and b!1510352 (not res!1030253)) b!1510342))

(declare-fun m!1392917 () Bool)

(assert (=> b!1510342 m!1392917))

(declare-fun m!1392919 () Bool)

(assert (=> b!1510342 m!1392919))

(assert (=> b!1510342 m!1392919))

(declare-fun m!1392921 () Bool)

(assert (=> b!1510342 m!1392921))

(declare-fun m!1392923 () Bool)

(assert (=> b!1510348 m!1392923))

(assert (=> b!1510348 m!1392923))

(declare-fun m!1392925 () Bool)

(assert (=> b!1510348 m!1392925))

(assert (=> b!1510344 m!1392917))

(assert (=> b!1510344 m!1392919))

(assert (=> b!1510344 m!1392919))

(declare-fun m!1392927 () Bool)

(assert (=> b!1510344 m!1392927))

(assert (=> b!1510344 m!1392927))

(assert (=> b!1510344 m!1392919))

(declare-fun m!1392929 () Bool)

(assert (=> b!1510344 m!1392929))

(declare-fun m!1392931 () Bool)

(assert (=> b!1510343 m!1392931))

(assert (=> b!1510352 m!1392923))

(declare-fun m!1392933 () Bool)

(assert (=> b!1510352 m!1392933))

(assert (=> b!1510352 m!1392917))

(declare-fun m!1392935 () Bool)

(assert (=> b!1510352 m!1392935))

(assert (=> b!1510352 m!1392919))

(declare-fun m!1392937 () Bool)

(assert (=> b!1510352 m!1392937))

(declare-fun m!1392939 () Bool)

(assert (=> b!1510351 m!1392939))

(assert (=> b!1510346 m!1392923))

(assert (=> b!1510346 m!1392923))

(declare-fun m!1392941 () Bool)

(assert (=> b!1510346 m!1392941))

(declare-fun m!1392943 () Bool)

(assert (=> b!1510341 m!1392943))

(assert (=> b!1510341 m!1392943))

(declare-fun m!1392945 () Bool)

(assert (=> b!1510341 m!1392945))

(assert (=> b!1510350 m!1392923))

(assert (=> b!1510350 m!1392923))

(declare-fun m!1392947 () Bool)

(assert (=> b!1510350 m!1392947))

(assert (=> b!1510345 m!1392923))

(assert (=> b!1510345 m!1392923))

(declare-fun m!1392949 () Bool)

(assert (=> b!1510345 m!1392949))

(assert (=> b!1510345 m!1392949))

(assert (=> b!1510345 m!1392923))

(declare-fun m!1392951 () Bool)

(assert (=> b!1510345 m!1392951))

(declare-fun m!1392953 () Bool)

(assert (=> start!128870 m!1392953))

(declare-fun m!1392955 () Bool)

(assert (=> start!128870 m!1392955))

(check-sat (not b!1510342) (not b!1510344) (not b!1510346) (not b!1510351) (not b!1510352) (not b!1510345) (not b!1510341) (not b!1510343) (not b!1510350) (not b!1510348) (not start!128870))
(check-sat)
