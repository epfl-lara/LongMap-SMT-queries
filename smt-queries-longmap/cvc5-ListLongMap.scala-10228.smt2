; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120420 () Bool)

(assert start!120420)

(declare-fun b!1401938 () Bool)

(declare-fun e!793852 () Bool)

(declare-fun e!793856 () Bool)

(assert (=> b!1401938 (= e!793852 (not e!793856))))

(declare-fun res!940451 () Bool)

(assert (=> b!1401938 (=> res!940451 e!793856)))

(declare-datatypes ((SeekEntryResult!10582 0))(
  ( (MissingZero!10582 (index!44705 (_ BitVec 32))) (Found!10582 (index!44706 (_ BitVec 32))) (Intermediate!10582 (undefined!11394 Bool) (index!44707 (_ BitVec 32)) (x!126337 (_ BitVec 32))) (Undefined!10582) (MissingVacant!10582 (index!44708 (_ BitVec 32))) )
))
(declare-fun lt!617296 () SeekEntryResult!10582)

(assert (=> b!1401938 (= res!940451 (or (not (is-Intermediate!10582 lt!617296)) (undefined!11394 lt!617296)))))

(declare-fun e!793851 () Bool)

(assert (=> b!1401938 e!793851))

(declare-fun res!940456 () Bool)

(assert (=> b!1401938 (=> (not res!940456) (not e!793851))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95829 0))(
  ( (array!95830 (arr!46265 (Array (_ BitVec 32) (_ BitVec 64))) (size!46815 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95829)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95829 (_ BitVec 32)) Bool)

(assert (=> b!1401938 (= res!940456 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47168 0))(
  ( (Unit!47169) )
))
(declare-fun lt!617297 () Unit!47168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47168)

(assert (=> b!1401938 (= lt!617297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617299 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95829 (_ BitVec 32)) SeekEntryResult!10582)

(assert (=> b!1401938 (= lt!617296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617299 (select (arr!46265 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401938 (= lt!617299 (toIndex!0 (select (arr!46265 a!2901) j!112) mask!2840))))

(declare-fun b!1401939 () Bool)

(declare-fun e!793850 () Bool)

(assert (=> b!1401939 (= e!793850 true)))

(declare-fun lt!617294 () array!95829)

(declare-fun lt!617298 () (_ BitVec 64))

(declare-fun lt!617301 () SeekEntryResult!10582)

(assert (=> b!1401939 (= lt!617301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617299 lt!617298 lt!617294 mask!2840))))

(declare-fun b!1401940 () Bool)

(declare-fun res!940457 () Bool)

(assert (=> b!1401940 (=> (not res!940457) (not e!793852))))

(declare-datatypes ((List!32784 0))(
  ( (Nil!32781) (Cons!32780 (h!34028 (_ BitVec 64)) (t!47478 List!32784)) )
))
(declare-fun arrayNoDuplicates!0 (array!95829 (_ BitVec 32) List!32784) Bool)

(assert (=> b!1401940 (= res!940457 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32781))))

(declare-fun b!1401941 () Bool)

(declare-fun res!940453 () Bool)

(assert (=> b!1401941 (=> (not res!940453) (not e!793852))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401941 (= res!940453 (and (= (size!46815 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46815 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46815 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401942 () Bool)

(declare-fun e!793854 () Bool)

(assert (=> b!1401942 (= e!793854 e!793850)))

(declare-fun res!940452 () Bool)

(assert (=> b!1401942 (=> res!940452 e!793850)))

(declare-fun lt!617295 () SeekEntryResult!10582)

(assert (=> b!1401942 (= res!940452 (or (bvslt (x!126337 lt!617296) #b00000000000000000000000000000000) (bvsgt (x!126337 lt!617296) #b01111111111111111111111111111110) (bvslt (x!126337 lt!617295) #b00000000000000000000000000000000) (bvsgt (x!126337 lt!617295) #b01111111111111111111111111111110) (bvslt lt!617299 #b00000000000000000000000000000000) (bvsge lt!617299 (size!46815 a!2901)) (bvslt (index!44707 lt!617296) #b00000000000000000000000000000000) (bvsge (index!44707 lt!617296) (size!46815 a!2901)) (bvslt (index!44707 lt!617295) #b00000000000000000000000000000000) (bvsge (index!44707 lt!617295) (size!46815 a!2901)) (not (= lt!617296 (Intermediate!10582 false (index!44707 lt!617296) (x!126337 lt!617296)))) (not (= lt!617295 (Intermediate!10582 false (index!44707 lt!617295) (x!126337 lt!617295))))))))

(declare-fun e!793855 () Bool)

(assert (=> b!1401942 e!793855))

(declare-fun res!940455 () Bool)

(assert (=> b!1401942 (=> (not res!940455) (not e!793855))))

(assert (=> b!1401942 (= res!940455 (and (not (undefined!11394 lt!617295)) (= (index!44707 lt!617295) i!1037) (bvslt (x!126337 lt!617295) (x!126337 lt!617296)) (= (select (store (arr!46265 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44707 lt!617295)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617300 () Unit!47168)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47168)

(assert (=> b!1401942 (= lt!617300 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617299 (x!126337 lt!617296) (index!44707 lt!617296) (x!126337 lt!617295) (index!44707 lt!617295) (undefined!11394 lt!617295) mask!2840))))

(declare-fun b!1401943 () Bool)

(declare-fun res!940454 () Bool)

(assert (=> b!1401943 (=> (not res!940454) (not e!793852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401943 (= res!940454 (validKeyInArray!0 (select (arr!46265 a!2901) i!1037)))))

(declare-fun b!1401944 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95829 (_ BitVec 32)) SeekEntryResult!10582)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95829 (_ BitVec 32)) SeekEntryResult!10582)

(assert (=> b!1401944 (= e!793855 (= (seekEntryOrOpen!0 lt!617298 lt!617294 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126337 lt!617295) (index!44707 lt!617295) (index!44707 lt!617295) (select (arr!46265 a!2901) j!112) lt!617294 mask!2840)))))

(declare-fun b!1401945 () Bool)

(declare-fun res!940459 () Bool)

(assert (=> b!1401945 (=> (not res!940459) (not e!793852))))

(assert (=> b!1401945 (= res!940459 (validKeyInArray!0 (select (arr!46265 a!2901) j!112)))))

(declare-fun b!1401947 () Bool)

(assert (=> b!1401947 (= e!793851 (= (seekEntryOrOpen!0 (select (arr!46265 a!2901) j!112) a!2901 mask!2840) (Found!10582 j!112)))))

(declare-fun b!1401948 () Bool)

(assert (=> b!1401948 (= e!793856 e!793854)))

(declare-fun res!940450 () Bool)

(assert (=> b!1401948 (=> res!940450 e!793854)))

(assert (=> b!1401948 (= res!940450 (or (= lt!617296 lt!617295) (not (is-Intermediate!10582 lt!617295))))))

(assert (=> b!1401948 (= lt!617295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617298 mask!2840) lt!617298 lt!617294 mask!2840))))

(assert (=> b!1401948 (= lt!617298 (select (store (arr!46265 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401948 (= lt!617294 (array!95830 (store (arr!46265 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46815 a!2901)))))

(declare-fun b!1401946 () Bool)

(declare-fun res!940458 () Bool)

(assert (=> b!1401946 (=> (not res!940458) (not e!793852))))

(assert (=> b!1401946 (= res!940458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940449 () Bool)

(assert (=> start!120420 (=> (not res!940449) (not e!793852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120420 (= res!940449 (validMask!0 mask!2840))))

(assert (=> start!120420 e!793852))

(assert (=> start!120420 true))

(declare-fun array_inv!35293 (array!95829) Bool)

(assert (=> start!120420 (array_inv!35293 a!2901)))

(assert (= (and start!120420 res!940449) b!1401941))

(assert (= (and b!1401941 res!940453) b!1401943))

(assert (= (and b!1401943 res!940454) b!1401945))

(assert (= (and b!1401945 res!940459) b!1401946))

(assert (= (and b!1401946 res!940458) b!1401940))

(assert (= (and b!1401940 res!940457) b!1401938))

(assert (= (and b!1401938 res!940456) b!1401947))

(assert (= (and b!1401938 (not res!940451)) b!1401948))

(assert (= (and b!1401948 (not res!940450)) b!1401942))

(assert (= (and b!1401942 res!940455) b!1401944))

(assert (= (and b!1401942 (not res!940452)) b!1401939))

(declare-fun m!1289889 () Bool)

(assert (=> b!1401947 m!1289889))

(assert (=> b!1401947 m!1289889))

(declare-fun m!1289891 () Bool)

(assert (=> b!1401947 m!1289891))

(declare-fun m!1289893 () Bool)

(assert (=> start!120420 m!1289893))

(declare-fun m!1289895 () Bool)

(assert (=> start!120420 m!1289895))

(declare-fun m!1289897 () Bool)

(assert (=> b!1401942 m!1289897))

(declare-fun m!1289899 () Bool)

(assert (=> b!1401942 m!1289899))

(declare-fun m!1289901 () Bool)

(assert (=> b!1401942 m!1289901))

(declare-fun m!1289903 () Bool)

(assert (=> b!1401946 m!1289903))

(declare-fun m!1289905 () Bool)

(assert (=> b!1401939 m!1289905))

(declare-fun m!1289907 () Bool)

(assert (=> b!1401944 m!1289907))

(assert (=> b!1401944 m!1289889))

(assert (=> b!1401944 m!1289889))

(declare-fun m!1289909 () Bool)

(assert (=> b!1401944 m!1289909))

(declare-fun m!1289911 () Bool)

(assert (=> b!1401940 m!1289911))

(assert (=> b!1401938 m!1289889))

(declare-fun m!1289913 () Bool)

(assert (=> b!1401938 m!1289913))

(assert (=> b!1401938 m!1289889))

(declare-fun m!1289915 () Bool)

(assert (=> b!1401938 m!1289915))

(assert (=> b!1401938 m!1289889))

(declare-fun m!1289917 () Bool)

(assert (=> b!1401938 m!1289917))

(declare-fun m!1289919 () Bool)

(assert (=> b!1401938 m!1289919))

(declare-fun m!1289921 () Bool)

(assert (=> b!1401943 m!1289921))

(assert (=> b!1401943 m!1289921))

(declare-fun m!1289923 () Bool)

(assert (=> b!1401943 m!1289923))

(assert (=> b!1401945 m!1289889))

(assert (=> b!1401945 m!1289889))

(declare-fun m!1289925 () Bool)

(assert (=> b!1401945 m!1289925))

(declare-fun m!1289927 () Bool)

(assert (=> b!1401948 m!1289927))

(assert (=> b!1401948 m!1289927))

(declare-fun m!1289929 () Bool)

(assert (=> b!1401948 m!1289929))

(assert (=> b!1401948 m!1289897))

(declare-fun m!1289931 () Bool)

(assert (=> b!1401948 m!1289931))

(push 1)

