; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127108 () Bool)

(assert start!127108)

(declare-datatypes ((SeekEntryResult!12386 0))(
  ( (MissingZero!12386 (index!51936 (_ BitVec 32))) (Found!12386 (index!51937 (_ BitVec 32))) (Intermediate!12386 (undefined!13198 Bool) (index!51938 (_ BitVec 32)) (x!133538 (_ BitVec 32))) (Undefined!12386) (MissingVacant!12386 (index!51939 (_ BitVec 32))) )
))
(declare-fun lt!651191 () SeekEntryResult!12386)

(declare-fun b!1493926 () Bool)

(declare-datatypes ((array!99755 0))(
  ( (array!99756 (arr!48146 (Array (_ BitVec 32) (_ BitVec 64))) (size!48696 (_ BitVec 32))) )
))
(declare-fun lt!651190 () array!99755)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!651189 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!836845 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99755 (_ BitVec 32)) SeekEntryResult!12386)

(assert (=> b!1493926 (= e!836845 (= lt!651191 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651189 lt!651190 mask!2687)))))

(declare-fun b!1493927 () Bool)

(declare-fun res!1016365 () Bool)

(declare-fun e!836842 () Bool)

(assert (=> b!1493927 (=> (not res!1016365) (not e!836842))))

(declare-fun a!2862 () array!99755)

(declare-datatypes ((List!34647 0))(
  ( (Nil!34644) (Cons!34643 (h!36032 (_ BitVec 64)) (t!49341 List!34647)) )
))
(declare-fun arrayNoDuplicates!0 (array!99755 (_ BitVec 32) List!34647) Bool)

(assert (=> b!1493927 (= res!1016365 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34644))))

(declare-fun b!1493928 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99755 (_ BitVec 32)) SeekEntryResult!12386)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99755 (_ BitVec 32)) SeekEntryResult!12386)

(assert (=> b!1493928 (= e!836845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651189 lt!651190 mask!2687) (seekEntryOrOpen!0 lt!651189 lt!651190 mask!2687)))))

(declare-fun b!1493929 () Bool)

(declare-fun res!1016367 () Bool)

(assert (=> b!1493929 (=> (not res!1016367) (not e!836842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99755 (_ BitVec 32)) Bool)

(assert (=> b!1493929 (= res!1016367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493930 () Bool)

(declare-fun e!836843 () Bool)

(declare-fun e!836847 () Bool)

(assert (=> b!1493930 (= e!836843 (not e!836847))))

(declare-fun res!1016371 () Bool)

(assert (=> b!1493930 (=> res!1016371 e!836847)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493930 (= res!1016371 (or (and (= (select (arr!48146 a!2862) index!646) (select (store (arr!48146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48146 a!2862) index!646) (select (arr!48146 a!2862) j!93))) (= (select (arr!48146 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836849 () Bool)

(assert (=> b!1493930 e!836849))

(declare-fun res!1016369 () Bool)

(assert (=> b!1493930 (=> (not res!1016369) (not e!836849))))

(assert (=> b!1493930 (= res!1016369 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50112 0))(
  ( (Unit!50113) )
))
(declare-fun lt!651188 () Unit!50112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50112)

(assert (=> b!1493930 (= lt!651188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1016356 () Bool)

(assert (=> start!127108 (=> (not res!1016356) (not e!836842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127108 (= res!1016356 (validMask!0 mask!2687))))

(assert (=> start!127108 e!836842))

(assert (=> start!127108 true))

(declare-fun array_inv!37174 (array!99755) Bool)

(assert (=> start!127108 (array_inv!37174 a!2862)))

(declare-fun b!1493931 () Bool)

(declare-fun res!1016368 () Bool)

(assert (=> b!1493931 (=> (not res!1016368) (not e!836843))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493931 (= res!1016368 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493932 () Bool)

(declare-fun res!1016360 () Bool)

(assert (=> b!1493932 (=> (not res!1016360) (not e!836842))))

(assert (=> b!1493932 (= res!1016360 (and (= (size!48696 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48696 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48696 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493933 () Bool)

(declare-fun e!836846 () Bool)

(declare-fun e!836844 () Bool)

(assert (=> b!1493933 (= e!836846 e!836844)))

(declare-fun res!1016358 () Bool)

(assert (=> b!1493933 (=> (not res!1016358) (not e!836844))))

(declare-fun lt!651187 () SeekEntryResult!12386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493933 (= res!1016358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48146 a!2862) j!93) mask!2687) (select (arr!48146 a!2862) j!93) a!2862 mask!2687) lt!651187))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1493933 (= lt!651187 (Intermediate!12386 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493934 () Bool)

(declare-fun res!1016370 () Bool)

(assert (=> b!1493934 (=> (not res!1016370) (not e!836844))))

(assert (=> b!1493934 (= res!1016370 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48146 a!2862) j!93) a!2862 mask!2687) lt!651187))))

(declare-fun b!1493935 () Bool)

(assert (=> b!1493935 (= e!836849 (or (= (select (arr!48146 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48146 a!2862) intermediateBeforeIndex!19) (select (arr!48146 a!2862) j!93))))))

(declare-fun b!1493936 () Bool)

(declare-fun res!1016357 () Bool)

(assert (=> b!1493936 (=> (not res!1016357) (not e!836849))))

(assert (=> b!1493936 (= res!1016357 (= (seekEntryOrOpen!0 (select (arr!48146 a!2862) j!93) a!2862 mask!2687) (Found!12386 j!93)))))

(declare-fun b!1493937 () Bool)

(assert (=> b!1493937 (= e!836842 e!836846)))

(declare-fun res!1016359 () Bool)

(assert (=> b!1493937 (=> (not res!1016359) (not e!836846))))

(assert (=> b!1493937 (= res!1016359 (= (select (store (arr!48146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493937 (= lt!651190 (array!99756 (store (arr!48146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48696 a!2862)))))

(declare-fun b!1493938 () Bool)

(assert (=> b!1493938 (= e!836847 true)))

(declare-fun lt!651192 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493938 (= lt!651192 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493939 () Bool)

(assert (=> b!1493939 (= e!836844 e!836843)))

(declare-fun res!1016362 () Bool)

(assert (=> b!1493939 (=> (not res!1016362) (not e!836843))))

(assert (=> b!1493939 (= res!1016362 (= lt!651191 (Intermediate!12386 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493939 (= lt!651191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651189 mask!2687) lt!651189 lt!651190 mask!2687))))

(assert (=> b!1493939 (= lt!651189 (select (store (arr!48146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493940 () Bool)

(declare-fun res!1016363 () Bool)

(assert (=> b!1493940 (=> (not res!1016363) (not e!836842))))

(assert (=> b!1493940 (= res!1016363 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48696 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48696 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48696 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493941 () Bool)

(declare-fun res!1016364 () Bool)

(assert (=> b!1493941 (=> (not res!1016364) (not e!836843))))

(assert (=> b!1493941 (= res!1016364 e!836845)))

(declare-fun c!138315 () Bool)

(assert (=> b!1493941 (= c!138315 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493942 () Bool)

(declare-fun res!1016361 () Bool)

(assert (=> b!1493942 (=> (not res!1016361) (not e!836842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493942 (= res!1016361 (validKeyInArray!0 (select (arr!48146 a!2862) j!93)))))

(declare-fun b!1493943 () Bool)

(declare-fun res!1016366 () Bool)

(assert (=> b!1493943 (=> (not res!1016366) (not e!836842))))

(assert (=> b!1493943 (= res!1016366 (validKeyInArray!0 (select (arr!48146 a!2862) i!1006)))))

(assert (= (and start!127108 res!1016356) b!1493932))

(assert (= (and b!1493932 res!1016360) b!1493943))

(assert (= (and b!1493943 res!1016366) b!1493942))

(assert (= (and b!1493942 res!1016361) b!1493929))

(assert (= (and b!1493929 res!1016367) b!1493927))

(assert (= (and b!1493927 res!1016365) b!1493940))

(assert (= (and b!1493940 res!1016363) b!1493937))

(assert (= (and b!1493937 res!1016359) b!1493933))

(assert (= (and b!1493933 res!1016358) b!1493934))

(assert (= (and b!1493934 res!1016370) b!1493939))

(assert (= (and b!1493939 res!1016362) b!1493941))

(assert (= (and b!1493941 c!138315) b!1493926))

(assert (= (and b!1493941 (not c!138315)) b!1493928))

(assert (= (and b!1493941 res!1016364) b!1493931))

(assert (= (and b!1493931 res!1016368) b!1493930))

(assert (= (and b!1493930 res!1016369) b!1493936))

(assert (= (and b!1493936 res!1016357) b!1493935))

(assert (= (and b!1493930 (not res!1016371)) b!1493938))

(declare-fun m!1377691 () Bool)

(assert (=> b!1493928 m!1377691))

(declare-fun m!1377693 () Bool)

(assert (=> b!1493928 m!1377693))

(declare-fun m!1377695 () Bool)

(assert (=> b!1493935 m!1377695))

(declare-fun m!1377697 () Bool)

(assert (=> b!1493935 m!1377697))

(declare-fun m!1377699 () Bool)

(assert (=> b!1493938 m!1377699))

(declare-fun m!1377701 () Bool)

(assert (=> start!127108 m!1377701))

(declare-fun m!1377703 () Bool)

(assert (=> start!127108 m!1377703))

(assert (=> b!1493933 m!1377697))

(assert (=> b!1493933 m!1377697))

(declare-fun m!1377705 () Bool)

(assert (=> b!1493933 m!1377705))

(assert (=> b!1493933 m!1377705))

(assert (=> b!1493933 m!1377697))

(declare-fun m!1377707 () Bool)

(assert (=> b!1493933 m!1377707))

(declare-fun m!1377709 () Bool)

(assert (=> b!1493927 m!1377709))

(assert (=> b!1493936 m!1377697))

(assert (=> b!1493936 m!1377697))

(declare-fun m!1377711 () Bool)

(assert (=> b!1493936 m!1377711))

(declare-fun m!1377713 () Bool)

(assert (=> b!1493926 m!1377713))

(declare-fun m!1377715 () Bool)

(assert (=> b!1493943 m!1377715))

(assert (=> b!1493943 m!1377715))

(declare-fun m!1377717 () Bool)

(assert (=> b!1493943 m!1377717))

(assert (=> b!1493942 m!1377697))

(assert (=> b!1493942 m!1377697))

(declare-fun m!1377719 () Bool)

(assert (=> b!1493942 m!1377719))

(declare-fun m!1377721 () Bool)

(assert (=> b!1493930 m!1377721))

(declare-fun m!1377723 () Bool)

(assert (=> b!1493930 m!1377723))

(declare-fun m!1377725 () Bool)

(assert (=> b!1493930 m!1377725))

(declare-fun m!1377727 () Bool)

(assert (=> b!1493930 m!1377727))

(declare-fun m!1377729 () Bool)

(assert (=> b!1493930 m!1377729))

(assert (=> b!1493930 m!1377697))

(assert (=> b!1493937 m!1377723))

(declare-fun m!1377731 () Bool)

(assert (=> b!1493937 m!1377731))

(declare-fun m!1377733 () Bool)

(assert (=> b!1493929 m!1377733))

(declare-fun m!1377735 () Bool)

(assert (=> b!1493939 m!1377735))

(assert (=> b!1493939 m!1377735))

(declare-fun m!1377737 () Bool)

(assert (=> b!1493939 m!1377737))

(assert (=> b!1493939 m!1377723))

(declare-fun m!1377739 () Bool)

(assert (=> b!1493939 m!1377739))

(assert (=> b!1493934 m!1377697))

(assert (=> b!1493934 m!1377697))

(declare-fun m!1377741 () Bool)

(assert (=> b!1493934 m!1377741))

(push 1)

