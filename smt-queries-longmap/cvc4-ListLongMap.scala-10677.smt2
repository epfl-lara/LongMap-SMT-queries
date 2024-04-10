; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125204 () Bool)

(assert start!125204)

(declare-fun b!1460345 () Bool)

(declare-fun e!821138 () Bool)

(declare-fun e!821135 () Bool)

(assert (=> b!1460345 (= e!821138 e!821135)))

(declare-fun res!990130 () Bool)

(assert (=> b!1460345 (=> (not res!990130) (not e!821135))))

(declare-datatypes ((SeekEntryResult!11866 0))(
  ( (MissingZero!11866 (index!49856 (_ BitVec 32))) (Found!11866 (index!49857 (_ BitVec 32))) (Intermediate!11866 (undefined!12678 Bool) (index!49858 (_ BitVec 32)) (x!131459 (_ BitVec 32))) (Undefined!11866) (MissingVacant!11866 (index!49859 (_ BitVec 32))) )
))
(declare-fun lt!639798 () SeekEntryResult!11866)

(declare-datatypes ((array!98652 0))(
  ( (array!98653 (arr!47614 (Array (_ BitVec 32) (_ BitVec 64))) (size!48164 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98652)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98652 (_ BitVec 32)) SeekEntryResult!11866)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460345 (= res!990130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47614 a!2862) j!93) mask!2687) (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!639798))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460345 (= lt!639798 (Intermediate!11866 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460347 () Bool)

(declare-fun res!990138 () Bool)

(declare-fun e!821136 () Bool)

(assert (=> b!1460347 (=> (not res!990138) (not e!821136))))

(declare-datatypes ((List!34115 0))(
  ( (Nil!34112) (Cons!34111 (h!35461 (_ BitVec 64)) (t!48809 List!34115)) )
))
(declare-fun arrayNoDuplicates!0 (array!98652 (_ BitVec 32) List!34115) Bool)

(assert (=> b!1460347 (= res!990138 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34112))))

(declare-fun b!1460348 () Bool)

(declare-fun res!990140 () Bool)

(declare-fun e!821137 () Bool)

(assert (=> b!1460348 (=> (not res!990140) (not e!821137))))

(declare-fun e!821141 () Bool)

(assert (=> b!1460348 (= res!990140 e!821141)))

(declare-fun c!134619 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460348 (= c!134619 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460349 () Bool)

(declare-fun res!990129 () Bool)

(assert (=> b!1460349 (=> (not res!990129) (not e!821136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460349 (= res!990129 (validKeyInArray!0 (select (arr!47614 a!2862) j!93)))))

(declare-fun b!1460350 () Bool)

(declare-fun res!990133 () Bool)

(assert (=> b!1460350 (=> (not res!990133) (not e!821137))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460350 (= res!990133 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460351 () Bool)

(declare-fun lt!639796 () (_ BitVec 64))

(declare-fun lt!639797 () SeekEntryResult!11866)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639794 () array!98652)

(assert (=> b!1460351 (= e!821141 (= lt!639797 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639796 lt!639794 mask!2687)))))

(declare-fun b!1460352 () Bool)

(declare-fun res!990128 () Bool)

(assert (=> b!1460352 (=> (not res!990128) (not e!821135))))

(assert (=> b!1460352 (= res!990128 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!639798))))

(declare-fun b!1460353 () Bool)

(declare-fun res!990139 () Bool)

(declare-fun e!821140 () Bool)

(assert (=> b!1460353 (=> (not res!990139) (not e!821140))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98652 (_ BitVec 32)) SeekEntryResult!11866)

(assert (=> b!1460353 (= res!990139 (= (seekEntryOrOpen!0 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) (Found!11866 j!93)))))

(declare-fun b!1460354 () Bool)

(assert (=> b!1460354 (= e!821135 e!821137)))

(declare-fun res!990141 () Bool)

(assert (=> b!1460354 (=> (not res!990141) (not e!821137))))

(assert (=> b!1460354 (= res!990141 (= lt!639797 (Intermediate!11866 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460354 (= lt!639797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639796 mask!2687) lt!639796 lt!639794 mask!2687))))

(assert (=> b!1460354 (= lt!639796 (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460355 () Bool)

(declare-fun res!990136 () Bool)

(assert (=> b!1460355 (=> (not res!990136) (not e!821136))))

(assert (=> b!1460355 (= res!990136 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48164 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48164 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48164 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460356 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98652 (_ BitVec 32)) SeekEntryResult!11866)

(assert (=> b!1460356 (= e!821141 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639796 lt!639794 mask!2687) (seekEntryOrOpen!0 lt!639796 lt!639794 mask!2687)))))

(declare-fun b!1460357 () Bool)

(assert (=> b!1460357 (= e!821136 e!821138)))

(declare-fun res!990137 () Bool)

(assert (=> b!1460357 (=> (not res!990137) (not e!821138))))

(assert (=> b!1460357 (= res!990137 (= (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460357 (= lt!639794 (array!98653 (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48164 a!2862)))))

(declare-fun res!990135 () Bool)

(assert (=> start!125204 (=> (not res!990135) (not e!821136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125204 (= res!990135 (validMask!0 mask!2687))))

(assert (=> start!125204 e!821136))

(assert (=> start!125204 true))

(declare-fun array_inv!36642 (array!98652) Bool)

(assert (=> start!125204 (array_inv!36642 a!2862)))

(declare-fun b!1460346 () Bool)

(assert (=> b!1460346 (= e!821140 (or (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) (select (arr!47614 a!2862) j!93))))))

(declare-fun b!1460358 () Bool)

(assert (=> b!1460358 (= e!821137 (not true))))

(assert (=> b!1460358 e!821140))

(declare-fun res!990142 () Bool)

(assert (=> b!1460358 (=> (not res!990142) (not e!821140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98652 (_ BitVec 32)) Bool)

(assert (=> b!1460358 (= res!990142 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49228 0))(
  ( (Unit!49229) )
))
(declare-fun lt!639795 () Unit!49228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49228)

(assert (=> b!1460358 (= lt!639795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460359 () Bool)

(declare-fun res!990132 () Bool)

(assert (=> b!1460359 (=> (not res!990132) (not e!821136))))

(assert (=> b!1460359 (= res!990132 (and (= (size!48164 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48164 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48164 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460360 () Bool)

(declare-fun res!990134 () Bool)

(assert (=> b!1460360 (=> (not res!990134) (not e!821136))))

(assert (=> b!1460360 (= res!990134 (validKeyInArray!0 (select (arr!47614 a!2862) i!1006)))))

(declare-fun b!1460361 () Bool)

(declare-fun res!990131 () Bool)

(assert (=> b!1460361 (=> (not res!990131) (not e!821136))))

(assert (=> b!1460361 (= res!990131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125204 res!990135) b!1460359))

(assert (= (and b!1460359 res!990132) b!1460360))

(assert (= (and b!1460360 res!990134) b!1460349))

(assert (= (and b!1460349 res!990129) b!1460361))

(assert (= (and b!1460361 res!990131) b!1460347))

(assert (= (and b!1460347 res!990138) b!1460355))

(assert (= (and b!1460355 res!990136) b!1460357))

(assert (= (and b!1460357 res!990137) b!1460345))

(assert (= (and b!1460345 res!990130) b!1460352))

(assert (= (and b!1460352 res!990128) b!1460354))

(assert (= (and b!1460354 res!990141) b!1460348))

(assert (= (and b!1460348 c!134619) b!1460351))

(assert (= (and b!1460348 (not c!134619)) b!1460356))

(assert (= (and b!1460348 res!990140) b!1460350))

(assert (= (and b!1460350 res!990133) b!1460358))

(assert (= (and b!1460358 res!990142) b!1460353))

(assert (= (and b!1460353 res!990139) b!1460346))

(declare-fun m!1348029 () Bool)

(assert (=> b!1460352 m!1348029))

(assert (=> b!1460352 m!1348029))

(declare-fun m!1348031 () Bool)

(assert (=> b!1460352 m!1348031))

(declare-fun m!1348033 () Bool)

(assert (=> b!1460346 m!1348033))

(assert (=> b!1460346 m!1348029))

(declare-fun m!1348035 () Bool)

(assert (=> b!1460358 m!1348035))

(declare-fun m!1348037 () Bool)

(assert (=> b!1460358 m!1348037))

(declare-fun m!1348039 () Bool)

(assert (=> b!1460351 m!1348039))

(assert (=> b!1460349 m!1348029))

(assert (=> b!1460349 m!1348029))

(declare-fun m!1348041 () Bool)

(assert (=> b!1460349 m!1348041))

(declare-fun m!1348043 () Bool)

(assert (=> b!1460356 m!1348043))

(declare-fun m!1348045 () Bool)

(assert (=> b!1460356 m!1348045))

(declare-fun m!1348047 () Bool)

(assert (=> b!1460361 m!1348047))

(assert (=> b!1460345 m!1348029))

(assert (=> b!1460345 m!1348029))

(declare-fun m!1348049 () Bool)

(assert (=> b!1460345 m!1348049))

(assert (=> b!1460345 m!1348049))

(assert (=> b!1460345 m!1348029))

(declare-fun m!1348051 () Bool)

(assert (=> b!1460345 m!1348051))

(declare-fun m!1348053 () Bool)

(assert (=> b!1460347 m!1348053))

(assert (=> b!1460353 m!1348029))

(assert (=> b!1460353 m!1348029))

(declare-fun m!1348055 () Bool)

(assert (=> b!1460353 m!1348055))

(declare-fun m!1348057 () Bool)

(assert (=> b!1460357 m!1348057))

(declare-fun m!1348059 () Bool)

(assert (=> b!1460357 m!1348059))

(declare-fun m!1348061 () Bool)

(assert (=> b!1460354 m!1348061))

(assert (=> b!1460354 m!1348061))

(declare-fun m!1348063 () Bool)

(assert (=> b!1460354 m!1348063))

(assert (=> b!1460354 m!1348057))

(declare-fun m!1348065 () Bool)

(assert (=> b!1460354 m!1348065))

(declare-fun m!1348067 () Bool)

(assert (=> start!125204 m!1348067))

(declare-fun m!1348069 () Bool)

(assert (=> start!125204 m!1348069))

(declare-fun m!1348071 () Bool)

(assert (=> b!1460360 m!1348071))

(assert (=> b!1460360 m!1348071))

(declare-fun m!1348073 () Bool)

(assert (=> b!1460360 m!1348073))

(push 1)

