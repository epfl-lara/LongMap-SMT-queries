; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126520 () Bool)

(assert start!126520)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!832154 () Bool)

(declare-datatypes ((SeekEntryResult!12257 0))(
  ( (MissingZero!12257 (index!51420 (_ BitVec 32))) (Found!12257 (index!51421 (_ BitVec 32))) (Intermediate!12257 (undefined!13069 Bool) (index!51422 (_ BitVec 32)) (x!133005 (_ BitVec 32))) (Undefined!12257) (MissingVacant!12257 (index!51423 (_ BitVec 32))) )
))
(declare-fun lt!647671 () SeekEntryResult!12257)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!647673 () (_ BitVec 64))

(declare-fun b!1484170 () Bool)

(declare-datatypes ((array!99482 0))(
  ( (array!99483 (arr!48017 (Array (_ BitVec 32) (_ BitVec 64))) (size!48567 (_ BitVec 32))) )
))
(declare-fun lt!647675 () array!99482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99482 (_ BitVec 32)) SeekEntryResult!12257)

(assert (=> b!1484170 (= e!832154 (= lt!647671 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647673 lt!647675 mask!2687)))))

(declare-fun b!1484171 () Bool)

(declare-fun e!832151 () Bool)

(declare-fun e!832157 () Bool)

(assert (=> b!1484171 (= e!832151 e!832157)))

(declare-fun res!1008989 () Bool)

(assert (=> b!1484171 (=> (not res!1008989) (not e!832157))))

(declare-fun lt!647674 () SeekEntryResult!12257)

(declare-fun a!2862 () array!99482)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484171 (= res!1008989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48017 a!2862) j!93) mask!2687) (select (arr!48017 a!2862) j!93) a!2862 mask!2687) lt!647674))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484171 (= lt!647674 (Intermediate!12257 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484172 () Bool)

(declare-fun res!1008985 () Bool)

(declare-fun e!832153 () Bool)

(assert (=> b!1484172 (=> (not res!1008985) (not e!832153))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484172 (= res!1008985 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48567 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48567 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48567 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484173 () Bool)

(declare-fun e!832148 () Bool)

(declare-fun e!832152 () Bool)

(assert (=> b!1484173 (= e!832148 e!832152)))

(declare-fun res!1008988 () Bool)

(assert (=> b!1484173 (=> (not res!1008988) (not e!832152))))

(declare-fun lt!647672 () (_ BitVec 64))

(assert (=> b!1484173 (= res!1008988 (and (= index!646 intermediateAfterIndex!19) (= lt!647672 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484174 () Bool)

(declare-fun res!1008986 () Bool)

(assert (=> b!1484174 (=> (not res!1008986) (not e!832153))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484174 (= res!1008986 (and (= (size!48567 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48567 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48567 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484175 () Bool)

(declare-fun res!1008980 () Bool)

(declare-fun e!832156 () Bool)

(assert (=> b!1484175 (=> (not res!1008980) (not e!832156))))

(assert (=> b!1484175 (= res!1008980 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484176 () Bool)

(declare-fun res!1008981 () Bool)

(assert (=> b!1484176 (=> (not res!1008981) (not e!832157))))

(assert (=> b!1484176 (= res!1008981 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48017 a!2862) j!93) a!2862 mask!2687) lt!647674))))

(declare-fun b!1484177 () Bool)

(declare-fun res!1008990 () Bool)

(assert (=> b!1484177 (=> (not res!1008990) (not e!832153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484177 (= res!1008990 (validKeyInArray!0 (select (arr!48017 a!2862) j!93)))))

(declare-fun b!1484178 () Bool)

(declare-fun e!832150 () Bool)

(assert (=> b!1484178 (= e!832150 true)))

(declare-fun lt!647670 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484178 (= lt!647670 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484179 () Bool)

(declare-fun e!832149 () Bool)

(assert (=> b!1484179 (= e!832149 e!832148)))

(declare-fun res!1008984 () Bool)

(assert (=> b!1484179 (=> res!1008984 e!832148)))

(assert (=> b!1484179 (= res!1008984 (or (and (= (select (arr!48017 a!2862) index!646) lt!647672) (= (select (arr!48017 a!2862) index!646) (select (arr!48017 a!2862) j!93))) (= (select (arr!48017 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484179 (= lt!647672 (select (store (arr!48017 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484180 () Bool)

(declare-fun res!1008976 () Bool)

(assert (=> b!1484180 (=> (not res!1008976) (not e!832149))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99482 (_ BitVec 32)) SeekEntryResult!12257)

(assert (=> b!1484180 (= res!1008976 (= (seekEntryOrOpen!0 (select (arr!48017 a!2862) j!93) a!2862 mask!2687) (Found!12257 j!93)))))

(declare-fun b!1484181 () Bool)

(declare-fun res!1008975 () Bool)

(assert (=> b!1484181 (=> (not res!1008975) (not e!832156))))

(assert (=> b!1484181 (= res!1008975 e!832154)))

(declare-fun c!137121 () Bool)

(assert (=> b!1484181 (= c!137121 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1008977 () Bool)

(assert (=> start!126520 (=> (not res!1008977) (not e!832153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126520 (= res!1008977 (validMask!0 mask!2687))))

(assert (=> start!126520 e!832153))

(assert (=> start!126520 true))

(declare-fun array_inv!37045 (array!99482) Bool)

(assert (=> start!126520 (array_inv!37045 a!2862)))

(declare-fun b!1484182 () Bool)

(declare-fun res!1008983 () Bool)

(assert (=> b!1484182 (=> (not res!1008983) (not e!832153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99482 (_ BitVec 32)) Bool)

(assert (=> b!1484182 (= res!1008983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484183 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99482 (_ BitVec 32)) SeekEntryResult!12257)

(assert (=> b!1484183 (= e!832154 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647673 lt!647675 mask!2687) (seekEntryOrOpen!0 lt!647673 lt!647675 mask!2687)))))

(declare-fun b!1484184 () Bool)

(assert (=> b!1484184 (= e!832157 e!832156)))

(declare-fun res!1008978 () Bool)

(assert (=> b!1484184 (=> (not res!1008978) (not e!832156))))

(assert (=> b!1484184 (= res!1008978 (= lt!647671 (Intermediate!12257 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484184 (= lt!647671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647673 mask!2687) lt!647673 lt!647675 mask!2687))))

(assert (=> b!1484184 (= lt!647673 (select (store (arr!48017 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484185 () Bool)

(declare-fun res!1008979 () Bool)

(assert (=> b!1484185 (=> (not res!1008979) (not e!832149))))

(assert (=> b!1484185 (= res!1008979 (or (= (select (arr!48017 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48017 a!2862) intermediateBeforeIndex!19) (select (arr!48017 a!2862) j!93))))))

(declare-fun b!1484186 () Bool)

(declare-fun res!1008987 () Bool)

(assert (=> b!1484186 (=> (not res!1008987) (not e!832153))))

(assert (=> b!1484186 (= res!1008987 (validKeyInArray!0 (select (arr!48017 a!2862) i!1006)))))

(declare-fun b!1484187 () Bool)

(assert (=> b!1484187 (= e!832152 (= (seekEntryOrOpen!0 lt!647673 lt!647675 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647673 lt!647675 mask!2687)))))

(declare-fun b!1484188 () Bool)

(declare-fun res!1008991 () Bool)

(assert (=> b!1484188 (=> (not res!1008991) (not e!832153))))

(declare-datatypes ((List!34518 0))(
  ( (Nil!34515) (Cons!34514 (h!35888 (_ BitVec 64)) (t!49212 List!34518)) )
))
(declare-fun arrayNoDuplicates!0 (array!99482 (_ BitVec 32) List!34518) Bool)

(assert (=> b!1484188 (= res!1008991 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34515))))

(declare-fun b!1484189 () Bool)

(assert (=> b!1484189 (= e!832153 e!832151)))

(declare-fun res!1008973 () Bool)

(assert (=> b!1484189 (=> (not res!1008973) (not e!832151))))

(assert (=> b!1484189 (= res!1008973 (= (select (store (arr!48017 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484189 (= lt!647675 (array!99483 (store (arr!48017 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48567 a!2862)))))

(declare-fun b!1484190 () Bool)

(assert (=> b!1484190 (= e!832156 (not e!832150))))

(declare-fun res!1008982 () Bool)

(assert (=> b!1484190 (=> res!1008982 e!832150)))

(assert (=> b!1484190 (= res!1008982 (or (and (= (select (arr!48017 a!2862) index!646) (select (store (arr!48017 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48017 a!2862) index!646) (select (arr!48017 a!2862) j!93))) (= (select (arr!48017 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484190 e!832149))

(declare-fun res!1008974 () Bool)

(assert (=> b!1484190 (=> (not res!1008974) (not e!832149))))

(assert (=> b!1484190 (= res!1008974 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49854 0))(
  ( (Unit!49855) )
))
(declare-fun lt!647676 () Unit!49854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49854)

(assert (=> b!1484190 (= lt!647676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126520 res!1008977) b!1484174))

(assert (= (and b!1484174 res!1008986) b!1484186))

(assert (= (and b!1484186 res!1008987) b!1484177))

(assert (= (and b!1484177 res!1008990) b!1484182))

(assert (= (and b!1484182 res!1008983) b!1484188))

(assert (= (and b!1484188 res!1008991) b!1484172))

(assert (= (and b!1484172 res!1008985) b!1484189))

(assert (= (and b!1484189 res!1008973) b!1484171))

(assert (= (and b!1484171 res!1008989) b!1484176))

(assert (= (and b!1484176 res!1008981) b!1484184))

(assert (= (and b!1484184 res!1008978) b!1484181))

(assert (= (and b!1484181 c!137121) b!1484170))

(assert (= (and b!1484181 (not c!137121)) b!1484183))

(assert (= (and b!1484181 res!1008975) b!1484175))

(assert (= (and b!1484175 res!1008980) b!1484190))

(assert (= (and b!1484190 res!1008974) b!1484180))

(assert (= (and b!1484180 res!1008976) b!1484185))

(assert (= (and b!1484185 res!1008979) b!1484179))

(assert (= (and b!1484179 (not res!1008984)) b!1484173))

(assert (= (and b!1484173 res!1008988) b!1484187))

(assert (= (and b!1484190 (not res!1008982)) b!1484178))

(declare-fun m!1369525 () Bool)

(assert (=> b!1484183 m!1369525))

(declare-fun m!1369527 () Bool)

(assert (=> b!1484183 m!1369527))

(declare-fun m!1369529 () Bool)

(assert (=> b!1484189 m!1369529))

(declare-fun m!1369531 () Bool)

(assert (=> b!1484189 m!1369531))

(declare-fun m!1369533 () Bool)

(assert (=> b!1484178 m!1369533))

(declare-fun m!1369535 () Bool)

(assert (=> start!126520 m!1369535))

(declare-fun m!1369537 () Bool)

(assert (=> start!126520 m!1369537))

(declare-fun m!1369539 () Bool)

(assert (=> b!1484188 m!1369539))

(declare-fun m!1369541 () Bool)

(assert (=> b!1484171 m!1369541))

(assert (=> b!1484171 m!1369541))

(declare-fun m!1369543 () Bool)

(assert (=> b!1484171 m!1369543))

(assert (=> b!1484171 m!1369543))

(assert (=> b!1484171 m!1369541))

(declare-fun m!1369545 () Bool)

(assert (=> b!1484171 m!1369545))

(assert (=> b!1484177 m!1369541))

(assert (=> b!1484177 m!1369541))

(declare-fun m!1369547 () Bool)

(assert (=> b!1484177 m!1369547))

(declare-fun m!1369549 () Bool)

(assert (=> b!1484182 m!1369549))

(assert (=> b!1484180 m!1369541))

(assert (=> b!1484180 m!1369541))

(declare-fun m!1369551 () Bool)

(assert (=> b!1484180 m!1369551))

(declare-fun m!1369553 () Bool)

(assert (=> b!1484186 m!1369553))

(assert (=> b!1484186 m!1369553))

(declare-fun m!1369555 () Bool)

(assert (=> b!1484186 m!1369555))

(declare-fun m!1369557 () Bool)

(assert (=> b!1484185 m!1369557))

(assert (=> b!1484185 m!1369541))

(declare-fun m!1369559 () Bool)

(assert (=> b!1484184 m!1369559))

(assert (=> b!1484184 m!1369559))

(declare-fun m!1369561 () Bool)

(assert (=> b!1484184 m!1369561))

(assert (=> b!1484184 m!1369529))

(declare-fun m!1369563 () Bool)

(assert (=> b!1484184 m!1369563))

(declare-fun m!1369565 () Bool)

(assert (=> b!1484179 m!1369565))

(assert (=> b!1484179 m!1369541))

(assert (=> b!1484179 m!1369529))

(declare-fun m!1369567 () Bool)

(assert (=> b!1484179 m!1369567))

(declare-fun m!1369569 () Bool)

(assert (=> b!1484190 m!1369569))

(assert (=> b!1484190 m!1369529))

(assert (=> b!1484190 m!1369567))

(assert (=> b!1484190 m!1369565))

(declare-fun m!1369571 () Bool)

(assert (=> b!1484190 m!1369571))

(assert (=> b!1484190 m!1369541))

(assert (=> b!1484176 m!1369541))

(assert (=> b!1484176 m!1369541))

(declare-fun m!1369573 () Bool)

(assert (=> b!1484176 m!1369573))

(declare-fun m!1369575 () Bool)

(assert (=> b!1484170 m!1369575))

(assert (=> b!1484187 m!1369527))

(assert (=> b!1484187 m!1369525))

(push 1)

