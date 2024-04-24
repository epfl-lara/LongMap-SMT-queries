; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130926 () Bool)

(assert start!130926)

(declare-fun b!1534375 () Bool)

(declare-fun res!1050041 () Bool)

(declare-fun e!855073 () Bool)

(assert (=> b!1534375 (=> (not res!1050041) (not e!855073))))

(declare-datatypes ((array!101842 0))(
  ( (array!101843 (arr!49135 (Array (_ BitVec 32) (_ BitVec 64))) (size!49686 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101842)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534375 (= res!1050041 (validKeyInArray!0 (select (arr!49135 a!2804) j!70)))))

(declare-fun b!1534376 () Bool)

(declare-fun res!1050038 () Bool)

(assert (=> b!1534376 (=> (not res!1050038) (not e!855073))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1534376 (= res!1050038 (and (= (size!49686 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49686 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49686 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1534377 () Bool)

(declare-fun res!1050035 () Bool)

(assert (=> b!1534377 (=> (not res!1050035) (not e!855073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101842 (_ BitVec 32)) Bool)

(assert (=> b!1534377 (= res!1050035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1534378 () Bool)

(declare-fun e!855070 () Bool)

(assert (=> b!1534378 (= e!855073 e!855070)))

(declare-fun res!1050029 () Bool)

(assert (=> b!1534378 (=> (not res!1050029) (not e!855070))))

(declare-datatypes ((SeekEntryResult!13193 0))(
  ( (MissingZero!13193 (index!55167 (_ BitVec 32))) (Found!13193 (index!55168 (_ BitVec 32))) (Intermediate!13193 (undefined!14005 Bool) (index!55169 (_ BitVec 32)) (x!137074 (_ BitVec 32))) (Undefined!13193) (MissingVacant!13193 (index!55170 (_ BitVec 32))) )
))
(declare-fun lt!664405 () SeekEntryResult!13193)

(declare-fun lt!664401 () SeekEntryResult!13193)

(assert (=> b!1534378 (= res!1050029 (= lt!664405 lt!664401))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1534378 (= lt!664401 (Intermediate!13193 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101842 (_ BitVec 32)) SeekEntryResult!13193)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534378 (= lt!664405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49135 a!2804) j!70) mask!2512) (select (arr!49135 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1534379 () Bool)

(declare-fun e!855072 () Bool)

(assert (=> b!1534379 (= e!855070 e!855072)))

(declare-fun res!1050040 () Bool)

(assert (=> b!1534379 (=> (not res!1050040) (not e!855072))))

(declare-fun lt!664403 () array!101842)

(declare-fun lt!664406 () (_ BitVec 64))

(assert (=> b!1534379 (= res!1050040 (= lt!664405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!664406 mask!2512) lt!664406 lt!664403 mask!2512)))))

(assert (=> b!1534379 (= lt!664406 (select (store (arr!49135 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1534379 (= lt!664403 (array!101843 (store (arr!49135 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49686 a!2804)))))

(declare-fun b!1534380 () Bool)

(declare-fun e!855075 () Bool)

(assert (=> b!1534380 (= e!855072 (not e!855075))))

(declare-fun res!1050032 () Bool)

(assert (=> b!1534380 (=> res!1050032 e!855075)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1534380 (= res!1050032 (or (not (= (select (arr!49135 a!2804) j!70) lt!664406)) (= x!534 resX!21)))))

(declare-fun e!855074 () Bool)

(assert (=> b!1534380 e!855074))

(declare-fun res!1050037 () Bool)

(assert (=> b!1534380 (=> (not res!1050037) (not e!855074))))

(assert (=> b!1534380 (= res!1050037 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51205 0))(
  ( (Unit!51206) )
))
(declare-fun lt!664402 () Unit!51205)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51205)

(assert (=> b!1534380 (= lt!664402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1534382 () Bool)

(declare-fun res!1050042 () Bool)

(assert (=> b!1534382 (=> (not res!1050042) (not e!855073))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1534382 (= res!1050042 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49686 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49686 a!2804))))))

(declare-fun b!1534383 () Bool)

(declare-fun res!1050039 () Bool)

(declare-fun e!855076 () Bool)

(assert (=> b!1534383 (=> res!1050039 e!855076)))

(declare-fun lt!664404 () (_ BitVec 32))

(assert (=> b!1534383 (= res!1050039 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664404 (select (arr!49135 a!2804) j!70) a!2804 mask!2512) lt!664401)))))

(declare-fun b!1534384 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101842 (_ BitVec 32)) SeekEntryResult!13193)

(assert (=> b!1534384 (= e!855074 (= (seekEntry!0 (select (arr!49135 a!2804) j!70) a!2804 mask!2512) (Found!13193 j!70)))))

(declare-fun b!1534385 () Bool)

(declare-fun res!1050031 () Bool)

(assert (=> b!1534385 (=> (not res!1050031) (not e!855073))))

(declare-datatypes ((List!35605 0))(
  ( (Nil!35602) (Cons!35601 (h!37064 (_ BitVec 64)) (t!50291 List!35605)) )
))
(declare-fun arrayNoDuplicates!0 (array!101842 (_ BitVec 32) List!35605) Bool)

(assert (=> b!1534385 (= res!1050031 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35602))))

(declare-fun b!1534386 () Bool)

(declare-fun res!1050030 () Bool)

(assert (=> b!1534386 (=> (not res!1050030) (not e!855070))))

(assert (=> b!1534386 (= res!1050030 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49135 a!2804) j!70) a!2804 mask!2512) lt!664401))))

(declare-fun b!1534387 () Bool)

(declare-fun res!1050036 () Bool)

(assert (=> b!1534387 (=> (not res!1050036) (not e!855073))))

(assert (=> b!1534387 (= res!1050036 (validKeyInArray!0 (select (arr!49135 a!2804) i!961)))))

(declare-fun b!1534388 () Bool)

(assert (=> b!1534388 (= e!855076 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101842 (_ BitVec 32)) SeekEntryResult!13193)

(assert (=> b!1534388 (= (seekEntryOrOpen!0 (select (arr!49135 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!664406 lt!664403 mask!2512))))

(declare-fun lt!664407 () Unit!51205)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51205)

(assert (=> b!1534388 (= lt!664407 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!664404 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1534381 () Bool)

(assert (=> b!1534381 (= e!855075 e!855076)))

(declare-fun res!1050034 () Bool)

(assert (=> b!1534381 (=> res!1050034 e!855076)))

(assert (=> b!1534381 (= res!1050034 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664404 #b00000000000000000000000000000000) (bvsge lt!664404 (size!49686 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534381 (= lt!664404 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1050033 () Bool)

(assert (=> start!130926 (=> (not res!1050033) (not e!855073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130926 (= res!1050033 (validMask!0 mask!2512))))

(assert (=> start!130926 e!855073))

(assert (=> start!130926 true))

(declare-fun array_inv!38416 (array!101842) Bool)

(assert (=> start!130926 (array_inv!38416 a!2804)))

(assert (= (and start!130926 res!1050033) b!1534376))

(assert (= (and b!1534376 res!1050038) b!1534387))

(assert (= (and b!1534387 res!1050036) b!1534375))

(assert (= (and b!1534375 res!1050041) b!1534377))

(assert (= (and b!1534377 res!1050035) b!1534385))

(assert (= (and b!1534385 res!1050031) b!1534382))

(assert (= (and b!1534382 res!1050042) b!1534378))

(assert (= (and b!1534378 res!1050029) b!1534386))

(assert (= (and b!1534386 res!1050030) b!1534379))

(assert (= (and b!1534379 res!1050040) b!1534380))

(assert (= (and b!1534380 res!1050037) b!1534384))

(assert (= (and b!1534380 (not res!1050032)) b!1534381))

(assert (= (and b!1534381 (not res!1050034)) b!1534383))

(assert (= (and b!1534383 (not res!1050039)) b!1534388))

(declare-fun m!1416931 () Bool)

(assert (=> b!1534388 m!1416931))

(assert (=> b!1534388 m!1416931))

(declare-fun m!1416933 () Bool)

(assert (=> b!1534388 m!1416933))

(declare-fun m!1416935 () Bool)

(assert (=> b!1534388 m!1416935))

(declare-fun m!1416937 () Bool)

(assert (=> b!1534388 m!1416937))

(declare-fun m!1416939 () Bool)

(assert (=> b!1534387 m!1416939))

(assert (=> b!1534387 m!1416939))

(declare-fun m!1416941 () Bool)

(assert (=> b!1534387 m!1416941))

(assert (=> b!1534375 m!1416931))

(assert (=> b!1534375 m!1416931))

(declare-fun m!1416943 () Bool)

(assert (=> b!1534375 m!1416943))

(declare-fun m!1416945 () Bool)

(assert (=> b!1534379 m!1416945))

(assert (=> b!1534379 m!1416945))

(declare-fun m!1416947 () Bool)

(assert (=> b!1534379 m!1416947))

(declare-fun m!1416949 () Bool)

(assert (=> b!1534379 m!1416949))

(declare-fun m!1416951 () Bool)

(assert (=> b!1534379 m!1416951))

(assert (=> b!1534386 m!1416931))

(assert (=> b!1534386 m!1416931))

(declare-fun m!1416953 () Bool)

(assert (=> b!1534386 m!1416953))

(declare-fun m!1416955 () Bool)

(assert (=> b!1534377 m!1416955))

(declare-fun m!1416957 () Bool)

(assert (=> b!1534381 m!1416957))

(declare-fun m!1416959 () Bool)

(assert (=> b!1534385 m!1416959))

(assert (=> b!1534378 m!1416931))

(assert (=> b!1534378 m!1416931))

(declare-fun m!1416961 () Bool)

(assert (=> b!1534378 m!1416961))

(assert (=> b!1534378 m!1416961))

(assert (=> b!1534378 m!1416931))

(declare-fun m!1416963 () Bool)

(assert (=> b!1534378 m!1416963))

(assert (=> b!1534380 m!1416931))

(declare-fun m!1416965 () Bool)

(assert (=> b!1534380 m!1416965))

(declare-fun m!1416967 () Bool)

(assert (=> b!1534380 m!1416967))

(declare-fun m!1416969 () Bool)

(assert (=> start!130926 m!1416969))

(declare-fun m!1416971 () Bool)

(assert (=> start!130926 m!1416971))

(assert (=> b!1534384 m!1416931))

(assert (=> b!1534384 m!1416931))

(declare-fun m!1416973 () Bool)

(assert (=> b!1534384 m!1416973))

(assert (=> b!1534383 m!1416931))

(assert (=> b!1534383 m!1416931))

(declare-fun m!1416975 () Bool)

(assert (=> b!1534383 m!1416975))

(check-sat (not b!1534375) (not b!1534386) (not b!1534385) (not b!1534379) (not b!1534387) (not b!1534381) (not b!1534388) (not start!130926) (not b!1534378) (not b!1534380) (not b!1534377) (not b!1534384) (not b!1534383))
(check-sat)
