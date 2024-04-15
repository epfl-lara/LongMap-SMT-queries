; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130398 () Bool)

(assert start!130398)

(declare-fun b!1530721 () Bool)

(declare-fun res!1048252 () Bool)

(declare-fun e!852915 () Bool)

(assert (=> b!1530721 (=> (not res!1048252) (not e!852915))))

(declare-datatypes ((array!101632 0))(
  ( (array!101633 (arr!49039 (Array (_ BitVec 32) (_ BitVec 64))) (size!49591 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101632)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530721 (= res!1048252 (validKeyInArray!0 (select (arr!49039 a!2804) i!961)))))

(declare-fun b!1530722 () Bool)

(declare-fun e!852911 () Bool)

(declare-fun e!852912 () Bool)

(assert (=> b!1530722 (= e!852911 e!852912)))

(declare-fun res!1048253 () Bool)

(assert (=> b!1530722 (=> res!1048253 e!852912)))

(declare-fun lt!662780 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530722 (= res!1048253 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!662780 #b00000000000000000000000000000000) (bvsge lt!662780 (size!49591 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530722 (= lt!662780 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530723 () Bool)

(declare-fun res!1048246 () Bool)

(assert (=> b!1530723 (=> (not res!1048246) (not e!852915))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1530723 (= res!1048246 (validKeyInArray!0 (select (arr!49039 a!2804) j!70)))))

(declare-fun b!1530724 () Bool)

(declare-fun res!1048254 () Bool)

(declare-fun e!852914 () Bool)

(assert (=> b!1530724 (=> (not res!1048254) (not e!852914))))

(declare-datatypes ((SeekEntryResult!13227 0))(
  ( (MissingZero!13227 (index!55303 (_ BitVec 32))) (Found!13227 (index!55304 (_ BitVec 32))) (Intermediate!13227 (undefined!14039 Bool) (index!55305 (_ BitVec 32)) (x!136999 (_ BitVec 32))) (Undefined!13227) (MissingVacant!13227 (index!55306 (_ BitVec 32))) )
))
(declare-fun lt!662779 () SeekEntryResult!13227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530724 (= res!1048254 (= lt!662779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)) mask!2512)))))

(declare-fun b!1530725 () Bool)

(declare-fun e!852913 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13227)

(assert (=> b!1530725 (= e!852913 (= (seekEntry!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) (Found!13227 j!70)))))

(declare-fun res!1048248 () Bool)

(assert (=> start!130398 (=> (not res!1048248) (not e!852915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130398 (= res!1048248 (validMask!0 mask!2512))))

(assert (=> start!130398 e!852915))

(assert (=> start!130398 true))

(declare-fun array_inv!38272 (array!101632) Bool)

(assert (=> start!130398 (array_inv!38272 a!2804)))

(declare-fun b!1530726 () Bool)

(assert (=> b!1530726 (= e!852915 e!852914)))

(declare-fun res!1048257 () Bool)

(assert (=> b!1530726 (=> (not res!1048257) (not e!852914))))

(declare-fun lt!662778 () SeekEntryResult!13227)

(assert (=> b!1530726 (= res!1048257 (= lt!662779 lt!662778))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530726 (= lt!662778 (Intermediate!13227 false resIndex!21 resX!21))))

(assert (=> b!1530726 (= lt!662779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530727 () Bool)

(declare-fun res!1048251 () Bool)

(assert (=> b!1530727 (=> (not res!1048251) (not e!852915))))

(assert (=> b!1530727 (= res!1048251 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49591 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49591 a!2804))))))

(declare-fun b!1530728 () Bool)

(declare-fun res!1048249 () Bool)

(assert (=> b!1530728 (=> (not res!1048249) (not e!852915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101632 (_ BitVec 32)) Bool)

(assert (=> b!1530728 (= res!1048249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530729 () Bool)

(declare-fun res!1048256 () Bool)

(assert (=> b!1530729 (=> (not res!1048256) (not e!852914))))

(assert (=> b!1530729 (= res!1048256 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662778))))

(declare-fun b!1530730 () Bool)

(declare-fun res!1048247 () Bool)

(assert (=> b!1530730 (=> (not res!1048247) (not e!852915))))

(assert (=> b!1530730 (= res!1048247 (and (= (size!49591 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49591 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49591 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530731 () Bool)

(assert (=> b!1530731 (= e!852912 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!662780 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662778))))

(declare-fun b!1530732 () Bool)

(declare-fun res!1048250 () Bool)

(assert (=> b!1530732 (=> (not res!1048250) (not e!852915))))

(declare-datatypes ((List!35600 0))(
  ( (Nil!35597) (Cons!35596 (h!37039 (_ BitVec 64)) (t!50286 List!35600)) )
))
(declare-fun arrayNoDuplicates!0 (array!101632 (_ BitVec 32) List!35600) Bool)

(assert (=> b!1530732 (= res!1048250 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35597))))

(declare-fun b!1530733 () Bool)

(assert (=> b!1530733 (= e!852914 (not e!852911))))

(declare-fun res!1048258 () Bool)

(assert (=> b!1530733 (=> res!1048258 e!852911)))

(assert (=> b!1530733 (= res!1048258 (or (not (= (select (arr!49039 a!2804) j!70) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530733 e!852913))

(declare-fun res!1048255 () Bool)

(assert (=> b!1530733 (=> (not res!1048255) (not e!852913))))

(assert (=> b!1530733 (= res!1048255 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51077 0))(
  ( (Unit!51078) )
))
(declare-fun lt!662781 () Unit!51077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51077)

(assert (=> b!1530733 (= lt!662781 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130398 res!1048248) b!1530730))

(assert (= (and b!1530730 res!1048247) b!1530721))

(assert (= (and b!1530721 res!1048252) b!1530723))

(assert (= (and b!1530723 res!1048246) b!1530728))

(assert (= (and b!1530728 res!1048249) b!1530732))

(assert (= (and b!1530732 res!1048250) b!1530727))

(assert (= (and b!1530727 res!1048251) b!1530726))

(assert (= (and b!1530726 res!1048257) b!1530729))

(assert (= (and b!1530729 res!1048256) b!1530724))

(assert (= (and b!1530724 res!1048254) b!1530733))

(assert (= (and b!1530733 res!1048255) b!1530725))

(assert (= (and b!1530733 (not res!1048258)) b!1530722))

(assert (= (and b!1530722 (not res!1048253)) b!1530731))

(declare-fun m!1412915 () Bool)

(assert (=> b!1530722 m!1412915))

(declare-fun m!1412917 () Bool)

(assert (=> b!1530728 m!1412917))

(declare-fun m!1412919 () Bool)

(assert (=> b!1530731 m!1412919))

(assert (=> b!1530731 m!1412919))

(declare-fun m!1412921 () Bool)

(assert (=> b!1530731 m!1412921))

(assert (=> b!1530723 m!1412919))

(assert (=> b!1530723 m!1412919))

(declare-fun m!1412923 () Bool)

(assert (=> b!1530723 m!1412923))

(declare-fun m!1412925 () Bool)

(assert (=> start!130398 m!1412925))

(declare-fun m!1412927 () Bool)

(assert (=> start!130398 m!1412927))

(assert (=> b!1530729 m!1412919))

(assert (=> b!1530729 m!1412919))

(declare-fun m!1412929 () Bool)

(assert (=> b!1530729 m!1412929))

(assert (=> b!1530733 m!1412919))

(declare-fun m!1412931 () Bool)

(assert (=> b!1530733 m!1412931))

(declare-fun m!1412933 () Bool)

(assert (=> b!1530733 m!1412933))

(declare-fun m!1412935 () Bool)

(assert (=> b!1530733 m!1412935))

(declare-fun m!1412937 () Bool)

(assert (=> b!1530733 m!1412937))

(declare-fun m!1412939 () Bool)

(assert (=> b!1530721 m!1412939))

(assert (=> b!1530721 m!1412939))

(declare-fun m!1412941 () Bool)

(assert (=> b!1530721 m!1412941))

(declare-fun m!1412943 () Bool)

(assert (=> b!1530732 m!1412943))

(assert (=> b!1530724 m!1412933))

(assert (=> b!1530724 m!1412935))

(assert (=> b!1530724 m!1412935))

(declare-fun m!1412945 () Bool)

(assert (=> b!1530724 m!1412945))

(assert (=> b!1530724 m!1412945))

(assert (=> b!1530724 m!1412935))

(declare-fun m!1412947 () Bool)

(assert (=> b!1530724 m!1412947))

(assert (=> b!1530726 m!1412919))

(assert (=> b!1530726 m!1412919))

(declare-fun m!1412949 () Bool)

(assert (=> b!1530726 m!1412949))

(assert (=> b!1530726 m!1412949))

(assert (=> b!1530726 m!1412919))

(declare-fun m!1412951 () Bool)

(assert (=> b!1530726 m!1412951))

(assert (=> b!1530725 m!1412919))

(assert (=> b!1530725 m!1412919))

(declare-fun m!1412953 () Bool)

(assert (=> b!1530725 m!1412953))

(check-sat (not b!1530723) (not b!1530728) (not b!1530732) (not start!130398) (not b!1530731) (not b!1530726) (not b!1530724) (not b!1530733) (not b!1530729) (not b!1530725) (not b!1530721) (not b!1530722))
(check-sat)
(get-model)

(declare-fun b!1530830 () Bool)

(declare-fun e!852963 () Bool)

(declare-fun lt!662811 () SeekEntryResult!13227)

(assert (=> b!1530830 (= e!852963 (bvsge (x!136999 lt!662811) #b01111111111111111111111111111110))))

(declare-fun b!1530831 () Bool)

(declare-fun e!852964 () SeekEntryResult!13227)

(declare-fun e!852966 () SeekEntryResult!13227)

(assert (=> b!1530831 (= e!852964 e!852966)))

(declare-fun lt!662810 () (_ BitVec 64))

(declare-fun c!140805 () Bool)

(assert (=> b!1530831 (= c!140805 (or (= lt!662810 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662810 lt!662810) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530832 () Bool)

(assert (=> b!1530832 (= e!852964 (Intermediate!13227 true (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530833 () Bool)

(assert (=> b!1530833 (and (bvsge (index!55305 lt!662811) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662811) (size!49591 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)))))))

(declare-fun e!852965 () Bool)

(assert (=> b!1530833 (= e!852965 (= (select (arr!49039 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804))) (index!55305 lt!662811)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530834 () Bool)

(assert (=> b!1530834 (= e!852966 (Intermediate!13227 false (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530835 () Bool)

(assert (=> b!1530835 (= e!852966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)) mask!2512))))

(declare-fun b!1530836 () Bool)

(declare-fun e!852967 () Bool)

(assert (=> b!1530836 (= e!852963 e!852967)))

(declare-fun res!1048344 () Bool)

(get-info :version)

(assert (=> b!1530836 (= res!1048344 (and ((_ is Intermediate!13227) lt!662811) (not (undefined!14039 lt!662811)) (bvslt (x!136999 lt!662811) #b01111111111111111111111111111110) (bvsge (x!136999 lt!662811) #b00000000000000000000000000000000) (bvsge (x!136999 lt!662811) #b00000000000000000000000000000000)))))

(assert (=> b!1530836 (=> (not res!1048344) (not e!852967))))

(declare-fun b!1530837 () Bool)

(assert (=> b!1530837 (and (bvsge (index!55305 lt!662811) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662811) (size!49591 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)))))))

(declare-fun res!1048345 () Bool)

(assert (=> b!1530837 (= res!1048345 (= (select (arr!49039 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804))) (index!55305 lt!662811)) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530837 (=> res!1048345 e!852965)))

(assert (=> b!1530837 (= e!852967 e!852965)))

(declare-fun b!1530838 () Bool)

(assert (=> b!1530838 (and (bvsge (index!55305 lt!662811) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662811) (size!49591 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)))))))

(declare-fun res!1048343 () Bool)

(assert (=> b!1530838 (= res!1048343 (= (select (arr!49039 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804))) (index!55305 lt!662811)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530838 (=> res!1048343 e!852965)))

(declare-fun d!159673 () Bool)

(assert (=> d!159673 e!852963))

(declare-fun c!140803 () Bool)

(assert (=> d!159673 (= c!140803 (and ((_ is Intermediate!13227) lt!662811) (undefined!14039 lt!662811)))))

(assert (=> d!159673 (= lt!662811 e!852964)))

(declare-fun c!140804 () Bool)

(assert (=> d!159673 (= c!140804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159673 (= lt!662810 (select (arr!49039 (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804))) (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159673 (validMask!0 mask!2512)))

(assert (=> d!159673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101633 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)) mask!2512) lt!662811)))

(assert (= (and d!159673 c!140804) b!1530832))

(assert (= (and d!159673 (not c!140804)) b!1530831))

(assert (= (and b!1530831 c!140805) b!1530834))

(assert (= (and b!1530831 (not c!140805)) b!1530835))

(assert (= (and d!159673 c!140803) b!1530830))

(assert (= (and d!159673 (not c!140803)) b!1530836))

(assert (= (and b!1530836 res!1048344) b!1530837))

(assert (= (and b!1530837 (not res!1048345)) b!1530838))

(assert (= (and b!1530838 (not res!1048343)) b!1530833))

(assert (=> b!1530835 m!1412945))

(declare-fun m!1413035 () Bool)

(assert (=> b!1530835 m!1413035))

(assert (=> b!1530835 m!1413035))

(assert (=> b!1530835 m!1412935))

(declare-fun m!1413037 () Bool)

(assert (=> b!1530835 m!1413037))

(declare-fun m!1413039 () Bool)

(assert (=> b!1530837 m!1413039))

(assert (=> b!1530833 m!1413039))

(assert (=> d!159673 m!1412945))

(declare-fun m!1413041 () Bool)

(assert (=> d!159673 m!1413041))

(assert (=> d!159673 m!1412925))

(assert (=> b!1530838 m!1413039))

(assert (=> b!1530724 d!159673))

(declare-fun d!159675 () Bool)

(declare-fun lt!662817 () (_ BitVec 32))

(declare-fun lt!662816 () (_ BitVec 32))

(assert (=> d!159675 (= lt!662817 (bvmul (bvxor lt!662816 (bvlshr lt!662816 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159675 (= lt!662816 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159675 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048346 (let ((h!37042 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137003 (bvmul (bvxor h!37042 (bvlshr h!37042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137003 (bvlshr x!137003 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048346 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048346 #b00000000000000000000000000000000))))))

(assert (=> d!159675 (= (toIndex!0 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662817 (bvlshr lt!662817 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530724 d!159675))

(declare-fun d!159679 () Bool)

(assert (=> d!159679 (= (validKeyInArray!0 (select (arr!49039 a!2804) j!70)) (and (not (= (select (arr!49039 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49039 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530723 d!159679))

(declare-fun b!1530878 () Bool)

(declare-fun e!852990 () SeekEntryResult!13227)

(declare-fun lt!662833 () SeekEntryResult!13227)

(assert (=> b!1530878 (= e!852990 (MissingZero!13227 (index!55305 lt!662833)))))

(declare-fun b!1530879 () Bool)

(declare-fun e!852989 () SeekEntryResult!13227)

(assert (=> b!1530879 (= e!852989 (Found!13227 (index!55305 lt!662833)))))

(declare-fun d!159681 () Bool)

(declare-fun lt!662832 () SeekEntryResult!13227)

(assert (=> d!159681 (and (or ((_ is MissingVacant!13227) lt!662832) (not ((_ is Found!13227) lt!662832)) (and (bvsge (index!55304 lt!662832) #b00000000000000000000000000000000) (bvslt (index!55304 lt!662832) (size!49591 a!2804)))) (not ((_ is MissingVacant!13227) lt!662832)) (or (not ((_ is Found!13227) lt!662832)) (= (select (arr!49039 a!2804) (index!55304 lt!662832)) (select (arr!49039 a!2804) j!70))))))

(declare-fun e!852991 () SeekEntryResult!13227)

(assert (=> d!159681 (= lt!662832 e!852991)))

(declare-fun c!140822 () Bool)

(assert (=> d!159681 (= c!140822 (and ((_ is Intermediate!13227) lt!662833) (undefined!14039 lt!662833)))))

(assert (=> d!159681 (= lt!662833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159681 (validMask!0 mask!2512)))

(assert (=> d!159681 (= (seekEntry!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662832)))

(declare-fun b!1530880 () Bool)

(declare-fun lt!662835 () SeekEntryResult!13227)

(assert (=> b!1530880 (= e!852990 (ite ((_ is MissingVacant!13227) lt!662835) (MissingZero!13227 (index!55306 lt!662835)) lt!662835))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13227)

(assert (=> b!1530880 (= lt!662835 (seekKeyOrZeroReturnVacant!0 (x!136999 lt!662833) (index!55305 lt!662833) (index!55305 lt!662833) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530881 () Bool)

(declare-fun c!140823 () Bool)

(declare-fun lt!662834 () (_ BitVec 64))

(assert (=> b!1530881 (= c!140823 (= lt!662834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530881 (= e!852989 e!852990)))

(declare-fun b!1530882 () Bool)

(assert (=> b!1530882 (= e!852991 e!852989)))

(assert (=> b!1530882 (= lt!662834 (select (arr!49039 a!2804) (index!55305 lt!662833)))))

(declare-fun c!140821 () Bool)

(assert (=> b!1530882 (= c!140821 (= lt!662834 (select (arr!49039 a!2804) j!70)))))

(declare-fun b!1530883 () Bool)

(assert (=> b!1530883 (= e!852991 Undefined!13227)))

(assert (= (and d!159681 c!140822) b!1530883))

(assert (= (and d!159681 (not c!140822)) b!1530882))

(assert (= (and b!1530882 c!140821) b!1530879))

(assert (= (and b!1530882 (not c!140821)) b!1530881))

(assert (= (and b!1530881 c!140823) b!1530878))

(assert (= (and b!1530881 (not c!140823)) b!1530880))

(declare-fun m!1413043 () Bool)

(assert (=> d!159681 m!1413043))

(assert (=> d!159681 m!1412919))

(assert (=> d!159681 m!1412949))

(assert (=> d!159681 m!1412949))

(assert (=> d!159681 m!1412919))

(assert (=> d!159681 m!1412951))

(assert (=> d!159681 m!1412925))

(assert (=> b!1530880 m!1412919))

(declare-fun m!1413049 () Bool)

(assert (=> b!1530880 m!1413049))

(declare-fun m!1413053 () Bool)

(assert (=> b!1530882 m!1413053))

(assert (=> b!1530725 d!159681))

(declare-fun d!159685 () Bool)

(assert (=> d!159685 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130398 d!159685))

(declare-fun d!159695 () Bool)

(assert (=> d!159695 (= (array_inv!38272 a!2804) (bvsge (size!49591 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130398 d!159695))

(declare-fun d!159697 () Bool)

(assert (=> d!159697 (= (validKeyInArray!0 (select (arr!49039 a!2804) i!961)) (and (not (= (select (arr!49039 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49039 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530721 d!159697))

(declare-fun b!1530945 () Bool)

(declare-fun e!853034 () Bool)

(declare-fun call!68503 () Bool)

(assert (=> b!1530945 (= e!853034 call!68503)))

(declare-fun b!1530946 () Bool)

(assert (=> b!1530946 (= e!853034 call!68503)))

(declare-fun b!1530947 () Bool)

(declare-fun e!853035 () Bool)

(assert (=> b!1530947 (= e!853035 e!853034)))

(declare-fun c!140841 () Bool)

(assert (=> b!1530947 (= c!140841 (validKeyInArray!0 (select (arr!49039 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159699 () Bool)

(declare-fun res!1048385 () Bool)

(declare-fun e!853032 () Bool)

(assert (=> d!159699 (=> res!1048385 e!853032)))

(assert (=> d!159699 (= res!1048385 (bvsge #b00000000000000000000000000000000 (size!49591 a!2804)))))

(assert (=> d!159699 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35597) e!853032)))

(declare-fun b!1530948 () Bool)

(assert (=> b!1530948 (= e!853032 e!853035)))

(declare-fun res!1048386 () Bool)

(assert (=> b!1530948 (=> (not res!1048386) (not e!853035))))

(declare-fun e!853033 () Bool)

(assert (=> b!1530948 (= res!1048386 (not e!853033))))

(declare-fun res!1048387 () Bool)

(assert (=> b!1530948 (=> (not res!1048387) (not e!853033))))

(assert (=> b!1530948 (= res!1048387 (validKeyInArray!0 (select (arr!49039 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530949 () Bool)

(declare-fun contains!9967 (List!35600 (_ BitVec 64)) Bool)

(assert (=> b!1530949 (= e!853033 (contains!9967 Nil!35597 (select (arr!49039 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68500 () Bool)

(assert (=> bm!68500 (= call!68503 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140841 (Cons!35596 (select (arr!49039 a!2804) #b00000000000000000000000000000000) Nil!35597) Nil!35597)))))

(assert (= (and d!159699 (not res!1048385)) b!1530948))

(assert (= (and b!1530948 res!1048387) b!1530949))

(assert (= (and b!1530948 res!1048386) b!1530947))

(assert (= (and b!1530947 c!140841) b!1530945))

(assert (= (and b!1530947 (not c!140841)) b!1530946))

(assert (= (or b!1530945 b!1530946) bm!68500))

(declare-fun m!1413081 () Bool)

(assert (=> b!1530947 m!1413081))

(assert (=> b!1530947 m!1413081))

(declare-fun m!1413083 () Bool)

(assert (=> b!1530947 m!1413083))

(assert (=> b!1530948 m!1413081))

(assert (=> b!1530948 m!1413081))

(assert (=> b!1530948 m!1413083))

(assert (=> b!1530949 m!1413081))

(assert (=> b!1530949 m!1413081))

(declare-fun m!1413085 () Bool)

(assert (=> b!1530949 m!1413085))

(assert (=> bm!68500 m!1413081))

(declare-fun m!1413087 () Bool)

(assert (=> bm!68500 m!1413087))

(assert (=> b!1530732 d!159699))

(declare-fun b!1530950 () Bool)

(declare-fun e!853036 () Bool)

(declare-fun lt!662860 () SeekEntryResult!13227)

(assert (=> b!1530950 (= e!853036 (bvsge (x!136999 lt!662860) #b01111111111111111111111111111110))))

(declare-fun b!1530951 () Bool)

(declare-fun e!853037 () SeekEntryResult!13227)

(declare-fun e!853039 () SeekEntryResult!13227)

(assert (=> b!1530951 (= e!853037 e!853039)))

(declare-fun c!140844 () Bool)

(declare-fun lt!662859 () (_ BitVec 64))

(assert (=> b!1530951 (= c!140844 (or (= lt!662859 (select (arr!49039 a!2804) j!70)) (= (bvadd lt!662859 lt!662859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530952 () Bool)

(assert (=> b!1530952 (= e!853037 (Intermediate!13227 true lt!662780 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1530953 () Bool)

(assert (=> b!1530953 (and (bvsge (index!55305 lt!662860) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662860) (size!49591 a!2804)))))

(declare-fun e!853038 () Bool)

(assert (=> b!1530953 (= e!853038 (= (select (arr!49039 a!2804) (index!55305 lt!662860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530954 () Bool)

(assert (=> b!1530954 (= e!853039 (Intermediate!13227 false lt!662780 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1530955 () Bool)

(assert (=> b!1530955 (= e!853039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) (nextIndex!0 lt!662780 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530956 () Bool)

(declare-fun e!853040 () Bool)

(assert (=> b!1530956 (= e!853036 e!853040)))

(declare-fun res!1048389 () Bool)

(assert (=> b!1530956 (= res!1048389 (and ((_ is Intermediate!13227) lt!662860) (not (undefined!14039 lt!662860)) (bvslt (x!136999 lt!662860) #b01111111111111111111111111111110) (bvsge (x!136999 lt!662860) #b00000000000000000000000000000000) (bvsge (x!136999 lt!662860) (bvadd #b00000000000000000000000000000001 x!534))))))

(assert (=> b!1530956 (=> (not res!1048389) (not e!853040))))

(declare-fun b!1530957 () Bool)

(assert (=> b!1530957 (and (bvsge (index!55305 lt!662860) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662860) (size!49591 a!2804)))))

(declare-fun res!1048390 () Bool)

(assert (=> b!1530957 (= res!1048390 (= (select (arr!49039 a!2804) (index!55305 lt!662860)) (select (arr!49039 a!2804) j!70)))))

(assert (=> b!1530957 (=> res!1048390 e!853038)))

(assert (=> b!1530957 (= e!853040 e!853038)))

(declare-fun b!1530958 () Bool)

(assert (=> b!1530958 (and (bvsge (index!55305 lt!662860) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662860) (size!49591 a!2804)))))

(declare-fun res!1048388 () Bool)

(assert (=> b!1530958 (= res!1048388 (= (select (arr!49039 a!2804) (index!55305 lt!662860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530958 (=> res!1048388 e!853038)))

(declare-fun d!159709 () Bool)

(assert (=> d!159709 e!853036))

(declare-fun c!140842 () Bool)

(assert (=> d!159709 (= c!140842 (and ((_ is Intermediate!13227) lt!662860) (undefined!14039 lt!662860)))))

(assert (=> d!159709 (= lt!662860 e!853037)))

(declare-fun c!140843 () Bool)

(assert (=> d!159709 (= c!140843 (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110))))

(assert (=> d!159709 (= lt!662859 (select (arr!49039 a!2804) lt!662780))))

(assert (=> d!159709 (validMask!0 mask!2512)))

(assert (=> d!159709 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!662780 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662860)))

(assert (= (and d!159709 c!140843) b!1530952))

(assert (= (and d!159709 (not c!140843)) b!1530951))

(assert (= (and b!1530951 c!140844) b!1530954))

(assert (= (and b!1530951 (not c!140844)) b!1530955))

(assert (= (and d!159709 c!140842) b!1530950))

(assert (= (and d!159709 (not c!140842)) b!1530956))

(assert (= (and b!1530956 res!1048389) b!1530957))

(assert (= (and b!1530957 (not res!1048390)) b!1530958))

(assert (= (and b!1530958 (not res!1048388)) b!1530953))

(declare-fun m!1413089 () Bool)

(assert (=> b!1530955 m!1413089))

(assert (=> b!1530955 m!1413089))

(assert (=> b!1530955 m!1412919))

(declare-fun m!1413091 () Bool)

(assert (=> b!1530955 m!1413091))

(declare-fun m!1413093 () Bool)

(assert (=> b!1530957 m!1413093))

(assert (=> b!1530953 m!1413093))

(declare-fun m!1413095 () Bool)

(assert (=> d!159709 m!1413095))

(assert (=> d!159709 m!1412925))

(assert (=> b!1530958 m!1413093))

(assert (=> b!1530731 d!159709))

(declare-fun b!1530983 () Bool)

(declare-fun e!853059 () Bool)

(declare-fun e!853058 () Bool)

(assert (=> b!1530983 (= e!853059 e!853058)))

(declare-fun c!140851 () Bool)

(assert (=> b!1530983 (= c!140851 (validKeyInArray!0 (select (arr!49039 a!2804) j!70)))))

(declare-fun b!1530984 () Bool)

(declare-fun e!853060 () Bool)

(declare-fun call!68509 () Bool)

(assert (=> b!1530984 (= e!853060 call!68509)))

(declare-fun bm!68506 () Bool)

(assert (=> bm!68506 (= call!68509 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530985 () Bool)

(assert (=> b!1530985 (= e!853058 call!68509)))

(declare-fun d!159711 () Bool)

(declare-fun res!1048402 () Bool)

(assert (=> d!159711 (=> res!1048402 e!853059)))

(assert (=> d!159711 (= res!1048402 (bvsge j!70 (size!49591 a!2804)))))

(assert (=> d!159711 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853059)))

(declare-fun b!1530986 () Bool)

(assert (=> b!1530986 (= e!853058 e!853060)))

(declare-fun lt!662880 () (_ BitVec 64))

(assert (=> b!1530986 (= lt!662880 (select (arr!49039 a!2804) j!70))))

(declare-fun lt!662882 () Unit!51077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101632 (_ BitVec 64) (_ BitVec 32)) Unit!51077)

(assert (=> b!1530986 (= lt!662882 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662880 j!70))))

(declare-fun arrayContainsKey!0 (array!101632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530986 (arrayContainsKey!0 a!2804 lt!662880 #b00000000000000000000000000000000)))

(declare-fun lt!662881 () Unit!51077)

(assert (=> b!1530986 (= lt!662881 lt!662882)))

(declare-fun res!1048401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13227)

(assert (=> b!1530986 (= res!1048401 (= (seekEntryOrOpen!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) (Found!13227 j!70)))))

(assert (=> b!1530986 (=> (not res!1048401) (not e!853060))))

(assert (= (and d!159711 (not res!1048402)) b!1530983))

(assert (= (and b!1530983 c!140851) b!1530986))

(assert (= (and b!1530983 (not c!140851)) b!1530985))

(assert (= (and b!1530986 res!1048401) b!1530984))

(assert (= (or b!1530984 b!1530985) bm!68506))

(assert (=> b!1530983 m!1412919))

(assert (=> b!1530983 m!1412919))

(assert (=> b!1530983 m!1412923))

(declare-fun m!1413109 () Bool)

(assert (=> bm!68506 m!1413109))

(assert (=> b!1530986 m!1412919))

(declare-fun m!1413111 () Bool)

(assert (=> b!1530986 m!1413111))

(declare-fun m!1413113 () Bool)

(assert (=> b!1530986 m!1413113))

(assert (=> b!1530986 m!1412919))

(declare-fun m!1413115 () Bool)

(assert (=> b!1530986 m!1413115))

(assert (=> b!1530733 d!159711))

(declare-fun d!159715 () Bool)

(assert (=> d!159715 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662893 () Unit!51077)

(declare-fun choose!38 (array!101632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51077)

(assert (=> d!159715 (= lt!662893 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159715 (validMask!0 mask!2512)))

(assert (=> d!159715 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662893)))

(declare-fun bs!43855 () Bool)

(assert (= bs!43855 d!159715))

(assert (=> bs!43855 m!1412937))

(declare-fun m!1413123 () Bool)

(assert (=> bs!43855 m!1413123))

(assert (=> bs!43855 m!1412925))

(assert (=> b!1530733 d!159715))

(declare-fun d!159723 () Bool)

(declare-fun lt!662896 () (_ BitVec 32))

(assert (=> d!159723 (and (bvsge lt!662896 #b00000000000000000000000000000000) (bvslt lt!662896 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159723 (= lt!662896 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159723 (validMask!0 mask!2512)))

(assert (=> d!159723 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662896)))

(declare-fun bs!43856 () Bool)

(assert (= bs!43856 d!159723))

(declare-fun m!1413125 () Bool)

(assert (=> bs!43856 m!1413125))

(assert (=> bs!43856 m!1412925))

(assert (=> b!1530722 d!159723))

(declare-fun b!1531001 () Bool)

(declare-fun e!853068 () Bool)

(declare-fun lt!662898 () SeekEntryResult!13227)

(assert (=> b!1531001 (= e!853068 (bvsge (x!136999 lt!662898) #b01111111111111111111111111111110))))

(declare-fun b!1531002 () Bool)

(declare-fun e!853069 () SeekEntryResult!13227)

(declare-fun e!853071 () SeekEntryResult!13227)

(assert (=> b!1531002 (= e!853069 e!853071)))

(declare-fun lt!662897 () (_ BitVec 64))

(declare-fun c!140862 () Bool)

(assert (=> b!1531002 (= c!140862 (or (= lt!662897 (select (arr!49039 a!2804) j!70)) (= (bvadd lt!662897 lt!662897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531003 () Bool)

(assert (=> b!1531003 (= e!853069 (Intermediate!13227 true index!487 x!534))))

(declare-fun b!1531004 () Bool)

(assert (=> b!1531004 (and (bvsge (index!55305 lt!662898) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662898) (size!49591 a!2804)))))

(declare-fun e!853070 () Bool)

(assert (=> b!1531004 (= e!853070 (= (select (arr!49039 a!2804) (index!55305 lt!662898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531005 () Bool)

(assert (=> b!1531005 (= e!853071 (Intermediate!13227 false index!487 x!534))))

(declare-fun b!1531006 () Bool)

(assert (=> b!1531006 (= e!853071 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531007 () Bool)

(declare-fun e!853072 () Bool)

(assert (=> b!1531007 (= e!853068 e!853072)))

(declare-fun res!1048404 () Bool)

(assert (=> b!1531007 (= res!1048404 (and ((_ is Intermediate!13227) lt!662898) (not (undefined!14039 lt!662898)) (bvslt (x!136999 lt!662898) #b01111111111111111111111111111110) (bvsge (x!136999 lt!662898) #b00000000000000000000000000000000) (bvsge (x!136999 lt!662898) x!534)))))

(assert (=> b!1531007 (=> (not res!1048404) (not e!853072))))

(declare-fun b!1531008 () Bool)

(assert (=> b!1531008 (and (bvsge (index!55305 lt!662898) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662898) (size!49591 a!2804)))))

(declare-fun res!1048405 () Bool)

(assert (=> b!1531008 (= res!1048405 (= (select (arr!49039 a!2804) (index!55305 lt!662898)) (select (arr!49039 a!2804) j!70)))))

(assert (=> b!1531008 (=> res!1048405 e!853070)))

(assert (=> b!1531008 (= e!853072 e!853070)))

(declare-fun b!1531009 () Bool)

(assert (=> b!1531009 (and (bvsge (index!55305 lt!662898) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662898) (size!49591 a!2804)))))

(declare-fun res!1048403 () Bool)

(assert (=> b!1531009 (= res!1048403 (= (select (arr!49039 a!2804) (index!55305 lt!662898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531009 (=> res!1048403 e!853070)))

(declare-fun d!159725 () Bool)

(assert (=> d!159725 e!853068))

(declare-fun c!140860 () Bool)

(assert (=> d!159725 (= c!140860 (and ((_ is Intermediate!13227) lt!662898) (undefined!14039 lt!662898)))))

(assert (=> d!159725 (= lt!662898 e!853069)))

(declare-fun c!140861 () Bool)

(assert (=> d!159725 (= c!140861 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159725 (= lt!662897 (select (arr!49039 a!2804) index!487))))

(assert (=> d!159725 (validMask!0 mask!2512)))

(assert (=> d!159725 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662898)))

(assert (= (and d!159725 c!140861) b!1531003))

(assert (= (and d!159725 (not c!140861)) b!1531002))

(assert (= (and b!1531002 c!140862) b!1531005))

(assert (= (and b!1531002 (not c!140862)) b!1531006))

(assert (= (and d!159725 c!140860) b!1531001))

(assert (= (and d!159725 (not c!140860)) b!1531007))

(assert (= (and b!1531007 res!1048404) b!1531008))

(assert (= (and b!1531008 (not res!1048405)) b!1531009))

(assert (= (and b!1531009 (not res!1048403)) b!1531004))

(assert (=> b!1531006 m!1412915))

(assert (=> b!1531006 m!1412915))

(assert (=> b!1531006 m!1412919))

(declare-fun m!1413127 () Bool)

(assert (=> b!1531006 m!1413127))

(declare-fun m!1413129 () Bool)

(assert (=> b!1531008 m!1413129))

(assert (=> b!1531004 m!1413129))

(declare-fun m!1413131 () Bool)

(assert (=> d!159725 m!1413131))

(assert (=> d!159725 m!1412925))

(assert (=> b!1531009 m!1413129))

(assert (=> b!1530729 d!159725))

(declare-fun b!1531010 () Bool)

(declare-fun e!853073 () Bool)

(declare-fun lt!662900 () SeekEntryResult!13227)

(assert (=> b!1531010 (= e!853073 (bvsge (x!136999 lt!662900) #b01111111111111111111111111111110))))

(declare-fun b!1531011 () Bool)

(declare-fun e!853074 () SeekEntryResult!13227)

(declare-fun e!853076 () SeekEntryResult!13227)

(assert (=> b!1531011 (= e!853074 e!853076)))

(declare-fun c!140865 () Bool)

(declare-fun lt!662899 () (_ BitVec 64))

(assert (=> b!1531011 (= c!140865 (or (= lt!662899 (select (arr!49039 a!2804) j!70)) (= (bvadd lt!662899 lt!662899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531012 () Bool)

(assert (=> b!1531012 (= e!853074 (Intermediate!13227 true (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531013 () Bool)

(assert (=> b!1531013 (and (bvsge (index!55305 lt!662900) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662900) (size!49591 a!2804)))))

(declare-fun e!853075 () Bool)

(assert (=> b!1531013 (= e!853075 (= (select (arr!49039 a!2804) (index!55305 lt!662900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531014 () Bool)

(assert (=> b!1531014 (= e!853076 (Intermediate!13227 false (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531015 () Bool)

(assert (=> b!1531015 (= e!853076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531016 () Bool)

(declare-fun e!853077 () Bool)

(assert (=> b!1531016 (= e!853073 e!853077)))

(declare-fun res!1048407 () Bool)

(assert (=> b!1531016 (= res!1048407 (and ((_ is Intermediate!13227) lt!662900) (not (undefined!14039 lt!662900)) (bvslt (x!136999 lt!662900) #b01111111111111111111111111111110) (bvsge (x!136999 lt!662900) #b00000000000000000000000000000000) (bvsge (x!136999 lt!662900) #b00000000000000000000000000000000)))))

(assert (=> b!1531016 (=> (not res!1048407) (not e!853077))))

(declare-fun b!1531017 () Bool)

(assert (=> b!1531017 (and (bvsge (index!55305 lt!662900) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662900) (size!49591 a!2804)))))

(declare-fun res!1048408 () Bool)

(assert (=> b!1531017 (= res!1048408 (= (select (arr!49039 a!2804) (index!55305 lt!662900)) (select (arr!49039 a!2804) j!70)))))

(assert (=> b!1531017 (=> res!1048408 e!853075)))

(assert (=> b!1531017 (= e!853077 e!853075)))

(declare-fun b!1531018 () Bool)

(assert (=> b!1531018 (and (bvsge (index!55305 lt!662900) #b00000000000000000000000000000000) (bvslt (index!55305 lt!662900) (size!49591 a!2804)))))

(declare-fun res!1048406 () Bool)

(assert (=> b!1531018 (= res!1048406 (= (select (arr!49039 a!2804) (index!55305 lt!662900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531018 (=> res!1048406 e!853075)))

(declare-fun d!159727 () Bool)

(assert (=> d!159727 e!853073))

(declare-fun c!140863 () Bool)

(assert (=> d!159727 (= c!140863 (and ((_ is Intermediate!13227) lt!662900) (undefined!14039 lt!662900)))))

(assert (=> d!159727 (= lt!662900 e!853074)))

(declare-fun c!140864 () Bool)

(assert (=> d!159727 (= c!140864 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159727 (= lt!662899 (select (arr!49039 a!2804) (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512)))))

(assert (=> d!159727 (validMask!0 mask!2512)))

(assert (=> d!159727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662900)))

(assert (= (and d!159727 c!140864) b!1531012))

(assert (= (and d!159727 (not c!140864)) b!1531011))

(assert (= (and b!1531011 c!140865) b!1531014))

(assert (= (and b!1531011 (not c!140865)) b!1531015))

(assert (= (and d!159727 c!140863) b!1531010))

(assert (= (and d!159727 (not c!140863)) b!1531016))

(assert (= (and b!1531016 res!1048407) b!1531017))

(assert (= (and b!1531017 (not res!1048408)) b!1531018))

(assert (= (and b!1531018 (not res!1048406)) b!1531013))

(assert (=> b!1531015 m!1412949))

(declare-fun m!1413133 () Bool)

(assert (=> b!1531015 m!1413133))

(assert (=> b!1531015 m!1413133))

(assert (=> b!1531015 m!1412919))

(declare-fun m!1413135 () Bool)

(assert (=> b!1531015 m!1413135))

(declare-fun m!1413137 () Bool)

(assert (=> b!1531017 m!1413137))

(assert (=> b!1531013 m!1413137))

(assert (=> d!159727 m!1412949))

(declare-fun m!1413139 () Bool)

(assert (=> d!159727 m!1413139))

(assert (=> d!159727 m!1412925))

(assert (=> b!1531018 m!1413137))

(assert (=> b!1530726 d!159727))

(declare-fun d!159729 () Bool)

(declare-fun lt!662902 () (_ BitVec 32))

(declare-fun lt!662901 () (_ BitVec 32))

(assert (=> d!159729 (= lt!662902 (bvmul (bvxor lt!662901 (bvlshr lt!662901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159729 (= lt!662901 ((_ extract 31 0) (bvand (bvxor (select (arr!49039 a!2804) j!70) (bvlshr (select (arr!49039 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159729 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048346 (let ((h!37042 ((_ extract 31 0) (bvand (bvxor (select (arr!49039 a!2804) j!70) (bvlshr (select (arr!49039 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137003 (bvmul (bvxor h!37042 (bvlshr h!37042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137003 (bvlshr x!137003 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048346 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048346 #b00000000000000000000000000000000))))))

(assert (=> d!159729 (= (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (bvand (bvxor lt!662902 (bvlshr lt!662902 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530726 d!159729))

(declare-fun b!1531025 () Bool)

(declare-fun e!853083 () Bool)

(declare-fun e!853082 () Bool)

(assert (=> b!1531025 (= e!853083 e!853082)))

(declare-fun c!140868 () Bool)

(assert (=> b!1531025 (= c!140868 (validKeyInArray!0 (select (arr!49039 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1531026 () Bool)

(declare-fun e!853084 () Bool)

(declare-fun call!68510 () Bool)

(assert (=> b!1531026 (= e!853084 call!68510)))

(declare-fun bm!68507 () Bool)

(assert (=> bm!68507 (= call!68510 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1531027 () Bool)

(assert (=> b!1531027 (= e!853082 call!68510)))

(declare-fun d!159731 () Bool)

(declare-fun res!1048412 () Bool)

(assert (=> d!159731 (=> res!1048412 e!853083)))

(assert (=> d!159731 (= res!1048412 (bvsge #b00000000000000000000000000000000 (size!49591 a!2804)))))

(assert (=> d!159731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853083)))

(declare-fun b!1531028 () Bool)

(assert (=> b!1531028 (= e!853082 e!853084)))

(declare-fun lt!662903 () (_ BitVec 64))

(assert (=> b!1531028 (= lt!662903 (select (arr!49039 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662905 () Unit!51077)

(assert (=> b!1531028 (= lt!662905 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662903 #b00000000000000000000000000000000))))

(assert (=> b!1531028 (arrayContainsKey!0 a!2804 lt!662903 #b00000000000000000000000000000000)))

(declare-fun lt!662904 () Unit!51077)

(assert (=> b!1531028 (= lt!662904 lt!662905)))

(declare-fun res!1048411 () Bool)

(assert (=> b!1531028 (= res!1048411 (= (seekEntryOrOpen!0 (select (arr!49039 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13227 #b00000000000000000000000000000000)))))

(assert (=> b!1531028 (=> (not res!1048411) (not e!853084))))

(assert (= (and d!159731 (not res!1048412)) b!1531025))

(assert (= (and b!1531025 c!140868) b!1531028))

(assert (= (and b!1531025 (not c!140868)) b!1531027))

(assert (= (and b!1531028 res!1048411) b!1531026))

(assert (= (or b!1531026 b!1531027) bm!68507))

(assert (=> b!1531025 m!1413081))

(assert (=> b!1531025 m!1413081))

(assert (=> b!1531025 m!1413083))

(declare-fun m!1413141 () Bool)

(assert (=> bm!68507 m!1413141))

(assert (=> b!1531028 m!1413081))

(declare-fun m!1413143 () Bool)

(assert (=> b!1531028 m!1413143))

(declare-fun m!1413145 () Bool)

(assert (=> b!1531028 m!1413145))

(assert (=> b!1531028 m!1413081))

(declare-fun m!1413147 () Bool)

(assert (=> b!1531028 m!1413147))

(assert (=> b!1530728 d!159731))

(check-sat (not d!159709) (not b!1531025) (not b!1530947) (not b!1530880) (not b!1530955) (not b!1530835) (not d!159723) (not b!1531015) (not bm!68506) (not b!1530986) (not b!1531006) (not d!159715) (not b!1531028) (not d!159727) (not d!159725) (not d!159681) (not b!1530983) (not b!1530949) (not d!159673) (not bm!68500) (not bm!68507) (not b!1530948))
(check-sat)
