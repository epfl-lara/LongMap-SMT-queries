; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121994 () Bool)

(assert start!121994)

(declare-fun b!1415880 () Bool)

(declare-fun e!801382 () Bool)

(assert (=> b!1415880 (= e!801382 true)))

(declare-datatypes ((SeekEntryResult!10985 0))(
  ( (MissingZero!10985 (index!46332 (_ BitVec 32))) (Found!10985 (index!46333 (_ BitVec 32))) (Intermediate!10985 (undefined!11797 Bool) (index!46334 (_ BitVec 32)) (x!127933 (_ BitVec 32))) (Undefined!10985) (MissingVacant!10985 (index!46335 (_ BitVec 32))) )
))
(declare-fun lt!624331 () SeekEntryResult!10985)

(declare-fun lt!624323 () SeekEntryResult!10985)

(assert (=> b!1415880 (= lt!624331 lt!624323)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624326 () SeekEntryResult!10985)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!624328 () (_ BitVec 32))

(declare-datatypes ((Unit!47787 0))(
  ( (Unit!47788) )
))
(declare-fun lt!624332 () Unit!47787)

(declare-datatypes ((array!96633 0))(
  ( (array!96634 (arr!46648 (Array (_ BitVec 32) (_ BitVec 64))) (size!47200 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96633)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!624324 () SeekEntryResult!10985)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47787)

(assert (=> b!1415880 (= lt!624332 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624328 (x!127933 lt!624324) (index!46334 lt!624324) (x!127933 lt!624326) (index!46334 lt!624326) mask!2840))))

(declare-fun b!1415881 () Bool)

(declare-fun res!951979 () Bool)

(declare-fun e!801380 () Bool)

(assert (=> b!1415881 (=> (not res!951979) (not e!801380))))

(declare-datatypes ((List!33245 0))(
  ( (Nil!33242) (Cons!33241 (h!34528 (_ BitVec 64)) (t!47931 List!33245)) )
))
(declare-fun arrayNoDuplicates!0 (array!96633 (_ BitVec 32) List!33245) Bool)

(assert (=> b!1415881 (= res!951979 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33242))))

(declare-fun b!1415882 () Bool)

(declare-fun e!801381 () Bool)

(assert (=> b!1415882 (= e!801381 e!801382)))

(declare-fun res!951982 () Bool)

(assert (=> b!1415882 (=> res!951982 e!801382)))

(assert (=> b!1415882 (= res!951982 (or (bvslt (x!127933 lt!624324) #b00000000000000000000000000000000) (bvsgt (x!127933 lt!624324) #b01111111111111111111111111111110) (bvslt (x!127933 lt!624326) #b00000000000000000000000000000000) (bvsgt (x!127933 lt!624326) #b01111111111111111111111111111110) (bvslt lt!624328 #b00000000000000000000000000000000) (bvsge lt!624328 (size!47200 a!2901)) (bvslt (index!46334 lt!624324) #b00000000000000000000000000000000) (bvsge (index!46334 lt!624324) (size!47200 a!2901)) (bvslt (index!46334 lt!624326) #b00000000000000000000000000000000) (bvsge (index!46334 lt!624326) (size!47200 a!2901)) (not (= lt!624324 (Intermediate!10985 false (index!46334 lt!624324) (x!127933 lt!624324)))) (not (= lt!624326 (Intermediate!10985 false (index!46334 lt!624326) (x!127933 lt!624326))))))))

(declare-fun lt!624325 () array!96633)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96633 (_ BitVec 32)) SeekEntryResult!10985)

(assert (=> b!1415882 (= lt!624323 (seekKeyOrZeroReturnVacant!0 (x!127933 lt!624326) (index!46334 lt!624326) (index!46334 lt!624326) (select (arr!46648 a!2901) j!112) lt!624325 mask!2840))))

(declare-fun lt!624330 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96633 (_ BitVec 32)) SeekEntryResult!10985)

(assert (=> b!1415882 (= lt!624323 (seekEntryOrOpen!0 lt!624330 lt!624325 mask!2840))))

(assert (=> b!1415882 (and (not (undefined!11797 lt!624326)) (= (index!46334 lt!624326) i!1037) (bvslt (x!127933 lt!624326) (x!127933 lt!624324)) (= (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46334 lt!624326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624329 () Unit!47787)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47787)

(assert (=> b!1415882 (= lt!624329 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624328 (x!127933 lt!624324) (index!46334 lt!624324) (x!127933 lt!624326) (index!46334 lt!624326) (undefined!11797 lt!624326) mask!2840))))

(declare-fun b!1415883 () Bool)

(declare-fun res!951980 () Bool)

(assert (=> b!1415883 (=> (not res!951980) (not e!801380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415883 (= res!951980 (validKeyInArray!0 (select (arr!46648 a!2901) i!1037)))))

(declare-fun b!1415884 () Bool)

(declare-fun e!801379 () Bool)

(assert (=> b!1415884 (= e!801380 (not e!801379))))

(declare-fun res!951981 () Bool)

(assert (=> b!1415884 (=> res!951981 e!801379)))

(get-info :version)

(assert (=> b!1415884 (= res!951981 (or (not ((_ is Intermediate!10985) lt!624324)) (undefined!11797 lt!624324)))))

(assert (=> b!1415884 (= lt!624331 (Found!10985 j!112))))

(assert (=> b!1415884 (= lt!624331 (seekEntryOrOpen!0 (select (arr!46648 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96633 (_ BitVec 32)) Bool)

(assert (=> b!1415884 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624327 () Unit!47787)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47787)

(assert (=> b!1415884 (= lt!624327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96633 (_ BitVec 32)) SeekEntryResult!10985)

(assert (=> b!1415884 (= lt!624324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624328 (select (arr!46648 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415884 (= lt!624328 (toIndex!0 (select (arr!46648 a!2901) j!112) mask!2840))))

(declare-fun b!1415885 () Bool)

(assert (=> b!1415885 (= e!801379 e!801381)))

(declare-fun res!951976 () Bool)

(assert (=> b!1415885 (=> res!951976 e!801381)))

(assert (=> b!1415885 (= res!951976 (or (= lt!624324 lt!624326) (not ((_ is Intermediate!10985) lt!624326))))))

(assert (=> b!1415885 (= lt!624326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624330 mask!2840) lt!624330 lt!624325 mask!2840))))

(assert (=> b!1415885 (= lt!624330 (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415885 (= lt!624325 (array!96634 (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47200 a!2901)))))

(declare-fun b!1415886 () Bool)

(declare-fun res!951975 () Bool)

(assert (=> b!1415886 (=> (not res!951975) (not e!801380))))

(assert (=> b!1415886 (= res!951975 (validKeyInArray!0 (select (arr!46648 a!2901) j!112)))))

(declare-fun b!1415887 () Bool)

(declare-fun res!951974 () Bool)

(assert (=> b!1415887 (=> (not res!951974) (not e!801380))))

(assert (=> b!1415887 (= res!951974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415889 () Bool)

(declare-fun res!951978 () Bool)

(assert (=> b!1415889 (=> res!951978 e!801382)))

(assert (=> b!1415889 (= res!951978 (not (= lt!624326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624328 lt!624330 lt!624325 mask!2840))))))

(declare-fun res!951973 () Bool)

(assert (=> start!121994 (=> (not res!951973) (not e!801380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121994 (= res!951973 (validMask!0 mask!2840))))

(assert (=> start!121994 e!801380))

(assert (=> start!121994 true))

(declare-fun array_inv!35881 (array!96633) Bool)

(assert (=> start!121994 (array_inv!35881 a!2901)))

(declare-fun b!1415888 () Bool)

(declare-fun res!951977 () Bool)

(assert (=> b!1415888 (=> (not res!951977) (not e!801380))))

(assert (=> b!1415888 (= res!951977 (and (= (size!47200 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47200 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47200 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121994 res!951973) b!1415888))

(assert (= (and b!1415888 res!951977) b!1415883))

(assert (= (and b!1415883 res!951980) b!1415886))

(assert (= (and b!1415886 res!951975) b!1415887))

(assert (= (and b!1415887 res!951974) b!1415881))

(assert (= (and b!1415881 res!951979) b!1415884))

(assert (= (and b!1415884 (not res!951981)) b!1415885))

(assert (= (and b!1415885 (not res!951976)) b!1415882))

(assert (= (and b!1415882 (not res!951982)) b!1415889))

(assert (= (and b!1415889 (not res!951978)) b!1415880))

(declare-fun m!1305895 () Bool)

(assert (=> b!1415885 m!1305895))

(assert (=> b!1415885 m!1305895))

(declare-fun m!1305897 () Bool)

(assert (=> b!1415885 m!1305897))

(declare-fun m!1305899 () Bool)

(assert (=> b!1415885 m!1305899))

(declare-fun m!1305901 () Bool)

(assert (=> b!1415885 m!1305901))

(declare-fun m!1305903 () Bool)

(assert (=> b!1415887 m!1305903))

(declare-fun m!1305905 () Bool)

(assert (=> b!1415884 m!1305905))

(declare-fun m!1305907 () Bool)

(assert (=> b!1415884 m!1305907))

(assert (=> b!1415884 m!1305905))

(declare-fun m!1305909 () Bool)

(assert (=> b!1415884 m!1305909))

(assert (=> b!1415884 m!1305905))

(declare-fun m!1305911 () Bool)

(assert (=> b!1415884 m!1305911))

(assert (=> b!1415884 m!1305905))

(declare-fun m!1305913 () Bool)

(assert (=> b!1415884 m!1305913))

(declare-fun m!1305915 () Bool)

(assert (=> b!1415884 m!1305915))

(declare-fun m!1305917 () Bool)

(assert (=> b!1415881 m!1305917))

(declare-fun m!1305919 () Bool)

(assert (=> b!1415880 m!1305919))

(assert (=> b!1415886 m!1305905))

(assert (=> b!1415886 m!1305905))

(declare-fun m!1305921 () Bool)

(assert (=> b!1415886 m!1305921))

(declare-fun m!1305923 () Bool)

(assert (=> start!121994 m!1305923))

(declare-fun m!1305925 () Bool)

(assert (=> start!121994 m!1305925))

(declare-fun m!1305927 () Bool)

(assert (=> b!1415889 m!1305927))

(declare-fun m!1305929 () Bool)

(assert (=> b!1415883 m!1305929))

(assert (=> b!1415883 m!1305929))

(declare-fun m!1305931 () Bool)

(assert (=> b!1415883 m!1305931))

(assert (=> b!1415882 m!1305905))

(assert (=> b!1415882 m!1305905))

(declare-fun m!1305933 () Bool)

(assert (=> b!1415882 m!1305933))

(declare-fun m!1305935 () Bool)

(assert (=> b!1415882 m!1305935))

(declare-fun m!1305937 () Bool)

(assert (=> b!1415882 m!1305937))

(assert (=> b!1415882 m!1305899))

(declare-fun m!1305939 () Bool)

(assert (=> b!1415882 m!1305939))

(check-sat (not b!1415883) (not b!1415884) (not b!1415887) (not start!121994) (not b!1415886) (not b!1415881) (not b!1415889) (not b!1415882) (not b!1415880) (not b!1415885))
(check-sat)
