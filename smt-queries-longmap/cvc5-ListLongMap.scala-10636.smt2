; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124954 () Bool)

(assert start!124954)

(declare-fun b!1452360 () Bool)

(declare-fun e!817604 () Bool)

(assert (=> b!1452360 (= e!817604 (not true))))

(declare-fun e!817603 () Bool)

(assert (=> b!1452360 e!817603))

(declare-fun res!983492 () Bool)

(assert (=> b!1452360 (=> (not res!983492) (not e!817603))))

(declare-datatypes ((array!98402 0))(
  ( (array!98403 (arr!47489 (Array (_ BitVec 32) (_ BitVec 64))) (size!48039 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98402)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98402 (_ BitVec 32)) Bool)

(assert (=> b!1452360 (= res!983492 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48978 0))(
  ( (Unit!48979) )
))
(declare-fun lt!636921 () Unit!48978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48978)

(assert (=> b!1452360 (= lt!636921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452361 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636923 () array!98402)

(declare-fun lt!636920 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!817602 () Bool)

(declare-datatypes ((SeekEntryResult!11741 0))(
  ( (MissingZero!11741 (index!49356 (_ BitVec 32))) (Found!11741 (index!49357 (_ BitVec 32))) (Intermediate!11741 (undefined!12553 Bool) (index!49358 (_ BitVec 32)) (x!131006 (_ BitVec 32))) (Undefined!11741) (MissingVacant!11741 (index!49359 (_ BitVec 32))) )
))
(declare-fun lt!636924 () SeekEntryResult!11741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98402 (_ BitVec 32)) SeekEntryResult!11741)

(assert (=> b!1452361 (= e!817602 (= lt!636924 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636920 lt!636923 mask!2687)))))

(declare-fun b!1452362 () Bool)

(declare-fun e!817606 () Bool)

(declare-fun e!817607 () Bool)

(assert (=> b!1452362 (= e!817606 e!817607)))

(declare-fun res!983497 () Bool)

(assert (=> b!1452362 (=> (not res!983497) (not e!817607))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452362 (= res!983497 (= (select (store (arr!47489 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452362 (= lt!636923 (array!98403 (store (arr!47489 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48039 a!2862)))))

(declare-fun b!1452363 () Bool)

(declare-fun res!983491 () Bool)

(declare-fun e!817605 () Bool)

(assert (=> b!1452363 (=> (not res!983491) (not e!817605))))

(declare-fun lt!636922 () SeekEntryResult!11741)

(assert (=> b!1452363 (= res!983491 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47489 a!2862) j!93) a!2862 mask!2687) lt!636922))))

(declare-fun b!1452364 () Bool)

(declare-fun res!983496 () Bool)

(assert (=> b!1452364 (=> (not res!983496) (not e!817606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452364 (= res!983496 (validKeyInArray!0 (select (arr!47489 a!2862) j!93)))))

(declare-fun b!1452365 () Bool)

(assert (=> b!1452365 (= e!817605 e!817604)))

(declare-fun res!983489 () Bool)

(assert (=> b!1452365 (=> (not res!983489) (not e!817604))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452365 (= res!983489 (= lt!636924 (Intermediate!11741 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452365 (= lt!636924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636920 mask!2687) lt!636920 lt!636923 mask!2687))))

(assert (=> b!1452365 (= lt!636920 (select (store (arr!47489 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452366 () Bool)

(declare-fun res!983493 () Bool)

(assert (=> b!1452366 (=> (not res!983493) (not e!817606))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452366 (= res!983493 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48039 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48039 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48039 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452367 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98402 (_ BitVec 32)) SeekEntryResult!11741)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98402 (_ BitVec 32)) SeekEntryResult!11741)

(assert (=> b!1452367 (= e!817602 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636920 lt!636923 mask!2687) (seekEntryOrOpen!0 lt!636920 lt!636923 mask!2687)))))

(declare-fun res!983498 () Bool)

(assert (=> start!124954 (=> (not res!983498) (not e!817606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124954 (= res!983498 (validMask!0 mask!2687))))

(assert (=> start!124954 e!817606))

(assert (=> start!124954 true))

(declare-fun array_inv!36517 (array!98402) Bool)

(assert (=> start!124954 (array_inv!36517 a!2862)))

(declare-fun b!1452359 () Bool)

(declare-fun res!983486 () Bool)

(assert (=> b!1452359 (=> (not res!983486) (not e!817606))))

(assert (=> b!1452359 (= res!983486 (validKeyInArray!0 (select (arr!47489 a!2862) i!1006)))))

(declare-fun b!1452368 () Bool)

(declare-fun res!983487 () Bool)

(assert (=> b!1452368 (=> (not res!983487) (not e!817606))))

(declare-datatypes ((List!33990 0))(
  ( (Nil!33987) (Cons!33986 (h!35336 (_ BitVec 64)) (t!48684 List!33990)) )
))
(declare-fun arrayNoDuplicates!0 (array!98402 (_ BitVec 32) List!33990) Bool)

(assert (=> b!1452368 (= res!983487 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33987))))

(declare-fun b!1452369 () Bool)

(declare-fun res!983495 () Bool)

(assert (=> b!1452369 (=> (not res!983495) (not e!817604))))

(assert (=> b!1452369 (= res!983495 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452370 () Bool)

(declare-fun res!983499 () Bool)

(assert (=> b!1452370 (=> (not res!983499) (not e!817606))))

(assert (=> b!1452370 (= res!983499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452371 () Bool)

(declare-fun res!983488 () Bool)

(assert (=> b!1452371 (=> (not res!983488) (not e!817603))))

(assert (=> b!1452371 (= res!983488 (= (seekEntryOrOpen!0 (select (arr!47489 a!2862) j!93) a!2862 mask!2687) (Found!11741 j!93)))))

(declare-fun b!1452372 () Bool)

(declare-fun res!983490 () Bool)

(assert (=> b!1452372 (=> (not res!983490) (not e!817604))))

(assert (=> b!1452372 (= res!983490 e!817602)))

(declare-fun c!133947 () Bool)

(assert (=> b!1452372 (= c!133947 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452373 () Bool)

(declare-fun res!983500 () Bool)

(assert (=> b!1452373 (=> (not res!983500) (not e!817606))))

(assert (=> b!1452373 (= res!983500 (and (= (size!48039 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48039 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48039 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452374 () Bool)

(assert (=> b!1452374 (= e!817603 (and (or (= (select (arr!47489 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47489 a!2862) intermediateBeforeIndex!19) (select (arr!47489 a!2862) j!93))) (or (and (= (select (arr!47489 a!2862) index!646) (select (store (arr!47489 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47489 a!2862) index!646) (select (arr!47489 a!2862) j!93))) (= (select (arr!47489 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47489 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452375 () Bool)

(assert (=> b!1452375 (= e!817607 e!817605)))

(declare-fun res!983494 () Bool)

(assert (=> b!1452375 (=> (not res!983494) (not e!817605))))

(assert (=> b!1452375 (= res!983494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47489 a!2862) j!93) mask!2687) (select (arr!47489 a!2862) j!93) a!2862 mask!2687) lt!636922))))

(assert (=> b!1452375 (= lt!636922 (Intermediate!11741 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124954 res!983498) b!1452373))

(assert (= (and b!1452373 res!983500) b!1452359))

(assert (= (and b!1452359 res!983486) b!1452364))

(assert (= (and b!1452364 res!983496) b!1452370))

(assert (= (and b!1452370 res!983499) b!1452368))

(assert (= (and b!1452368 res!983487) b!1452366))

(assert (= (and b!1452366 res!983493) b!1452362))

(assert (= (and b!1452362 res!983497) b!1452375))

(assert (= (and b!1452375 res!983494) b!1452363))

(assert (= (and b!1452363 res!983491) b!1452365))

(assert (= (and b!1452365 res!983489) b!1452372))

(assert (= (and b!1452372 c!133947) b!1452361))

(assert (= (and b!1452372 (not c!133947)) b!1452367))

(assert (= (and b!1452372 res!983490) b!1452369))

(assert (= (and b!1452369 res!983495) b!1452360))

(assert (= (and b!1452360 res!983492) b!1452371))

(assert (= (and b!1452371 res!983488) b!1452374))

(declare-fun m!1340935 () Bool)

(assert (=> b!1452360 m!1340935))

(declare-fun m!1340937 () Bool)

(assert (=> b!1452360 m!1340937))

(declare-fun m!1340939 () Bool)

(assert (=> b!1452361 m!1340939))

(declare-fun m!1340941 () Bool)

(assert (=> b!1452370 m!1340941))

(declare-fun m!1340943 () Bool)

(assert (=> b!1452365 m!1340943))

(assert (=> b!1452365 m!1340943))

(declare-fun m!1340945 () Bool)

(assert (=> b!1452365 m!1340945))

(declare-fun m!1340947 () Bool)

(assert (=> b!1452365 m!1340947))

(declare-fun m!1340949 () Bool)

(assert (=> b!1452365 m!1340949))

(declare-fun m!1340951 () Bool)

(assert (=> b!1452367 m!1340951))

(declare-fun m!1340953 () Bool)

(assert (=> b!1452367 m!1340953))

(assert (=> b!1452374 m!1340947))

(declare-fun m!1340955 () Bool)

(assert (=> b!1452374 m!1340955))

(declare-fun m!1340957 () Bool)

(assert (=> b!1452374 m!1340957))

(declare-fun m!1340959 () Bool)

(assert (=> b!1452374 m!1340959))

(declare-fun m!1340961 () Bool)

(assert (=> b!1452374 m!1340961))

(declare-fun m!1340963 () Bool)

(assert (=> start!124954 m!1340963))

(declare-fun m!1340965 () Bool)

(assert (=> start!124954 m!1340965))

(declare-fun m!1340967 () Bool)

(assert (=> b!1452368 m!1340967))

(assert (=> b!1452364 m!1340961))

(assert (=> b!1452364 m!1340961))

(declare-fun m!1340969 () Bool)

(assert (=> b!1452364 m!1340969))

(assert (=> b!1452362 m!1340947))

(declare-fun m!1340971 () Bool)

(assert (=> b!1452362 m!1340971))

(declare-fun m!1340973 () Bool)

(assert (=> b!1452359 m!1340973))

(assert (=> b!1452359 m!1340973))

(declare-fun m!1340975 () Bool)

(assert (=> b!1452359 m!1340975))

(assert (=> b!1452363 m!1340961))

(assert (=> b!1452363 m!1340961))

(declare-fun m!1340977 () Bool)

(assert (=> b!1452363 m!1340977))

(assert (=> b!1452371 m!1340961))

(assert (=> b!1452371 m!1340961))

(declare-fun m!1340979 () Bool)

(assert (=> b!1452371 m!1340979))

(assert (=> b!1452375 m!1340961))

(assert (=> b!1452375 m!1340961))

(declare-fun m!1340981 () Bool)

(assert (=> b!1452375 m!1340981))

(assert (=> b!1452375 m!1340981))

(assert (=> b!1452375 m!1340961))

(declare-fun m!1340983 () Bool)

(assert (=> b!1452375 m!1340983))

(push 1)

