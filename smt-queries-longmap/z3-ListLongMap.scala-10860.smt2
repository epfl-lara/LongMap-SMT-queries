; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127272 () Bool)

(assert start!127272)

(declare-fun b!1495730 () Bool)

(declare-fun res!1017433 () Bool)

(declare-fun e!837783 () Bool)

(assert (=> b!1495730 (=> (not res!1017433) (not e!837783))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495730 (= res!1017433 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495731 () Bool)

(declare-fun e!837781 () Bool)

(declare-fun e!837785 () Bool)

(assert (=> b!1495731 (= e!837781 e!837785)))

(declare-fun res!1017422 () Bool)

(assert (=> b!1495731 (=> (not res!1017422) (not e!837785))))

(declare-datatypes ((array!99793 0))(
  ( (array!99794 (arr!48162 (Array (_ BitVec 32) (_ BitVec 64))) (size!48712 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99793)

(assert (=> b!1495731 (= res!1017422 (= (select (store (arr!48162 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651845 () array!99793)

(assert (=> b!1495731 (= lt!651845 (array!99794 (store (arr!48162 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48712 a!2862)))))

(declare-fun lt!651844 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12402 0))(
  ( (MissingZero!12402 (index!52000 (_ BitVec 32))) (Found!12402 (index!52001 (_ BitVec 32))) (Intermediate!12402 (undefined!13214 Bool) (index!52002 (_ BitVec 32)) (x!133618 (_ BitVec 32))) (Undefined!12402) (MissingVacant!12402 (index!52003 (_ BitVec 32))) )
))
(declare-fun lt!651846 () SeekEntryResult!12402)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!837780 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1495732 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12402)

(assert (=> b!1495732 (= e!837780 (= lt!651846 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651844 lt!651845 mask!2687)))))

(declare-fun lt!651848 () (_ BitVec 32))

(declare-fun b!1495733 () Bool)

(declare-fun e!837782 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12402)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99793 (_ BitVec 32)) SeekEntryResult!12402)

(assert (=> b!1495733 (= e!837782 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687) (seekEntryOrOpen!0 lt!651844 lt!651845 mask!2687))))))

(declare-fun b!1495734 () Bool)

(declare-fun res!1017435 () Bool)

(assert (=> b!1495734 (=> (not res!1017435) (not e!837781))))

(declare-datatypes ((List!34663 0))(
  ( (Nil!34660) (Cons!34659 (h!36054 (_ BitVec 64)) (t!49357 List!34663)) )
))
(declare-fun arrayNoDuplicates!0 (array!99793 (_ BitVec 32) List!34663) Bool)

(assert (=> b!1495734 (= res!1017435 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34660))))

(declare-fun b!1495735 () Bool)

(declare-fun res!1017427 () Bool)

(assert (=> b!1495735 (=> (not res!1017427) (not e!837781))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495735 (= res!1017427 (validKeyInArray!0 (select (arr!48162 a!2862) j!93)))))

(declare-fun b!1495736 () Bool)

(declare-fun e!837777 () Bool)

(assert (=> b!1495736 (= e!837783 (not e!837777))))

(declare-fun res!1017418 () Bool)

(assert (=> b!1495736 (=> res!1017418 e!837777)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495736 (= res!1017418 (or (and (= (select (arr!48162 a!2862) index!646) (select (store (arr!48162 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48162 a!2862) index!646) (select (arr!48162 a!2862) j!93))) (= (select (arr!48162 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!837784 () Bool)

(assert (=> b!1495736 e!837784))

(declare-fun res!1017434 () Bool)

(assert (=> b!1495736 (=> (not res!1017434) (not e!837784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99793 (_ BitVec 32)) Bool)

(assert (=> b!1495736 (= res!1017434 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50144 0))(
  ( (Unit!50145) )
))
(declare-fun lt!651847 () Unit!50144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50144)

(assert (=> b!1495736 (= lt!651847 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495737 () Bool)

(assert (=> b!1495737 (= e!837782 (not (= lt!651846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 lt!651844 lt!651845 mask!2687))))))

(declare-fun b!1495738 () Bool)

(declare-fun e!837779 () Bool)

(assert (=> b!1495738 (= e!837777 e!837779)))

(declare-fun res!1017430 () Bool)

(assert (=> b!1495738 (=> res!1017430 e!837779)))

(assert (=> b!1495738 (= res!1017430 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651848 #b00000000000000000000000000000000) (bvsge lt!651848 (size!48712 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495738 (= lt!651848 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495739 () Bool)

(declare-fun res!1017428 () Bool)

(assert (=> b!1495739 (=> (not res!1017428) (not e!837781))))

(assert (=> b!1495739 (= res!1017428 (validKeyInArray!0 (select (arr!48162 a!2862) i!1006)))))

(declare-fun res!1017425 () Bool)

(assert (=> start!127272 (=> (not res!1017425) (not e!837781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127272 (= res!1017425 (validMask!0 mask!2687))))

(assert (=> start!127272 e!837781))

(assert (=> start!127272 true))

(declare-fun array_inv!37190 (array!99793) Bool)

(assert (=> start!127272 (array_inv!37190 a!2862)))

(declare-fun b!1495740 () Bool)

(assert (=> b!1495740 (= e!837780 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687) (seekEntryOrOpen!0 lt!651844 lt!651845 mask!2687)))))

(declare-fun b!1495741 () Bool)

(declare-fun e!837778 () Bool)

(assert (=> b!1495741 (= e!837785 e!837778)))

(declare-fun res!1017436 () Bool)

(assert (=> b!1495741 (=> (not res!1017436) (not e!837778))))

(declare-fun lt!651849 () SeekEntryResult!12402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495741 (= res!1017436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651849))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1495741 (= lt!651849 (Intermediate!12402 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495742 () Bool)

(declare-fun res!1017423 () Bool)

(assert (=> b!1495742 (=> (not res!1017423) (not e!837781))))

(assert (=> b!1495742 (= res!1017423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495743 () Bool)

(declare-fun res!1017424 () Bool)

(assert (=> b!1495743 (=> (not res!1017424) (not e!837783))))

(assert (=> b!1495743 (= res!1017424 e!837780)))

(declare-fun c!138689 () Bool)

(assert (=> b!1495743 (= c!138689 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495744 () Bool)

(assert (=> b!1495744 (= e!837778 e!837783)))

(declare-fun res!1017431 () Bool)

(assert (=> b!1495744 (=> (not res!1017431) (not e!837783))))

(assert (=> b!1495744 (= res!1017431 (= lt!651846 (Intermediate!12402 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1495744 (= lt!651846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651844 mask!2687) lt!651844 lt!651845 mask!2687))))

(assert (=> b!1495744 (= lt!651844 (select (store (arr!48162 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495745 () Bool)

(assert (=> b!1495745 (= e!837784 (or (= (select (arr!48162 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48162 a!2862) intermediateBeforeIndex!19) (select (arr!48162 a!2862) j!93))))))

(declare-fun b!1495746 () Bool)

(declare-fun res!1017432 () Bool)

(assert (=> b!1495746 (=> (not res!1017432) (not e!837778))))

(assert (=> b!1495746 (= res!1017432 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651849))))

(declare-fun b!1495747 () Bool)

(declare-fun res!1017421 () Bool)

(assert (=> b!1495747 (=> res!1017421 e!837779)))

(assert (=> b!1495747 (= res!1017421 e!837782)))

(declare-fun c!138690 () Bool)

(assert (=> b!1495747 (= c!138690 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495748 () Bool)

(declare-fun res!1017426 () Bool)

(assert (=> b!1495748 (=> res!1017426 e!837779)))

(assert (=> b!1495748 (= res!1017426 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651849)))))

(declare-fun b!1495749 () Bool)

(declare-fun res!1017429 () Bool)

(assert (=> b!1495749 (=> (not res!1017429) (not e!837784))))

(assert (=> b!1495749 (= res!1017429 (= (seekEntryOrOpen!0 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) (Found!12402 j!93)))))

(declare-fun b!1495750 () Bool)

(assert (=> b!1495750 (= e!837779 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1495751 () Bool)

(declare-fun res!1017420 () Bool)

(assert (=> b!1495751 (=> (not res!1017420) (not e!837781))))

(assert (=> b!1495751 (= res!1017420 (and (= (size!48712 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48712 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48712 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495752 () Bool)

(declare-fun res!1017419 () Bool)

(assert (=> b!1495752 (=> (not res!1017419) (not e!837781))))

(assert (=> b!1495752 (= res!1017419 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48712 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48712 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48712 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127272 res!1017425) b!1495751))

(assert (= (and b!1495751 res!1017420) b!1495739))

(assert (= (and b!1495739 res!1017428) b!1495735))

(assert (= (and b!1495735 res!1017427) b!1495742))

(assert (= (and b!1495742 res!1017423) b!1495734))

(assert (= (and b!1495734 res!1017435) b!1495752))

(assert (= (and b!1495752 res!1017419) b!1495731))

(assert (= (and b!1495731 res!1017422) b!1495741))

(assert (= (and b!1495741 res!1017436) b!1495746))

(assert (= (and b!1495746 res!1017432) b!1495744))

(assert (= (and b!1495744 res!1017431) b!1495743))

(assert (= (and b!1495743 c!138689) b!1495732))

(assert (= (and b!1495743 (not c!138689)) b!1495740))

(assert (= (and b!1495743 res!1017424) b!1495730))

(assert (= (and b!1495730 res!1017433) b!1495736))

(assert (= (and b!1495736 res!1017434) b!1495749))

(assert (= (and b!1495749 res!1017429) b!1495745))

(assert (= (and b!1495736 (not res!1017418)) b!1495738))

(assert (= (and b!1495738 (not res!1017430)) b!1495748))

(assert (= (and b!1495748 (not res!1017426)) b!1495747))

(assert (= (and b!1495747 c!138690) b!1495737))

(assert (= (and b!1495747 (not c!138690)) b!1495733))

(assert (= (and b!1495747 (not res!1017421)) b!1495750))

(declare-fun m!1379111 () Bool)

(assert (=> b!1495748 m!1379111))

(assert (=> b!1495748 m!1379111))

(declare-fun m!1379113 () Bool)

(assert (=> b!1495748 m!1379113))

(declare-fun m!1379115 () Bool)

(assert (=> b!1495734 m!1379115))

(declare-fun m!1379117 () Bool)

(assert (=> b!1495736 m!1379117))

(declare-fun m!1379119 () Bool)

(assert (=> b!1495736 m!1379119))

(declare-fun m!1379121 () Bool)

(assert (=> b!1495736 m!1379121))

(declare-fun m!1379123 () Bool)

(assert (=> b!1495736 m!1379123))

(declare-fun m!1379125 () Bool)

(assert (=> b!1495736 m!1379125))

(assert (=> b!1495736 m!1379111))

(declare-fun m!1379127 () Bool)

(assert (=> b!1495733 m!1379127))

(declare-fun m!1379129 () Bool)

(assert (=> b!1495733 m!1379129))

(assert (=> b!1495731 m!1379119))

(declare-fun m!1379131 () Bool)

(assert (=> b!1495731 m!1379131))

(declare-fun m!1379133 () Bool)

(assert (=> b!1495744 m!1379133))

(assert (=> b!1495744 m!1379133))

(declare-fun m!1379135 () Bool)

(assert (=> b!1495744 m!1379135))

(assert (=> b!1495744 m!1379119))

(declare-fun m!1379137 () Bool)

(assert (=> b!1495744 m!1379137))

(declare-fun m!1379139 () Bool)

(assert (=> b!1495745 m!1379139))

(assert (=> b!1495745 m!1379111))

(assert (=> b!1495741 m!1379111))

(assert (=> b!1495741 m!1379111))

(declare-fun m!1379141 () Bool)

(assert (=> b!1495741 m!1379141))

(assert (=> b!1495741 m!1379141))

(assert (=> b!1495741 m!1379111))

(declare-fun m!1379143 () Bool)

(assert (=> b!1495741 m!1379143))

(assert (=> b!1495735 m!1379111))

(assert (=> b!1495735 m!1379111))

(declare-fun m!1379145 () Bool)

(assert (=> b!1495735 m!1379145))

(assert (=> b!1495746 m!1379111))

(assert (=> b!1495746 m!1379111))

(declare-fun m!1379147 () Bool)

(assert (=> b!1495746 m!1379147))

(assert (=> b!1495749 m!1379111))

(assert (=> b!1495749 m!1379111))

(declare-fun m!1379149 () Bool)

(assert (=> b!1495749 m!1379149))

(declare-fun m!1379151 () Bool)

(assert (=> b!1495742 m!1379151))

(declare-fun m!1379153 () Bool)

(assert (=> b!1495738 m!1379153))

(declare-fun m!1379155 () Bool)

(assert (=> b!1495732 m!1379155))

(declare-fun m!1379157 () Bool)

(assert (=> b!1495740 m!1379157))

(assert (=> b!1495740 m!1379129))

(declare-fun m!1379159 () Bool)

(assert (=> b!1495737 m!1379159))

(declare-fun m!1379161 () Bool)

(assert (=> b!1495739 m!1379161))

(assert (=> b!1495739 m!1379161))

(declare-fun m!1379163 () Bool)

(assert (=> b!1495739 m!1379163))

(declare-fun m!1379165 () Bool)

(assert (=> start!127272 m!1379165))

(declare-fun m!1379167 () Bool)

(assert (=> start!127272 m!1379167))

(check-sat (not b!1495737) (not b!1495736) (not b!1495732) (not b!1495738) (not b!1495748) (not b!1495733) (not b!1495740) (not b!1495749) (not b!1495741) (not b!1495735) (not b!1495746) (not b!1495734) (not b!1495744) (not b!1495739) (not start!127272) (not b!1495742))
(check-sat)
(get-model)

(declare-fun b!1495832 () Bool)

(declare-fun e!837827 () Bool)

(declare-fun e!837824 () Bool)

(assert (=> b!1495832 (= e!837827 e!837824)))

(declare-fun c!138699 () Bool)

(assert (=> b!1495832 (= c!138699 (validKeyInArray!0 (select (arr!48162 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495833 () Bool)

(declare-fun call!68023 () Bool)

(assert (=> b!1495833 (= e!837824 call!68023)))

(declare-fun d!157305 () Bool)

(declare-fun res!1017500 () Bool)

(declare-fun e!837826 () Bool)

(assert (=> d!157305 (=> res!1017500 e!837826)))

(assert (=> d!157305 (= res!1017500 (bvsge #b00000000000000000000000000000000 (size!48712 a!2862)))))

(assert (=> d!157305 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34660) e!837826)))

(declare-fun b!1495834 () Bool)

(assert (=> b!1495834 (= e!837826 e!837827)))

(declare-fun res!1017502 () Bool)

(assert (=> b!1495834 (=> (not res!1017502) (not e!837827))))

(declare-fun e!837825 () Bool)

(assert (=> b!1495834 (= res!1017502 (not e!837825))))

(declare-fun res!1017501 () Bool)

(assert (=> b!1495834 (=> (not res!1017501) (not e!837825))))

(assert (=> b!1495834 (= res!1017501 (validKeyInArray!0 (select (arr!48162 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495835 () Bool)

(assert (=> b!1495835 (= e!837824 call!68023)))

(declare-fun b!1495836 () Bool)

(declare-fun contains!9935 (List!34663 (_ BitVec 64)) Bool)

(assert (=> b!1495836 (= e!837825 (contains!9935 Nil!34660 (select (arr!48162 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68020 () Bool)

(assert (=> bm!68020 (= call!68023 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138699 (Cons!34659 (select (arr!48162 a!2862) #b00000000000000000000000000000000) Nil!34660) Nil!34660)))))

(assert (= (and d!157305 (not res!1017500)) b!1495834))

(assert (= (and b!1495834 res!1017501) b!1495836))

(assert (= (and b!1495834 res!1017502) b!1495832))

(assert (= (and b!1495832 c!138699) b!1495835))

(assert (= (and b!1495832 (not c!138699)) b!1495833))

(assert (= (or b!1495835 b!1495833) bm!68020))

(declare-fun m!1379227 () Bool)

(assert (=> b!1495832 m!1379227))

(assert (=> b!1495832 m!1379227))

(declare-fun m!1379229 () Bool)

(assert (=> b!1495832 m!1379229))

(assert (=> b!1495834 m!1379227))

(assert (=> b!1495834 m!1379227))

(assert (=> b!1495834 m!1379229))

(assert (=> b!1495836 m!1379227))

(assert (=> b!1495836 m!1379227))

(declare-fun m!1379231 () Bool)

(assert (=> b!1495836 m!1379231))

(assert (=> bm!68020 m!1379227))

(declare-fun m!1379233 () Bool)

(assert (=> bm!68020 m!1379233))

(assert (=> b!1495734 d!157305))

(declare-fun b!1495855 () Bool)

(declare-fun lt!651872 () SeekEntryResult!12402)

(assert (=> b!1495855 (and (bvsge (index!52002 lt!651872) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651872) (size!48712 lt!651845)))))

(declare-fun res!1017511 () Bool)

(assert (=> b!1495855 (= res!1017511 (= (select (arr!48162 lt!651845) (index!52002 lt!651872)) lt!651844))))

(declare-fun e!837839 () Bool)

(assert (=> b!1495855 (=> res!1017511 e!837839)))

(declare-fun e!837840 () Bool)

(assert (=> b!1495855 (= e!837840 e!837839)))

(declare-fun b!1495856 () Bool)

(declare-fun e!837842 () SeekEntryResult!12402)

(assert (=> b!1495856 (= e!837842 (Intermediate!12402 true (toIndex!0 lt!651844 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495857 () Bool)

(assert (=> b!1495857 (and (bvsge (index!52002 lt!651872) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651872) (size!48712 lt!651845)))))

(assert (=> b!1495857 (= e!837839 (= (select (arr!48162 lt!651845) (index!52002 lt!651872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495858 () Bool)

(declare-fun e!837841 () Bool)

(assert (=> b!1495858 (= e!837841 (bvsge (x!133618 lt!651872) #b01111111111111111111111111111110))))

(declare-fun b!1495859 () Bool)

(declare-fun e!837838 () SeekEntryResult!12402)

(assert (=> b!1495859 (= e!837842 e!837838)))

(declare-fun c!138706 () Bool)

(declare-fun lt!651873 () (_ BitVec 64))

(assert (=> b!1495859 (= c!138706 (or (= lt!651873 lt!651844) (= (bvadd lt!651873 lt!651873) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157307 () Bool)

(assert (=> d!157307 e!837841))

(declare-fun c!138707 () Bool)

(get-info :version)

(assert (=> d!157307 (= c!138707 (and ((_ is Intermediate!12402) lt!651872) (undefined!13214 lt!651872)))))

(assert (=> d!157307 (= lt!651872 e!837842)))

(declare-fun c!138708 () Bool)

(assert (=> d!157307 (= c!138708 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157307 (= lt!651873 (select (arr!48162 lt!651845) (toIndex!0 lt!651844 mask!2687)))))

(assert (=> d!157307 (validMask!0 mask!2687)))

(assert (=> d!157307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651844 mask!2687) lt!651844 lt!651845 mask!2687) lt!651872)))

(declare-fun b!1495860 () Bool)

(assert (=> b!1495860 (= e!837838 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651844 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651844 lt!651845 mask!2687))))

(declare-fun b!1495861 () Bool)

(assert (=> b!1495861 (= e!837838 (Intermediate!12402 false (toIndex!0 lt!651844 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495862 () Bool)

(assert (=> b!1495862 (= e!837841 e!837840)))

(declare-fun res!1017509 () Bool)

(assert (=> b!1495862 (= res!1017509 (and ((_ is Intermediate!12402) lt!651872) (not (undefined!13214 lt!651872)) (bvslt (x!133618 lt!651872) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651872) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651872) #b00000000000000000000000000000000)))))

(assert (=> b!1495862 (=> (not res!1017509) (not e!837840))))

(declare-fun b!1495863 () Bool)

(assert (=> b!1495863 (and (bvsge (index!52002 lt!651872) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651872) (size!48712 lt!651845)))))

(declare-fun res!1017510 () Bool)

(assert (=> b!1495863 (= res!1017510 (= (select (arr!48162 lt!651845) (index!52002 lt!651872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495863 (=> res!1017510 e!837839)))

(assert (= (and d!157307 c!138708) b!1495856))

(assert (= (and d!157307 (not c!138708)) b!1495859))

(assert (= (and b!1495859 c!138706) b!1495861))

(assert (= (and b!1495859 (not c!138706)) b!1495860))

(assert (= (and d!157307 c!138707) b!1495858))

(assert (= (and d!157307 (not c!138707)) b!1495862))

(assert (= (and b!1495862 res!1017509) b!1495855))

(assert (= (and b!1495855 (not res!1017511)) b!1495863))

(assert (= (and b!1495863 (not res!1017510)) b!1495857))

(declare-fun m!1379235 () Bool)

(assert (=> b!1495855 m!1379235))

(assert (=> b!1495857 m!1379235))

(assert (=> d!157307 m!1379133))

(declare-fun m!1379237 () Bool)

(assert (=> d!157307 m!1379237))

(assert (=> d!157307 m!1379165))

(assert (=> b!1495860 m!1379133))

(declare-fun m!1379239 () Bool)

(assert (=> b!1495860 m!1379239))

(assert (=> b!1495860 m!1379239))

(declare-fun m!1379241 () Bool)

(assert (=> b!1495860 m!1379241))

(assert (=> b!1495863 m!1379235))

(assert (=> b!1495744 d!157307))

(declare-fun d!157309 () Bool)

(declare-fun lt!651879 () (_ BitVec 32))

(declare-fun lt!651878 () (_ BitVec 32))

(assert (=> d!157309 (= lt!651879 (bvmul (bvxor lt!651878 (bvlshr lt!651878 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157309 (= lt!651878 ((_ extract 31 0) (bvand (bvxor lt!651844 (bvlshr lt!651844 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157309 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017512 (let ((h!36056 ((_ extract 31 0) (bvand (bvxor lt!651844 (bvlshr lt!651844 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133621 (bvmul (bvxor h!36056 (bvlshr h!36056 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133621 (bvlshr x!133621 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017512 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017512 #b00000000000000000000000000000000))))))

(assert (=> d!157309 (= (toIndex!0 lt!651844 mask!2687) (bvand (bvxor lt!651879 (bvlshr lt!651879 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495744 d!157309))

(declare-fun b!1495864 () Bool)

(declare-fun lt!651880 () SeekEntryResult!12402)

(assert (=> b!1495864 (and (bvsge (index!52002 lt!651880) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651880) (size!48712 a!2862)))))

(declare-fun res!1017515 () Bool)

(assert (=> b!1495864 (= res!1017515 (= (select (arr!48162 a!2862) (index!52002 lt!651880)) (select (arr!48162 a!2862) j!93)))))

(declare-fun e!837844 () Bool)

(assert (=> b!1495864 (=> res!1017515 e!837844)))

(declare-fun e!837845 () Bool)

(assert (=> b!1495864 (= e!837845 e!837844)))

(declare-fun b!1495865 () Bool)

(declare-fun e!837847 () SeekEntryResult!12402)

(assert (=> b!1495865 (= e!837847 (Intermediate!12402 true index!646 x!665))))

(declare-fun b!1495866 () Bool)

(assert (=> b!1495866 (and (bvsge (index!52002 lt!651880) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651880) (size!48712 a!2862)))))

(assert (=> b!1495866 (= e!837844 (= (select (arr!48162 a!2862) (index!52002 lt!651880)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495867 () Bool)

(declare-fun e!837846 () Bool)

(assert (=> b!1495867 (= e!837846 (bvsge (x!133618 lt!651880) #b01111111111111111111111111111110))))

(declare-fun b!1495868 () Bool)

(declare-fun e!837843 () SeekEntryResult!12402)

(assert (=> b!1495868 (= e!837847 e!837843)))

(declare-fun lt!651881 () (_ BitVec 64))

(declare-fun c!138709 () Bool)

(assert (=> b!1495868 (= c!138709 (or (= lt!651881 (select (arr!48162 a!2862) j!93)) (= (bvadd lt!651881 lt!651881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157311 () Bool)

(assert (=> d!157311 e!837846))

(declare-fun c!138710 () Bool)

(assert (=> d!157311 (= c!138710 (and ((_ is Intermediate!12402) lt!651880) (undefined!13214 lt!651880)))))

(assert (=> d!157311 (= lt!651880 e!837847)))

(declare-fun c!138711 () Bool)

(assert (=> d!157311 (= c!138711 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157311 (= lt!651881 (select (arr!48162 a!2862) index!646))))

(assert (=> d!157311 (validMask!0 mask!2687)))

(assert (=> d!157311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651880)))

(declare-fun b!1495869 () Bool)

(assert (=> b!1495869 (= e!837843 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495870 () Bool)

(assert (=> b!1495870 (= e!837843 (Intermediate!12402 false index!646 x!665))))

(declare-fun b!1495871 () Bool)

(assert (=> b!1495871 (= e!837846 e!837845)))

(declare-fun res!1017513 () Bool)

(assert (=> b!1495871 (= res!1017513 (and ((_ is Intermediate!12402) lt!651880) (not (undefined!13214 lt!651880)) (bvslt (x!133618 lt!651880) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651880) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651880) x!665)))))

(assert (=> b!1495871 (=> (not res!1017513) (not e!837845))))

(declare-fun b!1495872 () Bool)

(assert (=> b!1495872 (and (bvsge (index!52002 lt!651880) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651880) (size!48712 a!2862)))))

(declare-fun res!1017514 () Bool)

(assert (=> b!1495872 (= res!1017514 (= (select (arr!48162 a!2862) (index!52002 lt!651880)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495872 (=> res!1017514 e!837844)))

(assert (= (and d!157311 c!138711) b!1495865))

(assert (= (and d!157311 (not c!138711)) b!1495868))

(assert (= (and b!1495868 c!138709) b!1495870))

(assert (= (and b!1495868 (not c!138709)) b!1495869))

(assert (= (and d!157311 c!138710) b!1495867))

(assert (= (and d!157311 (not c!138710)) b!1495871))

(assert (= (and b!1495871 res!1017513) b!1495864))

(assert (= (and b!1495864 (not res!1017515)) b!1495872))

(assert (= (and b!1495872 (not res!1017514)) b!1495866))

(declare-fun m!1379243 () Bool)

(assert (=> b!1495864 m!1379243))

(assert (=> b!1495866 m!1379243))

(assert (=> d!157311 m!1379123))

(assert (=> d!157311 m!1379165))

(assert (=> b!1495869 m!1379153))

(assert (=> b!1495869 m!1379153))

(assert (=> b!1495869 m!1379111))

(declare-fun m!1379245 () Bool)

(assert (=> b!1495869 m!1379245))

(assert (=> b!1495872 m!1379243))

(assert (=> b!1495746 d!157311))

(declare-fun d!157313 () Bool)

(assert (=> d!157313 (= (validKeyInArray!0 (select (arr!48162 a!2862) j!93)) (and (not (= (select (arr!48162 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48162 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495735 d!157313))

(declare-fun b!1495873 () Bool)

(declare-fun lt!651882 () SeekEntryResult!12402)

(assert (=> b!1495873 (and (bvsge (index!52002 lt!651882) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651882) (size!48712 lt!651845)))))

(declare-fun res!1017518 () Bool)

(assert (=> b!1495873 (= res!1017518 (= (select (arr!48162 lt!651845) (index!52002 lt!651882)) lt!651844))))

(declare-fun e!837849 () Bool)

(assert (=> b!1495873 (=> res!1017518 e!837849)))

(declare-fun e!837850 () Bool)

(assert (=> b!1495873 (= e!837850 e!837849)))

(declare-fun b!1495874 () Bool)

(declare-fun e!837852 () SeekEntryResult!12402)

(assert (=> b!1495874 (= e!837852 (Intermediate!12402 true lt!651848 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495875 () Bool)

(assert (=> b!1495875 (and (bvsge (index!52002 lt!651882) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651882) (size!48712 lt!651845)))))

(assert (=> b!1495875 (= e!837849 (= (select (arr!48162 lt!651845) (index!52002 lt!651882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495876 () Bool)

(declare-fun e!837851 () Bool)

(assert (=> b!1495876 (= e!837851 (bvsge (x!133618 lt!651882) #b01111111111111111111111111111110))))

(declare-fun b!1495877 () Bool)

(declare-fun e!837848 () SeekEntryResult!12402)

(assert (=> b!1495877 (= e!837852 e!837848)))

(declare-fun c!138712 () Bool)

(declare-fun lt!651883 () (_ BitVec 64))

(assert (=> b!1495877 (= c!138712 (or (= lt!651883 lt!651844) (= (bvadd lt!651883 lt!651883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157315 () Bool)

(assert (=> d!157315 e!837851))

(declare-fun c!138713 () Bool)

(assert (=> d!157315 (= c!138713 (and ((_ is Intermediate!12402) lt!651882) (undefined!13214 lt!651882)))))

(assert (=> d!157315 (= lt!651882 e!837852)))

(declare-fun c!138714 () Bool)

(assert (=> d!157315 (= c!138714 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157315 (= lt!651883 (select (arr!48162 lt!651845) lt!651848))))

(assert (=> d!157315 (validMask!0 mask!2687)))

(assert (=> d!157315 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 lt!651844 lt!651845 mask!2687) lt!651882)))

(declare-fun b!1495878 () Bool)

(assert (=> b!1495878 (= e!837848 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651848 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651844 lt!651845 mask!2687))))

(declare-fun b!1495879 () Bool)

(assert (=> b!1495879 (= e!837848 (Intermediate!12402 false lt!651848 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495880 () Bool)

(assert (=> b!1495880 (= e!837851 e!837850)))

(declare-fun res!1017516 () Bool)

(assert (=> b!1495880 (= res!1017516 (and ((_ is Intermediate!12402) lt!651882) (not (undefined!13214 lt!651882)) (bvslt (x!133618 lt!651882) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651882) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651882) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495880 (=> (not res!1017516) (not e!837850))))

(declare-fun b!1495881 () Bool)

(assert (=> b!1495881 (and (bvsge (index!52002 lt!651882) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651882) (size!48712 lt!651845)))))

(declare-fun res!1017517 () Bool)

(assert (=> b!1495881 (= res!1017517 (= (select (arr!48162 lt!651845) (index!52002 lt!651882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495881 (=> res!1017517 e!837849)))

(assert (= (and d!157315 c!138714) b!1495874))

(assert (= (and d!157315 (not c!138714)) b!1495877))

(assert (= (and b!1495877 c!138712) b!1495879))

(assert (= (and b!1495877 (not c!138712)) b!1495878))

(assert (= (and d!157315 c!138713) b!1495876))

(assert (= (and d!157315 (not c!138713)) b!1495880))

(assert (= (and b!1495880 res!1017516) b!1495873))

(assert (= (and b!1495873 (not res!1017518)) b!1495881))

(assert (= (and b!1495881 (not res!1017517)) b!1495875))

(declare-fun m!1379247 () Bool)

(assert (=> b!1495873 m!1379247))

(assert (=> b!1495875 m!1379247))

(declare-fun m!1379249 () Bool)

(assert (=> d!157315 m!1379249))

(assert (=> d!157315 m!1379165))

(declare-fun m!1379251 () Bool)

(assert (=> b!1495878 m!1379251))

(assert (=> b!1495878 m!1379251))

(declare-fun m!1379253 () Bool)

(assert (=> b!1495878 m!1379253))

(assert (=> b!1495881 m!1379247))

(assert (=> b!1495737 d!157315))

(declare-fun call!68026 () Bool)

(declare-fun bm!68023 () Bool)

(assert (=> bm!68023 (= call!68026 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495890 () Bool)

(declare-fun e!837860 () Bool)

(assert (=> b!1495890 (= e!837860 call!68026)))

(declare-fun b!1495891 () Bool)

(declare-fun e!837861 () Bool)

(assert (=> b!1495891 (= e!837861 call!68026)))

(declare-fun d!157317 () Bool)

(declare-fun res!1017524 () Bool)

(declare-fun e!837859 () Bool)

(assert (=> d!157317 (=> res!1017524 e!837859)))

(assert (=> d!157317 (= res!1017524 (bvsge j!93 (size!48712 a!2862)))))

(assert (=> d!157317 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837859)))

(declare-fun b!1495892 () Bool)

(assert (=> b!1495892 (= e!837859 e!837860)))

(declare-fun c!138717 () Bool)

(assert (=> b!1495892 (= c!138717 (validKeyInArray!0 (select (arr!48162 a!2862) j!93)))))

(declare-fun b!1495893 () Bool)

(assert (=> b!1495893 (= e!837860 e!837861)))

(declare-fun lt!651890 () (_ BitVec 64))

(assert (=> b!1495893 (= lt!651890 (select (arr!48162 a!2862) j!93))))

(declare-fun lt!651891 () Unit!50144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99793 (_ BitVec 64) (_ BitVec 32)) Unit!50144)

(assert (=> b!1495893 (= lt!651891 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651890 j!93))))

(declare-fun arrayContainsKey!0 (array!99793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495893 (arrayContainsKey!0 a!2862 lt!651890 #b00000000000000000000000000000000)))

(declare-fun lt!651892 () Unit!50144)

(assert (=> b!1495893 (= lt!651892 lt!651891)))

(declare-fun res!1017523 () Bool)

(assert (=> b!1495893 (= res!1017523 (= (seekEntryOrOpen!0 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) (Found!12402 j!93)))))

(assert (=> b!1495893 (=> (not res!1017523) (not e!837861))))

(assert (= (and d!157317 (not res!1017524)) b!1495892))

(assert (= (and b!1495892 c!138717) b!1495893))

(assert (= (and b!1495892 (not c!138717)) b!1495890))

(assert (= (and b!1495893 res!1017523) b!1495891))

(assert (= (or b!1495891 b!1495890) bm!68023))

(declare-fun m!1379255 () Bool)

(assert (=> bm!68023 m!1379255))

(assert (=> b!1495892 m!1379111))

(assert (=> b!1495892 m!1379111))

(assert (=> b!1495892 m!1379145))

(assert (=> b!1495893 m!1379111))

(declare-fun m!1379257 () Bool)

(assert (=> b!1495893 m!1379257))

(declare-fun m!1379259 () Bool)

(assert (=> b!1495893 m!1379259))

(assert (=> b!1495893 m!1379111))

(assert (=> b!1495893 m!1379149))

(assert (=> b!1495736 d!157317))

(declare-fun d!157319 () Bool)

(assert (=> d!157319 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651895 () Unit!50144)

(declare-fun choose!38 (array!99793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50144)

(assert (=> d!157319 (= lt!651895 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157319 (validMask!0 mask!2687)))

(assert (=> d!157319 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651895)))

(declare-fun bs!42920 () Bool)

(assert (= bs!42920 d!157319))

(assert (=> bs!42920 m!1379125))

(declare-fun m!1379261 () Bool)

(assert (=> bs!42920 m!1379261))

(assert (=> bs!42920 m!1379165))

(assert (=> b!1495736 d!157319))

(declare-fun lt!651904 () SeekEntryResult!12402)

(declare-fun b!1495906 () Bool)

(declare-fun e!837869 () SeekEntryResult!12402)

(assert (=> b!1495906 (= e!837869 (seekKeyOrZeroReturnVacant!0 (x!133618 lt!651904) (index!52002 lt!651904) (index!52002 lt!651904) (select (arr!48162 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495907 () Bool)

(declare-fun e!837868 () SeekEntryResult!12402)

(assert (=> b!1495907 (= e!837868 Undefined!12402)))

(declare-fun b!1495908 () Bool)

(declare-fun e!837870 () SeekEntryResult!12402)

(assert (=> b!1495908 (= e!837870 (Found!12402 (index!52002 lt!651904)))))

(declare-fun b!1495909 () Bool)

(assert (=> b!1495909 (= e!837868 e!837870)))

(declare-fun lt!651902 () (_ BitVec 64))

(assert (=> b!1495909 (= lt!651902 (select (arr!48162 a!2862) (index!52002 lt!651904)))))

(declare-fun c!138726 () Bool)

(assert (=> b!1495909 (= c!138726 (= lt!651902 (select (arr!48162 a!2862) j!93)))))

(declare-fun b!1495910 () Bool)

(declare-fun c!138725 () Bool)

(assert (=> b!1495910 (= c!138725 (= lt!651902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495910 (= e!837870 e!837869)))

(declare-fun b!1495911 () Bool)

(assert (=> b!1495911 (= e!837869 (MissingZero!12402 (index!52002 lt!651904)))))

(declare-fun d!157321 () Bool)

(declare-fun lt!651903 () SeekEntryResult!12402)

(assert (=> d!157321 (and (or ((_ is Undefined!12402) lt!651903) (not ((_ is Found!12402) lt!651903)) (and (bvsge (index!52001 lt!651903) #b00000000000000000000000000000000) (bvslt (index!52001 lt!651903) (size!48712 a!2862)))) (or ((_ is Undefined!12402) lt!651903) ((_ is Found!12402) lt!651903) (not ((_ is MissingZero!12402) lt!651903)) (and (bvsge (index!52000 lt!651903) #b00000000000000000000000000000000) (bvslt (index!52000 lt!651903) (size!48712 a!2862)))) (or ((_ is Undefined!12402) lt!651903) ((_ is Found!12402) lt!651903) ((_ is MissingZero!12402) lt!651903) (not ((_ is MissingVacant!12402) lt!651903)) (and (bvsge (index!52003 lt!651903) #b00000000000000000000000000000000) (bvslt (index!52003 lt!651903) (size!48712 a!2862)))) (or ((_ is Undefined!12402) lt!651903) (ite ((_ is Found!12402) lt!651903) (= (select (arr!48162 a!2862) (index!52001 lt!651903)) (select (arr!48162 a!2862) j!93)) (ite ((_ is MissingZero!12402) lt!651903) (= (select (arr!48162 a!2862) (index!52000 lt!651903)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12402) lt!651903) (= (select (arr!48162 a!2862) (index!52003 lt!651903)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157321 (= lt!651903 e!837868)))

(declare-fun c!138724 () Bool)

(assert (=> d!157321 (= c!138724 (and ((_ is Intermediate!12402) lt!651904) (undefined!13214 lt!651904)))))

(assert (=> d!157321 (= lt!651904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157321 (validMask!0 mask!2687)))

(assert (=> d!157321 (= (seekEntryOrOpen!0 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651903)))

(assert (= (and d!157321 c!138724) b!1495907))

(assert (= (and d!157321 (not c!138724)) b!1495909))

(assert (= (and b!1495909 c!138726) b!1495908))

(assert (= (and b!1495909 (not c!138726)) b!1495910))

(assert (= (and b!1495910 c!138725) b!1495911))

(assert (= (and b!1495910 (not c!138725)) b!1495906))

(assert (=> b!1495906 m!1379111))

(declare-fun m!1379263 () Bool)

(assert (=> b!1495906 m!1379263))

(declare-fun m!1379265 () Bool)

(assert (=> b!1495909 m!1379265))

(declare-fun m!1379267 () Bool)

(assert (=> d!157321 m!1379267))

(declare-fun m!1379269 () Bool)

(assert (=> d!157321 m!1379269))

(declare-fun m!1379271 () Bool)

(assert (=> d!157321 m!1379271))

(assert (=> d!157321 m!1379111))

(assert (=> d!157321 m!1379141))

(assert (=> d!157321 m!1379165))

(assert (=> d!157321 m!1379141))

(assert (=> d!157321 m!1379111))

(assert (=> d!157321 m!1379143))

(assert (=> b!1495749 d!157321))

(declare-fun d!157325 () Bool)

(declare-fun lt!651913 () (_ BitVec 32))

(assert (=> d!157325 (and (bvsge lt!651913 #b00000000000000000000000000000000) (bvslt lt!651913 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157325 (= lt!651913 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157325 (validMask!0 mask!2687)))

(assert (=> d!157325 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651913)))

(declare-fun bs!42921 () Bool)

(assert (= bs!42921 d!157325))

(declare-fun m!1379273 () Bool)

(assert (=> bs!42921 m!1379273))

(assert (=> bs!42921 m!1379165))

(assert (=> b!1495738 d!157325))

(declare-fun b!1495920 () Bool)

(declare-fun lt!651914 () SeekEntryResult!12402)

(assert (=> b!1495920 (and (bvsge (index!52002 lt!651914) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651914) (size!48712 a!2862)))))

(declare-fun res!1017531 () Bool)

(assert (=> b!1495920 (= res!1017531 (= (select (arr!48162 a!2862) (index!52002 lt!651914)) (select (arr!48162 a!2862) j!93)))))

(declare-fun e!837878 () Bool)

(assert (=> b!1495920 (=> res!1017531 e!837878)))

(declare-fun e!837879 () Bool)

(assert (=> b!1495920 (= e!837879 e!837878)))

(declare-fun b!1495921 () Bool)

(declare-fun e!837881 () SeekEntryResult!12402)

(assert (=> b!1495921 (= e!837881 (Intermediate!12402 true lt!651848 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495922 () Bool)

(assert (=> b!1495922 (and (bvsge (index!52002 lt!651914) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651914) (size!48712 a!2862)))))

(assert (=> b!1495922 (= e!837878 (= (select (arr!48162 a!2862) (index!52002 lt!651914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495923 () Bool)

(declare-fun e!837880 () Bool)

(assert (=> b!1495923 (= e!837880 (bvsge (x!133618 lt!651914) #b01111111111111111111111111111110))))

(declare-fun b!1495924 () Bool)

(declare-fun e!837877 () SeekEntryResult!12402)

(assert (=> b!1495924 (= e!837881 e!837877)))

(declare-fun lt!651915 () (_ BitVec 64))

(declare-fun c!138729 () Bool)

(assert (=> b!1495924 (= c!138729 (or (= lt!651915 (select (arr!48162 a!2862) j!93)) (= (bvadd lt!651915 lt!651915) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157327 () Bool)

(assert (=> d!157327 e!837880))

(declare-fun c!138730 () Bool)

(assert (=> d!157327 (= c!138730 (and ((_ is Intermediate!12402) lt!651914) (undefined!13214 lt!651914)))))

(assert (=> d!157327 (= lt!651914 e!837881)))

(declare-fun c!138731 () Bool)

(assert (=> d!157327 (= c!138731 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157327 (= lt!651915 (select (arr!48162 a!2862) lt!651848))))

(assert (=> d!157327 (validMask!0 mask!2687)))

(assert (=> d!157327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651914)))

(declare-fun b!1495925 () Bool)

(assert (=> b!1495925 (= e!837877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651848 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495926 () Bool)

(assert (=> b!1495926 (= e!837877 (Intermediate!12402 false lt!651848 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495927 () Bool)

(assert (=> b!1495927 (= e!837880 e!837879)))

(declare-fun res!1017529 () Bool)

(assert (=> b!1495927 (= res!1017529 (and ((_ is Intermediate!12402) lt!651914) (not (undefined!13214 lt!651914)) (bvslt (x!133618 lt!651914) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651914) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651914) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495927 (=> (not res!1017529) (not e!837879))))

(declare-fun b!1495928 () Bool)

(assert (=> b!1495928 (and (bvsge (index!52002 lt!651914) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651914) (size!48712 a!2862)))))

(declare-fun res!1017530 () Bool)

(assert (=> b!1495928 (= res!1017530 (= (select (arr!48162 a!2862) (index!52002 lt!651914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495928 (=> res!1017530 e!837878)))

(assert (= (and d!157327 c!138731) b!1495921))

(assert (= (and d!157327 (not c!138731)) b!1495924))

(assert (= (and b!1495924 c!138729) b!1495926))

(assert (= (and b!1495924 (not c!138729)) b!1495925))

(assert (= (and d!157327 c!138730) b!1495923))

(assert (= (and d!157327 (not c!138730)) b!1495927))

(assert (= (and b!1495927 res!1017529) b!1495920))

(assert (= (and b!1495920 (not res!1017531)) b!1495928))

(assert (= (and b!1495928 (not res!1017530)) b!1495922))

(declare-fun m!1379275 () Bool)

(assert (=> b!1495920 m!1379275))

(assert (=> b!1495922 m!1379275))

(declare-fun m!1379277 () Bool)

(assert (=> d!157327 m!1379277))

(assert (=> d!157327 m!1379165))

(assert (=> b!1495925 m!1379251))

(assert (=> b!1495925 m!1379251))

(assert (=> b!1495925 m!1379111))

(declare-fun m!1379279 () Bool)

(assert (=> b!1495925 m!1379279))

(assert (=> b!1495928 m!1379275))

(assert (=> b!1495748 d!157327))

(declare-fun d!157329 () Bool)

(assert (=> d!157329 (= (validKeyInArray!0 (select (arr!48162 a!2862) i!1006)) (and (not (= (select (arr!48162 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48162 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495739 d!157329))

(declare-fun b!1495929 () Bool)

(declare-fun lt!651916 () SeekEntryResult!12402)

(assert (=> b!1495929 (and (bvsge (index!52002 lt!651916) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651916) (size!48712 a!2862)))))

(declare-fun res!1017534 () Bool)

(assert (=> b!1495929 (= res!1017534 (= (select (arr!48162 a!2862) (index!52002 lt!651916)) (select (arr!48162 a!2862) j!93)))))

(declare-fun e!837883 () Bool)

(assert (=> b!1495929 (=> res!1017534 e!837883)))

(declare-fun e!837884 () Bool)

(assert (=> b!1495929 (= e!837884 e!837883)))

(declare-fun e!837886 () SeekEntryResult!12402)

(declare-fun b!1495930 () Bool)

(assert (=> b!1495930 (= e!837886 (Intermediate!12402 true (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495931 () Bool)

(assert (=> b!1495931 (and (bvsge (index!52002 lt!651916) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651916) (size!48712 a!2862)))))

(assert (=> b!1495931 (= e!837883 (= (select (arr!48162 a!2862) (index!52002 lt!651916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495932 () Bool)

(declare-fun e!837885 () Bool)

(assert (=> b!1495932 (= e!837885 (bvsge (x!133618 lt!651916) #b01111111111111111111111111111110))))

(declare-fun b!1495933 () Bool)

(declare-fun e!837882 () SeekEntryResult!12402)

(assert (=> b!1495933 (= e!837886 e!837882)))

(declare-fun c!138732 () Bool)

(declare-fun lt!651917 () (_ BitVec 64))

(assert (=> b!1495933 (= c!138732 (or (= lt!651917 (select (arr!48162 a!2862) j!93)) (= (bvadd lt!651917 lt!651917) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157331 () Bool)

(assert (=> d!157331 e!837885))

(declare-fun c!138733 () Bool)

(assert (=> d!157331 (= c!138733 (and ((_ is Intermediate!12402) lt!651916) (undefined!13214 lt!651916)))))

(assert (=> d!157331 (= lt!651916 e!837886)))

(declare-fun c!138734 () Bool)

(assert (=> d!157331 (= c!138734 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157331 (= lt!651917 (select (arr!48162 a!2862) (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687)))))

(assert (=> d!157331 (validMask!0 mask!2687)))

(assert (=> d!157331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687) lt!651916)))

(declare-fun b!1495934 () Bool)

(assert (=> b!1495934 (= e!837882 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48162 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495935 () Bool)

(assert (=> b!1495935 (= e!837882 (Intermediate!12402 false (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495936 () Bool)

(assert (=> b!1495936 (= e!837885 e!837884)))

(declare-fun res!1017532 () Bool)

(assert (=> b!1495936 (= res!1017532 (and ((_ is Intermediate!12402) lt!651916) (not (undefined!13214 lt!651916)) (bvslt (x!133618 lt!651916) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651916) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651916) #b00000000000000000000000000000000)))))

(assert (=> b!1495936 (=> (not res!1017532) (not e!837884))))

(declare-fun b!1495937 () Bool)

(assert (=> b!1495937 (and (bvsge (index!52002 lt!651916) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651916) (size!48712 a!2862)))))

(declare-fun res!1017533 () Bool)

(assert (=> b!1495937 (= res!1017533 (= (select (arr!48162 a!2862) (index!52002 lt!651916)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495937 (=> res!1017533 e!837883)))

(assert (= (and d!157331 c!138734) b!1495930))

(assert (= (and d!157331 (not c!138734)) b!1495933))

(assert (= (and b!1495933 c!138732) b!1495935))

(assert (= (and b!1495933 (not c!138732)) b!1495934))

(assert (= (and d!157331 c!138733) b!1495932))

(assert (= (and d!157331 (not c!138733)) b!1495936))

(assert (= (and b!1495936 res!1017532) b!1495929))

(assert (= (and b!1495929 (not res!1017534)) b!1495937))

(assert (= (and b!1495937 (not res!1017533)) b!1495931))

(declare-fun m!1379281 () Bool)

(assert (=> b!1495929 m!1379281))

(assert (=> b!1495931 m!1379281))

(assert (=> d!157331 m!1379141))

(declare-fun m!1379283 () Bool)

(assert (=> d!157331 m!1379283))

(assert (=> d!157331 m!1379165))

(assert (=> b!1495934 m!1379141))

(declare-fun m!1379285 () Bool)

(assert (=> b!1495934 m!1379285))

(assert (=> b!1495934 m!1379285))

(assert (=> b!1495934 m!1379111))

(declare-fun m!1379287 () Bool)

(assert (=> b!1495934 m!1379287))

(assert (=> b!1495937 m!1379281))

(assert (=> b!1495741 d!157331))

(declare-fun d!157333 () Bool)

(declare-fun lt!651919 () (_ BitVec 32))

(declare-fun lt!651918 () (_ BitVec 32))

(assert (=> d!157333 (= lt!651919 (bvmul (bvxor lt!651918 (bvlshr lt!651918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157333 (= lt!651918 ((_ extract 31 0) (bvand (bvxor (select (arr!48162 a!2862) j!93) (bvlshr (select (arr!48162 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157333 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017512 (let ((h!36056 ((_ extract 31 0) (bvand (bvxor (select (arr!48162 a!2862) j!93) (bvlshr (select (arr!48162 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133621 (bvmul (bvxor h!36056 (bvlshr h!36056 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133621 (bvlshr x!133621 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017512 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017512 #b00000000000000000000000000000000))))))

(assert (=> d!157333 (= (toIndex!0 (select (arr!48162 a!2862) j!93) mask!2687) (bvand (bvxor lt!651919 (bvlshr lt!651919 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495741 d!157333))

(declare-fun b!1495966 () Bool)

(declare-fun e!837902 () SeekEntryResult!12402)

(assert (=> b!1495966 (= e!837902 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687))))

(declare-fun b!1495967 () Bool)

(declare-fun c!138750 () Bool)

(declare-fun lt!651932 () (_ BitVec 64))

(assert (=> b!1495967 (= c!138750 (= lt!651932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837903 () SeekEntryResult!12402)

(assert (=> b!1495967 (= e!837903 e!837902)))

(declare-fun b!1495968 () Bool)

(declare-fun e!837904 () SeekEntryResult!12402)

(assert (=> b!1495968 (= e!837904 e!837903)))

(declare-fun c!138749 () Bool)

(assert (=> b!1495968 (= c!138749 (= lt!651932 lt!651844))))

(declare-fun b!1495969 () Bool)

(assert (=> b!1495969 (= e!837902 (MissingVacant!12402 intermediateAfterIndex!19))))

(declare-fun d!157335 () Bool)

(declare-fun lt!651931 () SeekEntryResult!12402)

(assert (=> d!157335 (and (or ((_ is Undefined!12402) lt!651931) (not ((_ is Found!12402) lt!651931)) (and (bvsge (index!52001 lt!651931) #b00000000000000000000000000000000) (bvslt (index!52001 lt!651931) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651931) ((_ is Found!12402) lt!651931) (not ((_ is MissingVacant!12402) lt!651931)) (not (= (index!52003 lt!651931) intermediateAfterIndex!19)) (and (bvsge (index!52003 lt!651931) #b00000000000000000000000000000000) (bvslt (index!52003 lt!651931) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651931) (ite ((_ is Found!12402) lt!651931) (= (select (arr!48162 lt!651845) (index!52001 lt!651931)) lt!651844) (and ((_ is MissingVacant!12402) lt!651931) (= (index!52003 lt!651931) intermediateAfterIndex!19) (= (select (arr!48162 lt!651845) (index!52003 lt!651931)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157335 (= lt!651931 e!837904)))

(declare-fun c!138748 () Bool)

(assert (=> d!157335 (= c!138748 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157335 (= lt!651932 (select (arr!48162 lt!651845) index!646))))

(assert (=> d!157335 (validMask!0 mask!2687)))

(assert (=> d!157335 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687) lt!651931)))

(declare-fun b!1495970 () Bool)

(assert (=> b!1495970 (= e!837904 Undefined!12402)))

(declare-fun b!1495971 () Bool)

(assert (=> b!1495971 (= e!837903 (Found!12402 index!646))))

(assert (= (and d!157335 c!138748) b!1495970))

(assert (= (and d!157335 (not c!138748)) b!1495968))

(assert (= (and b!1495968 c!138749) b!1495971))

(assert (= (and b!1495968 (not c!138749)) b!1495967))

(assert (= (and b!1495967 c!138750) b!1495969))

(assert (= (and b!1495967 (not c!138750)) b!1495966))

(assert (=> b!1495966 m!1379153))

(assert (=> b!1495966 m!1379153))

(declare-fun m!1379301 () Bool)

(assert (=> b!1495966 m!1379301))

(declare-fun m!1379303 () Bool)

(assert (=> d!157335 m!1379303))

(declare-fun m!1379305 () Bool)

(assert (=> d!157335 m!1379305))

(declare-fun m!1379307 () Bool)

(assert (=> d!157335 m!1379307))

(assert (=> d!157335 m!1379165))

(assert (=> b!1495740 d!157335))

(declare-fun lt!651937 () SeekEntryResult!12402)

(declare-fun e!837909 () SeekEntryResult!12402)

(declare-fun b!1495978 () Bool)

(assert (=> b!1495978 (= e!837909 (seekKeyOrZeroReturnVacant!0 (x!133618 lt!651937) (index!52002 lt!651937) (index!52002 lt!651937) lt!651844 lt!651845 mask!2687))))

(declare-fun b!1495979 () Bool)

(declare-fun e!837908 () SeekEntryResult!12402)

(assert (=> b!1495979 (= e!837908 Undefined!12402)))

(declare-fun b!1495980 () Bool)

(declare-fun e!837910 () SeekEntryResult!12402)

(assert (=> b!1495980 (= e!837910 (Found!12402 (index!52002 lt!651937)))))

(declare-fun b!1495981 () Bool)

(assert (=> b!1495981 (= e!837908 e!837910)))

(declare-fun lt!651935 () (_ BitVec 64))

(assert (=> b!1495981 (= lt!651935 (select (arr!48162 lt!651845) (index!52002 lt!651937)))))

(declare-fun c!138756 () Bool)

(assert (=> b!1495981 (= c!138756 (= lt!651935 lt!651844))))

(declare-fun b!1495982 () Bool)

(declare-fun c!138755 () Bool)

(assert (=> b!1495982 (= c!138755 (= lt!651935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495982 (= e!837910 e!837909)))

(declare-fun b!1495983 () Bool)

(assert (=> b!1495983 (= e!837909 (MissingZero!12402 (index!52002 lt!651937)))))

(declare-fun d!157339 () Bool)

(declare-fun lt!651936 () SeekEntryResult!12402)

(assert (=> d!157339 (and (or ((_ is Undefined!12402) lt!651936) (not ((_ is Found!12402) lt!651936)) (and (bvsge (index!52001 lt!651936) #b00000000000000000000000000000000) (bvslt (index!52001 lt!651936) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651936) ((_ is Found!12402) lt!651936) (not ((_ is MissingZero!12402) lt!651936)) (and (bvsge (index!52000 lt!651936) #b00000000000000000000000000000000) (bvslt (index!52000 lt!651936) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651936) ((_ is Found!12402) lt!651936) ((_ is MissingZero!12402) lt!651936) (not ((_ is MissingVacant!12402) lt!651936)) (and (bvsge (index!52003 lt!651936) #b00000000000000000000000000000000) (bvslt (index!52003 lt!651936) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651936) (ite ((_ is Found!12402) lt!651936) (= (select (arr!48162 lt!651845) (index!52001 lt!651936)) lt!651844) (ite ((_ is MissingZero!12402) lt!651936) (= (select (arr!48162 lt!651845) (index!52000 lt!651936)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12402) lt!651936) (= (select (arr!48162 lt!651845) (index!52003 lt!651936)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157339 (= lt!651936 e!837908)))

(declare-fun c!138754 () Bool)

(assert (=> d!157339 (= c!138754 (and ((_ is Intermediate!12402) lt!651937) (undefined!13214 lt!651937)))))

(assert (=> d!157339 (= lt!651937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651844 mask!2687) lt!651844 lt!651845 mask!2687))))

(assert (=> d!157339 (validMask!0 mask!2687)))

(assert (=> d!157339 (= (seekEntryOrOpen!0 lt!651844 lt!651845 mask!2687) lt!651936)))

(assert (= (and d!157339 c!138754) b!1495979))

(assert (= (and d!157339 (not c!138754)) b!1495981))

(assert (= (and b!1495981 c!138756) b!1495980))

(assert (= (and b!1495981 (not c!138756)) b!1495982))

(assert (= (and b!1495982 c!138755) b!1495983))

(assert (= (and b!1495982 (not c!138755)) b!1495978))

(declare-fun m!1379319 () Bool)

(assert (=> b!1495978 m!1379319))

(declare-fun m!1379321 () Bool)

(assert (=> b!1495981 m!1379321))

(declare-fun m!1379323 () Bool)

(assert (=> d!157339 m!1379323))

(declare-fun m!1379325 () Bool)

(assert (=> d!157339 m!1379325))

(declare-fun m!1379327 () Bool)

(assert (=> d!157339 m!1379327))

(assert (=> d!157339 m!1379133))

(assert (=> d!157339 m!1379165))

(assert (=> d!157339 m!1379133))

(assert (=> d!157339 m!1379135))

(assert (=> b!1495740 d!157339))

(declare-fun bm!68027 () Bool)

(declare-fun call!68030 () Bool)

(assert (=> bm!68027 (= call!68030 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495984 () Bool)

(declare-fun e!837912 () Bool)

(assert (=> b!1495984 (= e!837912 call!68030)))

(declare-fun b!1495985 () Bool)

(declare-fun e!837913 () Bool)

(assert (=> b!1495985 (= e!837913 call!68030)))

(declare-fun d!157343 () Bool)

(declare-fun res!1017538 () Bool)

(declare-fun e!837911 () Bool)

(assert (=> d!157343 (=> res!1017538 e!837911)))

(assert (=> d!157343 (= res!1017538 (bvsge #b00000000000000000000000000000000 (size!48712 a!2862)))))

(assert (=> d!157343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837911)))

(declare-fun b!1495986 () Bool)

(assert (=> b!1495986 (= e!837911 e!837912)))

(declare-fun c!138757 () Bool)

(assert (=> b!1495986 (= c!138757 (validKeyInArray!0 (select (arr!48162 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495987 () Bool)

(assert (=> b!1495987 (= e!837912 e!837913)))

(declare-fun lt!651938 () (_ BitVec 64))

(assert (=> b!1495987 (= lt!651938 (select (arr!48162 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651939 () Unit!50144)

(assert (=> b!1495987 (= lt!651939 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651938 #b00000000000000000000000000000000))))

(assert (=> b!1495987 (arrayContainsKey!0 a!2862 lt!651938 #b00000000000000000000000000000000)))

(declare-fun lt!651940 () Unit!50144)

(assert (=> b!1495987 (= lt!651940 lt!651939)))

(declare-fun res!1017537 () Bool)

(assert (=> b!1495987 (= res!1017537 (= (seekEntryOrOpen!0 (select (arr!48162 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12402 #b00000000000000000000000000000000)))))

(assert (=> b!1495987 (=> (not res!1017537) (not e!837913))))

(assert (= (and d!157343 (not res!1017538)) b!1495986))

(assert (= (and b!1495986 c!138757) b!1495987))

(assert (= (and b!1495986 (not c!138757)) b!1495984))

(assert (= (and b!1495987 res!1017537) b!1495985))

(assert (= (or b!1495985 b!1495984) bm!68027))

(declare-fun m!1379329 () Bool)

(assert (=> bm!68027 m!1379329))

(assert (=> b!1495986 m!1379227))

(assert (=> b!1495986 m!1379227))

(assert (=> b!1495986 m!1379229))

(assert (=> b!1495987 m!1379227))

(declare-fun m!1379331 () Bool)

(assert (=> b!1495987 m!1379331))

(declare-fun m!1379333 () Bool)

(assert (=> b!1495987 m!1379333))

(assert (=> b!1495987 m!1379227))

(declare-fun m!1379335 () Bool)

(assert (=> b!1495987 m!1379335))

(assert (=> b!1495742 d!157343))

(declare-fun b!1495988 () Bool)

(declare-fun e!837914 () SeekEntryResult!12402)

(assert (=> b!1495988 (= e!837914 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651848 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687))))

(declare-fun b!1495989 () Bool)

(declare-fun c!138760 () Bool)

(declare-fun lt!651942 () (_ BitVec 64))

(assert (=> b!1495989 (= c!138760 (= lt!651942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837915 () SeekEntryResult!12402)

(assert (=> b!1495989 (= e!837915 e!837914)))

(declare-fun b!1495990 () Bool)

(declare-fun e!837916 () SeekEntryResult!12402)

(assert (=> b!1495990 (= e!837916 e!837915)))

(declare-fun c!138759 () Bool)

(assert (=> b!1495990 (= c!138759 (= lt!651942 lt!651844))))

(declare-fun b!1495991 () Bool)

(assert (=> b!1495991 (= e!837914 (MissingVacant!12402 intermediateAfterIndex!19))))

(declare-fun d!157345 () Bool)

(declare-fun lt!651941 () SeekEntryResult!12402)

(assert (=> d!157345 (and (or ((_ is Undefined!12402) lt!651941) (not ((_ is Found!12402) lt!651941)) (and (bvsge (index!52001 lt!651941) #b00000000000000000000000000000000) (bvslt (index!52001 lt!651941) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651941) ((_ is Found!12402) lt!651941) (not ((_ is MissingVacant!12402) lt!651941)) (not (= (index!52003 lt!651941) intermediateAfterIndex!19)) (and (bvsge (index!52003 lt!651941) #b00000000000000000000000000000000) (bvslt (index!52003 lt!651941) (size!48712 lt!651845)))) (or ((_ is Undefined!12402) lt!651941) (ite ((_ is Found!12402) lt!651941) (= (select (arr!48162 lt!651845) (index!52001 lt!651941)) lt!651844) (and ((_ is MissingVacant!12402) lt!651941) (= (index!52003 lt!651941) intermediateAfterIndex!19) (= (select (arr!48162 lt!651845) (index!52003 lt!651941)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157345 (= lt!651941 e!837916)))

(declare-fun c!138758 () Bool)

(assert (=> d!157345 (= c!138758 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157345 (= lt!651942 (select (arr!48162 lt!651845) lt!651848))))

(assert (=> d!157345 (validMask!0 mask!2687)))

(assert (=> d!157345 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651848 intermediateAfterIndex!19 lt!651844 lt!651845 mask!2687) lt!651941)))

(declare-fun b!1495992 () Bool)

(assert (=> b!1495992 (= e!837916 Undefined!12402)))

(declare-fun b!1495993 () Bool)

(assert (=> b!1495993 (= e!837915 (Found!12402 lt!651848))))

(assert (= (and d!157345 c!138758) b!1495992))

(assert (= (and d!157345 (not c!138758)) b!1495990))

(assert (= (and b!1495990 c!138759) b!1495993))

(assert (= (and b!1495990 (not c!138759)) b!1495989))

(assert (= (and b!1495989 c!138760) b!1495991))

(assert (= (and b!1495989 (not c!138760)) b!1495988))

(assert (=> b!1495988 m!1379251))

(assert (=> b!1495988 m!1379251))

(declare-fun m!1379337 () Bool)

(assert (=> b!1495988 m!1379337))

(declare-fun m!1379339 () Bool)

(assert (=> d!157345 m!1379339))

(declare-fun m!1379341 () Bool)

(assert (=> d!157345 m!1379341))

(assert (=> d!157345 m!1379249))

(assert (=> d!157345 m!1379165))

(assert (=> b!1495733 d!157345))

(assert (=> b!1495733 d!157339))

(declare-fun d!157347 () Bool)

(assert (=> d!157347 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127272 d!157347))

(declare-fun d!157349 () Bool)

(assert (=> d!157349 (= (array_inv!37190 a!2862) (bvsge (size!48712 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127272 d!157349))

(declare-fun b!1495994 () Bool)

(declare-fun lt!651943 () SeekEntryResult!12402)

(assert (=> b!1495994 (and (bvsge (index!52002 lt!651943) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651943) (size!48712 lt!651845)))))

(declare-fun res!1017541 () Bool)

(assert (=> b!1495994 (= res!1017541 (= (select (arr!48162 lt!651845) (index!52002 lt!651943)) lt!651844))))

(declare-fun e!837918 () Bool)

(assert (=> b!1495994 (=> res!1017541 e!837918)))

(declare-fun e!837919 () Bool)

(assert (=> b!1495994 (= e!837919 e!837918)))

(declare-fun b!1495995 () Bool)

(declare-fun e!837921 () SeekEntryResult!12402)

(assert (=> b!1495995 (= e!837921 (Intermediate!12402 true index!646 x!665))))

(declare-fun b!1495996 () Bool)

(assert (=> b!1495996 (and (bvsge (index!52002 lt!651943) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651943) (size!48712 lt!651845)))))

(assert (=> b!1495996 (= e!837918 (= (select (arr!48162 lt!651845) (index!52002 lt!651943)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495997 () Bool)

(declare-fun e!837920 () Bool)

(assert (=> b!1495997 (= e!837920 (bvsge (x!133618 lt!651943) #b01111111111111111111111111111110))))

(declare-fun b!1495998 () Bool)

(declare-fun e!837917 () SeekEntryResult!12402)

(assert (=> b!1495998 (= e!837921 e!837917)))

(declare-fun c!138761 () Bool)

(declare-fun lt!651944 () (_ BitVec 64))

(assert (=> b!1495998 (= c!138761 (or (= lt!651944 lt!651844) (= (bvadd lt!651944 lt!651944) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!157351 () Bool)

(assert (=> d!157351 e!837920))

(declare-fun c!138762 () Bool)

(assert (=> d!157351 (= c!138762 (and ((_ is Intermediate!12402) lt!651943) (undefined!13214 lt!651943)))))

(assert (=> d!157351 (= lt!651943 e!837921)))

(declare-fun c!138763 () Bool)

(assert (=> d!157351 (= c!138763 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157351 (= lt!651944 (select (arr!48162 lt!651845) index!646))))

(assert (=> d!157351 (validMask!0 mask!2687)))

(assert (=> d!157351 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651844 lt!651845 mask!2687) lt!651943)))

(declare-fun b!1495999 () Bool)

(assert (=> b!1495999 (= e!837917 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651844 lt!651845 mask!2687))))

(declare-fun b!1496000 () Bool)

(assert (=> b!1496000 (= e!837917 (Intermediate!12402 false index!646 x!665))))

(declare-fun b!1496001 () Bool)

(assert (=> b!1496001 (= e!837920 e!837919)))

(declare-fun res!1017539 () Bool)

(assert (=> b!1496001 (= res!1017539 (and ((_ is Intermediate!12402) lt!651943) (not (undefined!13214 lt!651943)) (bvslt (x!133618 lt!651943) #b01111111111111111111111111111110) (bvsge (x!133618 lt!651943) #b00000000000000000000000000000000) (bvsge (x!133618 lt!651943) x!665)))))

(assert (=> b!1496001 (=> (not res!1017539) (not e!837919))))

(declare-fun b!1496002 () Bool)

(assert (=> b!1496002 (and (bvsge (index!52002 lt!651943) #b00000000000000000000000000000000) (bvslt (index!52002 lt!651943) (size!48712 lt!651845)))))

(declare-fun res!1017540 () Bool)

(assert (=> b!1496002 (= res!1017540 (= (select (arr!48162 lt!651845) (index!52002 lt!651943)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496002 (=> res!1017540 e!837918)))

(assert (= (and d!157351 c!138763) b!1495995))

(assert (= (and d!157351 (not c!138763)) b!1495998))

(assert (= (and b!1495998 c!138761) b!1496000))

(assert (= (and b!1495998 (not c!138761)) b!1495999))

(assert (= (and d!157351 c!138762) b!1495997))

(assert (= (and d!157351 (not c!138762)) b!1496001))

(assert (= (and b!1496001 res!1017539) b!1495994))

(assert (= (and b!1495994 (not res!1017541)) b!1496002))

(assert (= (and b!1496002 (not res!1017540)) b!1495996))

(declare-fun m!1379343 () Bool)

(assert (=> b!1495994 m!1379343))

(assert (=> b!1495996 m!1379343))

(assert (=> d!157351 m!1379307))

(assert (=> d!157351 m!1379165))

(assert (=> b!1495999 m!1379153))

(assert (=> b!1495999 m!1379153))

(declare-fun m!1379345 () Bool)

(assert (=> b!1495999 m!1379345))

(assert (=> b!1496002 m!1379343))

(assert (=> b!1495732 d!157351))

(check-sat (not b!1495892) (not bm!68023) (not d!157327) (not bm!68027) (not b!1495925) (not b!1495934) (not d!157345) (not b!1495978) (not d!157351) (not b!1495832) (not b!1495869) (not d!157325) (not d!157335) (not d!157311) (not d!157315) (not b!1495836) (not b!1495988) (not b!1495893) (not d!157331) (not bm!68020) (not b!1495987) (not b!1495966) (not d!157339) (not b!1495834) (not d!157321) (not b!1495986) (not b!1495878) (not b!1495906) (not b!1495999) (not b!1495860) (not d!157319) (not d!157307))
(check-sat)
