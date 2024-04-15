; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129074 () Bool)

(assert start!129074)

(declare-fun b!1514935 () Bool)

(declare-fun e!845387 () Bool)

(declare-fun e!845386 () Bool)

(assert (=> b!1514935 (= e!845387 e!845386)))

(declare-fun res!1035056 () Bool)

(assert (=> b!1514935 (=> (not res!1035056) (not e!845386))))

(declare-datatypes ((array!100930 0))(
  ( (array!100931 (arr!48703 (Array (_ BitVec 32) (_ BitVec 64))) (size!49255 (_ BitVec 32))) )
))
(declare-fun lt!656453 () array!100930)

(declare-datatypes ((SeekEntryResult!12897 0))(
  ( (MissingZero!12897 (index!53983 (_ BitVec 32))) (Found!12897 (index!53984 (_ BitVec 32))) (Intermediate!12897 (undefined!13709 Bool) (index!53985 (_ BitVec 32)) (x!135689 (_ BitVec 32))) (Undefined!12897) (MissingVacant!12897 (index!53986 (_ BitVec 32))) )
))
(declare-fun lt!656450 () SeekEntryResult!12897)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!656452 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514935 (= res!1035056 (= lt!656450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656452 mask!2512) lt!656452 lt!656453 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100930)

(assert (=> b!1514935 (= lt!656452 (select (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514935 (= lt!656453 (array!100931 (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49255 a!2804)))))

(declare-fun b!1514936 () Bool)

(declare-fun e!845384 () Bool)

(assert (=> b!1514936 (= e!845384 true)))

(declare-fun lt!656445 () SeekEntryResult!12897)

(declare-fun lt!656446 () SeekEntryResult!12897)

(assert (=> b!1514936 (= lt!656445 lt!656446)))

(declare-datatypes ((Unit!50501 0))(
  ( (Unit!50502) )
))
(declare-fun lt!656449 () Unit!50501)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50501)

(assert (=> b!1514936 (= lt!656449 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1514937 () Bool)

(declare-fun res!1035052 () Bool)

(declare-fun e!845385 () Bool)

(assert (=> b!1514937 (=> (not res!1035052) (not e!845385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514937 (= res!1035052 (validKeyInArray!0 (select (arr!48703 a!2804) i!961)))))

(declare-fun b!1514938 () Bool)

(declare-fun res!1035049 () Bool)

(assert (=> b!1514938 (=> (not res!1035049) (not e!845385))))

(assert (=> b!1514938 (= res!1035049 (validKeyInArray!0 (select (arr!48703 a!2804) j!70)))))

(declare-fun b!1514940 () Bool)

(declare-fun e!845382 () Bool)

(assert (=> b!1514940 (= e!845382 e!845384)))

(declare-fun res!1035045 () Bool)

(assert (=> b!1514940 (=> res!1035045 e!845384)))

(assert (=> b!1514940 (= res!1035045 (not (= lt!656446 (Found!12897 j!70))))))

(declare-fun lt!656454 () SeekEntryResult!12897)

(assert (=> b!1514940 (= lt!656454 lt!656445)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1514940 (= lt!656445 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656452 lt!656453 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1514940 (= lt!656454 (seekEntryOrOpen!0 lt!656452 lt!656453 mask!2512))))

(declare-fun lt!656448 () SeekEntryResult!12897)

(assert (=> b!1514940 (= lt!656448 lt!656446)))

(assert (=> b!1514940 (= lt!656446 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1514940 (= lt!656448 (seekEntryOrOpen!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514941 () Bool)

(declare-fun res!1035048 () Bool)

(assert (=> b!1514941 (=> (not res!1035048) (not e!845385))))

(assert (=> b!1514941 (= res!1035048 (and (= (size!49255 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49255 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49255 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514942 () Bool)

(declare-fun res!1035046 () Bool)

(assert (=> b!1514942 (=> (not res!1035046) (not e!845385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100930 (_ BitVec 32)) Bool)

(assert (=> b!1514942 (= res!1035046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514943 () Bool)

(declare-fun e!845388 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100930 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1514943 (= e!845388 (= (seekEntry!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) (Found!12897 j!70)))))

(declare-fun b!1514944 () Bool)

(declare-fun res!1035047 () Bool)

(assert (=> b!1514944 (=> (not res!1035047) (not e!845387))))

(declare-fun lt!656451 () SeekEntryResult!12897)

(assert (=> b!1514944 (= res!1035047 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) lt!656451))))

(declare-fun b!1514945 () Bool)

(declare-fun res!1035044 () Bool)

(assert (=> b!1514945 (=> (not res!1035044) (not e!845385))))

(declare-datatypes ((List!35264 0))(
  ( (Nil!35261) (Cons!35260 (h!36673 (_ BitVec 64)) (t!49950 List!35264)) )
))
(declare-fun arrayNoDuplicates!0 (array!100930 (_ BitVec 32) List!35264) Bool)

(assert (=> b!1514945 (= res!1035044 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35261))))

(declare-fun b!1514939 () Bool)

(assert (=> b!1514939 (= e!845386 (not e!845382))))

(declare-fun res!1035053 () Bool)

(assert (=> b!1514939 (=> res!1035053 e!845382)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514939 (= res!1035053 (or (not (= (select (arr!48703 a!2804) j!70) lt!656452)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48703 a!2804) index!487) (select (arr!48703 a!2804) j!70)) (not (= (select (arr!48703 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1514939 e!845388))

(declare-fun res!1035054 () Bool)

(assert (=> b!1514939 (=> (not res!1035054) (not e!845388))))

(assert (=> b!1514939 (= res!1035054 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656447 () Unit!50501)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50501)

(assert (=> b!1514939 (= lt!656447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1035055 () Bool)

(assert (=> start!129074 (=> (not res!1035055) (not e!845385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129074 (= res!1035055 (validMask!0 mask!2512))))

(assert (=> start!129074 e!845385))

(assert (=> start!129074 true))

(declare-fun array_inv!37936 (array!100930) Bool)

(assert (=> start!129074 (array_inv!37936 a!2804)))

(declare-fun b!1514946 () Bool)

(assert (=> b!1514946 (= e!845385 e!845387)))

(declare-fun res!1035051 () Bool)

(assert (=> b!1514946 (=> (not res!1035051) (not e!845387))))

(assert (=> b!1514946 (= res!1035051 (= lt!656450 lt!656451))))

(assert (=> b!1514946 (= lt!656451 (Intermediate!12897 false resIndex!21 resX!21))))

(assert (=> b!1514946 (= lt!656450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48703 a!2804) j!70) mask!2512) (select (arr!48703 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514947 () Bool)

(declare-fun res!1035050 () Bool)

(assert (=> b!1514947 (=> (not res!1035050) (not e!845385))))

(assert (=> b!1514947 (= res!1035050 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49255 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49255 a!2804))))))

(assert (= (and start!129074 res!1035055) b!1514941))

(assert (= (and b!1514941 res!1035048) b!1514937))

(assert (= (and b!1514937 res!1035052) b!1514938))

(assert (= (and b!1514938 res!1035049) b!1514942))

(assert (= (and b!1514942 res!1035046) b!1514945))

(assert (= (and b!1514945 res!1035044) b!1514947))

(assert (= (and b!1514947 res!1035050) b!1514946))

(assert (= (and b!1514946 res!1035051) b!1514944))

(assert (= (and b!1514944 res!1035047) b!1514935))

(assert (= (and b!1514935 res!1035056) b!1514939))

(assert (= (and b!1514939 res!1035054) b!1514943))

(assert (= (and b!1514939 (not res!1035053)) b!1514940))

(assert (= (and b!1514940 (not res!1035045)) b!1514936))

(declare-fun m!1397435 () Bool)

(assert (=> b!1514940 m!1397435))

(declare-fun m!1397437 () Bool)

(assert (=> b!1514940 m!1397437))

(assert (=> b!1514940 m!1397435))

(declare-fun m!1397439 () Bool)

(assert (=> b!1514940 m!1397439))

(declare-fun m!1397441 () Bool)

(assert (=> b!1514940 m!1397441))

(assert (=> b!1514940 m!1397435))

(declare-fun m!1397443 () Bool)

(assert (=> b!1514940 m!1397443))

(assert (=> b!1514946 m!1397435))

(assert (=> b!1514946 m!1397435))

(declare-fun m!1397445 () Bool)

(assert (=> b!1514946 m!1397445))

(assert (=> b!1514946 m!1397445))

(assert (=> b!1514946 m!1397435))

(declare-fun m!1397447 () Bool)

(assert (=> b!1514946 m!1397447))

(assert (=> b!1514943 m!1397435))

(assert (=> b!1514943 m!1397435))

(declare-fun m!1397449 () Bool)

(assert (=> b!1514943 m!1397449))

(assert (=> b!1514939 m!1397435))

(declare-fun m!1397451 () Bool)

(assert (=> b!1514939 m!1397451))

(declare-fun m!1397453 () Bool)

(assert (=> b!1514939 m!1397453))

(declare-fun m!1397455 () Bool)

(assert (=> b!1514939 m!1397455))

(assert (=> b!1514938 m!1397435))

(assert (=> b!1514938 m!1397435))

(declare-fun m!1397457 () Bool)

(assert (=> b!1514938 m!1397457))

(declare-fun m!1397459 () Bool)

(assert (=> b!1514937 m!1397459))

(assert (=> b!1514937 m!1397459))

(declare-fun m!1397461 () Bool)

(assert (=> b!1514937 m!1397461))

(declare-fun m!1397463 () Bool)

(assert (=> b!1514935 m!1397463))

(assert (=> b!1514935 m!1397463))

(declare-fun m!1397465 () Bool)

(assert (=> b!1514935 m!1397465))

(declare-fun m!1397467 () Bool)

(assert (=> b!1514935 m!1397467))

(declare-fun m!1397469 () Bool)

(assert (=> b!1514935 m!1397469))

(declare-fun m!1397471 () Bool)

(assert (=> b!1514945 m!1397471))

(declare-fun m!1397473 () Bool)

(assert (=> start!129074 m!1397473))

(declare-fun m!1397475 () Bool)

(assert (=> start!129074 m!1397475))

(assert (=> b!1514944 m!1397435))

(assert (=> b!1514944 m!1397435))

(declare-fun m!1397477 () Bool)

(assert (=> b!1514944 m!1397477))

(declare-fun m!1397479 () Bool)

(assert (=> b!1514936 m!1397479))

(declare-fun m!1397481 () Bool)

(assert (=> b!1514942 m!1397481))

(check-sat (not b!1514943) (not b!1514942) (not b!1514939) (not b!1514946) (not b!1514935) (not b!1514940) (not b!1514944) (not b!1514937) (not b!1514945) (not start!129074) (not b!1514938) (not b!1514936))
(check-sat)
