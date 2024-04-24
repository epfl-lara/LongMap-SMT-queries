; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125670 () Bool)

(assert start!125670)

(declare-fun lt!642381 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824906 () Bool)

(declare-fun lt!642385 () (_ BitVec 64))

(declare-datatypes ((array!98956 0))(
  ( (array!98957 (arr!47761 (Array (_ BitVec 32) (_ BitVec 64))) (size!48312 (_ BitVec 32))) )
))
(declare-fun lt!642384 () array!98956)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1468117 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11910 0))(
  ( (MissingZero!11910 (index!50032 (_ BitVec 32))) (Found!11910 (index!50033 (_ BitVec 32))) (Intermediate!11910 (undefined!12722 Bool) (index!50034 (_ BitVec 32)) (x!131792 (_ BitVec 32))) (Undefined!11910) (MissingVacant!11910 (index!50035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98956 (_ BitVec 32)) SeekEntryResult!11910)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98956 (_ BitVec 32)) SeekEntryResult!11910)

(assert (=> b!1468117 (= e!824906 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642381 intermediateAfterIndex!19 lt!642385 lt!642384 mask!2687) (seekEntryOrOpen!0 lt!642385 lt!642384 mask!2687))))))

(declare-fun b!1468118 () Bool)

(declare-fun e!824908 () Bool)

(declare-fun e!824909 () Bool)

(assert (=> b!1468118 (= e!824908 e!824909)))

(declare-fun res!995733 () Bool)

(assert (=> b!1468118 (=> (not res!995733) (not e!824909))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98956)

(assert (=> b!1468118 (= res!995733 (= (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1468118 (= lt!642384 (array!98957 (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48312 a!2862)))))

(declare-fun b!1468119 () Bool)

(declare-fun res!995742 () Bool)

(declare-fun e!824911 () Bool)

(assert (=> b!1468119 (=> res!995742 e!824911)))

(declare-fun lt!642380 () SeekEntryResult!11910)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98956 (_ BitVec 32)) SeekEntryResult!11910)

(assert (=> b!1468119 (= res!995742 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642381 (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642380)))))

(declare-fun b!1468120 () Bool)

(declare-fun res!995741 () Bool)

(assert (=> b!1468120 (=> (not res!995741) (not e!824908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468120 (= res!995741 (validKeyInArray!0 (select (arr!47761 a!2862) j!93)))))

(declare-fun b!1468121 () Bool)

(declare-fun res!995740 () Bool)

(declare-fun e!824910 () Bool)

(assert (=> b!1468121 (=> (not res!995740) (not e!824910))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468121 (= res!995740 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642380))))

(declare-fun lt!642382 () SeekEntryResult!11910)

(declare-fun b!1468122 () Bool)

(declare-fun e!824907 () Bool)

(assert (=> b!1468122 (= e!824907 (= lt!642382 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642385 lt!642384 mask!2687)))))

(declare-fun b!1468123 () Bool)

(declare-fun res!995735 () Bool)

(assert (=> b!1468123 (=> res!995735 e!824911)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468123 (= res!995735 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun res!995731 () Bool)

(assert (=> start!125670 (=> (not res!995731) (not e!824908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125670 (= res!995731 (validMask!0 mask!2687))))

(assert (=> start!125670 e!824908))

(assert (=> start!125670 true))

(declare-fun array_inv!37042 (array!98956) Bool)

(assert (=> start!125670 (array_inv!37042 a!2862)))

(declare-fun b!1468124 () Bool)

(declare-fun e!824905 () Bool)

(assert (=> b!1468124 (= e!824910 e!824905)))

(declare-fun res!995743 () Bool)

(assert (=> b!1468124 (=> (not res!995743) (not e!824905))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1468124 (= res!995743 (= lt!642382 (Intermediate!11910 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468124 (= lt!642382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642385 mask!2687) lt!642385 lt!642384 mask!2687))))

(assert (=> b!1468124 (= lt!642385 (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1468125 () Bool)

(declare-fun res!995744 () Bool)

(assert (=> b!1468125 (=> (not res!995744) (not e!824908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98956 (_ BitVec 32)) Bool)

(assert (=> b!1468125 (= res!995744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468126 () Bool)

(assert (=> b!1468126 (= e!824909 e!824910)))

(declare-fun res!995730 () Bool)

(assert (=> b!1468126 (=> (not res!995730) (not e!824910))))

(assert (=> b!1468126 (= res!995730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47761 a!2862) j!93) mask!2687) (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642380))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1468126 (= lt!642380 (Intermediate!11910 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468127 () Bool)

(declare-fun res!995739 () Bool)

(assert (=> b!1468127 (=> (not res!995739) (not e!824908))))

(assert (=> b!1468127 (= res!995739 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48312 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48312 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48312 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1468128 () Bool)

(declare-fun e!824913 () Bool)

(assert (=> b!1468128 (= e!824913 e!824911)))

(declare-fun res!995745 () Bool)

(assert (=> b!1468128 (=> res!995745 e!824911)))

(assert (=> b!1468128 (= res!995745 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642381 #b00000000000000000000000000000000) (bvsge lt!642381 (size!48312 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468128 (= lt!642381 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1468129 () Bool)

(assert (=> b!1468129 (= e!824905 (not e!824913))))

(declare-fun res!995734 () Bool)

(assert (=> b!1468129 (=> res!995734 e!824913)))

(assert (=> b!1468129 (= res!995734 (or (and (= (select (arr!47761 a!2862) index!646) (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47761 a!2862) index!646) (select (arr!47761 a!2862) j!93))) (= (select (arr!47761 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!642383 () SeekEntryResult!11910)

(assert (=> b!1468129 (and (= lt!642383 (Found!11910 j!93)) (or (= (select (arr!47761 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47761 a!2862) intermediateBeforeIndex!19) (select (arr!47761 a!2862) j!93))))))

(assert (=> b!1468129 (= lt!642383 (seekEntryOrOpen!0 (select (arr!47761 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1468129 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49349 0))(
  ( (Unit!49350) )
))
(declare-fun lt!642379 () Unit!49349)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49349)

(assert (=> b!1468129 (= lt!642379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1468130 () Bool)

(assert (=> b!1468130 (= e!824911 true)))

(assert (=> b!1468130 (= lt!642383 (seekEntryOrOpen!0 lt!642385 lt!642384 mask!2687))))

(declare-fun lt!642378 () Unit!49349)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49349)

(assert (=> b!1468130 (= lt!642378 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642381 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1468131 () Bool)

(declare-fun res!995747 () Bool)

(assert (=> b!1468131 (=> (not res!995747) (not e!824905))))

(assert (=> b!1468131 (= res!995747 e!824907)))

(declare-fun c!135715 () Bool)

(assert (=> b!1468131 (= c!135715 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1468132 () Bool)

(declare-fun res!995738 () Bool)

(assert (=> b!1468132 (=> (not res!995738) (not e!824908))))

(declare-datatypes ((List!34249 0))(
  ( (Nil!34246) (Cons!34245 (h!35609 (_ BitVec 64)) (t!48935 List!34249)) )
))
(declare-fun arrayNoDuplicates!0 (array!98956 (_ BitVec 32) List!34249) Bool)

(assert (=> b!1468132 (= res!995738 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34246))))

(declare-fun b!1468133 () Bool)

(assert (=> b!1468133 (= e!824906 (not (= lt!642382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642381 lt!642385 lt!642384 mask!2687))))))

(declare-fun b!1468134 () Bool)

(declare-fun res!995736 () Bool)

(assert (=> b!1468134 (=> (not res!995736) (not e!824908))))

(assert (=> b!1468134 (= res!995736 (validKeyInArray!0 (select (arr!47761 a!2862) i!1006)))))

(declare-fun b!1468135 () Bool)

(declare-fun res!995737 () Bool)

(assert (=> b!1468135 (=> res!995737 e!824911)))

(assert (=> b!1468135 (= res!995737 e!824906)))

(declare-fun c!135714 () Bool)

(assert (=> b!1468135 (= c!135714 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1468136 () Bool)

(declare-fun res!995746 () Bool)

(assert (=> b!1468136 (=> (not res!995746) (not e!824908))))

(assert (=> b!1468136 (= res!995746 (and (= (size!48312 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48312 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48312 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468137 () Bool)

(assert (=> b!1468137 (= e!824907 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642385 lt!642384 mask!2687) (seekEntryOrOpen!0 lt!642385 lt!642384 mask!2687)))))

(declare-fun b!1468138 () Bool)

(declare-fun res!995732 () Bool)

(assert (=> b!1468138 (=> (not res!995732) (not e!824905))))

(assert (=> b!1468138 (= res!995732 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125670 res!995731) b!1468136))

(assert (= (and b!1468136 res!995746) b!1468134))

(assert (= (and b!1468134 res!995736) b!1468120))

(assert (= (and b!1468120 res!995741) b!1468125))

(assert (= (and b!1468125 res!995744) b!1468132))

(assert (= (and b!1468132 res!995738) b!1468127))

(assert (= (and b!1468127 res!995739) b!1468118))

(assert (= (and b!1468118 res!995733) b!1468126))

(assert (= (and b!1468126 res!995730) b!1468121))

(assert (= (and b!1468121 res!995740) b!1468124))

(assert (= (and b!1468124 res!995743) b!1468131))

(assert (= (and b!1468131 c!135715) b!1468122))

(assert (= (and b!1468131 (not c!135715)) b!1468137))

(assert (= (and b!1468131 res!995747) b!1468138))

(assert (= (and b!1468138 res!995732) b!1468129))

(assert (= (and b!1468129 (not res!995734)) b!1468128))

(assert (= (and b!1468128 (not res!995745)) b!1468119))

(assert (= (and b!1468119 (not res!995742)) b!1468135))

(assert (= (and b!1468135 c!135714) b!1468133))

(assert (= (and b!1468135 (not c!135714)) b!1468117))

(assert (= (and b!1468135 (not res!995737)) b!1468123))

(assert (= (and b!1468123 (not res!995735)) b!1468130))

(declare-fun m!1355089 () Bool)

(assert (=> b!1468132 m!1355089))

(declare-fun m!1355091 () Bool)

(assert (=> b!1468118 m!1355091))

(declare-fun m!1355093 () Bool)

(assert (=> b!1468118 m!1355093))

(declare-fun m!1355095 () Bool)

(assert (=> b!1468137 m!1355095))

(declare-fun m!1355097 () Bool)

(assert (=> b!1468137 m!1355097))

(declare-fun m!1355099 () Bool)

(assert (=> b!1468133 m!1355099))

(declare-fun m!1355101 () Bool)

(assert (=> b!1468134 m!1355101))

(assert (=> b!1468134 m!1355101))

(declare-fun m!1355103 () Bool)

(assert (=> b!1468134 m!1355103))

(declare-fun m!1355105 () Bool)

(assert (=> b!1468128 m!1355105))

(declare-fun m!1355107 () Bool)

(assert (=> b!1468117 m!1355107))

(assert (=> b!1468117 m!1355097))

(declare-fun m!1355109 () Bool)

(assert (=> b!1468125 m!1355109))

(assert (=> b!1468130 m!1355097))

(declare-fun m!1355111 () Bool)

(assert (=> b!1468130 m!1355111))

(declare-fun m!1355113 () Bool)

(assert (=> b!1468120 m!1355113))

(assert (=> b!1468120 m!1355113))

(declare-fun m!1355115 () Bool)

(assert (=> b!1468120 m!1355115))

(declare-fun m!1355117 () Bool)

(assert (=> start!125670 m!1355117))

(declare-fun m!1355119 () Bool)

(assert (=> start!125670 m!1355119))

(declare-fun m!1355121 () Bool)

(assert (=> b!1468122 m!1355121))

(declare-fun m!1355123 () Bool)

(assert (=> b!1468129 m!1355123))

(assert (=> b!1468129 m!1355091))

(declare-fun m!1355125 () Bool)

(assert (=> b!1468129 m!1355125))

(declare-fun m!1355127 () Bool)

(assert (=> b!1468129 m!1355127))

(declare-fun m!1355129 () Bool)

(assert (=> b!1468129 m!1355129))

(assert (=> b!1468129 m!1355113))

(declare-fun m!1355131 () Bool)

(assert (=> b!1468129 m!1355131))

(declare-fun m!1355133 () Bool)

(assert (=> b!1468129 m!1355133))

(assert (=> b!1468129 m!1355113))

(assert (=> b!1468121 m!1355113))

(assert (=> b!1468121 m!1355113))

(declare-fun m!1355135 () Bool)

(assert (=> b!1468121 m!1355135))

(declare-fun m!1355137 () Bool)

(assert (=> b!1468124 m!1355137))

(assert (=> b!1468124 m!1355137))

(declare-fun m!1355139 () Bool)

(assert (=> b!1468124 m!1355139))

(assert (=> b!1468124 m!1355091))

(declare-fun m!1355141 () Bool)

(assert (=> b!1468124 m!1355141))

(assert (=> b!1468119 m!1355113))

(assert (=> b!1468119 m!1355113))

(declare-fun m!1355143 () Bool)

(assert (=> b!1468119 m!1355143))

(assert (=> b!1468126 m!1355113))

(assert (=> b!1468126 m!1355113))

(declare-fun m!1355145 () Bool)

(assert (=> b!1468126 m!1355145))

(assert (=> b!1468126 m!1355145))

(assert (=> b!1468126 m!1355113))

(declare-fun m!1355147 () Bool)

(assert (=> b!1468126 m!1355147))

(check-sat (not start!125670) (not b!1468117) (not b!1468128) (not b!1468132) (not b!1468130) (not b!1468120) (not b!1468133) (not b!1468126) (not b!1468121) (not b!1468137) (not b!1468122) (not b!1468119) (not b!1468124) (not b!1468125) (not b!1468134) (not b!1468129))
(check-sat)
