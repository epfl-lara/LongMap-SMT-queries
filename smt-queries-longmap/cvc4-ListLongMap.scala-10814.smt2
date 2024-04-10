; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126536 () Bool)

(assert start!126536)

(declare-fun b!1484674 () Bool)

(declare-fun e!832389 () Bool)

(assert (=> b!1484674 (= e!832389 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647843 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484674 (= lt!647843 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484675 () Bool)

(declare-fun res!1009433 () Bool)

(declare-fun e!832395 () Bool)

(assert (=> b!1484675 (=> (not res!1009433) (not e!832395))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484675 (= res!1009433 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484676 () Bool)

(declare-fun res!1009443 () Bool)

(declare-fun e!832392 () Bool)

(assert (=> b!1484676 (=> (not res!1009443) (not e!832392))))

(declare-datatypes ((array!99498 0))(
  ( (array!99499 (arr!48025 (Array (_ BitVec 32) (_ BitVec 64))) (size!48575 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99498)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12265 0))(
  ( (MissingZero!12265 (index!51452 (_ BitVec 32))) (Found!12265 (index!51453 (_ BitVec 32))) (Intermediate!12265 (undefined!13077 Bool) (index!51454 (_ BitVec 32)) (x!133029 (_ BitVec 32))) (Undefined!12265) (MissingVacant!12265 (index!51455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99498 (_ BitVec 32)) SeekEntryResult!12265)

(assert (=> b!1484676 (= res!1009443 (= (seekEntryOrOpen!0 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) (Found!12265 j!93)))))

(declare-fun b!1484677 () Bool)

(declare-fun e!832394 () Bool)

(declare-fun e!832390 () Bool)

(assert (=> b!1484677 (= e!832394 e!832390)))

(declare-fun res!1009447 () Bool)

(assert (=> b!1484677 (=> (not res!1009447) (not e!832390))))

(assert (=> b!1484677 (= res!1009447 (= (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647838 () array!99498)

(assert (=> b!1484677 (= lt!647838 (array!99499 (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48575 a!2862)))))

(declare-fun b!1484678 () Bool)

(declare-fun res!1009437 () Bool)

(assert (=> b!1484678 (=> (not res!1009437) (not e!832394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484678 (= res!1009437 (validKeyInArray!0 (select (arr!48025 a!2862) i!1006)))))

(declare-fun b!1484679 () Bool)

(declare-fun res!1009442 () Bool)

(assert (=> b!1484679 (=> (not res!1009442) (not e!832394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99498 (_ BitVec 32)) Bool)

(assert (=> b!1484679 (= res!1009442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484680 () Bool)

(declare-fun res!1009432 () Bool)

(assert (=> b!1484680 (=> (not res!1009432) (not e!832394))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484680 (= res!1009432 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48575 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48575 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48575 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484681 () Bool)

(declare-fun e!832388 () Bool)

(assert (=> b!1484681 (= e!832388 e!832395)))

(declare-fun res!1009441 () Bool)

(assert (=> b!1484681 (=> (not res!1009441) (not e!832395))))

(declare-fun lt!647842 () SeekEntryResult!12265)

(assert (=> b!1484681 (= res!1009441 (= lt!647842 (Intermediate!12265 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647839 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99498 (_ BitVec 32)) SeekEntryResult!12265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484681 (= lt!647842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647839 mask!2687) lt!647839 lt!647838 mask!2687))))

(assert (=> b!1484681 (= lt!647839 (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484682 () Bool)

(declare-fun res!1009438 () Bool)

(assert (=> b!1484682 (=> (not res!1009438) (not e!832392))))

(assert (=> b!1484682 (= res!1009438 (or (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) (select (arr!48025 a!2862) j!93))))))

(declare-fun b!1484683 () Bool)

(declare-fun res!1009446 () Bool)

(assert (=> b!1484683 (=> (not res!1009446) (not e!832394))))

(assert (=> b!1484683 (= res!1009446 (validKeyInArray!0 (select (arr!48025 a!2862) j!93)))))

(declare-fun b!1484684 () Bool)

(declare-fun res!1009436 () Bool)

(assert (=> b!1484684 (=> (not res!1009436) (not e!832394))))

(assert (=> b!1484684 (= res!1009436 (and (= (size!48575 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48575 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48575 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484686 () Bool)

(declare-fun e!832397 () Bool)

(declare-fun e!832393 () Bool)

(assert (=> b!1484686 (= e!832397 e!832393)))

(declare-fun res!1009431 () Bool)

(assert (=> b!1484686 (=> (not res!1009431) (not e!832393))))

(declare-fun lt!647841 () (_ BitVec 64))

(assert (=> b!1484686 (= res!1009431 (and (= index!646 intermediateAfterIndex!19) (= lt!647841 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484687 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99498 (_ BitVec 32)) SeekEntryResult!12265)

(assert (=> b!1484687 (= e!832393 (= (seekEntryOrOpen!0 lt!647839 lt!647838 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647839 lt!647838 mask!2687)))))

(declare-fun b!1484688 () Bool)

(assert (=> b!1484688 (= e!832390 e!832388)))

(declare-fun res!1009430 () Bool)

(assert (=> b!1484688 (=> (not res!1009430) (not e!832388))))

(declare-fun lt!647844 () SeekEntryResult!12265)

(assert (=> b!1484688 (= res!1009430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48025 a!2862) j!93) mask!2687) (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!647844))))

(assert (=> b!1484688 (= lt!647844 (Intermediate!12265 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484689 () Bool)

(declare-fun res!1009434 () Bool)

(assert (=> b!1484689 (=> (not res!1009434) (not e!832388))))

(assert (=> b!1484689 (= res!1009434 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!647844))))

(declare-fun b!1484690 () Bool)

(declare-fun res!1009435 () Bool)

(assert (=> b!1484690 (=> (not res!1009435) (not e!832394))))

(declare-datatypes ((List!34526 0))(
  ( (Nil!34523) (Cons!34522 (h!35896 (_ BitVec 64)) (t!49220 List!34526)) )
))
(declare-fun arrayNoDuplicates!0 (array!99498 (_ BitVec 32) List!34526) Bool)

(assert (=> b!1484690 (= res!1009435 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34523))))

(declare-fun b!1484691 () Bool)

(declare-fun res!1009445 () Bool)

(assert (=> b!1484691 (=> (not res!1009445) (not e!832395))))

(declare-fun e!832391 () Bool)

(assert (=> b!1484691 (= res!1009445 e!832391)))

(declare-fun c!137145 () Bool)

(assert (=> b!1484691 (= c!137145 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484692 () Bool)

(assert (=> b!1484692 (= e!832395 (not e!832389))))

(declare-fun res!1009440 () Bool)

(assert (=> b!1484692 (=> res!1009440 e!832389)))

(assert (=> b!1484692 (= res!1009440 (or (and (= (select (arr!48025 a!2862) index!646) (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48025 a!2862) index!646) (select (arr!48025 a!2862) j!93))) (= (select (arr!48025 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484692 e!832392))

(declare-fun res!1009429 () Bool)

(assert (=> b!1484692 (=> (not res!1009429) (not e!832392))))

(assert (=> b!1484692 (= res!1009429 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49870 0))(
  ( (Unit!49871) )
))
(declare-fun lt!647840 () Unit!49870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49870)

(assert (=> b!1484692 (= lt!647840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1009439 () Bool)

(assert (=> start!126536 (=> (not res!1009439) (not e!832394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126536 (= res!1009439 (validMask!0 mask!2687))))

(assert (=> start!126536 e!832394))

(assert (=> start!126536 true))

(declare-fun array_inv!37053 (array!99498) Bool)

(assert (=> start!126536 (array_inv!37053 a!2862)))

(declare-fun b!1484685 () Bool)

(assert (=> b!1484685 (= e!832392 e!832397)))

(declare-fun res!1009444 () Bool)

(assert (=> b!1484685 (=> res!1009444 e!832397)))

(assert (=> b!1484685 (= res!1009444 (or (and (= (select (arr!48025 a!2862) index!646) lt!647841) (= (select (arr!48025 a!2862) index!646) (select (arr!48025 a!2862) j!93))) (= (select (arr!48025 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484685 (= lt!647841 (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484693 () Bool)

(assert (=> b!1484693 (= e!832391 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647839 lt!647838 mask!2687) (seekEntryOrOpen!0 lt!647839 lt!647838 mask!2687)))))

(declare-fun b!1484694 () Bool)

(assert (=> b!1484694 (= e!832391 (= lt!647842 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647839 lt!647838 mask!2687)))))

(assert (= (and start!126536 res!1009439) b!1484684))

(assert (= (and b!1484684 res!1009436) b!1484678))

(assert (= (and b!1484678 res!1009437) b!1484683))

(assert (= (and b!1484683 res!1009446) b!1484679))

(assert (= (and b!1484679 res!1009442) b!1484690))

(assert (= (and b!1484690 res!1009435) b!1484680))

(assert (= (and b!1484680 res!1009432) b!1484677))

(assert (= (and b!1484677 res!1009447) b!1484688))

(assert (= (and b!1484688 res!1009430) b!1484689))

(assert (= (and b!1484689 res!1009434) b!1484681))

(assert (= (and b!1484681 res!1009441) b!1484691))

(assert (= (and b!1484691 c!137145) b!1484694))

(assert (= (and b!1484691 (not c!137145)) b!1484693))

(assert (= (and b!1484691 res!1009445) b!1484675))

(assert (= (and b!1484675 res!1009433) b!1484692))

(assert (= (and b!1484692 res!1009429) b!1484676))

(assert (= (and b!1484676 res!1009443) b!1484682))

(assert (= (and b!1484682 res!1009438) b!1484685))

(assert (= (and b!1484685 (not res!1009444)) b!1484686))

(assert (= (and b!1484686 res!1009431) b!1484687))

(assert (= (and b!1484692 (not res!1009440)) b!1484674))

(declare-fun m!1369941 () Bool)

(assert (=> b!1484688 m!1369941))

(assert (=> b!1484688 m!1369941))

(declare-fun m!1369943 () Bool)

(assert (=> b!1484688 m!1369943))

(assert (=> b!1484688 m!1369943))

(assert (=> b!1484688 m!1369941))

(declare-fun m!1369945 () Bool)

(assert (=> b!1484688 m!1369945))

(assert (=> b!1484676 m!1369941))

(assert (=> b!1484676 m!1369941))

(declare-fun m!1369947 () Bool)

(assert (=> b!1484676 m!1369947))

(assert (=> b!1484689 m!1369941))

(assert (=> b!1484689 m!1369941))

(declare-fun m!1369949 () Bool)

(assert (=> b!1484689 m!1369949))

(declare-fun m!1369951 () Bool)

(assert (=> b!1484685 m!1369951))

(assert (=> b!1484685 m!1369941))

(declare-fun m!1369953 () Bool)

(assert (=> b!1484685 m!1369953))

(declare-fun m!1369955 () Bool)

(assert (=> b!1484685 m!1369955))

(declare-fun m!1369957 () Bool)

(assert (=> b!1484692 m!1369957))

(assert (=> b!1484692 m!1369953))

(assert (=> b!1484692 m!1369955))

(assert (=> b!1484692 m!1369951))

(declare-fun m!1369959 () Bool)

(assert (=> b!1484692 m!1369959))

(assert (=> b!1484692 m!1369941))

(assert (=> b!1484683 m!1369941))

(assert (=> b!1484683 m!1369941))

(declare-fun m!1369961 () Bool)

(assert (=> b!1484683 m!1369961))

(declare-fun m!1369963 () Bool)

(assert (=> b!1484693 m!1369963))

(declare-fun m!1369965 () Bool)

(assert (=> b!1484693 m!1369965))

(declare-fun m!1369967 () Bool)

(assert (=> start!126536 m!1369967))

(declare-fun m!1369969 () Bool)

(assert (=> start!126536 m!1369969))

(declare-fun m!1369971 () Bool)

(assert (=> b!1484682 m!1369971))

(assert (=> b!1484682 m!1369941))

(declare-fun m!1369973 () Bool)

(assert (=> b!1484681 m!1369973))

(assert (=> b!1484681 m!1369973))

(declare-fun m!1369975 () Bool)

(assert (=> b!1484681 m!1369975))

(assert (=> b!1484681 m!1369953))

(declare-fun m!1369977 () Bool)

(assert (=> b!1484681 m!1369977))

(declare-fun m!1369979 () Bool)

(assert (=> b!1484690 m!1369979))

(assert (=> b!1484677 m!1369953))

(declare-fun m!1369981 () Bool)

(assert (=> b!1484677 m!1369981))

(declare-fun m!1369983 () Bool)

(assert (=> b!1484679 m!1369983))

(assert (=> b!1484687 m!1369965))

(assert (=> b!1484687 m!1369963))

(declare-fun m!1369985 () Bool)

(assert (=> b!1484674 m!1369985))

(declare-fun m!1369987 () Bool)

(assert (=> b!1484694 m!1369987))

(declare-fun m!1369989 () Bool)

(assert (=> b!1484678 m!1369989))

(assert (=> b!1484678 m!1369989))

(declare-fun m!1369991 () Bool)

(assert (=> b!1484678 m!1369991))

(push 1)

