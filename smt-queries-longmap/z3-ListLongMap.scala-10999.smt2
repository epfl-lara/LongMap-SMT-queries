; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128828 () Bool)

(assert start!128828)

(declare-fun b!1509643 () Bool)

(declare-fun res!1029553 () Bool)

(declare-fun e!843163 () Bool)

(assert (=> b!1509643 (=> (not res!1029553) (not e!843163))))

(declare-datatypes ((array!100684 0))(
  ( (array!100685 (arr!48579 (Array (_ BitVec 32) (_ BitVec 64))) (size!49129 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100684)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509643 (= res!1029553 (validKeyInArray!0 (select (arr!48579 a!2804) i!961)))))

(declare-fun b!1509644 () Bool)

(declare-fun res!1029550 () Bool)

(assert (=> b!1509644 (=> (not res!1029550) (not e!843163))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509644 (= res!1029550 (validKeyInArray!0 (select (arr!48579 a!2804) j!70)))))

(declare-fun b!1509645 () Bool)

(declare-fun e!843166 () Bool)

(assert (=> b!1509645 (= e!843166 (not true))))

(declare-fun e!843164 () Bool)

(assert (=> b!1509645 e!843164))

(declare-fun res!1029555 () Bool)

(assert (=> b!1509645 (=> (not res!1029555) (not e!843164))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100684 (_ BitVec 32)) Bool)

(assert (=> b!1509645 (= res!1029555 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50368 0))(
  ( (Unit!50369) )
))
(declare-fun lt!654954 () Unit!50368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50368)

(assert (=> b!1509645 (= lt!654954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509646 () Bool)

(declare-fun res!1029548 () Bool)

(assert (=> b!1509646 (=> (not res!1029548) (not e!843166))))

(declare-datatypes ((SeekEntryResult!12750 0))(
  ( (MissingZero!12750 (index!53395 (_ BitVec 32))) (Found!12750 (index!53396 (_ BitVec 32))) (Intermediate!12750 (undefined!13562 Bool) (index!53397 (_ BitVec 32)) (x!135148 (_ BitVec 32))) (Undefined!12750) (MissingVacant!12750 (index!53398 (_ BitVec 32))) )
))
(declare-fun lt!654953 () SeekEntryResult!12750)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100684 (_ BitVec 32)) SeekEntryResult!12750)

(assert (=> b!1509646 (= res!1029548 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48579 a!2804) j!70) a!2804 mask!2512) lt!654953))))

(declare-fun b!1509647 () Bool)

(declare-fun res!1029546 () Bool)

(assert (=> b!1509647 (=> (not res!1029546) (not e!843163))))

(declare-datatypes ((List!35062 0))(
  ( (Nil!35059) (Cons!35058 (h!36470 (_ BitVec 64)) (t!49756 List!35062)) )
))
(declare-fun arrayNoDuplicates!0 (array!100684 (_ BitVec 32) List!35062) Bool)

(assert (=> b!1509647 (= res!1029546 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35059))))

(declare-fun b!1509648 () Bool)

(declare-fun res!1029556 () Bool)

(assert (=> b!1509648 (=> (not res!1029556) (not e!843163))))

(assert (=> b!1509648 (= res!1029556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509649 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100684 (_ BitVec 32)) SeekEntryResult!12750)

(assert (=> b!1509649 (= e!843164 (= (seekEntry!0 (select (arr!48579 a!2804) j!70) a!2804 mask!2512) (Found!12750 j!70)))))

(declare-fun b!1509650 () Bool)

(assert (=> b!1509650 (= e!843163 e!843166)))

(declare-fun res!1029552 () Bool)

(assert (=> b!1509650 (=> (not res!1029552) (not e!843166))))

(declare-fun lt!654955 () SeekEntryResult!12750)

(assert (=> b!1509650 (= res!1029552 (= lt!654955 lt!654953))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509650 (= lt!654953 (Intermediate!12750 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509650 (= lt!654955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48579 a!2804) j!70) mask!2512) (select (arr!48579 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509651 () Bool)

(declare-fun res!1029551 () Bool)

(assert (=> b!1509651 (=> (not res!1029551) (not e!843163))))

(assert (=> b!1509651 (= res!1029551 (and (= (size!49129 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49129 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49129 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509652 () Bool)

(declare-fun res!1029547 () Bool)

(assert (=> b!1509652 (=> (not res!1029547) (not e!843166))))

(assert (=> b!1509652 (= res!1029547 (= lt!654955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48579 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48579 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100685 (store (arr!48579 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49129 a!2804)) mask!2512)))))

(declare-fun b!1509653 () Bool)

(declare-fun res!1029549 () Bool)

(assert (=> b!1509653 (=> (not res!1029549) (not e!843163))))

(assert (=> b!1509653 (= res!1029549 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49129 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49129 a!2804))))))

(declare-fun res!1029554 () Bool)

(assert (=> start!128828 (=> (not res!1029554) (not e!843163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128828 (= res!1029554 (validMask!0 mask!2512))))

(assert (=> start!128828 e!843163))

(assert (=> start!128828 true))

(declare-fun array_inv!37607 (array!100684) Bool)

(assert (=> start!128828 (array_inv!37607 a!2804)))

(assert (= (and start!128828 res!1029554) b!1509651))

(assert (= (and b!1509651 res!1029551) b!1509643))

(assert (= (and b!1509643 res!1029553) b!1509644))

(assert (= (and b!1509644 res!1029550) b!1509648))

(assert (= (and b!1509648 res!1029556) b!1509647))

(assert (= (and b!1509647 res!1029546) b!1509653))

(assert (= (and b!1509653 res!1029549) b!1509650))

(assert (= (and b!1509650 res!1029552) b!1509646))

(assert (= (and b!1509646 res!1029548) b!1509652))

(assert (= (and b!1509652 res!1029547) b!1509645))

(assert (= (and b!1509645 res!1029555) b!1509649))

(declare-fun m!1392145 () Bool)

(assert (=> b!1509645 m!1392145))

(declare-fun m!1392147 () Bool)

(assert (=> b!1509645 m!1392147))

(declare-fun m!1392149 () Bool)

(assert (=> b!1509648 m!1392149))

(declare-fun m!1392151 () Bool)

(assert (=> start!128828 m!1392151))

(declare-fun m!1392153 () Bool)

(assert (=> start!128828 m!1392153))

(declare-fun m!1392155 () Bool)

(assert (=> b!1509644 m!1392155))

(assert (=> b!1509644 m!1392155))

(declare-fun m!1392157 () Bool)

(assert (=> b!1509644 m!1392157))

(assert (=> b!1509646 m!1392155))

(assert (=> b!1509646 m!1392155))

(declare-fun m!1392159 () Bool)

(assert (=> b!1509646 m!1392159))

(declare-fun m!1392161 () Bool)

(assert (=> b!1509647 m!1392161))

(declare-fun m!1392163 () Bool)

(assert (=> b!1509652 m!1392163))

(declare-fun m!1392165 () Bool)

(assert (=> b!1509652 m!1392165))

(assert (=> b!1509652 m!1392165))

(declare-fun m!1392167 () Bool)

(assert (=> b!1509652 m!1392167))

(assert (=> b!1509652 m!1392167))

(assert (=> b!1509652 m!1392165))

(declare-fun m!1392169 () Bool)

(assert (=> b!1509652 m!1392169))

(assert (=> b!1509650 m!1392155))

(assert (=> b!1509650 m!1392155))

(declare-fun m!1392171 () Bool)

(assert (=> b!1509650 m!1392171))

(assert (=> b!1509650 m!1392171))

(assert (=> b!1509650 m!1392155))

(declare-fun m!1392173 () Bool)

(assert (=> b!1509650 m!1392173))

(declare-fun m!1392175 () Bool)

(assert (=> b!1509643 m!1392175))

(assert (=> b!1509643 m!1392175))

(declare-fun m!1392177 () Bool)

(assert (=> b!1509643 m!1392177))

(assert (=> b!1509649 m!1392155))

(assert (=> b!1509649 m!1392155))

(declare-fun m!1392179 () Bool)

(assert (=> b!1509649 m!1392179))

(check-sat (not b!1509646) (not b!1509643) (not b!1509644) (not b!1509648) (not start!128828) (not b!1509649) (not b!1509650) (not b!1509652) (not b!1509647) (not b!1509645))
