; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125512 () Bool)

(assert start!125512)

(declare-fun b!1468426 () Bool)

(declare-fun res!996967 () Bool)

(declare-fun e!824577 () Bool)

(assert (=> b!1468426 (=> (not res!996967) (not e!824577))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98960 0))(
  ( (array!98961 (arr!47768 (Array (_ BitVec 32) (_ BitVec 64))) (size!48318 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98960)

(assert (=> b!1468426 (= res!996967 (and (= (size!48318 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48318 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48318 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468427 () Bool)

(declare-fun res!996966 () Bool)

(assert (=> b!1468427 (=> (not res!996966) (not e!824577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468427 (= res!996966 (validKeyInArray!0 (select (arr!47768 a!2862) i!1006)))))

(declare-fun b!1468428 () Bool)

(declare-fun res!996965 () Bool)

(assert (=> b!1468428 (=> (not res!996965) (not e!824577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98960 (_ BitVec 32)) Bool)

(assert (=> b!1468428 (= res!996965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468429 () Bool)

(declare-fun e!824578 () Bool)

(assert (=> b!1468429 (= e!824578 false)))

(declare-datatypes ((SeekEntryResult!12008 0))(
  ( (MissingZero!12008 (index!50424 (_ BitVec 32))) (Found!12008 (index!50425 (_ BitVec 32))) (Intermediate!12008 (undefined!12820 Bool) (index!50426 (_ BitVec 32)) (x!132017 (_ BitVec 32))) (Undefined!12008) (MissingVacant!12008 (index!50427 (_ BitVec 32))) )
))
(declare-fun lt!642287 () SeekEntryResult!12008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98960 (_ BitVec 32)) SeekEntryResult!12008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468429 (= lt!642287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47768 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47768 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98961 (store (arr!47768 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48318 a!2862)) mask!2687))))

(declare-fun b!1468430 () Bool)

(declare-fun res!996969 () Bool)

(assert (=> b!1468430 (=> (not res!996969) (not e!824577))))

(declare-datatypes ((List!34269 0))(
  ( (Nil!34266) (Cons!34265 (h!35615 (_ BitVec 64)) (t!48963 List!34269)) )
))
(declare-fun arrayNoDuplicates!0 (array!98960 (_ BitVec 32) List!34269) Bool)

(assert (=> b!1468430 (= res!996969 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34266))))

(declare-fun b!1468431 () Bool)

(assert (=> b!1468431 (= e!824577 e!824578)))

(declare-fun res!996968 () Bool)

(assert (=> b!1468431 (=> (not res!996968) (not e!824578))))

(declare-fun lt!642288 () SeekEntryResult!12008)

(assert (=> b!1468431 (= res!996968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47768 a!2862) j!93) mask!2687) (select (arr!47768 a!2862) j!93) a!2862 mask!2687) lt!642288))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468431 (= lt!642288 (Intermediate!12008 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468432 () Bool)

(declare-fun res!996972 () Bool)

(assert (=> b!1468432 (=> (not res!996972) (not e!824577))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468432 (= res!996972 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48318 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48318 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48318 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47768 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996970 () Bool)

(assert (=> start!125512 (=> (not res!996970) (not e!824577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125512 (= res!996970 (validMask!0 mask!2687))))

(assert (=> start!125512 e!824577))

(assert (=> start!125512 true))

(declare-fun array_inv!36796 (array!98960) Bool)

(assert (=> start!125512 (array_inv!36796 a!2862)))

(declare-fun b!1468433 () Bool)

(declare-fun res!996971 () Bool)

(assert (=> b!1468433 (=> (not res!996971) (not e!824578))))

(assert (=> b!1468433 (= res!996971 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47768 a!2862) j!93) a!2862 mask!2687) lt!642288))))

(declare-fun b!1468434 () Bool)

(declare-fun res!996973 () Bool)

(assert (=> b!1468434 (=> (not res!996973) (not e!824577))))

(assert (=> b!1468434 (= res!996973 (validKeyInArray!0 (select (arr!47768 a!2862) j!93)))))

(assert (= (and start!125512 res!996970) b!1468426))

(assert (= (and b!1468426 res!996967) b!1468427))

(assert (= (and b!1468427 res!996966) b!1468434))

(assert (= (and b!1468434 res!996973) b!1468428))

(assert (= (and b!1468428 res!996965) b!1468430))

(assert (= (and b!1468430 res!996969) b!1468432))

(assert (= (and b!1468432 res!996972) b!1468431))

(assert (= (and b!1468431 res!996968) b!1468433))

(assert (= (and b!1468433 res!996971) b!1468429))

(declare-fun m!1355485 () Bool)

(assert (=> b!1468434 m!1355485))

(assert (=> b!1468434 m!1355485))

(declare-fun m!1355487 () Bool)

(assert (=> b!1468434 m!1355487))

(declare-fun m!1355489 () Bool)

(assert (=> start!125512 m!1355489))

(declare-fun m!1355491 () Bool)

(assert (=> start!125512 m!1355491))

(declare-fun m!1355493 () Bool)

(assert (=> b!1468429 m!1355493))

(declare-fun m!1355495 () Bool)

(assert (=> b!1468429 m!1355495))

(assert (=> b!1468429 m!1355495))

(declare-fun m!1355497 () Bool)

(assert (=> b!1468429 m!1355497))

(assert (=> b!1468429 m!1355497))

(assert (=> b!1468429 m!1355495))

(declare-fun m!1355499 () Bool)

(assert (=> b!1468429 m!1355499))

(declare-fun m!1355501 () Bool)

(assert (=> b!1468428 m!1355501))

(assert (=> b!1468433 m!1355485))

(assert (=> b!1468433 m!1355485))

(declare-fun m!1355503 () Bool)

(assert (=> b!1468433 m!1355503))

(assert (=> b!1468432 m!1355493))

(declare-fun m!1355505 () Bool)

(assert (=> b!1468432 m!1355505))

(declare-fun m!1355507 () Bool)

(assert (=> b!1468427 m!1355507))

(assert (=> b!1468427 m!1355507))

(declare-fun m!1355509 () Bool)

(assert (=> b!1468427 m!1355509))

(declare-fun m!1355511 () Bool)

(assert (=> b!1468430 m!1355511))

(assert (=> b!1468431 m!1355485))

(assert (=> b!1468431 m!1355485))

(declare-fun m!1355513 () Bool)

(assert (=> b!1468431 m!1355513))

(assert (=> b!1468431 m!1355513))

(assert (=> b!1468431 m!1355485))

(declare-fun m!1355515 () Bool)

(assert (=> b!1468431 m!1355515))

(push 1)

