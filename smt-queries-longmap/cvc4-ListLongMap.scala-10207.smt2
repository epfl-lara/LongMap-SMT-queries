; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120298 () Bool)

(assert start!120298)

(declare-fun b!1399925 () Bool)

(declare-fun e!792573 () Bool)

(declare-fun e!792571 () Bool)

(assert (=> b!1399925 (= e!792573 e!792571)))

(declare-fun res!938438 () Bool)

(assert (=> b!1399925 (=> res!938438 e!792571)))

(declare-datatypes ((SeekEntryResult!10521 0))(
  ( (MissingZero!10521 (index!44461 (_ BitVec 32))) (Found!10521 (index!44462 (_ BitVec 32))) (Intermediate!10521 (undefined!11333 Bool) (index!44463 (_ BitVec 32)) (x!126108 (_ BitVec 32))) (Undefined!10521) (MissingVacant!10521 (index!44464 (_ BitVec 32))) )
))
(declare-fun lt!615831 () SeekEntryResult!10521)

(declare-fun lt!615834 () SeekEntryResult!10521)

(assert (=> b!1399925 (= res!938438 (or (= lt!615831 lt!615834) (not (is-Intermediate!10521 lt!615834))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!615835 () (_ BitVec 64))

(declare-datatypes ((array!95707 0))(
  ( (array!95708 (arr!46204 (Array (_ BitVec 32) (_ BitVec 64))) (size!46754 (_ BitVec 32))) )
))
(declare-fun lt!615836 () array!95707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95707 (_ BitVec 32)) SeekEntryResult!10521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399925 (= lt!615834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615835 mask!2840) lt!615835 lt!615836 mask!2840))))

(declare-fun a!2901 () array!95707)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399925 (= lt!615835 (select (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399925 (= lt!615836 (array!95708 (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46754 a!2901)))))

(declare-fun b!1399926 () Bool)

(declare-fun res!938442 () Bool)

(declare-fun e!792570 () Bool)

(assert (=> b!1399926 (=> (not res!938442) (not e!792570))))

(declare-datatypes ((List!32723 0))(
  ( (Nil!32720) (Cons!32719 (h!33967 (_ BitVec 64)) (t!47417 List!32723)) )
))
(declare-fun arrayNoDuplicates!0 (array!95707 (_ BitVec 32) List!32723) Bool)

(assert (=> b!1399926 (= res!938442 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32720))))

(declare-fun b!1399927 () Bool)

(declare-fun e!792572 () Bool)

(assert (=> b!1399927 (= e!792572 true)))

(declare-fun lt!615832 () SeekEntryResult!10521)

(declare-fun lt!615837 () (_ BitVec 32))

(assert (=> b!1399927 (= lt!615832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615837 lt!615835 lt!615836 mask!2840))))

(declare-fun b!1399928 () Bool)

(declare-fun res!938441 () Bool)

(assert (=> b!1399928 (=> (not res!938441) (not e!792570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95707 (_ BitVec 32)) Bool)

(assert (=> b!1399928 (= res!938441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938444 () Bool)

(assert (=> start!120298 (=> (not res!938444) (not e!792570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120298 (= res!938444 (validMask!0 mask!2840))))

(assert (=> start!120298 e!792570))

(assert (=> start!120298 true))

(declare-fun array_inv!35232 (array!95707) Bool)

(assert (=> start!120298 (array_inv!35232 a!2901)))

(declare-fun b!1399929 () Bool)

(assert (=> b!1399929 (= e!792571 e!792572)))

(declare-fun res!938446 () Bool)

(assert (=> b!1399929 (=> res!938446 e!792572)))

(assert (=> b!1399929 (= res!938446 (or (bvslt (x!126108 lt!615831) #b00000000000000000000000000000000) (bvsgt (x!126108 lt!615831) #b01111111111111111111111111111110) (bvslt (x!126108 lt!615834) #b00000000000000000000000000000000) (bvsgt (x!126108 lt!615834) #b01111111111111111111111111111110) (bvslt lt!615837 #b00000000000000000000000000000000) (bvsge lt!615837 (size!46754 a!2901)) (bvslt (index!44463 lt!615831) #b00000000000000000000000000000000) (bvsge (index!44463 lt!615831) (size!46754 a!2901)) (bvslt (index!44463 lt!615834) #b00000000000000000000000000000000) (bvsge (index!44463 lt!615834) (size!46754 a!2901)) (not (= lt!615831 (Intermediate!10521 false (index!44463 lt!615831) (x!126108 lt!615831)))) (not (= lt!615834 (Intermediate!10521 false (index!44463 lt!615834) (x!126108 lt!615834))))))))

(declare-fun e!792574 () Bool)

(assert (=> b!1399929 e!792574))

(declare-fun res!938445 () Bool)

(assert (=> b!1399929 (=> (not res!938445) (not e!792574))))

(assert (=> b!1399929 (= res!938445 (and (not (undefined!11333 lt!615834)) (= (index!44463 lt!615834) i!1037) (bvslt (x!126108 lt!615834) (x!126108 lt!615831)) (= (select (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44463 lt!615834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47046 0))(
  ( (Unit!47047) )
))
(declare-fun lt!615830 () Unit!47046)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47046)

(assert (=> b!1399929 (= lt!615830 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615837 (x!126108 lt!615831) (index!44463 lt!615831) (x!126108 lt!615834) (index!44463 lt!615834) (undefined!11333 lt!615834) mask!2840))))

(declare-fun b!1399930 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95707 (_ BitVec 32)) SeekEntryResult!10521)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95707 (_ BitVec 32)) SeekEntryResult!10521)

(assert (=> b!1399930 (= e!792574 (= (seekEntryOrOpen!0 lt!615835 lt!615836 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126108 lt!615834) (index!44463 lt!615834) (index!44463 lt!615834) (select (arr!46204 a!2901) j!112) lt!615836 mask!2840)))))

(declare-fun b!1399931 () Bool)

(declare-fun e!792575 () Bool)

(assert (=> b!1399931 (= e!792575 (= (seekEntryOrOpen!0 (select (arr!46204 a!2901) j!112) a!2901 mask!2840) (Found!10521 j!112)))))

(declare-fun b!1399932 () Bool)

(declare-fun res!938436 () Bool)

(assert (=> b!1399932 (=> (not res!938436) (not e!792570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399932 (= res!938436 (validKeyInArray!0 (select (arr!46204 a!2901) i!1037)))))

(declare-fun b!1399933 () Bool)

(declare-fun res!938443 () Bool)

(assert (=> b!1399933 (=> (not res!938443) (not e!792570))))

(assert (=> b!1399933 (= res!938443 (validKeyInArray!0 (select (arr!46204 a!2901) j!112)))))

(declare-fun b!1399934 () Bool)

(assert (=> b!1399934 (= e!792570 (not e!792573))))

(declare-fun res!938437 () Bool)

(assert (=> b!1399934 (=> res!938437 e!792573)))

(assert (=> b!1399934 (= res!938437 (or (not (is-Intermediate!10521 lt!615831)) (undefined!11333 lt!615831)))))

(assert (=> b!1399934 e!792575))

(declare-fun res!938440 () Bool)

(assert (=> b!1399934 (=> (not res!938440) (not e!792575))))

(assert (=> b!1399934 (= res!938440 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615833 () Unit!47046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47046)

(assert (=> b!1399934 (= lt!615833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399934 (= lt!615831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615837 (select (arr!46204 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399934 (= lt!615837 (toIndex!0 (select (arr!46204 a!2901) j!112) mask!2840))))

(declare-fun b!1399935 () Bool)

(declare-fun res!938439 () Bool)

(assert (=> b!1399935 (=> (not res!938439) (not e!792570))))

(assert (=> b!1399935 (= res!938439 (and (= (size!46754 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46754 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46754 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120298 res!938444) b!1399935))

(assert (= (and b!1399935 res!938439) b!1399932))

(assert (= (and b!1399932 res!938436) b!1399933))

(assert (= (and b!1399933 res!938443) b!1399928))

(assert (= (and b!1399928 res!938441) b!1399926))

(assert (= (and b!1399926 res!938442) b!1399934))

(assert (= (and b!1399934 res!938440) b!1399931))

(assert (= (and b!1399934 (not res!938437)) b!1399925))

(assert (= (and b!1399925 (not res!938438)) b!1399929))

(assert (= (and b!1399929 res!938445) b!1399930))

(assert (= (and b!1399929 (not res!938446)) b!1399927))

(declare-fun m!1287205 () Bool)

(assert (=> b!1399930 m!1287205))

(declare-fun m!1287207 () Bool)

(assert (=> b!1399930 m!1287207))

(assert (=> b!1399930 m!1287207))

(declare-fun m!1287209 () Bool)

(assert (=> b!1399930 m!1287209))

(assert (=> b!1399931 m!1287207))

(assert (=> b!1399931 m!1287207))

(declare-fun m!1287211 () Bool)

(assert (=> b!1399931 m!1287211))

(declare-fun m!1287213 () Bool)

(assert (=> b!1399932 m!1287213))

(assert (=> b!1399932 m!1287213))

(declare-fun m!1287215 () Bool)

(assert (=> b!1399932 m!1287215))

(declare-fun m!1287217 () Bool)

(assert (=> b!1399927 m!1287217))

(declare-fun m!1287219 () Bool)

(assert (=> b!1399925 m!1287219))

(assert (=> b!1399925 m!1287219))

(declare-fun m!1287221 () Bool)

(assert (=> b!1399925 m!1287221))

(declare-fun m!1287223 () Bool)

(assert (=> b!1399925 m!1287223))

(declare-fun m!1287225 () Bool)

(assert (=> b!1399925 m!1287225))

(declare-fun m!1287227 () Bool)

(assert (=> b!1399926 m!1287227))

(assert (=> b!1399929 m!1287223))

(declare-fun m!1287229 () Bool)

(assert (=> b!1399929 m!1287229))

(declare-fun m!1287231 () Bool)

(assert (=> b!1399929 m!1287231))

(assert (=> b!1399933 m!1287207))

(assert (=> b!1399933 m!1287207))

(declare-fun m!1287233 () Bool)

(assert (=> b!1399933 m!1287233))

(declare-fun m!1287235 () Bool)

(assert (=> b!1399928 m!1287235))

(declare-fun m!1287237 () Bool)

(assert (=> start!120298 m!1287237))

(declare-fun m!1287239 () Bool)

(assert (=> start!120298 m!1287239))

(assert (=> b!1399934 m!1287207))

(declare-fun m!1287241 () Bool)

(assert (=> b!1399934 m!1287241))

(assert (=> b!1399934 m!1287207))

(declare-fun m!1287243 () Bool)

(assert (=> b!1399934 m!1287243))

(declare-fun m!1287245 () Bool)

(assert (=> b!1399934 m!1287245))

(assert (=> b!1399934 m!1287207))

(declare-fun m!1287247 () Bool)

(assert (=> b!1399934 m!1287247))

(push 1)

