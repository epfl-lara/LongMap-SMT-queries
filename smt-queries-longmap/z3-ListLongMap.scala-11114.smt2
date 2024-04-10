; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129790 () Bool)

(assert start!129790)

(declare-fun b!1523512 () Bool)

(declare-fun res!1042429 () Bool)

(declare-fun e!849365 () Bool)

(assert (=> b!1523512 (=> (not res!1042429) (not e!849365))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101386 0))(
  ( (array!101387 (arr!48924 (Array (_ BitVec 32) (_ BitVec 64))) (size!49474 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101386)

(declare-datatypes ((SeekEntryResult!13089 0))(
  ( (MissingZero!13089 (index!54751 (_ BitVec 32))) (Found!13089 (index!54752 (_ BitVec 32))) (Intermediate!13089 (undefined!13901 Bool) (index!54753 (_ BitVec 32)) (x!136439 (_ BitVec 32))) (Undefined!13089) (MissingVacant!13089 (index!54754 (_ BitVec 32))) )
))
(declare-fun lt!659973 () SeekEntryResult!13089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523512 (= res!1042429 (= lt!659973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48924 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48924 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101387 (store (arr!48924 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49474 a!2804)) mask!2512)))))

(declare-fun res!1042421 () Bool)

(declare-fun e!849366 () Bool)

(assert (=> start!129790 (=> (not res!1042421) (not e!849366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129790 (= res!1042421 (validMask!0 mask!2512))))

(assert (=> start!129790 e!849366))

(assert (=> start!129790 true))

(declare-fun array_inv!37952 (array!101386) Bool)

(assert (=> start!129790 (array_inv!37952 a!2804)))

(declare-fun b!1523513 () Bool)

(declare-fun res!1042423 () Bool)

(assert (=> b!1523513 (=> (not res!1042423) (not e!849366))))

(declare-datatypes ((List!35407 0))(
  ( (Nil!35404) (Cons!35403 (h!36827 (_ BitVec 64)) (t!50101 List!35407)) )
))
(declare-fun arrayNoDuplicates!0 (array!101386 (_ BitVec 32) List!35407) Bool)

(assert (=> b!1523513 (= res!1042423 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35404))))

(declare-fun b!1523514 () Bool)

(declare-fun res!1042428 () Bool)

(assert (=> b!1523514 (=> (not res!1042428) (not e!849366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523514 (= res!1042428 (validKeyInArray!0 (select (arr!48924 a!2804) i!961)))))

(declare-fun b!1523515 () Bool)

(declare-fun res!1042424 () Bool)

(assert (=> b!1523515 (=> (not res!1042424) (not e!849366))))

(assert (=> b!1523515 (= res!1042424 (and (= (size!49474 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49474 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49474 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523516 () Bool)

(declare-fun res!1042422 () Bool)

(assert (=> b!1523516 (=> (not res!1042422) (not e!849365))))

(declare-fun lt!659974 () SeekEntryResult!13089)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523516 (= res!1042422 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48924 a!2804) j!70) a!2804 mask!2512) lt!659974))))

(declare-fun b!1523517 () Bool)

(declare-fun res!1042426 () Bool)

(assert (=> b!1523517 (=> (not res!1042426) (not e!849366))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523517 (= res!1042426 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49474 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49474 a!2804))))))

(declare-fun b!1523518 () Bool)

(assert (=> b!1523518 (= e!849366 e!849365)))

(declare-fun res!1042420 () Bool)

(assert (=> b!1523518 (=> (not res!1042420) (not e!849365))))

(assert (=> b!1523518 (= res!1042420 (= lt!659973 lt!659974))))

(assert (=> b!1523518 (= lt!659974 (Intermediate!13089 false resIndex!21 resX!21))))

(assert (=> b!1523518 (= lt!659973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48924 a!2804) j!70) mask!2512) (select (arr!48924 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523519 () Bool)

(declare-fun res!1042425 () Bool)

(assert (=> b!1523519 (=> (not res!1042425) (not e!849366))))

(assert (=> b!1523519 (= res!1042425 (validKeyInArray!0 (select (arr!48924 a!2804) j!70)))))

(declare-fun b!1523520 () Bool)

(assert (=> b!1523520 (= e!849365 (not true))))

(declare-fun e!849364 () Bool)

(assert (=> b!1523520 e!849364))

(declare-fun res!1042419 () Bool)

(assert (=> b!1523520 (=> (not res!1042419) (not e!849364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101386 (_ BitVec 32)) Bool)

(assert (=> b!1523520 (= res!1042419 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50962 0))(
  ( (Unit!50963) )
))
(declare-fun lt!659972 () Unit!50962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50962)

(assert (=> b!1523520 (= lt!659972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523521 () Bool)

(declare-fun res!1042427 () Bool)

(assert (=> b!1523521 (=> (not res!1042427) (not e!849366))))

(assert (=> b!1523521 (= res!1042427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523522 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13089)

(assert (=> b!1523522 (= e!849364 (= (seekEntry!0 (select (arr!48924 a!2804) j!70) a!2804 mask!2512) (Found!13089 j!70)))))

(assert (= (and start!129790 res!1042421) b!1523515))

(assert (= (and b!1523515 res!1042424) b!1523514))

(assert (= (and b!1523514 res!1042428) b!1523519))

(assert (= (and b!1523519 res!1042425) b!1523521))

(assert (= (and b!1523521 res!1042427) b!1523513))

(assert (= (and b!1523513 res!1042423) b!1523517))

(assert (= (and b!1523517 res!1042426) b!1523518))

(assert (= (and b!1523518 res!1042420) b!1523516))

(assert (= (and b!1523516 res!1042422) b!1523512))

(assert (= (and b!1523512 res!1042429) b!1523520))

(assert (= (and b!1523520 res!1042419) b!1523522))

(declare-fun m!1406637 () Bool)

(assert (=> b!1523522 m!1406637))

(assert (=> b!1523522 m!1406637))

(declare-fun m!1406639 () Bool)

(assert (=> b!1523522 m!1406639))

(declare-fun m!1406641 () Bool)

(assert (=> b!1523514 m!1406641))

(assert (=> b!1523514 m!1406641))

(declare-fun m!1406643 () Bool)

(assert (=> b!1523514 m!1406643))

(declare-fun m!1406645 () Bool)

(assert (=> b!1523521 m!1406645))

(declare-fun m!1406647 () Bool)

(assert (=> b!1523512 m!1406647))

(declare-fun m!1406649 () Bool)

(assert (=> b!1523512 m!1406649))

(assert (=> b!1523512 m!1406649))

(declare-fun m!1406651 () Bool)

(assert (=> b!1523512 m!1406651))

(assert (=> b!1523512 m!1406651))

(assert (=> b!1523512 m!1406649))

(declare-fun m!1406653 () Bool)

(assert (=> b!1523512 m!1406653))

(assert (=> b!1523516 m!1406637))

(assert (=> b!1523516 m!1406637))

(declare-fun m!1406655 () Bool)

(assert (=> b!1523516 m!1406655))

(declare-fun m!1406657 () Bool)

(assert (=> b!1523513 m!1406657))

(declare-fun m!1406659 () Bool)

(assert (=> start!129790 m!1406659))

(declare-fun m!1406661 () Bool)

(assert (=> start!129790 m!1406661))

(declare-fun m!1406663 () Bool)

(assert (=> b!1523520 m!1406663))

(declare-fun m!1406665 () Bool)

(assert (=> b!1523520 m!1406665))

(assert (=> b!1523518 m!1406637))

(assert (=> b!1523518 m!1406637))

(declare-fun m!1406667 () Bool)

(assert (=> b!1523518 m!1406667))

(assert (=> b!1523518 m!1406667))

(assert (=> b!1523518 m!1406637))

(declare-fun m!1406669 () Bool)

(assert (=> b!1523518 m!1406669))

(assert (=> b!1523519 m!1406637))

(assert (=> b!1523519 m!1406637))

(declare-fun m!1406671 () Bool)

(assert (=> b!1523519 m!1406671))

(check-sat (not b!1523516) (not b!1523519) (not b!1523513) (not b!1523518) (not b!1523522) (not b!1523514) (not start!129790) (not b!1523520) (not b!1523521) (not b!1523512))
(check-sat)
