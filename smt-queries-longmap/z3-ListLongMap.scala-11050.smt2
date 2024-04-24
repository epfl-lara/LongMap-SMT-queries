; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129434 () Bool)

(assert start!129434)

(declare-fun b!1517224 () Bool)

(declare-fun res!1035954 () Bool)

(declare-fun e!846801 () Bool)

(assert (=> b!1517224 (=> (not res!1035954) (not e!846801))))

(declare-datatypes ((array!101104 0))(
  ( (array!101105 (arr!48784 (Array (_ BitVec 32) (_ BitVec 64))) (size!49335 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101104)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517224 (= res!1035954 (validKeyInArray!0 (select (arr!48784 a!2804) i!961)))))

(declare-fun b!1517225 () Bool)

(declare-fun e!846799 () Bool)

(assert (=> b!1517225 (= e!846801 e!846799)))

(declare-fun res!1035956 () Bool)

(assert (=> b!1517225 (=> (not res!1035956) (not e!846799))))

(declare-datatypes ((SeekEntryResult!12848 0))(
  ( (MissingZero!12848 (index!53787 (_ BitVec 32))) (Found!12848 (index!53788 (_ BitVec 32))) (Intermediate!12848 (undefined!13660 Bool) (index!53789 (_ BitVec 32)) (x!135691 (_ BitVec 32))) (Undefined!12848) (MissingVacant!12848 (index!53790 (_ BitVec 32))) )
))
(declare-fun lt!657498 () SeekEntryResult!12848)

(declare-fun lt!657494 () SeekEntryResult!12848)

(assert (=> b!1517225 (= res!1035956 (= lt!657498 lt!657494))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517225 (= lt!657494 (Intermediate!12848 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517225 (= lt!657498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48784 a!2804) j!70) mask!2512) (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517226 () Bool)

(declare-fun res!1035953 () Bool)

(assert (=> b!1517226 (=> (not res!1035953) (not e!846801))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517226 (= res!1035953 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49335 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49335 a!2804))))))

(declare-fun b!1517227 () Bool)

(declare-fun res!1035958 () Bool)

(assert (=> b!1517227 (=> (not res!1035958) (not e!846801))))

(assert (=> b!1517227 (= res!1035958 (validKeyInArray!0 (select (arr!48784 a!2804) j!70)))))

(declare-fun res!1035952 () Bool)

(assert (=> start!129434 (=> (not res!1035952) (not e!846801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129434 (= res!1035952 (validMask!0 mask!2512))))

(assert (=> start!129434 e!846801))

(assert (=> start!129434 true))

(declare-fun array_inv!38065 (array!101104) Bool)

(assert (=> start!129434 (array_inv!38065 a!2804)))

(declare-fun b!1517228 () Bool)

(declare-fun res!1035951 () Bool)

(assert (=> b!1517228 (=> (not res!1035951) (not e!846801))))

(declare-datatypes ((List!35254 0))(
  ( (Nil!35251) (Cons!35250 (h!36677 (_ BitVec 64)) (t!49940 List!35254)) )
))
(declare-fun arrayNoDuplicates!0 (array!101104 (_ BitVec 32) List!35254) Bool)

(assert (=> b!1517228 (= res!1035951 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35251))))

(declare-fun b!1517229 () Bool)

(declare-fun e!846800 () Bool)

(declare-fun e!846795 () Bool)

(assert (=> b!1517229 (= e!846800 e!846795)))

(declare-fun res!1035961 () Bool)

(assert (=> b!1517229 (=> res!1035961 e!846795)))

(declare-fun lt!657496 () SeekEntryResult!12848)

(assert (=> b!1517229 (= res!1035961 (not (= lt!657496 (Found!12848 j!70))))))

(declare-fun lt!657501 () SeekEntryResult!12848)

(declare-fun lt!657499 () SeekEntryResult!12848)

(assert (=> b!1517229 (= lt!657501 lt!657499)))

(declare-fun lt!657493 () (_ BitVec 64))

(declare-fun lt!657502 () array!101104)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12848)

(assert (=> b!1517229 (= lt!657499 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657493 lt!657502 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12848)

(assert (=> b!1517229 (= lt!657501 (seekEntryOrOpen!0 lt!657493 lt!657502 mask!2512))))

(declare-fun lt!657495 () SeekEntryResult!12848)

(assert (=> b!1517229 (= lt!657495 lt!657496)))

(assert (=> b!1517229 (= lt!657496 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517229 (= lt!657495 (seekEntryOrOpen!0 (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517230 () Bool)

(declare-fun res!1035950 () Bool)

(assert (=> b!1517230 (=> (not res!1035950) (not e!846801))))

(assert (=> b!1517230 (= res!1035950 (and (= (size!49335 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49335 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49335 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517231 () Bool)

(declare-fun res!1035959 () Bool)

(assert (=> b!1517231 (=> (not res!1035959) (not e!846801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101104 (_ BitVec 32)) Bool)

(assert (=> b!1517231 (= res!1035959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517232 () Bool)

(declare-fun e!846797 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12848)

(assert (=> b!1517232 (= e!846797 (= (seekEntry!0 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) (Found!12848 j!70)))))

(declare-fun b!1517233 () Bool)

(declare-fun e!846798 () Bool)

(assert (=> b!1517233 (= e!846798 (not e!846800))))

(declare-fun res!1035960 () Bool)

(assert (=> b!1517233 (=> res!1035960 e!846800)))

(assert (=> b!1517233 (= res!1035960 (or (not (= (select (arr!48784 a!2804) j!70) lt!657493)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48784 a!2804) index!487) (select (arr!48784 a!2804) j!70)) (not (= (select (arr!48784 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517233 e!846797))

(declare-fun res!1035955 () Bool)

(assert (=> b!1517233 (=> (not res!1035955) (not e!846797))))

(assert (=> b!1517233 (= res!1035955 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50599 0))(
  ( (Unit!50600) )
))
(declare-fun lt!657497 () Unit!50599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50599)

(assert (=> b!1517233 (= lt!657497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517234 () Bool)

(declare-fun res!1035957 () Bool)

(assert (=> b!1517234 (=> (not res!1035957) (not e!846799))))

(assert (=> b!1517234 (= res!1035957 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) lt!657494))))

(declare-fun b!1517235 () Bool)

(assert (=> b!1517235 (= e!846799 e!846798)))

(declare-fun res!1035962 () Bool)

(assert (=> b!1517235 (=> (not res!1035962) (not e!846798))))

(assert (=> b!1517235 (= res!1035962 (= lt!657498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657493 mask!2512) lt!657493 lt!657502 mask!2512)))))

(assert (=> b!1517235 (= lt!657493 (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517235 (= lt!657502 (array!101105 (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49335 a!2804)))))

(declare-fun b!1517236 () Bool)

(assert (=> b!1517236 (= e!846795 true)))

(assert (=> b!1517236 (= lt!657499 lt!657496)))

(declare-fun lt!657500 () Unit!50599)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50599)

(assert (=> b!1517236 (= lt!657500 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!129434 res!1035952) b!1517230))

(assert (= (and b!1517230 res!1035950) b!1517224))

(assert (= (and b!1517224 res!1035954) b!1517227))

(assert (= (and b!1517227 res!1035958) b!1517231))

(assert (= (and b!1517231 res!1035959) b!1517228))

(assert (= (and b!1517228 res!1035951) b!1517226))

(assert (= (and b!1517226 res!1035953) b!1517225))

(assert (= (and b!1517225 res!1035956) b!1517234))

(assert (= (and b!1517234 res!1035957) b!1517235))

(assert (= (and b!1517235 res!1035962) b!1517233))

(assert (= (and b!1517233 res!1035955) b!1517232))

(assert (= (and b!1517233 (not res!1035960)) b!1517229))

(assert (= (and b!1517229 (not res!1035961)) b!1517236))

(declare-fun m!1400283 () Bool)

(assert (=> b!1517227 m!1400283))

(assert (=> b!1517227 m!1400283))

(declare-fun m!1400285 () Bool)

(assert (=> b!1517227 m!1400285))

(declare-fun m!1400287 () Bool)

(assert (=> b!1517235 m!1400287))

(assert (=> b!1517235 m!1400287))

(declare-fun m!1400289 () Bool)

(assert (=> b!1517235 m!1400289))

(declare-fun m!1400291 () Bool)

(assert (=> b!1517235 m!1400291))

(declare-fun m!1400293 () Bool)

(assert (=> b!1517235 m!1400293))

(assert (=> b!1517234 m!1400283))

(assert (=> b!1517234 m!1400283))

(declare-fun m!1400295 () Bool)

(assert (=> b!1517234 m!1400295))

(declare-fun m!1400297 () Bool)

(assert (=> b!1517231 m!1400297))

(declare-fun m!1400299 () Bool)

(assert (=> b!1517229 m!1400299))

(assert (=> b!1517229 m!1400283))

(declare-fun m!1400301 () Bool)

(assert (=> b!1517229 m!1400301))

(assert (=> b!1517229 m!1400283))

(assert (=> b!1517229 m!1400283))

(declare-fun m!1400303 () Bool)

(assert (=> b!1517229 m!1400303))

(declare-fun m!1400305 () Bool)

(assert (=> b!1517229 m!1400305))

(declare-fun m!1400307 () Bool)

(assert (=> start!129434 m!1400307))

(declare-fun m!1400309 () Bool)

(assert (=> start!129434 m!1400309))

(assert (=> b!1517225 m!1400283))

(assert (=> b!1517225 m!1400283))

(declare-fun m!1400311 () Bool)

(assert (=> b!1517225 m!1400311))

(assert (=> b!1517225 m!1400311))

(assert (=> b!1517225 m!1400283))

(declare-fun m!1400313 () Bool)

(assert (=> b!1517225 m!1400313))

(declare-fun m!1400315 () Bool)

(assert (=> b!1517224 m!1400315))

(assert (=> b!1517224 m!1400315))

(declare-fun m!1400317 () Bool)

(assert (=> b!1517224 m!1400317))

(declare-fun m!1400319 () Bool)

(assert (=> b!1517236 m!1400319))

(assert (=> b!1517233 m!1400283))

(declare-fun m!1400321 () Bool)

(assert (=> b!1517233 m!1400321))

(declare-fun m!1400323 () Bool)

(assert (=> b!1517233 m!1400323))

(declare-fun m!1400325 () Bool)

(assert (=> b!1517233 m!1400325))

(declare-fun m!1400327 () Bool)

(assert (=> b!1517228 m!1400327))

(assert (=> b!1517232 m!1400283))

(assert (=> b!1517232 m!1400283))

(declare-fun m!1400329 () Bool)

(assert (=> b!1517232 m!1400329))

(check-sat (not b!1517235) (not b!1517224) (not b!1517227) (not b!1517225) (not b!1517228) (not b!1517231) (not b!1517233) (not start!129434) (not b!1517236) (not b!1517234) (not b!1517229) (not b!1517232))
(check-sat)
