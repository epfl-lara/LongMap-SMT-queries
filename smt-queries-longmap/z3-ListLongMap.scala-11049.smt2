; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129128 () Bool)

(assert start!129128)

(declare-fun b!1515314 () Bool)

(declare-fun res!1035227 () Bool)

(declare-fun e!845621 () Bool)

(assert (=> b!1515314 (=> (not res!1035227) (not e!845621))))

(declare-datatypes ((SeekEntryResult!12900 0))(
  ( (MissingZero!12900 (index!53995 (_ BitVec 32))) (Found!12900 (index!53996 (_ BitVec 32))) (Intermediate!12900 (undefined!13712 Bool) (index!53997 (_ BitVec 32)) (x!135698 (_ BitVec 32))) (Undefined!12900) (MissingVacant!12900 (index!53998 (_ BitVec 32))) )
))
(declare-fun lt!656773 () SeekEntryResult!12900)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100984 0))(
  ( (array!100985 (arr!48729 (Array (_ BitVec 32) (_ BitVec 64))) (size!49279 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100984)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515314 (= res!1035227 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48729 a!2804) j!70) a!2804 mask!2512) lt!656773))))

(declare-fun b!1515315 () Bool)

(declare-fun res!1035226 () Bool)

(declare-fun e!845618 () Bool)

(assert (=> b!1515315 (=> (not res!1035226) (not e!845618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515315 (= res!1035226 (validKeyInArray!0 (select (arr!48729 a!2804) j!70)))))

(declare-fun res!1035219 () Bool)

(assert (=> start!129128 (=> (not res!1035219) (not e!845618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129128 (= res!1035219 (validMask!0 mask!2512))))

(assert (=> start!129128 e!845618))

(assert (=> start!129128 true))

(declare-fun array_inv!37757 (array!100984) Bool)

(assert (=> start!129128 (array_inv!37757 a!2804)))

(declare-fun b!1515316 () Bool)

(declare-fun e!845620 () Bool)

(assert (=> b!1515316 (= e!845621 e!845620)))

(declare-fun res!1035228 () Bool)

(assert (=> b!1515316 (=> (not res!1035228) (not e!845620))))

(declare-fun lt!656777 () SeekEntryResult!12900)

(declare-fun lt!656778 () (_ BitVec 64))

(declare-fun lt!656775 () array!100984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515316 (= res!1035228 (= lt!656777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656778 mask!2512) lt!656778 lt!656775 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515316 (= lt!656778 (select (store (arr!48729 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515316 (= lt!656775 (array!100985 (store (arr!48729 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49279 a!2804)))))

(declare-fun b!1515317 () Bool)

(declare-fun res!1035217 () Bool)

(assert (=> b!1515317 (=> (not res!1035217) (not e!845618))))

(assert (=> b!1515317 (= res!1035217 (validKeyInArray!0 (select (arr!48729 a!2804) i!961)))))

(declare-fun b!1515318 () Bool)

(declare-fun e!845623 () Bool)

(assert (=> b!1515318 (= e!845620 (not e!845623))))

(declare-fun res!1035224 () Bool)

(assert (=> b!1515318 (=> res!1035224 e!845623)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515318 (= res!1035224 (or (not (= (select (arr!48729 a!2804) j!70) lt!656778)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48729 a!2804) index!487) (select (arr!48729 a!2804) j!70)) (not (= (select (arr!48729 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845619 () Bool)

(assert (=> b!1515318 e!845619))

(declare-fun res!1035229 () Bool)

(assert (=> b!1515318 (=> (not res!1035229) (not e!845619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100984 (_ BitVec 32)) Bool)

(assert (=> b!1515318 (= res!1035229 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50668 0))(
  ( (Unit!50669) )
))
(declare-fun lt!656771 () Unit!50668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50668)

(assert (=> b!1515318 (= lt!656771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515319 () Bool)

(declare-fun e!845617 () Bool)

(assert (=> b!1515319 (= e!845617 true)))

(declare-fun lt!656772 () SeekEntryResult!12900)

(declare-fun lt!656774 () SeekEntryResult!12900)

(assert (=> b!1515319 (= lt!656772 lt!656774)))

(declare-fun lt!656779 () Unit!50668)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50668)

(assert (=> b!1515319 (= lt!656779 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515320 () Bool)

(assert (=> b!1515320 (= e!845618 e!845621)))

(declare-fun res!1035221 () Bool)

(assert (=> b!1515320 (=> (not res!1035221) (not e!845621))))

(assert (=> b!1515320 (= res!1035221 (= lt!656777 lt!656773))))

(assert (=> b!1515320 (= lt!656773 (Intermediate!12900 false resIndex!21 resX!21))))

(assert (=> b!1515320 (= lt!656777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48729 a!2804) j!70) mask!2512) (select (arr!48729 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515321 () Bool)

(assert (=> b!1515321 (= e!845623 e!845617)))

(declare-fun res!1035223 () Bool)

(assert (=> b!1515321 (=> res!1035223 e!845617)))

(assert (=> b!1515321 (= res!1035223 (not (= lt!656774 (Found!12900 j!70))))))

(declare-fun lt!656776 () SeekEntryResult!12900)

(assert (=> b!1515321 (= lt!656776 lt!656772)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515321 (= lt!656772 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656778 lt!656775 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515321 (= lt!656776 (seekEntryOrOpen!0 lt!656778 lt!656775 mask!2512))))

(declare-fun lt!656770 () SeekEntryResult!12900)

(assert (=> b!1515321 (= lt!656770 lt!656774)))

(assert (=> b!1515321 (= lt!656774 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48729 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515321 (= lt!656770 (seekEntryOrOpen!0 (select (arr!48729 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515322 () Bool)

(declare-fun res!1035218 () Bool)

(assert (=> b!1515322 (=> (not res!1035218) (not e!845618))))

(declare-datatypes ((List!35212 0))(
  ( (Nil!35209) (Cons!35208 (h!36620 (_ BitVec 64)) (t!49906 List!35212)) )
))
(declare-fun arrayNoDuplicates!0 (array!100984 (_ BitVec 32) List!35212) Bool)

(assert (=> b!1515322 (= res!1035218 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35209))))

(declare-fun b!1515323 () Bool)

(declare-fun res!1035222 () Bool)

(assert (=> b!1515323 (=> (not res!1035222) (not e!845618))))

(assert (=> b!1515323 (= res!1035222 (and (= (size!49279 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49279 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49279 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515324 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12900)

(assert (=> b!1515324 (= e!845619 (= (seekEntry!0 (select (arr!48729 a!2804) j!70) a!2804 mask!2512) (Found!12900 j!70)))))

(declare-fun b!1515325 () Bool)

(declare-fun res!1035225 () Bool)

(assert (=> b!1515325 (=> (not res!1035225) (not e!845618))))

(assert (=> b!1515325 (= res!1035225 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49279 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49279 a!2804))))))

(declare-fun b!1515326 () Bool)

(declare-fun res!1035220 () Bool)

(assert (=> b!1515326 (=> (not res!1035220) (not e!845618))))

(assert (=> b!1515326 (= res!1035220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129128 res!1035219) b!1515323))

(assert (= (and b!1515323 res!1035222) b!1515317))

(assert (= (and b!1515317 res!1035217) b!1515315))

(assert (= (and b!1515315 res!1035226) b!1515326))

(assert (= (and b!1515326 res!1035220) b!1515322))

(assert (= (and b!1515322 res!1035218) b!1515325))

(assert (= (and b!1515325 res!1035225) b!1515320))

(assert (= (and b!1515320 res!1035221) b!1515314))

(assert (= (and b!1515314 res!1035227) b!1515316))

(assert (= (and b!1515316 res!1035228) b!1515318))

(assert (= (and b!1515318 res!1035229) b!1515324))

(assert (= (and b!1515318 (not res!1035224)) b!1515321))

(assert (= (and b!1515321 (not res!1035223)) b!1515319))

(declare-fun m!1398391 () Bool)

(assert (=> b!1515326 m!1398391))

(declare-fun m!1398393 () Bool)

(assert (=> b!1515315 m!1398393))

(assert (=> b!1515315 m!1398393))

(declare-fun m!1398395 () Bool)

(assert (=> b!1515315 m!1398395))

(assert (=> b!1515318 m!1398393))

(declare-fun m!1398397 () Bool)

(assert (=> b!1515318 m!1398397))

(declare-fun m!1398399 () Bool)

(assert (=> b!1515318 m!1398399))

(declare-fun m!1398401 () Bool)

(assert (=> b!1515318 m!1398401))

(declare-fun m!1398403 () Bool)

(assert (=> start!129128 m!1398403))

(declare-fun m!1398405 () Bool)

(assert (=> start!129128 m!1398405))

(assert (=> b!1515320 m!1398393))

(assert (=> b!1515320 m!1398393))

(declare-fun m!1398407 () Bool)

(assert (=> b!1515320 m!1398407))

(assert (=> b!1515320 m!1398407))

(assert (=> b!1515320 m!1398393))

(declare-fun m!1398409 () Bool)

(assert (=> b!1515320 m!1398409))

(assert (=> b!1515321 m!1398393))

(declare-fun m!1398411 () Bool)

(assert (=> b!1515321 m!1398411))

(assert (=> b!1515321 m!1398393))

(declare-fun m!1398413 () Bool)

(assert (=> b!1515321 m!1398413))

(declare-fun m!1398415 () Bool)

(assert (=> b!1515321 m!1398415))

(assert (=> b!1515321 m!1398393))

(declare-fun m!1398417 () Bool)

(assert (=> b!1515321 m!1398417))

(declare-fun m!1398419 () Bool)

(assert (=> b!1515322 m!1398419))

(declare-fun m!1398421 () Bool)

(assert (=> b!1515317 m!1398421))

(assert (=> b!1515317 m!1398421))

(declare-fun m!1398423 () Bool)

(assert (=> b!1515317 m!1398423))

(assert (=> b!1515314 m!1398393))

(assert (=> b!1515314 m!1398393))

(declare-fun m!1398425 () Bool)

(assert (=> b!1515314 m!1398425))

(declare-fun m!1398427 () Bool)

(assert (=> b!1515316 m!1398427))

(assert (=> b!1515316 m!1398427))

(declare-fun m!1398429 () Bool)

(assert (=> b!1515316 m!1398429))

(declare-fun m!1398431 () Bool)

(assert (=> b!1515316 m!1398431))

(declare-fun m!1398433 () Bool)

(assert (=> b!1515316 m!1398433))

(assert (=> b!1515324 m!1398393))

(assert (=> b!1515324 m!1398393))

(declare-fun m!1398435 () Bool)

(assert (=> b!1515324 m!1398435))

(declare-fun m!1398437 () Bool)

(assert (=> b!1515319 m!1398437))

(check-sat (not b!1515318) (not b!1515316) (not start!129128) (not b!1515320) (not b!1515314) (not b!1515317) (not b!1515321) (not b!1515319) (not b!1515322) (not b!1515315) (not b!1515324) (not b!1515326))
(check-sat)
