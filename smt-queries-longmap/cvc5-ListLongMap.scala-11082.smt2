; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129324 () Bool)

(assert start!129324)

(declare-fun b!1519120 () Bool)

(declare-fun e!847414 () Bool)

(declare-fun e!847416 () Bool)

(assert (=> b!1519120 (= e!847414 e!847416)))

(declare-fun res!1039032 () Bool)

(assert (=> b!1519120 (=> (not res!1039032) (not e!847416))))

(declare-datatypes ((array!101180 0))(
  ( (array!101181 (arr!48827 (Array (_ BitVec 32) (_ BitVec 64))) (size!49377 (_ BitVec 32))) )
))
(declare-fun lt!658509 () array!101180)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12998 0))(
  ( (MissingZero!12998 (index!54387 (_ BitVec 32))) (Found!12998 (index!54388 (_ BitVec 32))) (Intermediate!12998 (undefined!13810 Bool) (index!54389 (_ BitVec 32)) (x!136060 (_ BitVec 32))) (Undefined!12998) (MissingVacant!12998 (index!54390 (_ BitVec 32))) )
))
(declare-fun lt!658507 () SeekEntryResult!12998)

(declare-fun lt!658513 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101180 (_ BitVec 32)) SeekEntryResult!12998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519120 (= res!1039032 (= lt!658507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658513 mask!2512) lt!658513 lt!658509 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101180)

(assert (=> b!1519120 (= lt!658513 (select (store (arr!48827 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519120 (= lt!658509 (array!101181 (store (arr!48827 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49377 a!2804)))))

(declare-fun b!1519121 () Bool)

(declare-fun res!1039025 () Bool)

(declare-fun e!847418 () Bool)

(assert (=> b!1519121 (=> (not res!1039025) (not e!847418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101180 (_ BitVec 32)) Bool)

(assert (=> b!1519121 (= res!1039025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519122 () Bool)

(declare-fun e!847419 () Bool)

(assert (=> b!1519122 (= e!847419 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101180 (_ BitVec 32)) SeekEntryResult!12998)

(assert (=> b!1519122 (= (seekEntryOrOpen!0 (select (arr!48827 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658513 lt!658509 mask!2512))))

(declare-fun lt!658511 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!50864 0))(
  ( (Unit!50865) )
))
(declare-fun lt!658510 () Unit!50864)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50864)

(assert (=> b!1519122 (= lt!658510 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658511 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519123 () Bool)

(declare-fun res!1039023 () Bool)

(assert (=> b!1519123 (=> (not res!1039023) (not e!847418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519123 (= res!1039023 (validKeyInArray!0 (select (arr!48827 a!2804) j!70)))))

(declare-fun b!1519125 () Bool)

(declare-fun res!1039027 () Bool)

(assert (=> b!1519125 (=> (not res!1039027) (not e!847414))))

(declare-fun lt!658512 () SeekEntryResult!12998)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1519125 (= res!1039027 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48827 a!2804) j!70) a!2804 mask!2512) lt!658512))))

(declare-fun b!1519126 () Bool)

(declare-fun e!847417 () Bool)

(assert (=> b!1519126 (= e!847417 e!847419)))

(declare-fun res!1039031 () Bool)

(assert (=> b!1519126 (=> res!1039031 e!847419)))

(assert (=> b!1519126 (= res!1039031 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658511 #b00000000000000000000000000000000) (bvsge lt!658511 (size!49377 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519126 (= lt!658511 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519127 () Bool)

(declare-fun res!1039034 () Bool)

(assert (=> b!1519127 (=> res!1039034 e!847419)))

(assert (=> b!1519127 (= res!1039034 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658511 (select (arr!48827 a!2804) j!70) a!2804 mask!2512) lt!658512)))))

(declare-fun b!1519128 () Bool)

(declare-fun res!1039026 () Bool)

(assert (=> b!1519128 (=> (not res!1039026) (not e!847418))))

(assert (=> b!1519128 (= res!1039026 (and (= (size!49377 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49377 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49377 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519129 () Bool)

(declare-fun res!1039036 () Bool)

(assert (=> b!1519129 (=> (not res!1039036) (not e!847418))))

(declare-datatypes ((List!35310 0))(
  ( (Nil!35307) (Cons!35306 (h!36718 (_ BitVec 64)) (t!50004 List!35310)) )
))
(declare-fun arrayNoDuplicates!0 (array!101180 (_ BitVec 32) List!35310) Bool)

(assert (=> b!1519129 (= res!1039036 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35307))))

(declare-fun res!1039024 () Bool)

(assert (=> start!129324 (=> (not res!1039024) (not e!847418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129324 (= res!1039024 (validMask!0 mask!2512))))

(assert (=> start!129324 e!847418))

(assert (=> start!129324 true))

(declare-fun array_inv!37855 (array!101180) Bool)

(assert (=> start!129324 (array_inv!37855 a!2804)))

(declare-fun b!1519124 () Bool)

(declare-fun res!1039035 () Bool)

(assert (=> b!1519124 (=> (not res!1039035) (not e!847418))))

(assert (=> b!1519124 (= res!1039035 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49377 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49377 a!2804))))))

(declare-fun b!1519130 () Bool)

(assert (=> b!1519130 (= e!847418 e!847414)))

(declare-fun res!1039028 () Bool)

(assert (=> b!1519130 (=> (not res!1039028) (not e!847414))))

(assert (=> b!1519130 (= res!1039028 (= lt!658507 lt!658512))))

(assert (=> b!1519130 (= lt!658512 (Intermediate!12998 false resIndex!21 resX!21))))

(assert (=> b!1519130 (= lt!658507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48827 a!2804) j!70) mask!2512) (select (arr!48827 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519131 () Bool)

(declare-fun e!847415 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101180 (_ BitVec 32)) SeekEntryResult!12998)

(assert (=> b!1519131 (= e!847415 (= (seekEntry!0 (select (arr!48827 a!2804) j!70) a!2804 mask!2512) (Found!12998 j!70)))))

(declare-fun b!1519132 () Bool)

(declare-fun res!1039029 () Bool)

(assert (=> b!1519132 (=> (not res!1039029) (not e!847418))))

(assert (=> b!1519132 (= res!1039029 (validKeyInArray!0 (select (arr!48827 a!2804) i!961)))))

(declare-fun b!1519133 () Bool)

(assert (=> b!1519133 (= e!847416 (not e!847417))))

(declare-fun res!1039033 () Bool)

(assert (=> b!1519133 (=> res!1039033 e!847417)))

(assert (=> b!1519133 (= res!1039033 (or (not (= (select (arr!48827 a!2804) j!70) lt!658513)) (= x!534 resX!21)))))

(assert (=> b!1519133 e!847415))

(declare-fun res!1039030 () Bool)

(assert (=> b!1519133 (=> (not res!1039030) (not e!847415))))

(assert (=> b!1519133 (= res!1039030 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658508 () Unit!50864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50864)

(assert (=> b!1519133 (= lt!658508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129324 res!1039024) b!1519128))

(assert (= (and b!1519128 res!1039026) b!1519132))

(assert (= (and b!1519132 res!1039029) b!1519123))

(assert (= (and b!1519123 res!1039023) b!1519121))

(assert (= (and b!1519121 res!1039025) b!1519129))

(assert (= (and b!1519129 res!1039036) b!1519124))

(assert (= (and b!1519124 res!1039035) b!1519130))

(assert (= (and b!1519130 res!1039028) b!1519125))

(assert (= (and b!1519125 res!1039027) b!1519120))

(assert (= (and b!1519120 res!1039032) b!1519133))

(assert (= (and b!1519133 res!1039030) b!1519131))

(assert (= (and b!1519133 (not res!1039033)) b!1519126))

(assert (= (and b!1519126 (not res!1039031)) b!1519127))

(assert (= (and b!1519127 (not res!1039034)) b!1519122))

(declare-fun m!1402495 () Bool)

(assert (=> b!1519129 m!1402495))

(declare-fun m!1402497 () Bool)

(assert (=> b!1519126 m!1402497))

(declare-fun m!1402499 () Bool)

(assert (=> b!1519123 m!1402499))

(assert (=> b!1519123 m!1402499))

(declare-fun m!1402501 () Bool)

(assert (=> b!1519123 m!1402501))

(assert (=> b!1519125 m!1402499))

(assert (=> b!1519125 m!1402499))

(declare-fun m!1402503 () Bool)

(assert (=> b!1519125 m!1402503))

(assert (=> b!1519133 m!1402499))

(declare-fun m!1402505 () Bool)

(assert (=> b!1519133 m!1402505))

(declare-fun m!1402507 () Bool)

(assert (=> b!1519133 m!1402507))

(declare-fun m!1402509 () Bool)

(assert (=> b!1519121 m!1402509))

(assert (=> b!1519122 m!1402499))

(assert (=> b!1519122 m!1402499))

(declare-fun m!1402511 () Bool)

(assert (=> b!1519122 m!1402511))

(declare-fun m!1402513 () Bool)

(assert (=> b!1519122 m!1402513))

(declare-fun m!1402515 () Bool)

(assert (=> b!1519122 m!1402515))

(assert (=> b!1519127 m!1402499))

(assert (=> b!1519127 m!1402499))

(declare-fun m!1402517 () Bool)

(assert (=> b!1519127 m!1402517))

(declare-fun m!1402519 () Bool)

(assert (=> b!1519132 m!1402519))

(assert (=> b!1519132 m!1402519))

(declare-fun m!1402521 () Bool)

(assert (=> b!1519132 m!1402521))

(declare-fun m!1402523 () Bool)

(assert (=> b!1519120 m!1402523))

(assert (=> b!1519120 m!1402523))

(declare-fun m!1402525 () Bool)

(assert (=> b!1519120 m!1402525))

(declare-fun m!1402527 () Bool)

(assert (=> b!1519120 m!1402527))

(declare-fun m!1402529 () Bool)

(assert (=> b!1519120 m!1402529))

(assert (=> b!1519131 m!1402499))

(assert (=> b!1519131 m!1402499))

(declare-fun m!1402531 () Bool)

(assert (=> b!1519131 m!1402531))

(assert (=> b!1519130 m!1402499))

(assert (=> b!1519130 m!1402499))

(declare-fun m!1402533 () Bool)

(assert (=> b!1519130 m!1402533))

(assert (=> b!1519130 m!1402533))

(assert (=> b!1519130 m!1402499))

(declare-fun m!1402535 () Bool)

(assert (=> b!1519130 m!1402535))

(declare-fun m!1402537 () Bool)

(assert (=> start!129324 m!1402537))

(declare-fun m!1402539 () Bool)

(assert (=> start!129324 m!1402539))

(push 1)

