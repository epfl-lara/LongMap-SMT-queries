; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129498 () Bool)

(assert start!129498)

(declare-fun b!1520587 () Bool)

(declare-fun res!1039992 () Bool)

(declare-fun e!848194 () Bool)

(assert (=> b!1520587 (=> (not res!1039992) (not e!848194))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101224 0))(
  ( (array!101225 (arr!48846 (Array (_ BitVec 32) (_ BitVec 64))) (size!49396 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101224)

(assert (=> b!1520587 (= res!1039992 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49396 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49396 a!2804))))))

(declare-fun b!1520588 () Bool)

(declare-fun e!848196 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13017 0))(
  ( (MissingZero!13017 (index!54463 (_ BitVec 32))) (Found!13017 (index!54464 (_ BitVec 32))) (Intermediate!13017 (undefined!13829 Bool) (index!54465 (_ BitVec 32)) (x!136143 (_ BitVec 32))) (Undefined!13017) (MissingVacant!13017 (index!54466 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101224 (_ BitVec 32)) SeekEntryResult!13017)

(assert (=> b!1520588 (= e!848196 (= (seekEntry!0 (select (arr!48846 a!2804) j!70) a!2804 mask!2512) (Found!13017 j!70)))))

(declare-fun b!1520589 () Bool)

(declare-fun res!1039994 () Bool)

(assert (=> b!1520589 (=> (not res!1039994) (not e!848194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101224 (_ BitVec 32)) Bool)

(assert (=> b!1520589 (= res!1039994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1039998 () Bool)

(assert (=> start!129498 (=> (not res!1039998) (not e!848194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129498 (= res!1039998 (validMask!0 mask!2512))))

(assert (=> start!129498 e!848194))

(assert (=> start!129498 true))

(declare-fun array_inv!37874 (array!101224) Bool)

(assert (=> start!129498 (array_inv!37874 a!2804)))

(declare-fun b!1520590 () Bool)

(declare-fun res!1040000 () Bool)

(assert (=> b!1520590 (=> (not res!1040000) (not e!848194))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520590 (= res!1040000 (and (= (size!49396 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49396 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49396 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520591 () Bool)

(declare-fun res!1040001 () Bool)

(assert (=> b!1520591 (=> (not res!1040001) (not e!848194))))

(declare-datatypes ((List!35329 0))(
  ( (Nil!35326) (Cons!35325 (h!36743 (_ BitVec 64)) (t!50023 List!35329)) )
))
(declare-fun arrayNoDuplicates!0 (array!101224 (_ BitVec 32) List!35329) Bool)

(assert (=> b!1520591 (= res!1040001 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35326))))

(declare-fun b!1520592 () Bool)

(declare-fun res!1039995 () Bool)

(declare-fun e!848195 () Bool)

(assert (=> b!1520592 (=> (not res!1039995) (not e!848195))))

(declare-fun lt!659132 () SeekEntryResult!13017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101224 (_ BitVec 32)) SeekEntryResult!13017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520592 (= res!1039995 (= lt!659132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)) mask!2512)))))

(declare-fun b!1520593 () Bool)

(assert (=> b!1520593 (= e!848194 e!848195)))

(declare-fun res!1040002 () Bool)

(assert (=> b!1520593 (=> (not res!1040002) (not e!848195))))

(declare-fun lt!659133 () SeekEntryResult!13017)

(assert (=> b!1520593 (= res!1040002 (= lt!659132 lt!659133))))

(assert (=> b!1520593 (= lt!659133 (Intermediate!13017 false resIndex!21 resX!21))))

(assert (=> b!1520593 (= lt!659132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520594 () Bool)

(declare-fun res!1039996 () Bool)

(assert (=> b!1520594 (=> (not res!1039996) (not e!848194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520594 (= res!1039996 (validKeyInArray!0 (select (arr!48846 a!2804) j!70)))))

(declare-fun b!1520595 () Bool)

(declare-fun res!1039993 () Bool)

(assert (=> b!1520595 (=> (not res!1039993) (not e!848195))))

(assert (=> b!1520595 (= res!1039993 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48846 a!2804) j!70) a!2804 mask!2512) lt!659133))))

(declare-fun b!1520596 () Bool)

(assert (=> b!1520596 (= e!848195 (not (or (not (= (select (arr!48846 a!2804) j!70) (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48846 a!2804) index!487) (select (arr!48846 a!2804) j!70)) (= (select (arr!48846 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520596 e!848196))

(declare-fun res!1039997 () Bool)

(assert (=> b!1520596 (=> (not res!1039997) (not e!848196))))

(assert (=> b!1520596 (= res!1039997 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50902 0))(
  ( (Unit!50903) )
))
(declare-fun lt!659134 () Unit!50902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50902)

(assert (=> b!1520596 (= lt!659134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520597 () Bool)

(declare-fun res!1039999 () Bool)

(assert (=> b!1520597 (=> (not res!1039999) (not e!848194))))

(assert (=> b!1520597 (= res!1039999 (validKeyInArray!0 (select (arr!48846 a!2804) i!961)))))

(assert (= (and start!129498 res!1039998) b!1520590))

(assert (= (and b!1520590 res!1040000) b!1520597))

(assert (= (and b!1520597 res!1039999) b!1520594))

(assert (= (and b!1520594 res!1039996) b!1520589))

(assert (= (and b!1520589 res!1039994) b!1520591))

(assert (= (and b!1520591 res!1040001) b!1520587))

(assert (= (and b!1520587 res!1039992) b!1520593))

(assert (= (and b!1520593 res!1040002) b!1520595))

(assert (= (and b!1520595 res!1039993) b!1520592))

(assert (= (and b!1520592 res!1039995) b!1520596))

(assert (= (and b!1520596 res!1039997) b!1520588))

(declare-fun m!1403821 () Bool)

(assert (=> b!1520589 m!1403821))

(declare-fun m!1403823 () Bool)

(assert (=> b!1520594 m!1403823))

(assert (=> b!1520594 m!1403823))

(declare-fun m!1403825 () Bool)

(assert (=> b!1520594 m!1403825))

(assert (=> b!1520595 m!1403823))

(assert (=> b!1520595 m!1403823))

(declare-fun m!1403827 () Bool)

(assert (=> b!1520595 m!1403827))

(declare-fun m!1403829 () Bool)

(assert (=> start!129498 m!1403829))

(declare-fun m!1403831 () Bool)

(assert (=> start!129498 m!1403831))

(declare-fun m!1403833 () Bool)

(assert (=> b!1520591 m!1403833))

(assert (=> b!1520588 m!1403823))

(assert (=> b!1520588 m!1403823))

(declare-fun m!1403835 () Bool)

(assert (=> b!1520588 m!1403835))

(declare-fun m!1403837 () Bool)

(assert (=> b!1520597 m!1403837))

(assert (=> b!1520597 m!1403837))

(declare-fun m!1403839 () Bool)

(assert (=> b!1520597 m!1403839))

(declare-fun m!1403841 () Bool)

(assert (=> b!1520592 m!1403841))

(declare-fun m!1403843 () Bool)

(assert (=> b!1520592 m!1403843))

(assert (=> b!1520592 m!1403843))

(declare-fun m!1403845 () Bool)

(assert (=> b!1520592 m!1403845))

(assert (=> b!1520592 m!1403845))

(assert (=> b!1520592 m!1403843))

(declare-fun m!1403847 () Bool)

(assert (=> b!1520592 m!1403847))

(assert (=> b!1520596 m!1403823))

(declare-fun m!1403849 () Bool)

(assert (=> b!1520596 m!1403849))

(assert (=> b!1520596 m!1403841))

(declare-fun m!1403851 () Bool)

(assert (=> b!1520596 m!1403851))

(assert (=> b!1520596 m!1403843))

(declare-fun m!1403853 () Bool)

(assert (=> b!1520596 m!1403853))

(assert (=> b!1520593 m!1403823))

(assert (=> b!1520593 m!1403823))

(declare-fun m!1403855 () Bool)

(assert (=> b!1520593 m!1403855))

(assert (=> b!1520593 m!1403855))

(assert (=> b!1520593 m!1403823))

(declare-fun m!1403857 () Bool)

(assert (=> b!1520593 m!1403857))

(check-sat (not b!1520588) (not b!1520592) (not b!1520595) (not b!1520596) (not b!1520594) (not start!129498) (not b!1520597) (not b!1520589) (not b!1520591) (not b!1520593))
(check-sat)
(get-model)

(declare-fun b!1520649 () Bool)

(declare-fun e!848222 () Bool)

(declare-fun lt!659149 () SeekEntryResult!13017)

(assert (=> b!1520649 (= e!848222 (bvsge (x!136143 lt!659149) #b01111111111111111111111111111110))))

(declare-fun b!1520650 () Bool)

(declare-fun e!848221 () SeekEntryResult!13017)

(declare-fun e!848224 () SeekEntryResult!13017)

(assert (=> b!1520650 (= e!848221 e!848224)))

(declare-fun c!139848 () Bool)

(declare-fun lt!659148 () (_ BitVec 64))

(assert (=> b!1520650 (= c!139848 (or (= lt!659148 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659148 lt!659148) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520651 () Bool)

(assert (=> b!1520651 (and (bvsge (index!54465 lt!659149) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659149) (size!49396 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)))))))

(declare-fun res!1040042 () Bool)

(assert (=> b!1520651 (= res!1040042 (= (select (arr!48846 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804))) (index!54465 lt!659149)) (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!848220 () Bool)

(assert (=> b!1520651 (=> res!1040042 e!848220)))

(declare-fun e!848223 () Bool)

(assert (=> b!1520651 (= e!848223 e!848220)))

(declare-fun b!1520652 () Bool)

(assert (=> b!1520652 (= e!848222 e!848223)))

(declare-fun res!1040044 () Bool)

(get-info :version)

(assert (=> b!1520652 (= res!1040044 (and ((_ is Intermediate!13017) lt!659149) (not (undefined!13829 lt!659149)) (bvslt (x!136143 lt!659149) #b01111111111111111111111111111110) (bvsge (x!136143 lt!659149) #b00000000000000000000000000000000) (bvsge (x!136143 lt!659149) #b00000000000000000000000000000000)))))

(assert (=> b!1520652 (=> (not res!1040044) (not e!848223))))

(declare-fun b!1520653 () Bool)

(assert (=> b!1520653 (and (bvsge (index!54465 lt!659149) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659149) (size!49396 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)))))))

(assert (=> b!1520653 (= e!848220 (= (select (arr!48846 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804))) (index!54465 lt!659149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520654 () Bool)

(assert (=> b!1520654 (= e!848224 (Intermediate!13017 false (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520655 () Bool)

(assert (=> b!1520655 (and (bvsge (index!54465 lt!659149) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659149) (size!49396 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)))))))

(declare-fun res!1040043 () Bool)

(assert (=> b!1520655 (= res!1040043 (= (select (arr!48846 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804))) (index!54465 lt!659149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520655 (=> res!1040043 e!848220)))

(declare-fun d!158949 () Bool)

(assert (=> d!158949 e!848222))

(declare-fun c!139849 () Bool)

(assert (=> d!158949 (= c!139849 (and ((_ is Intermediate!13017) lt!659149) (undefined!13829 lt!659149)))))

(assert (=> d!158949 (= lt!659149 e!848221)))

(declare-fun c!139850 () Bool)

(assert (=> d!158949 (= c!139850 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158949 (= lt!659148 (select (arr!48846 (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804))) (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158949 (validMask!0 mask!2512)))

(assert (=> d!158949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)) mask!2512) lt!659149)))

(declare-fun b!1520656 () Bool)

(assert (=> b!1520656 (= e!848221 (Intermediate!13017 true (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520657 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520657 (= e!848224 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101225 (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49396 a!2804)) mask!2512))))

(assert (= (and d!158949 c!139850) b!1520656))

(assert (= (and d!158949 (not c!139850)) b!1520650))

(assert (= (and b!1520650 c!139848) b!1520654))

(assert (= (and b!1520650 (not c!139848)) b!1520657))

(assert (= (and d!158949 c!139849) b!1520649))

(assert (= (and d!158949 (not c!139849)) b!1520652))

(assert (= (and b!1520652 res!1040044) b!1520651))

(assert (= (and b!1520651 (not res!1040042)) b!1520655))

(assert (= (and b!1520655 (not res!1040043)) b!1520653))

(assert (=> b!1520657 m!1403845))

(declare-fun m!1403897 () Bool)

(assert (=> b!1520657 m!1403897))

(assert (=> b!1520657 m!1403897))

(assert (=> b!1520657 m!1403843))

(declare-fun m!1403899 () Bool)

(assert (=> b!1520657 m!1403899))

(declare-fun m!1403901 () Bool)

(assert (=> b!1520655 m!1403901))

(assert (=> b!1520653 m!1403901))

(assert (=> b!1520651 m!1403901))

(assert (=> d!158949 m!1403845))

(declare-fun m!1403903 () Bool)

(assert (=> d!158949 m!1403903))

(assert (=> d!158949 m!1403829))

(assert (=> b!1520592 d!158949))

(declare-fun d!158951 () Bool)

(declare-fun lt!659155 () (_ BitVec 32))

(declare-fun lt!659154 () (_ BitVec 32))

(assert (=> d!158951 (= lt!659155 (bvmul (bvxor lt!659154 (bvlshr lt!659154 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158951 (= lt!659154 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158951 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040045 (let ((h!36745 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136146 (bvmul (bvxor h!36745 (bvlshr h!36745 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136146 (bvlshr x!136146 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040045 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040045 #b00000000000000000000000000000000))))))

(assert (=> d!158951 (= (toIndex!0 (select (store (arr!48846 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659155 (bvlshr lt!659155 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520592 d!158951))

(declare-fun b!1520658 () Bool)

(declare-fun e!848227 () Bool)

(declare-fun lt!659157 () SeekEntryResult!13017)

(assert (=> b!1520658 (= e!848227 (bvsge (x!136143 lt!659157) #b01111111111111111111111111111110))))

(declare-fun b!1520659 () Bool)

(declare-fun e!848226 () SeekEntryResult!13017)

(declare-fun e!848229 () SeekEntryResult!13017)

(assert (=> b!1520659 (= e!848226 e!848229)))

(declare-fun lt!659156 () (_ BitVec 64))

(declare-fun c!139851 () Bool)

(assert (=> b!1520659 (= c!139851 (or (= lt!659156 (select (arr!48846 a!2804) j!70)) (= (bvadd lt!659156 lt!659156) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520660 () Bool)

(assert (=> b!1520660 (and (bvsge (index!54465 lt!659157) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659157) (size!49396 a!2804)))))

(declare-fun res!1040046 () Bool)

(assert (=> b!1520660 (= res!1040046 (= (select (arr!48846 a!2804) (index!54465 lt!659157)) (select (arr!48846 a!2804) j!70)))))

(declare-fun e!848225 () Bool)

(assert (=> b!1520660 (=> res!1040046 e!848225)))

(declare-fun e!848228 () Bool)

(assert (=> b!1520660 (= e!848228 e!848225)))

(declare-fun b!1520661 () Bool)

(assert (=> b!1520661 (= e!848227 e!848228)))

(declare-fun res!1040048 () Bool)

(assert (=> b!1520661 (= res!1040048 (and ((_ is Intermediate!13017) lt!659157) (not (undefined!13829 lt!659157)) (bvslt (x!136143 lt!659157) #b01111111111111111111111111111110) (bvsge (x!136143 lt!659157) #b00000000000000000000000000000000) (bvsge (x!136143 lt!659157) #b00000000000000000000000000000000)))))

(assert (=> b!1520661 (=> (not res!1040048) (not e!848228))))

(declare-fun b!1520662 () Bool)

(assert (=> b!1520662 (and (bvsge (index!54465 lt!659157) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659157) (size!49396 a!2804)))))

(assert (=> b!1520662 (= e!848225 (= (select (arr!48846 a!2804) (index!54465 lt!659157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520663 () Bool)

(assert (=> b!1520663 (= e!848229 (Intermediate!13017 false (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520664 () Bool)

(assert (=> b!1520664 (and (bvsge (index!54465 lt!659157) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659157) (size!49396 a!2804)))))

(declare-fun res!1040047 () Bool)

(assert (=> b!1520664 (= res!1040047 (= (select (arr!48846 a!2804) (index!54465 lt!659157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520664 (=> res!1040047 e!848225)))

(declare-fun d!158953 () Bool)

(assert (=> d!158953 e!848227))

(declare-fun c!139852 () Bool)

(assert (=> d!158953 (= c!139852 (and ((_ is Intermediate!13017) lt!659157) (undefined!13829 lt!659157)))))

(assert (=> d!158953 (= lt!659157 e!848226)))

(declare-fun c!139853 () Bool)

(assert (=> d!158953 (= c!139853 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158953 (= lt!659156 (select (arr!48846 a!2804) (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512)))))

(assert (=> d!158953 (validMask!0 mask!2512)))

(assert (=> d!158953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512) lt!659157)))

(declare-fun b!1520665 () Bool)

(assert (=> b!1520665 (= e!848226 (Intermediate!13017 true (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520666 () Bool)

(assert (=> b!1520666 (= e!848229 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158953 c!139853) b!1520665))

(assert (= (and d!158953 (not c!139853)) b!1520659))

(assert (= (and b!1520659 c!139851) b!1520663))

(assert (= (and b!1520659 (not c!139851)) b!1520666))

(assert (= (and d!158953 c!139852) b!1520658))

(assert (= (and d!158953 (not c!139852)) b!1520661))

(assert (= (and b!1520661 res!1040048) b!1520660))

(assert (= (and b!1520660 (not res!1040046)) b!1520664))

(assert (= (and b!1520664 (not res!1040047)) b!1520662))

(assert (=> b!1520666 m!1403855))

(declare-fun m!1403905 () Bool)

(assert (=> b!1520666 m!1403905))

(assert (=> b!1520666 m!1403905))

(assert (=> b!1520666 m!1403823))

(declare-fun m!1403907 () Bool)

(assert (=> b!1520666 m!1403907))

(declare-fun m!1403909 () Bool)

(assert (=> b!1520664 m!1403909))

(assert (=> b!1520662 m!1403909))

(assert (=> b!1520660 m!1403909))

(assert (=> d!158953 m!1403855))

(declare-fun m!1403911 () Bool)

(assert (=> d!158953 m!1403911))

(assert (=> d!158953 m!1403829))

(assert (=> b!1520593 d!158953))

(declare-fun d!158955 () Bool)

(declare-fun lt!659159 () (_ BitVec 32))

(declare-fun lt!659158 () (_ BitVec 32))

(assert (=> d!158955 (= lt!659159 (bvmul (bvxor lt!659158 (bvlshr lt!659158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158955 (= lt!659158 ((_ extract 31 0) (bvand (bvxor (select (arr!48846 a!2804) j!70) (bvlshr (select (arr!48846 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158955 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040045 (let ((h!36745 ((_ extract 31 0) (bvand (bvxor (select (arr!48846 a!2804) j!70) (bvlshr (select (arr!48846 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136146 (bvmul (bvxor h!36745 (bvlshr h!36745 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136146 (bvlshr x!136146 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040045 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040045 #b00000000000000000000000000000000))))))

(assert (=> d!158955 (= (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) (bvand (bvxor lt!659159 (bvlshr lt!659159 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520593 d!158955))

(declare-fun b!1520677 () Bool)

(declare-fun e!848239 () Bool)

(declare-fun call!68361 () Bool)

(assert (=> b!1520677 (= e!848239 call!68361)))

(declare-fun b!1520678 () Bool)

(declare-fun e!848238 () Bool)

(declare-fun contains!9982 (List!35329 (_ BitVec 64)) Bool)

(assert (=> b!1520678 (= e!848238 (contains!9982 Nil!35326 (select (arr!48846 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520679 () Bool)

(assert (=> b!1520679 (= e!848239 call!68361)))

(declare-fun b!1520680 () Bool)

(declare-fun e!848241 () Bool)

(assert (=> b!1520680 (= e!848241 e!848239)))

(declare-fun c!139856 () Bool)

(assert (=> b!1520680 (= c!139856 (validKeyInArray!0 (select (arr!48846 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158957 () Bool)

(declare-fun res!1040057 () Bool)

(declare-fun e!848240 () Bool)

(assert (=> d!158957 (=> res!1040057 e!848240)))

(assert (=> d!158957 (= res!1040057 (bvsge #b00000000000000000000000000000000 (size!49396 a!2804)))))

(assert (=> d!158957 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35326) e!848240)))

(declare-fun b!1520681 () Bool)

(assert (=> b!1520681 (= e!848240 e!848241)))

(declare-fun res!1040056 () Bool)

(assert (=> b!1520681 (=> (not res!1040056) (not e!848241))))

(assert (=> b!1520681 (= res!1040056 (not e!848238))))

(declare-fun res!1040055 () Bool)

(assert (=> b!1520681 (=> (not res!1040055) (not e!848238))))

(assert (=> b!1520681 (= res!1040055 (validKeyInArray!0 (select (arr!48846 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68358 () Bool)

(assert (=> bm!68358 (= call!68361 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139856 (Cons!35325 (select (arr!48846 a!2804) #b00000000000000000000000000000000) Nil!35326) Nil!35326)))))

(assert (= (and d!158957 (not res!1040057)) b!1520681))

(assert (= (and b!1520681 res!1040055) b!1520678))

(assert (= (and b!1520681 res!1040056) b!1520680))

(assert (= (and b!1520680 c!139856) b!1520679))

(assert (= (and b!1520680 (not c!139856)) b!1520677))

(assert (= (or b!1520679 b!1520677) bm!68358))

(declare-fun m!1403913 () Bool)

(assert (=> b!1520678 m!1403913))

(assert (=> b!1520678 m!1403913))

(declare-fun m!1403915 () Bool)

(assert (=> b!1520678 m!1403915))

(assert (=> b!1520680 m!1403913))

(assert (=> b!1520680 m!1403913))

(declare-fun m!1403917 () Bool)

(assert (=> b!1520680 m!1403917))

(assert (=> b!1520681 m!1403913))

(assert (=> b!1520681 m!1403913))

(assert (=> b!1520681 m!1403917))

(assert (=> bm!68358 m!1403913))

(declare-fun m!1403919 () Bool)

(assert (=> bm!68358 m!1403919))

(assert (=> b!1520591 d!158957))

(declare-fun b!1520690 () Bool)

(declare-fun e!848249 () Bool)

(declare-fun call!68364 () Bool)

(assert (=> b!1520690 (= e!848249 call!68364)))

(declare-fun b!1520691 () Bool)

(declare-fun e!848250 () Bool)

(assert (=> b!1520691 (= e!848249 e!848250)))

(declare-fun lt!659166 () (_ BitVec 64))

(assert (=> b!1520691 (= lt!659166 (select (arr!48846 a!2804) j!70))))

(declare-fun lt!659167 () Unit!50902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101224 (_ BitVec 64) (_ BitVec 32)) Unit!50902)

(assert (=> b!1520691 (= lt!659167 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659166 j!70))))

(declare-fun arrayContainsKey!0 (array!101224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520691 (arrayContainsKey!0 a!2804 lt!659166 #b00000000000000000000000000000000)))

(declare-fun lt!659168 () Unit!50902)

(assert (=> b!1520691 (= lt!659168 lt!659167)))

(declare-fun res!1040062 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101224 (_ BitVec 32)) SeekEntryResult!13017)

(assert (=> b!1520691 (= res!1040062 (= (seekEntryOrOpen!0 (select (arr!48846 a!2804) j!70) a!2804 mask!2512) (Found!13017 j!70)))))

(assert (=> b!1520691 (=> (not res!1040062) (not e!848250))))

(declare-fun b!1520692 () Bool)

(declare-fun e!848248 () Bool)

(assert (=> b!1520692 (= e!848248 e!848249)))

(declare-fun c!139859 () Bool)

(assert (=> b!1520692 (= c!139859 (validKeyInArray!0 (select (arr!48846 a!2804) j!70)))))

(declare-fun b!1520693 () Bool)

(assert (=> b!1520693 (= e!848250 call!68364)))

(declare-fun d!158965 () Bool)

(declare-fun res!1040063 () Bool)

(assert (=> d!158965 (=> res!1040063 e!848248)))

(assert (=> d!158965 (= res!1040063 (bvsge j!70 (size!49396 a!2804)))))

(assert (=> d!158965 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848248)))

(declare-fun bm!68361 () Bool)

(assert (=> bm!68361 (= call!68364 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158965 (not res!1040063)) b!1520692))

(assert (= (and b!1520692 c!139859) b!1520691))

(assert (= (and b!1520692 (not c!139859)) b!1520690))

(assert (= (and b!1520691 res!1040062) b!1520693))

(assert (= (or b!1520693 b!1520690) bm!68361))

(assert (=> b!1520691 m!1403823))

(declare-fun m!1403921 () Bool)

(assert (=> b!1520691 m!1403921))

(declare-fun m!1403923 () Bool)

(assert (=> b!1520691 m!1403923))

(assert (=> b!1520691 m!1403823))

(declare-fun m!1403925 () Bool)

(assert (=> b!1520691 m!1403925))

(assert (=> b!1520692 m!1403823))

(assert (=> b!1520692 m!1403823))

(assert (=> b!1520692 m!1403825))

(declare-fun m!1403927 () Bool)

(assert (=> bm!68361 m!1403927))

(assert (=> b!1520596 d!158965))

(declare-fun d!158967 () Bool)

(assert (=> d!158967 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659183 () Unit!50902)

(declare-fun choose!38 (array!101224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50902)

(assert (=> d!158967 (= lt!659183 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158967 (validMask!0 mask!2512)))

(assert (=> d!158967 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659183)))

(declare-fun bs!43639 () Bool)

(assert (= bs!43639 d!158967))

(assert (=> bs!43639 m!1403853))

(declare-fun m!1403935 () Bool)

(assert (=> bs!43639 m!1403935))

(assert (=> bs!43639 m!1403829))

(assert (=> b!1520596 d!158967))

(declare-fun d!158969 () Bool)

(assert (=> d!158969 (= (validKeyInArray!0 (select (arr!48846 a!2804) i!961)) (and (not (= (select (arr!48846 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48846 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520597 d!158969))

(declare-fun b!1520720 () Bool)

(declare-fun e!848266 () Bool)

(declare-fun lt!659189 () SeekEntryResult!13017)

(assert (=> b!1520720 (= e!848266 (bvsge (x!136143 lt!659189) #b01111111111111111111111111111110))))

(declare-fun b!1520721 () Bool)

(declare-fun e!848265 () SeekEntryResult!13017)

(declare-fun e!848268 () SeekEntryResult!13017)

(assert (=> b!1520721 (= e!848265 e!848268)))

(declare-fun lt!659188 () (_ BitVec 64))

(declare-fun c!139873 () Bool)

(assert (=> b!1520721 (= c!139873 (or (= lt!659188 (select (arr!48846 a!2804) j!70)) (= (bvadd lt!659188 lt!659188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520722 () Bool)

(assert (=> b!1520722 (and (bvsge (index!54465 lt!659189) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659189) (size!49396 a!2804)))))

(declare-fun res!1040064 () Bool)

(assert (=> b!1520722 (= res!1040064 (= (select (arr!48846 a!2804) (index!54465 lt!659189)) (select (arr!48846 a!2804) j!70)))))

(declare-fun e!848264 () Bool)

(assert (=> b!1520722 (=> res!1040064 e!848264)))

(declare-fun e!848267 () Bool)

(assert (=> b!1520722 (= e!848267 e!848264)))

(declare-fun b!1520723 () Bool)

(assert (=> b!1520723 (= e!848266 e!848267)))

(declare-fun res!1040066 () Bool)

(assert (=> b!1520723 (= res!1040066 (and ((_ is Intermediate!13017) lt!659189) (not (undefined!13829 lt!659189)) (bvslt (x!136143 lt!659189) #b01111111111111111111111111111110) (bvsge (x!136143 lt!659189) #b00000000000000000000000000000000) (bvsge (x!136143 lt!659189) x!534)))))

(assert (=> b!1520723 (=> (not res!1040066) (not e!848267))))

(declare-fun b!1520724 () Bool)

(assert (=> b!1520724 (and (bvsge (index!54465 lt!659189) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659189) (size!49396 a!2804)))))

(assert (=> b!1520724 (= e!848264 (= (select (arr!48846 a!2804) (index!54465 lt!659189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520725 () Bool)

(assert (=> b!1520725 (= e!848268 (Intermediate!13017 false index!487 x!534))))

(declare-fun b!1520726 () Bool)

(assert (=> b!1520726 (and (bvsge (index!54465 lt!659189) #b00000000000000000000000000000000) (bvslt (index!54465 lt!659189) (size!49396 a!2804)))))

(declare-fun res!1040065 () Bool)

(assert (=> b!1520726 (= res!1040065 (= (select (arr!48846 a!2804) (index!54465 lt!659189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520726 (=> res!1040065 e!848264)))

(declare-fun d!158973 () Bool)

(assert (=> d!158973 e!848266))

(declare-fun c!139874 () Bool)

(assert (=> d!158973 (= c!139874 (and ((_ is Intermediate!13017) lt!659189) (undefined!13829 lt!659189)))))

(assert (=> d!158973 (= lt!659189 e!848265)))

(declare-fun c!139875 () Bool)

(assert (=> d!158973 (= c!139875 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158973 (= lt!659188 (select (arr!48846 a!2804) index!487))))

(assert (=> d!158973 (validMask!0 mask!2512)))

(assert (=> d!158973 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48846 a!2804) j!70) a!2804 mask!2512) lt!659189)))

(declare-fun b!1520727 () Bool)

(assert (=> b!1520727 (= e!848265 (Intermediate!13017 true index!487 x!534))))

(declare-fun b!1520728 () Bool)

(assert (=> b!1520728 (= e!848268 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158973 c!139875) b!1520727))

(assert (= (and d!158973 (not c!139875)) b!1520721))

(assert (= (and b!1520721 c!139873) b!1520725))

(assert (= (and b!1520721 (not c!139873)) b!1520728))

(assert (= (and d!158973 c!139874) b!1520720))

(assert (= (and d!158973 (not c!139874)) b!1520723))

(assert (= (and b!1520723 res!1040066) b!1520722))

(assert (= (and b!1520722 (not res!1040064)) b!1520726))

(assert (= (and b!1520726 (not res!1040065)) b!1520724))

(declare-fun m!1403937 () Bool)

(assert (=> b!1520728 m!1403937))

(assert (=> b!1520728 m!1403937))

(assert (=> b!1520728 m!1403823))

(declare-fun m!1403939 () Bool)

(assert (=> b!1520728 m!1403939))

(declare-fun m!1403941 () Bool)

(assert (=> b!1520726 m!1403941))

(assert (=> b!1520724 m!1403941))

(assert (=> b!1520722 m!1403941))

(assert (=> d!158973 m!1403851))

(assert (=> d!158973 m!1403829))

(assert (=> b!1520595 d!158973))

(declare-fun d!158975 () Bool)

(assert (=> d!158975 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129498 d!158975))

(declare-fun d!158981 () Bool)

(assert (=> d!158981 (= (array_inv!37874 a!2804) (bvsge (size!49396 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129498 d!158981))

(declare-fun b!1520784 () Bool)

(declare-fun e!848304 () SeekEntryResult!13017)

(declare-fun e!848306 () SeekEntryResult!13017)

(assert (=> b!1520784 (= e!848304 e!848306)))

(declare-fun lt!659230 () (_ BitVec 64))

(declare-fun lt!659233 () SeekEntryResult!13017)

(assert (=> b!1520784 (= lt!659230 (select (arr!48846 a!2804) (index!54465 lt!659233)))))

(declare-fun c!139894 () Bool)

(assert (=> b!1520784 (= c!139894 (= lt!659230 (select (arr!48846 a!2804) j!70)))))

(declare-fun b!1520785 () Bool)

(assert (=> b!1520785 (= e!848304 Undefined!13017)))

(declare-fun b!1520787 () Bool)

(declare-fun c!139895 () Bool)

(assert (=> b!1520787 (= c!139895 (= lt!659230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848305 () SeekEntryResult!13017)

(assert (=> b!1520787 (= e!848306 e!848305)))

(declare-fun b!1520788 () Bool)

(declare-fun lt!659232 () SeekEntryResult!13017)

(assert (=> b!1520788 (= e!848305 (ite ((_ is MissingVacant!13017) lt!659232) (MissingZero!13017 (index!54466 lt!659232)) lt!659232))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101224 (_ BitVec 32)) SeekEntryResult!13017)

(assert (=> b!1520788 (= lt!659232 (seekKeyOrZeroReturnVacant!0 (x!136143 lt!659233) (index!54465 lt!659233) (index!54465 lt!659233) (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520789 () Bool)

(assert (=> b!1520789 (= e!848306 (Found!13017 (index!54465 lt!659233)))))

(declare-fun b!1520786 () Bool)

(assert (=> b!1520786 (= e!848305 (MissingZero!13017 (index!54465 lt!659233)))))

(declare-fun d!158985 () Bool)

(declare-fun lt!659231 () SeekEntryResult!13017)

(assert (=> d!158985 (and (or ((_ is MissingVacant!13017) lt!659231) (not ((_ is Found!13017) lt!659231)) (and (bvsge (index!54464 lt!659231) #b00000000000000000000000000000000) (bvslt (index!54464 lt!659231) (size!49396 a!2804)))) (not ((_ is MissingVacant!13017) lt!659231)) (or (not ((_ is Found!13017) lt!659231)) (= (select (arr!48846 a!2804) (index!54464 lt!659231)) (select (arr!48846 a!2804) j!70))))))

(assert (=> d!158985 (= lt!659231 e!848304)))

(declare-fun c!139893 () Bool)

(assert (=> d!158985 (= c!139893 (and ((_ is Intermediate!13017) lt!659233) (undefined!13829 lt!659233)))))

(assert (=> d!158985 (= lt!659233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158985 (validMask!0 mask!2512)))

(assert (=> d!158985 (= (seekEntry!0 (select (arr!48846 a!2804) j!70) a!2804 mask!2512) lt!659231)))

(assert (= (and d!158985 c!139893) b!1520785))

(assert (= (and d!158985 (not c!139893)) b!1520784))

(assert (= (and b!1520784 c!139894) b!1520789))

(assert (= (and b!1520784 (not c!139894)) b!1520787))

(assert (= (and b!1520787 c!139895) b!1520786))

(assert (= (and b!1520787 (not c!139895)) b!1520788))

(declare-fun m!1403971 () Bool)

(assert (=> b!1520784 m!1403971))

(assert (=> b!1520788 m!1403823))

(declare-fun m!1403973 () Bool)

(assert (=> b!1520788 m!1403973))

(declare-fun m!1403975 () Bool)

(assert (=> d!158985 m!1403975))

(assert (=> d!158985 m!1403823))

(assert (=> d!158985 m!1403855))

(assert (=> d!158985 m!1403855))

(assert (=> d!158985 m!1403823))

(assert (=> d!158985 m!1403857))

(assert (=> d!158985 m!1403829))

(assert (=> b!1520588 d!158985))

(declare-fun b!1520790 () Bool)

(declare-fun e!848308 () Bool)

(declare-fun call!68371 () Bool)

(assert (=> b!1520790 (= e!848308 call!68371)))

(declare-fun b!1520791 () Bool)

(declare-fun e!848309 () Bool)

(assert (=> b!1520791 (= e!848308 e!848309)))

(declare-fun lt!659234 () (_ BitVec 64))

(assert (=> b!1520791 (= lt!659234 (select (arr!48846 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659235 () Unit!50902)

(assert (=> b!1520791 (= lt!659235 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659234 #b00000000000000000000000000000000))))

(assert (=> b!1520791 (arrayContainsKey!0 a!2804 lt!659234 #b00000000000000000000000000000000)))

(declare-fun lt!659236 () Unit!50902)

(assert (=> b!1520791 (= lt!659236 lt!659235)))

(declare-fun res!1040089 () Bool)

(assert (=> b!1520791 (= res!1040089 (= (seekEntryOrOpen!0 (select (arr!48846 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13017 #b00000000000000000000000000000000)))))

(assert (=> b!1520791 (=> (not res!1040089) (not e!848309))))

(declare-fun b!1520792 () Bool)

(declare-fun e!848307 () Bool)

(assert (=> b!1520792 (= e!848307 e!848308)))

(declare-fun c!139896 () Bool)

(assert (=> b!1520792 (= c!139896 (validKeyInArray!0 (select (arr!48846 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520793 () Bool)

(assert (=> b!1520793 (= e!848309 call!68371)))

(declare-fun d!158997 () Bool)

(declare-fun res!1040090 () Bool)

(assert (=> d!158997 (=> res!1040090 e!848307)))

(assert (=> d!158997 (= res!1040090 (bvsge #b00000000000000000000000000000000 (size!49396 a!2804)))))

(assert (=> d!158997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848307)))

(declare-fun bm!68368 () Bool)

(assert (=> bm!68368 (= call!68371 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158997 (not res!1040090)) b!1520792))

(assert (= (and b!1520792 c!139896) b!1520791))

(assert (= (and b!1520792 (not c!139896)) b!1520790))

(assert (= (and b!1520791 res!1040089) b!1520793))

(assert (= (or b!1520793 b!1520790) bm!68368))

(assert (=> b!1520791 m!1403913))

(declare-fun m!1403977 () Bool)

(assert (=> b!1520791 m!1403977))

(declare-fun m!1403979 () Bool)

(assert (=> b!1520791 m!1403979))

(assert (=> b!1520791 m!1403913))

(declare-fun m!1403981 () Bool)

(assert (=> b!1520791 m!1403981))

(assert (=> b!1520792 m!1403913))

(assert (=> b!1520792 m!1403913))

(assert (=> b!1520792 m!1403917))

(declare-fun m!1403983 () Bool)

(assert (=> bm!68368 m!1403983))

(assert (=> b!1520589 d!158997))

(declare-fun d!158999 () Bool)

(assert (=> d!158999 (= (validKeyInArray!0 (select (arr!48846 a!2804) j!70)) (and (not (= (select (arr!48846 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48846 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520594 d!158999))

(check-sat (not d!158949) (not b!1520728) (not b!1520666) (not d!158973) (not bm!68361) (not bm!68358) (not b!1520791) (not d!158967) (not b!1520681) (not d!158953) (not bm!68368) (not b!1520680) (not d!158985) (not b!1520657) (not b!1520792) (not b!1520788) (not b!1520691) (not b!1520692) (not b!1520678))
(check-sat)
