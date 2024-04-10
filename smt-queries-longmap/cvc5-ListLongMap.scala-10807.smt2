; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126490 () Bool)

(assert start!126490)

(declare-fun b!1483225 () Bool)

(declare-fun e!831702 () Bool)

(declare-fun e!831706 () Bool)

(assert (=> b!1483225 (= e!831702 e!831706)))

(declare-fun res!1008118 () Bool)

(assert (=> b!1483225 (=> (not res!1008118) (not e!831706))))

(declare-fun lt!647361 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483225 (= res!1008118 (and (= index!646 intermediateAfterIndex!19) (= lt!647361 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483226 () Bool)

(declare-fun res!1008124 () Bool)

(declare-fun e!831700 () Bool)

(assert (=> b!1483226 (=> (not res!1008124) (not e!831700))))

(declare-datatypes ((array!99452 0))(
  ( (array!99453 (arr!48002 (Array (_ BitVec 32) (_ BitVec 64))) (size!48552 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99452)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483226 (= res!1008124 (validKeyInArray!0 (select (arr!48002 a!2862) j!93)))))

(declare-fun b!1483227 () Bool)

(declare-fun res!1008125 () Bool)

(assert (=> b!1483227 (=> (not res!1008125) (not e!831700))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483227 (= res!1008125 (and (= (size!48552 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48552 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48552 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483228 () Bool)

(declare-fun e!831699 () Bool)

(assert (=> b!1483228 (= e!831699 e!831702)))

(declare-fun res!1008120 () Bool)

(assert (=> b!1483228 (=> res!1008120 e!831702)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483228 (= res!1008120 (or (and (= (select (arr!48002 a!2862) index!646) lt!647361) (= (select (arr!48002 a!2862) index!646) (select (arr!48002 a!2862) j!93))) (= (select (arr!48002 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483228 (= lt!647361 (select (store (arr!48002 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483230 () Bool)

(declare-fun e!831703 () Bool)

(assert (=> b!1483230 (= e!831703 true)))

(declare-fun lt!647355 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483230 (= lt!647355 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483231 () Bool)

(declare-fun res!1008136 () Bool)

(declare-fun e!831707 () Bool)

(assert (=> b!1483231 (=> (not res!1008136) (not e!831707))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483231 (= res!1008136 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483232 () Bool)

(declare-fun lt!647356 () array!99452)

(declare-fun lt!647358 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12242 0))(
  ( (MissingZero!12242 (index!51360 (_ BitVec 32))) (Found!12242 (index!51361 (_ BitVec 32))) (Intermediate!12242 (undefined!13054 Bool) (index!51362 (_ BitVec 32)) (x!132950 (_ BitVec 32))) (Undefined!12242) (MissingVacant!12242 (index!51363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99452 (_ BitVec 32)) SeekEntryResult!12242)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99452 (_ BitVec 32)) SeekEntryResult!12242)

(assert (=> b!1483232 (= e!831706 (= (seekEntryOrOpen!0 lt!647358 lt!647356 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647358 lt!647356 mask!2687)))))

(declare-fun b!1483233 () Bool)

(declare-fun e!831698 () Bool)

(assert (=> b!1483233 (= e!831700 e!831698)))

(declare-fun res!1008119 () Bool)

(assert (=> b!1483233 (=> (not res!1008119) (not e!831698))))

(assert (=> b!1483233 (= res!1008119 (= (select (store (arr!48002 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483233 (= lt!647356 (array!99453 (store (arr!48002 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48552 a!2862)))))

(declare-fun b!1483234 () Bool)

(declare-fun e!831705 () Bool)

(assert (=> b!1483234 (= e!831698 e!831705)))

(declare-fun res!1008132 () Bool)

(assert (=> b!1483234 (=> (not res!1008132) (not e!831705))))

(declare-fun lt!647359 () SeekEntryResult!12242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99452 (_ BitVec 32)) SeekEntryResult!12242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483234 (= res!1008132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48002 a!2862) j!93) mask!2687) (select (arr!48002 a!2862) j!93) a!2862 mask!2687) lt!647359))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483234 (= lt!647359 (Intermediate!12242 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483235 () Bool)

(declare-fun res!1008135 () Bool)

(assert (=> b!1483235 (=> (not res!1008135) (not e!831699))))

(assert (=> b!1483235 (= res!1008135 (or (= (select (arr!48002 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48002 a!2862) intermediateBeforeIndex!19) (select (arr!48002 a!2862) j!93))))))

(declare-fun b!1483236 () Bool)

(declare-fun res!1008130 () Bool)

(assert (=> b!1483236 (=> (not res!1008130) (not e!831700))))

(assert (=> b!1483236 (= res!1008130 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48552 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48552 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48552 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483237 () Bool)

(assert (=> b!1483237 (= e!831707 (not e!831703))))

(declare-fun res!1008121 () Bool)

(assert (=> b!1483237 (=> res!1008121 e!831703)))

(assert (=> b!1483237 (= res!1008121 (or (and (= (select (arr!48002 a!2862) index!646) (select (store (arr!48002 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48002 a!2862) index!646) (select (arr!48002 a!2862) j!93))) (= (select (arr!48002 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483237 e!831699))

(declare-fun res!1008133 () Bool)

(assert (=> b!1483237 (=> (not res!1008133) (not e!831699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99452 (_ BitVec 32)) Bool)

(assert (=> b!1483237 (= res!1008133 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49824 0))(
  ( (Unit!49825) )
))
(declare-fun lt!647360 () Unit!49824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49824)

(assert (=> b!1483237 (= lt!647360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483238 () Bool)

(assert (=> b!1483238 (= e!831705 e!831707)))

(declare-fun res!1008127 () Bool)

(assert (=> b!1483238 (=> (not res!1008127) (not e!831707))))

(declare-fun lt!647357 () SeekEntryResult!12242)

(assert (=> b!1483238 (= res!1008127 (= lt!647357 (Intermediate!12242 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483238 (= lt!647357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647358 mask!2687) lt!647358 lt!647356 mask!2687))))

(assert (=> b!1483238 (= lt!647358 (select (store (arr!48002 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483239 () Bool)

(declare-fun res!1008128 () Bool)

(assert (=> b!1483239 (=> (not res!1008128) (not e!831705))))

(assert (=> b!1483239 (= res!1008128 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48002 a!2862) j!93) a!2862 mask!2687) lt!647359))))

(declare-fun b!1483240 () Bool)

(declare-fun res!1008131 () Bool)

(assert (=> b!1483240 (=> (not res!1008131) (not e!831700))))

(assert (=> b!1483240 (= res!1008131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483241 () Bool)

(declare-fun res!1008126 () Bool)

(assert (=> b!1483241 (=> (not res!1008126) (not e!831699))))

(assert (=> b!1483241 (= res!1008126 (= (seekEntryOrOpen!0 (select (arr!48002 a!2862) j!93) a!2862 mask!2687) (Found!12242 j!93)))))

(declare-fun b!1483242 () Bool)

(declare-fun e!831704 () Bool)

(assert (=> b!1483242 (= e!831704 (= lt!647357 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647358 lt!647356 mask!2687)))))

(declare-fun b!1483243 () Bool)

(declare-fun res!1008123 () Bool)

(assert (=> b!1483243 (=> (not res!1008123) (not e!831700))))

(declare-datatypes ((List!34503 0))(
  ( (Nil!34500) (Cons!34499 (h!35873 (_ BitVec 64)) (t!49197 List!34503)) )
))
(declare-fun arrayNoDuplicates!0 (array!99452 (_ BitVec 32) List!34503) Bool)

(assert (=> b!1483243 (= res!1008123 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34500))))

(declare-fun b!1483229 () Bool)

(declare-fun res!1008122 () Bool)

(assert (=> b!1483229 (=> (not res!1008122) (not e!831707))))

(assert (=> b!1483229 (= res!1008122 e!831704)))

(declare-fun c!137076 () Bool)

(assert (=> b!1483229 (= c!137076 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1008134 () Bool)

(assert (=> start!126490 (=> (not res!1008134) (not e!831700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126490 (= res!1008134 (validMask!0 mask!2687))))

(assert (=> start!126490 e!831700))

(assert (=> start!126490 true))

(declare-fun array_inv!37030 (array!99452) Bool)

(assert (=> start!126490 (array_inv!37030 a!2862)))

(declare-fun b!1483244 () Bool)

(declare-fun res!1008129 () Bool)

(assert (=> b!1483244 (=> (not res!1008129) (not e!831700))))

(assert (=> b!1483244 (= res!1008129 (validKeyInArray!0 (select (arr!48002 a!2862) i!1006)))))

(declare-fun b!1483245 () Bool)

(assert (=> b!1483245 (= e!831704 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647358 lt!647356 mask!2687) (seekEntryOrOpen!0 lt!647358 lt!647356 mask!2687)))))

(assert (= (and start!126490 res!1008134) b!1483227))

(assert (= (and b!1483227 res!1008125) b!1483244))

(assert (= (and b!1483244 res!1008129) b!1483226))

(assert (= (and b!1483226 res!1008124) b!1483240))

(assert (= (and b!1483240 res!1008131) b!1483243))

(assert (= (and b!1483243 res!1008123) b!1483236))

(assert (= (and b!1483236 res!1008130) b!1483233))

(assert (= (and b!1483233 res!1008119) b!1483234))

(assert (= (and b!1483234 res!1008132) b!1483239))

(assert (= (and b!1483239 res!1008128) b!1483238))

(assert (= (and b!1483238 res!1008127) b!1483229))

(assert (= (and b!1483229 c!137076) b!1483242))

(assert (= (and b!1483229 (not c!137076)) b!1483245))

(assert (= (and b!1483229 res!1008122) b!1483231))

(assert (= (and b!1483231 res!1008136) b!1483237))

(assert (= (and b!1483237 res!1008133) b!1483241))

(assert (= (and b!1483241 res!1008126) b!1483235))

(assert (= (and b!1483235 res!1008135) b!1483228))

(assert (= (and b!1483228 (not res!1008120)) b!1483225))

(assert (= (and b!1483225 res!1008118) b!1483232))

(assert (= (and b!1483237 (not res!1008121)) b!1483230))

(declare-fun m!1368745 () Bool)

(assert (=> b!1483232 m!1368745))

(declare-fun m!1368747 () Bool)

(assert (=> b!1483232 m!1368747))

(declare-fun m!1368749 () Bool)

(assert (=> b!1483244 m!1368749))

(assert (=> b!1483244 m!1368749))

(declare-fun m!1368751 () Bool)

(assert (=> b!1483244 m!1368751))

(assert (=> b!1483245 m!1368747))

(assert (=> b!1483245 m!1368745))

(declare-fun m!1368753 () Bool)

(assert (=> start!126490 m!1368753))

(declare-fun m!1368755 () Bool)

(assert (=> start!126490 m!1368755))

(declare-fun m!1368757 () Bool)

(assert (=> b!1483240 m!1368757))

(declare-fun m!1368759 () Bool)

(assert (=> b!1483243 m!1368759))

(declare-fun m!1368761 () Bool)

(assert (=> b!1483228 m!1368761))

(declare-fun m!1368763 () Bool)

(assert (=> b!1483228 m!1368763))

(declare-fun m!1368765 () Bool)

(assert (=> b!1483228 m!1368765))

(declare-fun m!1368767 () Bool)

(assert (=> b!1483228 m!1368767))

(assert (=> b!1483239 m!1368763))

(assert (=> b!1483239 m!1368763))

(declare-fun m!1368769 () Bool)

(assert (=> b!1483239 m!1368769))

(assert (=> b!1483226 m!1368763))

(assert (=> b!1483226 m!1368763))

(declare-fun m!1368771 () Bool)

(assert (=> b!1483226 m!1368771))

(declare-fun m!1368773 () Bool)

(assert (=> b!1483230 m!1368773))

(declare-fun m!1368775 () Bool)

(assert (=> b!1483242 m!1368775))

(declare-fun m!1368777 () Bool)

(assert (=> b!1483237 m!1368777))

(assert (=> b!1483237 m!1368765))

(assert (=> b!1483237 m!1368767))

(assert (=> b!1483237 m!1368761))

(declare-fun m!1368779 () Bool)

(assert (=> b!1483237 m!1368779))

(assert (=> b!1483237 m!1368763))

(assert (=> b!1483233 m!1368765))

(declare-fun m!1368781 () Bool)

(assert (=> b!1483233 m!1368781))

(declare-fun m!1368783 () Bool)

(assert (=> b!1483235 m!1368783))

(assert (=> b!1483235 m!1368763))

(declare-fun m!1368785 () Bool)

(assert (=> b!1483238 m!1368785))

(assert (=> b!1483238 m!1368785))

(declare-fun m!1368787 () Bool)

(assert (=> b!1483238 m!1368787))

(assert (=> b!1483238 m!1368765))

(declare-fun m!1368789 () Bool)

(assert (=> b!1483238 m!1368789))

(assert (=> b!1483241 m!1368763))

(assert (=> b!1483241 m!1368763))

(declare-fun m!1368791 () Bool)

(assert (=> b!1483241 m!1368791))

(assert (=> b!1483234 m!1368763))

(assert (=> b!1483234 m!1368763))

(declare-fun m!1368793 () Bool)

(assert (=> b!1483234 m!1368793))

(assert (=> b!1483234 m!1368793))

(assert (=> b!1483234 m!1368763))

(declare-fun m!1368795 () Bool)

(assert (=> b!1483234 m!1368795))

(push 1)

