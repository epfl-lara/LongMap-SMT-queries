; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129128 () Bool)

(assert start!129128)

(declare-fun b!1515939 () Bool)

(declare-fun e!845873 () Bool)

(declare-fun e!845874 () Bool)

(assert (=> b!1515939 (= e!845873 e!845874)))

(declare-fun res!1036052 () Bool)

(assert (=> b!1515939 (=> (not res!1036052) (not e!845874))))

(declare-datatypes ((SeekEntryResult!12924 0))(
  ( (MissingZero!12924 (index!54091 (_ BitVec 32))) (Found!12924 (index!54092 (_ BitVec 32))) (Intermediate!12924 (undefined!13736 Bool) (index!54093 (_ BitVec 32)) (x!135788 (_ BitVec 32))) (Undefined!12924) (MissingVacant!12924 (index!54094 (_ BitVec 32))) )
))
(declare-fun lt!657053 () SeekEntryResult!12924)

(declare-fun lt!657052 () SeekEntryResult!12924)

(assert (=> b!1515939 (= res!1036052 (= lt!657053 lt!657052))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515939 (= lt!657052 (Intermediate!12924 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100984 0))(
  ( (array!100985 (arr!48730 (Array (_ BitVec 32) (_ BitVec 64))) (size!49282 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515939 (= lt!657053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48730 a!2804) j!70) mask!2512) (select (arr!48730 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515940 () Bool)

(declare-fun res!1036055 () Bool)

(assert (=> b!1515940 (=> (not res!1036055) (not e!845873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100984 (_ BitVec 32)) Bool)

(assert (=> b!1515940 (= res!1036055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515941 () Bool)

(declare-fun res!1036049 () Bool)

(assert (=> b!1515941 (=> (not res!1036049) (not e!845873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515941 (= res!1036049 (validKeyInArray!0 (select (arr!48730 a!2804) j!70)))))

(declare-fun b!1515942 () Bool)

(assert (=> b!1515942 (= e!845874 (not true))))

(declare-fun e!845871 () Bool)

(assert (=> b!1515942 e!845871))

(declare-fun res!1036057 () Bool)

(assert (=> b!1515942 (=> (not res!1036057) (not e!845871))))

(assert (=> b!1515942 (= res!1036057 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50555 0))(
  ( (Unit!50556) )
))
(declare-fun lt!657054 () Unit!50555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50555)

(assert (=> b!1515942 (= lt!657054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515943 () Bool)

(declare-fun res!1036050 () Bool)

(assert (=> b!1515943 (=> (not res!1036050) (not e!845873))))

(declare-datatypes ((List!35291 0))(
  ( (Nil!35288) (Cons!35287 (h!36700 (_ BitVec 64)) (t!49977 List!35291)) )
))
(declare-fun arrayNoDuplicates!0 (array!100984 (_ BitVec 32) List!35291) Bool)

(assert (=> b!1515943 (= res!1036050 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35288))))

(declare-fun b!1515944 () Bool)

(declare-fun res!1036053 () Bool)

(assert (=> b!1515944 (=> (not res!1036053) (not e!845873))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515944 (= res!1036053 (and (= (size!49282 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49282 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49282 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515945 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12924)

(assert (=> b!1515945 (= e!845871 (= (seekEntry!0 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) (Found!12924 j!70)))))

(declare-fun b!1515946 () Bool)

(declare-fun res!1036056 () Bool)

(assert (=> b!1515946 (=> (not res!1036056) (not e!845874))))

(assert (=> b!1515946 (= res!1036056 (= lt!657053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100985 (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49282 a!2804)) mask!2512)))))

(declare-fun b!1515948 () Bool)

(declare-fun res!1036048 () Bool)

(assert (=> b!1515948 (=> (not res!1036048) (not e!845874))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515948 (= res!1036048 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) lt!657052))))

(declare-fun b!1515949 () Bool)

(declare-fun res!1036051 () Bool)

(assert (=> b!1515949 (=> (not res!1036051) (not e!845873))))

(assert (=> b!1515949 (= res!1036051 (validKeyInArray!0 (select (arr!48730 a!2804) i!961)))))

(declare-fun res!1036058 () Bool)

(assert (=> start!129128 (=> (not res!1036058) (not e!845873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129128 (= res!1036058 (validMask!0 mask!2512))))

(assert (=> start!129128 e!845873))

(assert (=> start!129128 true))

(declare-fun array_inv!37963 (array!100984) Bool)

(assert (=> start!129128 (array_inv!37963 a!2804)))

(declare-fun b!1515947 () Bool)

(declare-fun res!1036054 () Bool)

(assert (=> b!1515947 (=> (not res!1036054) (not e!845873))))

(assert (=> b!1515947 (= res!1036054 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49282 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49282 a!2804))))))

(assert (= (and start!129128 res!1036058) b!1515944))

(assert (= (and b!1515944 res!1036053) b!1515949))

(assert (= (and b!1515949 res!1036051) b!1515941))

(assert (= (and b!1515941 res!1036049) b!1515940))

(assert (= (and b!1515940 res!1036055) b!1515943))

(assert (= (and b!1515943 res!1036050) b!1515947))

(assert (= (and b!1515947 res!1036054) b!1515939))

(assert (= (and b!1515939 res!1036052) b!1515948))

(assert (= (and b!1515948 res!1036048) b!1515946))

(assert (= (and b!1515946 res!1036056) b!1515942))

(assert (= (and b!1515942 res!1036057) b!1515945))

(declare-fun m!1398629 () Bool)

(assert (=> b!1515943 m!1398629))

(declare-fun m!1398631 () Bool)

(assert (=> start!129128 m!1398631))

(declare-fun m!1398633 () Bool)

(assert (=> start!129128 m!1398633))

(declare-fun m!1398635 () Bool)

(assert (=> b!1515941 m!1398635))

(assert (=> b!1515941 m!1398635))

(declare-fun m!1398637 () Bool)

(assert (=> b!1515941 m!1398637))

(declare-fun m!1398639 () Bool)

(assert (=> b!1515949 m!1398639))

(assert (=> b!1515949 m!1398639))

(declare-fun m!1398641 () Bool)

(assert (=> b!1515949 m!1398641))

(assert (=> b!1515939 m!1398635))

(assert (=> b!1515939 m!1398635))

(declare-fun m!1398643 () Bool)

(assert (=> b!1515939 m!1398643))

(assert (=> b!1515939 m!1398643))

(assert (=> b!1515939 m!1398635))

(declare-fun m!1398645 () Bool)

(assert (=> b!1515939 m!1398645))

(assert (=> b!1515945 m!1398635))

(assert (=> b!1515945 m!1398635))

(declare-fun m!1398647 () Bool)

(assert (=> b!1515945 m!1398647))

(declare-fun m!1398649 () Bool)

(assert (=> b!1515946 m!1398649))

(declare-fun m!1398651 () Bool)

(assert (=> b!1515946 m!1398651))

(assert (=> b!1515946 m!1398651))

(declare-fun m!1398653 () Bool)

(assert (=> b!1515946 m!1398653))

(assert (=> b!1515946 m!1398653))

(assert (=> b!1515946 m!1398651))

(declare-fun m!1398655 () Bool)

(assert (=> b!1515946 m!1398655))

(declare-fun m!1398657 () Bool)

(assert (=> b!1515942 m!1398657))

(declare-fun m!1398659 () Bool)

(assert (=> b!1515942 m!1398659))

(assert (=> b!1515948 m!1398635))

(assert (=> b!1515948 m!1398635))

(declare-fun m!1398661 () Bool)

(assert (=> b!1515948 m!1398661))

(declare-fun m!1398663 () Bool)

(assert (=> b!1515940 m!1398663))

(check-sat (not b!1515945) (not b!1515949) (not b!1515939) (not b!1515941) (not start!129128) (not b!1515940) (not b!1515943) (not b!1515946) (not b!1515942) (not b!1515948))
(check-sat)
