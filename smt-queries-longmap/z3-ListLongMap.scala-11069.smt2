; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129194 () Bool)

(assert start!129194)

(declare-fun b!1517212 () Bool)

(declare-fun e!846452 () Bool)

(declare-fun e!846451 () Bool)

(assert (=> b!1517212 (= e!846452 (not e!846451))))

(declare-fun res!1037329 () Bool)

(assert (=> b!1517212 (=> res!1037329 e!846451)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101050 0))(
  ( (array!101051 (arr!48763 (Array (_ BitVec 32) (_ BitVec 64))) (size!49315 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101050)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517212 (= res!1037329 (or (not (= (select (arr!48763 a!2804) j!70) (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846455 () Bool)

(assert (=> b!1517212 e!846455))

(declare-fun res!1037332 () Bool)

(assert (=> b!1517212 (=> (not res!1037332) (not e!846455))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101050 (_ BitVec 32)) Bool)

(assert (=> b!1517212 (= res!1037332 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50621 0))(
  ( (Unit!50622) )
))
(declare-fun lt!657536 () Unit!50621)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50621)

(assert (=> b!1517212 (= lt!657536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517213 () Bool)

(declare-fun res!1037326 () Bool)

(assert (=> b!1517213 (=> (not res!1037326) (not e!846452))))

(declare-datatypes ((SeekEntryResult!12957 0))(
  ( (MissingZero!12957 (index!54223 (_ BitVec 32))) (Found!12957 (index!54224 (_ BitVec 32))) (Intermediate!12957 (undefined!13769 Bool) (index!54225 (_ BitVec 32)) (x!135909 (_ BitVec 32))) (Undefined!12957) (MissingVacant!12957 (index!54226 (_ BitVec 32))) )
))
(declare-fun lt!657534 () SeekEntryResult!12957)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517213 (= res!1037326 (= lt!657534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101051 (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49315 a!2804)) mask!2512)))))

(declare-fun res!1037321 () Bool)

(declare-fun e!846453 () Bool)

(assert (=> start!129194 (=> (not res!1037321) (not e!846453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129194 (= res!1037321 (validMask!0 mask!2512))))

(assert (=> start!129194 e!846453))

(assert (=> start!129194 true))

(declare-fun array_inv!37996 (array!101050) Bool)

(assert (=> start!129194 (array_inv!37996 a!2804)))

(declare-fun b!1517214 () Bool)

(declare-fun res!1037327 () Bool)

(assert (=> b!1517214 (=> (not res!1037327) (not e!846453))))

(declare-datatypes ((List!35324 0))(
  ( (Nil!35321) (Cons!35320 (h!36733 (_ BitVec 64)) (t!50010 List!35324)) )
))
(declare-fun arrayNoDuplicates!0 (array!101050 (_ BitVec 32) List!35324) Bool)

(assert (=> b!1517214 (= res!1037327 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35321))))

(declare-fun b!1517215 () Bool)

(declare-fun res!1037333 () Bool)

(assert (=> b!1517215 (=> (not res!1037333) (not e!846453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517215 (= res!1037333 (validKeyInArray!0 (select (arr!48763 a!2804) j!70)))))

(declare-fun b!1517216 () Bool)

(assert (=> b!1517216 (= e!846453 e!846452)))

(declare-fun res!1037324 () Bool)

(assert (=> b!1517216 (=> (not res!1037324) (not e!846452))))

(declare-fun lt!657537 () SeekEntryResult!12957)

(assert (=> b!1517216 (= res!1037324 (= lt!657534 lt!657537))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517216 (= lt!657537 (Intermediate!12957 false resIndex!21 resX!21))))

(assert (=> b!1517216 (= lt!657534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48763 a!2804) j!70) mask!2512) (select (arr!48763 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517217 () Bool)

(declare-fun res!1037331 () Bool)

(assert (=> b!1517217 (=> (not res!1037331) (not e!846453))))

(assert (=> b!1517217 (= res!1037331 (and (= (size!49315 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49315 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49315 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517218 () Bool)

(declare-fun res!1037328 () Bool)

(assert (=> b!1517218 (=> (not res!1037328) (not e!846453))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1517218 (= res!1037328 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49315 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49315 a!2804))))))

(declare-fun b!1517219 () Bool)

(declare-fun e!846454 () Bool)

(assert (=> b!1517219 (= e!846451 e!846454)))

(declare-fun res!1037325 () Bool)

(assert (=> b!1517219 (=> res!1037325 e!846454)))

(declare-fun lt!657533 () (_ BitVec 32))

(assert (=> b!1517219 (= res!1037325 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657533 #b00000000000000000000000000000000) (bvsge lt!657533 (size!49315 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517219 (= lt!657533 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517220 () Bool)

(declare-fun res!1037322 () Bool)

(assert (=> b!1517220 (=> (not res!1037322) (not e!846453))))

(assert (=> b!1517220 (= res!1037322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517221 () Bool)

(declare-fun res!1037330 () Bool)

(assert (=> b!1517221 (=> (not res!1037330) (not e!846452))))

(assert (=> b!1517221 (= res!1037330 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) lt!657537))))

(declare-fun b!1517222 () Bool)

(declare-fun res!1037323 () Bool)

(assert (=> b!1517222 (=> (not res!1037323) (not e!846453))))

(assert (=> b!1517222 (= res!1037323 (validKeyInArray!0 (select (arr!48763 a!2804) i!961)))))

(declare-fun b!1517223 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12957)

(assert (=> b!1517223 (= e!846455 (= (seekEntry!0 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) (Found!12957 j!70)))))

(declare-fun b!1517224 () Bool)

(assert (=> b!1517224 (= e!846454 true)))

(declare-fun lt!657535 () SeekEntryResult!12957)

(assert (=> b!1517224 (= lt!657535 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657533 (select (arr!48763 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129194 res!1037321) b!1517217))

(assert (= (and b!1517217 res!1037331) b!1517222))

(assert (= (and b!1517222 res!1037323) b!1517215))

(assert (= (and b!1517215 res!1037333) b!1517220))

(assert (= (and b!1517220 res!1037322) b!1517214))

(assert (= (and b!1517214 res!1037327) b!1517218))

(assert (= (and b!1517218 res!1037328) b!1517216))

(assert (= (and b!1517216 res!1037324) b!1517221))

(assert (= (and b!1517221 res!1037330) b!1517213))

(assert (= (and b!1517213 res!1037326) b!1517212))

(assert (= (and b!1517212 res!1037332) b!1517223))

(assert (= (and b!1517212 (not res!1037329)) b!1517219))

(assert (= (and b!1517219 (not res!1037325)) b!1517224))

(declare-fun m!1399937 () Bool)

(assert (=> b!1517220 m!1399937))

(declare-fun m!1399939 () Bool)

(assert (=> b!1517213 m!1399939))

(declare-fun m!1399941 () Bool)

(assert (=> b!1517213 m!1399941))

(assert (=> b!1517213 m!1399941))

(declare-fun m!1399943 () Bool)

(assert (=> b!1517213 m!1399943))

(assert (=> b!1517213 m!1399943))

(assert (=> b!1517213 m!1399941))

(declare-fun m!1399945 () Bool)

(assert (=> b!1517213 m!1399945))

(declare-fun m!1399947 () Bool)

(assert (=> start!129194 m!1399947))

(declare-fun m!1399949 () Bool)

(assert (=> start!129194 m!1399949))

(declare-fun m!1399951 () Bool)

(assert (=> b!1517224 m!1399951))

(assert (=> b!1517224 m!1399951))

(declare-fun m!1399953 () Bool)

(assert (=> b!1517224 m!1399953))

(declare-fun m!1399955 () Bool)

(assert (=> b!1517222 m!1399955))

(assert (=> b!1517222 m!1399955))

(declare-fun m!1399957 () Bool)

(assert (=> b!1517222 m!1399957))

(assert (=> b!1517216 m!1399951))

(assert (=> b!1517216 m!1399951))

(declare-fun m!1399959 () Bool)

(assert (=> b!1517216 m!1399959))

(assert (=> b!1517216 m!1399959))

(assert (=> b!1517216 m!1399951))

(declare-fun m!1399961 () Bool)

(assert (=> b!1517216 m!1399961))

(assert (=> b!1517221 m!1399951))

(assert (=> b!1517221 m!1399951))

(declare-fun m!1399963 () Bool)

(assert (=> b!1517221 m!1399963))

(declare-fun m!1399965 () Bool)

(assert (=> b!1517214 m!1399965))

(assert (=> b!1517215 m!1399951))

(assert (=> b!1517215 m!1399951))

(declare-fun m!1399967 () Bool)

(assert (=> b!1517215 m!1399967))

(declare-fun m!1399969 () Bool)

(assert (=> b!1517219 m!1399969))

(assert (=> b!1517223 m!1399951))

(assert (=> b!1517223 m!1399951))

(declare-fun m!1399971 () Bool)

(assert (=> b!1517223 m!1399971))

(assert (=> b!1517212 m!1399951))

(declare-fun m!1399973 () Bool)

(assert (=> b!1517212 m!1399973))

(assert (=> b!1517212 m!1399939))

(assert (=> b!1517212 m!1399941))

(declare-fun m!1399975 () Bool)

(assert (=> b!1517212 m!1399975))

(check-sat (not b!1517214) (not b!1517223) (not b!1517222) (not b!1517224) (not b!1517212) (not b!1517215) (not start!129194) (not b!1517213) (not b!1517219) (not b!1517216) (not b!1517221) (not b!1517220))
(check-sat)
